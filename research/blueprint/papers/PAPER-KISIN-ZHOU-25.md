# Kisin–Zhou: Frobenius conjugacy classes and independence of ℓ

**Partial research checkpoint — Codex, session codex-c83e7a, 22 September 2026.** This extraction contains 192 items: 19 library items, 23 planned imports and 150 missing items, each missing item assigned exactly one of eleven routes. Its 89 definitions and constructions carry 267 proposed API statements and 267 specified tests. Nine separate exact Python checks passed. None of these numbers means the mathematical prerequisites are closed or formalized.

The entire 63-page arXiv revised preprint was read, including references. The principal results and the arguments in every section are extracted. Several source inputs remain consumer contracts rather than complete declaration-sized recursive proofs. The result therefore remains `partial`. The handoff names the unresolved work, including final-text comparison, a Frobenius-orbit coroot step and the precise finite-field Bertini reduction.

## Source and scope

The target is Mark Kisin and Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*, Annals of Mathematics 202 (2025), no. 3, 1077–1156, [DOI 10.4007/annals.2025.202.3.3](https://annals.math.princeton.edu/2025/202-3/p03). The read source is [arXiv:2103.09945v2](https://arxiv.org/abs/2103.09945v2), dated 7 October 2024. Its PDF has SHA-256 `62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8`. The publisher records a final revision on 19 November 2024. Title, authors and subject agree, but this checkpoint does **not** certify that every statement and locator matches that final revision. A guessed publisher PDF URL returned 404; the Cambridge author URL failed certificate verification. No verification was disabled to retrieve it.

The revised preprint must not be replaced by the older author version without reconciling its numbering and assumptions. The revised proof explicitly adds the very-good embedding condition omitted in KP18 and earlier versions. It also moves substantial local-model and integral-model construction into Kisin–Pappas–Zhou. KPZ arXiv v1 was acquired for the cited period, but its numbering already differs from some Kisin–Zhou references. The read passages are identified below; the later KPZ publication is not silently substituted for them.

The main theorem concerns an abelian variety A over a number field E embedded in C, after the finite extension that makes its ℓ-adic realizations factor through its Mumford–Tate group G. For every good-reduction place v with residue characteristic p>2, there is a point γ in **Conj_G(Q)** agreeing with the Frobenius quotient point for every ℓ≠p. The output is a rational point of the scheme of geometric semisimple conjugacy classes. It does not assert a rational representative in G(Q). The hypothesis does not include the Mumford–Tate conjecture: absolute Hodge cycles provide the factorization after a finite extension, without identifying the algebraic monodromy group with G.

The geometric theorem, 5.1.4, proves the analogous statement at every finite-field point of the integral Shimura stack of a strongly acceptable triple. The ordinary lifting theorem, 4.4.6, gives an actual lift of an ordinary point to a special point, carrying I_x(Q) in the isogeny category. This is stronger than merely finding a CM point whose reduction lies in the same isogeny class. The paper proves existence here; this extraction does not add a uniqueness theorem or an integral automorphism action.

Corollary 6.3.4 adds G_der simply connected and G_Qp quasi-split. It then gives γ₀ in G(Q), elliptic over R, conjugate to actual Frobenius over Q_ℓ for all but at most one ℓ≠p. The possible exceptional prime can be chosen from a positive-density set, while γ₀ can change with that choice. The conjectural removal of these qualifications is not a target. Neither ℓ=p nor bad reduction is covered by the main theorem extracted here. There is no type-D exclusion or neat-Weil restriction in the general quotient-class theorem.

## Proof architecture and conventions

### Local group theory

Items N01–N26 and R01–R14 separate the extended Iwahori–Weyl group, its affine Coxeter subgroup and length-zero component from B(G). The integral Kottwitz map takes values in inertia coinvariants; the class invariant passes to further Frobenius coinvariants. The affine Frobenius action, its linear part and the chamber-preserving L-action are recorded as distinct maps. This is needed before averaging a Hodge cocharacter.

A σ-straight translation has length equal to the pairing of its dominant Newton point with 2ρ. Equality in the averaged length estimate places the relevant iterates in one chamber. Zero root pairings then make the translation cocharacter central in its Newton Levi. The absolute lift of that cocharacter is also central after the inertia-averaging argument. These are proof inputs to the deformation construction, not ornamental combinatorial facts.

B(G,μ) imposes **both** the Kottwitz equality and the rational Newton inequality. A μ-ordinary class has Newton point exactly μ-diamond. A unique maximal element of B(G,μ) need not be μ-ordinary for a non-quasi-split group. The extraction records existence separately. Once an ordinary admissible element is given, Proposition 2.3.3 obtains an integral σ-conjugator, a stronger result than equality of B(G)-classes. That integral result is used to normalize the actual Dieudonné lattice.

The full fixer model, connected parahoric, torus Néron lft model, finite-type open submodel and identity component are five different objects. For a torus, the finite-type submodel retains torsion components of the inertia-coinvariant cocharacter group, whereas the identity model retains only zero. R-smoothness is smoothness of a particular schematic closure; it enables the closed-immersion and quotient arguments. In a restriction of scalars of a tamely split torus, the restricting field extension itself may be wild. In the central quotient theorem, the integral kernel closure may have components and the conclusion is fppf exactness, not only exactness of generic points.

### Local models and tensor deformations

M01–M10 distinguish a local model triple, a local Hodge embedding, a good integral embedding and the proper flat integral local-model scheme. The scheme has a generic flag variety and a reduced admissible special fiber. Its relation to the Scholze–Weinstein v-sheaf is a theorem, not a definition that automatically gives a scheme. A Witt perfection is also not automatically a finite-type scheme.

The group cocharacter convention changes between the local model and the contravariant deformation problem. The local-model lattice is represented by πgΛ modulo π; the deformation filtration uses the corresponding inverse Hodge cocharacter. These signs must be checked against each realization map. Goodness is a closed Grassmannian embedding. It does not by itself supply very goodness.

D01–D20 describe the Zink coefficient ring, Hodge lattice, defining tensors, tensor-orbit completion, adapted deformation and Frobenius-image torsor. Very goodness says that a canonical comparison over the quotient by m²+π_E preserves the tensors. The comparison must be reduced modulo that ideal on **both** sides. KPZ's read equation supplies this formulation. Tensor independence follows because the comparison descends to the intrinsic tensor-isomorphism torsor.

The versal criterion 3.2.7 uses assumptions A, B and C: acceptability, goodness and very goodness. Its torsor argument uses Anschütz in place of the defective earlier input. The ordinary construction in §3.4 is a separate route: it assumes A and B plus equality of full fixer and parahoric, constructs a central-Levi filtration and a height-one Breuil–Kisin module directly, and uses classification to obtain the lift. It does not import C as an unexplained universal hypothesis. The lifted J_b(Q_p) action is rational because the theorem works in the isogeny category.

### Integral Shimura stacks and ordinary lifting

S01–S44 retain stacks at non-neat level. The proof of the abelian theorem selects a p-level containing a chosen Frobenius lift; imposing a neatness condition arbitrarily can lose that element. Schemes at auxiliary small level are used with their quotient-stack descent, preserving inertia and rational objects.

Strong acceptability requires a Hodge-type datum, a derived group locally expressed as restrictions of **split** groups, induced central-torus factors, and a very-special parahoric. A special vertex is not automatically very special after unramified base change. The auxiliary Hodge cover has separate outputs: derived fundamental group, reflex-field splitting, a globally very good embedding, R-smooth center and torsion-free abelianized coinvariants. These properties feed different steps and are not collapsed into a generic “good model” assertion.

The component-group `*` product was checked in KP18 §4.5.6. If Δ acts on H and φ:Γ→Δ satisfies the source equivariance and inner-action conditions, it is the quotient of H⋊Δ by the normal subgroup of pairs (γ,φ(γ)⁻¹). It is **not** a free amalgamated product. S21 gives this construction; S41–S44 give the four adelic/integral and neutral level-action groups. Their closures, positive real-adjoint subgroups and finite coset translates matter when moving a lift off the neutral component.

The integral local-model diagram uses an adjoint parahoric with **connected** special fiber. That connectedness enables Lang's theorem over F_q. The functoriality theorem on completed local rings assumes an isomorphism on derived groups, not merely a central isogeny. The comparison datum G₃ is the identity component of the fiber product over both the common adjoint group and G_m: its two multipliers must agree. This makes the direct-sum symplectic representation valid and identifies the pulled-back abelian object with A₁×A₂.

Ordinary density retains the existence and normality hypotheses. The special-point lift is first constructed on the auxiliary Hodge model, transported using completion comparisons and isogeny-group exact sequences, then moved through the component and Hecke actions. The I_x rank theorem and lift-independent crystalline tensors are imported from the candidate KMPS continuation, whose previous partial extraction is not treated as a completed proof.

### Curves, companions and rationality

C01–C13 isolate the special-fiber geometry. Schubert dominance uses a **nonnegative integral** coroot combination. Newton dominance instead uses a rational cone. For example, in PGL₂ coordinates with coroot 2, a difference of 1 is rational-positive but not integral-coroot-positive. Omitting nonnegativity would turn the alleged order into a symmetric lattice relation.

The essential curve theorem provides a smooth geometrically connected curve over the original F_q and an F_q-rational marked preimage of the lower-stratum point. The three rank-one constructions are split SL₂, standard SU₃ and the nonstandard ramified SU₃ parahoric. The last uses x↦u_−(x,−x²/2), which explains the odd-prime restriction in that calculation. The matrix identity and its conjugated integrality were verified symbolically with Laurent polynomials. This checks an algebraic step; it does not prove the closed-immersion or geometric stratum assertions.

Two gaps in this bridge are deliberately visible. Rapoport's read Stembridge lemma gives a single positive-coroot step. It does not by itself justify summing a Frobenius orbit of those steps. Kisin–Zhou's orbit-sum assertion needs its exact root-action argument. Also, the read Poonen Corollary 3.4 assumes a smooth projective geometrically integral ambient variety; the stack proof obtains a smooth scheme chart. The local/quasiprojective reduction giving a curve through the same rational point and meeting the required open must be supplied explicitly. An arbitrary finite extension is not a substitute: it replaces Frobenius by a power, and distinct classes can have the same power.

Chin's Theorem 4.6 applies to an irreducible or semisimple lisse sheaf on a smooth finite-field curve that is **plain of characteristic p**. This means algebraic Frobenius eigenvalues which are units at every finite place away from p, not only at the coefficient prime currently in use. The original sheaf need not have finite-order determinant: a plain constant rank-one twist reduces to that case, companions are constructed, and the twist is undone. The system is actual sheaves at coefficient places with matching polynomials, not merely a list of polynomials.

The downward KR induction compares arbitrary algebraic representations. On the curve's higher-stratum open the companions agree; curve Chebotarev and semisimple recognition extend that agreement to the rational marked point. The density supplier is DeligneWeightsAndPurity DWP.3, which explicitly constructs the finite-field closed-point theorem with constant-field degree constraints. The finer R01.5 decomposition concerning G_Q is not an exact replacement for it.

All algebraic representations separate geometric semisimple classes. One faithful representation is insufficient: the torus t↦diag(t,t⁻¹) identifies the GL₂ characteristic polynomials of 2 and 1/2 without identifying them in the torus. A finite map from Conj_G to the faithful GL quotient proves only that the class is algebraic. Rationality is a second step. Its residue field has a degree-one prime above every rational prime away from p; in a Galois closure this forces the stabilizer subgroup to meet every conjugacy class. Burnside's count on its cosets then forces that subgroup to be the whole group. “A degree-one prime exists” is not “the prime splits completely.”

Finally, the abelian application uses a totally real restriction-of-scalars datum with diagonal multiplier, followed by a **central product** with a torus. This second construction is a quotient by an inverse diagonal center, not a fiber product with unspecified maps to that center. Its conjugacy quotient contains Conj_G injectively and Galois-equivariantly. The finite extension realizing the integral Shimura point has residue degree one at v; it need not be unramified. Applying the geometric theorem then descends the common class back to G. The real compact-form argument must choose a semisimple lift: absolute values of eigenvalues alone do not put an arbitrary nonsemisimple matrix into a compact group.

## Baseline and ownership decisions

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Thirty cited declaration records include exact statement slices and file hashes. The Witt, isocrystal, reductive-group, torus, character/cocharacter, dominant-chamber and abelian-variety carriers are reused. Rank-one isocrystal classification is not promoted to full Dieudonné–Manin. An isogeny predicate is not a rational isogeny category. A divided-power structure is not a PD envelope or crystalline site.

The additional checks found the pinned Coxeter Bruhat order and its partial-order structure. Its file expressly leaves a converse subword direction outside that file; no full affine-geometric theorem is inferred. Mathlib's Burnside fixed-point count supplies E13's finite-action argument. API names in this checkpoint are planning proposals even when their underlying carrier is a library item.

The inspection snapshot contains 290 blob-verified files, including all 211 roadmap extracts, acquired proposals/packets and all current integrated decompositions. They were screened by mathematical terms; this does not claim a full reading of every document. Exact relevant stages and finer nodes were read, including RG2, GS0, GlobalShtukas GS.0–7, DWP.3, LPV.3, ET.0, R07.4/6, R09.4, BG0/1 and the R01.5/VB0 finer nodes. The two nearby upstream documents, ReductiveGroups and RootSystems, were read fully earlier in this session. Their work is not replanned.

The reviewed audit identifies the same boundaries: B(G) and higher-rank slopes are unbuilt beyond the point-isocrystal carrier; GS0 does not provide local-model schemes; GS.6's full function-field correspondence remains unbuilt; R34.2 imports abelian weights from DWP.1. Exact RG2/R07.4 keys were absent from the acquired reviewed aggregate, so there is no invented reviewed absence verdict for them. The VB0 finer node contains a ring-versus-field wording issue and a slope convention; it is a lead with an explicit adapter gate, not a silently exact import.

### Route 1: BunGAndNewtonStrata

BG0 owns B(G), J_b and G-isocrystals; BG1 owns Newton/Kottwitz classification and its order. Add the straight-translation and mu-ordinary results here, importing extended affine Weyl and parahoric structure from RG2. No second local sigma-conjugacy theory is proposed.

Existing stages: BunGAndNewtonStrata:BG0, BunGAndNewtonStrata:BG1.

Items: N07, N08, N09, N11, N12, N13, N15, N17, N18, N19, N20, N21, N25, N26.

### Route 2: ReductiveGroupsPartII

The existing local-group continuation owns valued roots, buildings, full fixers, parahorics and their double cosets. R-smooth torus models and integral closed-embedding/quotient lemmas are inputs to its root-chart and integral-model proofs. Keep torus Neron lft models here; R11.1 is specifically the abelian-variety Neron existence route. Lang and its congruence-level application supply connected special-fiber lifting.

Existing stages: ReductiveGroupsPartII:RG2.1, ReductiveGroupsPartII:RG2.2, ReductiveGroupsPartII:RG2.3, ReductiveGroupsPartII:RG2.4.

Items: N02, N04, N06, N10, N23, R01, R02, R03, R04, R05, R06, R07, R08, R09, R10, R11, R12, R13, S20, A06, R14.

### Route 3: GlobalShtukasAndFunctionFieldLanglands

GS.6 explicitly proves the full GL_n correspondence with finite-order determinant and separates extension by twists. Chin plainness, constant twists and compatible companion systems supply that exact coefficient/twist interface. Do not create a second function-field Langlands or companions roadmap; E10 imports the curve-density theorem separately.

Existing stages: GlobalShtukasAndFunctionFieldLanglands:GS.6.

Items: E04, E05, E06, E07.

### Route 4: ArithmeticGaloisRepresentations

R01.5 owns semisimple recognition from Frobenius polynomials. Its current finer G_Q/finite-field-descent node does not itself prove the curve case. Add the curve application using the already-owned DWP.3 closed-point Chebotarev theorem and the same Brauer–Nesbitt supplier.

Existing stages: ArithmeticGaloisRepresentations:R01.5.

Items: E10.

### Route 5: AlgebraicModuliForArithmeticGeometry

R09.4 owns algebraic stacks and smooth atlases. The rational-object smooth-atlas lemma belongs to that construction, with LMB6.3 hypotheses proved explicitly. The Shimura route imports it and retains inertia rather than passing to coarse moduli.

Existing stages: AlgebraicModuliForArithmeticGeometry:R09.4.

Items: C10.

### Route 6: GeometricSatakeLocalModelsPartII

GS0 owns loop/Schubert, Witt and v-sheaf geometry. The flat proper O_E local-model scheme, good integral Hodge embeddings and same-residue-field curves add a distinct integral-model layer. GlobalShtukas GS.1 supplies classical equal-characteristic flag geometry; it does not assert the mixed-characteristic integral extension.

Begin with Geometric Satake over the Fargues–Fontaine curve (GeometricSatakeAndFusion GS0), importing its loop, bounded Schubert and Witt comparison geometry; import classical equal-characteristic flags from GlobalShtukasAndFunctionFieldLanglands GS.1 and valued roots/parahorics from ReductiveGroupsPartII RG2.1–4. Define acceptable local model triples and good integral Hodge embeddings. Construct the proper flat O_E local model with generic flag fiber and reduced admissible special fiber, using the exact KPZ/AGLR/Levin hypotheses. Prove good embedding existence for p>2 with the prime-to-p derived fundamental-group and R-smooth centralizer conditions, including the symplectic trace and lattice criteria. Identify the special fiber with the equal-characteristic Schubert union and prove Kisin–Zhou5.2.3: every rational lower-stratum point admits a smooth geometrically connected curve with a rational marked preimage over the SAME finite field and dense open in a higher stratum. Import the positive-coroot step from RootSystemsDominancePartII, and close its Frobenius-orbit strengthening before using it. Prove all three rank-one curves, the closed rank-one flag embedding and the connected-stabilizer Lang lift. Do not infer this curve property for arbitrary normal schemes. The final-text and original-source gates remain binding.

Items: M01, M02, M03, M04, M05, M06, M07, M08, M09, M10, C01, C02, C04, C05, C06, C07, C08, C09, C13.

### Route 7: FiniteFlatGroupsWithTensorsPartII

R07.2 and R07.4 already own Dieudonne and Breuil–Kisin classification, while R07.6 states deformation tangent/obstruction exports. Tensor-adapted versal rings, corrected very-good display data and whole J_b-action lifts require further layers; they import those classifications.

Build on Finite flat group schemes and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2,R07.4,R07.6), retaining the existing integral classification rather than duplicating it. Import Witt and divided-power carriers from the pins, crystalline comparison through PadicHodgeTheory R06.5/CohomologyComparisons, local model schemes from GeometricSatakeLocalModelsPartII and ordinary Newton/Levi theory from BunGAndNewtonStrata. Define the Zink Witt ring, displays, tensor orbit deformation ring, adapted lift and tensor isomorphism torsor with full coefficient maps. Define very goodness using the canonical comparison reduced modulo m^2+pi_E on both sides. Prove the corrected versal adapted-deformation criterion under A,B,C and the integral etale/crystalline tensor comparison using Anschütz, not the defective earlier KP18 input. Separately prove Kisin–Zhou3.4.5 under its A,B,full-fixer-equality and ordinary hypotheses: construct a height-one Breuil–Kisin lift with central Levi filtration, prove adaptedness and lift the entire J_b(Q_p) action in the isogeny category. Do not assert uniqueness or an action by integral automorphisms. Close G-display and the tensor normalization gate before exporting these statements.

Items: D01, D02, D03, D04, D05, D06, D07, D08, D09, D10, D11, D12, D13, D14, D15, D16, D18, D19, D20.

### Route 8: ShimuraVarietiesHondaTatePartII

Reuse the same candidate continuation proposed by PAPER-KISIN-MADAPUSIPERA-SHIN-22; that merged checkpoint is not an accepted supplier. This source adds strongly acceptable integral stacks, ordinary special lifts, common rational Frobenius classes and the abelian application. Merge the briefs at design intake, without creating a competing integral Shimura roadmap.

Extend Complex Shimura varieties and canonical models (ShimuraVarieties V4–V8) using the existing candidate ShimuraVarietiesHondaTatePartII from the KMPS22 extraction. Import ShimuraData D3–D5, PELModuli integral Siegel moduli, AutomorphicBundles B1 tensors, AbelianSchemesAndArithmeticModuli A4 Serre–Tate, and the two local-model/tensor-deformation continuations in this extraction. Define strongly acceptable triples with the induced central tori and very-special parahoric condition, and retain non-neat quotient stacks. Construct integral models, their corrected auxiliary Hodge cover, component-group semidirect quotients, adjoint local-model diagram and precise functoriality. Prove Kisin–Zhou4.4.6: at p>2 every mu-ordinary point has a special-point lift carrying I_x(Q) in the isogeny category. Prove density with the stated ordinary-existence and normality hypotheses. Import same-field local-model curves, the rational-point stack atlas and finite-field Bertini, and prove the Shimura curve corollary. Import Chin companions from GlobalShtukasAndFunctionFieldLanglands GS.6 and curve recognition through ArithmeticGaloisRepresentations R01.5 with DeligneWeightsAndPurity DWP.3. Deduce Theorem 5.1.4, a common point of Conj_G(Q) for all ell different from p. Then construct the totally-real diagonal-multiplier and central-product enlargement and the finite extension with residue degree1 to prove Theorem 6.2.7 for good-reduction abelian varieties after the common finite Mumford–Tate factorization extension. No Mumford–Tate conjecture, type-D exclusion, ell=p assertion or bad-reduction theorem is part of this target. Import quotient descent and the optional rational-representative refinement from ReductiveGroupsArithmeticPartII. Close every source gate listed in the report before claiming completion.

Items: P15, S01, S02, S03, S04, S05, S06, S07, S08, S09, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S21, S22, S23, S24, S25, S26, S27, S28, S29, S30, S31, S32, S33, S34, S35, S36, S37, S38, S39, S40, C12, E01, E03, E08, E11, E15, A05, A07, A08, A09, A11, A12, S41, S42, S43, S44.

### Route 9: ReductiveGroupsArithmeticPartII

Reuse the KMPS22 candidate for global arithmetic conjugacy. ET.0 already owns rational/stable conjugacy and cohomological parameterization; import it. This route adds the invariant quotient scheme, representation separation, rational descent, Mumford–Tate comparison and the exact elliptic representative refinement, without duplicating ET.0 or RG2 local theory.

Build on Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), retaining the candidate ReductiveGroupsArithmeticPartII already proposed by PAPER-KISIN-MADAPUSIPERA-SHIN-22. Import stable/rational conjugacy, inner twists and group-specific cohomological parameterization from EndoscopicTransferAndUnitaryTraceComparison ET.0; local parahorics remain ReductiveGroupsPartII. Construct Conj_G=Spec O(G)^G, T/W and the finite map to a faithful representation quotient. Prove separation by all algebraic representations, including the reductive extension of Steinberg6.6, and prove the Chebotarev residue-field descent with the explicit finite-coset derangement lemma supplied by Mathlib Burnside. Construct the Mumford–Tate and absolute-Hodge comparison interfaces and Galois-equivariant quotient injections for diagonal restriction and central products. For the common abelian Frobenius class prove a real elliptic lift using a SEMISIMPLE representative. Under G_der simply connected and G_Qp quasi-split, prove Kisin–Zhou6.3.4 through the precise Kottwitz90 patching argument: a rational elliptic representative agrees over Q_ell for all but at most one ell different from p. The exceptional prime can be selected from a positive-density set but the representative may change. Do not identify quotient rationality with rational conjugacy or infer the conjectural strengthening without these restrictions.

Items: E02, E09, E12, E13, E14, A01, A02, A03, A04, A10, A13, A14, A15.

### Route 10: RootSystemsDominancePartII

The upstream root roadmap supplies positive roots, lowering, Coxeter and chamber theory and must not be replanned. The Stembridge dominance-step contract is not one of its stated targets, and a search found no matching pinned theorem. This narrow continuation supplies the reusable integral order lemma, with the Frobenius-orbit adaptation checked in its local-model consumer.

Build on Root systems (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems), importing its finite reduced crystallographic root data, bases, positive roots and chamber API, including pinned dominant representatives and Bruhat carriers where they match. Define or reuse the nonnegative INTEGRAL coroot dominance order, distinguish it from rational dominance, and prove the exact Stembridge step in Rapoport00 Lemma 2.3: between distinct comparable dominant integral cocharacters one can add a positive coroot while staying dominant and below the upper endpoint. Decompose the maximal eligible coroot proof into the root-sum and simple-pairing lemmas it uses. Test PGL2 parity and rank-two examples. Export this one generic lemma to the local-model curve proof; that consumer must separately establish its Frobenius-orbit sum strengthening. Do not duplicate the upstream chamber or root-lowering construction.

Items: C03.

### Route 11: LefschetzFiniteFieldBertiniPartII

LPV.3 expressly allows a finite field extension to obtain a pencil and warns against claiming an F_q-point. Kisin–Zhou needs a curve through a prescribed rational point over the original F_q. This is additional finite-field Bertini strength, not an automatic consequence of the existing layer.

Extend Lefschetz pencils, nearby cycles and vanishing cycles (LefschetzPencilsAndVanishingCycles LPV.3), importing its projective incidence, tangent-space and jet conditions together with AlgebraicModuliForArithmeticGeometry scheme foundations. Prove Poonen finite-field Bertini with prescribed local conditions, then Corollary 3.4 for a smooth projective geometrically integral variety and a prescribed finite set of closed points. Supply the precise quasiprojective/local reduction used by Kisin–Zhou5.2.7: through a specified F_q-rational point of the relevant smooth scheme, construct a smooth geometrically connected curve meeting the designated dense open, without extending F_q. The read Corollary 3.4 alone has a projectivity hypothesis; resolve this gap by an explicit argument rather than dropping it. Keep the rational-point atlas theorem in AlgebraicModuliForArithmeticGeometry R09.4 and local-model rank-one curves in GeometricSatakeLocalModelsPartII. Test that replacing F_q by F_(q^n) changes the Frobenius to its nth power and therefore is not a valid substitute here.

Items: C11.

## Open source gates

These are required continuation tasks. A successful JSON checker does not close them. In particular, grouped prerequisite-paper leads in the JSON are explicitly incomplete and must be expanded before a complete extraction is claimed.

- **G-version**: Compare the fully read arXiv2103.09945v2 (7 October2024) against the final Annals revision (19 November2024). Resolve explicit printed anomalies: torsion versus torsion-free in4.2.3(5), missing right mod-a base change in3.2.5, Tate-lattice base/tensor labels in3.3.2.1, nonnegative in5.2.1, full loop field in5.2.5, and H^1/H_1 conventions. Reconcile KPZ locators across versions; v1 Proposition 7.2.18 contains the needed torsion-free output.
- **G-local**: Read and decompose He14,He16,He–Nie18,He–Rapoport17,He–Zhou20 and Haines–Rapoport08 at the cited results. Prove the straight-representative/length, ordinary existence, integral conjugacy and full-fixer component adapters. Keep maximal acceptable class distinct from mu-ordinary in inner forms.
- **G-neron**: Expand the torus Neron lft/finite-type/identity models, schematic closure and R-smoothness using Edixhoven/BLR and the exact KP18/BT root charts. Verify component kernels and fppf exactness, and the rank-one SU3 closed embedding beyond the explicit primitive SL2 lattice check.
- **G-models**: Read the precise KPZ,AGLR,FHLR,Levin and Scholze–Weinstein theorems proving local-model scheme representability, reducedness, normal/Cohen–Macaulay components, good embeddings and globally very good covers. KPZ v1 pp52–53,82–84 were read selectively, not its full proof. Resolve numbering changes and the ordinary-smooth implies very-good citation.
- **G-display**: Extract all display axioms and Zink classification, Anschütz Proposition 10.3, and Kisin10 height-one equivalence. Verify tensor torsor triviality and the canonical mod-a section, then the distinct direct central-filtration Breuil–Kisin construction. D04 remains a consumer contract until its source axioms are expanded.
- **G-tensors**: Complete Deligne absolute-Hodge, Blasius–Wintenberger, KMPS singular-base tensor extension and rank/centralizer suppliers. Reconcile integral etale/crystalline tensor normalizations and prove the rational group/action comparisons. A merged KMPS checkpoint is evidence of a candidate owner, not a proved import.
- **G-components**: Continue KP18 §4.5.6 and§4.6 and KPZ component descent beyond the star-product definition actually read. Prove topology, closure, group action, finite coset J, reflex-field unramified descent and all component transport maps. Split the multi-step action/gluing proofs to declaration size.
- **G-functoriality**: Acquire Pappas–Rapoport canonical integral-model/shtuka results and the exact completed-local identification theorem. Prove the extension maps, derived-isomorphism completion comparison, neutral component isomorphism and matched-multiplier fiber-product compatibility; avoid substituting a derived isogeny.
- **G-roots**: Rapoport00 Lemma 2.3 and its proof on pp157–158 were read. Its ordinary positive-coroot step does not state the Frobenius-orbit SUM claim on KZ p50. Prove that extra choice/inequality with all diagram-action hypotheses, rather than summing separate inequalities.
- **G-curves**: Verify the rank-one flag closed embedding and Lang reduction through finite-type stabilizer/congruence quotients. Poonen04 Corollary 3.4 was read and is projective; provide the quasiprojective/local curve-through-point reduction needed in5.2.7. Same residue field and geometric connectedness cannot be replaced by a finite extension. The exact SU3 identities were checked, not the full geometric proof.
- **G-stacks**: Read LMB Theorem 6.3 with its exact hypotheses and construct the smooth scheme atlas carrying the specified F_q-rational object. Prove quotient-stack level descent and the residue-degree-one realization; coarse points do not suffice.
- **G-companions**: Chin04 §2.1 and§§4.2–4.6 were read; complete its prerequisite§4.1 and the exact Laurent Lafforgue theorem, determinant twisting and coefficient-field descent. Import DWP.3 finite-field closed-point density and R01.5 semisimple recognition. Verify that E08 gives plainness at every non-p valuation, not merely at one coefficient place.
- **G-global**: Complete invariant-quotient construction/finiteness, the reductive extension of Steinberg6.6, number-field Chebotarev, totally-real approximation/Krasner, rational torus transfer, and Langlands–Rapoport5.6/Kottwitz90 p188. Choose a semisimple lift for the compact-form argument and retain the one-prime exception.
- **G-weights**: Pin the dual Tate versus H^1, geometric versus arithmetic Frobenius and multiplier conventions. Import the actual DWP.1 abelian Weil/Rosati theorem and prove preservation of non-p units under all algebraic representation operations.

## Source acquisition and actual reading

- [cambridge](https://www.dpmms.cam.ac.uk/~rz240/l-indep_v2.pdf): TLS certificate verification failed; no PDF acquired.
- [arxiv](https://arxiv.org/pdf/2103.09945): All 63 pages read, including all sections and references. Images of pages23,25,34,48,52,53,55 inspected. Page60 text read; its image was generated but not inspected. SHA-256 `62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8`.
- [published](https://annals.math.princeton.edu/wp-content/uploads/annals-v202-n3-p03-p.pdf): Guessed publisher PDF URL returned404. Publisher landing-page metadata and arXiv identity agree; final text has NOT been compared.
- [chin](https://arxiv.org/pdf/math/0206147): PDF pages 5,11,12,13 read: definition of plainness,§§4.2–4.6 and beginning of§5. The rest was not read. SHA-256 `c0e3b107c6c5e8067bc01208e7bdea8c4196387c91bf74afa21c6c6baa0b3e40`.
- [poonen](https://math.mit.edu/~poonen/papers/bertini.pdf): PDF pages 10–11 read: Theorem 3.3,Corollaries3.4–3.6 and follow-on applications. The proof of Theorem 1.2/1.3 was not read. SHA-256 `52bbee7fc56a181b5c745d729a9125e4bfd702a5a860058043874bfba0d17e9d`.
- [steinberg](https://www.numdam.org/item/PMIHES_1965__25__49_0.pdf): PDF pages16–17 read: printed pp65/64 in scan order,Corollary 6.6 and surrounding invariant-quotient discussion. The reductive central-torus extension was not independently sourced. SHA-256 `bda20c4a4b3cf4a7e9e5b17a4eacd0147d0c9370063ab3a3778114a53c8349b9`.
- [kpz](https://arxiv.org/pdf/2409.03689v1): arXiv2409.03689v1. PDF pages44,52,53,82,83,84 read. The earlier attempted4.3.9 locator is different in this version; it does not verify KZ ordinary-smooth citation. The full 88-page paper was not read. SHA-256 `b508c1ea29f8c8aeeb656ee0af95851af08d8e2ef381fef4462133db772dc8fe`.
- [rapoport](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/satake.pdf): PDF pages 5–6 (printed157–158) read, including Stembridge Lemma 2.3 and its full displayed proof. Other pages not read. SHA-256 `8dfb39087041244845bb0fdd57cdd52c1bda3d70b8eebc02711df7cb90d2f71d`.
- [kp18](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf): Published Numdam PDF page75 (printed195),§4.5.6 star-product definition and surrounding action discussion read. Other 97 pages not read. SHA-256 `e2b4a0763f216be82da950f4c0dd2800adea8a0d911b12bfacf2b7e493b4618b`.

## Validation and continuation

`check_paper.py` passes. A separate semantic validator checks unique IDs, the acyclic item dependency graph, exactly one route for every missing item, all definition/construction APIs and tests, the pinned declaration hashes, all 290 input blob and SHA-256 hashes, and real galaxy IDs for the new routes. The intake path check is run on the two deliverables and handoff after all three files exist. No suggested Lean file is authorized by this paper issue, so no Lean file was written or compiled.

The nine executed checks cover faithful-polynomial collision, Frobenius-power collision, the S₃ coset derangement count, integral versus rational coroot order, the exact SU₃ source matrix identity, the Hermitian equation, nonstandard parahoric integrality after conjugation, an ordinary versus averaged slope example, and invertibility of 2. The 267 proposed API tests are specifications and were not Lean-checked.

Preserve item IDs in the continuation. Resolve source/version and curve gates first, then complete the original local-model/display, component/functoriality and global arithmetic suppliers. Reconcile the reused KMPS candidate IDs with its accepted design state before integration. No roadmap files or upstream documents are changed by this paper job.

## Item index

The JSON contains the mathematical statements, dependency edges, API, tests and source gates. The following index makes the section coverage reviewable without treating a source locator as a planet name.

| ID | Item | Status | Locator |
|---|---|---|---|
| L01 | Witt-vector coefficient carrier | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L02 | Frobenius on the Witt fraction field | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L03 | Point-valued isocrystal | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L04 | Morphism of point-valued isocrystals | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L05 | Rank-one isocrystal classification | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L06 | Connected reductive group predicate | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L07 | Algebraic torus predicate | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L08 | Geometric character lattice | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L09 | Cocharacter lattice and pairing | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L10 | Perfect character-cocharacter pairing | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L11 | Closed dominant chamber of a root pairing | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L12 | Unique dominant representative in a Weyl orbit | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L13 | Abelian variety over a field | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L14 | Geometric isogeny | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L15 | Divided-power structure | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L16 | Finite free cocharacter lattice | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L17 | Galois invariance of the pairing | library | §§2.1–2.4 and §§3.2–3.4 (coefficient, root and group carriers); §6.1 (abelian carriers) |
| L18 | Coxeter Bruhat order | library | §2.1.2 |
| L19 | Burnside fixed-point count | library | Proof of 5.1.4, finite-group descent step |
| P01 | Hodge-type Shimura datum | planned | §§4.1,6.1 |
| P02 | Reflex field and generic canonical tower | planned | §§4.1–4.2 |
| P03 | Contravariant Dieudonne module | planned | §§3.2–3.4 |
| P04 | Height-one Breuil–Kisin module | planned | Proof of 3.4.5 |
| P05 | Barsotti–Tate classification | planned | 3.4.5, Kisin10 |
| P06 | Serre–Tate deformation | planned | Proofs of 4.1.9 and 4.1.11 |
| P07 | Integral crystalline and etale comparison | planned | §§3.3–3.4 |
| P08 | Absolute Hodge tensors | planned | §§4.1.5–4.1.8,6.1 |
| P09 | General algebraic quotient stacks | planned | §§4.1.1,4.2.5,5.2.7 |
| P10 | Affine Weil restriction | planned | §§2.4,3.1,6.2 |
| P11 | Finite-field abelian Frobenius weights | planned | §§5.3.2–5.3.3,6.3 |
| P12 | Rational and stable conjugacy | planned | §§5.1,6.3 |
| P13 | Semisimple Frobenius recognition | planned | Proof of 5.3.5 |
| P14 | Finite-dimensional isocrystal slopes | planned | §§2.2,3.4 |
| P15 | Rank of the tensor isogeny group | missing | Proofs of 4.1.11 and 4.4.10; KMPS22 |
| N01 | Iwahori–Weyl group | planned | 2.1.2 |
| N02 | Iwahori–Weyl exact sequences | missing | 2.1.2 |
| N03 | Algebraic fundamental group and Kottwitz invariant | planned | 2.1.2–2.1.3 |
| N04 | Affine and linear Frobenius actions | missing | 2.1.2–2.1.3 |
| N05 | Affine-root Coxeter and translation length | planned | 2.1.2–2.1.5 |
| N06 | Translation length formula | missing | 2.1.5 |
| N07 | Newton point of an extended Weyl element | missing | 2.1.3 |
| N08 | Sigma-straight element | missing | 2.1.4 |
| N09 | Newton criterion for straightness | missing | 2.1.4 |
| N10 | Newton centralizer Levi | missing | 2.1.6 |
| N11 | Straight translation has central Levi cocharacter | missing | Lemma 2.1.7 |
| N12 | Centrality of an absolute cocharacter lift | missing | Lemma 2.1.9 |
| N13 | Mu-admissible set | missing | 2.1.10,2.3.2 |
| N14 | Sigma-conjugacy classes B(G) | planned | 2.2.1 |
| N15 | Straight Weyl classes classify B(G) | missing | 2.2.1; He14 Theorem 3.7 |
| N16 | Acceptable Newton set B(G,mu) | planned | 2.2.2 |
| N17 | Mu-ordinary class | missing | Definition 2.2.4 |
| N18 | Unique maximum versus ordinary existence | missing | Remark 2.2.5; HN18 |
| N19 | Straight translation representative of the ordinary class | missing | Proposition 2.2.6 |
| N20 | Ordinary existence under a derived isogeny | missing | Lemma 2.2.8(1) |
| N21 | Ordinary membership under a derived isogeny | missing | Lemma 2.2.8(2) |
| N22 | Full fixer and connected parahoric | planned | 2.3.1 |
| N23 | Associated parahorics under adjoint identification | missing | 2.3.1 |
| N24 | Parahoric Iwahori decomposition | planned | 2.3.2 |
| N25 | Ordinary admissible element lies in a translation cell | missing | Proposition 2.3.3(1) |
| N26 | Integral conjugacy of an ordinary admissible element | missing | Proposition 2.3.3(2) |
| R01 | Neron lft model of a torus | missing | 2.4.1 |
| R02 | Finite-type and identity torus submodels | missing | 2.4.1 |
| R03 | Torus closure in a split restriction model | missing | 2.4.1 |
| R04 | R-smooth torus | missing | Definition 2.4.2 and following discussion |
| R05 | Closed immersion of Neron lft models | missing | Proposition 2.4.4(1) |
| R06 | Closed immersion of finite-type torus models | missing | Proposition 2.4.4(2) |
| R07 | Weil restrictions of tame tori are R-smooth | missing | Proposition 2.4.6(1) |
| R08 | R-smoothness under torus extensions | missing | Proposition 2.4.6(2) |
| R09 | Closed fixer embedding with equal derived groups | missing | Proposition 2.4.8 |
| R10 | Fixer embedding after field extension | missing | Proposition 2.4.10 |
| R11 | Primitive root-lattice embedding in rank one | missing | 2.4.11 |
| R12 | Integral kernel of a central torus quotient | missing | Proposition 2.4.13 |
| R13 | Smooth fppf exact parahoric quotient | missing | Proposition 2.4.13 |
| M01 | Local model triple | missing | 3.1.1 |
| M02 | Acceptable reductive group | missing | 3.1.2 |
| M03 | Local Hodge embedding | missing | 3.1.3 |
| M04 | Integral local model | missing | 3.1.4 |
| M05 | Local-model strata and components | missing | 3.1.4 |
| M06 | Good integral Hodge embedding | missing | Definition 3.1.6 |
| M07 | Existence of a good integral embedding | missing | Proposition 3.1.9 |
| M08 | Closed local-model map under Weil restriction | missing | Lemma 3.1.10 |
| M09 | Trace symplectic embedding | missing | Proposition 3.1.12 |
| M10 | Admissible lattice criterion | missing | Proposition 3.1.14 |
| D01 | Dieudonne tensors and Hodge lattice | missing | 3.2.1–3.2.2 |
| D02 | Tensor orbit deformation ring | missing | 3.2.2–3.2.5 |
| D03 | Zink Witt ring and augmentation ideal | missing | 3.2.3 |
| D04 | Display of a p-divisible group | missing | 3.2.3; Zink |
| D05 | Adapted deformation | missing | Definition 3.2.4 |
| D06 | Frobenius-image tensor torsor | missing | 3.2.5, equation 3.2.5.1 |
| D07 | Very good integral embedding | missing | 3.2.5; KPZ Definition 5.2.5 |
| D08 | Independence of defining tensors in very goodness | missing | 3.2.5; KPZ Lemma 5.2.3 |
| D09 | Tensor-preserving display section | missing | 3.2.6 |
| D10 | Versal adapted deformation criterion | missing | Proposition 3.2.7 |
| D11 | Integral crystalline tensors and trivialization | missing | Proposition 3.3.2(1) |
| D12 | Generic filtration comes from a group cocharacter | missing | Proposition 3.3.2(2)(i) |
| D13 | Cocharacter filtration lifts the special filtration | missing | Proposition 3.3.2(2)(ii) |
| D14 | Adaptedness recognition from comparison tensors | missing | Proposition 3.3.4 |
| D15 | Ordinary Levi has connected fixer | missing | 3.4.1–3.4.2 |
| D16 | Central cocharacter filtration reduces correctly | missing | Proposition 3.4.3 |
| D17 | Sigma-centralizer and its isogeny action | planned | 3.4.4 |
| D18 | Ordinary central-filtration Breuil–Kisin lift | missing | Proof of Proposition 3.4.5 |
| D19 | Ordinary adapted lift exists | missing | Proposition 3.4.5, existence |
| D20 | Entire sigma-centralizer action lifts rationally | missing | Proposition 3.4.5, action |
| S01 | Shimura stack at non-neat level | missing | 4.1.1 |
| S02 | Normal Hodge integral model | missing | 4.1.2–4.1.3 |
| S03 | Global good Hodge embedding | missing | Proposition 4.1.4 |
| S04 | Lift-independent crystalline tensors | missing | 4.1.5–4.1.8; KMPS1.3.7 |
| S05 | Completed normalization branch and adapted ring | missing | Proposition 4.1.9(1) |
| S06 | Adapted deformation detects the chosen branch | missing | Proposition 4.1.9(2) |
| S07 | Tensors distinguish normalization points | missing | Proposition 4.1.9(3) |
| S08 | Tensor-preserving rational isogeny group | missing | 4.1.10 |
| S09 | Special lift at a very good ordinary point | missing | Proposition 4.1.11 |
| S10 | Ordinary points are very good | missing | Lemma 4.1.13 |
| S11 | Integral extension property | missing | Proposition 4.1.15(1) |
| S12 | Hodge local-model diagram | missing | Proposition 4.1.15(2) |
| S13 | Compact central torus Zc | missing | 4.2.1 |
| S14 | Strongly acceptable Shimura triple | missing | Definition 4.2.2 |
| S15 | Auxiliary Hodge cover | missing | Proposition 4.2.3 |
| S16 | Auxiliary derived fundamental group | missing | Proposition 4.2.3(1) |
| S17 | Globally very good auxiliary embedding | missing | Proposition 4.2.3(3) |
| S18 | Auxiliary center is R-smooth and quasi-tame | missing | Proposition 4.2.3(4) |
| S19 | Auxiliary abelianized coinvariants are torsion-free | missing | Proposition 4.2.3(5), corrected required contract |
| S20 | Very-special fixer is connected | missing | Lemma 4.2.4 |
| S21 | Semidirect quotient star product | missing | §4.2.8; KP18 §4.5.6, published p.195 |
| S22 | Integral model from neutral components | missing | §4.2.8–4.2.10 |
| S23 | Strongly acceptable local singularity comparison | missing | Theorem 4.2.6(1) |
| S24 | Strongly acceptable DVR extension property | missing | Theorem 4.2.6(2) |
| S25 | Adjoint local-model diagram | missing | Theorem 4.2.6(3) |
| S26 | Extension of maps of Hodge integral models | missing | Proposition 4.3.2(1) |
| S27 | Derived-isomorphic map preserves completions | missing | Proposition 4.3.2(2) |
| S28 | Neutral-component integral isomorphism | missing | Proposition 4.3.4 |
| S29 | Integral Siegel map for an arbitrary Hodge embedding | missing | Proposition 4.3.6 |
| S30 | Matched-multiplier fiber product datum | missing | 4.3.7 |
| S31 | Connected fixer of the fiber product | missing | Lemma 4.3.8(1) |
| S32 | Good embedding of the fiber product | missing | Lemma 4.3.8(2) |
| S33 | Ordinary locus of the integral Shimura model | missing | Definition 4.4.1 and 4.4.2–4.4.3 |
| S34 | Ordinary locus is open and dense under normality | missing | Proposition 4.4.4 |
| S35 | Product comparison of universal abelian objects | missing | 4.4.7–4.4.8 |
| S36 | Exact isogeny-group sequences for the fiber product | missing | Lemma 4.4.10 |
| S37 | Ordinary special-point lift for a strongly acceptable triple | missing | Theorem 4.4.6, existence |
| S38 | Rational isogeny action on the ordinary special lift | missing | Theorem 4.4.6, action |
| S39 | Ordinary rational Frobenius representative | missing | Corollary 4.4.13 |
| S40 | Auxiliary reflex-field splitting | missing | Proposition 4.2.3(2) |
| C01 | Equal-characteristic local-model Schubert realization | missing | 5.2.1 |
| C02 | Integral Schubert dominance | missing | 5.2.1, p.48 |
| C03 | Stembridge positive-coroot step | missing | Proof of 5.2.3; Rapoport00 Lemma2.3 |
| C04 | Frobenius-stable rank-one step | missing | Proof of 5.2.3, p.49 |
| C05 | Split SL2 Schubert curve | missing | Proof of 5.2.3, Case1 |
| C06 | Standard SU3 Schubert curve | missing | Proof of 5.2.3, Case2 |
| C07 | Nonstandard ramified SU3 Schubert curve | missing | Proof of 5.2.3, Case3 |
| C08 | Rational lift of a positive-loop orbit | missing | Lemma 5.2.5, corrected ambient loop field |
| C09 | Same-residue-field curve in the local model | missing | Proposition 5.2.3 |
| C10 | Rational-point smooth atlas for the relevant stack | missing | Proof of 5.2.7; LMB Theorem6.3 |
| C11 | Finite-field Bertini curve through a point | missing | Proof of 5.2.7; Poonen04 Corollary3.4 |
| C12 | Same-residue-field curve on the Shimura stack | missing | Corollary 5.2.7 |
| E01 | Group-valued etale local system from the Shimura tower | missing | 5.1.1–5.1.3 |
| E02 | Scheme of semisimple conjugacy classes | missing | 5.1.1 |
| E03 | Frobenius quotient point | missing | 5.1.3 |
| E04 | Compatible lisse systems on a finite-field scheme | missing | 5.3.1 |
| E05 | Plain eigenvalues in characteristic p | missing | Chin04 §2 and Theorem4.6, used in 5.3.5 |
| E06 | Constant rank-one twist | missing | Chin04 §4.2–4.3 |
| E07 | Chin companions for plain sheaves on curves | missing | Chin04 Theorem4.6, used in 5.3.5 |
| E08 | All algebraic representations have unit Frobenius eigenvalues | missing | Lemma 5.3.3 |
| E09 | Algebraicity of the quotient Frobenius point | missing | 5.3.2 |
| E10 | Curve recognition from an open subset | missing | Proof of 5.3.5 |
| E11 | Representation-wise Frobenius independence | missing | Proposition 5.3.5 |
| E12 | Algebraic characters separate semisimple classes | missing | Proof of 5.1.4; Steinberg65 Corollary6.6 |
| E13 | A proper subgroup misses a conjugacy class | missing | Proof of 5.1.4, finite-group step |
| E14 | Rational descent from degree-one primes | missing | Proof of 5.1.4 |
| E15 | Rational common Frobenius class on a Shimura stack | missing | Theorem 5.1.4 |
| A01 | Mumford–Tate group of an abelian variety | missing | Definition 6.1.2 |
| A02 | Mumford–Tate group is connected reductive | missing | 6.1.2 |
| A03 | Changing complex embedding changes only the inner form | missing | 6.1.2 |
| A04 | Common finite field of Galois factorization | missing | 6.1.3; Lemma 6.1.4 |
| A05 | Diagonal-multiplier restriction datum | missing | 6.2.2–6.2.3 |
| A06 | A compact element becomes hyperspecial-integral | missing | Lemma 6.2.1 |
| A07 | Totally real field with the needed local extension | missing | Proposition 6.2.4 |
| A08 | Central-product strongly acceptable enlargement | missing | 6.2.5 |
| A09 | The enlargement is strongly acceptable | missing | Lemma 6.2.6(1) |
| A10 | Injective Galois-equivariant conjugacy quotient map | missing | Lemma 6.2.6(2) |
| A11 | Frobenius-preserving extension and Shimura realization | missing | Proof of 6.2.7 |
| A12 | Independence of ell for abelian Frobenius classes | missing | Theorem 6.2.7 (=Theorem1.1) |
| A13 | Real elliptic representative of the common class | missing | Lemma 6.3.3 |
| A14 | Rational representative with one possible exceptional prime | missing | Corollary 6.3.4 |
| A15 | Choice of exceptional prime | missing | Remark 6.3.5(3) |
| S41 | Adelic level-action group A(G) | missing | 4.2.8, first display |
| S42 | Prime-to-p integral level-action group | missing | 4.2.8, second display |
| S43 | Neutral adelic level-action subgroup | missing | 4.2.8, third display |
| S44 | Neutral integral level-action subgroup | missing | 4.2.8, fourth display |
| P16 | Closed-point Chebotarev for curves | planned | Proof of5.3.5; Deligne Weil I §6.13 |
| C13 | Closed rank-one flag embedding | missing | Proof of5.2.3, p.50; PR08 §6.a.1 |
| R14 | Lang surjectivity and rational torsors | missing | Proofs of5.2.5 and5.2.7 |
