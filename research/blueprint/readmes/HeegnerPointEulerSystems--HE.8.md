# Ordinary anticyclotomic Heegner systems: HE.8

This part connects norm-compatible Heegner points to the anticyclotomic Selmer module, the geometric nonvanishing theorem and Howard’s divisibility theorem. It then explains how character specialization turns those inputs into the conditional nonvanishing and refined-index statements of BCGS, and into the determinant formulation of Castella–Sano. Proofs of anticyclotomic main conjectures belong to HE.8b. Their consequences here retain the conjecture as a hypothesis.

The accepted [HE.7s packet](../packets/HeegnerPointEulerSystems--HE.7s.json) already supplies the targets of HE.8. Its scope is broader than its filename suggests. This document imports those targets at their existing IDs and adds eight missing construction or proof interfaces. The imported specification catalogue below makes this part readable without treating any imported item as a newly planned declaration. In particular, the legacy Cornut–Vatsal node keeps its HE.8c ID and its existing HE.8 parent. The separate Nekovář parity addition to HE.7s is outside this issue’s two-paragraph scope.

The [packet](../packets/HeegnerPointEulerSystems--HE.8.json) has complete target coverage and six explicit gaps. HE.8 is planned, not closed. Every declaration remains unchecked. The [Suggested file](../suggested/HeegnerPointEulerSystems--HE.8.lean) contains only statements of elementary normalization formulas over existing ring and module carriers. Actual ring-class fields, compact arithmetic cohomology and determinant lines remain mathematical targets in this document.

## Conventions and hypotheses

In the elliptic-curve branch, E/ℚ is modular of conductor N, and K is imaginary quadratic with signed discriminant D_K<0, odd and different from −3. Every prime dividing N splits in K. The prime p is odd, prime to ND_K, and E has good ordinary reduction at p. These are the common ordinary Heegner hypotheses below. Set T=T_pE, Γ=Gal(K∞/K)≅ℤ_p and Λ=ℤ_p⟦Γ⟧. The involution ι sends γ to γ^−1. The completed coefficient representation uses the inverse tautological Γ-action. An identification with Howard’s direct-action convention must exhibit the corresponding ι-semilinear map, including the exchange of α and α^−1 at specialization.

K[n] is the ring-class field of conductor n, K_k is the degree-p^k anticyclotomic layer, and K_k[n]=K_kK[n]. Points are formed with a fixed integral modular parametrization. The finite Artin group Gal(K[n]/K) is distinct from the relative conductor group Gal(K[n]/K[1]). Derivatives use the actual admissible inert auxiliary primes and coefficient ideals I_n from HE.4–HE.5. They do not use a substitute Mazur–Rubin auxiliary-prime format.

There are two arithmetic branches. Howard’s clean theorem assumes G_K-image GL₂(ℤ_p), p∤h_K and the chapter’s total ramification at the p-adic places. The broader CGLS construction assumes E(K)[p]=0 and uses d(k)=min{d≥0:K_k⊂K[p^d]}; it permits p-primary class-number effects. Its divisibility theorem is localized away from p and the augmentation prime. A weaker construction is not a stronger integral divisibility theorem.

For general Cornut–Vatsal geometry, F is totally real, K/F is CM, P is a finite prime of F, and B/F is the specified quaternion algebra with an embedding of K. Pic(O_F), the central norm-component space and the finite torsion subgroup G0 of the relative ring-class tower remain visible. A fixed character χ0 of G0 obeys the relevant central-character compatibility. This general relative tower is supplied by HE.0; the F=ℚ modular branch is its application.

## The early family and its traced module

Let u be the ordinary unit root of X²−a_pX+p and v=p/u. Howard’s initial factor in ℤ_p[Gal(K[n]/K)] is

\[
\Phi_n=\begin{cases}
(p+1)^2-a_p^2,&p\text{ inert},\\
(p-a_p\sigma+\sigma^2)(p-a_p\sigma^*+\sigma^{*2}),&p\text{ split}.
\end{cases}
\]

The two split Artin elements are retained until augmentation. There the factor is (p+1−a_p)². The algebraic identities p−a_pσ+σ²=(u−σ)(v−σ) and (p+1)²−a_p²=(u²−1)(v²−1) explain the normalization comparisons in the accepted initial-factor and stabilization targets. They do not make Φ a unit. For p=5,a_p=1, augmentation gives 25 in the split case and 35 in the inert case; both have positive p-adic valuation.

At positive conductor, the ordinary stabilization is u^−r(P[p^r]−u^−1P[p^(r−1)]). At conductor zero its separate correction is u_K^−1(1−u^−1σ)(1−u^−1σ*)P[1] in the split case and u_K^−1(1−u^−2)P[1] in the inert case, where u_K is the specified half-unit count. Trace to K_k uses d(k). At a positive degree-p step the raw recurrence is cor(P_next)=a_pP_current−P_previous, while cor(P_current)=pP_current. The repeated full trace to the bottom, rather than the raw one-step trace, has the second-order recurrence with coefficient p. Mixing those two recurrences gives the wrong stabilized class. The first step has its own Artin correction. These statements import `ordinary-stabilized-point` and `stabilized-corestriction` (CGLS, Remark 4.1.3, published pp.568–569).

The accepted `universal-norm-heegner-family` chooses Q[n] in lim H_k[n], where H_k[n] is generated over the actual group ring by P[n] and the traced higher-conductor points. Its bottom is Φ_nP[n], and its tame trace is a_ℓQ[n]. Existence comes from simultaneous finite solvability for fixed bottom projections, auxiliary traces and scalars, followed by compactness. Separate surjectivity of bottom projections does not prove simultaneous solvability. Distinct choices have zero bottom difference and satisfy the homogeneous auxiliary trace relations; they are not asserted equal. These are the accepted common-presentation and compact-lift targets, including their API and counterexamples.

The new `howard-traced-universal-norm-module` singles out the different module needed in Howard’s nonzero-bottom proof. H_k lies in E(K_k)⊗ℤ_p and is generated by field traces from K_k[1], whereas H_k[1] lies over K_k[1]. The norm from the finite class group G maps the latter presentation to the former. Under the clean hypotheses, H=lim H_k is free of rank one with generator κ̃₁. Its inverse-limit Kummer image is the bottom Selmer class. The augmentation computation concerns the traced free presentation H̃^G, and identifies its Γ-coinvariants with aug(Φ)H̃^G_0. It does not identify the arithmetic H_0 with this free presentation or require aug(Φ) to be a unit. Howard’s Theorem 2.3.7 and Lemmas 2.3.8–2.3.9, PDF pp.34–35, supply this proof. The Perrin–Riou rank comparison quoted there remains a precise supplier-verification gap.

The new `broader-tower-descent-verification` instead isolates the weak-torsion adaptation. It must establish the shifted-conductor transition squares, common finite solvability and the invariant vanishing that makes the completed-coefficient restriction map an isomorphism. The pro-p fixed-vector argument for E(K∞)[p]=0 is only one input. Auxiliary ring-class disjointness still needs the HE.4 extension. CGLS, Theorem 4.1.1, published pp.566–568, states this adaptation; this packet records the exact arithmetic checks its abbreviated proof needs. It does not apply Norm_G/|G| integrally when p divides |G|.

## Geometric nonvanishing and the dynamics boundary

Joint distribution is on compatible norm-component fibres of simultaneous CM reduction, not on an unrestricted product of class sets. For each allowed reduction set S, the primes exclude P, B is split there, K is nonsplit there, and |S|+|Ram_f(B)|+[F:ℚ] is even. A finite collection of such sets and a finite set R of shifts distinct modulo the P-rational reciprocity subgroup specify the product. The Galois averaging subgroup is compact open. The accepted `joint-cm-equidistribution` gives Haar-probability averages of continuous functions as conductor tends to infinity in a fixed P-isogeny class. At finite level this yields `joint-cm-orbit-surjectivity` onto the compatible component fibre. These are CV, Theorem 2.9 and Corollary 2.10: the companion published dynamics paper, printed p.272.

Two new proof interfaces expose what this import needs. `adelic-fibre-and-isogeny-annulus` fixes a norm component and a compact open norm-one level away from P before identifying its single cocompact local SL₂(F_P)-lattice quotient. The joint space at a compatible away-P level is a product of these quotients. The raw adelic fibre is their inverse limit; the full finite-level class-set fibre also quotients at P. The target tracks the arithmetic commensurators and parametrizes the CM toric trajectories as expanding annuli. The original torus parameter is a multiplicative compact open subgroup of F_P^×; its scaled annuli are integrated with additive Haar measure on F_P. It reuses current AdelicAlgebraicGroups compactness and strong approximation and the R18 supersingular model. The exact locators are CV-CM, Propositions 2.12 and 2.28 and Lemmas 2.19–2.20, printed pp.275–276,281–282,287–288.

`p-adic-orbit-density-application` is the arithmetic joining step. Orbit closure and the twisted-diagonal stabilizer force every proper joining into the commensurability/partition alternatives. Distinct P-rational shifts exclude them outside a countable Haar-null union of Gal_K^(P-rat)-cosets in Gal_K^ab (Proposition 2.24, printed pp.284–286). Density of each coordinate separately would not prove this product statement. At each away-P quotient its proof is CV-CM, Proposition 2.22 and Lemmas 2.30–2.32 through Proposition 2.35, printed pp.282–283,289–291. Lemma 2.25, p.286, passes back to the full fibre through a countable cofinal family of levels.

Generic p-adic dynamics has a single owner, GN.4 or its homogeneous-dynamics Part II. The requested contract specifies orbit closure, normalized invariant measure, averages over scaled positive-measure compact subsets of the additive local field, and the twisted-diagonal stabilizer/commensurability consequences. CV-CM’s Theorem 2.29 and Lemma 2.30, printed p.289, are the read boundary. The general finite-extension stabilizer input still requires original-source verification; the paper distinguishes that boundary from its ℚ_p citation. Real Ratner or an André–Oort assertion does not supply this contract. This is the existing RT-AREA-iwasawa-1/1 gap, refined rather than assigned a second owner.

The new fixed-torsion trace theorem is deliberately weaker in hypotheses than the accepted primitive-character point theorem. In CV Theorem 4.10, preprint p.41, the rational Pic(O_F)-equivariant quotient π:J↠A has A=A{ω}≠0. A character χ on G0 must restrict to ω^ε on G2≅Pic(O_F). Assume H2: away from P, every prime ramified in K has B split and the local order maximal. Then all but finitely many CM points have nonzero χ-weighted G0-projection in A⊗_{ℤ{ω}}ℂ. H1 and P-newness are not needed in this branch. The denominator |G0| is used in characteristic zero, not declared an integral p-adic unit. With the modular quotient and trivial torsion type this gives the higher-conductor non-torsion trace needed by Howard.

The proof combines the H2 degeneracy maps, a finite tower-torsion bound, joint reduction surjectivity and a reduction prime at which every relevant supersingular fibre exceeds the degree-times-torsion bound. The quantitative fibre-growth and quotient-transport interfaces belong to R18.3–R18.4. CV Lemmas 4.14–4.15, Remark 4.16 and Proposition 4.17, preprint pp.44–50, provide the read proof. The nonconstant quotient map and its fixed degree bound need the explicit quaternionic extension; HE.1 supplies the modular normalization only. This route needs no main conjecture.

The stronger primitive-character statement keeps H1, P-newness, good CM type I or II and sufficiently large exact conductor. For each large conductor it asserts existence of a nonzero primitive-character component, not nonvanishing for every character. The definite branch retains its nonexceptionality condition and its period/L-value comparison. The generic root-number matrix separates the even definite L-value sign from the odd indefinite derivative sign. These endpoints and their arithmetic Gross–Zagier/Waldspurger suppliers remain the accepted HE.7s nodes; the fixed-torsion refinement does not replace them.

## Howard’s bound and near-trivial specialization

The accepted Λ-derivative class combines the point derivative, the correct coset sum, Kummer and integral restriction descent. Its ordinary local membership and finite–singular relation use the actual self-dual Heegner local conditions. The inherited global χ localization-square gap remains open: a local matrix is not automatically a G_K-linear global coefficient map. At an inert auxiliary prime, infinite decomposition is unavailable, so SI.L3’s universal-norm unramified theorem with that hypothesis is not a shortcut.

The new `howard-specialization-hypotheses` verifies the arithmetic inputs to ES.8’s existing abstract self-dual bound: torsion-freeness, controlled normalized height-one specializations, the specialized H0–H5 checks and the arithmetic ι-functional equation. Local finite errors are retained. The accepted clean endpoint makes S Λ-torsion-free of rank one and X pseudo-isomorphic to Λ⊕M⊕M with char(M) invariant under ι and dividing the bottom-class index ideal. Howard’s Proposition 2.1.3, Lemma 2.2.7 through Lemma 2.2.9 and the proof of Theorem 2.2.10, PDF pp.23–28, are the arithmetic verification locators. The broad CGLS endpoint permits the d(k) construction but only gives divisibility in Λ[1/p,1/(γ−1)], with the stated corank-one hypothesis allowing removal of the augmentation localization. Neither endpoint is replanned here.

For α≡1 modulo p^m and I_n=(p^M(n)), reduction of the finite class modulo p^m requires M(n)≥m, equivalently I_n⊂p^mℤ_p. The accepted specialization target multiplies the finite Heegner class by F_p=(p+1−a_p)² when p splits and by F_p=(p+1)²−a_p² when p is inert. This factor can be a nonunit. The reversed membership in CS Lemma 3.1.1, p.13, is the already independently confirmed source issue E2. The current arXiv and author versions were rechecked; this job does not create another erratum ID.

BCGS’s logarithm and split control formulas require crystalline characters of the prescribed Hecke infinity type, nonzero BDP evaluation and sufficient closeness to 1. The characters α_m from infinity types ((p−1)p^(m−1),−(p−1)p^(m−1)) provide such a nontrivial near-identity sequence. A general continuous near-identity character, used in CS’s determinant argument, does not satisfy those crystalline hypotheses automatically. The p-optimal isogeny comparison preserves the product of the Heegner index and local localization cokernel; it does not preserve each factor separately.

The logarithm identity is p^t q=I·C. Here q is the source’s local p-primary H⁰ size and C the localization cokernel size. The split control identity contains finite propagated Sha, C², the product of p-primary local Tamagawa factors over primes of K above N, and q². Evaluating the integral main-conjecture identity and combining these equations gives I₀²=#Sha·∏c_w^(p)·q₀⁴ in the p-optimal normalization. A rational equality permits a bounded p-power error instead. These are BCGS, Theorem 1.2.7 and Corollary 1.2.12, PDF pp.11–14, with the precise lattice/logarithm hypotheses in Theorem 1.2.1 and Lemma 1.2.3.

The uniform rescaled Kolyvagin bound uses one exponent t for the whole system and a near-identity error bound depending only on T_pE. Exact rigidity yields length of the finite propagated Sha quotient equal to 2(M₀−M∞). The verified route here has p>3 and residual surjectivity. E3 records the p=3 proof-threshold gap in BCGS §2.2; its extension is not certified. In the split integral main-conjecture branch, the refined conclusion is M∞=Σ_(ℓ|N)v_p(c_ℓ), half the corresponding K-prime sum. It is not a claim about M₀ or that the bottom class is always nonzero. The rational branch instead proves that some system class is nonzero. Generic deep-prime stability, exact paired rigidity and uniform error estimates remain the existing ES.4 supplier contracts of HE.7s.

## The determinant formulation and its integral input

CS uses the all-p strict ordinary complex: ordinary quotient terms at every v|p, unramified inertia terms away from p and the actual global-to-local cone. Its extended cohomology retains the H⁰ contributions. It is distinct from BCGS’s asymmetric split Greenberg complex. The accepted determinant element is the inverse image of y∞⊗y∞^ι under the rational rank-one identification of det^−1C with S⊗S^ι. The integral basis proposition compares the product of the two index ideals with char(X_tors); replacing that product by a square needs the stated ι-invariance.

The new `perfect-character-base-change` checks perfectness and arbitrary sufficiently near-identity character evaluation for this arithmetic complex and its actual local maps. A finite-layer tensor identity is insufficient. The required derived equivalence must retain Tor and local H⁰ terms, then transport the inverse determinant and its integral lattice. CS equation (3.17) and Corollary 3.3.4 proof, PDF p.16, invoke Nekovář 8.10.1. That precise generic theorem is requested from SI.L3; its original proof was not independently read in this run.

Under nonzero sufficiently near-identity specialization, the accepted determinant lattice comparison has scalar L_p²·Tam_E²·#Sha_prop in the tensor lattice, up to a p-adic unit. Here Tam_E=∏_(ℓ|N)c_ℓ is the rational product, and L_p=∏_(v|p)#Ẽ(k_v). Thus L_p is (p+1−a_p)² in the split case and (p+1)²−a_p² in the inert case. The finite quotient is that of the propagated Selmer group; at a general twist it is not simply identified with Bloch–Kato Sha. Both local squares and the involuted twist are retained. CS Proposition 3.3.2 and Corollary 3.3.4, PDF pp.14–16, supply the precise comparison.

The final new target, `integral-heegner-determinant-containment`, isolates the lower integral bound needed for the converse refined-index implication. Under CS’s p>3 residual-surjective ordinary unramified hypotheses and the Manin-unit normalization, it requires containment of the distinguished element in det^−1C without p∤h_K. CS §3.4, PDF p.17, invokes Howard Theorem 2.2.10 for this step. That abstract bound has A–D hypotheses and no class-number assumption. Howard’s clean arithmetic comparison, Theorem B (PDF p.2), has the class-number hypothesis; the broader CGLS bound only holds after localization. The missing step is arithmetic verification of A–D in the broader tower. The packet therefore records an open broadened integral A–D application contract, including the pΛ and augmentation primes. The clean verification is a comparison case, not a theorem applied outside its hypotheses. No counterexample or source erratum is asserted.

Integral containment is independent of the main-conjecture equality. Once it is known, a basis specialization and the appropriate local unit criterion lift the distinguished integral element to a Λ-basis. Assuming the desired equality to prove containment would make the converse circular. The conditional integral equivalence and the inert conjectural branch stay at their accepted IDs; an unconditional proof of the requisite main conjecture remains HE.8b work.

## Structure, suppliers and acceptance

The early family, geometric nonvanishing and clean Howard exports precede BSD.7a and the downstream HE.8b main-conjecture discharge. Conditional specialization conclusions carry mathematical hypotheses rather than reverse dependencies on their proofs. If the atlas requires stage-wide edges, the proposed early HE.8e and late HE.8s split separates those interfaces. HE.8 and HE.8b must be extracted separately from the roadmap anchors, lines 102–108 and 110–116. The HE.8c bookkeeping edges are removed only through the maintainer’s accepted restructuring process. The existing six planet choices are reused: the anticyclotomic class, joint distribution, Howard divisibility, BCGS nonvanishing, refined divisibility and CS equivalence. This refinement adds none.

The packet’s proposed refinement edges attach the new inputs to the corresponding accepted consumers. The traced rank-one generator theorem supplies only the clean branch of the broader bottom-class target; it must not become an unconditional prerequisite imposing p∤h_K there. Assembly retains the separate CGLS route; existing packets and atlas data are not edited. All chains end in existing nodes, requested stages or explicit gaps. GN.4 owns generic dynamics; AA owns measures/compactness/strong approximation; R18 owns the quaternionic reduction and degeneracy interfaces; PMIA owns the norm-module algebra; SI owns compact cohomology, duality and derived specialization; ES owns the abstract bound. The weak-torsion auxiliary descent remains HE.4’s extension. Main-conjecture proofs are not imported into geometric nonvanishing.

Acceptance includes discriminating numerical initial-factor examples, separate raw versus full-trace recurrences, the nonunit augmentation lattice, inability to divide by p-primary |G0|, character coefficient containment, and the distinction between integral and localized bounds. Each new construction’s API and five tests appear in the refinement catalogue. The imported constructions’ API and tests remain listed in the imported catalogue with their accepted IDs. Their arithmetic carriers are not invented for the Suggested file. Elaborating its elementary signatures establishes only syntactic compatibility with the pinned libraries, not any arithmetic proof.

## New construction and proof-interface catalogue

The following items are the eight new nodes of this packet. Their complete statements, direct dependencies, proof sketches and acceptance criteria are authoritative for this refinement.

### The traced Heegner norm module over K∞

`HeegnerPointEulerSystems:HE.8/howard-traced-universal-norm-module` — construction.

Assume Howard’s ordinary Heegner setting: E/ℚ of conductor N; K imaginary quadratic of odd discriminant D_K<0, D_K≠−3, all primes of N split; odd p∤ND_K, good ordinary reduction, G_K-image GL₂(ℤ_p), p∤h_K, and total ramification at the p-adic places in K∞/K. Write K_k for its degree-p^k layer, G=Gal(K[1]/K), and Λ=ℤ_p⟦Γ⟧. Define H_k inside E(K_k)⊗ℤ_p as the Λ-submodule generated by Tr_(K[1]/K)P[1] and Tr_(K_k[1]/K_k)P_j[1] for 0≤j≤k, using the accepted conductor-one family P_j[1]. Corestriction restricts to H_(k+1)→H_k; H=lim_k H_k has its actual level projections. It is the traced module over K∞, distinct from H[1] over K∞[1]. The traced chosen Q[1] gives κ̃₁∈H. Howard Theorem 2.3.7 identifies H as a free rank-one Λ-module generated by κ̃₁, with injective inverse-limit Kummer map sending κ̃₁ to the accepted bottom Selmer class. No unit assertion about aug(Φ) is made.

Proof route:

- Restrict the actual corestrictions to the displayed generating sets and form their compact inverse limit using the existing owner’s construction.
- Apply the fixed-torsion CM trace theorem through the accepted tower-trace target. Verify the Perrin–Riou rank comparison that Howard cites (Proposition 10, §3) with these modules; the original passage remains an acquisition/interface gap.
- In the free presentation use the surjective norm diagram H̃→H[1], H̃^G→H, with vertical maps Norm_G. Since |G| is a p-adic unit, taking G-invariants is exact here.
- Identify H̃^G/(γ−1)H̃^G with aug(Φ)H̃^G_0 using the recurrence and the kernel argument of Lemmas 2.3.8–2.3.9. The image of the traced lift generates this module even if aug(Φ) is not a unit. Nakayama gives generation of H, and rank one gives freeness.

Inputs: `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`, `HeegnerPointEulerSystems:HE.8/cornut-tower-trace-nontorsion`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `PadicMeasuresIwasawaAlgebras:L5`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`.

Sources: howard: Theorem 2.3.7 and Lemmas 2.3.8–2.3.9, §2.3, PDF pp.34–35.

Check:

- The finite subgroup and trace are retained in the module and the Kummer comparison.
- This clean rank/generator argument is not extended to p|h_K by dividing by |G|. The broad accepted non-torsion assertion has its separate construction.

API, derived from the uses in Howard’s norm-module proof and the accepted bottom-class comparison:

- `TauCeti.Heegner.Anticyclotomic.tracedNormModule_level` (projection): The compact Hausdorff inverse-limit Λ-module H has continuous Λ-linear projections pr_k:H→H_k with cor_k∘pr_(k+1)=pr_k. Its topology is the subspace topology on the compatible tuples in ∏_k H_k.
- `TauCeti.Heegner.Anticyclotomic.tracedNormModule_trace` (compatibility): The Norm_G map H[1]→H is the map induced by the levelwise field traces; it carries the chosen Q[1] to κ̃₁ and commutes with Kummer.
- `TauCeti.Heegner.Anticyclotomic.tracedNormModule_generator` (characterisation): Under the clean hypotheses the map Λ→H, a↦aκ̃₁, is a Λ-linear isomorphism.
- `TauCeti.Heegner.Anticyclotomic.tracedNormModule_augmentation` (characterisation): For the traced free presentation, the bottom projection gives H̃^G/(γ−1)H̃^G≅aug(Φ)H̃^G_0 and sends y^G to aug(Φ)x^G. This comparison is for the presentation, not an asserted description of the arithmetic H_0.
- `TauCeti.Heegner.Anticyclotomic.tracedNormModule_mk` (constructor): A tuple (h_k) with h_k∈H_k and cor_k(h_(k+1))=h_k for every k defines mk(h)∈H, with pr_k(mk(h))=h_k. No surjectivity of individual corestrictions is assumed.
- `TauCeti.Heegner.Anticyclotomic.tracedNormModule_ext` (extensionality): For x,y∈H, x=y if and only if pr_k(x)=pr_k(y) for every k. In particular, mk(pr_k(x))=x.
- `TauCeti.Heegner.Anticyclotomic.tracedNormModule_lift` (universal-property): For a topological Λ-module M and compatible continuous Λ-linear maps f_k:M→H_k, there is a unique continuous Λ-linear map lift(f):M→H with pr_k∘lift(f)=f_k. Identity and composition of such maps agree levelwise.
- `TauCeti.Heegner.Anticyclotomic.tracedNormModule_kummer` (compatibility): The levelwise point Kummer maps induce an injective Λ-linear map H→lim_k H¹(K_k,T_pE). Via inverse-action Iwasawa Shapiro this maps κ̃₁ to the accepted bottom class; comparison with Howard’s direct-action convention uses the explicit ι-semilinear coefficient identification.

Unit tests:

- `tracedNormModule_trivial_class_group` (degenerate): If G is trivial, Norm_G=id and the traced level modules coincide with H_k[1]; no extra class-number factor appears.
- `tracedNormModule_trace_scale` (compatibility): For p=5 and a trivial-action free ℤ_5 module with G cyclic of order 2, Norm_G sends x to 2x. Replacing this trace by the identity loses the normalization even though both generate the same line.
- `tracedNormModule_nonunit_augmentation` (non-example): For the free presentation with inert p=5,a_p=1, aug(Φ)=35. The image lattice is 35ℤ_5 x^G, not ℤ_5 x^G; a generator of this image does not make 35 a unit.
- `tracedNormModule_bad_class_number` (non-example): For G cyclic of order 5 over ℤ_5, the normalized average Norm_G/5 is not an integral group-ring operator; the clean invariant-exactness argument cannot be invoked.
- `tracedNormModule_incompatible_tuple` (non-example): In the identity-trace tower H_k=ℤ_5, the tuple h_0=0 and h_k=1 for k≥1 fails cor_0(h_1)=h_0 and cannot be passed to mk. A definition using the unrestricted product would admit it.

### Adelic norm fibres and expanding P-isogeny annuli

`HeegnerPointEulerSystems:HE.8/adelic-fibre-and-isogeny-annulus` — theorem.

Fix the actual CV data: F totally real, K/F CM, a prime P of F, a quaternion algebra B split at P and with K embedded, a compact open level H, the relative ring-class tower, a nonempty finite collection 𝒮 of allowed reduction sets S, and a finite set R of shifts distinct modulo Gal_K^(P-rat). For each S, exclude P, require B split and K nonsplit at its primes and |S|+|Ram_f(B)|+[F:ℚ] even. Retain the central norm-component spaces in the accepted joint-CM reduction target. For a fixed norm component z and a compact open reduced-norm-one level U_S^P away from P, the quotient c_S⁻¹(z)/U_S^P is equivariantly homeomorphic to the single compact quotient Γ_(S,g)\SL₂(F_P). The stabilizer Γ_(S,g) is discrete and cocompact; before conjugation by g_P its commensurator in B_(S,P)^× is F_P^×B_S^×. A compatible common away-P level gives the product of these quotients in the joint reduction space. The unquotiented adelic fibre is recovered through all away-P levels; it is not asserted to be one local lattice quotient. Quotienting also at P gives the finite-level class-set fibre. For each compact open Galois averaging subgroup G and compact open level H, a fixed P-isogeny class has the parametrization of CV Propositions 2.12 and 2.28: finitely many x_i and one-parameter unipotent groups u_i, and a compact open multiplicative subgroup κ⊂F_P^×, such that its G/level saturation is the union over i and n≥0 of G·x_i·u_i(ϖ^(−n)κ)·H. For fixed i,n this set is the single double orbit G·x_i u_i(ϖ^(−n))·H. The sets ϖ^(−n)κ⊂F_P are expanding annuli, carrying the additive Haar measure used in the subsequent integration. CM conductor tending to infinity escapes compact subsets of that isogeny class. The torus subgroup is not replaced by an arbitrary additive ball.

Proof route:

- Import the existing AdelicAlgebraicGroups anisotropic compactness, S-arithmetic lattice and simply connected strong-approximation targets. Apply them to the totally definite norm-one group B_S¹ with P split; the S-factor including P is noncompact.
- Fix the norm component and quotient by a compact open reduced-norm-one level away from P. Use transitivity to identify its single local quotient and its discrete cocompact stabilizer. Verify the quaternionic commensurator comparison, then pass through compatible away-P levels for the joint adelic fibre.
- Parametrize the toric orbit by the finite unipotent charts, with κ⊂F_P^× and the single-double-orbit identity. Verify conductor escape and the additive Haar normalization on these annuli.

Inputs: `HeegnerPointEulerSystems:HE.8/cm-character-stratum`, `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `AdelicAlgebraicGroups:AA.4`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `AdelicAlgebraicGroups:AA.3/compactness-anisotropic`, `AdelicAlgebraicGroups:AA.3/s-arithmetic-lattice`, `AdelicAlgebraicGroups:AA.4/strong-approximation-sufficiency`.

Sources: cv-cm: Proposition 2.12, printed pp.275–276; Lemmas 2.19–2.20, pp.281–282; Proposition 2.28, pp.287–288.

Check:

- κ is multiplicative in F_P^×; its scaled annuli are then integrated with additive Haar measure on F_P. It is not a subgroup of K_P^× or an arbitrary additive ball.
- The norm component is fixed before applying Haar distribution.
- The away-P quotient is explicit. The unquotiented adelic fibre and the full finite-level class set have different carriers from Γ\SL₂(F_P).

### Noncommensurable CM joining and dense unipotent orbit

`HeegnerPointEulerSystems:HE.8/p-adic-orbit-density-application` — theorem.

Fix a component fibre of the simultaneous CV reduction space and any compatible compact open norm-one level away from P as in adelic-fibre-and-isogeny-annulus. Then pairwise distinct shifts modulo Gal^{P-rat}_{K} exclude the proper pairwise commensurable joinings. After the source’s local torus parametrization, for almost every averaging parameter the diagonal unipotent orbit is dense in the resulting product of cocompact SL₂(F_P)-lattice quotients. Passing through a countable cofinal family of away-P levels gives density in the full component fibre, as in Lemma 2.25. The exceptional Galois averaging parameters lie in a countable union of cosets of Gal_K^(P-rat) in Gal_K^ab, negligible for Haar measure as in CV Proposition 2.24. These cosets arise from countably many F_P^×-cosets in K_P^× in the local calculation. Use the exact p-adic orbit-closure/stabilizer classification and partition-diagonal argument, rather than real Ratner or independent density of each coordinate.

Proof route:

- Import the requested p-adic orbit-classification statement and twisted-diagonal stabilizer consequence.
- Use partition-diagonal subgroups and closed-orbit commensurability at each away-P level. Distinct reduction sets have quaternion algebras with different ramification, ruling out inter-set commensurability; within one reduction set the shift comparison identifies the proper joining obstruction.
- Use the P-rational distinctness of shifts and Proposition 2.24’s countable Haar-null Gal_K^(P-rat)-cosets to exclude these joinings almost everywhere.

Inputs: `HeegnerPointEulerSystems:HE.8/adelic-fibre-and-isogeny-annulus`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

Sources: cv-cm: Propositions 2.22 and 2.24 and Lemma 2.25, printed pp.282–286; Lemmas 2.30–2.32, Corollary 2.34 and Proposition 2.35, pp.289–291, §§2.5/2.7.

Check:

- Marginal density alone is insufficient for a product joining.
- The finite-extension F_P version is an explicit supplier obligation, not inferred from a Q_p-only citation.
- Density is checked after each away-P quotient and then in the full fibre; the quotient level is not silently dropped.

### Cornut–Vatsal nonzero fixed-torsion CM trace

`HeegnerPointEulerSystems:HE.8/cornut-vatsal-torsion-trace-nonvanishing` — theorem.

In the indefinite quaternionic CV setting assume H2: at each Q≠P ramified in K/F, B_Q is split and R_Q maximal. Let π:J↠A be a nonzero surjective rational Pic(O_F)-equivariant quotient with A=A{ω}, and choose χ on G0 inducing ω^ε on G2. For all but finitely many x∈CM(P∞), Σ_{σ∈G0}χ(σ)σ·α(x)/|G0| is nonzero in A⊗_{Z{ω}}C. H1 and P-newness are not needed for this fixed-torsion projection theorem. For Howard’s F=Q modular quotient, use trivial torsion type to obtain a non-torsion trace at some sufficiently high conductor.

Proof route:

- Use H2 degeneracy maps to remove the G1/G2 contribution without losing Pic(O_F)-equivariance or quotient surjectivity. The resulting nonzero quotient of the Jacobian induces a nonconstant map α₁ on each relevant smooth proper curve component; bound its finite fibres by a fixed degree d before reduction. This is the quaternionic R18.4 extension, distinct from the modular normalization supplied by HE.1.
- For the remaining G0/G1 shifts use eventual independent reduction on compatible components.
- Choose an inert auxiliary reduction prime with supersingular fibres larger than the fixed map-degree times the finite torsion bound, via the requested quantitative class-set growth.
- Conclude the assumed torsion projection cannot vanish for all sufficiently high CM points.

Inputs: `HeegnerPointEulerSystems:HE.8/relative-ring-class-tower-torsion-finite`, `HeegnerPointEulerSystems:HE.8/cm-character-stratum`, `HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4`.

Sources: cv: Theorem 4.10, PDF p.41; Lemmas 4.14–4.15 and Remark 4.16, pp.44–48; Proposition 4.17 and the end of the proof, pp.49–50.

Check:

- A rational-character denominator is not asserted to be a p-adic unit.
- This theorem does not depend on an anticyclotomic main conjecture.

### Weak-torsion descent and shifted-conductor verification

`HeegnerPointEulerSystems:HE.8/broader-tower-descent-verification` — theorem.

In the ordinary Heegner setting of CGLS §4.1 with E(K)[p]=0, and without p∤h_K or full G_K-image, put d(k)=min{d≥0:K_k⊂K[p^d]} and P_k[n]=Tr_(K[np^d(k)]/K_k[n])P[np^d(k)]. For each admissible squarefree n and each coefficient quotient by the actual I_n, establish the auxiliary disjointness/invariant-vanishing that makes restriction H¹(K,T/I_nT)→H¹(K[n],T/I_nT)^{Gal(K[n]/K)} an isomorphism. Verify the pro-p base-tower vanishing E(K∞)[p]=0, the actual transition squares for these shifted P_k[n], and the common-presentation finite solvability used by universal-norm-heegner-family with finite G0 retained. These checks provide that accepted construction and derivative restriction API in the weak-torsion branch; no rank or main-conjecture endpoint is replanned. Do not use the integral average 1/|G0| when p divides |G0|.

Proof route:

- Use the p-group fixed-vector argument for E(K∞)[p]=0. Obtain the exact auxiliary disjointness and invariant-vanishing from the HE.4 extension request, and apply inflation–restriction with both end terms checked.
- Track finite G0 and the actual inclusions K_k⊂K[p^d(k)] in the point traces. Prove the common free-presentation finite constraints with those maps, not with the clean tower’s k+1 indexing.
- Check the ordinary local descent using the semilocal norm comparison at p; its finite residue torsion term is retained. Supply these verification data to the already accepted family and restriction APIs.

Inputs: `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`, `HeegnerPointEulerSystems:HE.4`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `SelmerIwasawaCohomology:L3`.

Sources: cgls: Theorem 4.1.1, §4.1, published pp.566–568; d(k), equations (4.1)–(4.3) and restriction comparison on p.567.

Check:

- A pro-p fixed-vector argument alone does not prove auxiliary ring-class disjointness.
- The weak-torsion localized divisibility theorem remains separate from integral Howard Theorem B.

### Arithmetic verification of Howard’s abstract bound

`HeegnerPointEulerSystems:HE.8/howard-specialization-hypotheses` — theorem.

Assume the full clean arithmetic hypotheses of howard-traced-universal-norm-module. For T=T_pE⊗Λ with the fixed inverse tautological Γ-action and Howard’s propagated ordinary self-dual local conditions, verify hypotheses A–D of EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound: S is Λ-torsion-free; normalized height-one specialization/control has finite kernel and cokernel and bounded lattice index outside a finite exceptional set; specialized coefficients and local conditions satisfy Howard’s actual H0–H5; and char_Λ(X_tors) is invariant under ι(γ)=γ^−1 through the arithmetic functional equation. Specify the same local conditions in that functional equation and in the height-one maps. Local p-torsion/component effects are finite control errors, not assumed zero. This is the arithmetic verification input to the accepted Theorem B endpoint, without restating that endpoint or importing it as a proof prerequisite.

Proof route:

- Import HE.5’s actual H0–H5 checks, retaining its χ comparison gap.
- Apply local control with finite reduction errors and the stated normalized height-one maps.
- Verify the exact complementary local conditions required by the arithmetic functional equation and identify its characteristic-ideal consequence.

Inputs: `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`, `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`, `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`, `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `SelmerIwasawaCohomology:L3`.

Sources: howard: Proposition 2.1.3, PDF pp.23–24; Lemma 2.2.7, Proposition 2.2.8 and Lemma 2.2.9, pp.25–26; proof of Theorem 2.2.10, pp.26–28.

Check:

- Howard’s height-one comparison excludes pΛ where stated.
- Rubin’s admissible Z_p-extension hypothesis is not imposed: auxiliary inert primes split completely here.
- At an inert auxiliary prime the infinite-decomposition hypothesis of SI.L3/universal-norms-unramified is unavailable: use the accepted Heegner local verification for that case, not this generic shortcut.
- The Shapiro convention is reconciled with Howard’s direct action through the ι-semilinear comparison; α and α^−1 are not silently exchanged.

### Perfect character base change for the arithmetic complex

`HeegnerPointEulerSystems:HE.8/perfect-character-base-change` — theorem.

For CS’s actual all-p strict ordinary Selmer complex C=RΓ_f(K,T_pE⊗Λ), with its global-to-local cone, unramified inertia terms away from p and ordinary quotient terms at every v|p, assume (Heeg),(disc), odd p∤ND_K, good ordinary reduction and E(K)[p]=0. Prove perfectness over Λ and, for every continuous α:Γ→ℤ_p^× sufficiently close to 1, the arithmetic derived comparison C⊗^L_(Λ,α)ℤ_p≃RΓ_f(K,T_pE(α)), using the same ordinary/inertia local maps and preserving their H⁰ and Tor terms. The induced inverse-determinant isomorphism transports the integral lattice and, where the rational rank-one tensor identification is defined, the Heegner tensor. This refines the accepted determinant-specialization-lattice proof input, rather than asserting that finite-layer control already covers character evaluation. The Nekovář 8.10.1 theorem used by CS is requested from SI.L3; its proof was not independently read in this run.

Proof route:

- Import the exact perfect character-specialization theorem through the SI.L3 request.
- Verify every local ordinary/inertia map and its specialization compatibility for the stated arithmetic representation.
- Apply the generic determinant functor only after the arithmetic derived equivalence has been established. Then compare its rational identification with the accepted Heegner determinant tensor, keeping ι/α^−1 conventions.

Inputs: `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`, `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`, `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/selmer-determinant`, `SelmerIwasawaCohomology:L3`.

Sources: cs: Equation(3.17), Corollary3.3.4 proof p.16, referring to Nekovář8.10.1.

Check:

- Finite generation is insufficient for perfectness.
- Tor and local-change terms are preserved until the asserted derived comparison establishes the correct lattice.
- No localization cokernel or bad-place determinant term is suppressed in the local comparison. The asymmetric split Greenberg complex of BCGS is a different complex.

### Integral containment under the CS surjective hypotheses

`HeegnerPointEulerSystems:HE.8/integral-heegner-determinant-containment` — theorem.

Under (Heeg),(disc), p>3 ordinary unramified, residual G_Q-image GL₂(F_p) and p∤c_φ, verify the arithmetic Λ-bound needed to place z_{K∞} inside det^{-1}C, without assuming p∤h_K. This entails the broader d(k) construction, the full integral self-dual A–D control and the exact ordinary lattice comparison; a divisibility proved only in Λ[1/p,1/(γ−1)] is insufficient. The containment proves one side of the basis proposition and is an input to the converse refined-index implication. It is not an assertion that clean Howard Theorem B already has these weaker tower hypotheses.

Proof route:

- Check residual-to-p-adic image and local control hypotheses for this arithmetic representation.
- Verify the broadened arithmetic A–D hypotheses at every height-one prime, including pΛ and the augmentation prime, through the exact ES.8/SI.L3 contracts. The clean howard-specialization-hypotheses node is a comparison case, not a theorem applied outside its hypotheses.
- Translate the product of Heegner index ideals into an integral determinant containment.

Inputs: `HeegnerPointEulerSystems:HE.8/broader-tower-descent-verification`, `HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison`, `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound`, `EulerSystemsAndKolyvaginSystems:ES.8`, `SelmerIwasawaCohomology:L3`.

Sources: cs: Proof of Theorem C, CS §3.4, PDF p.17, invoking Howard Theorem 2.2.10 (pp.26–28); compare Howard Theorem B (p.2) and CGLS Theorems 3.4.1/4.1.2 (printed pp.564–565/568).

Check:

- Localized CGLS divisibility cannot substitute for integral containment.
- This target is explicitly open at the expanded arithmetic-interface verification.
- The lower integral divisibility is independent of the main-conjecture equality. Introducing that equality as a prerequisite would make the converse equivalence circular.
- Residual G_Q surjectivity, restriction to G_K and the full p-adic image implication are checked with p>3 and p∤D_K; they are not equated by notation.

## Imported HE.8 specification catalogue

These specifications are references to the accepted HE.7s nodes, not additional nodes or API counts in this packet. The common elliptic-curve conventions are those above; the quoted IDs identify the exact coefficient and local-condition interfaces to reuse. Each entry retains every additional branch hypothesis. Its accepted source locator is given as recorded there; author-manuscript PDF locators are not converted to published pages by guessing. The new sources and their pagination are listed separately below.


The imported catalogue uses the following source versions, independently of the refinement-source keys below. In particular, its `cgls` PDF pp.27–28 refer to `Eisenstein.pdf`, not the published `Eisenstein-print.pdf` used by this refinement.

| Imported key | Source and pagination |
| --- | --- |
| `howard` | [The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340); arXiv:1202.6340v1, 28 February 2012; Compositio Math.140 (2004),1439–1472. |
| `cornut` | [Mazur’s conjecture on higher Heegner points](https://webusers.imj-prg.fr/~christophe.cornut/papers/mcinv.pdf); Invent. Math.148 (2002),495–523; author manuscript. |
| `cv` | [Nontriviality of Rankin–Selberg L-functions and CM points](https://personal.math.ubc.ca/~vatsal/research/part1.pdf); Author manuscript, 1 April 2005; LMS Lecture Note Series320 (2007),121–186. |
| `cv-dynamics` | [CM points and quaternion algebras](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf); Author manuscript, 3 April 2005; Documenta Math.10 (2005),263–309. |
| `bcgs` | [Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/pdf/2312.09301v2); arXiv:2312.09301v2, January 2026; published CJM14(2) (2026),285–348. |
| `cgls` | [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein.pdf); Invent. Math.227 (2022),517–580; author copy. |
| `cs` | [On refined nonvanishing conjectures by Kurihara and Kolyvagin](https://web.math.ucsb.edu/~castella/Kurihara.pdf); Author manuscript dated 20 January 2026, arXiv:2601.14504v1. |
| `wuthrich` | [On the integrality of modular symbols and Kato’s Euler system for elliptic curves](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/12.pdf); Documenta Math.19 (2014),381–402, published PDF. |

### Heegner initial Euler factor (import)

`HeegnerPointEulerSystems:HE.8/initial-euler-factor`.

For every permitted n, in ℤ_p[G(n)] with G(n)=Gal(K[n]/K), define Φ=(p+1)²−a_p² if p is inert; if p splits define Φ=(p−a_pσ+σ²)(p−a_pσ*+σ*²), with σ,σ* the specified Artin elements. The augmentation is (p+1−a_p)² in the split case, not necessarily a unit. Keep the finite ring-class group, its Artin action and the initial unit index; it differs from Howard’s first-step degree group Δ=(O_K/pO_K)×/(ℤ/pℤ)×.

Accepted source locators: howard: §2.3, before Lemma 2.3.2; PDF pp.28–29.

Imported API:

- `TauCeti.Heegner.Anticyclotomic.initialFactor_inert` (simp): Inert Φ=(p+1)²−a_p².
- `TauCeti.Heegner.Anticyclotomic.initialFactor_split` (simp): Split Φ is the product of the two Artin quadratic factors, not its augmentation.
- `TauCeti.Heegner.Anticyclotomic.initialFactor_augmentation` (compatibility): Augmentation of the split factor is (p+1−a_p)²; inert augmentation is unchanged.
- `TauCeti.Heegner.Anticyclotomic.initialFactor_natural` (functoriality): A coefficient-ring map and compatible finite ring-class group map carry Φ to the corresponding factor.

Imported unit tests:

- `TauCeti.Heegner.Anticyclotomic.initialFactor_split_anomalous` (computation): For p=5,a_p=1 and σ=σ*=1, Φ=25, a nonunit in ℤ_5.
- `TauCeti.Heegner.Anticyclotomic.initialFactor_inert_value` (computation): For p=5,a_p=1, inert Φ=35, distinct from the split augmentation25.
- `TauCeti.Heegner.Anticyclotomic.initialFactor_reciprocity` (compatibility): Replacing both Artin elements by inverses transforms Φ by that involution; it does not permit replacing σ by1.

### Ordinary stabilization of Heegner points (import)

`HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point`.

Let α_p∈ℤ_p× be the unit root of X²−a_pX+p and β_p=p/α_p. For k≥1 put P[p^k]_α=P[p^k]−α_p⁻¹P[p^(k−1)] and scale by α_p⁻k. At k=0 use u_K⁻¹(1−α_p⁻¹σ)(1−α_p⁻¹σ*)P[1] in the split case and u_K⁻¹(1−α_p⁻²)P[1] in the inert case. Trace to K_k with the actual smallest d(k) such that K_k⊂K[p^d(k)], including p-primary class-number shifts.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: cgls: Remark 4.1.3; PDF pp.28.

Imported API:

- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_succ` (projection): At k≥1 the scaled point is α_p⁻k(P[p^k]−α_p⁻¹P[p^(k−1)]).
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_map` (functoriality): An equivariant ℤ_p-linear map commutes with stabilization.
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_change_unit` (compatibility): A unit rescaling of all raw points rescales every stabilized point by that unit.
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_initial` (relation): The conductor-zero value uses its separate split/inert correction with u_K.

Imported unit tests:

- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_zero` (degenerate): All raw points zero give every stabilized point zero.
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_predecessor` (computation): Over ℚ with unit 2 and raw P_1=4,P_0=2, the k=1 stabilized value is 3/2, not 2 or 3; this is an algebraic normalization example, not an arithmetic unit-root assertion.
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_first_level` (computation): At initial level the prescribed Euler-corrected P[1] is used; the positive-level recurrence is not evaluated at a nonexistent predecessor.

### Norm compatibility of stabilized Heegner points (import)

`HeegnerPointEulerSystems:HE.8/stabilized-corestriction`.

The stabilized points traced to the anticyclotomic layers satisfy Cor_(K_(k+1)/K_k)y_(k+1)=y_k. The first trace uses the initial correction in ordinary-stabilized-point; a shift d(k) is required when p divides h_K. This construction does not assert Howard Theorem B under the weakened class-number hypothesis.

Branch hypotheses:

- E(K)[p]=0.
- Use the actual linear trace maps on the common ambient point-completion and the compatibly included raw points. The unit root α satisfies α²−a_pα+p=0; at positive level cor[k+1](raw[k+2])=a_p raw[k+1]−raw[k] and cor[k+1](raw[k+1])=p raw[k+1]. At the first step cor[0](raw[1])−α⁻¹cor[0](raw[0])=α·initial, with initial the separately corrected point. Identify anticyclotomic traces using the actual d(k).

Accepted source locators: cgls: Remark 4.1.3 and proof of Theorem 4.1.1; PDF pp.27–28.

### Compact lift of the simultaneous Heegner norm constraints (import)

`HeegnerPointEulerSystems:HE.8/compact-universal-norm-lift`.

For the actual compact Hausdorff inverse-limit groups L[n], fix the continuous bottom projections π[n], prescribed values Φ[n]P[n], permitted conductor edges j, continuous auxiliary traces tr[j] and integer scalars a[j]. If every finite list of bottom equations π[n]q[n]=Φ[n]P[n] and auxiliary equations tr[j]q[target j]=a[j]q[source j] has a common solution, there is a family q satisfying every equation. This packages the arithmetic constraint application of existing compactness; it does not re-plan the generic inverse-limit or Tychonoff theory.

Branch hypotheses:

- The indices and actual groups/maps are those of the ordinary Heegner tower; all L[n] are compact Hausdorff topological additive groups, all initial groups P[n] are Hausdorff, and π[n] and tr[j] are continuous.
- Every finite list of the two kinds of constraints is simultaneously solvable. Howard’s common free presentation and its compatible conductor maps establish this arithmetic input; CGLS uses the actual class-number shifts.

Accepted source locators: howard: Lemmas2.3.2–2.3.3; PDF pp.29–30; cgls: Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.

### Howard universal-norm Heegner family (import)

`HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`.

Under the ordinary Heegner conditions and E(K)[p]=0, construct Q[n] in lim_k H_k[n], the inverse limit of the ℤ_p[Gal(K_k[n]/K)]-modules generated by P[n] and P_j[n]. Its level-zero projection is ΦP[n], and Cor_(K∞[nℓ]/K∞[n])Q[nℓ]=a_ℓQ[n] for every permitted auxiliary ℓ. Choices arise from compactness, not uniqueness. Howard proves this under full G_K image and p∤h_K; CGLS Theorem 4.1.1 gives the weaker construction with the actual class-number conductor shifts, without extending Howard’s divisibility theorem. The construction takes these fixed maps and scalars together with finite solvability; its APIs use the same data. For actual level projections pr[n,k] and transitions cor[n,k], require cor[n,k]∘pr[n,k+1]=pr[n,k]. Differences between two choices with these same bottom and auxiliary constraints have zero bottom projection and obey tr[j](Q[target j]−Q′[target j])=a[j](Q[source j]−Q′[source j]).

Branch hypotheses:

- E(K)[p]=0.
- The conductor index I and permitted auxiliary-edge index J, their source/target maps, actual compact Hausdorff inverse-limit groups L[n], initial groups P[n], continuous bottom projections π[n], Artin-factor actions Φ[n], points P[n], continuous auxiliary traces tr[j], and scalars a[j] are fixed before choosing the family. Every finite list of bottom and auxiliary constraints has a simultaneous solution, as established by the common free-presentation argument; no uniqueness or surjectivity of arbitrary projections is assumed.

Accepted source locators: howard: Lemmas2.3.2–2.3.3; PDF pp.29–30; cgls: Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.

Imported API:

- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_level_zero` (projection): For the fixed data and the finite-solvability witness used by the construction, π[n](Q[n])=Φ[n]P[n].
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_trace` (relation): For each edge j of the supplied permitted-edge index, the fixed trace tr[j] sends Q[target j] to a[j]Q[source j].
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_corestriction` (compatibility): For the actual supplied level projections and transitions, assume cor[n,k]∘pr[n,k+1]=pr[n,k]; then cor[n,k](pr[n,k+1](Q[n]))=pr[n,k](Q[n]).
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_choice` (characterisation): For two families satisfying the same bottom and fixed auxiliary constraints, their difference has zero bottom projection and satisfies the same homogeneous auxiliary trace relations; it need not be zero.
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_exists` (constructor): For the fixed continuous projection/auxiliary data on actual compact Hausdorff limits, simultaneous solvability of every finite list of constraints gives a family satisfying all bottom and auxiliary constraints.

Imported unit tests:

- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_bottom` (compatibility): On the finite compact group ℤ/7, with one conductor, no auxiliary edges, π=id, Φ=5·id and initial point 1, the chosen bottom is 5 rather than 1; the finite-solvability witness is the constant family 5.
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_auxiliary` (degenerate): For a fixed permitted auxiliary edge j with a[j]=0, and the same finite-solvability input used by the construction, tr[j](Q[target j])=0.
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_nonunique` (non-example): With one conductor and one self-edge on the finite compact group ℤ/2, bottom projection zero, prescribed bottom zero, trace id and scalar 1, the distinct families 0 and 1 satisfy both constraints, and their difference satisfies both homogeneous laws.
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_impossible_bottom` (non-example): On ℤ/7 with π=0 and prescribed bottom 1, even the singleton bottom constraint has no solution, so no finite-solvability witness can be passed to the constructor.
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_incompatible_auxiliary` (non-example): On ℤ/7 with π=id, prescribed bottom 1, a self-edge with trace id and scalar 0, the singleton bottom and auxiliary constraints cannot be solved simultaneously.

### Anticyclotomic Heegner class (import)

`HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`.

Apply the integral Kummer map to the stabilized norm-compatible points and the imported Iwasawa–Shapiro comparison to obtain y∞∈H¹_Iw(K∞/K,T)=H¹_cont(K,T⊗Λ(tautological inverse)). The actual tower class lies in the specified ordinary Selmer structure. Its projection to level k is the Kummer class of y_k. There is no assertion that each character specialization is nonzero.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: cgls: Theorem 4.1.1 and Remark 4.1.3; PDF pp.27–28.

Imported API:

- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_level` (projection): Under Iwasawa–Shapiro, level k equals the Kummer class of y_k.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_scalar` (functoriality): An equivariant quotient or scalar transport commutes with the class construction.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_restrict` (compatibility): Changing the tower by a finite initial norm gives the imported corestriction comparison, with its degree/factor.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_zero` (simp): The identically zero compatible point family has zero class.

Imported unit tests:

- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_trace` (compatibility): Conductor one specializes to the corrected trace over its ring-class field, not an assumed K-rational raw point.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_isogeny` (non-example): A p-isogeny acts by the actual lattice map; a nonunit scalar can change the integral index.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_nonzero_not_all_specializations` (non-example): In the supplied two-coordinate cohomology model, the image of (1,0) under the identity Iwasawa comparison is nonzero, but its second-coordinate specialization is zero. The test invokes heegnerIwasawaClass and detects both a zero construction and an assertion that all projections are nonzero.

### Primitive CM character stratum (import)

`HeegnerPointEulerSystems:HE.8/cm-character-stratum`.

For the imported relative ring-class tower G∞ with finite torsion G₀, define P(n,χ₀) as the finite-order characters of G(n) restricting to χ₀ on G₀ and not factoring through G(n−1). The character satisfies χ₀ω=1 on the embedded A_F×. Conductor is the largest F-ideal in the order, and primitivity is exact level, not merely conductor dividing P^n. Small n before G₀ embeds are excluded.

Branch hypotheses:

- F totally real, K/F CM, P a finite prime; n is large enough to identify G₀ in G(n).

Accepted source locators: cv: §1.1, equations(3)–(4), and Lemma 2.8; PDF pp.3–6,23.

Imported API:

- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_mem` (characterisation): Membership is fixed torsion restriction together with failure to factor through G(n−1).
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_torsion` (projection): Every member restricts to χ₀ on G₀.
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_not_old` (relation): Every pullback from G(n−1) is excluded.
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_transport` (equivalence): Compatible isomorphisms of tower quotients and torsion subgroups identify the strata.

Imported unit tests:

- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_identity_quotient` (degenerate): When the preceding-level quotient map is the identity, the primitive stratum is empty.
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_wrong_torsion` (non-example): A character with the wrong restriction to G₀ is excluded even if it is primitive.
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_first_nontrivial` (computation): For G(n)=C₂, preceding quotient1, trivial torsion subgroup and identity character C₂→C₂, the character belongs to the exact-level stratum.

### Generic CM root-number parity (import)

`HeegnerPointEulerSystems:HE.8/cm-generic-root-number`.

For cuspidal parallel-weight-two π over F with finite-order everywhere-unramified central character ω, and prime-to-P conductor N′ coprime to D_(K/F), let S be all real places and the finite inert Q≠P for which ord_Q(N) is odd. For sufficiently ramified compatible ring-class χ, ε(π,χ)=(-1)^|S|. The source’s S_χ equals S at every level if P∤N or P splits in K. Even |S| is definite and odd |S| indefinite.

Branch hypotheses:

- π cuspidal parallel weight two; ω finite-order everywhere unramified; N′ and D_(K/F) coprime.

Accepted source locators: cv: §1.1, Lemma 1.1 and definitions of S,Sχ; PDF pp.4–5.

### Joint distribution of CM reductions (import)

`HeegnerPointEulerSystems:HE.8/joint-cm-equidistribution`.

Let F be totally real, K/F CM, and B/F a quaternion algebra split by K and at P, with a fixed K-embedding. Choose a nonempty finite collection 𝒮 of finite sets S of finite places v≠P with B_v split, K_v a field, and |S|+|Ram_f(B)|+[F:ℚ] even; fix the source’s totally definite B_S and compatible local embeddings. Let R⊂Gal(K^ab/K) be nonempty finite and pairwise distinct modulo P-rational elements rec_K(λ), characterized by λ_P∈K×·F_P×. Form the actual simultaneous Red:CM→X(𝒮,R) and component map C with fibre probability measures μ_z. For compact-open G⊂Gal(K^ab/K) with probability Haar dg, a P-isogeny class ℋ, and continuous f:X(𝒮,R)→ℂ, the difference ∫_G f(Red(gx))dg−∫_G∫_(C⁻¹(gx̄))f dμ_(gx̄)dg tends to zero as x escapes compact subsets of ℋ. Here x̄=C(Red(x)); prohibited components are retained.

Branch hypotheses:

- B split by K and at P; each auxiliary set satisfies S1–S3 and excludes P, as specified in the statement. R is nonempty and pairwise P-irrational; G is compact open. Artin reciprocity sends uniformizers to geometric Frobenius.

Accepted source locators: cv-dynamics: Theorem 2.9; §§2.5 and2.7; PDF pp.11–12,24–35.

### Surjectivity onto CM reduction fibres (import)

`HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity`.

At fixed finite level and with the joint CM distribution hypotheses, Red(Gx) equals the fibre C⁻¹(Gx̄) for every x outside a finite subset of its P-isogeny class. The right side retains the component map C and does not assert independent reductions in forbidden components.

Accepted source locators: cv-dynamics: Corollary 2.10; PDF pp.12.

### Indefinite primitive-character Heegner nonvanishing (import)

`HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point`.

In CV §4, require (H1) an Eichler order at P in a split B_P, (H2) maximal split level at primes ramifying in K, a P-new nonzero ω-isotypic quotient α:J_H→A, and good CM points x of conductor P^n. For n sufficiently large and fixed admissible χ₀, some χ∈P(n,χ₀) has e_χα(x)≠0 in the Mordell–Weil space tensored with the character field. Weighted traces are non-torsion, not merely nonzero torsion points.

Branch hypotheses:

- CV(H1),(H2), P-new quotient and good CM point; χ₀ω=1 on A_F×.

Accepted source locators: cv: Theorem 4.1; Theorem 4.10; Lemmas4.12–4.15 and Proposition 4.17; PDF pp.37,41–49.

### Definite primitive-character toric nonvanishing (import)

`HeegnerPointEulerSystems:HE.8/definite-cm-character-period`.

For the definite quaternion algebra and CV(H1),(H2), a nonzero P-new vector θ in the Jacquet–Langlands representation of a nonexceptional pair (π,K), and a good CM point x at large conductor, some χ∈P(n,χ₀) has Σ_(σ∈G(n))χ(σ)θ(σx)≠0. Nonexceptionality is π≇π⊗η_(K/F); it cannot be suppressed.

Branch hypotheses:

- Definite parity, CV(H1),(H2), nonexceptional π, P-new θ, admissible χ₀ and good CM points.

Accepted source locators: cv: Proposition 5.6; Corollary 5.7; Proposition 5.8; Lemma 5.9; Theorem 5.10; PDF pp.55–58.

### Cornut–Vatsal definite nonvanishing (import)

`HeegnerPointEulerSystems:HE.8/definite-rankin-nonvanishing`.

With F,K,π,ω,P,N′,D as in cm-generic-root-number, |S| even and (π,K) nonexceptional, for every sufficiently large n there exists χ∈P(n,χ₀) with L(π,χ,1/2)≠0. This is existence within each fixed-torsion conductor stratum; it is not nonvanishing of all characters.

Accepted source locators: cv: Theorem 1.4 and §5; PDF pp.6,50–58.

### Cornut–Vatsal indefinite nonvanishing (import)

`HeegnerPointEulerSystems:HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses`.

Under the same initial CV data, assume |S| odd, ω=1, and N,D_(K/F),P pairwise coprime. For every sufficiently large n there exists χ∈P(n,χ₀) such that L′(π,χ,1/2)≠0. Use the geometric character-point theorem and the precise generalized Gross–Zagier identity. The definite branch has a separate node.

Branch hypotheses:

- ω=1; N,D,P pairwise coprime; |S| odd; χ₀ compatible with central character.

Accepted source locators: cv: Theorem 1.5 and §4; PDF pp.7,37–49.

### Cornut’s higher Heegner point theorem (import)

`HeegnerPointEulerSystems:HE.8/cornut-tower-trace-nontorsion`.

In the classical modular Heegner setting with p∤N, the ring-class p-power tower contains a conductor for which the appropriate trace of the modular Heegner point to the anticyclotomic layer is non-torsion. Keep the finite torsion/trace quotient in Cornut’s statement. This does not require the Heegner point of conductor one to be non-torsion and does not say every trace is non-torsion.

Accepted source locators: cornut: Introduction main theorem; PDF pp.2–3; howard: Theorem 2.3.7, initial invocation of Cornut; PDF pp.34.

### Non-torsion Λ-adic bottom class (import)

`HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`.

For the actual ordinary Heegner family y∞ under E(K)[p]=0, Λy∞ is free of rank one and y∞ is not Λ-torsion. CGLS gives this nonzero family with the actual class-number conductor shifts. No completed main conjecture, full integral image or p∤h_K assumption is used for this assertion.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: cgls: Theorem 4.1.1 and Remark 4.1.3; PDF pp.27–28.

### Λ-adic Heegner derivative class (import)

`HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`.

For each squarefree allowed n, apply the imported derivative operator to Q[n] (or the normalized ordinary family), sum the finite ring-class torsion orbit, and descend its invariant Kummer class through the actual restriction isomorphism. Obtain κ^Λ_n in the generic Λ-adic Kolyvagin-system coefficient. Preserve the cyclic-Galois tensor and the finite/singular correction maps; the bottom is the specified Heegner Λ-line.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: howard: §2.3, construction following Lemma 2.3.3; PDF pp.30; cgls: Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.

Imported API:

- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_restrict` (projection): Restriction recovers the invariant differentiated Kummer class.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_generator` (compatibility): Changing a cyclic generator transforms the class together with the specified tensor factor.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_coefficients` (functoriality): Coefficient reduction commutes with the class when the quotient ideals are ordered correctly.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_bottom` (simp): At empty auxiliary support, use the actual universal-norm Heegner bottom class.

Imported unit tests:

- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_empty` (computation): The empty derivative acts as identity before the actual restriction inverse.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_zero` (degenerate): A zero point family gives zero derivative class.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_restriction_obstruction` (non-example): A noninjective restriction map with two distinct preimages forbids unique descent; the tor hypothesis cannot be omitted.

### Λ-adic Heegner local conditions (import)

`HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`.

The constructed derivative classes satisfy the transverse condition at ℓ|n, unramified condition away from pNn, and the prescribed propagated condition at bad primes. At v|p the image lies in the ordinary Fil⁺ condition. The proof treats finite decomposition at bad primes and finite ordinary-reduction torsion; it does not replace integral Kummer conditions by rational ones.

Branch hypotheses:

- Howard’s clean image hypothesis for the direct proof; weaker local verification uses the exact CGLS Theorem 4.1.1 adaptation.

Accepted source locators: howard: Lemma 2.3.4; PDF pp.30–32; cgls: Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.

### Λ-adic finite/singular Heegner compatibility (import)

`HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`.

The corrected Λ-adic derivative system satisfies the generic finite/singular comparison at each allowed ℓ. Its arithmetic reduction congruence and the local χ_ℓ identification must commute with localization through the actual Galois change-of-group action. A merely local matrix is not a global G_K-equivariant coefficient endomorphism.

Accepted source locators: howard: Lemmas2.3.5–2.3.6; PDF pp.32–34; cgls: Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.

### Unit comparison of Heegner normalizations (import)

`HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`.

Howard’s universal-norm bottom and the ordinary stabilized family generate the same Λ-line: the comparison factor is u_Kα_p²(β_p−1)² when p splits, and u_Kα_p²(β_p²−1) when p is inert. Since β_p∈pℤ_p and u_K is a p-unit in the allowed discriminants, the factor is a unit. This comparison does not make Φ a unit.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: cgls: Remark 4.1.3; PDF pp.28.

### Howard’s anticyclotomic divisibility theorem (import)

`HeegnerPointEulerSystems:HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B`.

Under Howard’s TheoremA hypotheses, p odd good ordinary, p∤h_K, p,N,D_K pairwise coprime and G_K→GL₂(ℤ_p) surjective, S=H¹_FΛ(K,T⊗Λ) is Λ-torsion-free of rank one, and its discrete dual X is pseudo-isomorphic to Λ⊕M⊕M for a finitely generated torsion Λ-module M with char(M)=char(M)^ι. Moreover char(M) divides char(S/H), H the actual Heegner Λ-line. Equality and integral primitivity are not conclusions.

Branch hypotheses:

- G_K→GL₂(ℤ_p) surjective; p∤h_K; p,D_K,N pairwise coprime.

Accepted source locators: howard: TheoremB; Proposition 2.1.3; Lemma 2.2.7–Theorem 2.2.10; PDF pp.2–3,23,25–28.

### Weaker torsion hypothesis and localized bound (import)

`HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`.

Under ordinary Heegner conditions and E(K)[p]=0, the CGLS Heegner family exists and the rank-one paired-torsion bound holds over Λ[1/p,1/(γ−1)]. The augmentation inversion can be removed under the source’s extra corank-one condition. The BCS/CGS error-controlled bounds supply stronger assertions in their stated branches; class-number retention alone does not do so.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: cgls: Theorems4.1.1–4.1.2; PDF pp.27–28.

### Crystalline characters near the identity (import)

`HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`.

Choose γ∈Γ, a p-adic unit u generating the prescribed subgroup, and h with γ^h equal to its Artin image. Let ξ_n(γ)=u^n have infinity type (hn,−hn). For m≥1 define α_m=ξ_(p−1)p^(m−1); these are nontrivial crystalline anticyclotomic characters congruent to1 modulo p^m and approach1. Retain h and the chosen embeddings. No finite-order character is substituted for these crystalline twists.

Branch hypotheses:

- E(K)[p]=0.
- p splits as v v̄ in K.

Accepted source locators: bcgs: Definition 1.2.2; PDF pp.10–11.

Imported API:

- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_apply` (projection): α_m(γ)=u^((p−1)p^(m−1)), with its chosen Artin/infinity-type h.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_succ` (relation): α_(m+1)=α_m^p for m≥1.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_congruent` (compatibility): α_m≡1 modulo p^m, by the unit-power congruence.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_nontrivial` (characterisation): For non-torsion u, α_m is nontrivial for every m≥1; its limit is1, which is not a member.

Imported unit tests:

- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_first` (computation): For p=5,m=1 the exponent is4, not1 or5.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_next` (computation): For p=5,m=2 the exponent is20, exactly five times the first exponent.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_torsion_counterexample` (non-example): If the supplied character has order dividing p−1, α_1 is trivial; non-torsion and arithmetic construction hypotheses are essential.

### Heegner specialization with the initial factor (import)

`HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`.

If α≡1 modulo p^m and M(n)≥m, then κ^Λ_n(α)≡C_pκ_n^Heeg modulo p^m. Here C_p=(α_p−1)²(β_p−1)² for split p and C_p=Φ=(p+1)²−a_p² for inert p, in the prescribed normalization. The reduction exists because I_n⊂p^mℤ_p. C_p can be a nonunit; at split p its valuation is twice v_p(#Ẽ(𝔽_p)).

Branch hypotheses:

- E(K)[p]=0.
- α is an anticyclotomic twist sufficiently close to1; M(n)≥m.

Accepted source locators: bcgs: Lemma 1.1.5 (split-prime branch); PDF pp.9; cs: Lemma 3.1.1 and equation (3.5), both unramified splitting types; PDF pp.12–13.

### Nonzero bottom classes near the identity (import)

`HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`.

There is a neighbourhood of1 such that every nontrivial α in it has κ^Heeg_1(α)≠0. This follows from a non-Λ-torsion family and the finite zero set of a nonzero one-variable series. The specialization at α=1 is not included: its nonvanishing is equivalent to the appropriate analytic-rank-one condition.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: bcgs: Theorem 1.1.6; PDF pp.10.

### Heegner divisibility profile (import)

`HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`.

For the actual finite Heegner derivative system define M_r=min_(ν(n)=r) ind(κ_n), with values in ℕ∪{∞}; ind is the largest allowed p-divisibility in the coefficient module, and ind(0)=∞. Set M∞=inf_r M_r. Prime restrictions, coefficient ideals I_n and p-optimal parametrization are part of the data. M_0 is the bottom Heegner index and need not equal M∞.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: bcgs: Introduction definitions of M_r,M∞; §2.2; PDF pp.2–3,17–20.

Imported API:

- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_at` (projection): M_r is the infimum of the supplied actual indices at ν(n)=r.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_bottom` (simp): At r=0 the only conductor is1, so M₀=ind κ₁.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_top` (characterisation): M_r=∞ iff every permitted class at level r is zero, with empty strata giving∞.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_rescale` (compatibility): Common p^t-rescaling adds t to indices when coefficient depth allows it; truncation at the quotient depth is retained.

Imported unit tests:

- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_zero` (degenerate): The zero system has M_r=∞ for every r and M∞=∞.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_bottom_vs_infimum` (non-example): A system with indices3 at conductor1 and1 at one-prime support has M₀=3 and M∞≤1.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_sum_not_max` (computation): For indices2 and5 in one stratum the minimum is2; neither their sum nor maximum is the divisibility index.

### Optimal and distinguished lattice comparison (import)

`HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison`.

For E₀ optimal on X₀(N), E₁ optimal on X₁(N), and the distinguished E_• with T_f identified integrally with T_pE_•, the prescribed isogeny E₀→E_• is étale at odd p. For crystalline α as in BCGS Lemma 1.2.3 with L_BDP(α⁻¹)≠0 and α sufficiently near1, I_•(α)C_•(α)=I₀(α)C₀(α), where I is the bottom-class index and C the finite-cokernel local index modulo torsion. Neither factor is individually asserted equal under arbitrary isogeny.

Branch hypotheses:

- E(K)[p]=0.
- p splits as v v̄ in K.
- α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.

Accepted source locators: bcgs: §1.2.2 and Lemma 1.2.5; PDF pp.12; wuthrich: Theorem 4, published p.384 (PDF p.4), proof pp.386–387.

### Near-trivial logarithm index formula (import)

`HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`.

With E_• and crystalline α as in BCGS Lemma 1.2.3 sufficiently close to1, L_BDP(α⁻¹)≠0 and κ_1^•(α)≠0, let t_α=length_(ℤ_p^ur)(ℤ_p^ur/L_BDP(α⁻¹)), q_•=#H⁰(ℚ_p,E_•[p∞]), I_•=#(S_α/ℤ_pκ_1^•(α)), and C_•=#coker(loc_v) modulo torsion. Then p^tα q_•=I_•C_•. Use the source’s coefficient extension and square-root BDP normalization.

Branch hypotheses:

- E(K)[p]=0.
- p splits as v v̄ in K.
- α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.

Accepted source locators: bcgs: Lemma 1.2.3; PDF pp.11–12.

### Twisted anticyclotomic control formula (import)

`HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control`.

For m≫0, crystalline α=α_m and L_BDP(α⁻¹)≠0, a characteristic generator F_E of the strict-at-v, unrestricted-at-v̄ Greenberg dual satisfies #(ℤ_p/F_E(α⁻¹))=#Sha(W_α⁻¹/K)·C_α²·∏_(w|N)c_w^(p)(α⁻¹)·q_E². The finite Sha is the source’s propagated Selmer quotient. The formula is integral and uses all K-primes over N and the finite/torsion local cokernel.

Branch hypotheses:

- E(K)[p]=0.
- p splits as v v̄ in K.
- α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.

Accepted source locators: bcgs: Theorem 1.2.7 (JSW control theorem as used there); PDF pp.13–14.

### Tamagawa factors near the identity (import)

`HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`.

For α≡1 modulo p^m the twisted local Tamagawa p-factor c_w^(p)(α) is congruent to the untwisted c_w^(p) modulo p^m. For m greater than the total relevant valuations this gives equality of the product of p-parts. Keep w|N over K; under the Heegner hypothesis its untwisted product is the square of the rational Tamagawa p-part.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: bcgs: Lemma 1.2.8; PDF pp.14.

### Uniform arithmetic Kolyvagin error bound (import)

`HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`.

There exist M and E depending only on T_pE such that, for α≡1 modulo p^m with m≥M and a collection κ̃_n∈H¹(K,T_α/I_nT_α) on a permitted prime set containing every sufficiently deep L_e, with κ̃₁≠0 and one fixed t≥0 for which {p^tκ̃_n}_n is an ordinary Kolyvagin system, H¹_Ford(K,T_α) has ℤ_p-rank one and the discrete ordinary Selmer group H¹_Ford(K,W_α⁻¹) is ℚ_p/ℤ_p⊕M_α⊕M_α, with length M_α≤ind(κ̃₁)+E. The constants are independent of m, the prime set and t. The divided collection itself need not be an integral Kolyvagin system. Under the source’s surjectivity hypothesis E=0.

Branch hypotheses:

- E(K)[p]=0.
- The allowed prime set contains L_e for all sufficiently large e. The collection has nonzero bottom class and one common multiple p^tκ̃ satisfying every Kolyvagin-system relation, with t independent of n.

Accepted source locators: bcgs: Theorem 1.3.1 and its cited CGS proof; PDF pp.15.

### Exact paired Selmer length for a Heegner system (import)

`HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length`.

For p>3, a surjective residual representation and the generic self-dual rank-one hypotheses, the specialized actual anticyclotomic Heegner system over a finite DVR R with κ₁≠0 gives length_R Sha(W_α/K)=2(M₀(α)−M∞(α)). No near-triviality is needed in the generic theorem; near-trivial α is used in the arithmetic application. The deep-prime restriction and rigidity hypotheses remain explicit. BCGS states Theorem 2.2.2 for p≥3 through Proposition 2.2.1, but its proof invokes Lemma 2.2.4, stated only for p>3. The p=3 proof extension remains a source gap.

Branch hypotheses:

- E(K)[p]=0.
- Residual G_Q representation surjective; R finite DVR; the source’s self-dual/cartesian hypotheses and κ₁≠0. p>3 for the verified proof route.

Accepted source locators: bcgs: Proposition 2.2.1; Theorem 2.2.2; Lemma 2.2.4; PDF pp.17–19.

### Integral main conjecture and twisted index square (import)

`HeegnerPointEulerSystems:HE.8/integral-main-conjecture-index-square`.

Assume the integral anticyclotomic Greenberg main conjecture in Λ^ur with the BCGS square-root convention. For crystalline α_m sufficiently close to1 with L_BDP(α_m⁻¹)≠0, the p-optimal curve satisfies I₀(α)²=#Sha(W_α⁻¹/K)·∏_(w|N)c_w^(p)(α⁻¹)·q₀⁴. A rational main conjecture supplies only a bounded p-power error; it does not supply this exact equality.

Branch hypotheses:

- E(K)[p]=0.
- p splits as v v̄ in K.
- Integral anticyclotomic Greenberg main conjecture and the p-optimal lattice.
- α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.

Accepted source locators: bcgs: Corollary 1.2.12; Remark 1.2.11; PDF pp.14.

### BCGS nonvanishing from the main conjecture (import)

`HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing`.

Under (Heeg),(disc),(tor), p odd good ordinary and split in K, the rational anticyclotomic main conjecture (indeed its required lower divisibility after inverting p) implies κ_n^Heeg≠0 for some squarefree n of allowed Kolyvagin primes. No analytic-rank-one hypothesis is made and κ₁ may vanish.

Branch hypotheses:

- E(K)[p]=0.
- p splits as v v̄ in K.
- Rational anticyclotomic main conjecture, kept as a theorem hypothesis.

Accepted source locators: bcgs: TheoremA and §2.1; PDF pp.2,15–16.

### BCGS refined divisibility from the integral conjecture (import)

`HeegnerPointEulerSystems:HE.8/bcgs-conditional-refined-divisibility`.

Assume p>3, surjective residual G_Q→GL₂(𝔽_p), good ordinary p split in K, (Heeg),(disc),(tor), a p-optimal parametrization, and the integral anticyclotomic main conjecture. Then M∞ of the finite Heegner system is finite and equals Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). This is half the sum over K-primes; it is neither M₀ nor the order of Sha.

Branch hypotheses:

- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; residual surjectivity; p-optimal parametrization; integral main conjecture.

Accepted source locators: bcgs: TheoremB and §2.2; PDF pp.3,17–20.

### Arithmetic strict ordinary Selmer complex comparison (import)

`HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`.

For CS coefficients X=T⊗Λ and twists T_α, instantiate the imported Selmer complex as the cone of global cochains mapping to ⊕_(v|p)RΓ(K_v,X/X_v⁺) and ⊕_(v|N)Cone(RΓ_ur→RΓ). Its H¹ is the strict ordinary Selmer lattice S; its H² is related by Poitou–Tate to the all-p ordinary discrete dual X_Gr(A). This rank-one dual is distinct from BCS’s torsion (0,empty) Greenberg module.

Branch hypotheses:

- E(K)[p]=0.
- p unramified in K.

Accepted source locators: cs: §3.2, equations (3.6)–(3.8), Theorem 3.2.1; PDF pp.13–14.

### Determinantal Heegner element (import)

`HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`.

Under the source’s rank-one and perfectness assumptions, use the canonical rational isomorphism Q(Λ)⊗det_Λ⁻¹ RΓ̃_f(K,T⊗Λ) ≃ Q(Λ)⊗(S⊗_Λ S^ι). Define z̃∞ as the inverse image of y∞⊗y∞ under this isomorphism. The main conjecture asserts z̃∞ generates the integral determinant lattice, not merely its rationalization.

Branch hypotheses:

- E(K)[p]=0.
- p unramified in K; the source’s rational determinant comparison.

Accepted source locators: cs: Conjecture 3.2.2 and preceding determinant isomorphism; PDF pp.13–14.

Imported API:

- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_image` (projection): The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted.
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_unique` (characterisation): It is the unique rational determinant preimage of that Heegner tensor.
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_rescale` (functoriality): Rescaling y∞ by a multiplies z̃∞ by a·ι(a), not merely a.
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_baseChange` (compatibility): Compatible derived base change and determinant comparison carry z̃∞ to the tensor of the specialized bottom classes.

Imported unit tests:

- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_zero` (degenerate): The zero Heegner class gives the zero determinant element.
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_scalar_square` (computation): With identity involution and y rescaled by p, the element scales by p².
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_rational_not_basis` (non-example): Under the identity tensor comparison over ℤ, the Heegner determinant for (5,1) has coefficient 5 under ℤ⊗ℤ≃ℤ: nonzero after rationalization and a nonunit integrally. This tests the construction rather than an unrelated integer and catches an erroneous normalization to a basis.

### Heegner determinant and characteristic ideals (import)

`HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison`.

The assertion that z̃∞ is an integral determinant basis is equivalent to char_Λ(S/Λy∞)·char_Λ(S/Λy∞)^ι=char_Λ(X_Gr(A)_tors) for the CS all-p ordinary dual. Writing a square requires the source’s ι-invariance; rational equality cannot certify an integral basis.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: cs: Proposition 3.2.3; PDF pp.14.

### Ordinary local specialization defect (import)

`HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect`.

For near-trivial nontrivial α, the local finite/ordinary comparison at v|p contributes the p-part of #Ẽ(𝔽_v), identified with the corresponding H⁰(K_v,A_v⁻(α±)). Set L_p=∏_(v|p)#Ẽ(𝔽_v). For split p v_p(Φ)=v_p(L_p)=2v_p(#Ẽ(𝔽_p)); for inert p use #Ẽ(𝔽_(p²))=(p+1)²−a_p². Retain both signs of the twist.

Branch hypotheses:

- E(K)[p]=0.
- p unramified in K; α sufficiently near1.

Accepted source locators: cs: Lemma 3.3.3 and proof of TheoremC; PDF pp.16–17.

### Specialized Heegner determinant lattice (import)

`HeegnerPointEulerSystems:HE.8/determinant-specialization-lattice`.

For a continuous α:Γ→ℤ_p× with α≡1 modulo p^m, m≫0 and κ₁,Λ^Heeg(α)≠0, the source proves that both S_(α±1) are free of rank one. Then the specialized rational determinant map to S_α⊗S_α⁻¹ sends the integral determinant lattice, up to a ℤ_p-unit, to L_p²·Tam_E²·#X_BK(T_α*/K) times that tensor lattice. Here X_BK is the finite quotient of the propagated Selmer group in CS; for a general twist it need not be the Bloch–Kato group. Tam_E=∏_(ℓ|N)c_ℓ over ℚ.

Branch hypotheses:

- E(K)[p]=0.
- p unramified in K; α continuous with α≡1 modulo p^m; κ₁,Λ^Heeg(α)≠0; m sufficiently large.

Accepted source locators: cs: Proposition 3.3.2; PDF pp.14–15.

### Twisted index square from the determinant conjecture (import)

`HeegnerPointEulerSystems:HE.8/determinantal-twisted-index-square`.

If z̃∞ generates the integral Selmer determinant and α is sufficiently close to1 but nontrivial, then the square of the Heegner bottom index equals L_p² Tam_E² #X_BK(T_α*/K), up to a ℤ_p-unit (equivalently as p-valuations). The transported Φ comparison and unit normalization remain explicit.

Branch hypotheses:

- E(K)[p]=0.
- Integral determinantal main conjecture; p unramified in K.

Accepted source locators: cs: Corollary 3.3.4; PDF pp.16.

### Castella–Sano refined conjecture equivalence (import)

`HeegnerPointEulerSystems:HE.8/castella-sano-refined-equivalence`.

For p>3, residual G_Q surjectivity, good ordinary p unramified in K, (Heeg),(disc), and a parametrization whose Manin constant is prime to p, M∞=v_p(Tam_E) holds if and only if the integral determinantal Heegner main conjecture of CS3.2.2 holds. The theorem permits inert p; it does not prove that conjecture at inert p.

Branch hypotheses:

- E(K)[p]=0.
- p>3; residual G_Q surjectivity; p unramified in K; p∤Manin constant.

Accepted source locators: cs: TheoremC; §3.3 proof; PDF pp.4–5,16–17.

### Q[n]_0=ΦP[n] (import)

`HeegnerPointEulerSystems:HE.8/universal-norm-level-zero`.

For the family chosen from the fixed continuous projection and permitted auxiliary-trace data with simultaneous finite solvability, its actual bottom projection satisfies π[n](Q[n])=Φ[n]P[n]. This is the same interface as universalNormFamily_level_zero in the construction API.

Branch hypotheses:

- E(K)[p]=0.
- The conductor index I and permitted auxiliary-edge index J, their source/target maps, actual compact Hausdorff inverse-limit groups L[n], initial groups P[n], continuous bottom projections π[n], Artin-factor actions Φ[n], points P[n], continuous auxiliary traces tr[j], and scalars a[j] are fixed before choosing the family. Every finite list of bottom and auxiliary constraints has a simultaneous solution, as established by the common free-presentation argument; no uniqueness or surjectivity of arbitrary projections is assumed.

Accepted source locators: howard: Lemmas2.3.2–2.3.3; PDF pp.29–30; cgls: Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.

### Under Iwasawa–Shapiro, level k equals the Kummer class of y_k (import)

`HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection`.

Under Iwasawa–Shapiro, level k equals the Kummer class of y_k.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: cgls: Theorem 4.1.1 and Remark 4.1.3; PDF pp.27–28.

### Restriction recovers the invariant differentiated Kummer class (import)

`HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`.

Restriction recovers the invariant differentiated Kummer class.

Branch hypotheses:

- E(K)[p]=0.

Accepted source locators: howard: §2.3, construction following Lemma 2.3.3; PDF pp.30; cgls: Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.

### α_m≡1 modulo p^m, by the unit-power congruence (import)

`HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.

α_m≡1 modulo p^m, by the unit-power congruence.

Branch hypotheses:

- E(K)[p]=0.
- p splits as v v̄ in K.

Accepted source locators: bcgs: Definition 1.2.2; PDF pp.10–11.

### The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted (import)

`HeegnerPointEulerSystems:HE.8/determinantal-heegner-image`.

The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted.

Branch hypotheses:

- E(K)[p]=0.
- p unramified in K; the source’s rational determinant comparison.

Accepted source locators: cs: Conjecture 3.2.2 and preceding determinant isomorphism; PDF pp.13–14.

### Finite torsion in the relative ring-class tower (import)

`HeegnerPointEulerSystems:HE.8/relative-ring-class-tower-torsion-finite`.

For the CV relative CM tower K[P^∞]/K and an abelian variety A/K, A(K[P^∞])_tors is finite. Choose two good-reduction places of K above distinct residue characteristics and primes Q≠P of F that do not split in K. CV Lemma 2.7 bounds their local extension degrees in the tower; prime-to-residue-characteristic reduction injectivity at these two places bounds all torsion. This is a statement about this tower, not torsion over every abelian extension.

Branch hypotheses:

- F totally real, K/F CM, P a fixed finite prime, and the relative ring-class tower and its reciprocity identification of HE.0.
- A/K an abelian variety; choose two distinct residue characteristics away from P and the bad reduction set.

Accepted source locators: cv: Lemma 2.7 and proof of Proposition 4.4, PDF pp.22,38; used again before Corollary 4.18.

### Universal-norm auxiliary trace relation (import)

`HeegnerPointEulerSystems:HE.8/universal-norm-auxiliary-trace`.

For the family chosen with fixed projections, permitted auxiliary traces and simultaneous finite solvability, tr[j](Q[target j])=a[j]Q[source j] for every supplied edge j. In the actual Heegner tower this is Cor_(K∞[nℓ]/K∞[n])Q[nℓ]=a_ℓQ[n]. It uses exactly universalNormFamily_trace from the construction API.

Branch hypotheses:

- E(K)[p]=0.
- The conductor index I and permitted auxiliary-edge index J, their source/target maps, actual compact Hausdorff inverse-limit groups L[n], initial groups P[n], continuous bottom projections π[n], Artin-factor actions Φ[n], points P[n], continuous auxiliary traces tr[j], and scalars a[j] are fixed before choosing the family. Every finite list of bottom and auxiliary constraints has a simultaneous solution, as established by the common free-presentation argument; no uniqueness or surjectivity of arbitrary projections is assumed.

Accepted source locators: howard: Lemmas2.3.2–2.3.3; PDF pp.29–30; cgls: Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.

## Requests and remaining inputs

These nine contracts refine existing supplier requests. Their statements specify the exact missing interface rather than a new general theory. Other accepted HE.7s requests and gaps remain in force through the imported target nodes.

**GeometryOfNumbersAndQuadraticArithmetic:GN.4**. Homogeneous-dynamics Part II contract: for L a finite extension of Q_p, G=SL₂(L), X=∏_{i=1}^r Γ_i\G with cocompact arithmetic lattices, V={v(t)} a one-parameter L-unipotent subgroup of G^r, each orbit closure is xH for a closed H⊃V and has its normalized H-invariant probability θ_x. For continuous f and every compact κ⊂L of positive additive Haar measure, |s|→∞ gives λ(sκ)^{-1}∫_{sκ}f(xv(t))dλ(t)→∫f dθ_x. For V=ΔU the measure stabilizer contains cΔG c^{-1} with c∈U^r. Export the pairwise-commensurability/partition-diagonal joining consequence. This is CV-CM Theorem2.29/Lemma2.30, p.289; the Q_p case cites Ratner Duke Math.J.77(1995), Corollary4 of Theorem6; the S-arithmetic/finite-extension supplier must verify the precise Ratner and Margulis–Tomanov Invent.Math.116(1994) hypotheses. Existing GN.4 is real-only and does not yet supply it.

Consumers: `HeegnerPointEulerSystems:HE.8/p-adic-orbit-density-application`.

**AdelicAlgebraicGroups:AA.4**. Reuse the exact compactness/S-arithmetic lattice/strong-approximation nodes cited by adelic-fibre-and-isogeny-annulus. Supply the remaining general-F quaternionic reduced-norm and arithmetic commensurator comparison of CV-CM Lemmas 2.19–2.20, printed pp.281–282: at compact open norm-one level away from P, the stabilizer is the projection of the conjugated S-arithmetic norm-one subgroup, and its commensurator before g_P-conjugation is F_P^×B_S^×. This extends the current rational-field norm export; it does not re-plan strong approximation or identify the raw adelic fibre with a local quotient.

Consumers: `HeegnerPointEulerSystems:HE.8/adelic-fibre-and-isogeny-annulus`.

**HilbertModularVarietiesAndShimuraCurves:R18.2**. Reuse the existing supersingular-reduction owner for the exact CV-CM §3 local quaternionic fibre model: Proposition 3.9 and Corollary 3.10, printed pp.297–298. Retain the central norm component and flip exactly the reduction prime and archimedean ramification. This is a refinement of HE.7s’s request, not a new canonical-model theory.

Consumers: `HeegnerPointEulerSystems:HE.8/adelic-fibre-and-isogeny-annulus`.

**HilbertModularVarietiesAndShimuraCurves:R18.3**. Quantitative supersingular norm-fibre growth used in CV Theorem 4.10 proof, preprint pp.49–50: for each fixed finite degree d and tower torsion bound t choose suitable inert good reduction primes with every relevant fibre cardinality >td. Supply the component-aware class-set/mass/point-count comparison through the existing definite quaternionic owner.

Consumers: `HeegnerPointEulerSystems:HE.8/cornut-vatsal-torsion-trace-nonvanishing`.

**HilbertModularVarietiesAndShimuraCurves:R18.4**. H2 ramified-prime degeneracy maps preserving Pic(O_F)-equivariance and the nonzero/surjective quotient in CV Lemmas 4.14–4.15 and Remark 4.16, PDF pp.44–48. Supply the resulting nonconstant componentwise curve-to-abelian-variety map, its fixed finite-fibre degree bound and good-reduction transport used on pp.49–50. Existing split-prime cohomological degeneracy or modular HE.1 normalization does not by itself provide this contract. Only the fixed-torsion Theorem 4.10 branch is a new consumer here; the P-new/type-I/II primitive-character interfaces remain in HE.7s.

Consumers: `HeegnerPointEulerSystems:HE.8/cornut-vatsal-torsion-trace-nonvanishing`.

**PadicMeasuresIwasawaAlgebras:L5**. Refine the existing Howard norm-module request to the traced module H over K∞: verify the universal-norm rank comparison quoted as Perrin–Riou (1987), Proposition 10 of §3, and compact inverse-limit/presentation exactness used in Howard Theorem 2.3.7 and Lemmas 2.3.8–2.3.9, PDF pp.34–35. Supply the stated finite class-group norm diagram and augmentation kernel comparison, without asserting aug(Φ) is a unit. The original Perrin–Riou proof remains unread here.

Consumers: `HeegnerPointEulerSystems:HE.8/howard-traced-universal-norm-module`.

**SelmerIwasawaCohomology:L3**. Refine the accepted character/control request: establish Nekovář 8.10.1 coefficient-character derived specialization for the actual ordinary/inertia maps of CS equation (3.17), PDF p.16, with perfectness and H⁰/Tor retained; verify Howard’s exact arithmetic functional equation and normalized height-one errors under the clean hypotheses. For CS integral containment supply the full integral self-dual local-condition comparison at pΛ and augmentation as well, not just rational duality. Finite-layer derived control is already planned and is reused. For broader-tower-descent-verification also supply the actual semilocal ordinary norm comparison at p in the shifted d(k) tower, preserving its finite residue torsion term.

Consumers: `HeegnerPointEulerSystems:HE.8/perfect-character-base-change`, `HeegnerPointEulerSystems:HE.8/howard-specialization-hypotheses`, `HeegnerPointEulerSystems:HE.8/integral-heegner-determinant-containment`, `HeegnerPointEulerSystems:HE.8/broader-tower-descent-verification`.

**HeegnerPointEulerSystems:HE.4**. Refine the full-image HE.4 torsion-invariants result to the actual weak-torsion CGLS §4.1 tower: prove auxiliary K[n]/K versus ℚ(E[p]) disjointness, invariant vanishing and inflation–restriction for the completed coefficient quotients in equation (4.3), published p.567. Record the base pro-p torsion comparison and the actual d(k) maps.

Consumers: `HeegnerPointEulerSystems:HE.8/broader-tower-descent-verification`.

**EulerSystemsAndKolyvaginSystems:ES.8**. Reuse self-dual-lambda-adic-kolyvagin-bound as the exact abstract integral contract of Howard Theorem 2.2.10, PDF pp.26–28. Specify its specialization hypotheses and the perturbation argument controlling every height-one valuation, including pΛ and augmentation. HE.8 owns the arithmetic A–D verification for CS §3.4 under residual surjectivity and the d(k) tower, without p∤h_K; SI.L3 owns the local control/functional equation comparison. Clean Howard Theorem B (p.2) is a comparison case. CGLS localized Theorems 3.4.1/4.1.2 (printed pp.564–565/568) do not discharge integral containment.

Consumers: `HeegnerPointEulerSystems:HE.8/integral-heegner-determinant-containment`.

**Gap: Exact p-adic dynamics and joining supplier.** The generic GN.4 extension is already requested by HE.7s. Its finite-extension F_P orbit/measure/stabilizer contract remains unverified in original sources; CV-CM Lemma 2.30, printed p.289, qualifies the general local-field extension. The new node records the arithmetic joining application only.

**Gap: Quaternionic fibre and quantitative reduction growth.** The away-P quaternionic fibre and commensurator model, H2 degeneracy/nonconstant-map compatibility and arbitrarily large supersingular norm fibres require the exact R18 and remaining AA.4 requests. Existing anisotropic compactness, S-arithmetic lattice and strong approximation nodes are reused directly. Neither a complex CM double-coset model nor marginal density supplies these stronger interfaces.

**Gap: Traced universal-norm rank and presentation comparison.** Howard’s proof of Theorem 2.3.7 was read, but its cited Perrin–Riou rank comparison was not independently read; PMIA L5 remains not_read in its accepted packet. The exact traced norm-module/presentation interface is requested there, preserving finite G and the nonunit augmentation lattice.

**Gap: Weak-torsion auxiliary descent and d(k) finite solvability.** CGLS states the adaptation under E(K)[p]=0. The precise auxiliary disjointness and common free-presentation proof with shifted conductor and finite G0 must still be supplied for the accepted family. Full-image HE.4 or integral averaging cannot simply be reused without verifying their hypotheses.

**Gap: Arithmetic integral control and arbitrary character base change.** Existing SI.L3 nodes cover inverse Shapiro, finite-layer derived control and duality with error cones. Exact perfect character base change, ordinary/inertia map compatibility and Howard’s arithmetic functional equation remain stronger requested interfaces. Nekovář 8.10.1 is cited through the read CS proof, not represented as independently acquired/read.

**Gap: Integral containment beyond the clean class-number condition.** CS §3.4 explicitly applies Howard Theorem 2.2.10, an abstract integral bound with A–D hypotheses and no class-number assumption. Its application to the broader d(k) tower without p∤h_K still requires arithmetic verification of A–D, including the p and augmentation valuations and the ordinary lattice comparison. Howard Theorem B states the clean comparison case, while CGLS gives only localized divisibility. This is an application/supplier gap, not a claimed counterexample or source erratum.

## Source and baseline record

The source readings below record the planning pass. The packet also records the independent review’s precise readings, which checked the eight refinement targets and the inherited E2/E3 findings; the imported targets retain their earlier accepted review. These readings support the target-specific statements above, not a section-by-section extraction. No source passage is reproduced. Published and preprint page numbers are deliberately distinguished. Sources cited indirectly through Howard or CS are not claimed as independent readings.

- **howard**: Benjamin Howard, [The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340v1). arXiv:1202.6340v1; original Compositio Math.140 (2004),1439–1472. Locators below use preprint PDF pages. Read: Introduction pp.2–3; Chapter2 pp.22–35 in full, including arithmetic hypotheses, specialization, norm modules and proof of Theorem B. Chapter1 is imported through HE.0 and ES.5, not claimed as a fresh full reading. Accessed 2026-10-14.

- **cv-cm**: Christophe Cornut; Vinayak Vatsal, [CM points and quaternion algebras](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-10/07.pdf). Documenta Mathematica10 (2005),263–309, published version. Printed page equals PDF page+262. Read: Printed pp.263–300: §§1–3, adelic spaces, distribution and supersingular reduction, including Theorem2.29 and the stated Ratner orbit-classification consequence. Complements after p.300 not used. Accessed 2026-10-14.

- **cv**: Christophe Cornut; Vinayak Vatsal, [Nontriviality of Rankin–Selberg L-functions and CM points](https://personal.math.ubc.ca/~vatsal/research/part1.pdf). Author preprint dated1 April2005; published LMS Lecture Notes320 (2007),121–186. All locators here are preprint PDF page numbers. Read: Introduction pp.1–13,15–16; relative torsion/character setup pp.20–24; §§3.7–3.8 pp.34–35; §§4–5 pp.36–60 in full; Appendix6.5 pp.67–69, predecessors and degeneracy maps. Other Appendix6 material is supplied by HE.2. Accessed 2026-10-14.

- **bcgs**: Ashay Burungale; Francesc Castella; Giada Grossi; Christopher Skinner, [Nonvanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/pdf/2312.09301v2). arXiv:2312.09301v2, January2026. Published Cambridge J.Math.14(2)(2026),285–348; locators are v2 PDF pages, not published pagination. Read: Introduction and §§1–2, pp.1–20 in full, stopping at the cyclotomic heading. §3 cyclotomic Kato results are outside this part. Accessed 2026-10-14.

- **cs**: Francesc Castella; Takamichi Sano, [On refined nonvanishing conjectures by Kurihara and Kolyvagin](https://arxiv.org/pdf/2601.14504v1). arXiv:2601.14504v1,20 January2026; 18 pages. No published version listed on the arXiv/author pages inspected. Read: Introduction pp.1–5 and §3 pp.11–17 in full; §2 cyclotomic argument not used. Lemma3.1.1 p.13 also checked visually against the rendered PDF. Accessed 2026-10-14.

- **cgls**: Francesc Castella; Giada Grossi; Jaehoon Lee; Christopher Skinner, [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf). Invent.Math.227(2022),517–580; published author-hosted copy. Read: §3.2 setup printed p.547; §3.4 and §4.1 printed pp.564–569, including Theorems3.4.1/4.1.1 and Remark4.1.3. The surrounding Eisenstein main-conjecture proof was not read or planned here. Accessed 2026-10-14.

- **cs-author**: Francesc Castella; Takamichi Sano, [On refined nonvanishing conjectures by Kurihara and Kolyvagin](https://web.math.ucsb.edu/~castella/Kurihara.pdf). Current author-hosted preprint, dated20 January2026, accessed14 October2026; 18 pages. Read: Lemma3.1.1 and neighboring definitions, p.13, checked for a correction to the arXiv coefficient-ideal condition; the same condition remains printed. Accessed 2026-10-14.

The packet records source SHA-256 digests and version identities. E2 is reused from the accepted packet: the CS coefficient-ideal reversal was checked again in both acquired current copies. E3 is also inherited: the exact rigidity route remains p>3. This job adds no source-issue IDs.

The Lean baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. `Module` and `LinearMap` were read at that exact Mathlib commit. They supply the genuine carriers for the elementary linear trace statement; they do not supply compact arithmetic Selmer objects. Current read-only TauCetiRoadmap and Tau Ceti were also screened, including the newer roadmap additions, so current ordinary elliptic reduction, profinite cohomology and adelic group plans are reused. No lake command was run in those read-only trees.

Independent review accepted this target-level pass on 2026-10-14 after correcting the away-P quotient, completing the traced-module constructor/extensionality API and separating the clean comparison edge from the broader nonvanishing route. The six gaps remain open. The corrected Suggested file elaborated at the pinned Mathlib with exactly seven admitted-proof warnings; the blueprint check reported no errors or warnings.
