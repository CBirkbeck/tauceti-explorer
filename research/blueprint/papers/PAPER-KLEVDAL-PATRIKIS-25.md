# Klevdal–Patrikis: compatible adjoint local systems

Worker: Codex — codex-c83e7a. Issue #1207. **Partial continuation**, 23 September 2026, preserving the extraction by codex-a71f92 in [PR #1996](https://github.com/CBirkbeck/tauceti-explorer/pull/1996).

This continuation writes the two proof repairs previously left as proposals: ramified-uniformizer norm valuations, and rational isogeny separation of the special tori. It retains every inherited item ID and status, all ten routes, all ten source findings and all ten gap IDs. The extraction now has **150 items: 14 library, 20 planned and 116 missing**, with 271 acyclic dependency edges and 35 written proof outlines. The 21 definitions and 25 constructions have canonical `api` and `tests` lists, each with at least three entries; the earlier planning field names remain synchronized. No Lean file was created or compiled.

The original group-theoretic, integrality, companion, tame-specialization and special-point-integrality references still require extraction. The repairs remain subject to independent mathematical review. Passing the artifact checks does not make this a complete paper job.

## Reading and provenance

The complete published article by Christian Klevdal and Stefan Patrikis, *Compatibility of canonical ℓ-adic local systems on adjoint Shimura varieties*, Inventiones mathematicae 242 (2025), 305–335, was freshly downloaded and read in full, including every proof, footnote and bibliography entry. [Published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01357-6.pdf): 31 pages, 1,462,931 bytes, SHA-256 `0691a57a2aae841419ee97b8fac68aa8f3d499ed884933422a388106febab576`, identical to the preceding checkpoint. Images of printed pp326,328,329 were checked for the cocycle and valuation formulas.

The article is [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). The extraction and repairs are attributed adaptations, not an author-approved revision. The JSON retains the preceding worker’s precise supplementary reading ranges and hashes: selected arXiv v2 passages, the entire deleted v1 §2 pp7–11, Getz–Hahn’s 22 April 2022 draft Appendix A.5 pp482–483, and its three-page July 2026 errata. Those supplementary readings were **not repeated** in this continuation. The published 2024 Getz–Hahn appendix remains uncollated.

Fresh checks of the [arXiv version history](https://arxiv.org/abs/2303.03863), [Patrikis papers page](https://people.math.osu.edu/patrikis.1/papers.html) and title/DOI correction searches found no relevant correction. ArXiv lists v2, 6 October 2024, as its latest version. The author page distinguishes the adjoint theorem from the full-G follow-up; neither the full-G nor p-adic follow-up is used as an input here.

## The theorem, with its boundaries

Let (G,X) be a Shimura datum with G connected reductive over Q, Z_G(Q) discrete in Z_G(A_f), and neat level K₀. Every Q-simple factor of G^ad must have total real rank at least two; restrictions of scalars can still have compact real factors. Theorem3.10 produces a soft smooth integral model after excluding one integer Ntilde such that, for every good closed point and all ℓ,ℓ' different from its residue characteristic, the adjoint canonical local systems have a common semisimple Frobenius class in Conj_G^ad(Q).

This is a rational point of a conjugation quotient. It is not a rational group representative, rational conjugacy, compatibility in full G, a crystalline companion, or a motivicity theorem. Corollary3.12 restricts to number-field points; its integer N(y) may depend on the point. The common Ntilde of Theorem3.10 is uniform across components, closed points and coefficient primes.

The abstract superrigidity theorem has an additional common-field hypothesis F(λ)=F. Remark2.4 expects more but does not prove that hypothesis automatically. Canonical Shimura models supply the common field in the application.

## Proof architecture

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

## Written repair: ramified norm valuations

Items138–147 separate the existing field norm, absolute-value uniqueness, discrete compactness, finite-extension normalization, local point topology, pointwise torus norm, compact-character lemma, pairing formula and positivity step. This separation prevents a field-norm declaration from being cited as a complete torus-valued reciprocity theorem.

Let F=Q_p, let L/F be finite inside Fbar, and let π be **any uniformizer of L**. Fix v_p(p)=1 on Fbar. Let T/F be a torus and μ:G_m,L→T_L an L-defined cocharacter. The pointwise commutative norm is

\[
N^T_{L/F}(\mu(\pi))=\prod_{\sigma:L\hookrightarrow\overline F}(\sigma\mu)(\sigma\pi).
\]

An extension of σ to Fbar acts independently of that extension on the L-defined point. Galois permutes the embeddings, so the product is F-rational. This construction agrees with the splitting-product description of the Weil-restriction norm. It is functorial in T, has the tower law, and on G_m agrees with the pinned scalar field norm.

For a geometric character χ, the evaluation pairing gives

\[
v_p\!\left(\chi(N^T_{L/F}\mu(\pi))\right)
=\sum_\sigma\langle\chi,\sigma\mu\rangle v_p(\sigma\pi)
=\frac1{e(L/F)}\sum_\sigma\langle\chi,\sigma\mu\rangle.
\]

The second equality uses uniqueness of the extended valuation and its ramification normalization. It does not require L/F Galois or unramified. Embeddings are counted with multiplicity even if their conjugate cocharacters coincide. This is a **valuation identity**: the actual norm point is not being equated with `(Σσ σμ)(p)`. In L=Q_3(π), π²=3, the norm of π is −3, whereas the latter expression for μ=id is 9. Their valuations are 1 and 2. More generally for π^e=p the norm has valuation 1, including wild cases p|e.

Next let C⊂T(F) be any compact subgroup. A geometric character is defined over some finite splitting field E/F. The composite C→T(E)→E×→Z, using the normalized additive valuation of E, is a continuous homomorphism to a discrete torsion-free group. Its image is compact, hence finite, hence zero. Rescaling gives v_pχ(C)=0. No integral model, hyperspecial position, maximal bounded subgroup or equality with integral points is used.

For Eq.(7), the group C=T(F)∩a_pK_pa_p⁻¹ is compact because T(F) is closed and a_pK_pa_p⁻¹ is compact. Thus

\[
v_p\chi(q)=v_p\chi(N^T_{L/F}\mu(\pi)).
\]

Now suppose T⊂B⊂G is an F-rational torus/Borel pair and μ is dominant. Galois permutes the simple roots, so every σμ remains in the closed dominant chamber. On an adjoint semisimple factor where μ_i is nonzero, roots span the rational character space, and some simple root α pairs positively with μ_i. The fixed embedding contributes this positive value to Σσ⟨α,σμ_i⟩; every other summand is nonnegative. Division by e>0 preserves positivity. A Q-simple factor may split further over Q_p; apply this statement to its whole semisimple base change. The A₂ example (2,−1,−1), with simple-root pairings (3,0), confirms that regular dominance is unnecessary.

Consequently v_pα(q_i)>0, and q_i cannot be torsion. Rational group points inject after field extension, so q_i remains infinite order over Q_ℓ; inversion and conjugation preserve order. Eq.(6), a_ℓ⁻¹q⁻¹a_ℓ=k_{0,ℓ}(Frob_w), proves the required infinite-order conclusion for every ℓ≠p.

The reflex cocharacter is defined over E(x)⊂E(s), so the formula applies to L=E(s)_w. The special section already extends integrally by the soft-model theorem and separated descent, and its ℓ-adic representation is unramified at w∤Nℓ. That statement about the representation does not assert that the number-field extension at w is unramified. Assumption2.7 requires an integral section and compatible unramified representations; it imposes no unramifiedness hypothesis on C_y/F. Hence this replacement supplies exactly the input to Proposition2.8 and Theorem3.10.

This repairs the **needed inference**, conditional on the explicitly retained foundational inputs. It leaves the paper’s separate intermediate assertion that E(s)_w/Q_p is unramified unproved. The integral-position theorem item092 and the published Getz–Hahn collation remain independent open work. They are not silently declared correct or removed from the inventory.

## Written repair: separation and torus descent

At a distinct auxiliary split prime for each pair of Q-simple factors, choose a split positive-dimensional maximal torus in one factor and an anisotropic maximal torus in the other. Exclude the prescribed p and the finite forbidden set; subsequently choose the H¹ exceptional prime p₀ elsewhere. The existence of those local anisotropic maximal tori is still the original [40, Theorem6.21] supplier in G4, and Lemma3.6 supplies simultaneous approximation and global irreducibility. This continuation proves the consequences of those choices; it does not claim to have read the original theorem.

The split torus has a nonzero trivial local rational character representation. The anisotropic torus has no invariant cocharacters. Perfect duality and Maschke for the finite-image Galois action show that its character invariants also vanish. The local rational representations therefore differ, so the global rational representations cannot be isomorphic. Between two irreducible modules a nonzero intertwiner would be an isomorphism; their cross-Hom is consequently zero. This is the needed **nonisogeny**, stronger than nonisomorphism of integral tori.

The torus-valued cocycle on p326 gives more than descent of the subgroup. If c_σ=gσ(g)⁻¹∈T, then σ(g)=c_σ⁻¹g. For t∈T(Fbar),

\[
\sigma(g^{-1}tg)
=g^{-1}c_\sigma\sigma(t)c_\sigma^{-1}g
=g^{-1}\sigma(t)g.
\]

Thus φ=inn(g⁻¹)|T is Galois-equivariant, and affine Galois descent gives an F-isomorphism T→T′=g⁻¹Tg. Apply this to the image of the Gsc/Tsc data in G. Inner conjugation respects each normal factor, so the isomorphism is factorwise. Both integral and rational character modules are preserved, including irreducibility and pairwise nonisogeny. This is a worker-derived strengthening of the printed calculation. It does **not** imply that g is rational, or that the embeddings are globally rationally conjugate. The paper’s local conjugators remain necessary to preserve real components and p-adic Borel positions. Its Chebotarev/Brauer–Nesbitt alternative remains item102, but is unnecessary for this particular restricted conjugation map.

For completeness, let H⊂∏T_i be a connected subtorus surjecting to every irreducible, pairwise nonisogenous T_i. Character restriction is a surjection r:⊕V_i→X*(H)_Q whose restriction to each V_i is injective. The action factors through a finite group. By Maschke, a nonzero kernel would contain a simple constituent isomorphic to some V_i. Vanishing of cross-Homs forces its inclusion into ⊕V_i to land in that summand, contradicting injectivity there. Thus r is an isomorphism and H=∏T_i. This is the precise direct-sum argument used for the adjoint Mumford–Tate torus.

For the cyclic closure C of q, take H=C°. The rationality/base-change theorem for this closure remains item117. Since C/H is finite, a trivial projection of H to T_i would make q_i torsion. Infinite order therefore gives a positive-dimensional projection, and irreducibility gives surjectivity. The preceding argument gives H=∏T_i and hence cyclic density. The proper diagonal closure of (2,2) in G_m² confirms the necessity of excluding repeated factors.

## Pinned library and owner boundaries

The pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Earlier baseline declarations and audit reads remain attributed to the preceding extraction. This continuation freshly read these exact new library statements and their hypotheses:

| Item | Declaration at the pin | Scope |
| --- | --- | --- |
| 138 | `Algebra.norm_eq_prod_embeddings`, Norm/Transitivity:268 | Finite separable scalar field norm, not an arbitrary torus norm |
| 139 | `spectralNorm_unique_field_norm_ext`, SpectralNorm:770, variables 691–693 | Complete nontrivial nonarchimedean base; algebraic extension; real absolute values |
| 140 | `isCompact_iff_finite`, `IsCompact.finite_of_discrete`, Compactness/Compact:511–518 | Compact subsets of a discrete space |
| 141 | `MonoidAlgebra.Submodule.exists_isCompl`, Maschke:162 | Finite group, cardinality nonzero in the coefficient field |

The torus perfect pairing, free finite cocharacters and equal ranks were reread in TauCeti Torus/Cocharacter/Basic:45–105. The normalized valuation definition and uniformizer equation were read in LocalField/NormalizedValuation:89–120,295–305, and the continuity statement in Mathlib ValuedField:123–138. The normalized additive finite-extension API is not inferred from those declarations alone.

The complete reviewed **AUDIT-04 LocalFieldsRamification Layer0** entry was freshly read. It distinguishes built normalized valuations and spectral-norm uniqueness from the incomplete finite-extension local-field, topology and intrinsic e/f adapters. Item142 imports that existing upstream layer. No second local-field roadmap is proposed.

The upstream ReductiveGroups stage descriptions were read, together with full LocalFieldsRamification Layer0 and ReductiveGroupsPartII RG2.0, RG2.0a and RG2.3. RG2.0 owns local point topologies and continuity (item143); RG2.0a owns affine Weil restriction and its splitting product; ReductiveGroups Layer0 owns the functor-of-points and field-extension injectivity used in item150. The six missing torus-specific additions, items144–149, extend the existing arithmetic-tori candidate. The KMPS22 and Kisin–Zhou25 briefs were reread to preserve their H¹-transfer/Conj ownership. No reviewed ReductiveGroupsPartII audit entry was found; that absence is not an audited negative result.

## Routing, retaining all ten owners

### 1. ReductiveGroupsArithmeticPartII (part-ii; 39 items)

Reuse the candidate already proposed by PAPER-KISIN-MADAPUSIPERA-SHIN-22 and PAPER-KISIN-ZHOU-25. It owns global tori, H¹ transfer and Conj; this paper adds irreducible, isogeny-separated torus approximation and outer-stabilizer interfaces, not a second torus roadmap.

Extend the existing candidate ReductiveGroupsArithmeticPartII from Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups). Import the pinned torus/character/cocharacter and adjoint carriers, the upstream maximal-torus/root-data/isomorphism theory, local models from ReductiveGroupsPartII, and Chebotarev and class field theory from their upstream owners. Retain the KMPS22/Kisin–Zhou25 ownership of H¹ transfer and Conj_G. Supply generic maximal-torus rationality, full W⋊A₀ specialization, local orbit openness and the exact Lemma3.6 approximation theorem, correcting the product-open-subgroup step. Strengthen the local separation choices to pairwise nonisogeny before using rational character modules. Build the real normalizer cocycle, one-exceptional-prime H¹ lift, local simply-connected vanishing, Hasse principle, rational torus twist and rational Brauer–Nesbitt comparison needed for Proposition3.7. Export generic subdirect-product and cyclic-closure lemmas, scalar-extension compatibility of rational cyclic closure, the dominant-orbit norm valuation with a general uniformizer, finite outer-automorphism/root-datum descent, and Chebotarev descent of conjugation-quotient points. Include Serre groups with modulus and the locally algebraic torus realization of Remark3.11, without using the later Shimura theorem as an input. The final generic interfaces imply a dense cyclic torus element has no outer stabilizer; the Shimura application belongs to ShimuraVarietiesCompatibleSystemsPartII. Correct E2–E4 and resolve original group-theory sources before marking this closed. Suggested file TauCeti/AlgebraicGeometry/Reductive/ArithmeticTori.lean. Continuation: items144–149 decompose the pointwise torus norm, compact-character vanishing, ramified embedding-pairing formula, dominant-orbit positivity, rational isomorphism from a torus-valued cocycle, and split–anisotropic rational separation. Reuse local-field Layer0 for item142 and RG2.0 for item143. Apply the explicit torus isomorphism to preserve character modules, keeping local conjugacy for real/p-adic embedding positions. The general-uniformizer proof bypasses the unproved special-point-field unramifiedness claim; it does not repair that separate claim. Use Maschke only for the finite-image rational Galois modules, never for all reductive-group representations in positive characteristic.

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

Extend Complex Shimura varieties and canonical models (ShimuraVarieties), importing V4/V7/V8.general's canonical tower, reciprocity and Betti–étale local system with its right-action convention. Share this carrier with HodgeTateAndCanonicalSubgroups:T6:comparison without requiring the logarithmic comparison theorem here. Import higher-rank lattice rigidity from ArithmeticLocallySymmetricSpacesSuperrigidity, the abstract uniform ramification and symmetry-breaking criterion from ArithmeticGaloisRepresentationsSuperrigidSystems, and irreducible/isogeny-separated tori and norm valuations from ReductiveGroupsArithmeticPartII. Construct the soft SNC-complement integral model with uniform special-point integrality using PSTEG Theorem4.1. Prove the five parts of Proposition3.7 separately, including the strengthened pairwise nonisogeny needed by E2. Compute special Frobenius via q and Eq.(6)–(7), resolving the fixed-hyperspecial-position gap E4 with a proved general-uniformizer or stronger integral-position argument. Establish cyclic density and trivial outer stabilizer, then uniform fibrewise compatibility and Q-rationality of the quotient point. Final Theorem3.10 assumes neat K₀, discrete rational centre and real rank at least two for every Q-simple adjoint factor; it yields one Ntilde for every good fibre and all ℓ,ℓ'. Corollary3.12 gives pointwise systems with N(y). Separate Serre-group realization and the fixed-ℓ open-image remark from all-prime density claims. Do not import BST Theorem9.7, Patrikis's full-G follow-up or crystalline companions back into their own prerequisite. Suggested file TauCeti/Geometry/Shimura/AdjointCompatibility.lean. The continuation writes the Eq.(7) compact-character and ramified-uniformizer calculation and connects it through Eq.(6) to Assumption2.7. It requires no unramifiedness of the section field. The special-point construction uses pairwise nonisogeny justified by items094/148/149. These are worker-supplied proof repairs with foundational and independent-review gates still open.

### 8. ShimuraVarieties (source; 6 items)

The existing canonical-model and tower stages own reflex norms, component fields, finite étale level covers and their monodromy. Add the precise opposite-deck-group construction, Eq.(3), Lemma3.2 and the Betti comparison here; share the carrier with T6:comparison rather than creating a second local system.

Existing stages: ShimuraVarieties:V4, ShimuraVarieties:V8.general.

### 9. SchemeAndStackFoundations (source; 2 items)

Finite-presentation spreading and separated integral-point descent belong to the general scheme/morphism foundations. The special theorem that all special points are uniformly integral remains a new Shimura input.

Existing stages: SchemeAndStackFoundations:SF.0.

### 10. ReductiveGroupsPartII (source; 1 items)

The hyperspecial/parahoric owner supplies the integral-model maximal-torus bounded-subgroup theorem, with the integral-position hypothesis from Getz–Hahn. Generic unramified tori must not silently satisfy it. Item092 remains a separate source target. The repaired infinite-order application no longer depends on its claimed applicability to the chosen torus.

Existing stages: ReductiveGroupsPartII:RG2.3.

## Source findings awaiting independent verification

All ten records retain their IDs and no independent-review verdict is assigned. “New” means no correction was found in the recorded search, not a discovery-priority claim. E9 concerns the later abstract sentence about stronger compatibility; the abstract’s first displayed family already uses the adjoint group. None of these findings is a counterexample to the main compatibility theorem.

### E1 — Journal §2 p312, after Lemma2.1; v2 §2 p8

Add quasi-projectivity of X_F, or make the existence of the stated smooth projective SNC compactification an explicit hypothesis as v1 did.

The preceding hypothesis is only smooth geometrically connected finite type. An open subscheme of a projective scheme is quasi-projective, whereas smooth proper nonprojective varieties exist (for example the split smooth complete toric threefolds of Fujino–Payne, https://arxiv.org/abs/math/0510679). A proper open immersion into a projective compactification would make such a variety projective. Shimura varieties here are quasi-projective, so this does not change that application.

### E2 — Journal Lemma3.9 p327 first proof paragraph; Theorem3.10 p331; Proposition3.7(3) pp324–326; same step in v2

Retain pairwise nonisogeny, or inequivalence of rational character representations, as the separation property. At the auxiliary split primes in Proposition3.7 choose a split torus in one factor and an anisotropic torus in the other; prove this stronger property survives the twist.

The printed hypotheses only assert nonisomorphism of Q-tori, i.e. of integral Galois lattices. Nonisomorphic lattices can become isomorphic over Q. For example A₂ root and weight lattices under S₃ have index3 and the same irreducible rational representation; their integral intertwiner determinants are 3m², so none is unimodular. Pairwise integral nonisomorphism alone does not justify injectivity of the direct sum. This identifies a gap in the stated inference, not a counterexample to Theorem3.10; the stronger allowed local separation repairs the needed inference.

Written continuation proof supplied on 2026-09-23; independent verification remains outstanding. See report and items094/103/106/110/114–116/118/142–150. No verdict assigned.

### E3 — Journal Lemma3.6 p323 first sentence of proof; v2 §3.3

Replace each arbitrary open subgroup K_v by a product of sufficiently small open subgroups contained in it, then apply the factorwise argument. The tori do decompose.

An open subgroup of a finite product need not be a product: the inverse image of the diagonal under two copies of a nontrivial finite quotient is open and proper while projecting onto both factors. Every identity neighbourhood contains a product neighbourhood, and one may choose open subgroups there. This supplies the needed repair without strengthening the lemma.

### E4 — Journal Lemma3.9 p328 paragraph after Eq.(7); same in v2 p22

The cited Getz–Hahn statement requires T_model⊂B_model⊂G_model over O_F. Prove that integral-position condition for the torus used here, or avoid claiming E(s_K₀)_w/Q_p unramified and evaluate Eq.(7) with a general uniformizer, giving v_p(χ(N μ(π_w)))=e⁻¹∑_σ〈χ,σμ〉.

The source has only an unramified generic torus in a Q_p-rational Borel and hyperspecial containment for the fixed model. In GL₂/Q₃ let u=[[1,1/3],[0,1]], T=uDu⁻¹ and t=u diag(2,1)u⁻¹=[[2,-1/3],[0,1]]. T is split and t belongs to its maximal compact subgroup, but t∉GL₂(Z₃). Getz–Hahn 22Apr2022 AppendixA.5, LemmasA.5.1–2 pp482–483 explicitly starts with an integral torus and Borel. The paper has not established that hypothesis for its chosen T_x. This invalidates the quoted equality's justification; it does not disprove the infinite-order conclusion. The proposed general-uniformizer repair requires a separate full proof audit.

Written continuation proof supplied on 2026-09-23; independent verification remains outstanding. See report and items094/103/106/110/114–116/118/142–150. No verdict assigned.

### E5 — Journal Remark3.8 p327; v2 Remark3.8 p20

The intended comparison is with the special-point construction in Proposition3.7.

There is no Proposition3.2; Lemma3.2 computes special-point monodromy, whereas Proposition3.7 is the five-condition construction whose parts(1),(4),(5) are cited in the same sentence.

### E6 — Journal Lemma3.9 p328 after Eq.(7); v2 p21

Read characters, not cocharacters.

χ is applied to a torus element and has codomain G_m. A cocharacter instead has domain G_m, so the displayed evaluation would be ill typed.

### E7 — Journal Lemma3.9 p329 first paragraph after the norm computation; v2 p22

Read nonzero dominant in each Q-simple factor, sufficient to find some positive-root pairing; do not require membership in the strict interior of the dominant chamber.

Nontriviality of a dominant cocharacter does not force all simple-root pairings to be positive. In type A₂ the cocharacter (2,-1,-1) has pairings3,0. The next sentence uses only some root with positive pairing, so the intended proof needs this weaker precise formulation. This is a convention clarification, not a failure of the positivity argument.

### E8 — arXiv v1 §2 p7, first bullet defining relative normal crossings; section deleted in v2, journal p314 footnote3 still points to v1

Use an étale-local union of coordinate hyperplanes, with equation t₁⋯t_r=0, rather than a single coordinate linear subspace.

For d≤n−2 a coordinate A^d⊂A^n is not a Cartier divisor, and a single hyperplane cannot model an intersection of two boundary branches such as xy=0. The section was removed, not replaced by a corrected definition; the journal refers to it for the specialization proof.

### E9 — Journal abstract p305; arXiv abstract and v2 p1

Specify compatibility of their adjoint projections, or say G^ad(Q_ℓ)-valued systems.

Theorem3.10 proves compatibility only after adjoint projection; Remark3.14 explains why the full G-valued conclusion does not follow here. Patrikis's author page likewise describes the adjoint projection. The separate follow-up2504.00305 addresses full G. The abstract's wording should not be used as a stronger target.

### E10 — Journal Lemma3.9(2) p327

Use a∈G(A_f), as fixed in the lemma's opening sentence.

The datum is over Q and a is the fixed finite-adelic representative. No field F or adelic ring A_F is introduced at this point; the rest of the calculation uses the finite p-component.

## Remaining work

- **G1 — Original integrality and continuity input.** Extract the exact EG18/KP22 variant, Margulis admissible H¹ modules, boundary conditions, and Simpson continuity. Do not identify superrigidity with cohomological rigidity or assert every dense representation integral without these gates.
- **G2 — Non-complete-trait tame specialization.** Finish original Lieblich–Olsson A.7/A.12, Grothendieck–Murre, Néron–Popescu and Artin inputs. Verify Ahat as a union rather than merely a colimit, descent of valuations, and the inertia-equivariant paths used on journal p315. Correct v1 chart E8.
- **G3 — Companions and arithmetic ramification.** Read Petrov6.1; one full G-companion route (Drinfeld2018 or Drinfeld2012+Chin); Kerz–Schmidt/Deligne and BHKT6.4; then Drinfeld's arithmetic tangent results. Check all determinant/purity/connectedness and coefficient assumptions. The journal proof identifies their uses, not their recursive closure.
- **G4 — Higher-rank lattice and group-theoretic sources.** Extract the original Margulis, Platonov–Rapinchuk, Prasad–Rapinchuk and Voskresenskiĭ statements. Generic algebraic-group auxiliary arguments are itemized but still need a baseline-to-target expansion; coordinate existing H¹/Conj candidate instead of duplicating it.
- **G5 — Rational versus integral torus separation.** The strengthened separation, factorwise torus-cocycle isomorphism and multiplicity-free subdirect-product proofs are now written in items094/103/106/110/118/148/149. Still obtain the original local anisotropic maximal-torus existence theorem, generic approximation and H¹ suppliers in G4 and independently verify the repair in G10. No unqualified closure or implementation claim.
- **G6 — Fixed hyperspecial position and general-uniformizer repair.** The full general-uniformizer proof and application are written in items114–116/142–147/150: compact character values vanish, the norm valuation is e^-1 times the embedding-pairing sum, and positivity gives infinite-order Frobenius. This bypasses the intermediate unramified-field claim. Still close the imported finite-extension/topology/reflex-reciprocity leaves and independently verify the repair. Collation of the published Getz–Hahn appendix remains required for the separate item092/source finding E4; that collation is not claimed completed.
- **G7 — Soft integral model and canonical-tower leaves.** Read PSTEG Theorem4.1 and Ullmo–Yafaev2.1–2.2; finish exact canonical-model, right-tower and centre/neatness proof leaves in V4/V7/V8. Coordinate the identical canonical local system consumed by T6:comparison, without importing all logarithmic RH.
- **G8 — Supplementary Serre-group and open-image remarks.** Extract Serre's locally algebraic realization and the fixed-ℓ specialization/open-image input, then Huryn–Zhang only for the follow-up density-one assertion. The full-G follow-up, p-adic compatibility follow-up and BST Theorem9.7 remain downstream, not main theorem inputs.
- **G9 — Baseline-to-stage closure and finer supplier IDs.** Reviewed audits and actual layer descriptions are recorded, but these coarse planned stage references do not close proofs. Resolve exact accepted packet/reserved supplier nodes and request statements in future design jobs. Complete per-leaf pinned searches during blueprint expansion; no claim that all 137 targets elaborate. Continuation identifies LocalFieldsRamification Layer0, ReductiveGroupsPartII RG2.0/RG2.0a and ReductiveGroups Layer0 as owners of the new adapters. Resolve their exact supplier signatures and affine descent before claiming formal closure. The 46 API/test lists are planning specifications; inherited source-wide contracts beyond the focused repair still require per-node blueprint expansion.
- **G10 — Independent verification of source findings.** All ten E-records await independent review; no reviewer verdict is self-assigned. Verify intended positivity conventions in E7 and adjoint abstract wording in E9 before treating these as confirmed errata. E1/E3 require the explicit corrected assumptions/step recorded in items.

The 16 inherited bibliographic prerequisite groups remain intact. Source references that were not read remain explicitly open; none is closed by a later paper that depends on this one. Resume with the original local torus/H¹/approximation inputs, or the Proposition2.3 integrality/companion/specialization chain. Independently review the written repairs before treating the source findings as confirmed errata.

## Validation

The focused audit passed 1134 structural assertions: all inherited IDs/statuses retained, dependency endpoints and cycles checked, exact-once ownership of all 116 missing items, canonical API/test fields for all 46 definitions/constructions, and unchanged route/finding/gap identities. It passed 11567 exact arithmetic assertions for Eisenstein norm determinants, dominant-chamber coordinate sums, A₂ lattice intertwiners, finite-character projectors, Gaussian-rational cocycle descent, the fixed-hyperspecial counterexample and the repeated-factor obstruction. These are finite diagnostic checks, not a proof of the general local-field, descent, approximation or Galois statements.

The paper checker and exact three-deliverable intake check passed; final snapshot and commands are recorded in the handoff. Earlier checker regression suites are inherited validation, not rerun here because the checker code was not changed. No Lean file was created or compiled. Partial status and all ten gaps remain.

Publication refresh: 556 inputs verified at 10981ece7d21f6f9671eb164bb8ee7343c95571b. Screened Binda–Kato–Vezzani25 and Liu–Zhu17 completion/source-finding metadata (no item changes), Yang–Zhao25 localized-Chern additions, Yuan26 height/gap-principle additions, Yuan–Zhang18 PEL/level/height comparisons, and new Caraiani–Scholze17 Igusa/torsion-concentration routes. None replaces the local-field or arithmetic-torus repair suppliers; no route identity changes.

Final guard refresh: 557 inputs at f4627ae2ad33e157779697585f7018a5e9bbe1c0. AGHMP18 added/refined special-endomorphism, CM-level, Lubin–Tate and height leaves under its existing LT/orthogonal/CM owners. Its local semilinear-endomorphism and CM-height assertions do not supply or duplicate the generic arithmetic-torus norm/descent repairs here. Original three deliverable blobs remain unchanged.
