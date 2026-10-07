# Independent review: Hodge–Tate theory and canonical subgroups, T0–T5

Job `REV-HodgeTateAndCanonicalSubgroups--T0`, issue #432. Reviewer: Codex (GPT-6), session `codex-Pz1YiZ`, independent of the original Claude planning run. Review date: 2026-10-07. **Verdict: needs_changes.** This is a finished review, not a checkpoint of the review task.

All 56 nodes were examined at target granularity, including their mathematical statements, hypotheses, proof routes, dependencies, source passages, API outlines, tests and planets. The corrections below address established errors; they do not certify the remaining integral, boundary or Tannakian arguments. The packet has 19 unverifiable nodes. An honest gap does not itself require rejection: here several declared targets still need their actual carriers/hypotheses and a sound route, and the geometric Lean signatures are absent. These are revision obligations, rather than requests to split target proofs into lemma nodes.

## Counts and coverage

| Item | Result |
|---|---|
| Nodes | 56: 13 verified, 24 corrected, 19 unverifiable; 0 added |
| Kinds | 11 definitions, 12 constructions, 25 theorems, 5 lemmas, 3 comparisons |
| API / mathematical test outlines | 128 API items; 79 tests, including a new chart-action counterexample |
| Definition/construction coverage | All 23 have at least three mathematical test outlines; most remain untyped in Lean |
| Source excerpts | All 117 normalised literal excerpts matched their supplied source text; surrounding statements were read |
| Baseline | All 24 original entries inspected at the pins; 23 retained, one malformed indexed name removed/replaced by documented existing category API |
| Suppliers | 60 original distinct external references inspected: 52 declaration nodes and 8 stage contracts |
| Gaps / requests | 15 explicit gaps (4 originally), 14 supplier requests (9 originally) |
| Planets | 25, with per-stage counts 6/1/5/5/3/5; no new planets |
| Stage coverage | All six marked partial with precise remaining work; packet status partial |

The previous complete/planned flags were not supported by the integral and geometric targets. The checker does not allow a complete packet below its 300-node budget with unplanned stages; therefore the packet itself is partial. This does not make the independent review unfinished. No existing owner or atlas data was edited.

## Established corrections and diagnostic examples

1. **Conormal versus inverse different.** For μ_p over a p-torsion-free valuation ring R, ω_{μ_p} = R/pR, while the inverse different restricted along the unit is p^{−1}R. A torsion module is not an invertible fractional line. T0/degree-different now gives e*D^{−1} = δ_G^{−1}; δ_G = Fitt₀ω_G. It distinguishes the B-ideal different (Fargues’s Δ_{B/A}) from the discriminant norm over A. The trace/generic-isomorphism argument now directly imports this target.
2. **Multiplicative characters.** With T the character lattice, G = T^∨⊗μ_{p^∞} and ω_G = T⊗ω_{μ_{p^∞}}. The determinant uses det T, not (det T)^{−1}, and no transpose. Normalise p^{−r}det λ₀ on the lattice before tensoring with the base ring. For [p] this gives the identity even when division by p in O_S is impossible.
3. **Isogeny divisors.** Quotienting the Tate curve by μ_p extends on the toric chart as t↦t^p with finite flat kernel μ_p; it is not the promised non-finite-kernel example. Replaced that test and qualified v_x(δ_H)=deg H_x by finite-flatness of H_x. Corrected Pilloni attribution.
4. **Semi-abelian boundary.** An arbitrary semi-abelian scheme does not have the claimed dual semi-abelian scheme. Verschiebung needs its smooth commutative-group construction over general F_p-bases. PS16’s boundary carrier is a polarised one-motive [Y→G̃], not the finite-flat Cartier dual of the whole quasi-finite G[p^n]. Normality plus a dense characteristic-zero open does not prove uniqueness modulo p^n. These corrections are in the statements, with exact remaining chart inputs recorded.
5. **Relative comparison.** Removed the naive family identity gr⁰ OB_dR=Ô and the ordinary-density proof. Use the two B_dR^+-lattices M,M₀ of CS17 §2.2. Removed CP.1/hodge-tate-specialization, which specialises AΩ and supplies no comparison with the abelian character-differential map. P8 is asked for the actual compatibility theorem and conventions.
6. **Tensors and Levi torsors.** B1 supplies rational homology tensors. It does not give integral tensors and a G(ℤ_p)-torsor for arbitrary Hodge-type level. The tensor/frame assertions are rationalised, and an integral variant requires an explicit lattice/model. The Levi comparison uses the common Tate-motive trivialisation torsor and equivariant descent from CS17 §2.3; a raw untwisted identification of all graded frames is insufficient.
7. **Plücker charts.** The index set is all g-subsets of {1,…,2g}, of size binomial(2g,g), not the 2^g subsets choosing one vector from each symplectic pair. For g=1, γ=(1 0;1 1) maps z to z/(z+1). The image of the unit-disc chart contains 0 and ∞, and equals neither standard chart. Removed the full-group permutation claim, repaired the kernel-line/quotient-bundle test, and added the counterexample. The paper also prints the permutation assertion: new source issue E28 records precisely this auxiliary error, not a failure of its period-map theorem.
8. **Canonical-subgroup differentials.** AIP15 Proposition 3.2.1 gives the differential isomorphism only modulo p^{n−δ}, δ=w(p^n−1)/(p−1). The raw dual Hodge–Tate map has cokernel degree w/(p−1), which is positive when w>0. Removed ω_{C_n}=ω_G/p^n and the claimed raw isomorphism. The later modified lattice is where the smaller-quotient isomorphism belongs.
9. **Radii and coordinates.** The Siegel Atkin–Lehner statement needs ambient p^nε<1/2, not merely ε<1/2. In BHW’s kernel-line convention z=−HT(e₂)/HT(e₁), and HT(e₁) generates the quotient line. The quotient-line action is det(γ)^{−1}γ, with adjugate on pullback frames, producing cz+d. Its cocycle is matrix multiplication; its derivative is det(γ)/(cz+d)². Denominator/unit domains are explicit.
10. **Ramified balls.** Integral balls use (O_p⊗O_C)^∼, not the tensor order itself. For F_v ramified quadratic, the order O_C[T]/(T²−p) embeds in O_C×O_C with a nontrivial divisibility relation between the two coordinates. Generic σ-projections do not split the integral order. Restricted Γ₀(p) preservation to r<1; at r=1 the second-chart denominator may vanish.
11. **Igusa comparison.** The generator ψ:O_p/p^m→H_m^∨ is an isomorphism of finite modules; the full-level map φ to the Igusa space is not an isomorphism of spaces. It does not factor through Γ₀-level, which forgets the generator. The diagonal d action is stated with α′=α∘γ^∨.
12. **Modified lattices and sheaves.** Use the torsion-free image/strict transform after the blow-up, not raw pullback. The PS16 p=2 exponent is 2, not a blanket 1/(p−1). Removed C6’s HBAV minimal-space supplier as evidence for GSp₄/F. Distinguished local rank-six exterior factors from the determinant line under restriction of scalars. Removed the duplicate aipSheaf constructor: O5 owns associated weight sheaves. There is no AL_∞; infinite-level comparison uses the forgetful map. p-Hecke is a precise O6 request.

Four excerpt-page locators were repaired: SCH15’s quoted proof of III.2.8 is PDF p.34 (not 35); BHW’s quoted §7.1 passage is p.29 (not 28); Theorem 7.14 is p.31 (not 30); Lemma 3.19 is p.13 (not 12). FAR11 source issue E16’s Proposition 11 is in §6.6, not §6.5. Source match text is not treated as proof of the broader statement.

## Pinned baseline audit

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each source file was read at the cited commit, not at current main. The reviewed coverage file has no reviewed T0–T5 record; AUDIT-37 is unreviewed and supplies no certification. Affine conormal, Cartier duality, Grassmannian and dynamic point subgroups remain consumed library material. No general Fitting-ideal, full cotangent/co-Lie-complex, or relative geometric Hodge–Tate API was established by the baseline audit.

The original `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` ref omits the TauCeti namespace. The pinned file explicitly opens both namespaces and defines `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`. The declaration index does not recognise the correct full name. Removed the malformed baseline entry, replacing its edges with the existing category entry, whose provides text explicitly documents the independently checked associated duality API. This is an index defect for the orchestrator to fix; it is not a new Cartier duality target.

| Originally cited declaration | Independent conclusion |
|---|---|
| `tauceti:TauCeti.Bialgebra.AugmentationIdeal` | Counit kernel over commutative bialgebra; affine component only. |
| `tauceti:TauCeti.Bialgebra.CotangentSpace` | Augmentation I/I²; no sheaf or p-divisible bundle theorem. |
| `tauceti:TauCeti.Bialgebra.cotangentMap` | a ↦ [a−ε(a)], giving [g−1] on characters. |
| `tauceti:TauCeti.Bialgebra.cotangentMap_mul` | Counit-weighted Leibniz rule, additive on group-like elements. |
| `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` | Existing finite/flat/lfp commutative affine category over CommRingCat. |
| `tauceti:FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` | Full namespace verified in source; malformed index alias removed as explained above. |
| `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` | Cartier duality/base change isomorphism confirmed. |
| `tauceti:TauCeti.Cocharacter.parabolic` | Subgroup of algebra-valued points; does not supply representability or torsors. |
| `tauceti:TauCeti.Cocharacter.levi` | Centraliser subgroup of points; does not supply the algebraic quotient map. |
| `tauceti:TauCeti.Huber.Pair` | Huber ring with integral-elements subring and its required hypotheses. |
| `mathlib:Ideal.Cotangent` | Ideal cotangent I/I²; reused affine carrier. |
| `mathlib:KaehlerDifferential` | Affine differentials, not a cotangent complex or scheme-sheaf construction. |
| `mathlib:IsGroupLikeElem` | Counit 1 and comultiplication g⊗g. |
| `mathlib:Module.Grassmannian` | Submodule with locally free rank-k quotient, matching quotient convention. |
| `mathlib:Module.Invertible` | Invertible module via the evaluation/contraction criterion. |
| `mathlib:Module.length` | Module length valued in ℕ∞; not the real Fargues degree. |
| `mathlib:LinearMap.det` | Endomorphism determinant; usual properties require finite freeness, not a map of different bundles. |
| `mathlib:Valuation` | Multiplicative ordered-monoid-with-zero valuation; additive real conversion is additional. |
| `mathlib:ValuationSubring` | Valuation subring of a field. |
| `mathlib:PadicInt` | p-adic integral subtype with Fact p.Prime. |
| `mathlib:PadicComplex` | Completion of the p-adic algebraic closure. |
| `mathlib:IsAdicComplete` | Hausdorff plus adic precompleteness. |
| `mathlib:AlgebraicGeometry.Scheme` | Scheme carrier only. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` | Relative normalisation of schemes, not formal normalisation. |

## Supplier closure and ownership

The original 60 external references were read individually, including the eight stage-only contracts. Ordinary imports that match their scope include A3 Weil pairings (requested, not falsely present), A4 Hodge filtration, R07.1 Cartier dual/Tate module carriers, R2 generic-fibre/blow-up/section-domain interfaces, B0 parabolic convention, B1 rational tensor propagation, B2 associated bundles, CP.0/H0 twists, PEL M0 datum/determinant conditions, P0 almost setup, S0’s diamond and level tower, C5’s normalised Koecher theorem, C6’s actual HBAV Hasse/near-ordinary interfaces, and H2/H4 Hilbert models/levels. These imports do not eliminate the additional hypotheses below.

| Supplier family | Required correction or limitation |
|---|---|
| R07.1 dimension and dimension-plus-dual | Complete noetherian local scope does not cover O_C. Added extension request and integral Faltings/finite embedding gap. |
| R07.1 Raynaud uniqueness/prolongations | Small-ramification DVR uniqueness is not the degree-monotonicity theorem over a general valuation ring; removed these direct edges from that argument. |
| R07.2 Frobenius–Verschiebung | Existing node is over a field. Arbitrary-base BT₁ request remains with R07.2; semi-abelian construction/chart request is separate with C4. |
| NeronModelsAndSemistableAbelianVarieties R11.3 | Complete-DVR Raynaud/uniformisation and a semistable characterisation do not provide existence/descent for every C-point. Added precise request. |
| CP.1 Hodge–Tate specialisation | AΩ specialisation is the wrong theorem for the character-map comparison. Removed the edge. |
| P8 | Extend precise request to corrected relative sheaves, M/M₀ and compatibility with the integral character map. |
| B1, dynamic parabolic/Levi, D3 | Rational tensors are available; integral frames, Tate-normalised Levi comparison, representability and general filtered-Tannakian local splitting are not supplied by these statements. |
| C4 degeneration/isogeny/Tate interfaces | Retain good-prime/model hypotheses. They do not automatically provide the full boundary one-motive torsion carrier and mod-p^n gluing. |
| C5 and C6 compactifications | C5’s normalised Koecher theorem is relevant. C6/hilbert-minimal-normal-projective is for HBAV, not GSp₄/F; removed that edge. Check the precise model, formally canonical coefficients and mod-p^k pushforward. |
| AdicEtaleGeometry A1 | Corrected pro-étale site has analytic/local-noetherian hypotheses. It does not make the PIL20 étale O⁺-sheaf analytic. |
| P9 | Request exact coefficient completion, site, effective continuous descent and integral invariants hypotheses. |
| H4 and S0 | S0’s action is right; request explicit inversion/adjugate conversion and generator-level maps. Perfectoidness is not required to define the diamond-level φ. |
| O5 and O6 | O5 owns the associated weight sheaf, so its duplicate constructor was removed. O6 owns p-Hecke and its radius/normalisation compatibility. |

Additional local gaps are the full Fitting/co-Lie/trace-duality input, square-zero smooth-section rigidity, arbitrary filtered-fibre-functor fpqc splitting, p=2/ramified canonical generators, analytic O⁺ local-freeness and level independence, and the actual-height structure-group proof j∈B_m. These are explicit, not hidden in phrases such as “by normality” or “compatibility implies equality”. All remaining work appears under coverage and gaps, at target granularity; no proof-lemma proliferation was added.

The 15 gaps are dependency obligations, not claims that the intended mathematical theorems are false. In particular the source p=2 appendix and Scholze 2012 Proposition 4.15 were not independently read: the packet must not call those inputs established by this review.

## Source versions and source-issue verdicts

The original twelve public PDFs matched their recorded hashes. Their cited passages and surrounding statements were read. Published BHW §5/§7 and published Scholze §III.3 were additionally collated for the findings below. This is not a whole-paper collation of BHW or Scholze, and published BCGP, CS17, AIP15 and PS16 were not independently collated. Added full hashes and URLs for these published copies and Lan’s corrected author copy/errata to sourceVersions.

| Source | Public version checked |
|---|---|
| FAR10 | [J. reine angew. Math. 645 (2010), 1–39; author copy HNgp.pdf (29 pp.), whose page numbers differ from Crelle's](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf) |
| FAR11 | [Ann. Sci. ÉNS 44 (2011), 905–961; author copy canoniqueHN.pdf dated 20 October 2011 (46 pp.)](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf) |
| SCH15 | [arXiv:1306.2070v2 (2 June 2015); published Ann. of Math. 182 (2015), 945–1066 (numbering III.x.y = 3.x.y)](https://arxiv.org/abs/1306.2070) |
| BHW | [arXiv:1902.03985v4 (10 May 2021); published Ann. Inst. Fourier 73 (2023), 1709–1794 (§5/§7 source issues collated with the published version in this review)](https://arxiv.org/abs/1902.03985) |
| PIL20 | [Duke Math. J. 169 (2020), 1647–1807; author copy complexhidatheorygsp4.pdf (113 pp.)](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) |
| PS16 | [Ann. Math. Québec 40 (2016), 167–202; author copy koko.pdf (31 pp.), numbered differently from the published version](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf) |
| BP26 | [Invent. Math. (2026); author copy higherhidaSiegel.pdf (65 pp.)](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) |
| BCGP21 | [arXiv:1812.09269v3 (28 Nov 2021); published Publ. Math. IHÉS 134 (2021) (not collated)](https://arxiv.org/abs/1812.09269) |
| CS17 | [arXiv:1511.02418v1 (8 Nov 2015); published Ann. of Math. 186 (2017) (not collated)](https://arxiv.org/abs/1511.02418) |
| SW13 | [arXiv:1211.6357v2 (13 Apr 2013); Camb. J. Math. 1 (2013)](https://arxiv.org/abs/1211.6357) |
| AIPH | [Res. Math. Sci. 3 (2016); author copy Hilbert_adicfinal.pdf dated 16 May 2016 (40 pp.)](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf) |
| AIP15 | [arXiv:1212.3812v1 (16 Dec 2012); published Ann. of Math. 181 (2015), 623–697 (not collated)](https://arxiv.org/abs/1212.3812) |

Additional primary sources: [published BHW](https://www.numdam.org/item/10.5802/aif.3560.pdf), [published Scholze](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), [Lan, *Integral models of toroidal compactifications with projective cone decompositions* (IMRN 2017, no. 11, 3237–3280; corrected author copy)](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), and [Lan’s errata](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf). The latter is linked from [Lan’s academic page](https://www.kwlan.org/academic.html). [Scholze’s publication page](https://people.mpim-bonn.mpg.de/scholze/papers.html) lists no separate erratum for the torsion paper; the E28 knownness search is limited and explicitly recorded.

Each original source issue has a by-job confirmed/rejected review object; E28 has one too. E22 is classified as a gap/mismatched justification, not an independently disproved stronger congruence. E27 is rejected as a source mistake, while its concrete coefficient/model check remains a packet gap.

| Issue | Verdict and evidence |
|---|---|
| E14 | **confirmed**. Confirmed in FAR10 Definition 5: rank-r scaling adds kr to χ, so the compensating sign is minus and the factor r is necessary; the quotient for Λ₂⊂Λ₁ is Λ₁/Λ₂. |
| E15 | **confirmed**. Confirmed in FAR10 Corollary 5(5): the generic quotient in the asserted filtration is G″, not G. The corrected statement matches the surrounding exact sequence. |
| E16 | **confirmed**. Confirmed in FAR11 Proposition 11 (§6.6): in the standing p≠2 context the displayed branch must read p≠3, separating the p=3 case. Corrected the section locator. |
| E17 | **confirmed**. Confirmed: FAR11 Theorem 3’s cokernel argument is FAR10 Theorem 7, whereas Theorem 6 is the triple equivalence. |
| E18 | **confirmed**. Confirmed: in the induction in FAR11 Theorem 6 the initial level-one subgroup is D, so the quotient is G/D before C has been defined. |
| E19 | **confirmed**. Confirmed in BP26 §4.1.8: degree duality is Lemma 2, not Lemma 3. |
| E20 | **confirmed**. Confirmed in arXiv v4 and the published BHW equation (7.1). Pointwise height w≤ε gives v(I′_m)=m−p^m w/(p−1)≥x, hence I′_m⊂(p^x). This does not by itself verify the subsequent automorphy-factor argument. |
| E21 | **confirmed**. Confirmed in arXiv v4 and published BHW Lemma 7.2. For dimension g>1, equality of the kernel with I_mω⁺ would force deg ω_{H_m}=g(m−δ), contradicting deg H_m=mg−δ when δ>0. The needed weaker containment ker π⊂I_mω⁺ still requires the canonical-subgroup differential theorem. |
| E22 | **confirmed**. Confirmed as a mismatch with the cited canonical-subgroup bound: Proposition 5.19(1) states 1−δ, δ=ε(p^n−1)/(p−1), not 1−ε at level n. The stronger congruence is not disproved here; classified as a missing justification, not an established false theorem. The mismatch persists in the published §5.2. |
| E23 | **confirmed**. Confirmed in arXiv v4 and published proof of Proposition 5.18: for ramified F the integral tensor order is not the product of O_C over embeddings. Generic projections and the normalisation must be distinguished; the repaired congruence argument remains a gap. |
| E24 | **confirmed**. Confirmed in arXiv v4 and published Lemma 7.9/proof: on W_k, v(δ_κ) may be p^{1−k}, so ε_κ≤p^{−(k+r)}, while ε^can_{k+r}=p^{−(k+r+1)}. Level k+r−1 has the needed bound (the k=0 endpoint can admit a stronger level). |
| E25 | **confirmed**. Confirmed in arXiv v4 and published Proposition 5.19(2): the differential and cokernel statement is AIP15 Proposition 3.2.1, not its 3.2.2. |
| E26 | **confirmed**. Confirmed in BCGP arXiv v3 §6.5.1: evaluating v after reduction mod p truncates each elementary divisor at 1; μ_{p²} has ω=R/p² and degree 2, while the printed truncated sum gives 1. This review does not claim a collation with the published BCGP version. |
| E27 | **rejected**. Rejected as a source mistake. Lan Theorem 8.7 explicitly addresses normalised models and arbitrary coefficient algebras with formally canonical sheaves (Definition 8.5). A toroidal boundary divisor is not an obstruction to this theorem. The concrete model/coefficient and determinant-descent checks remain gaps in this packet. |
| E28 | **confirmed**. The explicit g=1 matrix counterexample disproves permutation of the finite Plücker chart family; it occurs in both the arXiv and published text. |

## API, tests, Lean and planets

All 23 definitions/constructions have at least three proposed mathematical tests. The conormal constant/μ/α_p cases, identity and [p] isogeny calculations, supersingular Hasse test, ordinary canonical case, level-n complement test, kernel-versus-quotient bundle distinction, ramified-order ball case and reversed AIP inclusion test distinguish plausible wrong conventions. Corrections were propagated into the corresponding API and test text. The AIP weight-sheaf constructor was removed to avoid O5 duplication; the classical algebraic-weight test is an imported consumer compatibility.

The API is extensive but is not yet a completed formalisation design: geometric extensionality, base-change carriers, descent and universal-property signatures must be supplied together with the missing geometric objects. Do not implement them by inventing opaque proposition fields. The partial-stage remaining lists explicitly demand section 13 completion.

The suggested file has only a small typed algebra section before its comment catalogue. It includes affine I/I², character classes, a cyclic degree presentation, an ambient quotient Grassmannian point, scalar fractional-linear/cocycle algebra and congruence submodules. The catalogue labels the remaining contracts “not stated”. Comments do not count as named Lean signatures, API lemmas or example tests. The scalar/congruence components also do not prove the geometric unit, local-freeness or Hasse-ideal estimates. Corrected the misleading label that called I_mω⊂ω^int the Hdg^{1/(p−1)} bound, qualified the Cartier name in its documentation, and regenerated the catalogue from the corrected packet. No placeholder geometry was added.

The file elaborated through lean-check at the shared pinned Mathlib, exit 0, with exactly 12 declaration-uses-sorry warnings and no other diagnostics. Available memory exceeded 20 GB before the check. The shared check lacks the pinned Tau Ceti geometric imports; the Tau Ceti declarations were inspected in source at the pin, not compiled through this suggested file. Thus compilation verifies the algebra signatures that are actually stated and does not discharge the missing geometric section 13 coverage.

Planet counts stay 6/1/5/5/3/5; names describe central objects/theorems and satisfy the six-per-stage limit. No bookkeeping checks were promoted to planets. The chosen Hodge–Tate comparison and modified-lattice landmarks remain subject to the stated gaps.

## Confirmed red-team findings: packet and reader

| Finding | Independent result |
|---|---|
| RT-AREA-padic-1/22 | Packet ownership/routing and reader introduction leave the global tower period map, equivariance and automorphic pullbacks with PerfectoidShimuraVarieties S3. T2 keeps finite/family flag and parabolic/Levi interfaces. Checked HigherHida/PAN ownership language; no general perfectoid period-map copy was added. |
| RT-AREA-padic-1/23 | The four BCGP25 Theorem 4.4.1 usual/cusp/analytic coefficient/cohomology routes are not T4–T6 targets here. Packet restructure/routing and reader leave them with TC.2 and HigherHidaAndColemanTheory as prescribed. |
| RT-AREA-padic-1/25 | CS17 classification items 52/53/143 and modification-at-∞ belong to the proposed R07 stage after R07.2, with Fargues–Fontaine vector-bundle inputs and ET.6a/IG.3 consumers. Packet and reader do not make T2 a second classification roadmap. |
| RT-AREA-padic-1/26 | BT₁ Hasse, LF, quasi-polarisations and BT₁ HT exact sequence are requested from R07.2; T0 keeps the semi-abelian/boundary extension. Both documents correctly state this ownership. Correct ownership does not resolve the arbitrary-base/smooth-group supplier mismatch found here. |

The reader document is **not** an editable deliverable of issue #432. Its ownership introduction is consistent with all four findings, but its body reproduces the pre-review formulas. It now conflicts with the corrected packet on the inverse-different/conormal identification, character determinant, 2^g charts/permutation, raw canonical HT isomorphism, kernel coordinate, Igusa-space isomorphism, rational tensor/frame convention, blow-up pullback, infinite-level AL and source E27. It also says BHW was not collated and that stages are planned. A revision must include this reader path explicitly and synchronise it before acceptance. It remains the nominal definitive reader, so this discrepancy is material to the needs_changes verdict.

## Validation and next revision

Ran `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeTateAndCanonicalSubgroups--T0.json`: **0 errors, 0 warnings**. Verified one review.checked record per node, 117/117 excerpt matches, at least three tests per definition/construction, and one review verdict for each of the 15 source issues. The Lean check above passed. No implementationStatus was changed from unchecked. No atlas or other job’s files were changed.

For the orchestrator: schedule the revision with the reader path included; repair the pinned Cartier-duality index namespace separately; assign the general co-Lie/trace-duality and filtered-Tannakian supplier ownership. The existing restructure proposals are retained. Read the packet’s 15 gaps and 19 unverifiable node records as the revision worklist, prioritising carrier/hypothesis reconciliation before expanding APIs. The review is finished; it does not claim a second job or leave a running proof attempt.

## Node-by-node record

The packet review.checked array is authoritative. “Corrected” records an in-place repair, not certification of the separately listed missing prerequisite. “Verified” is a source-faithful target under its explicit supplier/gap assumptions, not a claim of Lean implementation.

| Node (roadmap prefix omitted) | Verdict | Evidence / remaining limit |
|---|---|---|
| `T0/conormal-module` | unverifiable | Affine I/I² and the finite-group examples are correct. R07.1’s complete-noetherian-local conormal theorem does not cover the asserted general O_C/p-adically complete base; geometric sheaf API remains unstated. |
| `T0/finite-hodge-tate-map` | verified | Checked dt/t against the group-like class g−1, the Cartier dual direction, naturality and constant/multiplicative examples. Corrected the shared fully qualified Cartier baseline reference. |
| `T0/hodge-tate-map-compatibilities` | verified | Naturality and endomorphism formulas match FAR11; the Weil-pairing direction/sign is explicitly requested from A3, rather than replacing Cartier duality. |
| `T0/p-divisible-hodge-tate-map` | unverifiable | The inverse-limit character map is the correct target, but local freeness and conormal reduction over the stated general base need the R07.1 extension recorded here. |
| `T0/fargues-hodge-tate-cokernel` | unverifiable | The Fargues all-prime cokernel constant is correctly sourced by FAR10/FAR11; the finite-to-p-divisible embedding and integral Faltings input are absent from direct closure. |
| `T0/fargues-degree` | unverifiable | Valuation/Fitting definition is correct; the presentation-invariant Fitting API and co-Lie divisor comparison are non-routine missing inputs, now explicit. |
| `T0/fargues-degree-properties` | unverifiable | The printed additivity/duality formulas are correct, but the proof invokes unprovided co-Lie exact triangles and dimension over O_C. |
| `T0/fargues-degree-generic-isomorphism` | corrected | Read FAR10 Propositions 1–3 and trace-matrix argument. Added degree-different as direct prerequisite, removed inappropriate Raynaud small-ramification/prolongation citations; general duality input remains a gap. |
| `T0/fargues-divisor` | unverifiable | The divisor definition is correct; codimension-one determination is only justified in the integral noetherian setting, not all stated normal/formal bases. Record the missing general theorem. |
| `T0/isogeny-divisor` | corrected | Qualified rank-one degree by finite-flatness of the specialised kernel. Replaced the false Tate-curve μ_p non-example with its finite flat compatibility test; corrected source attribution. |
| `T0/multiplicative-hodge-tate-isomorphism` | verified | Étale-locally μ_{p^n}^r gives dual constant characters and the conormal basis dt_i/t_i, with inverse p-divisible limit. Source and tests agree. |
| `T0/normalized-multiplicative-pullback` | corrected | Character-lattice convention forces det T, not its inverse or a transpose. Normalise on the ℤ_p-lattice before tensoring, making the [p] test the identity even in characteristic p. |
| `T0/semi-abelian-torsion` | unverifiable | The finite/quasi-finite distinction and boundary height change are appropriate. One-motive torsion and the non-DVR chart/descent hypotheses still need an exact supplier. |
| `T0/semi-abelian-hasse-invariant` | corrected | Removed the nonexistent dual semi-abelian scheme from the construction. Arbitrary-base smooth-commutative Verschiebung and overlap compatibility are explicit gaps beyond the field-only R07.2 supplier. |
| `T0/hasse-invariant-ordinary-locus` | verified | The ordinary criterion and unit torus contribution match the cited fibrewise sources, conditional on the separately requested arbitrary-base Hasse construction. |
| `T0/hasse-invariant-minimal-compactification` | unverifiable | SCH15 proves Siegel minimal extension; general PEL/GSp₄/F extension is not supplied by that statement. The model/coefficient gap must be resolved for the declared generality. |
| `T0/hodge-tate-boundary-extension` | corrected | Replaced Cartier dual of quasi-finite semi-abelian torsion by polarised boundary one-motive torsion. Normality/density does not establish mod-p^n uniqueness. Concrete GSp₄/F extension remains a gap. |
| `T0/raynaud-hodge-tate-filtration` | unverifiable | SCH15’s C-point Raynaud argument is correctly identified; R11.3 only supplies a complete-DVR characterisation/uniformisation, not the required semistable existence or O_C descent. |
| `T0/harder-narasimhan-filtration` | verified | FAR10 defines the HN filtration with multiplicative slope 1, étale slope 0 and uniqueness. It consumes the separately recorded degree theory; no duplicate p-divisible classification is introduced. |
| `T0/degree-different` | corrected | Distinguished the B-ideal different from the A-discriminant norm and the torsion conormal from the invertible inverse different. μ_p gives a decisive counterexample to the former identification. |
| `T1/abelian-relative-comparison` | verified | CS17 Theorem 2.2.2 supplies the proper-smooth relative comparison; corrected period-sheaf and lattice conventions are precisely requested from P8. |
| `T1/hodge-tate-graded-comparison` | corrected | Removed naive family gr⁰ OB_dR=Ô and ordinary-density proof. Removed AΩ specialisation edge and requested the integral character-map compatibility and the two relative lattices. |
| `T1/hodge-tensor-comparison` | corrected | Changed the unsupplied integral tensor assertion to rational homology tensors; classical-point/horizontality proof matches CS17. An integral variant is separately requested. |
| `T2/p-divisible-hodge-tate-sequence` | unverifiable | The rational p-divisible sequence is correct in SW13, but a cokernel bound alone does not supply the integral complex, its zero composite and ranks. Record the exact missing supplier. |
| `T2/abelian-hodge-tate-sequence` | unverifiable | The abelian Hodge–Tate sequence is correctly cited; extending the given proof from good reduction to arbitrary C requires the Raynaud existence/descent gap. |
| `T2/relative-hodge-tate-sequence` | corrected | Use the CS17 M,M₀ filtration instead of naive structural-period-sheaf gr⁰. Fibrewise integral-map identification is still the P8 compatibility gap. |
| `T2/hodge-tate-flag-point` | corrected | Replaced 2^g by all g-subset indices, removed false full-GSp chart permutation, repaired the kernel-line/quotient test, and added a matrix counterexample. E28 records the source assertion too. |
| `T2/pel-hodge-type-filtration` | unverifiable | The rational μ-filtration theorem matches CS17 but its integral lattice/G-model language must be reconciled with the corrected rational tensor torsor; no automatic integral model is available. |
| `T2/hodge-tate-parabolic-reduction` | corrected | Replaced automatic G(ℤ_p) tensor frames by rational G(ℚ_p) frames. Representable parabolic/Levi and quotient APIs are explicitly missing beyond dynamic point subgroups. |
| `T2/de-rham-hodge-tate-levi-comparison` | corrected | Inserted the common Tate-motive trivialisation and equivariant descent used by CS17 Proposition 2.3.9. Reconciliation with the B1 supplier’s raw graded torsor is still a gap. |
| `T2/filtered-fibre-functor` | unverifiable | General filtered-fibre-functor local splitting is not supplied by Shimura-specific CS17 or the complex compact-dual supplier. Precise theorem/source/owner still required. |
| `T3/hasse-neighbourhood` | corrected | Kept the section chart rather than the whole blow-up; made p-torsion removal/normalisation explicit for the admissible formal model. BT₁ ownership and total Hasse conventions remain imported. |
| `T3/subgroup-lifting` | verified | SCH15 subgroup lifting matches the stated flat/complete and annihilator hypotheses. The packet honestly records Illusie/co-Lie deformation as an unresolved prerequisite. |
| `T3/section-rigidity` | unverifiable | The source rigidity lemma is correctly stated, but its square-zero obstruction/difference theory is not the baseline Kähler-differential API; recorded the missing deformation input. |
| `T3/canonical-subgroup` | verified | Weak/strong radius definitions match SCH15 with ε<1/2 and geometric rank conditions. They reference the existence theorem without duplicating the infinite perfectoid tower. |
| `T3/canonical-subgroup-theorem` | verified | SCH15 gives all-prime existence under its weak/strong hypotheses; FAR11 supplies the HN characterisation for p≠2. Small-prime and strict versus weak bounds are distinguished. |
| `T3/canonical-subgroup-properties` | verified | Nestedness, isogeny compatibility and Weil-dual identities match FAR11/SCH15, using the requested A3 pairing convention. Closure is conditional on the recorded canonical/deformation inputs. |
| `T3/quotient-hasse-radius` | corrected | Canonical division multiplies height; the anticanonical rule needs the stated small-height range. Do not use AIP15’s p>2 argument to infer unsourced p=2 quantitative estimates. Corrected the quoted SCH15 proof page from 35 to 34. |
| `T3/canonical-subgroup-hodge-tate` | corrected | Replaced false ω_Cn=ω_G/p^n and raw HT isomorphism by the AIP truncated differential comparison and cokernel degree. Family local freeness and p=2 estimates remain gaps. |
| `T3/hilbert-canonical-subgroup` | unverifiable | BHW’s Hilbert radius is correctly quoted, but the proof’s 1/p<1/2 fails at p=2, and O_F-stability plus a ℤ/p^n-rank count does not prove the ramified generator claim. Appendix input missing. |
| `T4/canonical-anticanonical-loci` | corrected | Clopen subgroup conditions are finite-étale generic-fibre conditions; repaired ordinary level-n test to (ℤ/p^n)^g. Formal extension uses the recorded integral boundary inputs. |
| `T4/canonical-locus-isomorphism` | verified | Choosing C_n gives the canonical component as a section of the finite-étale level cover. Checked the distinction from SCH15’s anticanonical quotient embedding. |
| `T4/atkin-lehner-anticanonical` | corrected | Added the bound on ambient δ=p^nε rather than merely ε. Finite-level radius bookkeeping imports Frobenius/perfectoid tower construction from S1/S5. |
| `T4/hodge-tate-coordinate` | corrected | BHW kernel coordinate is −HT(e₂)/HT(e₁), with first image as quotient generator. Corrected action, adjugate pullback, cocycle proof and domains; uniform integral group bound remains a gap. |
| `T4/flag-variety-balls` | corrected | Replaced the ramified order by its integral closure in C-point balls and restricted Γ₀ preservation to r<1. Full GL₂ affine-ball permutation and second-chart r=1 invariance were unjustified. |
| `T4/period-map-inclusions` | unverifiable | Quantitative constants 2/3/4 agree with BHW Proposition 5.18. The ramified congruence proof and p=2 input are not closed by the cited prerequisites. |
| `T4/ramified-period-comparison` | unverifiable | The generic embedding decomposition is valid, but integral O_F⊗O_C is not a product in the ramified case. Projection-based repair needs the exact canonical generator/congruence theorem; E23 confirmed. |
| `T5/igusa-torsor` | verified | The finite-étale Igusa torsor represents generators of the dual canonical subgroup, and the ordinary full tower is pro-étale. It depends on the recorded Hilbert freeness input. |
| `T5/igusa-full-level-comparison` | corrected | ψ is an isomorphism of finite modules, not φ of spaces. Removed false Γ₀-level factorisation, retained diagonal d action with the explicit adjugate-frame convention. |
| `T5/integral-differential-lattice` | corrected | Definition is the preimage of the span of ψ(1) modulo I_m; I′_m⊇I_m has the right direction. Local freeness is a separate substantive input, not a property proved by the algebra component. Corrected the quoted BHW definition page from 28 to 29. |
| `T5/integral-lattice-properties` | unverifiable | BHW/AIPH support the lattice properties with formal-model hypotheses. Mere compatibility under reduction does not prove level independence; analytic O⁺ transfer and the ramified proof remain gaps. |
| `T5/modified-hodge-bundle` | corrected | Specified torsion-free image/strict transform after the blow-up. The generic isomorphism and p≥3 bounds are sourced; blanket p=2 exponent is excluded and its source gap retained. |
| `T5/modified-minimal-model` | corrected | Removed HBAV C6/hilbert-minimal as a GSp₄/F supplier, clarified local rank-six exterior factors versus the determinant line, and recorded precise model/pushforward descent conditions. |
| `T5/modified-plus-sheaf` | verified | PIL20 explicitly says ω^{mod,+} is an étale-site sheaf rather than an analytic-site sheaf; finite-level pullback and level independence are the intended PS16 inputs. Small-prime gap stays visible. |
| `T5/aip-torsor` | corrected | Removed duplicate aipSheaf constructor (O5 owns it), keeping the consumer compatibility test. Reversed source inclusion remains correctly repaired; torsor congruence API is otherwise faithful. |
| `T5/aip-hodge-tate-comparison` | unverifiable | BHW supplies the comparison target, but j∈B_m is not proved by the corrected ambient bound; integral descent and p-Hecke need precise inputs. Removed AL_∞ and restricted stated Hecke equivariance to prime-to-p. Corrected excerpt pages: Lemma 3.19 is p. 13 and Theorem 7.14 is p. 31. |

## Changed-node inventory

`T0/finite-hodge-tate-map`, `T0/fargues-degree-generic-isomorphism`, `T0/isogeny-divisor`, `T0/normalized-multiplicative-pullback`, `T0/semi-abelian-hasse-invariant`, `T0/hodge-tate-boundary-extension`, `T0/degree-different`, `T1/hodge-tate-graded-comparison`, `T1/hodge-tensor-comparison`, `T2/relative-hodge-tate-sequence`, `T2/hodge-tate-flag-point`, `T2/hodge-tate-parabolic-reduction`, `T2/de-rham-hodge-tate-levi-comparison`, `T3/hasse-neighbourhood`, `T3/quotient-hasse-radius`, `T3/canonical-subgroup-hodge-tate`, `T4/canonical-anticanonical-loci`, `T4/atkin-lehner-anticanonical`, `T4/hodge-tate-coordinate`, `T4/flag-variety-balls`, `T5/igusa-full-level-comparison`, `T5/integral-differential-lattice`, `T5/integral-lattice-properties`, `T5/modified-hodge-bundle`, `T5/modified-minimal-model`, `T5/aip-torsor`, `T5/aip-hodge-tate-comparison`. Baseline, gaps, requests, coverage, source versions, source issues and review metadata changed as described above. No nodes were added.
