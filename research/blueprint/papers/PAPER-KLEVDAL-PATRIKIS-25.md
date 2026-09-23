# Klevdal–Patrikis: adjoint canonical compatible systems

Independent review by Codex, session `codex-7e92bd`, issue #1208, 23 September 2026. **Verdict: revise. Review complete; extraction partial.** The inventory has 150 items: 15 library, 19 planned and 116 missing. The 46 definition/construction items retain their planning APIs and three tests each. Routes 6, 8, 9 and 10 are accepted with the corrected contracts; routes 1–5 and 7 require revision. Nine original-source/interface gaps remain open.

This report supersedes the earlier completion narrative. The earlier contributors wrote useful conditional repairs, but the remaining original supplier statements and exact owner/dependency contracts prevent a closed blueprint. Their prior completion and check records are preserved as provenance in the JSON, separately from the independent review.

## Sources and actual reading

Christian Klevdal and Stefan Patrikis, *Compatibility of canonical ℓ-adic local systems on adjoint Shimura varieties*, Inventiones mathematicae 242 (2025), 305–335. The reviewer read all 31 pages of the [published article](https://link.springer.com/content/pdf/10.1007/s00222-025-01357-6.pdf), including proofs, footnotes and bibliography; images of journal pp326–331 were inspected. SHA-256: `0691a57a2aae841419ee97b8fac68aa8f3d499ed884933422a388106febab576`. It is [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/); the extracted statements and proposed repairs are attributed adaptations, not author-approved amendments.

The deleted specialization section in [arXiv v1](https://arxiv.org/pdf/2303.03863v1), pp7–11, was read in full. Relevant passages of [v2](https://arxiv.org/pdf/2303.03863v2), pp1,8,17,20–23, were collated; this is not a claim to have reread both full preprints. The v1 SHA-256 is `ed38bd1baf9d052dc8ef767a5d959e332233087c4f003774e8b8cb6ec651be7b`; v2 is `71042dd475176292c3fc75f976c168808c294b59d001c8f224bfa848ae2af542`.

The public [published Getz–Hahn backmatter](https://link.springer.com/content/pdf/bbm:978-3-031-41153-3/1), pp548–550, was read, including Lemmas B.5.1–2 on p549 and its page image. It was compared with the [22 April 2022 author draft](https://sites.duke.edu/jgetz/files/2022/04/Graduate_Text.pdf), A.5.1–2 pp482–483. All three pages of the [author-linked July 2026 errata](https://sites.duke.edu/jgetz/files/2026/07/Errata.pdf) were read: no relevant B.5 correction was found. Published backmatter SHA-256: `eeed7c1e648e0a9f998a22797b30820de00a6d08896a7ed448c3d08239dc42a2`. This closes the version-collation task; it does not extract the Macdonald/SGA3 supplier proofs.

The [arXiv history](https://arxiv.org/abs/2303.03863), [Patrikis bibliography](https://people.math.osu.edu/patrikis.1/papers.html), [Klevdal page](https://sites.google.com/view/christianklevdal/home), [Getz book page](https://sites.duke.edu/jgetz/graduate-text/), and bounded title/DOI/correction searches were checked. The introduction of [Fujino–Payne](https://arxiv.org/pdf/math/0510679) supplies the smooth complete nonprojective examples for E1. No other original supplier paper is represented as fully read. “New” means no correction identified in this recorded search, not an exhaustive discovery or priority claim.

### The theorem, with its boundaries

Let (G,X) be a Shimura datum with G connected reductive over Q, Z_G(Q) discrete in Z_G(A_f), and neat level K₀. Every Q-simple factor of G^ad must have total real rank at least two; restrictions of scalars can still have compact real factors. Theorem3.10 produces a soft smooth integral model after excluding one integer Ntilde such that, for every good closed point and all ℓ,ℓ' different from its residue characteristic, the adjoint canonical local systems have a common semisimple Frobenius class in Conj_G^ad(Q).

This is a rational point of a conjugation quotient. It is not a rational group representative, rational conjugacy, compatibility in full G, a crystalline companion, or a motivicity theorem. Corollary3.12 restricts to number-field points; its integer N(y) may depend on the point. The common Ntilde of Theorem3.10 is uniform across components, closed points and coefficient primes.

The abstract superrigidity theorem has an additional common-field hypothesis F(λ)=F. Remark2.4 expects more but does not prove that hypothesis automatically. Canonical Shimura models supply the common field in the application.

### Proof architecture

The principal chain is:

1. Lemma2.1 gives a unique extension from a normal dense subgroup in an adjoint group and descends its conjugators to the coefficient field. Continuity is a separate Simpson input.
2. Integrality, coefficient completions and the finite outer-automorphism torsor give place-dependent arithmetic descents. Assuming a common descent field, Petrov supplies individual exceptional sets N_λ.
3. Their gcd gives a uniform candidate. At a good auxiliary coefficient prime, a tame G-companion pulls back through tame specialization. Superrigidity kills the geometric specialization kernel.
4. This does **not** yet give arithmetic extension. Integral-section inertia centralizes dense geometric monodromy and is therefore trivial. Drinfeld's tangent-direction ramification test and arithmetic-section construction then rule out remaining arithmetic ramification.
5. Proposition2.3 gives companions up to an algebraic automorphism. Proposition2.8 removes its outer class if an integral section has a common torus Frobenius class with trivial outer stabilizer.
6. Proposition3.3 obtains G^ad-superrigidity from Margulis, factorwise dense arithmetic lattices, normal-subgroup comparison and coefficient descent. The extension Ω'/Ω in the intermediate theorem is not presumed finite; item074 now explicitly enlarges it to an algebraically closed overfield before fixed-field descent.
7. Proposition3.7 supplies a special torus with real, p-adic, irreducibility, separation and dominant-cocharacter conditions. Its five conclusions are separate items. The separation contract is strengthened to nonisogeny at E2.
8. Lemma3.9 uses reciprocity to produce q, Eq.(7) to control its p-adic valuations, and irreducible separated tori to prove cyclic density. Fixing q then forces an automorphism to fix a maximal torus pointwise and hence be inner.
9. The uniform special section removes the outer ambiguity; Chebotarev makes the common quotient point Q-rational. This yields Theorem3.10 and then Corollary3.12.

The canonical tower retains its right action and the opposite deck group exactly once. Under the source convention γ acts by y↦γ⁻¹y, while the canonical monodromy sends γ to a⁻¹γa. Geometric Artin reciprocity is used throughout. Component fields, basepoints and local extension norms remain explicit.

The Serre-group realization of Remark3.11, fixed-ℓ open-image statement of Remark3.13, density-one follow-up, and full-G obstruction of Remark3.14 are recorded separately. They do not feed backward into the main theorem. BST Theorem9.7 and the full-G/p-adic follow-ups use this paper and are not imported as its prerequisites.

### Written repair: ramified norm valuations

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

This repairs the **needed inference**, conditional on the explicitly retained foundational inputs. It leaves the paper’s separate intermediate assertion that E(s)_w/Q_p is unramified unproved. The published Getz–Hahn collation is now complete: B.5.2 retains the integral-position hypothesis. Its original Macdonald/SGA3 proof suppliers remain open. The uniformizer argument bypasses that theorem’s unsupported application to the chosen torus.

### Written repair: separation and torus descent

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

## Corrected coefficient descent and components

Item074 now takes an algebraically closed common overfield Ω′ of the algebraically closed characteristic-zero coefficient field Ω. This enlargement preserves the factor maps. Density and the trivial adjoint centralizer make the conjugator unique and fixed by every Ω-automorphism. The common fixed field is Ω: a transcendental element can be included in a transcendence basis, translated by 1, and that automorphism extended to algebraic closures. Descending coordinates therefore suffices. The extraction no longer applies this fixed-field assertion to an arbitrary overfield. Without reading Margulis’s original construction, no additional source-error finding is assigned to this exposition.

For a fixed X⁺, use a finite set of representatives for G(Q)₊\G(A_f)/K₀, as in Eq.(4). Include the extension bounds and denominator primes from **every** such representative before forming Ntilde. Theorem3.10’s proof prints G(Q) instead; E11 records the omission. At genus-two principal level K(N), N≥3, g=diag(−I₂,I₂) has multiplier −1 and lies in GSp₄(Q). Thus 1 and g represent the same full-G rational double coset. Equality modulo G(Q)₊ would give −1=a·u with a a positive rational number, u a finite integral unit congruent to 1 modulo N. All finite valuations force a=1, contradicting −1≠1 mod N. This rank-two example shows the lost component. The corrected finite indexing enlarges N₁ if necessary; it does not change the theorem’s conclusion.

## Library and atlas ownership audit

All 14 inherited library items were independently checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Item150 adds an exact library match, bringing the count to 15. The library claims are limited to the following carriers and operations; scheme-specific adapters are not inferred from abstract categorical results.

| Item | Existing declarations | Scope |
| --- | --- | --- |
| 001 | `mathlib:CategoryTheory.PreGaloisCategory.FiberFunctor` | Galois fibre functor |
| 002 | `mathlib:CategoryTheory.PreGaloisCategory.autMulEquivAutGalois` | Opposite deck-group limit |
| 003 | `mathlib:CategoryTheory.PreGaloisCategory.functorToContAction` | Finite continuous monodromy sets |
| 004 | `tauceti:TauCeti.torusCommHopfAlgProperty` | Algebraic torus carrier |
| 005 | `tauceti:TauCeti.exists_characterLattice_addEquiv_of_torus` | Finite free torus character lattice |
| 006 | `tauceti:TauCeti.CommHopfAlgCat.continuousSMul_groupLike` | Continuous Galois action on geometric characters |
| 007 | `tauceti:TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair`, `tauceti:TauCeti.TorusCommHopfAlgCat.finrank_cocharacterLattice_eq_characterLattice` | Perfect character–cocharacter pairing |
| 008 | `tauceti:TauCeti.reductiveAffineGroupSchemeProperty` | Reductive group scheme carrier |
| 136 | `tauceti:TauCeti.adjointSemisimpleCommHopfAlgProperty` | Adjoint semisimple group carrier |
| 137 | `tauceti:TauCeti.adjointSemisimpleCommHopfAlgProperty.isCentralPoint_eq_one` | Universally central adjoint points are identity |
| 138 | `mathlib:Algebra.norm_eq_prod_embeddings` | Field norm as a product of embeddings |
| 139 | `mathlib:spectralNorm_unique_field_norm_ext` | Uniqueness of the extended absolute value |
| 140 | `mathlib:isCompact_iff_finite`, `mathlib:IsCompact.finite_of_discrete` | Compact subsets of a discrete space are finite |
| 141 | `mathlib:MonoidAlgebra.Submodule.exists_isCompl` | Equivariant complements for finite groups |
| 150 | `tauceti:TauCeti.AlgHom.mapValue`, `tauceti:TauCeti.AlgHom.mapValue_injective`, `mathlib:orderOf_injective`, `mathlib:Function.Injective.isOfFinOrder_iff`, `mathlib:MulEquiv.orderOf_eq`, `mathlib:orderOf_inv` | Injective coefficient change on Hopf-coordinate points preserves order |

Item150 uses `TauCeti.AlgHom.mapValue` and `mapValue_injective` at FunctorOfPoints.lean:141–169. The value-algebra map gives an injective homomorphism on Hopf-coordinate points. Mathlib’s `orderOf_injective`, `Function.Injective.isOfFinOrder_iff`, `MulEquiv.orderOf_eq`, and `orderOf_inv` supply order preservation, finite-order reflection, conjugation and inversion. The affine-group/Hopf interpretation is imported from the existing anti-equivalence; no new order-reflection theorem is planned.

Every inherited planned reference was read in its complete stage description. Twenty exact reviewed library-audit layers were inspected; an absent exact RG2 audit entry is not treated as an audited negative result. Additional supplier reads include V8, SF.2, D3, ET.0, DWP.7–8 and IG.2. The full upstream ReductiveGroups and HodgeStructures examples were used to calibrate granularity. Twenty-two tailored search clusters cover all 116 missing items, across both pinned Lean trees and the atlas’s stages, reviewed results, reserved proposals and decomposition data. Search expressions and item sets are retained in `independentReviewAudit.missingSearches`; broad lexical hits are not implementation evidence.

The main ownership boundaries are:

- Abstract Galois categories are in Mathlib; scheme π₁, arithmetic exact sequences and proper specialization belong to IG.0/1. The open tame/noncomplete-trait extension needs its own precise suppliers.
- RG2.0 owns local rational-point topology; RG2.0a owns affine Weil restriction and the Deligne-torus carrier. D1 supplies its Hodge/sign dictionary. D3/D4/D5 retain reflex cocharacters, Shimura data/special pairs and neatness/discrete-centre inputs.
- LocalFieldsRamification Layer0 already plans finite-extension normalized valuation and topology adapters; built scalar norms and spectral norms do not supply the whole interface.
- The accepted KMPS22/Kisin–Zhou arithmetic-tori candidate owns Conj and the global torus/H¹ work. ET.0 supplies stable/rational conjugacy and cohomology. No competing owner is introduced.
- GS.6 supplies the GL_n correspondence and the accepted Kisin–Zhou/Chin coefficient and twist requests. DWP.7–8 supplies weight/semisimplicity inputs, not a general G-companion theorem. GS.5 is not the missing converse construction.
- V4/V7/V8/V8.general retain canonical models, reflex reciprocity and level towers. IG.0/SF.2 supply the étale carriers; T6:comparison shares the same canonical local system. General comparisons are not prerequisites for their own construction.
- SF.0 owns general spreading and separated integral-point descent, while R09.7d supplies a chosen quasiprojective SNC compactification. The pinned `AlgebraicGeometry.spread_out_of_isGermInjective` (SpreadingOut.lean:335) spreads a stalk morphism, not all smooth/projective/SNC structure.
- Nearby maximal-torus existence under Lie-dimension hypotheses, Lie-algebra automorphisms and ordinary Galois descent do not supply p-adic compactness, algebraic-group outer descent or global H¹ approximation.

## Routes and review decisions

Every missing item occurs in exactly one route. Acceptance below means that the corrected owner and requested interface can be built on; it does not certify the external theorem proofs. Rejected briefs remain useful acquisition proposals but are not accepted design instructions.

### 1. ReductiveGroupsArithmeticPartII — reject

Reject the enlarged brief pending exact supplier/ownership closure. Reuse the accepted KMPS22/Kisin–Zhou ReductiveGroupsArithmeticPartII candidate and ET.0, but the current generic-torus/H¹/Serre targets still invoke unread original statements and the new shared torus adapters need exact owner nodes. The norm, nonisogeny and torus-descent calculations are valid conditional mathematics, not proof closure for the whole candidate.

Extend the existing candidate ReductiveGroupsArithmeticPartII from Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups). Import the pinned torus/character/cocharacter and adjoint carriers, the upstream maximal-torus/root-data/isomorphism theory, local models from ReductiveGroupsPartII, and Chebotarev and class field theory from their upstream owners. Retain the KMPS22/Kisin–Zhou25 ownership of H¹ transfer and Conj_G. Supply generic maximal-torus rationality, full W⋊A₀ specialization, local orbit openness and the exact Lemma3.6 approximation theorem, correcting the product-open-subgroup step. Strengthen the local separation choices to pairwise nonisogeny before using rational character modules. Build the real normalizer cocycle, one-exceptional-prime H¹ lift, local simply-connected vanishing, Hasse principle, rational torus twist and rational Brauer–Nesbitt comparison needed for Proposition3.7. Export generic subdirect-product and cyclic-closure lemmas, scalar-extension compatibility of rational cyclic closure, the dominant-orbit norm valuation with a general uniformizer, finite outer-automorphism/root-datum descent, and Chebotarev descent of conjugation-quotient points. Include Serre groups with modulus and the locally algebraic torus realization of Remark3.11, without using the later Shimura theorem as an input. The final generic interfaces imply a dense cyclic torus element has no outer stabilizer; the Shimura application belongs to ShimuraVarietiesCompatibleSystemsPartII. Correct E2–E4 and resolve original group-theory sources before marking this closed. Suggested file TauCeti/AlgebraicGeometry/Reductive/ArithmeticTori.lean. Continuation: items144–149 decompose the pointwise torus norm, compact-character vanishing, ramified embedding-pairing formula, dominant-orbit positivity, rational isomorphism from a torus-valued cocycle, and split–anisotropic rational separation. Reuse local-field Layer0 for item142 and RG2.0 for item143. Apply the explicit torus isomorphism to preserve character modules, keeping local conjugacy for real/p-adic embedding positions. The general-uniformizer proof bypasses the unproved special-point-field unramifiedness claim; it does not repair that separate claim. Use Maschke only for the finite-image rational Galois modules, never for all reductive-group representations in positive characteristic. Independent-review boundary: import stable/rational conjugacy, inner twisting, Tate–Nakayama and abelianized group cohomology from EndoscopicTransferAndUnitaryTraceComparison:ET.0 as required by the accepted Kisin–Zhou proposal. Retain the shared KMPS22/Kisin–Zhou candidate, with no duplicate Conj or H¹ carrier. Use an algebraically closed common overfield in item074. Supply original statement-level contracts for the generic-torus, approximation, H¹ and Serre inputs before this enlarged brief is accepted.

### 2. InverseGaloisPartIITameSpecialization — reject

Reject pending original complete-trait and approximation contracts. IG.0/1 owns the geometric carrier, arithmetic sequence and proper specialization; the open SNC/noncomplete-trait extension is justified in direction, but its Néron–Popescu union, valuation descent, Artin and inertia-equivariance suppliers remain open. Drinfeld tangent-direction results need their exact source hypotheses before activating this combined design.

Build on Inverse Galois theory and arithmetic fundamental groups (InverseGaloisAndArithmeticFundamentalGroups:IG.0–IG.2), importing abstract Galois categories and opposite deck limits from Mathlib, boundary compactifications from AlgebraicModuliForArithmeticGeometry:R09.7d, and arithmetic spreading from SchemeAndStackFoundations. Define good smooth proper/SNC pairs with the corrected union-of-coordinate-hyperplanes charts, boundary-tame covers and the tame quotient. Extract Kerz–Schmidt compactification independence and curvewise tameness only in the original hypotheses. For a strictly henselian DVR that is a G-ring, prove the complete-trait cover equivalence, Néron–Popescu smooth-subalgebra approximation, descent retaining tame valuation data, and Artin approximation. Export separately v1 Corollary2.6(1) special-fibre equivalence, (2) generic-fibre full faithfulness and (3) surjective tame specialization, with paths and inertia equivariance along integral sections. This v1 section is deliberately cited by the journal, despite having been removed from v2. Then extract Drinfeld Corollary5.2's tangent-direction ramification detection and Lemma5.3/Theorem2.15's arithmetic section construction. The final interface is the arithmetic unramifiedness test used on journal p315; do not infer arithmetic extension from geometric factorization alone. Resolve the localization-versus-completion and valuation-descent gates. Suggested file TauCeti/AlgebraicGeometry/FundamentalGroup/TameSpecialization.lean.

### 3. ArithmeticLocallySymmetricSpacesSuperrigidity — reject

Reject pending exact Margulis VIII.3.4(a), Borel-density and H¹-vanishing module hypotheses. ALS.0/1 provides the underlying quotients/local systems, and Proposition3.3 is a legitimate extension, but a direction and cited theorem number are not the missing supplier contract. Corrected074 makes the overfield descent sufficient without claiming the original Margulis source has been audited.

Extend Arithmetic locally symmetric spaces and their cohomology (ArithmeticLocallySymmetricSpaces) beyond ALS.0–ALS.1. Import adelic arithmeticity and component finiteness from AdelicAlgebraicGroups and ShimuraVarieties:V0, and the generic adjoint centralizer/descent interfaces from ReductiveGroupsArithmeticPartII. State real rank at the Q-simple factor level, permitting compact real factors in restrictions of scalars and forbidding rank-one Q-simple factors. Decompose the effective arithmetic lattice into a finite-index normal product, prove the commuting-normal-Zariski-closure argument, and extract Margulis VIII.3.4(a) with its extension Ω'/Ω and all lattice assumptions. Assemble the algebraic surjections, identify a surjective adjoint endomorphism with an automorphism, extend agreement from the normal product to the whole lattice, and descend the comparison to algebraically closed Ω. The final theorem is Klevdal–Patrikis Proposition3.3: every connected neat-level component group is G^ad-superrigid over every algebraically closed characteristic-zero coefficient field. Borel density and the exact H¹-vanishing/finite-abelianization/quasi-unipotence inputs are separate source-gated theorems, not consequences inserted into the definition. This owner supplies rigidity to the compatibility argument; it must not depend on compatibility. Suggested file TauCeti/Geometry/ArithmeticQuotients/Superrigidity.lean.

### 4. ArithmeticGaloisRepresentationsSuperrigidSystems — reject

Reject pending the exact integrality/continuity, Petrov and companion interfaces. In particular G-superrigidity is not silently H¹=0, O_L-integrality cannot be weakened to S-integrality, geometric density uses a finite base field, and a common F(λ)=F is a required hypothesis. The arithmetic tangent-section step is independent of geometric specialization factorization.

Extend Arithmetic Galois representations and conductors (ArithmeticGaloisRepresentations), importing its continuous coefficient operations, the existing HodgeStructuresPartII integral-local-system interface, generic adjoint centralizers and Conj from ReductiveGroupsArithmeticPartII, tame specialization from InverseGaloisPartIITameSpecialization, and finite-field G-companions from GlobalShtukasPartIICompanions. Define G-superrigidity exactly as Definition2.2 with algebraic automorphisms, not inner conjugacy. Prove Lemma2.1's unique group extension and rationality separately from Simpson's continuity theorem. Build coefficient-place completions, the finite Out(G)-torsor, stabilizer descent fields and the explicit common-field hypothesis. Extract the EG18/KP22 integrality variant rather than replacing superrigidity by H¹=0. Starting from Petrov's individual N_λ, use the gcd exceptional set, tame companions, geometric density, and superrigidity to kill the specialization kernel; then separately kill integral-section inertia and apply the tangent-curve ramification test. Final results are Proposition2.3(1) uniform extension over one O_F[1/N'] and (2) fibrewise companionship up to τ(λ,λ',v), followed by Proposition2.8's symmetry-breaking criterion for τ to be inner. Record central twists as counterexamples to the non-adjoint uniqueness shortcut. No common F(λ), motivicity or untwisted companionship is built into the abstract assumptions. Suggested file TauCeti/NumberTheory/Galois/SuperrigidSystems.lean. Independent-review contracts: item031 requires O_L-integrality; use compact integral points over a finite coefficient-place completion in item033. The geometric-density argument044 is over a finite base field. The common F(λ)=F hypothesis is required, not derived from separate finite descent fields.

### 5. GlobalShtukasPartIICompanions — reject

Reject the additional companions design until the original group-preserving companion theorem and tameness/recognition hypotheses are supplied. Import the accepted Kisin–Zhou GS.6/Chin coefficient/twist route, then isolate the higher-dimensional G-reconstruction genuinely beyond it. GS.5 gives only a one-way general-group parameterization; DWP.7–8 gives weights, not this reconstruction. No new duplicate GL_n companion owner is accepted.

Build on Global shtukas and Langlands over function fields (GlobalShtukasAndFunctionFieldLanglands), importing the actual GL_n global correspondence GS.6 and its finite-determinant/purity restrictions, not the one-way general-group parameterization GS.5. Coordinate the previously routed Chin inputs in PAPER-KISIN-ZHOU-25 and CHT17; do not duplicate their basic GL_n existence. Extend to Drinfeld's smooth finite-field-variety companions and the connected-monodromy reconstruction needed to retain a prescribed connected adjoint G-valued representation. Either fully extract Drinfeld2018's pro-semisimple comparison or justify the paper's permitted Drinfeld2012-plus-Chin route, including all determinant, normalization, embedding and dense-image hypotheses. Define companions by common semisimple Frobenius quotient classes. Prove the curvewise tameness/Swan comparison using Kerz–Schmidt and Deligne, and the density-one recognition of Remark2.5 by extending BHKT Proposition6.4 from curves with Chebotarev. Keep connected versus disconnected monodromy explicit. The final export gives the tame G-companion used in Proposition2.3 without the later Shimura compatibility theorem; no crystalline p-companion or motive is produced. The original-proof and hypothesis gates listed in this extraction must be discharged. Suggested file TauCeti/NumberTheory/FunctionField/GroupCompanions.lean. The accepted Kisin–Zhou25 source route already places basic GL_n/Chin plainness and twist interfaces in GS.6. Import that work and identify the additional higher-dimensional G-structure reconstruction separately. DWP.7–8 provide weight and geometric-semisimplicity inputs, not a general G-companion theorem. This enlarged design remains a source-acquisition task until an exact original G-companion contract is supplied.

### 6. HodgeStructuresPartII — accept

Accept the corrected extension of the already accepted HodgeStructuresPartII candidate. The one item is an O_L-integral group-valued realization with explicit model, field and conjugator, whose finite-place completions are shared by the consumers. Full integral realization, S-integrality and strong integrality remain distinct. The area now agrees with the accepted candidate; no new carrier or integrality theorem is smuggled in.

Reuse the existing HodgeStructuresPartII design, extending Hodge structures (tauceti:TauCetiRoadmap/HodgeStructures), and preserve its established ownership of variations, representation/Betti moduli and integral versus strongly integral local systems. The input needed here is an integral group-valued representation with the number field, integral group model and conjugator recorded, compatible with all coefficient-place completions. Import affine reductive carriers and representations from the pinned libraries and upstream ReductiveGroups rather than rebuilding Hodge fibres or algebraic groups. Coordinate EG18/KP22 and the source-gated integrality variant on journal p313 with ArithmeticGaloisRepresentationsSuperrigidSystems: this route does not claim superrigidity is identical to cohomological rigidity, or prove Simpson motivicity. Test a trivial integral object, dependence on the chosen integral model and the distinction between one local lattice and one global integral realization. No additional duplicate integral-local-system roadmap is proposed. Suggested interface file TauCeti/Geometry/Hodge/IntegralLocalSystems.lean. The integral realization is over the full ring of integers O_L; localizing at S is not a substitute. Keep the group model as data, prove finite-extension transport to O_L′, and compare model changes explicitly. Area and candidate identity match the accepted Landesman–Litt/Esnault–Groechenig proposal; Liu–Zhu adds a compatible early Higgs prefix but its pending review is not used as acceptance evidence.

### 7. ShimuraVarietiesCompatibleSystemsPartII — reject

Reject pending the original soft-integral-model and canonical-reciprocity leaves and the unresolved supplier contracts above. The mathematical nonisogeny/norm repairs are now reviewed and the component index corrected, but this does not close PSTEG/Ullmo–Yafaev/Margulis/companion prerequisites or the supplementary Serre/open-image source range. Theorem3.10 is retained as an adjoint quotient-class target with one uniform bound.

Extend Complex Shimura varieties and canonical models (ShimuraVarieties), importing V4/V7/V8.general's canonical tower, reciprocity and Betti–étale local system with its right-action convention. Share this carrier with HodgeTateAndCanonicalSubgroups:T6:comparison without requiring the logarithmic comparison theorem here. Import higher-rank lattice rigidity from ArithmeticLocallySymmetricSpacesSuperrigidity, the abstract uniform ramification and symmetry-breaking criterion from ArithmeticGaloisRepresentationsSuperrigidSystems, and irreducible/isogeny-separated tori and norm valuations from ReductiveGroupsArithmeticPartII. Construct the soft SNC-complement integral model with uniform special-point integrality using PSTEG Theorem4.1. Prove the five parts of Proposition3.7 separately, including the strengthened pairwise nonisogeny needed by E2. Compute special Frobenius via q and Eq.(6)–(7), resolving the fixed-hyperspecial-position gap E4 with a proved general-uniformizer or stronger integral-position argument. Establish cyclic density and trivial outer stabilizer, then uniform fibrewise compatibility and Q-rationality of the quotient point. Final Theorem3.10 assumes neat K₀, discrete rational centre and real rank at least two for every Q-simple adjoint factor; it yields one Ntilde for every good fibre and all ℓ,ℓ'. Corollary3.12 gives pointwise systems with N(y). Separate Serre-group realization and the fixed-ℓ open-image remark from all-prime density claims. Do not import BST Theorem9.7, Patrikis's full-G follow-up or crystalline companions back into their own prerequisite. Suggested file TauCeti/Geometry/Shimura/AdjointCompatibility.lean. The continuation writes the Eq.(7) compact-character and ramified-uniformizer calculation and connects it through Eq.(6) to Assumption2.7. It requires no unramifiedness of the section field. The special-point construction uses pairwise nonisogeny justified by items094/148/149. These worker-supplied repairs are independently verified conditional on their hypotheses; the original foundational supplier gates remain open. Use representatives of G(Q)_+\G(A_f)/K₀ for the fixed X⁺ (E11), incorporating all their denominator primes into N₁. Published Getz–Hahn B.5.2 retains the integral-position hypothesis; E12 corrects the outdated A.5.2 locator. The written norm and nonisogeny repairs have passed independent mathematical review conditional on the suppliers, but the original external statements and proof interfaces remain acquisition tasks.

### 8. ShimuraVarieties — accept

Accept as a precise source request in V4/V8/V8.general: torus reflex reciprocity, canonical components and the right-action finite-level tower, with opposite deck convention and Betti comparison. Import IG.0 and SF.2, and share the carrier with T6:comparison. This accepts the owner and requested statement, not completion of V7 or the external proof leaves.

Stages: `ShimuraVarieties:V4`, `ShimuraVarieties:V8`, `ShimuraVarieties:V8.general`.

The existing canonical-model and tower stages own reflex norms, component fields, finite étale level covers and their monodromy. Add the precise opposite-deck-group construction, Eq.(3), Lemma3.2 and the Betti comparison here; share the carrier with T6:comparison rather than creating a second local system. Read V8 and V8.general together: V8 owns the algebraic level/Hecke tower; V8.general imports V7 for all data. Import the finite-étale Galois-category/π₁ carrier from IG.0 and sites/coefficient comparison from SF.2, sharing the canonical local system with T6:comparison. This source request specifies those tower adapters; it does not certify the canonical-model proofs.

### 9. SchemeAndStackFoundations — accept

Accept as a general scheme-foundation source request. SF.0 owns the spreading and separated finite integral-point descent adapters; R09.7d supplies the chosen SNC compactification and route7 retains the stronger uniform special-point theorem. The pinned stalk-spreading theorem is a partial ingredient, not the full requested conclusion.

Stages: `SchemeAndStackFoundations:SF.0`.

Finite-presentation spreading and separated integral-point descent belong to the general scheme/morphism foundations. The special theorem that all special points are uniformly integral remains a new Shimura input. A pinned near match, AlgebraicGeometry.spread_out_of_isGermInjective (SpreadingOut.lean:335), spreads a stalk morphism; it does not spread smoothness/projectivity/SNC strata or prove separated integral-point descent. The source request is for precisely those general scheme adapters, with compactification supplied by R09.7d and uniform special-point integrality kept in route7.

### 10. ReductiveGroupsPartII — accept

Accept as the integral-position theorem in the existing RG2.3 hyperspecial/parahoric owner. Published Getz–Hahn B.5.2 has been read and retains the model/Borel/torus compatibility. This does not assert it applies to the arbitrary torus of Lemma3.9; that application is replaced by the conditional general-uniformizer argument.

Stages: `ReductiveGroupsPartII:RG2.3`.

The hyperspecial/parahoric owner supplies the integral-model maximal-torus bounded-subgroup theorem, with the integral-position hypothesis from Getz–Hahn. Generic unramified tori must not silently satisfy it. Item092 remains a separate source target. The repaired infinite-order application no longer depends on its claimed applicability to the chosen torus. Use published Getz–Hahn B.5.1–2, p549, now independently collated against the author draft; apply it only to the chosen integral torus/Borel/model triple. Macdonald/SGA3 proof leaves are acquisition work inside this owner.

## Reviewed source findings

Eleven findings are confirmed with the scope below. E7 is rejected as a confirmed misprint. None is presented as a counterexample to the main adjoint compatibility theorem.

### E1 — confirmed (gap)

**Locator:** Journal §2 p312, after Lemma2.1; v2 §2 p8

Add quasi-projectivity of X_F, or make the existence of the stated smooth projective SNC compactification an explicit hypothesis as v1 did.

Confirmed as a missing compactification hypothesis. The printed smooth finite-type assumption alone does not imply quasi-projectivity. A smooth proper nonprojective split toric example (Fujino–Payne, arXiv:math/0510679v2, introduction) cannot be an open subvariety of a projective variety: the open immersion would also be proper and therefore closed. v1 explicitly assumes the compactification; v2 and the journal assert existence. The Shimura application is quasi-projective.

### E2 — confirmed (gap)

**Locator:** Journal Lemma3.9 p327 first proof paragraph; Theorem3.10 p331; Proposition3.7(3) pp324–326; same step in v2

Retain pairwise nonisogeny, or inequivalence of rational character representations, as the separation property. At the auxiliary split primes in Proposition3.7 choose a split torus in one factor and an anisotropic torus in the other; prove this stronger property survives the twist.

Confirmed as a gap in the rational-character inference, not a counterexample to the main theorem. Independent A2 computation: the root/weight intertwiners are m[[2,-1],[-1,2]] over Z, all with determinant3m², though they give the same rational irreducible S3 module. Integral nonisomorphism does not imply rational nonisomorphism. The split/anisotropic local separation and torus-cocycle descent repairs in094/148/149 give the stronger contract; the multiplicity-free argument110/118 is valid conditional on the named global/local suppliers.

### E3 — confirmed (error)

**Locator:** Journal Lemma3.6 p323 first sentence of proof; v2 §3.3

Replace each arbitrary open subgroup K_v by a product of sufficiently small open subgroups contained in it, then apply the factorwise argument. The tori do decompose.

Confirmed. In PGL₂(Q₂)×PGL₂(Q₂), take the preimage of the diagonal S₃ in the reduction of PGL₂(Z₂)². It is open and proper with both full projections, so is not a product. A contained product of small open subgroups suffices for the proof. No change to Lemma3.6’s conclusion is needed.

### E4 — confirmed (gap)

**Locator:** Journal Lemma3.9 p328 after Eq.(7); v2 p22; published Getz–Hahn Appendix B.5.1–2 p549 (draft A.5.1–2 pp482–483).

The published Getz–Hahn B.5.2 statement requires T_model⊂B_model⊂G_model over O_F. Prove that integral-position condition for the torus used here, or avoid claiming E(s_K₀)_w/Q_p unramified and evaluate Eq.(7) with a general uniformizer, giving v_p(χ(N μ(π_w)))=e⁻¹∑_σ〈χ,σμ〉.

Confirmed for the cited inference. Published Getz–Hahn B.5.1–2 p549, as well as draft A.5.1–2 pp482–483, explicitly uses an integral torus in an integral Borel of the chosen model. The GL₂/Q₃ calculation gives the printed equality’s missing-position diagnostic. The source does not establish that position. The separate arbitrary-uniformizer valuation repair is mathematically valid and bypasses the unramified-section-field claim; it does not prove that intermediate claim. All three pages of the current author errata were checked, with no relevant change.

### E5 — confirmed (misprint)

**Locator:** Journal Remark3.8 p327; v2 Remark3.8 p20

The intended comparison is with the special-point construction in Proposition3.7.

Confirmed index slip. The construction with the numbered conditions is Proposition3.7. The source’s Lemma3.2 is a different reciprocity computation, and no Proposition3.2 exists.

### E6 — confirmed (misprint)

**Locator:** Journal Lemma3.9 p328 after Eq.(7); v2 p21

Read characters, not cocharacters.

Confirmed type slip, including the journal page image. χ is evaluated on a torus element and is an element of the character lattice; its domain is T and its codomain G_m.

### E7 — rejected (misprint)

**Locator:** Journal Lemma3.9 p329 first paragraph after the norm computation; v2 p22

Read nonzero dominant in each Q-simple factor, sufficient to find some positive-root pairing; do not require membership in the strict interior of the dominant chamber.

Rejected as a confirmed misprint or mathematical error. The source immediately explains nontriviality on each factor and uses only one positive-root pairing; it does not invoke positivity on every simple root. The A2 example refutes an interior-of-chamber interpretation but does not show that this interpretation was intended. Retain the precise nonzero-dominant formulation in the extraction and its boundary test, without registering the wording itself as a proved mistake.

### E8 — confirmed (error)

**Locator:** arXiv v1 §2 p7, first bullet defining relative normal crossings; section deleted in v2, journal p314 footnote3 still points to v1

Use an étale-local union of coordinate hyperplanes, with equation t₁⋯t_r=0, rather than a single coordinate linear subspace.

Confirmed for the v1 definition, which the journal still references. A coordinate linear subspace cannot model the crossing xy=0; for codimension≥2 it is not even a Cartier divisor. Read all of v1 pp7–11. The section was deleted in v2, not replaced by a corrected definition, and journal footnote3 explicitly points to it. Remove the completion summary’s claim that publication corrected it. This is not a disproof of tame specialization with the proper SNC definition.

### E9 — confirmed (misprint)

**Locator:** Journal abstract p305; arXiv abstract and v2 p1

Specify compatibility of their adjoint projections, or say G^ad(Q_ℓ)-valued systems.

Confirmed only as an abstract scope omission. Its first displayed family is already adjoint; the later stronger-family sentence names G-valued local systems without mentioning projection. Theorem3.10 and Remark3.14, and the author’s bibliography, confine the proved compatibility to their adjoint projections. Do not interpret this as a counterexample to a claimed full-G theorem.

### E10 — confirmed (misprint)

**Locator:** Journal Lemma3.9(2) p327

Use a∈G(A_f), as fixed in the lemma's opening sentence.

Confirmed in the journal image: the local component refers to the previously fixed finite adele a, so A_f is intended. The relevant v2 p21 passage already uses A_f correctly; this journal slip is not present there.

### E11 — confirmed (misprint)

**Locator:** Journal Theorem3.10 proof p330, first paragraph; arXiv v2 p23; compare Eq.(4) journal p319

For a fixed X⁺ take representatives of G(ℚ)_+\G(𝔸_f)/K₀, as in Eq.(4), and form N₁ using all of them.

The proof fixes X⁺ after choosing C, then treats those C-indexed components as all components. For the genus-two Siegel datum GSp₄ and neat principal K(N), N≥3, g=diag(-I₂,I₂) is rational with multiplier -1. Thus 1 and g have the same G(Q) double coset. If they had the same positive-G double coset, taking multipliers would give a positive rational finite unit times a unit congruent1modN equal to -1; the rational unit must be1, contradicting -1≠1modN. This example satisfies real rank2. The missing plus omits a component; using the correct finite set repairs the argument, without changing the theorem.

### E12 — confirmed (misprint)

**Locator:** Journal Lemma3.9 p328, citation [14, Lemma A.5.2]; bibliography [14] journal p334

In the cited 2024 published Getz–Hahn book, use Lemma B.5.2, p549; A.5.2 is the 22April2022 draft locator.

The journal bibliography cites the 2024 Springer book. The public published backmatter has the integral-torus lemma at B.5.2 p549, whereas the author draft has it at A.5.2 pp482–483. Both were read, and the published page image was inspected. This numbering correction is separate from the applicability gap E4.

## Remaining closure work

- **G1 — Original integrality and continuity input (open):** Original supplier statements and exact dependency interfaces remain required; listing a citation or route does not close this gap.
- **G2 — Non-complete-trait tame specialization (open):** Original supplier statements and exact dependency interfaces remain required; listing a citation or route does not close this gap.
- **G3 — Companions and arithmetic ramification (open):** Original supplier statements and exact dependency interfaces remain required; listing a citation or route does not close this gap. Correct the inherited supplier name to Kerz–Schmidt (the cited tameness source), not Kerz–Saito.
- **G4 — Higher-rank lattice and group-theoretic sources (open):** Original supplier statements and exact dependency interfaces remain required; listing a citation or route does not close this gap.
- **G5 — Rational versus integral torus separation (open):** The strengthened nonisogeny, rational-torus-descent and multiplicity-free density arguments are independently verified conditional on their hypotheses. Original anisotropic-torus existence, approximation and H¹ suppliers in G4 remain open.
- **G6 — Fixed hyperspecial position and general-uniformizer repair (open):** General-uniformizer valuation, compact-character vanishing, positivity and the Eq.(6)–(7) application independently verified. Published-book collation completed. Finite-extension/topological/reflex-reciprocity and Macdonald/SGA3 supplier proofs remain open; the source’s intermediate unramified-field assertion is not certified.
- **G7 — Soft integral model and canonical-tower leaves (open):** Original supplier statements and exact dependency interfaces remain required; listing a citation or route does not close this gap.
- **G8 — Supplementary Serre-group and open-image remarks (open):** Original supplier statements and exact dependency interfaces remain required; listing a citation or route does not close this gap.
- **G9 — Baseline-to-stage closure and finer supplier IDs (open):** Original supplier statements and exact dependency interfaces remain required; listing a citation or route does not close this gap.
- **G10 — Independent verification of source findings (resolved):** Independent review finished: eleven of twelve findings confirmed with the recorded scope, E7 rejected. This closes verification of these records, not original-source proof closure.

The JSON retains all 150 item statements, source locators, dependencies, APIs/tests, 16 prerequisite groups and detailed gap descriptions. These records expose the remaining source acquisition rather than treating bibliographic names as theorem nodes. Completion requires extracting those original statements with their hypotheses, adding their dependency nodes, reconciling exact owners and then revisiting routes 1–5 and 7.

## Validation

The paper checker, five-deliverable intake check, independent dependency/route/API audit and exact arithmetic diagnostics are recorded in the review and handoff. The fresh diagnostics contain 89 checks: A₂ integral/rational intertwiners, the diagonal finite quotient, fixed-model torus position, 75 ramified norm exponent cases, torus-cocycle descent, nonregular dominance, the GSp₄ component example and a crossing divisor. They test the concrete obstructions and computations; they are not proofs of the original supplier theorems. The inherited 11,567-check run was not rerun and is retained only under `previousChecks`.

No Lean file is required or permitted among this issue’s deliverables, and none was compiled. Planning APIs/tests are not formalized declarations.

Final atlas refresh: `ca5c885d4dcda14db02150265c0fd480dd49817e`. Final atlas refresh checked all sixteen changed paper-result/review files by status and route ownership; relevant fresh overlaps were read in full. Clausen–Mathew routes5/6 retain algebraic spaces and noetherian approximation/henselization at SF.1/SF.0, reinforcing route9. Xu–Zhu route3 and items41/46 concern the special Kloosterman/Bessel companion and monodromy problem, not the general higher-dimensional G-companion theorem042. Tsuzuki route3/item134 imports generic mixed p-adic coefficient Chebotarev from the shared arithmetic-D-module owner; it does not replace the l-adic G-reconstruction required here. Binda–Kato–Vezzani, Breuil et al., BLZ and IKM introduce no replacement owner for this review’s missing interfaces.

The final refresh also checked Guo–Reinecke’s newly reviewed prismatic/crystalline-coefficient, arc and formal-duality routes; they do not change this review’s ownership decisions.
