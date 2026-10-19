# Independent review: ES6/ES7 coverage reconciliation

Codex, session `codex-2xQvoY`, 2026-10-19. Job `REV-ExcursionOperatorsAndSpectralAction--ES6`, issue #10781. Input: the ES6 coverage packet, reader and suggested file from planning PR #10929, together with their accepted ES5/ES7 owners. This session did not write that work.

**Accepted**, with the reader and provenance clarifications below. This is a completed independent review of a target-level pass. The packet owns no new nodes: it reconciles 63 existing targets across eight stages without duplicating their canonical statements. Acceptance does not mark a proof gap resolved or a theorem implemented.

## Counts and corrections

| Check | Result |
| --- | --- |
| Scoped targets | 63 imported: 6 definitions, 6 constructions, 6 lemmas, 41 theorems, 4 comparisons |
| Per-target verdicts | 62 verified, 1 corrected in its reader presentation; 0 added, 0 unverifiable |
| Baseline | 10 confirmed at the exact pins; 0 removed or replaced |
| Definition/construction interfaces | 58 API entries, 37 checks; every one of the 12 objects has at least 3 checks |
| Planets | 29 retained, at most 6 per stage |
| Coverage | 8 planned stages, 0 closed; packet remains a complete pass |
| Proof obligations | All 24 inherited gap records and 45 supplier contracts retained; 2 supplied ordinary-centre contracts remain separate resolutions |
| Dependency audit | Import hashes/reviews match; 86 reachable same-roadmap nodes, no node cycles; 5 retired EDC IDs resolved on 6 edges |
| Source issues | 21 imported records rechecked in the public editions below, all confirmed within that edition boundary; 0 newly added |
| Lean | Exit 0; one real-bodied definition, two theorem signatures and eight examples; ten `declaration uses sorry` warnings only |

Changes made in this review:

1. Spelled out the exact ratio in the reader's Kaiser graded-chain lemma, including the dual, `q_∞⁻¹T⁻¹`, the orders-at-`q_∞^n` equivalence, nonnegative multiplicities and the direct-summand limitation. The canonical ES7 node already had these conditions; it was not copied or rewritten.
2. Identified the rational z-embedding prototype as belonging to the owning ES5 suggested file, and the `coefficientReduction` signature in the inherited gap as belonging to the owning ES7 suggested file. Neither signature occurs in the compact ES6 file. The scalar-extension gap remains open.
3. Replaced the reader's author-pass-only reading notice with separate author/reviewer boundaries. Added public URLs, exact source hashes, read locators, ten baseline checks and 21 owner-qualified source-issue checks under `review`. Updated the inherited-source policy to distinguish that original author pass from the independent checks. Original owner reviews and imported content hashes remain unchanged.
4. Added the explicit suggested-file notice that the reader is the definitive roadmap. Lean declarations and their mathematical content are unchanged.

No baseline citation was changed, no node or planet was added, and no atlas data, source file, owning ES5/ES7 packet or current upstream file was edited. The original packet's import audit counts were independently reproduced. All imported target IDs, API names and test names occur in the reader.

## Source and mathematical checks

The packet's `review.sourceReadings` records the exact public URL, SHA-256 and reading boundary for each copy. The [reader catalogue](../readmes/ExcursionOperatorsAndSpectralAction--ES6.md#source-catalogue) links those editions. Readings below support the scoped targets and checks; they do not assert that every proof named in a remaining source-expansion gap was acquired.

| Public source | Independently read locators and application |
| --- | --- |
| Fargues–Scholze, author 356-page PDF | II.2 pp. 60–61; III.2 p. 91; VI.1–2 pp. 193–198; VI.12 pp. 239–241; VII.7.10 p. 276; VIII.3.6 p. 288; IX.3 pp. 324–325; IX.4–7 pp. 327–338. Checked coefficient policy, operator conventions, functoriality, duality, strata, induction and the trace comparison. |
| Kaletha, arXiv v2 and published copy | Preprint section 2 p. 4 and section 5 pp. 17–20; published section 2 p. 64 and section 5 pp. 78–80. Full pseudo-z hypotheses, connected-centre refinement, rational factorization and p-adic scope. |
| Fargues, Abel–Jacobi | Proposition 2.16/Remark 2.17 pp. 9–11 and Proposition 3.3 proof p. 13. Coefficient-free torsor, Frobenius and reciprocity inverse; not an automatic all-coefficient extension of a Q_l character corollary. |
| Conrad, finiteness | Remark 1.2.1 pp. 3–4, Lemma 4.1.2 p. 19 and Proposition 4.1.7 p. 22. Flat cohomology versus smooth hypotheses and rational-image topology. |
| Henniart–Vignéras 2025; Vignéras 2023 | Section 2.2.4(2), p. 236; section 3 and Proposition 3.3 pp. 238–240; sections 4–5 pp. 337–340. Quotient lifting, compact central cokernel and all-coefficient finite length independent of noetherianity. Adjacent square-class errors were also checked. |
| Hausberger 2005 | Definition 1.1 pp. 1291–1293; Definition 3.1/Theorem 3.4 pp. 1302–1304; 6.1/6.4 pp. 1311–1313; sections 7–8 pp. 1315–1323; sections 9–10 pp. 1333–1342,1352–1357; A.12 pp. 1364–1365. Objects, levels, formal modules, uniformization, three actions, selected cohomology and corrected degeneration. |
| LRS, published scan | Theorems 4.1/5.1/6.1 and Corollary 6.2 pp. 236–246; section 13 pp. 289–293; 14.1–14.2 p. 294; 14.9–14.12 pp. 297–300; old chain context pp. 302,306–307; 15.10–15.17 pp. 314–322. OCR-assisted reading of the scan, compared with the erratum for corrected formulas. |
| Kaiser, two-page erratum | Both pages, including the lemma proof; visually checked page 1. The dual reciprocal factor, corrected chain degrees and multiplicities agree with the canonical targets. |
| Kottwitz 2014 | Proposition 10.4/Lemma 10.5 p. 50; section 13/Proposition 13.1 pp. 65–66. Central-torus basic-class surjectivity is distinguished from the requested H1(G_ad) bridge. |
| Scholze–Weinstein 2020 | Theorem 24.2.5 pp. 227–228 and Corollary 24.3.5 pp. 230–231. Q_p scope, general EL/PEL input, levels and actions do not remove the requested restriction-of-scalars comparison. |

Lafforgue-2018 remains earlier-stage ES5 parameter-extraction support; it was not freshly read in this review. The 86-node closure traverses those support nodes for dependencies, without claiming to independently re-review their entire source proofs. Primary EP proofs in characteristic p, Badulescu's local character proof, numerical local correspondence and equal-characteristic second-operation transport remain named gaps.

Important mathematical boundaries checked:

- The central component restriction is on `Z(G)`, not `Z(Ĝ)`; scalar parameter extraction uses the unconditional excursion route. Torus quotient levels can be infinite, and regular-module detection retains nilpotent coefficients.
- The all-field rational-central-character proof has a weaker central-pushout/closed-cocompact-image/quotient-lift route. It does not prove the stronger p-adic z-embedding conditions in characteristic p or repair the separate quasi-split stratum reduction.
- The HN calculation must combine the switched kernel, opposite-parabolic sign and compact-support character. The current HS4 supplier explicitly makes this distinction, and the packet retains the normalization gap.
- The two-leg calculation uses diagonal Weil invariance and nonzero dimension. The identity tuple fixes the product of scalars; characteristic zero with positive rank supplies the needed nonvanishing. Traces identify the semisimple Weil part, without recovering monodromy.
- D-elliptic levels are right-module trivializations acted on by precomposition with left multiplication. Formal base actions and cover actions, away-o formal levels and o-level generic covers, and full component colimits are kept distinct.
- Selected generic concentration and the corrected general Kaiser chain are separate routes. The analytic Ext degeneration retains semisimple splitting and index-d averaging repairs rather than the two invalid intermediate source assertions.

## Exact-pin baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: each statement was read in the recorded module, with Tau Ceti read at its exact commit. The suggested file uses Mathlib only. Current Tau Ceti moves the smooth-discrete declaration to another module; the baseline path is correct at its pin.

| Declaration | Confirmed scope |
| --- | --- |
| `mathlib:Representation` in `Mathlib/RepresentationTheory/Basic.lean` | Algebraic monoid representations on existing modules; neither smoothness nor continuity is implicit. |
| `mathlib:Representation.dual` in `Mathlib/RepresentationTheory/Basic.lean` | Dual action by precomposition with the inverse group element. |
| `mathlib:coevaluation` in `Mathlib/LinearAlgebra/Coevaluation.lean` | Coevaluation into V tensor V-dual over a field for finite-dimensional V. |
| `mathlib:contractRight` in `Mathlib/LinearAlgebra/Contraction.lean` | Evaluation from V tensor V-dual to the coefficient ring. |
| `mathlib:LinearMap.trace` in `Mathlib/LinearAlgebra/Trace.lean` | Trace of a module endomorphism; use finite-dimensional vector spaces for the contraction endpoint. |
| `mathlib:MonoidAlgebra` in `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | Finite formal coefficient sums on a monoid. The index monoid need not be finite. |
| `mathlib:MonoidAlgebra.single` in `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | A single group-ring basis vector with a specified coefficient. |
| `mathlib:MonoidAlgebra.mapDomainLinearMap` in `Mathlib/Algebra/MonoidAlgebra/Module.lean` | Linear transport of basis indices. A quotient map sends [x] to [q(x)] with unchanged coefficient. |
| `mathlib:CategoryTheory.CatCenter` in `Mathlib/CategoryTheory/Center/Basic.lean` | Endomorphisms of the identity of an ordinary category, not the enhanced degree-zero centre. |
| `tauceti:TauCeti.IsSmoothDiscrete` in `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` | Discrete underlying topology and open point stabilizers for a TopRep object. This supplies neither D_lis nor a local LLC. |

The native contraction uses finite-dimensional modules over a field, with the dual action precomposed by inversion. The infinite-index monoid algebra is a finite-support coefficient object; its quotient-index map introduces no index factor. Ordinary `CatCenter` does not supply the enhanced centre comparison.

## Suppliers, current upstream and red-team findings

Read current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` without modifying or building either. The reviewed AUDIT-20 entries in `data/library-coverage.json` agree with the absence/partial availability of these targets. Neither current library infrastructure nor the newer roadmaps provides an implemented excursion comparison, D-elliptic moduli theory or classical tower comparison.

The imported exact supplier statements were read, including HS4 group-change/product/Weil/Levi and creation–annihilation diagrams, GS4 Satake normalization, VS4 lisse strata and compact generators, VS5 compact BZ/Kunneth, LP0/LP2 cocycles and excursion maps, the arbitrary-group R01.1 trace theorem, R01.2 Weil–Deligne conventions, DWP purity, SF.2 noncommutative sheaf algebras and EDC.8 finite-level correspondence/trace/reciprocity. Stage references needing stronger strength remain contracts. Examples are AA.1 function-field points, BG1 all-E torus/inner-class transport, BG4 quantitative bounds, early SR.3b all-coefficient finite length, the nonconstant open-curve functional equation and the analytic quotient spectral sequence.

| Confirmed finding | Independent disposition |
| --- | --- |
| RT-AREA-geomlanglands/2 | HS2 is geometry; ET.6/6a supplies classical towers downstream. SW20 24.2.5 alone is Q_p-only. The general-E action/level transport remains requested. |
| /7 | ES1's spectral/excursion action and coefficient policy are direct inputs before scalar evaluation. The BZ comparison is early; smooth duality returns after parabolic induction. The independently reproduced node closure is acyclic; no claim is made about the entire stage graph. |
| /9 | Current upstream SR.0/SR.1.3 already own the arbitrary-coefficient ordinary centre, pro-p corner limit and integral separatedness. Those two contracts are resolutions. ES0 owns the enhanced comparison, with the remaining VS refinements; complex SR.3 is not used to justify arbitrary coefficients. |
| /10 | Current RG2.1.5 already plans z-extensions over arbitrary fields. Its stated exclusion of z-embeddings/central pushouts makes the requested extension genuine. RG2.6 is proposed work routed through RG2.5, not an existing theorem. |
| /11 | Basic inner twisting needs Hecke-equivariant groupoid transport and the BG1 basic-class/H1 bridge. Kaletha's theorem remains p-adic; the characteristic-p nonsmooth-centre obstruction remains a gap. |
| /12 | FA.2/FA.6 and generic AA.0 supply function-field infrastructure and measures. Current AA.0 explicitly allows countable local families, while AA.1's algebraic-point construction is number-field scoped, requiring its recorded extension. D-specific objects alone belong here. |

Each of the five retired EDC IDs was checked against the accepted EDC.4 retirement map and the actual accepted EDC.7 supplier statement. Hashes and accepted-review identities match. Pushforward/composition use the proper finite-level legs; numerical traces use proper schemes/fixed components; reciprocal characteristic polynomials use equal-dimensional dual spaces and invertible similitude. The original ES7 prerequisite spellings lie outside this job and remain an explicit packaging handoff; this coverage manifest's resolutions consume the current statements.

## Imported source issues

These are scoped confirmations in the freshly read editions, not new errata records and not a new collation with every version the owners had checked. ES5/ES7 issue IDs overlap, so owner identity is retained. Their original review fields are unchanged; the following reasons also occur in `review.sourceIssuesChecked`.

| Owner / issue | Verdict and reason |
| --- | --- |
| ES5 / E2 | Confirmed: The author FS p. 331 product display repeats G1 in the second factor; the product and parameter consequence require G2. |
| ES5 / E3 | Confirmed: The author FS p. 331 inputs belong to the two individual bundle stacks; putting both on Bun_G has the wrong external-product domain. |
| ES5 / E4 | Confirmed: The author FS p. 331 change-of-group prose reverses the group arrow. The displayed Grassmannian map and contravariant dual arrow fix the direction. |
| ES5 / E5 | Confirmed: The author FS p. 333 application requires the injective connected-centre object of Kaletha Definition 5.1. A surjective z-extension has a different kernel/centre condition. |
| ES5 / E6 | Confirmed: The author FS VII.7.10 p. 276 must retain the lisse target of its displayed functor for general coefficients; the isolated etale label is incompatible with it. |
| ES5 / E7 | Confirmed: Henniart–Vigneras p. 240: pth powers over F_q((t)) give an infinite rational cokernel. Compactness of the unit quotient and finite valuation quotient suffice; finiteness is false. |
| ES5 / E8 | Confirmed: Henniart–Vigneras p. 239: minimality of the parabolic is needed, and the inverse image of a split torus may contain an anisotropic torus. Choose a split subtorus instead. |
| ES5 / E9 | Confirmed: Henniart–Vigneras p. 239: checked the unbound/image/ambient quotient symbols against the declared morphism and ensuing commutator calculation. |
| ES5 / E10 | Confirmed: Henniart–Vigneras formula (4-1), p. 240: characteristic two must be the infinite square-class branch; odd leading exponents give distinct classes. |
| ES5 / E11 | Confirmed: Henniart–Vigneras formula (4-1), p. 240: the finite dyadic dimension uses [F:Q_2], not just ramification index. The unramified quadratic example gives dimension four, not three. |
| ES7 / E1 | Confirmed: LRS pp. 299–300,306 versus Kaiser p. 1: the reciprocal factor must use the dual isotype and q_x^-1 T^-1; self-duality is not justified. |
| ES7 / E2 | Confirmed: FS p. 335 with Kaletha pp. 64,78–80: the p-adic z-embedding proof does not extend to nonsmooth centres in characteristic p. H1_fppf(E,mu_p)=E^times/(E^times)^p obstructs the proposed surjectivity, not the theorem itself. |
| ES7 / E3 | Confirmed: LRS p. 291: quotienting idele classes by the degree lattice gives compactness, while local-unit classes prevent finiteness. |
| ES7 / E4 | Confirmed: LRS p. 302 versus p. 306 and Kaiser p. 1: the chain numerator requires T^-1. The length-d chain checks that exponent. |
| ES7 / E5 | Confirmed: LRS p. 306: the ratio is Corollary 14.11(iii); the cited 14.10(ii) is a different result. |
| ES7 / E6 | Confirmed: Hausberger p. 1335: a character used with sigma_1 is a rank-one input, not an element of the rank-d class. |
| ES7 / E7 | Confirmed: Hausberger pp. 1339–1340: the globalized supercuspidal is on GL_d; the nearby n denotes a level, not its rank. |
| ES7 / E8 | Confirmed: Hausberger section 10.2 with 10.1 and LRS 15.12: the selected factor is in cohomological degree d−1 and has dimension d. |
| ES7 / E9 | Confirmed: Hausberger section 7.2 versus section 3: the isogeny-class result numbered 3.4 is a theorem, not a proposition. |
| ES7 / E10 | Confirmed: Hausberger p. 1354: a surjection k^2 to k between trivial isotypes still has nonzero kernel. Semisimple splitting of the restricted surjection replaces the false zero-kernel assertion. |
| ES7 / E11 | Confirmed: Hausberger p. 1357: determinant valuation gives index d for Z(K)GL_d(K)^0 in GL_d(K). A characteristic-zero finite-index averaging argument is needed. |

## Per-target verdicts

The common `ExcursionOperatorsAndSpectralAction:` prefix is omitted below. Full IDs and verdicts occur in `review.checked`. “Verified” means a correct target-level plan with its named gaps, rather than proof closure or completed implementation.

| Target | Verdict | Independent check |
| --- | --- | --- |
| `ES6/coefficient-policy-for-the-functorial-diagrams` | verified | FS IX.5.2 and IX.6, pp. 329–330: the spectral comparison requires the order of the component group of Z(G), while excursion evaluation on Schur objects avoids this condition. Kept distinct from ES3 categorical-action restrictions. |
| `ES6:functoriality/isogenies` | verified | FS IX.6.1, pp. 330–331: the morphism induces an adjoint isomorphism; it need not be a finite isogeny. Read HS4 relative-homology and GS4 change-of-group interfaces before passing to constituents. |
| `ES6:functoriality/products` | verified | FS IX.6.2, p. 331, with VII.7.10, p. 276: checked both factors, the common divisor base and compact lisse generators. HS4 product and VS5 Kunneth supply the unevaluated comparison. |
| `ES6:functoriality/weil-restriction` | verified | FS IX.6.3, p. 332: finite separable extension, compatible Weil embedding, free-subgroup colimit and nonabelian Shapiro are required. HS4 includes the induced representation and compatible half twists. |
| `ES6:functoriality/tori-spectral-center` | verified | FS IX.6.4, p. 333: inverse-limit group rings use open levels, whose quotient groups can be infinite. All-field torus classification and wild equal-characteristic reciprocity remain explicit supplier extensions. |
| `ES6:functoriality/torus-two-leg-calculation` | verified | FS II.2, III.2 and VI.1–2 with IX.6.5; Fargues Proposition 2.16, Remark 2.17 and Proposition 3.3 proof, pp. 9–13: checked the frame/descent inverse and geometric reciprocity. Regular-module equality retains arbitrary coefficients; a Q_l character identity alone would not suffice. |
| `ES6:functoriality/tori-diagonal-embedding` | verified | FS IX.6.5, p. 333: regular-module detection proves the same element acts in every degree, including nonreduced coefficients. Torus-resolution and reciprocity requests remain; no finite quotient or field-point separation assumption is used. |
| `ES6:functoriality/central-characters-and-twisting` | verified | FS IX.6 closing paragraph, p. 333: multiplication by the smooth connected torus centre, products and torus compatibility give the dual projection. The scheme-theoretic centre hypothesis is retained. |
| `ES6:functoriality/twisting-by-abelianized-characters` | verified | FS p. 333: the graph into G times its torus abelianization gives central multiplication of crossed cocycles. The Weil projection stays fixed. |
| `ES6:functoriality/z-embedding` | verified | Kaletha preprint Definition 5.1, Proposition 5.2 and Facts 5.4–5.6, pp. 17–20: checked all cohomological conditions and p-adic standing hypothesis. Constructor, central factorization, extension API and three tests agree; upstream z-extensions are a different supplier. |
| `ES6:functoriality/z-embedding-central-character-comparison` | verified | Read Henniart–Vigneras 2.2.4(2), section 3 and Proposition 3.3, Vigneras sections 4–5, Conrad 1.2.1/4.1.2/4.1.7 and Kaletha section 5. The weaker all-field route uses a closed cocompact image and an irreducible quotient lift, not a false central-surjectivity or H1 assertion; its topology, finite-length and central-cocycle interfaces remain requested. |
| `ES6:duality/bernstein-zelevinsky-duals` | verified | FS IX.5.3, pp. 329–330 and VI.12.1, pp. 239–241: early BZ/centre involution uses switched Satake duality. VS5 supplies compact BZ; condensed mapping, centre and domain refinements remain stated rather than inferred for arbitrary objects. |
| `ES6:duality/smooth-duals` | verified | FS IX.5.3 proof, p. 330: the smooth contragredient statement returns after parabolic induction. All-coefficient admissibility and the induction/duality dictionary remain contracts, preventing circular use of the endpoint. |
| `ES7:parabolic/stratum-maps` | verified | FS Definition IX.7.1, p. 334 and IX.5.2, p. 329: checked the eligible lisse embedding, ES5 embedding independence and ES0 enhanced-to-ordinary comparison. API and tests distinguish the unrestricted excursion map from the conditional spectral map. |
| `ES7:parabolic/twisted-levi-inclusion` | verified | FS p. 334: geometric degree one gives t=(2rho_Ghat−2rho_Mhat)(sqrt(q)); its centrality and Weil invariance prove the cocycle law. Basic, inertia and GL2 tests detect an omitted or inverted twist. |
| `ES7:parabolic/coefficient-reduction` | verified | FS IX.7.2 proof, p. 335: separatedness applies at the universal integral coefficients. Arbitrary derived coefficient change is a separate gap; current SR.1 supplies the ordinary corner-centre theorem, not the enhanced comparison. |
| `ES7:parabolic/basic-case-and-quasisplit-reduction` | verified | FS p. 335, Kaletha published pp. 78–80 and Kottwitz Proposition 10.4, p. 50 / Proposition 13.1, pp. 65–66: checked basic inner twisting and the needed BG1 bridge. The p-adic z-embedding reduction is not extended across the characteristic-p nonsmooth-centre obstruction. |
| `ES7:parabolic/increasingly-unstable-sequence` | verified | FS pp. 335–336: central translation preserves the Levi group and eventually the bounded Hecke type preserves HN reduction. N is chosen after V; BG4 quantitative slope strength remains an explicit request. |
| `ES7:parabolic/constant-term-computation` | verified | FS IX.7.2, pp. 336–337 and current HS4 Levi statement: checked the switched kernel, opposite-parabolic sign and compact-support character in Rpi_! together. The unresolved normalization is retained as proof work; the shift disappears only on excursion degree zero. |
| `ES7:parabolic/parabolic-induction` | verified | FS Corollary IX.7.3, pp. 336–337: the neutral-stratum Hecke operation is unnormalized induction, with inverse central translation and the negative shift/half twist. The generator reduction and coefficient contracts remain visible. |
| `ES7:parabolic/normalised-induction-dictionary` | verified | FS IX.7.3 with the stated modulus convention: checked GL2 cancellation and the abelianized-character supplier. The general root/modulus comparison is a recorded gap, not silently supplied by notation. |
| `ES7:GLn-comparison/two-tower-realisation` | verified | FS IX.7.4, p. 338; SW20 24.2.5, pp. 227–228 and 24.3.5, pp. 230–231: Q_p theorem and general EL input are distinguished. ET.6/6a owns the action-preserving classical tower comparison downstream of HS2; restriction of scalars remains requested. |
| `ES7:GLn-comparison/two-leg-excursion-is-a-trace` | verified | FS p. 338: diagonal Weil invariance, scalar endomorphisms of both factors and the identity-tuple nonzero-dimension normalization give trace(rho(gamma1 gamma2^-1)). This is not invariance under independent legs; the compact Lean contraction matches it. |
| `ES7:GLn-comparison/trace-determines-semisimplification` | verified | FS p. 338 and R01.1 arbitrary-monoid Brauer–Nesbitt statement: characteristic zero supplies invertibility of d!, so equality of traces identifies semisimplifications of the actual Weil representations. No finite-group substitute is used. |
| `ES7:GLn-comparison/supercuspidal-agreement` | verified | FS p. 338: classical two-operation input and the direct summand of the Hecke output transport the scalar excursion action from the division-algebra representation to the supercuspidal. No parameter is used circularly to define its classical realization. |
| `ES7:GLn-comparison/all-irreducible-representations` | verified | FS IX.7.4, pp. 337–338: normalized induction and the independent segment classification extend characteristic-zero agreement. The endpoint is the semisimple Weil part; the theorem does not reconstruct N. |
| `ES7:function-field-automorphic/maximal-orders` | verified | Hausberger section 1.1, p. 1291: central simple D and local maximal-order pairs include the split matrix case. API/tests distinguish integral matrices from order units. Existence/gluing remains requested from the algebraic suppliers. |
| `ES7:function-field-automorphic/division-quotient-compactness` | verified | LRS 13.3, p. 291 and Hausberger setup: division gives compactness modulo centre, and a degree lattice removes the remaining direction. The idele-class quotient is compact, not finite; AA.1 needs a function-field extension. |
| `ES7:function-field-automorphic/discrete-spectrum` | verified | LRS 13.3 and 14.1–14.2, pp. 291, 294: finite-level admissibility/decomposition is used in the compact division quotient. AS.0 Hilbert theory alone is insufficient for Qbar_l descent and restricted tensor products; those requests remain. |
| `ES7:function-field-automorphic/kernel-trace-identity` | verified | LRS 13.5–13.6, pp. 292–293: finite-level smoothing on the compact quotient gives the kernel integral and spectral trace. Generic restricted-product Haar is imported; no unrestricted infinite-dimensional trace is substituted. |
| `ES7:function-field-automorphic/euler-poincare-function` | verified | LRS 13.1, p. 289: checked full facet normalizers, orientation characters, facet multiplicity and Haar denominator. Rank-one, rescaling and edge-reversal checks distinguish plausible wrong functions. |
| `ES7:function-field-automorphic/euler-poincare-orbital-integrals` | verified | LRS 13.2, pp. 289–290: nonelliptic orbital integrals vanish and elliptic matching has the division-algebra sign. The characteristic-p building proof remains a source-expansion gap. |
| `ES7:function-field-automorphic/euler-poincare-character-traces` | verified | LRS 13.2, pp. 289–290: unitary trivial and Steinberg traces are 1 and (-1)^(d−1); all other compatible unitary irreducibles vanish. Central compatibility and the primary-proof characteristic-p gap are retained. |
| `ES7:function-field-automorphic/simple-trace-comparison` | verified | LRS 13.6, pp. 292–293: the geometric/automorphic EP comparison uses the division quotient and selected local tests. Exact transfer/coefficient proof expansion remains requested, not supplied by a generic trace formula. |
| `ES7:function-field-automorphic/globalisation` | verified | LRS Lemma 15.10, pp. 314–315 / Hausberger 10.2, p. 1340: checked the fixed setup, prescribed supercuspidals, Steinberg place and extra elliptic test. The nonzero matrix-coefficient selector, not a subgroup indicator, supplies the local components. |
| `ES7:function-field-automorphic/jacquet-langlands-transfer` | verified | LRS 15.11, p. 315 / Hausberger 10.3–10.4, pp. 1340–1341: selected transfer retains the auxiliary split supercuspidal and multiplicity one. No unrestricted global JL theorem is claimed. |
| `ES7:equal-characteristic/D-elliptic-sheaf` | verified | Hausberger Definition 1.1, pp. 1291–1293: right D-module rank d^2, rank-d cokernels, periodic j/t chain and Frobenius on S are retained. Extensionality/pullback and the matrix Morita check agree with the generic DM.7 owner. |
| `ES7:equal-characteristic/level-structure` | verified | Hausberger section 1, pp. 1292–1293: checked the zero-avoiding Frobenius-compatible right-module trivialization. The unit action is precomposition by left multiplication; the noncentral M2(F3) check correctly rejects right multiplication. |
| `ES7:equal-characteristic/moduli-and-hecke` | verified | LRS Theorems 4.1, 5.1, 6.1 and Corollary 6.2, pp. 236, 241, 246; Hausberger 6.1/6.4, pp. 1311–1313: nonempty level, normalized index shift, relative dimension and division properness have the required domains. The distinguished-place extension only uses levels away from o. |
| `ES7:equal-characteristic/frobenius-hecke-correspondences` | verified | Hausberger section 7.1, pp. 1315–1316: an arbitrary g acts through refined-level finite correspondences, not necessarily level automorphisms. Read current EDC pushforward/composition suppliers and their proper finite-level applicability. |
| `ES7:equal-characteristic/special-formal-module` | verified | Hausberger Definition 3.1, p. 1302: specialness is invertibility of the tangent module over O_d tensor B, not total dimension alone. The split-eigenspace counterexample detects that omission. |
| `ES7:equal-characteristic/special-formal-modules` | verified | Hausberger Theorem 3.4 and section 7.2, pp. 1304, 1316–1320: the local formal object has height d^2 and rational endomorphisms M_d(K). Determinant/Frobenius and norm-valuation actions are recorded, without transferring cover actions to the base scheme. |
| `ES7:equal-characteristic/uniformisation` | verified | Hausberger 8.1 and 8.3, pp. 1321–1323: the complementary division algebra swaps the invariants, with formal away-o and generic-cover o-level statements distinguished. Right tower actions and cohomological inverses remain part of the target. |
| `ES7:equal-characteristic/fundamental-local-representation` | verified | Hausberger sections 9.2–9.3, pp. 1335–1337: Res-prime is the integer-indexed disjoint Frobenius sum; compact support has finite component support. API/tests preserve the combined determinant/norm/Weil stabilizer and all three commuting actions. |
| `ES7:equal-characteristic/local-cohomology-finiteness` | verified | Hausberger Proposition A.12, pp. 1364–1365 and 10.6, pp. 1341–1342: quasi-algebraic compact-support complexes and finite-type GL_d statements are separated from a stronger unproved assertion of tower admissibility. |
| `ES7:equal-characteristic/global-cohomology` | verified | LRS 14.1–14.2, p. 294 and Hausberger 10.1, pp. 1338–1339: good finite levels are proper smooth of dimension d−1. Admissible Hecke decomposition and semisimplified Galois factors are retained; the source superscript typo does not change the middle degree. |
| `ES7:equal-characteristic/geometric-automorphic-trace` | verified | LRS 14.9, p. 297 and 14.12, p. 300: alternating Frobenius traces are compared with the EP automorphic side. The current EDC trace-class and proper Lefschetz–Verdier statements cover the finite-level division scheme, not arbitrary nonproper fixed loci. |
| `ES7:equal-characteristic/dual-isotypic-pairing` | verified | LRS Corollary 14.11 as corrected by Kaiser p. 1: pair the Pi and dual-Pi isotypes. Read EDC adic duality and equal-dimensional similitude reciprocity; neither requires false self-duality of an individual isotype. |
| `ES7:equal-characteristic/kaiser-erratum` | verified | Kaiser p. 1: both the dual and q_x^-1 T^-1 replacement are retained. Corrected general-chain input and the independent selected-generic route stay separate. |
| `ES7:equal-characteristic/kaiser-graded-chain-lemma` | corrected | Kaiser Lemma 14.14-prime, pp. 1–2: independently checked the dual reciprocal ratio, orders-at-q^n relation, purity, m-prime divisibility and chain degrees. Expanded the reader to state the exact ratio and relation already present in the canonical node. |
| `ES7:equal-characteristic/kaiser-graded-chain-proposition` | verified | Kaiser Proposition 14.17-prime, p. 1: checked the full chain decomposition and multiplicity m_Pi. It uses the amended lemma and the dual isotype, without restoring the deleted integrality/self-duality hypotheses. |
| `ES7:equal-characteristic/selected-isotypic-cohomology` | verified | LRS 15.12 and its genericity remark, pp. 316–317 with Hausberger 10.5: the selected middle-degree factor follows using the strict generic Satake bound. The source route requiring proof expansion is explicit; the conclusion is not inferred from a trace identity alone. |
| `ES7:equal-characteristic/local-correspondence-independence` | verified | LRS 15.13–15.14, pp. 317–319: determinant, twists, duals and pair factors compare auxiliary choices in one fixed global setup. The open-curve compact-support functional equation and local epsilon product exceed present WC.2 and remain requested. |
| `ES7:equal-characteristic/classical-local-correspondence` | verified | LRS 15.13–15.17, pp. 317–322 / Hausberger 9.2, pp. 1334–1335: independently constructed finite-order supercuspidal parameters precede excursion comparison. Numerical surjectivity/uniqueness, twists and segment extension remain independent supplier obligations. |
| `ES7:function-field-automorphic/local-character-identity` | verified | Hausberger Theorem 9.1, pp. 1333–1334: local JL character matching has sign (-1)^(d−1) on corresponding elliptic regular elements. The underlying Badulescu proof remains unacquired and explicitly a gap; it is not replaced by the mixed-characteristic theorem. |
| `ES7:equal-characteristic/geometric-hochschild-serre` | verified | Hausberger 10.6 and 10.8, pp. 1341–1342: checked the Ext degree 2d−2−j, Tate twist d−1 and transpose/inversion action. Generic arithmetic spectral sequences do not supply the analytic quotient construction; the exact H3/HS comparison remains requested. |
| `ES7:equal-characteristic/hochschild-serre-and-degeneration` | verified | Hausberger 10.14–10.17, pp. 1353–1356: selected cuspidal degeneration uses compact matrix coefficients on GL_d(K)^0, corrected semisimple-block lifting, concentration and multiplicity one. Equal multiplicity alone is not used as an isomorphism criterion. |
| `ES7:equal-characteristic/drinfeld-carayol` | verified | Hausberger Theorem 9.5, p. 1337 / final proof pp. 1356–1357: finite-order central character, supercuspidal domain, Hom isotype and twist |.|^((1−d)/2) match. The fixed-central-character argument uses the index-d subgroup and averaging, not a false equality with GL_d. |
| `ES7:equal-characteristic/hecke-fibre-transport` | verified | FS IX.7.4, p. 338 with IX.3, pp. 324–325: the equal-characteristic second operation and action-preserving formal-module comparison remain explicit gaps. The Q_p p-divisible-group theorem does not supply them. |
| `ES7:equal-characteristic/equal-characteristic-agreement` | verified | FS IX.7.4, p. 338: the equal-characteristic realization feeds the same trace and normalized-induction nodes. Both operations are prerequisites, and the conclusion identifies only the semisimple Weil parameter. |
| `ES7/agreement-for-every-local-field` | verified | FS IX.7.4, p. 338: combines two independent characteristic branches, each with its recorded proof obligations. This is a covered target, not a claim that the geometric prerequisites have been formalized. |
| `ES7:function-field-automorphic/cuspidal-local-selector` | verified | LRS 15.10 proof, pp. 314–315: the normalized matrix-coefficient test has nonzero value at one and selects the chosen irreducible with its fixed central character. Three tests distinguish the central law and nonvanishing from an indicator construction. |
| `ES7/classical-centre-agreement` | verified | FS after IX.7.4, p. 338: characteristic-zero irreducible evaluation plus centre separation identifies the maps. The integral centre map exists, but no integral/mod-l full Weil–Deligne correspondence follows. |

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES6.json`: zero errors and warnings.
- `lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES6.lean`: elaborates at the shared pinned Mathlib build; exit zero and ten expected `declaration uses sorry` warnings only. Available memory exceeded 20 GB. No library build, update, cache acquisition or language server was run.
- Independent import/graph/inventory checks reproduced hashes, accepted-review identities, all eight exact stage inventories, 86-node acyclic same-roadmap closure, reader API/test coverage and the six-planet limit.
- `git diff --check`: clean. Only this job's deliverables and handoff are changed.

Questions for the orchestrator: no decision blocks acceptance. Packaging must repoint the five retired EDC IDs in the owning ES7 prerequisites, preserve the early-BZ/late-smooth-duality proof order, reconcile older owner prototypes to the compact suggested-file shape, and retain the 24 gaps/45 contracts until their actual supplier work is done. The current ordinary-centre and z-extension upstream owners must remain imports. No second job was claimed.
