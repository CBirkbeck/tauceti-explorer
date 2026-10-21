# Integral A_inf cohomology and torsion control — AI.0–AI.5

This part plans the integral coefficient package, derived décalage, Breuil–Kisin–Fargues modules, the pro-étale AΩ construction, its local specializations, and proper cohomology. The aim is to retain integral lattices and torsion throughout the comparison maps. Rational period theory alone cannot recover this information. The packet has 137 declarations, 118 API contracts, 85 definition tests and 31 planets; all eight scoped stages are **planned**, and none is closed. Its status is complete at target level under the protocol's breadth-before-depth stopping rule. The nine gaps and fourteen supplier requests below are part of that plan, not claims that their mathematics has been implemented.

The definitive mathematical statements are in this document and its [packet](../packets/AInfCohomology--AI.0.json). The [suggested file](../suggested/AInfCohomology--AI.0.lean) proposes names and signatures using the pinned carriers; its elaboration checks types, not proofs. Every packet declaration remains unchecked. All 26 inherited AI.1 identifiers survive, including the seven identifiers inherited by the preceding checkpoint. This document replaces that checkpoint's partial reader.

## Conventions and ownership

Fix a prime p. In the geometric statements, C is a complete algebraically closed nonarchimedean extension of Q_p, O=O_C, O^flat its valuation tilt, k its residue field, and A=A_inf=W(O^flat). Choose compatible primitive roots only when displaying cyclotomic coordinates. Write φ for Witt Frobenius, μ=[ε]−1, ξ=Σ_(j=0)^(p−1)[ε^(1/p)]^j, and tilde-ξ=φ(ξ). Thus μ=ξφ^(−1)(μ), θ has kernel (ξ), and tilde-θ=θφ^(−1) has kernel (tilde-ξ). The factorization defining ξ is integral; no fraction-field division is part of its definition. At θ, μ maps to zero and tilde-ξ to p. At tilde-θ, μ maps to ζ_p−1 and tilde-ξ to zero. The residue map A→W(k) sends μ to zero and ξ and tilde-ξ to p.

Complexes are cohomological and indexed by Z, with d:C^i→C^(i+1). Tensor products and scalar extensions are derived where marked; a hat means the completion named in that statement. A normalized principal décalage term is the divisibility submodule E_f(C)^i={x∈C^i:dx∈fC^(i+1)}. Its differential divides once by f. Multiplication by f^i identifies this normalized model with the subcomplex in C[1/f], including negative degrees. For an invertible ideal sheaf I, the intrinsic term is E_I(C)^i⊗I^⊗i, using dual powers for i<0. The local normalized model does not erase these line transitions.

The RS-01 ownership inherited by this packet is retained with issue #664’s more precise corrections. Its September ownership review is historical; this revision does not assert acceptance of the subsequently revised RS-01 proposal. AI.0 owns finite Witt coherence and the shared polynomial/étale coefficient lemmas; CP.0's coherence declaration is an alias. AI.2 owns Lemma 4.9 and Proposition 4.13, because BKF realization needs them before proper cohomology. CP.5's perfectness/Tor and structure declarations are aliases of AI.2. AI.5 owns the specialization algebra of BMS1 Lemmas 4.14–4.20, while CP.5 applies it to its geometric comparison statements. CR.4 imports AI.0 coefficients; coefficients do not import their CR.4 consumer.

The shared substrate is imported by exact node identifiers in the catalogue. DD.0 owns full cotangent complexes and transitivity, DD.1 owns generic completion, filtered/Beilinson constructions and scalar Koszul complexes, E1/E2/E4/E5 own enhancements and derived sheaf operations, A1 the corrected site, PSP the perfectoid and almost-purity inputs, CR.0/CR.2/CR.3/CR.4 the PD/crystalline/Witt objects, and upstream AdicSpaces the interior spaY and its Frobenius. The punctured analytic endpoint extension needed by SW reconstruction is requested from that same owner. No upstream roadmap, other packet, atlas data or final prismatic comparison is replanned here. The early P8 primitive integral comparison is requested independently of comparison applications consuming AI.3–AI.5. Proper de Rham perfectness is imported from the exact lower-tier DD.5 theorem. Under the 2026-10-09 upstream order, AI.2 now owns linear module patching, integral Witt/Robba descent, analytic annulus classification, extension across infinity and the finite-free A_inf/vector-bundle equivalence. RF4 and the outside-order VB plan import these results; they are no longer prerequisites of AI.2.

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The reviewed AUDIT-35 and accepted review were read; the generated coverage file has no AInf entries. All 33 cited baseline declarations were independently re-read for this review at the exact Mathlib pin. They supply ordinary complexes and derived categories, tensor/localized modules, Witt vectors, PreTilt and Fontaine's theta, adic completion, isocrystals and period carriers. Their existence does not provide the missing coherent enhancement or completed pro-étale comparison machinery; the native BDeRham carriers alone do not certify their topology or DVR properties. The upstream AdicSpaces and DGAInfinity documents were read. AdicSpaces Layer 6 and current Tau Ceti supply the interior spaY=D(p) intersection D([varpi^flat]) and its positive finite radius windows. SW §12.2, pp.101–102 instead uses the punctured analytic Y^an=D(p) union D([varpi^flat]), including radius zero and infinity. Reconstruction imports the existing interior and requests the endpoint carrier, interval section rings, stalks and sheaf extension from AdicSpaces; it does not claim those are already supplied. The inspected current commits are recorded in upstreamNotes.

## AI.0. Finite Witt coefficients

Construct the maps tilde-θ_r by A_inf(S)≅lim_F W_r(S), and put θ_r=tilde-θ_rφ^r. For r≥1, ξ_r=∏_(i=0)^(r−1)φ^(−i)(ξ) and tilde-ξ_r=φ^r(ξ_r)=∏_(i=1)^rφ^i(ξ). Both quotient maps are surjective. F, R and V have different scalar twists: R on the Frobenius limit corresponds to φ^(−1). The precise formulas are in the API catalogue. In the Verschiebung formula θ_(r+1)(lambda_(r+1)phi^(-1)(y))=V(θ_r(y)), the element lambda_(r+1) lifts V(1) under θ_(r+1); replacing that lift by p is invalid in general. The V^j(1) ideals and the regular quotient presentations are retained in the kernel/regularity package. The limit θ_∞ has kernel (μ); its cokernel is almost zero, and surjectivity needs the stronger spherical-completeness hypothesis.

For perfectoid S→S′ and 1≤j≤r, both W_j(S)⊗^L_(A_inf(S))A_inf(S′)→W_j(S′) and W_j(S)⊗^L_(W_r(S))W_r(S′)→W_j(S′) are equivalences, with either iterated restriction or Frobenius in the second expression. The proof uses regular two-term A_inf quotient resolutions followed by tensor associativity. It does not assert that every Witt map is flat.

For a perfectoid valuation ring O, W_r(O) is coherent. The proof passes through the finite-presentation criterion, coherent quotients, coherent square-zero extensions, Artin–Rees and bounded-isogeny transfer. Finitely presented W_r(O) modules have no nonzero Witt-almost-zero elements. Lemma 9.8 supplies inclusions between Witt polynomial rings and their integral Teichmüller monomial subrings, with equality after adjoining all p-power roots. Theorem 10.4 supplies étale Witt maps and their arbitrary base-change isomorphism. These coefficients serve AI.2, AI.3 and CR.4 before any relative Witt-complex comparison.

Acceptance distinguishes F from R on a nonfixed Teichmüller element, computes r=1 and r=2 kernels, and checks the images of μ and ξ in W(k). Neither W_r(O[T])=W_r(O)[T] nor blanket Witt flatness is an accepted shortcut.

## AI.0:integral. Intrinsic twists

Construct A_inf{1} from the inverse system of conormal lines ker(tilde-θ_r)/ker(tilde-θ_r)^2. Their natural transition is p times the normalized transition; divide that factor with an integrality proof before taking the limit. Positive twists use tensor powers and negative twists their duals. BMS1 Example 4.24 and BMS2 Remark 6.6 identify the normalization. In cyclotomic coordinates A_inf{1}=(1/μ)A_inf(1), and linearized Frobenius sends its intrinsic basis to (1/tilde-ξ) times that basis.

The étale realization is Z_p(1). Its tilde-θ reduction is O_C{1}=T_p(Ω^1_(O_C/Z_p)); Fontaine's dlog maps O_C(1) injectively onto (ζ_p−1)O_C{1}, rather than onto the whole line. Zavyalov's Theorem 3.3.3 gives the integral image calculation. The completed cotangent statements Lhat_(O_C/Z_p)≅O_C{1}[1] and Lhat_(S/O_C)=0 for integral perfectoid S are requested from DD.0, with transitivity and derived completion. Vanishing of ordinary differentials alone is insufficient.

CR.0 supplies the integral PD envelope A_crys; this prefix checks its coefficient maps and Frobenius without rational-period comparison. Tests include the zero twist, the dlog image and negative tensor powers. They prevent replacement of the intrinsic line by an untwisted unit or by a bare Tate module.

## AI.0:period-comparison. Common rational maps

Use A_crys and its specified maps to form the common B_crys^+, B_crys, B_dR^+ and B_dR comparison interface. A_inf[1/p], ξ-adic completion and μ inversion have different roles. R06.1 must provide the topology, principal kernel and discrete-valuation proofs for the existing carriers, including continuous Galois actions. Integral twists and local décalage precede this request. No isomorphism between unnamed period rings is used as a surrogate for compatible scalar maps.

## AI.1. Décalage, Bockstein and completion

On a termwise f-torsion-free representative, divided differentials are unique and square to zero. Cycles are original cycles, while boundaries yield H^i(Lη_I C)≅(H^i(C)/H^i(C)[I])⊗I^⊗i. The annihilator has exponent one: Lη_p kills Z/p and changes Z/p² to Z/p. It is consequently not exact. Strongly K-flat replacements are requested from E1, rather than assuming ordinary termwise flatness supplies all tensor compatibility.

Construct the lax symmetric monoidal map Lη_I C⊗^L Lη_I D→Lη_I(C⊗^L D) using a resolved source. Over a valuation ring its strengthened monoidal statement has the source hypotheses. The identity/η comparison maps depend on truncation bounds and torsion hypotheses; the proof of Lemma 6.9 uses the repaired good-truncation boundary argument recorded below. For connective C with H^0(C)[I]=0 there is a canonical Lη_I C→C. The Bockstein comparison is a chain map, then an injectivity and a surjectivity proof. Locally dx=fy gives β([x])=[y]; changing a lift requires the boundary correction, not only independence modulo f.

Lη_I commutes with the specified flat base change, while the nonflat finite-Witt specialization has its own criterion. The completed-direct-sum theorem retains its uniform torsion bound. Derived-completeness preservation and the two same-ideal completion comparisons use the exact DD.1/E4 limits and hypotheses. BMS2 Proposition 5.8 describes the filtered functor as the Beilinson connective cover of the I-adic filtration. BLM's fixed-point and saturated Dieudonné consumers import this décalage package; their saturation, Cartier and Nygaard constructions belong to CR.4.

The unrelated-completion regression is independent work, motivated by BMS1's warning. Set A=Q[x,t] and M=⊕_(n≥0)Q[x]e_n. Let t act as the backward shift minus x. It is injective on M by looking at the last nonzero component. Its x-adic completion is the restricted sequence module N: entries in Q[[x]] tend to zero x-adically. The vector (1,x,x²,…) lies in N and is killed by t. The finite vectors v_N=Σ_(i<N)x^i e_i satisfy tv_N=−x^N e_(N−1), so this kernel appears only after completion. The canonical comparison between completion of Lη_t M and Lη_t of its completion is N→N/N[t], which is not invertible. No abstract nonisomorphism of N and N/N[t] is asserted; the extended shift-minus-x operator is surjective.

Koszul computations use commuting endomorphisms with exterior signs, twisted multiplication and the source closed cohomology formula. The p-adically completed continuous cochain model requires a forgetful comparison from Mathlib's N-indexed TopModuleCat cochains to Z-indexed ordinary complexes; it is a named gap. Acceptance includes negative degrees, unit/zero ideals, divided-once differentials, cochain shift signs, a genuinely commuting pair, and the canonical failure above.

## AI.2. BKF modules and Fargues pairs

A BKF module is finitely presented over A, finite free after inverting p, with linearized Frobenius φ^*M[1/tilde-ξ]≅M[1/tilde-ξ]. This is equivalent to a φ-semilinear map M[1/ξ]→M[1/tilde-ξ]. Finite free, minuscule and crystalline rigidification are additional properties. The general BKF category is not asserted abelian: the dlog inclusion into A_inf{1} has a cokernel failing p-local projectivity. Finite free objects have tensor products, duals and internal Homs. The source separately discusses abelian closure for morphisms preserving a specified crystalline rigidification.

Before realization, prove the valuation dimension/lattice lemmas, Kedlaya's punctured-spectrum triviality, perfectness, bounded torsion and Tor bounds, the punctured vector-bundle criterion and p-local projective freeness. Proposition 4.13 gives the functorial exact sequence 0→M_tor→M→M_free→M_bar→0, with bounded p-power torsion, finite free M_free and finitely presented perfect M_bar supported at the closed point. This algebra stays upstream of AI.5.

For every BKF module, T(M)=(M⊗_A W(C^flat))^(φ=1) is finite over Z_p and reconstructs the W(C^flat) realization; its μ-inverted comparison is retained. For finite free M, Xi=M⊗_A B_dR^+ is a lattice in T(M)⊗B_dR. Pair morphisms are Z_p-linear maps preserving Xi after extension. Full faithfulness is proved directly by BMS1 Remark 4.29 and the intersection in Lemma 3.23; it does not depend on proper cohomology or on essential surjectivity.

Essential surjectivity uses the punctured analytic Y^an, with the requested endpoint extension of upstream AdicSpaces' interior spaY, and the exact AI.2-owned analytic chain: integral Robba descent and no-leg shtukas (SW 12.3.4/12.3.5, p.104), pair-to-one-leg patching (12.4.6, pp.106–107), annulus isocrystal classification (13.4.1, pp.111–113), unique extension across infinity from Y_[r,infinity) to Y_[r,infinity] (13.2.1, pp.109–111), and the finite-free/vector-bundle equivalence on Y^an (14.2.1, pp.116–117). The leg is at phi^-1(x_C), corresponding to linearization at tilde-xi. This reconstruction needs no proper-cohomology or separate RF0 crystalline comparison prerequisite. The Fargues equivalence here is the finite free equivalence; do not infer exactness of its inverse. The perfectoid minuscule dictionary uses the initial prism (A_inf,tilde-ξ), Frobenius shifted from the theta prism. R07.2 needs an early Part II prismatic-window dictionary before applications consuming AI.2. Anschütz–Le Bras Proposition 4.3.5 (published 4.47) adds determination by (T_M,M_crys,α_M); its general descent erratum was checked separately.

Descent to discretely valued K retains continuous semilinear G_K actions and compatible coefficient topologies. BMS1 §4.4 gives the crystalline example, with the corrected Frobenius on W(k) and T↦[pi-flat]^p. Algebraic transport of an action alone does not prove continuity. Tests include the unit, the shifted rank-one lattice, rank zero, a zero nonspanning submodule, and A_inf/p, which belongs to the general category but is outside finite free Fargues classification.

## AI.3. The corrected site and AΩ

On the corrected pro-étale site, construct hat O_X^+=lim_n O_X^+/p^n, the tilt lim_F(hat O_X^+/p), and the derived p-completed Witt sheaf A_inf,X. The underlying pro-étale category is unchanged by Scholze's corrigendum; covers use transfinite towers whose map at every positive ordinal, including a limit ordinal, is pulled back from a finite étale surjection over the limit of preceding stages. The deleted point claims and splitting of arbitrary open profinite surjections are not used. On affinoid perfectoids the completed integral and tilted sections are the actual completed rings, and higher cohomology is almost zero. A_inf,X is a derived object; no everywhere discrete global limit is assumed. On profinite products its sections are continuous maps, and sharp is multiplicative rather than generally additive.

For smooth formal mathfrak X/O with generic fibre X and ν:X_proet→mathfrak X_Zar, set AΩ=Lη_μ Rν_*A_inf,X in the common enhancement. Toric root covers carry the continuous Z_p(1)^d action. Split completed monomial weights into integral and nonintegral summands, calculate the cohomology, and verify the no-almost-zero hypotheses before applying the almost-to-honest criterion. An arbitrary almost quasi-isomorphism is not automatically repaired by Lη. The finite Witt route uses AI.0 coherence, polynomial calculation and étale base change.

The framed q-model has q=[ε], γ_i(T_i)=qT_i and d(T^n)=[n]_q T^n dlog_q T. Its multiplication satisfies dlog_q T·f(T)=f(qT)·dlog_q T. Independent framings compare through the single sheaf AΩ and compatible restrictions, not by equality of coordinate formulas. The characteristic-two Sq^0 example distinguishes the coherent algebra from a strictly commutative dga. Frobenius gives φ^*AΩ≃Lη_(tilde-ξ)AΩ followed by the connective comparison, and smooth AΩ is derived (p,ξ)-complete.

Acceptance covers the point, a framed formal torus, two framings, a fractional monomial, continuous finite root transitions, d(T), d(T²), negative Laurent exponents and the twisted commutation rule.

## AI.4. Local specializations

The tilde-θ specialization is tilde-Ω=Lη_(ζ_p−1)Rν_*hat O_X^+, with H^i=Ω^i_cont{−i}. The first truncation is Lhat_(mathfrak X/Z_p)[−1]{−1}; its Ext² class is the obstruction to lifting to A_inf/(tilde-ξ²). This is Remark 8.4 and Proposition 8.15, while Proposition 8.17 computes the torus dlog image used in that proof. A chosen lift gives the corresponding splitting; a canonical splitting for every formal scheme is not claimed.

At finite length use tilde-θ_r and tilde-ξ_r. For connective D and D/xi, the precomplex H^n(D/tilde-ξ_r), with its Bockstein, has twisted F,V,R. The improved complex applies Lη_μ before reduction. Assumption 11.4 requires p-torsion-freeness at every r≥1 and n≥0; at p=2 it forces odd squares to vanish. The inclusion and restriction use the source scaled image, inverse Frobenius and η_(φ(μ)). Verify FV=p, FdV=d and the coefficient-dependent VF formula rather than impose VF=p without justification. CR.4’s universal F-V-procomplex receives a unique compatible family of relative de Rham–Witt maps, preserving multiplication, the unit, F,V,R and the Teichmüller differential identity. The unimproved precomplex additionally needs vanishing odd squares; the improved torsion-free hypotheses imply it, including at p=2. Its torus domain is W_r(O[T_i±1]), sending [T_i] to U_i^(p^r). Étale base change and continuous completion globalize the torus calculation.

The θ specialization is the continuous de Rham complex with its differential. It is distinct from the tilde-θ cohomology-sheaf description. The absolute A_crys comparison uses bounded divided-power coefficient subrings (m≥p² in the exchange steps), log([ε])=log(1+μ), toric estimates, and all-coordinate PD envelopes. Presentation independence follows from the actual cocycle maps. Further **derived** W(k) extension gives special-fibre crystalline cohomology with Tor terms retained. The agreement with BLM's saturated Witt comparison is a precise CR.4 map-agreement request. The étale comparison inverts μ and retains derived p-completion where the nonproper local statement needs it.

Acceptance distinguishes the two scalar maps, tests the Bockstein at length one, removes the fractional-weight precomplex torsion, checks multiplicative coordinate changes and Frobenius twists, and retains Tor-dependent specializations.

## AI.5. Proper cohomology

For smooth proper mathfrak X/O, set RΓ_Ainf=RΓ(mathfrak X,AΩ). Derived ξ-completeness and proper continuous de Rham perfectness imply that this is a perfect A_inf complex. DerivedDeRhamCohomology:DD.5/proper-smooth-cohomological-control supplies that coefficient-free finiteness prefix, before any A_inf comparison. It uses proper smooth finite-presentation reductions, finite Hodge filtrations and compatible perfect-complex lifting over the p-complete non-Noetherian base. Globalize θ, A_crys, W(k) and μ-inverted comparisons as canonical maps, preserving products and semilinear Frobenius. The primitive integral proper comparison comes from the early P8 slice. The rational crystalline input needs an early CR.3 extension: BMS1 Proposition 13.21, pp.116–117, over non-Noetherian A_crys with a specified residue-field section. The existing Noetherian-base isogeny does not supply this bridge. Once that requested input is supplied, p-local freeness follows from both period realizations.

BMS1 §4.2 supplies the rank/length and Tor statements. For finitely presented M free after p inversion, the generic and residue realizations have equal rank and satisfy the finite p-level length inequality. For a perfect complex with p-locally free cohomology, H^i(C)⊗W(k) injects into H^i(C⊗^L W(k)); the obstruction to an integral isomorphism involves the adjacent degree. If the derived W(k) specialization in degree i is p-torsion-free, H^i(C) is finite free; the ordinary adjacent-degree torsion-free hypothesis gives the asserted degreewise recovery map. De Rham and crystalline torsion-freeness agree under the precise perfectness and p-local freeness assumptions.

Each H_Ainf^i is therefore a general BKF module, with finite presentation and p-local freeness; perfectness of the total complex does not make every integral cohomology module free. CP.5 imports the specialization algebra and gives its uniform geometric torsion/lattice formulation. No subquotient relation between integral étale and crystalline torsion is inferred from a length inequality. Tests include the point, the degree-zero and degree-two lines of formal P^1, and a finite free two-term complex with torsion cohomology.

## Suggested-signature boundary

All 137 node exports, 118 API names and 85 named example contracts have signatures in the suggested file. All 75 omissions listed by the prior review have been filled. The six new ownership inputs have explicit finite-projective, affine or essential-surjectivity signatures and named geometric omissions; their full equivalences remain the mathematical contracts in this document. The source-level tests above and in the catalogue remain the acceptance contracts. An example with omitted geometric hypotheses does not validate those contracts computationally.

| Interface | Native carrier used | Conditions or structure absent from the prototype |
| --- | --- | --- |
| Principal and ideal décalage | Z-indexed CochainComplex (ModuleCat R), submodules, localization | The ideal version is a principal chart; invertible line powers, descent and enhanced sheaf tensor are absent. |
| Derived décalage and products | Ordinary DerivedCategory and tensor complexes | Strongly K-flat and enhanced localization/coherence hypotheses are recorded in the packet; the product examples check homogeneous algebra and signs. |
| Bockstein and comparison | Ordinary quotient complexes and their homology, actual chain maps | Derived reduction requires the requested regular/K-flat representative; global line transitions are absent. |
| Finite Witt and period coefficients | WittVector, TruncatedWittVector, actual ring maps and localizations | Perfectoid geometry, primitive roots, kernel proofs and completion topology enter the mathematical contract; geometric inputs are supplied explicitly in narrower signatures. |
| Intrinsic twist | ModuleCat lines, tensors, duals, localized linearized Frobenius | The conormal inverse system, continuous Tate realization and completed cotangent comparison have no pinned implementation. |
| BKF and lattice pair | FinitePresentation, localized modules, scalar extension, native Submodule lattice data | A_inf geometry, B_dR DVR/topology and continuous actions are not encoded by invented predicates. |
| Étale realization and reconstruction | Kernel of Frobenius minus identity; finite free modules and lattice data | W(C^flat) geometry, one-leg shtukas and the analytic reconstruction conditions belong to the AI.2 targets; their geometric carriers and descent are omitted explicitly from the affine prototypes. |
| Integral/tilt sheaves and A_inf | Existing Sheaf of CommRingCat, PreTilt, affine complex representatives | The particular corrected site, module enhancement, derived sheaf completion and almost cohomology hypotheses are absent. |
| AΩ and toric cover | Principal décalage and AddMonoidAlgebra with Z[1/p]^d exponents | Rν_*, completed geometric tensor, perfectoid cover and continuous Γ action are absent. The character formula and finite-root tests use actual algebraic monomials. |
| q-model and Witt complexes | Laurent polynomials, tensor complexes and Bockstein complexes | Framing geometry, derived coefficient change and full multiplicative F-V/E_infinity coherence are absent. |
| Proper complex and comparison theorems | Native complexes, derived-category objects, scalar-extension models and module conditions | Formal schemes, smoothness/properness, derived completion and actual geometric RΓ/coefficient-identification hypotheses are omitted explicitly. |

The native Witt base-change proposal fixes the canonical coefficient maps and retains the étale conclusion and pure-tensor formula. The integral crystalline proposal retains the augmentation, residue and Frobenius commuting squares with expressible target p-completeness and theta(xi)=0. The adjacent-degree criterion retains bounded finite-projective perfectness and the actual base-change map. The standard reconstruction example compares BKF morphisms with inverse underlying maps, so it includes Frobenius compatibility.

The final file is checked with lean-check against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, with only intentional proof-placeholder warnings. It imports individual Mathlib modules and no Tau Ceti module; the shared build’s Tau Ceti revision is different from the packet’s historical baseline, so elaboration is not a compile claim at that Tau Ceti pin. It claims no implemented proof. General enhancement and geometric hypotheses are omitted where they cannot yet be stated; no opaque proposition or theorem-as-field hides that omission.

## Declaration catalogue

Each entry is a packet node. Statements, hypotheses, proof steps, prerequisite identifiers, API contracts and unit tests below are rendered from the revised packet. Sources are described in our own words with theorem, section and page locators; no source passage is reproduced.

### AInfCohomology:AI.0

Coverage: **planned**.

Refinements: Refine the finite-type Witt étale base-change proof cited by Theorem 10.4 and the polynomial-coordinate inclusions of Lemma 9.8 into explicit helper declarations; refine the coherence proof interior as needed.

#### Cyclotomic period elements

`AInfCohomology:AI.0/cyclotomic-coefficients` · construction · `TauCeti.AInf.cyclotomic` · Planet: **Cyclotomic period elements**

For C complete algebraically closed over Q_p and epsilon=(1,zeta_p,zeta_p2,...) in O_C^flat, define mu=[epsilon]-1, xi=sum_{j=0}^{p-1}[epsilon^(1/p)]^j, and tilde-xi=phi(xi). Thus mu=xi*phi^(-1)(mu); division is the proven factorization in A_inf, never division in a fraction field.

**Hypotheses.** C is a complete algebraically closed nonarchimedean extension of Q_p p is prime roots are compatible and primitive.

**Construction/proof.**

1. Use the geometric sum identity in Witt vectors.
2. Evaluate theta(xi) using the primitive p-th root and use the primitive-kernel criterion.

**Direct prerequisites.** `mathlib:WittVector.teichmuller`, `mathlib:WittVector.frobeniusEquiv`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

**Uses.** `AInfCohomology:AI.3/aomega`: mu defines the local decalage. `AInfCohomology:AI.4/hodge-tate`: The two kernels specify distinct specializations.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AInf.cyclotomic_mu` | projection | The first component is [epsilon]-1. |
| `TauCeti.AInf.cyclotomic_factorization` | relation | mu=xi*phi^(-1)(mu). |
| `TauCeti.AInf.cyclotomic_frobenius` | relation | tilde-xi=phi(xi). |
| `TauCeti.AInf.cyclotomic_kernel` | characterisation | ker(theta)=(xi); ker(theta∘phi^(-1))=(tilde-xi). |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AInf.cyclotomic_test_unit` | non-example | epsilon=1 makes mu=0 and does not give an admissible primitive root system. |
| `TauCeti.AInf.cyclotomic_test_theta` | computation | theta(mu)=0 and theta(tilde-xi)=p. |
| `TauCeti.AInf.cyclotomic_test_tildeTheta` | computation | tilde-theta(mu)=zeta_p-1; tilde-theta(tilde-xi)=0. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Example 3.16 and Proposition 3.17; printed p.25. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Frobenius-shifted Fontaine map

`AInfCohomology:AI.0/tilde-theta` · construction · `TauCeti.AInf.tildeTheta`

Define tilde-theta=theta∘phi^(-1): A_inf(S)→S on a perfectoid ring. Its kernel is phi(ker theta); for the cyclotomic O_C normalization it is (tilde-xi).

**Hypotheses.** S is integral perfectoid with p-adic topology and surjective Frobenius mod p.

**Construction/proof.**

1. Compose the existing ring maps.
2. Transport the principal kernel through the Frobenius equivalence.

**Direct prerequisites.** `mathlib:WittVector.fontaineTheta`, `mathlib:WittVector.frobeniusEquiv`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

**Uses.** `AInfCohomology:AI.4/hodge-tate`: Hodge–Tate reduction uses tilde-theta.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AInf.tildeTheta_apply` | simp | tilde-theta(x)=theta(phi^(-1)x). |
| `TauCeti.AInf.tildeTheta_surjective` | characterisation | tilde-theta is surjective. |
| `TauCeti.AInf.tildeTheta_ker` | characterisation | Its kernel is generated by phi(xi). |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AInf.tildeTheta_test_teich` | computation | tilde-theta([a])=(a^(1/p))^sharp. |
| `TauCeti.AInf.tildeTheta_test_p` | computation | tilde-theta(p)=p. |
| `TauCeti.AInf.tildeTheta_test_mu` | non-example | For O_C, tilde-theta(mu)=zeta_p-1 rather than zero. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Following Lemma 3.2; Lemma 3.3 and Lemma 3.4; printed pp.19–21. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Finite Witt coefficient maps

`AInfCohomology:AI.0/theta-witt-family` · construction · `TauCeti.AInf.thetaWitt` · Planet: **Finite Witt coefficient maps**

Using A_inf(S)≅lim_F W_r(S), let tilde-theta_r be projection and theta_r=tilde-theta_r∘phi^r. These are surjective ring maps to W_r(S), including theta_1=theta and tilde-theta_1=tilde-theta.

**Hypotheses.** S is integral perfectoid in the sense of BMS1 Definition 3.5; r≥1.

**Construction/proof.**

1. Identify the Frobenius limit of finite Witt vectors using inverse limits and untilting.
2. Check components on Teichmuller elements and prove surjectivity inductively.
3. For Verschiebung choose a lift of V(1) under theta_(r+1); transport it by phi^(r+1) for tilde-theta. Do not replace this lift by p.

**Direct prerequisites.** `mathlib:TruncatedWittVector`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `AInfCohomology:AI.0/tilde-theta`.

**Uses.** `AInfCohomology:AI.4/fv-precomplex`: The F,R,V maps use these coefficient compatibilities. `AInfCohomology:AI.3/witt-toric-cohomology`: Finite-level toric calculation uses W_r(S).

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AInf.thetaWitt_level_one` | compatibility | theta_1=theta; tilde-theta_1=tilde-theta. |
| `TauCeti.AInf.thetaWitt_surjective` | characterisation | Both maps onto W_r(S) are surjective. |
| `TauCeti.AInf.thetaWitt_F` | compatibility | F∘tilde-theta_(r+1)=tilde-theta_r; F∘theta_(r+1)=theta_r∘phi. |
| `TauCeti.AInf.thetaWitt_R` | compatibility | R∘theta_(r+1)=theta_r; R∘tilde-theta_(r+1)=tilde-theta_r∘phi^(-1). |
| `TauCeti.AInf.thetaWitt_V` | compatibility | Choose lambda_(r+1) with theta_(r+1)(lambda_(r+1))=V(1). Then V theta_r(x)=theta_(r+1)(lambda_(r+1)*phi^(-1)(x)), and V tilde-theta_r(x)=tilde-theta_(r+1)(phi^(r+1)(lambda_(r+1))*x). In the cyclotomic normalization xi is such a lift; p is not a lift over a characteristic-zero untilt. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AInf.thetaWitt_test_r1` | compatibility | For r=1 recover the existing Fontaine map, not an independent theta. |
| `TauCeti.AInf.thetaWitt_test_teich` | computation | tilde-theta_r([a])=[(a^(1/p^r))^sharp] and theta_r([a])=[a^sharp]. |
| `TauCeti.AInf.thetaWitt_test_FnotR` | non-example | For a non-Frobenius-fixed Teichmuller input, F and R compatibility differ by phi. |
| `TauCeti.AInf.thetaWitt_test_VnotP` | non-example | Over a characteristic-zero untilt, V(1) in W_2 has first Witt coordinate zero, whereas the first coordinate of p is p≠0; theta_2(p) cannot be used as V(1). |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemmas 3.2–3.4, printed pp.19–21; Definition 3.5, p.21; Lemmas 3.12–3.13, pp.23–24. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Finite Witt kernel generators

`AInfCohomology:AI.0/witt-kernel-generators` · construction · `TauCeti.AInf.xiWitt`

Set xi_r=product_{i=0}^{r-1}phi^(-i)(xi), and tilde-xi_r=phi^r(xi_r)=product_{i=1}^{r}phi^i(xi). Then ker(theta_r)=(xi_r), ker(tilde-theta_r)=(tilde-xi_r). Compatible unit choices are allowed for general perfectoid S. Both generators are nonzerodivisors.

**Hypotheses.** S and r as in theta-witt-family; xi generates ker(theta).

**Construction/proof.**

1. Induct using the finite Witt projection and kernel calculation.
2. Transport the product by phi^r to obtain the shifted formula.
3. Use the primitive-kernel nonzerodivisor theorem and transport regularity along Frobenius; products of regular factors remain regular.

**Direct prerequisites.** `AInfCohomology:AI.0/theta-witt-family`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

**Uses.** `AInfCohomology:AI.4/relative-witt-comparison`: Finite reductions are along tilde-theta_r.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AInf.xiWitt_recursion` | simp | xi_(r+1)=xi_r*phi^(-r)(xi). |
| `TauCeti.AInf.xiWitt_tilde_recursion` | simp | tilde-xi_(r+1)=tilde-xi_r*phi^(r+1)(xi). |
| `TauCeti.AInf.xiWitt_ker_theta` | characterisation | theta_r induces A_inf/(xi_r)≅W_r(S). |
| `TauCeti.AInf.xiWitt_ker_tilde` | characterisation | tilde-theta_r induces A_inf/(tilde-xi_r)≅W_r(S). |
| `TauCeti.AInf.xiWitt_regular` | structure | xi_r and tilde-xi_r are nonzerodivisors for integral perfectoid S, as are the distinguished generators after perfectoid base change. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AInf.xiWitt_test_one` | computation | xi_1=xi; tilde-xi_1=tilde-xi. |
| `TauCeti.AInf.xiWitt_test_two` | computation | xi_2=xi*phi^(-1)(xi), tilde-xi_2=tilde-xi*phi(tilde-xi). |
| `TauCeti.AInf.xiWitt_test_orientation` | non-example | The shifted r=2 product uses positive Frobenius powers, not xi*phi^(-1)(xi). |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemmas 3.12–3.13; printed pp.23–24. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Infinite Witt specialization kernel

`AInfCohomology:AI.0/witt-limit-and-mu-kernel` · theorem · `TauCeti.AInfPlan.witt_limit_and_mu_kernel`

For O_C, theta_infinity:A_inf→lim_R W_r(O_C)=W(O_C) has kernel (mu), equivalently the intersection over r≥1 of (xi_r)=(mu/phi^(-r)(mu)) is (mu). Its cokernel is killed by W(m_C^flat); if C is spherically complete, it induces A_inf/(mu)≅W(O_C). The ideal (mu) is independent of the compatible primitive roots. Ordinary completeness alone does not imply surjectivity.

**Hypotheses.** Cyclotomic coefficients; p-adic and weak topologies as in §3.

**Construction/proof.**

1. Compute xi_r=mu/phi^(-r)(mu), and reduce the intersection modulo p using regularity of (p,xi_r).
2. Identify the intersection of the resulting valuation ideals in O_C^flat.
3. Pass the finite-level short exact sequences to the R-inverse limit, identifying the cokernel with lim^1_r xi_r A_inf.
4. Reduce modulo p^s and use factorization of multiplication by any m∈m_C^flat through the constant mu system to kill lim^1; spherical completeness makes this lim^1 vanish.

**Direct prerequisites.** `AInfCohomology:AI.0/witt-kernel-generators`, `AInfCohomology:AI.0/cyclotomic-coefficients`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 3.23; printed p.27. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Regularity and completeness of integral periods

`AInfCohomology:AI.0/period-regularity` · theorem · `TauCeti.AInfPlan.period_regularity`

The elements p,mu,xi,tilde-xi and their finite Frobenius products are nonzerodivisors in A_inf(O_C). A_inf is p-adically and (p,xi)-adically complete; A_inf/(xi)=O_C is p-torsion-free. Record analogous (p,tilde-xi) completeness and regular pairs needed for finite derived reductions.

**Hypotheses.** C as above; do not assert O_C is noetherian.

**Construction/proof.**

1. Reduce the Witt statements modulo p to the valuation domain O_C^flat.
2. Use regular-sequence induction and completeness, retaining the topological-nilpotence assumption in Lemma 3.20.

**Direct prerequisites.** `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `AInfCohomology:AI.0/cyclotomic-coefficients`, `mathlib:WittVector.isAdicCompleteIdealSpanP`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 3.10, Proposition 3.17; Lemma 3.23 (regular-sequence argument); printed pp.22–27. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Tor independence for finite Witt vectors

`AInfCohomology:AI.0/witt-base-change` · theorem · `TauCeti.AInfPlan.witt_base_change`

For a map S→S′ of integral perfectoid rings and 1≤j≤r, the canonical maps W_j(S) tensor^L_(A_inf(S)) A_inf(S′)→W_j(S′) and W_j(S) tensor^L_(W_r(S)) W_r(S′)→W_j(S′) are quasi-isomorphisms. In the second map W_j(S) is a W_r(S)-module along either iterated Frobenius or restriction. This is Tor independence for the specified quotients, not flatness of every Witt map.

**Hypotheses.** Integral perfectoid rings S,S′; finite lengths 1≤j≤r; use the same Frobenius or restriction convention on both sides.

**Construction/proof.**

1. A distinguished generator xi of ker(theta) remains distinguished after base change.
2. Resolve A_inf(S)/(tilde-xi_j), or A_inf(S)/(xi_j), by its regular two-term A_inf resolution; the corresponding quotient over S′ is again regular.
3. Apply the same calculation at length r and derived tensor associativity to obtain the W_r(S) formula for either transition map.

**Direct prerequisites.** `AInfCohomology:AI.0/theta-witt-family`, `AInfCohomology:AI.0/witt-kernel-generators`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 3.13; printed p.24. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Coherence of Witt vectors of perfectoid integers

`AInfCohomology:AI.0/witt-coherence` · theorem · `TauCeti.AInfPlan.witt_coherence` · Planet: **Coherence of finite Witt vectors**

W_r(O_C) and W_r(O_C^flat) are coherent for every finite r. Kernels of maps between finite free modules are finitely generated; hence finitely presented modules form an abelian category at these finite Witt levels.

**Hypotheses.** Finite r≥1; the base is the valuation ring O_C or its tilt, not every perfectoid ring.

**Construction/proof.**

1. Use the valuation-ring kernel estimates, finite Witt truncation and induction on r.
2. Do not infer coherence of the infinite ring A_inf from this theorem.

**Direct prerequisites.** `mathlib:TruncatedWittVector`, `AInfCohomology:AI.0/coherent-square-zero-extension`, `AInfCohomology:AI.0/coherence-artin-rees`, `AInfCohomology:AI.0/artin-rees-bounded-isogeny`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 3.24; printed p.28. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Finite-presentation devissage over Witt rings

`AInfCohomology:AI.0/witt-finite-presentation-devissage` · lemma · `TauCeti.AInfPlan.witt_finite_presentation_devissage`

If I⊂R is finitely generated and M is an R/I-module, M is finitely presented over R/I iff it is finitely presented over R.

**Hypotheses.** Commutative ring R; finitely generated ideal I; M annihilated by I.

**Construction/proof.**

1. Lift a finite presentation over R/I to R, adding the finitely many generators of I for each free generator.
2. Reduce a finite R presentation modulo I for the converse.

**Direct prerequisites.** `mathlib:ModuleCat`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 3.25(i); printed p.28. The same finite-presentation criterion, with the finitely generated ideal hypothesis.

#### Absence of almost-zero finite Witt sections

`AInfCohomology:AI.0/no-almost-zero-witt-sections` · lemma · `TauCeti.AInfPlan.no_almost_zero_witt_sections`

Every finitely presented W_r(O_C)-module M has no nonzero element killed by W_r(m), for finite r≥1. In particular this applies to the finitely presented toric cohomology modules; it is stronger than just the free-module case.

**Hypotheses.** M finitely presented over finite W_r(O_C); m the non-finitely-generated maximal ideal of the nondiscrete valuation ring.

**Construction/proof.**

1. A cyclic submodule generated by an almost-zero element is finitely presented by coherence.
2. Its quotient of W_r(k) would force the residue kernel and then m to be finitely generated, a contradiction.

**Direct prerequisites.** `AInfCohomology:AI.0/witt-coherence`, `AInfCohomology:AI.0/witt-almost-ideal`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Corollary 3.29; printed p.30. The corollary excludes Witt-almost-zero elements in every finitely presented module.

#### Finite Witt polynomial decomposition

`AInfCohomology:AI.0/witt-polynomial-calculation` · lemma · `TauCeti.AInfPlan.witt_polynomial_calculation`

For any commutative ring S and finite Witt length r≥1, there are natural inclusions W_r(S[T_1^(p^r),…,T_d^(p^r)])⊂W_r(S)[U_1,…,U_d]⊂W_r(S[T_1,…,T_d]), where U_i=[T_i], and likewise for Laurent variables. Taking the union over all p-power roots gives W_r(S[T_i^(1/p^infinity)])=W_r(S)[U_i^(1/p^infinity)] and the Laurent version. The p-adic completed versions used in AI.3 follow by completion; this does not identify W_r(S[T]) with W_r(S)[T].

**Hypotheses.** S any commutative ring; p prime; finite Witt length r≥1 and finitely many variables. For the completed variants use the p-adic completion comparison, not an unrestricted monomial product.

**Construction/proof.**

1. Use Witt polynomial coordinates and the Teichmuller multiplicative lift to establish the two inclusions.
2. Localize to obtain the Laurent statement.
3. Pass to the filtered union of all p-power root variables, then to the specified p-adic completion.

**Direct prerequisites.** `AInfCohomology:AI.0/theta-witt-family`, `mathlib:TruncatedWittVector`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 9.8; printed p.74. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### The Witt almost ideal

`AInfCohomology:AI.0/witt-almost-ideal` · lemma · `TauCeti.AInfPlan.witt_almost_ideal`

For the maximal ideal m⊂O_C, W_r(m)=ker(W_r(O_C)→W_r(k)) is generated by Teichmuller elements [a], a∈m; it is idempotent and flat over W_r(O_C), by Lemma 10.1 and Corollary 10.2. Separately, for 0≤j≤r, Ann(V^j(1))=ker(F^j:W_r(O_C)→W_(r-j)(O_C))=(q_(r,j)), where q_(r,j)=([zeta_(p^j)]−1)/([zeta_(p^r)]−1) is the polynomial quotient supplied by cyclotomic divisibility, and Ann(q_(r,j))=(V^j(1))=V^j W_(r-j)(O_C), by Corollary 3.18. The first annihilator/kernel equality and the V-image equality hold for any perfectoid ring by Remark 3.19.

**Hypotheses.** Finite r≥1; O_C valuation ring with divisible value group and the fixed compatible primitive p-power roots. For the cyclotomic annihilator formulas, O_C is p-torsion-free; W_0=0.

**Construction/proof.**

1. Use Lemma 10.1 to compare powers of Witt ideals with ideals of Teichmuller lifts; apply Corollary 10.2 to the idempotent increasing union of principal ideals m.
2. Deduce flatness from the filtered union of principal ideals generated by nonzerodivisors.
3. For the separate Corollary 3.18 formulas, use x V^j(1)=V^j(F^j(x)), injectivity of V^j and surjectivity of F^j; compute ker(F^j) through the shifted theta kernels.
4. Use nonzerodivisibility of [zeta_(p^r)]−1 and the restriction map to identify Ann(q_(r,j)) with V^j W_(r-j).

**Direct prerequisites.** `AInfCohomology:AI.0/theta-witt-family`, `AInfCohomology:AI.0:integral/residue-map`, `AInfCohomology:AI.0/witt-kernel-generators`, `AInfCohomology:AI.0/period-regularity`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 10.1 and Corollary 10.2; printed p.80. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Corollary 3.18 and Remark 3.19; printed pp.25–26. The finite Witt annihilator and Verschiebung-image formulas are separate from the almost-ideal result of §10.

#### Étale base change of Witt vectors

`AInfCohomology:AI.0/witt-etale-base-change` · theorem · `TauCeti.AInfPlan.witt_etale_base_change`

For any étale map A→B of commutative rings, W_r(A)→W_r(B) is étale. For any map A→A′ with B′=B⊗_A A′, the natural map W_r(A′)⊗_(W_r(A)) W_r(B)→W_r(B′) is an isomorphism. This coefficient theorem precedes both AI.3 and the CR.4 relative de Rham–Witt comparison.

**Hypotheses.** Commutative rings; p prime; finite Witt length r≥1; A→B étale; A′ arbitrary.

**Construction/proof.**

1. Use the ghost-coordinate product description after inverting p; use localization to reduce to Z_(p)-algebras.
2. Use finite presentation to descend A→B to an étale A_0→B_0 with A_0 finitely generated over Z_(p).
3. Apply the finite-type Witt étale lifting/base-change result, then use tensor associativity for arbitrary A and A′. The supplier refinement must expose the finite-type proof interior.

**Direct prerequisites.** `mathlib:TruncatedWittVector`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 10.4; printed p.81. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Coherence of a finitely generated quotient

`AInfCohomology:AI.0/coherent-quotient` · lemma · `TauCeti.AInfPlan.coherent_quotient`

If R is coherent and I⊂R finitely generated, then R/I is coherent.

**Hypotheses.** Coherent commutative R; finitely generated I.

**Construction/proof.**

1. Lift a finitely generated ideal to R and use its finite presentation plus I/I² to present the quotient ideal.

**Direct prerequisites.** `AInfCohomology:AI.0/witt-finite-presentation-devissage`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 3.25(ii); printed p.28. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Coherence of a square-zero extension

`AInfCohomology:AI.0/coherent-square-zero-extension` · lemma · `TauCeti.AInfPlan.coherent_square_zero_extension`

If S→R is surjective with square-zero kernel I, R coherent and I finitely presented as an R-module, then S is coherent.

**Hypotheses.** I²=0; R coherent; I finitely presented over R.

**Construction/proof.**

1. For a finitely generated J⊂S, present its image in R and then J∩I as a submodule of a finitely presented coherent module.
2. Use the short exact sequence to present J.

**Direct prerequisites.** `AInfCohomology:AI.0/witt-finite-presentation-devissage`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 3.26; printed p.29. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Coherence from Artin–Rees and two charts

`AInfCohomology:AI.0/coherence-artin-rees` · lemma · `TauCeti.AInfPlan.coherence_artin_rees`

If f is regular in R, (R,f) has the Artin–Rees property on every inclusion of finitely generated modules, and R[1/f] and R/f are coherent, then R is coherent.

**Hypotheses.** Artin–Rees means the induced f-adic topology equals the intrinsic topology for every finitely generated module inclusion.

**Construction/proof.**

1. Reduce the finite-generation of a relation kernel to a mod-f statement with uniformly bounded f-torsion.
2. Use Artin–Rees again to present I/fI inside a coherent finite quotient.

**Direct prerequisites.** `AInfCohomology:AI.0/coherent-quotient`, `AInfCohomology:AI.0/coherent-square-zero-extension`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 3.27; printed p.29. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Artin–Rees under a bounded isogeny

`AInfCohomology:AI.0/artin-rees-bounded-isogeny` · lemma · `TauCeti.AInfPlan.artin_rees_bounded_isogeny`

For an injection R→S with both f-torsion-free and cokernel killed by f^n, (R,f) has the Artin–Rees property iff (S,f) does.

**Hypotheses.** f∈R regular on R,S; one fixed bound n on the cokernel.

**Construction/proof.**

1. Compare scalar extension and restriction modulo bounded f-torsion.
2. Translate equality of induced and intrinsic topologies across these functors.

**Direct prerequisites.** `AInfCohomology:AI.0/coherence-artin-rees`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 3.28; printed p.30. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

### AInfCohomology:AI.0:integral

Coverage: **planned**.

Refinements: Refine the conormal divided transition and its independence of generators; resolve DD.0 completed-cotangent and early prismatic-window supplier contracts.

#### Witt residue specialization

`AInfCohomology:AI.0:integral/residue-map` · construction · `TauCeti.AInf.residue`

The residue map O_C^flat→k induces A_inf=W(O_C^flat)→W(k); it commutes with Frobenius and sends mu to 0 and xi,tilde-xi to p. This is the coefficient map for the crystalline special fiber.

**Hypotheses.** k is the perfect residue field of O_C; C as above.

**Construction/proof.**

1. Use functoriality of Witt vectors on the residue homomorphism.
2. Evaluate epsilon and its roots at 1 in k.

**Direct prerequisites.** `mathlib:WittVector.map`, `AInfCohomology:AI.0/cyclotomic-coefficients`.

**Uses.** `AInfCohomology:AI.5/global-witt`: Specifies the derived W(k) specialization.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AInf.residue_teich` | simp | [a] maps to [bar a]. |
| `TauCeti.AInf.residue_frobenius` | compatibility | Residue commutes with phi. |
| `TauCeti.AInf.residue_periods` | simp | mu↦0 and xi,tilde-xi↦p. |
| `TauCeti.AInf.residue_surjective` | characterisation | The Witt residue map is surjective. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AInf.residue_test_one` | computation | 1 maps to 1. |
| `TauCeti.AInf.residue_test_mu` | computation | mu maps to 0, making mu-inverted residue specialization impossible. |
| `TauCeti.AInf.residue_test_xi` | non-example | xi maps to p, not 0 in W(k). |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Introduction, printed pp.2–3; §4.2, pp.34–44. Canonical residue-field Witt specialization of A_inf, not an invented new period ring.

#### Intrinsic Breuil–Kisin twist

`AInfCohomology:AI.0:integral/breuil-kisin-line` · construction · `TauCeti.AInf.bkTwist` · Planet: **Breuil–Kisin twist**

Define A_inf{1}=lim_r (ker tilde-theta_r/(ker tilde-theta_r)^2) with the divided transition maps normalized by p; set A_inf{n} to its tensor powers for n≥0 and dual powers for n<0. The cyclotomic trivialization gives A_inf{1}=(1/mu) A_inf(1); the linearized Frobenius on the intrinsic line has factor 1/tilde-xi. Distinguish this rank-one A_inf module from Z_p(1) and O_C{1}.

**Hypotheses.** C as above; compatible roots only for a displayed trivialization, not for the intrinsic line.

**Construction/proof.**

1. Construct the conormal transition maps and divide their p factors, proving integrality.
2. Compare a compatible system of conormal generators with dlog(epsilon)/mu.
3. Use tensor-dual evaluation to extend to all integer powers.

**Direct prerequisites.** `AInfCohomology:AI.0/witt-kernel-generators`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Uses.** `AInfCohomology:AI.4/hodge-tate`: H^i has the inverse twist {−i}. `AInfCohomology:AI.2/fargues-classification`: Tate twists must be preserved by the equivalence.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AInf.bkTwist_zero` | simp | A_inf{0} is the unit line. |
| `TauCeti.AInf.bkTwist_add` | equivalence | A_inf{a}⊗A_inf{b}≅A_inf{a+b}, coherently. |
| `TauCeti.AInf.bkTwist_dual` | equivalence | Dual of A_inf{a} is A_inf{-a}. |
| `TauCeti.AInf.bkTwist_frobenius` | compatibility | The linearized phi on the chosen basis of A_inf{1} is multiplication by 1/tilde-xi. |
| `TauCeti.AInf.bkTwist_epsilon_change` | compatibility | Changing epsilon transports the generator by the ratio dictated by dlog(epsilon)/mu; the intrinsic line is unchanged. |
| `TauCeti.AInf.bkTwist_etale` | compatibility | Étale realization of the line is Z_p(1); tilde-theta reduction is O_C{1}. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AInf.bkTwist_test_zero` | degenerate | The zero tensor power is A_inf, with identity phi. |
| `TauCeti.AInf.bkTwist_test_one` | computation | dlog(epsilon) spans mu*A_inf{1}; after tilde-theta its image is (zeta_p-1)O_C{1}. |
| `TauCeti.AInf.bkTwist_test_negative` | compatibility | A_inf{1}⊗A_inf{-1}≅A_inf, whereas a rule omitting duals fails for negative powers. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Example 4.24 (intrinsic conormal-limit construction); printed p.41. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

**Source.** [bms2](https://arxiv.org/pdf/1802.03261), Proposition 6.5 and Remark 6.6 (agreement of the intrinsic twists); printed pp.40–41. The conormal transition is p times the natural transition; this determines the divided maps in the p-torsion-free perfectoid setting.

#### Fontaine dlog theorem

`AInfCohomology:AI.0:integral/fontaine-dlog` · theorem · `TauCeti.AInfPlan.fontaine_dlog` · Planet: **Fontaine dlog theorem**

O_C{1}=T_p(Omega^1_(O_C/Z_p)) is free of rank one; dlog:O_C(1)→O_C{1} is injective with image (zeta_p−1)O_C{1}. There is no canonical trivialization of the Galois Tate line.

**Hypotheses.** C complete algebraically closed over Q_p; zeta_p primitive; continuous Galois action when C is a completed algebraic closure.

**Construction/proof.**

1. Use the completed cotangent calculation and the exact sequence of roots of unity.
2. For general C reduce from C_p via the vanishing of the relative completed cotangent complex.

**Direct prerequisites.** `AInfCohomology:AI.0:integral/breuil-kisin-line`, `DerivedDeRhamCohomology:DD.0/cotangent-complex`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [zavyalov](https://arxiv.org/pdf/2111.01830v3), Theorem 3.3.3 and proof, printed pp.35–36; twist conventions in §1, pp.9–10. Integral image is (zeta_p−1)O_C{1}; dlog is not an integral unit isomorphism.

#### Completed cotangent description of the twist

`AInfCohomology:AI.0:integral/completed-cotangent-twist` · comparison · `TauCeti.AInfPlan.completed_cotangent_twist`

The derived p-completed cotangent complex of O_C/Z_p is O_C{1}[1], and for an integral perfectoid O_C-algebra S the derived p-completed relative cotangent complex of S/O_C vanishes. These use cohomological degree −1, so the twist is the shift by −1 of the completed complex.

**Hypotheses.** Integral perfectoid S over O_C, with p-adic completion; do not replace the derived completion by ordinary differentials.

**Construction/proof.**

1. Use the perfectoid cotangent theorem from DD.0 together with transitivity.
2. Identify the surviving degree with the Tate module of differentials.

**Direct prerequisites.** `AInfCohomology:AI.0:integral/breuil-kisin-line`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.0`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [zavyalov](https://arxiv.org/pdf/2111.01830v3), §1 twist conventions, printed pp.9–10; Theorem 3.3.3 proof, pp.35–36. Completed cotangent calculations and the integral conormal line, requested from DD.0.

#### Integral crystalline coefficient interface

`AInfCohomology:AI.0:integral/integral-crystalline-ring-interface` · comparison · `TauCeti.AInfPlan.integral_crystalline_ring_interface`

Import the p-completed PD envelope A_crys of (A_inf,ker theta) from CR.0, with its theta augmentation and Witt residue map. Show the common coefficient maps commute and the Frobenius extends; no rational period-ring comparison is needed to construct this integral prefix.

**Hypotheses.** PD structure extends the canonical structure on p where required; C as above.

**Construction/proof.**

1. Invoke the PD envelope universal property for the coefficient maps.
2. Check Frobenius on xi and the divided powers before p-completion.

**Direct prerequisites.** `CrystallineCohomology:CR.0/fontaine-envelope`, `AInfCohomology:AI.0:integral/residue-map`, `AInfCohomology:AI.0/period-regularity`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 3.22(i), printed p.27; §12.1, pp.96–97; supplier CR.0/fontaine-envelope (principal regular case and coefficient maps). The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

### AInfCohomology:AI.0:period-comparison

Coverage: **planned**.

Refinements: Resolve R06.1 principal-kernel, topology and discrete-valuation supplier contracts; refine the canonical common-map identification.

#### Comparison with rational period rings

`AInfCohomology:AI.0:period-comparison/common-rational-period-maps` · theorem · `TauCeti.AInfPlan.common_rational_period_maps` · Planet: **Common rational period maps**

Extend the common integral A_inf and A_crys maps to the rational rings supplied by R06.1. Identify B_dR^+ with completion of A_inf[1/p] at ker(theta[1/p]), B_dR=B_dR^+[1/xi], and the compatible A_crys→B_dR^+ and B_crys maps. Establish the Frobenius-twisted scalar-extension identities, not a second set of unrelated period constants.

**Hypotheses.** Construct the integral prefix first; use the rational topology, separatedness and kernel-generator theorems supplied by R06.1.

**Construction/proof.**

1. Compare the existing Mathlib completion/localization carriers with the supplier universal properties.
2. Extend maps only after their continuity and denominator conditions are checked.
3. Transport xi and tilde-xi along phi when changing scalar maps.

**Direct prerequisites.** `AInfCohomology:AI.0:integral/integral-crystalline-ring-interface`, `PadicHodgeTheory:R06.1`, `mathlib:BDeRhamPlus`, `mathlib:BDeRham`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 3.22(ii–iii), printed p.27; §4.3, printed pp.41–43. Canonical rational coefficient maps on the integral constructions; topology and DVR assertions are requested from the period owner.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Definition 12.4.3 and Remark 12.4.4, printed pp.105–106 (PDF pp.115–116). Shared analytic completed-stalk and fraction-field identification, including the coefficient maps.

### AInfCohomology:AI.1

Coverage: **planned**.

Refinements: Resolve strongly K-flat and ringed-topos enhancement requests; refine line-power descent, filtered multiplication and the canonical derived-limit/completion comparisons beyond the affine prototype.

#### Divisibility submodule

`AInfCohomology:AI.1/principal-term` · definition · `TauCeti.Decalage.etaTerm`

E_f(C)^i is the R-submodule of C^i consisting of x for which there exists y in C^(i+1) with f y=d x. No torsion-freeness is needed to define this submodule.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one.

**Construction/proof.**

1. Use the preimage under d of the image of scalar multiplication by f.
2. For sums add the witnesses; for scalar multiples multiply the witness by that scalar. Commutativity of R supplies scalar linearity.

**Direct prerequisites.** `mathlib:ModuleCat`, `mathlib:CochainComplex`.

**Uses.** `AInfCohomology:AI.1/principal-differential`: A witness supplies division of the differential by f. `AInfCohomology:AI.1/principal-complex`: These submodules are the normalized terms.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.Decalage.etaTerm_mk` | constructor | If f y=d x then x belongs to E_f(C)^i. |
| `TauCeti.Decalage.etaTerm_coe` | coercion | The inclusion E_f(C)^i→C^i is R-linear and injective. |
| `TauCeti.Decalage.etaTerm_ext` | extensionality | Two elements of E_f(C)^i agree exactly when their images in C^i agree. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `term_unit` | computation | For f=1, E_f(C)^i=C^i. |
| `term_zero` | degenerate | For f=0, E_f(C)^i=ker(d_i). |
| `term_nondivisible` | non-example | For C=[Z --1→ Z] in degrees 0,1 and f=2, the element 1 does not belong to E_f(C)^0. |

**Acceptance.** The ambient carrier is the existing module C^i, not a replacement module type. The zero-divisor case is admitted for this definition only.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 6.2 and Remark 6.3, printed p.49. This is the untwisted local submodule in Definition 6.2. The source does not require a generator in the global construction.

#### Divided differential

`AInfCohomology:AI.1/principal-differential` · construction · `TauCeti.Decalage.etaDifferential`

For x in E_f(C)^i, define δ_i(x) to be the unique y satisfying f y=d_i x, regarded as an element of E_f(C)^(i+1). This is an R-linear map.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Construction/proof.**

1. Existence is the defining divisibility condition; uniqueness uses injectivity on C^(i+1).
2. Apply d to f y=d x. Injectivity on C^(i+2) gives d y=0, so y belongs to the next divisibility submodule.
3. Uniqueness applied to sums and scalar multiples proves linearity.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-term`, `mathlib:HomologicalComplex.d_comp_d`.

**Uses.** `AInfCohomology:AI.1/principal-complex`: It is the adjacent differential of the normalized cochain complex.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.Decalage.etaDifferential_spec` | characterisation | The underlying value satisfies f δ_i(x)=d_i x; promoted as principal-differential-spec. |
| `TauCeti.Decalage.etaDifferential_unique` | universal-property | Any y in the next term satisfying f y=d_i x equals δ_i(x). |
| `TauCeti.Decalage.etaDifferential_add` | simp | δ_i(x+x′)=δ_i(x)+δ_i(x′). |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `divided_unit` | computation | For f=1 the underlying differential is d. |
| `divided_cycle` | degenerate | For a genuine cocycle x, δ_i(x)=0. |
| `divided_once` | computation | For [Z --4→Z] and f=2, δ_0(1)=2, not 0 or 1. |

**Acceptance.** Do not select arbitrary preimages without proving uniqueness. The derivative of the selected preimage vanishes before it is re-bundled.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 6.2, differential diagram, printed p.49. An explicit affine implementation of the factored differential; division is by injective scalar multiplication, not by a field inverse.

#### Divisibility equation

`AInfCohomology:AI.1/principal-differential-spec` · lemma · `TauCeti.Decalage.etaDifferential_spec`

For every i and x in E_f(C)^i, f δ_i(x)=d_i x in C^(i+1).

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Construction/proof.**

1. Unpack the unique preimage used to define δ_i.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-differential`.

**Acceptance.** Use the equation after applying any R-linear map.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 6.2, printed p.49. The commutative differential square in the chosen generator.

#### Square-zero divided differential

`AInfCohomology:AI.1/principal-differential-square` · lemma · `TauCeti.Decalage.etaDifferential_square`

δ_(i+1) composed with δ_i is zero for every integer i.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Construction/proof.**

1. The equation f δ_i(x)=d x and d²=0 give d δ_i(x)=0 by f-injectivity.
2. Apply the divisibility equation once more: f δ_(i+1)δ_i(x)=0. Injectivity implies the value is zero.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-differential-spec`, `mathlib:HomologicalComplex.d_comp_d`.

**Acceptance.** Retain injectivity on both required target terms.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 6.2, printed p.49. Expanded verification that the displayed differential defines a complex.

#### Principal décalage complex

`AInfCohomology:AI.1/principal-complex` · construction · `TauCeti.Decalage.etaComplex` · Planet: **Principal décalage**

Define the normalized principal complex E_f(C) with terms E_f(C)^i and differential δ_i. For a nonzerodivisor f in R it identifies with η_f C inside C[1/f] by x↦f^i x in degree i, using inverse powers for i<0.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Construction/proof.**

1. Apply CochainComplex.of to the existing module objects and adjacent maps.
2. A submodule of an f-torsion-free module is f-torsion-free.
3. For the localized comparison, injectivity of C^i→C^i[1/f] follows from termwise f-injectivity. The map x↦f^i x has the required image and intertwines δ with d.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-term`, `AInfCohomology:AI.1/principal-differential-square`, `mathlib:CochainComplex.of`.

**Uses.** `AInfCohomology:AI.1/principal-map`: Source and target of restricted chain maps. `AInfCohomology:AI.1/ideal-decalage-complex`: Local model with transition factors.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.Decalage.etaComplex_term` | data | The ith term is the existing ModuleCat object associated to E_f(C)^i. |
| `TauCeti.Decalage.etaComplex_d` | projection | Its adjacent differential is δ_i. |
| `TauCeti.Decalage.etaComplex_torsionFree` | structure | Multiplication by f is injective on every term. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `complex_two_term` | computation | For regular f, normalized décalage of [R --f²→R] is [R --f→R] in the same two degrees. |
| `complex_negative_degree` | computation | The same calculation holds in degrees -3,-2; no nonnegative-degree hypothesis is introduced. |
| `complex_zero` | degenerate | The zero complex has zero décalage. |

**Acceptance.** The construction is indexed by Z, including negative degrees. The normalized model alone is not the generator-independent global ideal construction.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Remark 6.3, printed p.49. The selected generator trivializes I^⊗i; the omitted twist is restored by the stated localization isomorphism.

#### Restriction of chain maps

`AInfCohomology:AI.1/principal-map` · construction · `TauCeti.Decalage.etaMap`

For an R-linear chain map u:C→D between termwise f-torsion-free complexes, define E_f(u):E_f(C)→E_f(D) by restricting u_i in every degree.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C. D is also termwise f-torsion-free; u is a chain map.

**Construction/proof.**

1. If f y=d x, then f u(y)=d u(x), so restriction lands in the target submodule.
2. The chain-map square for divided differentials follows after multiplying both sides by f and using injectivity in the target.
3. Bundle the components with CochainComplex.ofHom.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-complex`, `AInfCohomology:AI.1/principal-differential-spec`, `mathlib:CochainComplex.ofHom`.

**Uses.** `AInfCohomology:AI.1/quasi-isomorphism-preservation`: It supplies the map whose cohomology is compared.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.Decalage.etaMap_component` | projection | The underlying component is u_i; promoted as principal-map-component. |
| `TauCeti.Decalage.etaMap_id` | functoriality | Restriction of an identity chain map is the identity. |
| `TauCeti.Decalage.etaMap_comp` | functoriality | Restriction preserves composition. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `map_identity` | computation | The identity on [Z --4→Z] restricts to the identity on its f=2 décalage. |
| `map_zero` | degenerate | The zero chain map restricts to zero. |
| `map_composition` | compatibility | A composite of two chain maps restricts to the composite, also in negative degrees. |

**Acceptance.** This construction is on the category of complexes, prior to localization.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.4 and Corollary 6.5, printed p.50. The source uses the functor on chain maps; the restriction and its square are made explicit here.

#### Restricted component equation

`AInfCohomology:AI.1/principal-map-component` · lemma · `TauCeti.Decalage.etaMap_component`

The image in D^i of E_f(u)_i(x) equals u_i applied to the image of x in C^i.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C. u:C→D is an R-linear chain map and D is termwise f-torsion-free.

**Construction/proof.**

1. The component is the restriction of u_i; forget its membership witness.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-map`.

**Acceptance.** Use this equality to establish naturality on cycles and quotients.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.4, printed p.50. Component-level form of the induced map.

#### Cycles of principal décalage

`AInfCohomology:AI.1/principal-cycles` · lemma · `TauCeti.Decalage.etaCycles`

Under E_f(C)^i→C^i, the cycles of E_f(C) identify with Z^i(C).

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Construction/proof.**

1. If δx=0, the divisibility equation gives d x=0.
2. If d x=0, use the zero witness to see x belongs to E_f(C)^i; uniqueness of division gives δx=0.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-differential-spec`.

**Acceptance.** The identification is on actual submodules, before passing to cohomology.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.4, proof, printed p.50. Local cycle calculation; tensor twists are reinstated globally.

#### Boundaries after division

`AInfCohomology:AI.1/principal-boundaries` · lemma · `TauCeti.Decalage.etaBoundaries`

Within Z^i(C), the boundaries of E_f(C) are exactly the z such that f z belongs to B^i(C).

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Construction/proof.**

1. If z=δy, then f z=d y is a boundary of C.
2. If f z=d y, then y lies in E_f(C)^(i-1) by definition, and division uniqueness gives δy=z.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-differential-spec`, `AInfCohomology:AI.1/principal-cycles`.

**Acceptance.** Only f-annihilated cohomology is removed; this is not removal of all f-power torsion.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.4, proof, printed p.50. Explicit boundary criterion underlying the cohomology quotient.

#### Principal cohomology quotient

`AInfCohomology:AI.1/principal-cohomology` · comparison · `TauCeti.Decalage.etaCohomologyIso`

There is a natural R-linear isomorphism H^i(E_f(C))≅H^i(C)/H^i(C)[f], where H^i(C)[f]=ker(f:H^i(C)→H^i(C)).

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Construction/proof.**

1. Identify the cycle modules by principal-cycles.
2. The new boundary submodule is the inverse image of H^i(C)[f] under Z^i(C)→H^i(C), by principal-boundaries.
3. Apply the module quotient isomorphism theorem. Naturality follows from the component equation.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-cycles`, `AInfCohomology:AI.1/principal-boundaries`, `AInfCohomology:AI.1/principal-map-component`.

**Acceptance.** For [Z --4→Z], f=2, H^1 becomes Z/2 rather than zero.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.4, printed pp.49–50. The local degree twist has been trivialized by the fixed generator; the annihilator has exponent one.

#### Ideal décalage

`AInfCohomology:AI.1/ideal-decalage-complex` · construction · `TauCeti.Decalage.idealEta` · Planet: **Ideal décalage**

For a termwise I-torsion-free O-complex C, define η_I C in degree i as {x in C^i : d x belongs to I C^(i+1)} tensor I^⊗i, with the differential obtained by factoring d through I C^(i+1). This construction is functorial in C and independent of local generators.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. The map I tensor C^i→C^i is monic in every degree.

**Construction/proof.**

1. Form the divisibility subobject intrinsically as a kernel/preimage in O-modules and tensor it with the invertible sheaf I^⊗i.
2. Locally trivialize I=(f). The preceding normalized complex gives the differential and its square-zero identity.
3. If f′=u f, the comparison of normalized coordinates in degree i multiplies by u^(-i). These factors intertwine differentials and satisfy the cocycle identity.
4. Use the sheaf-module descent and tensor-invertible-object interface requested from E1. This is an explicit unresolved supplier, not a formalized construction.

**Direct prerequisites.** `AInfCohomology:AI.1/principal-complex`, `AInfCohomology:AI.1/principal-map`, `EnhancedDerivedSheaves:E1`.

**Uses.** `AInfCohomology:AI.1/decalage-cohomology`: Its line twist determines the global quotient formula. `CrystallineCohomology:CR.4`: The intrinsic ideal construction specializes to (p).

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.Decalage.idealEta_term` | data | The degree-i term is the intrinsic divisibility subobject tensor I^⊗i. |
| `TauCeti.Decalage.idealEta_changeGenerator` | compatibility | In normalized coordinates f′=u f gives the degree-i factor u^(-i). |
| `TauCeti.Decalage.idealEta_map` | functoriality | A chain map restricts on the divisibility subobjects and tensors with the identity of I^⊗i. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `ideal_unit` | computation | For I=O, η_I C is canonically C. |
| `ideal_overlap` | compatibility | Changes by units u and v compose to the change by uv, including in degree -1. |
| `ideal_two_term` | computation | On a principal chart, [R --f²→R] gives [R --f→R] after trivializing the two line factors. |

**Acceptance.** Keep the inherited node ID. Negative tensor powers use the dual line, and overlap transitions must be checked.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 6.2 and Remark 6.3, printed p.49. The global definition and source convention are retained, not replaced by a principal-only object.

#### Cohomology of ideal décalage

`AInfCohomology:AI.1/decalage-cohomology` · lemma · `TauCeti.AInfPlan.decalage_cohomology`

H^i(η_I C)≅(H^i(C)/H^i(C)[I]) tensor I^⊗i, naturally in a termwise I-torsion-free C. Here H[I] is the kernel of H→H tensor I^(-1) induced by I→O.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. C is termwise I-torsion-free.

**Construction/proof.**

1. Use the principal-cohomology isomorphism on each trivializing chart.
2. Flatness of the invertible line allows it to commute with cycles, boundaries and quotients.
3. Naturality and the u^(-i) transition law glue the local quotient maps.

**Direct prerequisites.** `AInfCohomology:AI.1/ideal-decalage-complex`, `AInfCohomology:AI.1/principal-cohomology`, `EnhancedDerivedSheaves:E1`.

**Acceptance.** Keep the tensor factor even when a principal computation suppresses it.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.4, printed pp.49–50. Inherited global statement, with the annihilator and line twist explicitly restored.

#### Preservation of quasi-isomorphisms

`AInfCohomology:AI.1/quasi-isomorphism-preservation` · lemma · `TauCeti.Decalage.eta_preservesQuasiIso`

If u:C→D is a quasi-isomorphism between termwise I-torsion-free O-complexes, η_I u is a quasi-isomorphism.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. C and D are termwise I-torsion-free; u is a quasi-isomorphism.

**Construction/proof.**

1. Each H^i(u) is an isomorphism and identifies the I-annihilator submodules.
2. Pass to the quotient, tensor with the invertible line, and use the natural cohomology formula.

**Direct prerequisites.** `AInfCohomology:AI.1/decalage-cohomology`, `AInfCohomology:AI.1/principal-map-component`.

**Acceptance.** No assertion about arbitrary maps with merely almost-isomorphic cohomology.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.4, final assertion, printed p.50. Split from the inherited cohomology node because it is the localization input.

#### Derived décalage

`AInfCohomology:AI.1/derived-decalage` · construction · `TauCeti.Decalage.derivedEta` · Planet: **Derived décalage**

Construct Lη_I:D(O)→D(O) by applying η_I to termwise-flat K-flat representatives and inverting quasi-isomorphisms. On any I-torsion-free representative C, its value is represented by η_I C.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual.

**Construction/proof.**

1. Use E1 to choose strongly K-flat replacements and comparison roofs; their termwise flatness implies I-torsion-freeness.
2. Use quasi-isomorphism-preservation and the localization universal property to descend the complex-level construction.
3. Compare an arbitrary I-torsion-free representative with a strongly K-flat one and use the same invariance.
4. Do not give this functor an exact-functor instance: the short exact sequence 0→Z/p→Z/p²→Z/p→0 is a countertest.

**Direct prerequisites.** `AInfCohomology:AI.1/quasi-isomorphism-preservation`, `EnhancedDerivedSheaves:E1`, `mathlib:DerivedCategory`, `mathlib:DerivedCategory.Q`.

**Uses.** `AInfCohomology:AI.3`: Applied with I=(μ) to the integral derived pushforward. `CrystallineCohomology:CR.4`: Applied with I=(p) independently of geometric AΩ comparisons.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.Decalage.derivedEta_objIso` | compatibility | For an I-torsion-free representative C, Lη_I(Q C)≅Q(η_I C). |
| `TauCeti.Decalage.derivedEta_naturality` | functoriality | The representative comparison commutes with the image of a chain map. |
| `TauCeti.Decalage.derivedEta_identityIdeal` | equivalence | For I=O the derived functor is naturally isomorphic to the identity. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `derived_kills_once` | computation | For a prime p, Lη_p((Z/p)[0])=0. |
| `derived_retains_power_torsion` | non-example | Lη_p((Z/p²)[0])≅(Z/p)[0], so it is not zero. |
| `derived_nonexact` | non-example | The exact sequence with end terms Z/p and middle term Z/p² is not sent to a distinguished triangle. |

**Acceptance.** The existing Mathlib derived category and Q are used, not redefined. K-flat existence and its restriction/localization interface remain named E1 requests.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.1, Corollary 6.5 and Remark 6.6, printed pp.49–50. The functor part is separated from the filtered-colimit and truncation exports below.

#### Filtered colimits of décalage

`AInfCohomology:AI.1/decalage-filtered-colimits` · lemma · `TauCeti.AInfPlan.decalage_filtered_colimits`

Lη_I commutes with filtered colimits in D(O).

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual.

**Construction/proof.**

1. At the module level a filtered colimit is exact, hence preserves the kernel defining the divisibility subobject and tensoring by I^⊗i.
2. Apply the filtered K-flat replacement/coherent-colimit comparison supplied by E1.
3. Identify the resulting comparison on cohomology using exactness of filtered colimits and the annihilator quotient formula.

**Direct prerequisites.** `AInfCohomology:AI.1/derived-decalage`, `EnhancedDerivedSheaves:E1`.

**Acceptance.** This is not a claim that every limit or totalization is preserved.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Corollary 6.5, printed p.50. Retains the filtered-colimit clause previously bundled into derived-decalage.

#### Canonical truncations

`AInfCohomology:AI.1/decalage-truncations` · lemma · `TauCeti.AInfPlan.decalage_truncations`

For a≤b in Z together with infinite endpoints, Lη_I(τ^[a,b] C)≅τ^[a,b](Lη_I C), naturally in C.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual.

**Construction/proof.**

1. Use the good-truncation construction on torsion-free models, replacing the boundary quotient term when necessary rather than assuming it is I-torsion-free.
2. The maps induced by lower and upper good truncation give the comparison through the localization model.
3. In the retained degrees the cohomology quotient formula is unchanged; outside them it vanishes. E1 supplies the t-structure comparison that identifies the resulting maps.

**Direct prerequisites.** `AInfCohomology:AI.1/derived-decalage`, `AInfCohomology:AI.1/decalage-cohomology`, `EnhancedDerivedSheaves:E1`.

**Acceptance.** Stupid truncation is not substituted for canonical truncation. The replacement-and-comparison construction at the quotient term is an explicit unresolved proof detail in the handoff.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Corollary 6.5, printed p.50. Preserves the inherited truncation target without claiming that its full generic prototype has been supplied.

#### Lax symmetric monoidal structure

`AInfCohomology:AI.1/decalage-products` · construction · `TauCeti.Decalage.etaTensor` · Planet: **Lax monoidal décalage**

Construct the natural maps Lη_I C tensor^L Lη_I D→Lη_I(C tensor^L D) and O→Lη_I O, with the associativity, symmetry and unit coherence of a lax symmetric monoidal functor.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual.

**Construction/proof.**

1. Choose strongly K-flat models C,D. Locally send x tensor y in normalized degrees i,j to x tensor y in degree i+j. The signed Leibniz identity puts it in the required divisibility submodule.
2. Globally combine the line factors I^⊗i tensor I^⊗j→I^⊗(i+j).
3. The complexes η_I C and η_I D need not be K-flat. Resolve them before forming the derived source tensor and map that tensor to the ordinary tensor used by the element-level formula.
4. Check coherence before passing to localization; E1 supplies independence of resolution and monoidal coherence in the shared category.

**Direct prerequisites.** `AInfCohomology:AI.1/derived-decalage`, `EnhancedDerivedSheaves:E1`.

**Uses.** `AInfCohomology:AI.3`: Multiplication on AΩ comes from the lax structure. `CrystallineCohomology:CR.4`: The p-instance transports multiplicative data.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.Decalage.derivedEta_tensorMap` | constructor | The map has direction Lη_I C tensor^L Lη_I D→Lη_I(C tensor^L D). |
| `TauCeti.Decalage.derivedEta_tensor_naturality` | functoriality | The map commutes with a pair of input morphisms. |
| `TauCeti.Decalage.derivedEta_tensor_coherence` | compatibility | Associativity, braiding with the cochain sign, and the unit diagrams commute. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `tensor_unit` | computation | For C=O in degree 0 the tensor map agrees with the unit constraint. |
| `tensor_sign` | computation | Interchanging two degree-one cycles introduces a minus sign. |
| `tensor_zero` | degenerate | A tensor map with a zero input is the unique zero map. |

**Acceptance.** No universal tensor equivalence is asserted. Do not silently identify the derived source with its ordinary tensor product.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 6.7, printed pp.50–51. Expanded construction of the source lax-monoidal map, retaining the derived-source issue.

#### Bockstein complex

`AInfCohomology:AI.1/bockstein-differential` · construction · `TauCeti.Decalage.bockstein`

Construct B_I(C) with degree-i term H^i(C tensor^L O/I) tensor I^⊗i and differential the connecting map for 0→I/I²→O/I²→O/I→0, with its conormal factor absorbed in the next line twist.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. C is an object of D(O).

**Construction/proof.**

1. Use a termwise I-torsion-free model to compute reduction by the two-term flat resolution of O/I.
2. On a principal chart a cocycle modulo f is lifted to x with d x=f y; send its class to the class of y modulo f. Changing the lift or a cohomology representative changes y by a boundary.
3. Since d y=0 by f-injectivity, repeating the boundary operation gives zero.
4. The line factors make this description independent of a chosen generator.

**Direct prerequisites.** `AInfCohomology:AI.1/derived-decalage`, `EnhancedDerivedSheaves:E1`.

**Uses.** `AInfCohomology:AI.1/bockstein-reduction`: Target of the reduction comparison. `AInfCohomology:AI.4`: The Bockstein records the differential, not only graded Hodge–Tate groups.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.Decalage.bockstein_term` | data | The degree-i module is H^i(C tensor^L O/I) tensor I^⊗i. |
| `TauCeti.Decalage.bockstein_lift` | characterisation | Locally, d x=f y gives β([x])=[y]. |
| `TauCeti.Decalage.bockstein_square` | structure | The composite of consecutive Bockstein maps is zero. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `bockstein_identity` | computation | For C=[Z --p→Z] in degrees 0,1, reduction has two Z/p groups and β between them is the identity. |
| `bockstein_zero` | computation | For C=[Z --p²→Z], β is zero. |
| `bockstein_shift` | compatibility | For the cochain shift C[1], the source differential and hence the normalized Bockstein acquire the cochain shift sign. |

**Acceptance.** The differential is the Bockstein, not zero by definition. The construction does not assume that C itself has torsion-free cohomology.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 6.12, printed p.52. This is the actual differential complex appearing on the right of the reduction comparison.

#### Reduction to the Bockstein complex

`AInfCohomology:AI.1/bockstein-reduction` · comparison · `TauCeti.AInfPlan.bockstein_reduction`

There is a natural quasi-isomorphism (Lη_I C) tensor^L O/I→B_I(C). On an I-torsion-free representative it is induced by sending a divided-differential term to its cohomology class modulo I.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. C is an object of D(O).

**Construction/proof.**

1. Both C/I and (η_I C)/I compute their derived reductions: the flat resolution [I→O] is bounded and scalar multiplication is termwise injective. This is not an assertion that the complexes themselves are K-flat.
2. The assignment x↦[x mod f] in normalized coordinates kills fE and intertwines the divided differential with β.
3. Injectivity on cohomology: write a reduced cycle x with d x=f² z. If [x] is a Bockstein boundary, choose y with d y=f w and x−w=d v+f a. Replacing y by y+f v gives x−δ(y+f v)=f a. Differentiation gives f d a=f² z, so a belongs to E and x is a boundary modulo fE.
4. Surjectivity: a β-closed class has a lift x with d x=f y and y=d z+f w. Replace x by x−f z. Its differential is f² w; d w=0, so the corrected lift is a cycle of E/fE.
5. The argument works in every degree with the prescribed line factors and is natural under chain maps.

**Direct prerequisites.** `AInfCohomology:AI.1/ideal-decalage-complex`, `AInfCohomology:AI.1/bockstein-differential`, `AInfCohomology:AI.1/derived-decalage`, `EnhancedDerivedSheaves:E1`.

**Acceptance.** The [Z --p→Z] test is acyclic on both sides; replacing β by zero would fail it. The chain-map and injectivity/surjectivity helper declarations need further splitting in the continuation.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 6.12 and proof, printed pp.52–53. Inherited comparison with an explicit lifting proof; full declaration-level splitting of the general sheaf proof remains a gap.

#### Preservation of derived completeness

`AInfCohomology:AI.1/preservation-derived-completeness` · lemma · `TauCeti.AInfPlan.preservation_derived_completeness`

If J is a locally finitely generated ideal and C is derived J-complete, then Lη_I C is derived J-complete.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. T is replete. J is locally finitely generated; C is derived J-complete.

**Construction/proof.**

1. Use the replete-sheaf cohomology criterion supplied by E4 from the affine DD.1 theory.
2. The map H^i(C)→H^i(C) tensor I^(-1) has complete source and target. Its kernel is complete; the quotient by that kernel is complete.
3. Tensor with the invertible line I^⊗i, locally a free rank-one module, and apply the cohomology criterion again.

**Direct prerequisites.** `AInfCohomology:AI.1/decalage-cohomology`, `AInfCohomology:AI.1/derived-decalage`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `EnhancedDerivedSheaves:E2/replete-topoi`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`, `EnhancedDerivedSheaves:E4/complete-cohomology-criterion`, `EnhancedDerivedSheaves:E4/complete-module-weak-serre`, `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`.

**Acceptance.** Closure is under kernels/cokernels of maps BETWEEN complete modules and extensions; arbitrary submodules are not covered. This statement does not commute Lη_I with J-completion.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), §6.2 standing assumptions and Lemma 6.19, printed pp.53–55. All hypotheses suppressed by the local notation in the short source proof are restored.

#### Completion at the décalage ideal

`AInfCohomology:AI.1/completion-at-decalage-ideal` · comparison · `TauCeti.AInfPlan.completion_at_decalage_ideal`

For derived I-completion C→Ĉ, the canonical comparison completion_I(Lη_I C)→Lη_I Ĉ is a quasi-isomorphism.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. T is replete.

**Construction/proof.**

1. The target is complete by preservation-derived-completeness, so the map extends along the completion unit.
2. On a principal chart both objects are derived f-complete; reduce the comparison modulo f by derived Nakayama.
3. Completion preserves the mod-f² coefficient sequence and its mod-f reduction, so the cohomology classes and Bockstein agree. Apply bockstein-reduction.
4. Glue the comparison using the sheaf completion interface.

**Direct prerequisites.** `AInfCohomology:AI.1/preservation-derived-completeness`, `AInfCohomology:AI.1/bockstein-reduction`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `EnhancedDerivedSheaves:E4/complete-cohomology-criterion`, `EnhancedDerivedSheaves:E4/complete-module-weak-serre`, `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`.

**Acceptance.** The ideal is I on BOTH sides; an unrelated J is excluded. This inherited ID now names the first map of Lemma 6.20; its second map is completion-limit-model.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.20, first map, printed p.55. Splits the original two-map node without discarding either export.

#### Inverse-limit comparison

`AInfCohomology:AI.1/completion-limit-model` · comparison · `TauCeti.AInfPlan.completion_limit_model`

The canonical map Lη_I Ĉ→Rlim_n Lη_I(C tensor^L O/I^n) is a quasi-isomorphism, where Ĉ is derived I-completion.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. T is replete.

**Construction/proof.**

1. All objects are derived I-complete; derived tensor with O/I commutes with this limit because O/I has the finite flat resolution [I→O].
2. Locally use f and a complex D of O/f-modules. Compute D tensor^L O/f^n using [O --f^n→O], so it has the zero-differential extra shifted summand.
3. The transition n+1→n is identity on the unshifted summand and multiplication by f on the shifted summand, hence zero there on D. The extra pro-system is pro-zero.
4. This identifies the mod-f Bockstein towers; the inverse-limit and repleteness comparison is requested from E2/E4. Conclude by the complete-object reduction criterion.

**Direct prerequisites.** `AInfCohomology:AI.1/completion-at-decalage-ideal`, `AInfCohomology:AI.1/bockstein-reduction`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `EnhancedDerivedSheaves:E2/replete-topoi`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`, `EnhancedDerivedSheaves:E4/complete-cohomology-criterion`, `EnhancedDerivedSheaves:E4/complete-module-weak-serre`, `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`.

**Acceptance.** Do not replace the derived tensor factors by naive quotients of a torsion complex. Record the transition maps: a termwise splitting alone does not prove a pro-isomorphism.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.20, second map and last proof paragraph, printed p.55. The pro-zero argument is made explicit; its generic enhanced realization is still a supplier request.

#### Injectivity before completion

`AInfCohomology:AI.1/finite-shift-injective` · lemma · `TauCeti.Decalage.finite_shift_injective`

Let B=Q[x], M=direct sum over n≥0 of B e_n, and S(e_0)=0, S(e_(n+1))=e_n. The B-linear endomorphism F=S−x is injective on M.

**Construction/proof.**

1. For a nonzero finite sequence a choose the largest N in its support.
2. The coefficient of e_N in F(a) is −x a_N. It is nonzero because B is a domain and a_N≠0.

**Direct prerequisites.** `mathlib:Finsupp`.

**Acceptance.** The same assertion fails on the x-adic completion, as computed below. This lemma does not use a finite-dimensional truncation with an artificial boundary condition.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Warning after Lemma 6.19, printed p.55; independent regression calculation in the companion roadmap AI.1 §7. The source warns about unrelated completion. This particular module and proof are an independent worked test, not an example attributed to BMS.

#### Completion of the test module

`AInfCohomology:AI.1/restricted-sequence-completion` · comparison · `TauCeti.AInfPlan.restricted_sequence_completion`

With B,M as above, let A=B[t] act on M by t=F. The derived (x)-completion of M[0] is concentrated in degree zero and equals N={(a_n) in product Q[[x]] : for each r, all but finitely many a_n lie in x^r Q[[x]]}. The A-action extends by t(a)_n=a_(n+1)−x a_n.

**Construction/proof.**

1. The endomorphism F is B-linear, so polynomial evaluation defines an A-module structure. Both x and t are nonzerodivisors of A; x is injective on M.
2. The free A-resolution [A --x^r→A] of A/x^r shows M tensor^L A/x^r=(M/x^rM)[0].
3. The quotient transition maps are surjective, so their derived limit is their ordinary limit in degree zero. Use the regular-principal completion comparison from DD.1.
4. Taking coordinates identifies this inverse limit with N: each finite-level vector has finite support; conversely this support condition makes every truncation a finite vector.
5. Shift and multiplication by x preserve the restricted-sequence condition and agree with the original action on finite sequences.

**Direct prerequisites.** `AInfCohomology:AI.1/finite-shift-injective`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `mathlib:PowerSeries`, `mathlib:PowerSeries.coeff`.

**Acceptance.** N is a restricted product, not the entire product. The natural map M→N is the usual coefficientwise inclusion.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), After Lemma 6.19, printed p.55; affine completion framework in Stacks 091N. The warning motivates this independently proved regression, not an example claimed to be printed in BMS. The proof uses the regular-principal derived-completion contract requested from DD.1.

#### Kernel created by completion

`AInfCohomology:AI.1/completed-shift-kernel` · lemma · `TauCeti.Decalage.completed_shift_kernel`

For N and F in restricted-sequence-completion, ker F={ (a,xa,x²a,...) : a in Q[[x]] }. This kernel is nonzero.

**Construction/proof.**

1. The equation F(v)=0 is v_(n+1)=x v_n; induction gives v_n=x^n v_0.
2. Every such sequence satisfies the restricted condition: n≥r implies x^n a is divisible by x^r.
3. Choose a=1 to obtain a nonzero kernel element whose zeroth coordinate is 1.

**Direct prerequisites.** `AInfCohomology:AI.1/restricted-sequence-completion`, `mathlib:PowerSeries`.

**Acceptance.** No convergence of a numerical series is being assumed: the condition is x-adic divisibility of coordinates.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Warning after Lemma 6.19, printed p.55; independent regression calculation in companion roadmap AI.1 §7. The explicit kernel is proved here, not quoted from the source.

#### Failure of unrelated completion

`AInfCohomology:AI.1/unrelated-completion-counterexample` · application · `TauCeti.AInfPlan.unrelated_completion_counterexample`

For A=Q[x,t], I=(t), J=(x), and the module M defined above, the canonical map completion_J(Lη_t M[0])→Lη_t(completion_J M[0]) is not a quasi-isomorphism. On H^0 it is N→N/N[t], with nonzero kernel generated as Q[[x]]-module by (1,x,x²,...).

**Construction/proof.**

1. F is injective on M, so Lη_t M[0]=M[0]. Its derived J-completion is N[0].
2. The cohomology formula gives Lη_t N[0]=(N/N[t])[0].
3. Naturality of the quotient formula and the completion adjunction identify the canonical comparison with the quotient map N→N/N[t].
4. The displayed kernel is nonzero, so that comparison is not a quasi-isomorphism.

**Direct prerequisites.** `AInfCohomology:AI.1/finite-shift-injective`, `AInfCohomology:AI.1/restricted-sequence-completion`, `AInfCohomology:AI.1/completed-shift-kernel`, `AInfCohomology:AI.1/derived-decalage`, `AInfCohomology:AI.1/decalage-cohomology`, `AInfCohomology:AI.1/preservation-derived-completeness`.

**Acceptance.** This refutes the canonical comparison, not the stronger claim that the two objects can never be abstractly isomorphic. Noetherianity of A does not repair the example: M is not finitely generated. Finite truncations v_N=sum_(n<N)x^n e_n satisfy F(v_N)=−x^N e_(N−1), recording the disappearing defect.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Independent counterexample motivated by the warning after Lemma 6.19, printed p.55; not BMS1 Example 6.5. An explicit proof of the roadmap’s required countertest, separated from the positive same-ideal theorem.

#### Strongly K-flat representatives

`AInfCohomology:AI.1/strongly-k-flat-replacements` · lemma · `TauCeti.AInfPlan.strongly_k_flat_replacements`

Every complex of modules on a ringed topos admits a quasi-isomorphism from a K-flat complex whose terms are flat. Such terms are I-torsion-free for an invertible ideal I; a K-flat complex alone need not have flat terms.

**Hypotheses.** Ringed topos; unbounded complexes; the enhancement supplies functorial roofs.

**Construction/proof.**

1. Use a termwise-flat K-flat replacement, requested as a refinement of E1.
2. The inclusion I→O is injective. Tensor it with each flat term; in a local trivialization of I this proves injectivity of multiplication by its generator. No splitting of I→O is required.

**Direct prerequisites.** `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E1`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.1; printed p.49. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Monoidality over a valuation ring

`AInfCohomology:AI.1/valuation-monoidality` · theorem · `TauCeti.AInfPlan.valuation_monoidality`

For a valuation ring R and nonzero f, the lax product map Lη_f(C) tensor^L Lη_f(D)→Lη_f(C tensor^L D) is an equivalence. For a general ring only the lax map is exported.

**Hypotheses.** R valuation ring; f nonzero; derived tensor computed with eligible replacements.

**Construction/proof.**

1. Reduce by filtered colimits and flat pullback to finitely presented modules over a valuation ring.
2. Compute the cyclic torsion summands using the relative divisibility of f,g,h.

**Direct prerequisites.** `AInfCohomology:AI.1/decalage-products`, `AInfCohomology:AI.1/principal-cohomology`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 6.8; printed p.50. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Truncation bounds for décalage

`AInfCohomology:AI.1/truncation-comparison-maps` · lemma · `TauCeti.AInfPlan.truncation_comparison_maps`

There is a natural I^m⊗τ≤m C→τ≤m Lη_I C, and, if H^n(C) is I-torsion-free, τ≥n Lη_I C→I^n⊗τ≥n C. On [n,m] the two composites are multiplication by I^(m−n) under the line identifications.

**Hypotheses.** Invertible ideal I; integers n≤m; H^n(C)[I]=0 for the second map.

**Construction/proof.**

1. Use the explicit upper-truncated termwise-flat complex for the first map.
2. For the lower map descend to the good-truncation boundary quotient: f[z]=0 implies [z]=0, not containment of every degree n−1 term.
3. Check the composite on an interval in a local generator, then glue line factors.

**Direct prerequisites.** `AInfCohomology:AI.1/ideal-decalage-complex`, `AInfCohomology:AI.1/decalage-cohomology`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.9, with repair of its printed intermediate quotient identity; printed p.51. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Connective comparison and localization

`AInfCohomology:AI.1/connective-comparison` · lemma · `TauCeti.AInfPlan.connective_comparison`

For connective C whose H^0 is I-torsion-free, the lower-truncation map Lη_I C→C is natural; after inverting I it is an equivalence. An unbounded complex has the localized comparison, not an unjustified integral map in all degrees.

**Hypotheses.** Same lower-bound/torsion condition as Lemma 6.10; local inversion of the line ideal.

**Construction/proof.**

1. Take n=0 in the lower-truncation map.
2. After inversion the termwise normalized construction agrees with the original complex.

**Direct prerequisites.** `AInfCohomology:AI.1/truncation-comparison-maps`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.10; printed p.51. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Composition of décalage

`AInfCohomology:AI.1/decalage-composition` · comparison · `TauCeti.AInfPlan.decalage_composition`

For invertible ideals I,J, Lη_I Lη_J C≃Lη_(IJ) C, naturally and compatibly with products. Locally this is division of the differential successively by generators f and g.

**Hypotheses.** Invertible ideals in the common ringed topos; eligible representatives.

**Construction/proof.**

1. Use a complex termwise regular for both factors and compare the divisibility conditions.
2. Glue the equality via the degree-i line factors.

**Direct prerequisites.** `AInfCohomology:AI.1/derived-decalage`, `AInfCohomology:AI.1/strongly-k-flat-replacements`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.11; printed p.52. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Bockstein comparison chain map

`AInfCohomology:AI.1/bockstein-comparison-map` · construction · `TauCeti.Decalage.bocksteinMap`

For I-torsion-free C locally with generator f, send x=f^i y in (η_I C)^i to the class of y modulo f in H^i(C/f)⊗I^i. This defines a chain map from η_I C⊗O/I to the Bockstein complex; division records the trivialization and glues intrinsically.

**Hypotheses.** Termwise I-torsion-free C; quotient and line factors as in Proposition 6.12.

**Construction/proof.**

1. Check dy=fz and beta[y]=[z].
2. Changing f by a unit rescales the degree-i factors correctly.

**Direct prerequisites.** `AInfCohomology:AI.1/ideal-decalage-complex`, `AInfCohomology:AI.1/bockstein-differential`.

**Uses.** `AInfCohomology:AI.1/bockstein-reduction`: Supplies the actual comparison map.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.Decalage.bocksteinMap_component` | characterisation | Degree i sends f^i y to [y]⊗f^i. |
| `TauCeti.Decalage.bocksteinMap_chain` | compatibility | The next component carries the divided differential to beta. |
| `TauCeti.Decalage.bocksteinMap_natural` | functoriality | Commutes with maps of termwise regular complexes. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.Decalage.bocksteinMap_test_unit` | degenerate | For I=O both reductions are zero. |
| `TauCeti.Decalage.bocksteinMap_test_zero_d` | computation | For the zero-differential two-term regular complex R in degrees 0 and 1, the comparison modulo f is a quasi-isomorphism; both cohomologies are the ordinary quotient R/f. |
| `TauCeti.Decalage.bocksteinMap_test_f2` | computation | For [R --f²→R], reduction after eta has zero differential, while the original f-complex Bockstein calculation detects the correct scaling. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 6.12 proof; printed p.52. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Injectivity of the Bockstein comparison

`AInfCohomology:AI.1/bockstein-map-injectivity` · lemma · `TauCeti.AInfPlan.bockstein_map_injectivity`

The comparison map induces injective cohomology maps; a class mapping to a Bockstein boundary is a boundary modulo I in η_I C.

**Hypotheses.** Proposition 6.12 hypotheses.

**Construction/proof.**

1. Lift the Bockstein boundary in C and use termwise regularity to remove the residual I multiple.

**Direct prerequisites.** `AInfCohomology:AI.1/bockstein-comparison-map`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 6.12 proof, injectivity argument; printed p.52. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Surjectivity of the Bockstein comparison

`AInfCohomology:AI.1/bockstein-map-surjectivity` · lemma · `TauCeti.AInfPlan.bockstein_map_surjectivity`

Every Bockstein cocycle class lifts to a cocycle modulo I in η_I C, giving the surjectivity of the comparison on cohomology.

**Hypotheses.** Proposition 6.12 hypotheses.

**Construction/proof.**

1. Lift a representative with differential divisible by I.
2. The vanishing beta condition permits a correction whose new divided differential is an I multiple.

**Direct prerequisites.** `AInfCohomology:AI.1/bockstein-comparison-map`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 6.12 proof, surjectivity argument; printed p.52. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Base-change criterion for décalage

`AInfCohomology:AI.1/flat-and-nonflat-base-change` · theorem · `TauCeti.AInfPlan.flat_and_nonflat_base_change`

Lη commutes with flat pullback of ringed topoi. For the nonflat coefficient reductions used in AΩ, prove the specific comparison by the finite Witt toric calculation and the Bockstein/Tor criterion; no universal base-change theorem is asserted without its own hypotheses.

**Hypotheses.** For flat pullback, pullback of the ideal remains invertible and pullback is exact. For the nonflat applications use the regular finite coefficient quotient, termwise flat representative and injectivity/Tor conditions explicitly verified in AI.3–AI.4.

**Construction/proof.**

1. For flat maps, pullback preserves termwise I-torsion-freeness and the defining kernel/image submodules.
2. The nonflat applications use the explicitly computed comparison maps, not Lemma 6.15, which is the completeness criterion.

**Direct prerequisites.** `AInfCohomology:AI.1/strongly-k-flat-replacements`, `AInfCohomology:AI.1/bockstein-reduction`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.14; Theorem 9.4(i); printed pp.53–70. The generic flat result and the separately proved nonflat specialization.

#### Cohomology of completed direct sums

`AInfCohomology:AI.1/completed-sum-cohomology` · lemma · `TauCeti.AInfPlan.completed_sum_cohomology`

In a replete ringed topos with J locally principal, let C_i be derived J-complete, H^0(C_i) classically J-complete, and H^0(C_i)[J^infinity]=H^0(C_i)[J^n] for a single n independent of i. The H^0 of the derived J-completed direct sum is the classical completion lim_k direct-sum_i H^0(C_i)/J^k. The analogous degree-q statement follows by shifting each C_i and imposing these hypotheses on H^q.

**Hypotheses.** Replete ringed topos; J locally generated by one element. Each indicated cohomology module classically complete and its J-power torsion uniformly bounded in the family.

**Construction/proof.**

1. Derived completion of a direct sum of derived complete modules has no negative cohomology: its possible inverse-limit torsion obstruction injects into the zero product obstruction.
2. Use the cohomology/completion spectral sequence and the uniform bound to get ordinary separated completion.

**Direct prerequisites.** `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`, `EnhancedDerivedSheaves:E4/complete-cohomology-criterion`, `DerivedDeRhamCohomology:DD.1/filtered-completion`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 6.17; Lemma 6.18; printed p.54. The uniform bound is essential in the completed direct-sum statement.

#### Filtered décalage as Beilinson truncation

`AInfCohomology:AI.1/filtered-beilinson-description` · theorem · `TauCeti.AInfPlan.filtered_beilinson_description` · Planet: **Filtered décalage**

For an invertible ideal I, the filtered object Fil^i=I^i⊗K (i∈Z, transitions from I→O) has Beilinson connective cover τ_B≤0 Fil whose underlying object is Lη_I K. Underlying means the colimit as i tends to minus infinity. The graded pieces agree with the Bockstein/good-truncation description, compatibly with products.

**Hypotheses.** K in the enhanced unbounded derived category; Cartier ideal I.

**Construction/proof.**

1. Apply Beilinson truncation to the explicit I-power filtration.
2. Identify the local divided-differential model and compute its graded pieces.
3. Use the symmetric monoidal filtered enhancement for the lax product coherence.

**Direct prerequisites.** `DerivedDeRhamCohomology:DD.1/beilinson-t-structure`, `DerivedDeRhamCohomology:DD.1/beilinson-heart`, `AInfCohomology:AI.1/bockstein-reduction`, `AInfCohomology:AI.1/derived-decalage`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms2](https://arxiv.org/pdf/1802.03261), Proposition 5.8; Remark 5.9; Corollary 5.10; printed pp.32–33. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Dé­calage of commuting Koszul operators

`AInfCohomology:AI.1/koszul-decalage-calculation` · theorem · `TauCeti.AInfPlan.koszul_decalage_calculation` · Planet: **Koszul décalage calculation**

For f regular and a complex M of f-torsion-free modules, let regular scalars g_i each divide f or be divisible by f. If some g_i divides f, η_f(M tensor K(g_i)) is acyclic. If f divides every g_i, η_f(M tensor K(g_i))≅η_f M tensor K(g_i/f). The toric gamma_i−1 calculation is obtained weightwise from these scalar statements; a general commuting-endomorphism Koszul carrier is requested from DD.1.

**Hypotheses.** f and every g_i regular; M termwise f-torsion-free; pairwise commuting scalar operators; exterior signs and cohomological degrees 0 through d.

**Construction/proof.**

1. In the divides-f case multiplication by f is null-homotopic on the Koszul complex, so its cohomology is killed by f.
2. In the divisible-by-f case compare termwise divided differentials and the degree scaling.
3. For toric operators first decompose into scalar weight summands.

**Direct prerequisites.** `DerivedDeRhamCohomology:DD.1/koszul-complex`, `DerivedDeRhamCohomology:DD.1`, `AInfCohomology:AI.1/principal-complex`.

**Acceptance.** For commuting scalars f² and f³ on R, eta gives K(R;f,f²), including the degree-two differential (−f²,f). For a unit first operator the Koszul pair is contractible.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definitions 7.1–7.2; Lemma 7.9; printed pp.56–59. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Koszul products and integral cohomology

`AInfCohomology:AI.1/koszul-products-and-cohomology` · theorem · `TauCeti.AInfPlan.koszul_products_and_cohomology`

For commuting A-algebra automorphisms gamma_i of a possibly noncommutative A-algebra R, K_R(gamma_i−1) has the source DGA product: x_i x_j=−x_j x_i, x_i²=0, x_i a=gamma_i(a)x_i, d(x_i)=0 and d(a)=sum_i(gamma_i(a)−a)x_i. It induces the group-cohomology cup product. If multiplication by g on a complex M is nullhomotopic, 0→H^(n−1)(M)→H^n(M tensor K_R(g))→H^n(M)→0 splits. If all scalar g_i are divisible by g and one is g times a unit, H^n(K_M(g_1,…,g_m))≅Ann_M(g)^(binom(m−1,n)) ⊕ (M/gM)^(binom(m−1,n−1)).

**Hypotheses.** For the product: A commutative, R an A-algebra, and gamma_i commuting A-algebra automorphisms. For the split sequence: a specified nullhomotopy of multiplication by g. For the scalar formula: m≥1, all g_i divisible by g and one g_i equal to g times a unit; binomial terms outside their range are zero.

**Construction/proof.**

1. Construct the twisted DGA by the displayed relations and verify the Leibniz rule and group-cohomology product.
2. Use the nullhomotopy to split the mapping-cone cohomology sequence. Reorder the unit-multiple scalar first and induct to get the annihilator/quotient formula.

**Direct prerequisites.** `DerivedDeRhamCohomology:DD.1/koszul-complex`, `AInfCohomology:AI.1/koszul-decalage-calculation`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 7.5, Remark 7.8, Lemma 7.10; printed pp.57–59. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Continuous cochains and Koszul complexes

`AInfCohomology:AI.1/continuous-cochains-koszul` · comparison · `TauCeti.AInfPlan.continuous_cochains_koszul`

Let Gamma_disc=Z^d with generators gamma_i and Gamma=Z_p^d. If N=lim_k N_k is a topological abelian group, each N_k a discrete continuous Gamma-module killed by p^k, then RΓ_cont(Gamma,N)→RΓ(Gamma_disc,N) is a quasi-isomorphism and both are computed by K_N(gamma_1−1,…,gamma_d−1). The topology on N is the limit topology; this does not identify cohomology for arbitrary discrete Gamma-modules.

**Hypotheses.** N=lim_{k≥1} N_k with its inverse-limit topology; N_k discrete continuous Gamma-modules killed by p^k. Replace N_k by the images of N if needed to make the transitions surjective.

**Construction/proof.**

1. For each finite reduction use the standard completed Iwasawa resolution; compare it with the ordinary resolution for Gamma_disc.
2. Pass to the inverse limit with surjective transitions and the controlled completed-sum comparison. The pinned continuousCohomology carrier still needs the recorded forgetful/derived-limit interface.

**Direct prerequisites.** `mathlib:continuousCohomology`, `DerivedDeRhamCohomology:DD.1/koszul-complex`, `AInfCohomology:AI.1/completed-sum-cohomology`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 7.3 and its finite-reduction hypotheses; printed p.56. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Dé­calage interface for Dieudonné consumers

`AInfCohomology:AI.1/dieudonne-consumer-contract` · comparison · `TauCeti.AInfPlan.dieudonne_consumer_contract`

The generic p-complete Lη_p and Bockstein/filtered interfaces specialize to the η_p used for saturation and the Beilinson construction of the Nygaard filtration in BLM. CR.4 owns the strict Dieudonné fixed-point equivalence and the Nygaard filtration itself; AI.1 supplies the completion-compatible lax functor.

**Hypotheses.** p a nonzerodivisor on the complex; derived p-completion for the fixed-point category.

**Construction/proof.**

1. Identify normalized eta with the saturated-complex definition on termwise p-torsion-free representatives.
2. Check Bockstein and filtered products before applying the CR.4 equivalences.

**Direct prerequisites.** `AInfCohomology:AI.1/completion-at-decalage-ideal`, `AInfCohomology:AI.1/filtered-beilinson-description`, `CrystallineCohomology:CR.4/leta-fixed-point`, `CrystallineCohomology:CR.4/nygaard-filtration-comparisons`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [blm](https://www.math.ias.edu/~lurie/papers/Crystalline.pdf), §§2.2–2.4, printed pp.14–18; §§7.2–7.4, pp.86–94; §8.4, pp.104–107. Consumer compatibility with eta_p, saturation, completion and the corrected Beilinson filtration; generic saturated objects remain with CR.4.

### AInfCohomology:AI.2

Coverage: **planned**.

Refinements: Refine the AI.2-owned integral/Robba descent, annulus classification, extension across infinity and finite-free analytic vector-bundle equivalence on the punctured analytic locus Y^an. Reuse the existing interior spaY and obtain the endpoint carrier/stalk/sheaf extension from AdicSpaces; refine continuous Galois action transport. Resolve the early perfectoid minuscule-window dictionary. Integral Witt descent now has an AI.2 target including torsion, rather than a request to the rational VB0 isocrystal plan.

#### Valuation submodule dimension bound

`AInfCohomology:AI.2/valuation-special-fiber-bound` · lemma · `TauCeti.AInfPlan.valuation_special_fiber_bound`

For E⊂(C^flat)^d an O_C^flat-submodule, dim_k(E⊗k)≤d.

**Hypotheses.** No finite generation assumed for E.

**Construction/proof.**

1. Every finitely generated torsion-free submodule is finite free of rank≤d.
2. A hypothetical larger independent residue family would lift to such a submodule.

**Direct prerequisites.** `PerfectoidSpaces:P1`, `mathlib:ModuleCat`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.7, printed pp.35–36. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Residue-dimension criterion for a lattice

`AInfCohomology:AI.2/valuation-lattice-criterion` · lemma · `TauCeti.AInfPlan.valuation_lattice_criterion`

If D⊂(C^flat)^d and dim_k(D⊗k)=d, then D is finite free of rank d.

**Hypotheses.** D an O_C^flat-submodule; C^flat algebraically closed valuation field.

**Construction/proof.**

1. In rank one distinguish a principal fractional ideal, m times a principal fractional ideal, and the field.
2. Induct by a saturated rank-one submodule and its torsion-free quotient.

**Direct prerequisites.** `AInfCohomology:AI.2/valuation-special-fiber-bound`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.8, printed pp.35–36; fractional-ideal correction PAPER-BHATT-MORROW-SCHOLZE-18/E2. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Linear module patching across a principal divisor

`AInfCohomology:AI.2/linear-module-patching` · theorem · `TauCeti.AInfPlan.linear_module_patching`

For any commutative ring R and non-zero-divisor f, let Rhat be its f-adic completion. Base extension is an equivalence from f-torsion-free R-modules to triples (N,P,beta), with N an f-torsion-free Rhat-module, P an R[1/f]-module and beta:N[1/f]≅P tensor_R Rhat. The inverse is the fiber product in the common overlap. A module is finite projective exactly when both members of its triple are finite projective; morphisms are pairs commuting with beta.

**Hypotheses.** No Noetherian hypothesis. Completion need not be flat. The specified overlap is Rhat[1/f], and f is regular on N.

**Construction/proof.**

1. Form the equalizer of the two maps N⊕P→N[1/f], using beta.
2. Use regularity of f and the f-adic approximation argument to recover both scalar extensions, then the Hom equalizer.
3. Apply the finite-projective patching criterion to obtain the restriction of the equivalence used by BKF lattices.

**Direct prerequisites.** `mathlib:ModuleCat`, `mathlib:AdicCompletion`, `mathlib:TensorProduct`.

**Acceptance.** Keep f-torsion-freeness, the overlap map and morphism compatibility; a bare pair of modules is insufficient.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Lemma 5.2.9, printed p.38 (PDF p.48). Full module patching and its finite-projective criterion; applied without assuming flat completion.

#### Kedlaya triviality on the punctured spectrum

`AInfCohomology:AI.2/punctured-spectrum-triviality` · theorem · `TauCeti.AInfPlan.punctured_spectrum_triviality` · Planet: **Kedlaya punctured-spectrum triviality**

Finite free A_inf-modules restrict equivalently to vector bundles on U=Spec(A_inf) minus its closed point; the inverse is H^0(U,−). This algebraic U is distinguished from the analytic punctured Spa used subsequent.

**Hypotheses.** C as above; vector bundles of finite rank.

**Construction/proof.**

1. Patch on the source two opens and compute the intersection lattice.
2. Use the valuation residue-dimension criterion and p-completeness to prove it is finite free.

**Direct prerequisites.** `AInfCohomology:AI.2/valuation-lattice-criterion`, `AInfCohomology:AI.0/period-regularity`, `AInfCohomology:AI.2/linear-module-patching`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.6, printed pp.34–35. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Perfectness of finitely presented A_inf modules

`AInfCohomology:AI.2/ainf-module-perfectness` · lemma · `TauCeti.AInfPlan.ainf_module_perfectness`

A finitely presented A_inf-module M with M[1/p] finite free is perfect as an A_inf complex.

**Hypotheses.** M finitely presented; M[1/p] finite free; C as above; x=[varpi^flat] nonzero topologically nilpotent.

**Construction/proof.**

1. Use finite Witt coherence for p-power-torsion modules, then devissage after embedding into a p-local free module.

**Direct prerequisites.** `AInfCohomology:AI.0/witt-coherence`, `AInfCohomology:AI.0/witt-finite-presentation-devissage`, `AInfCohomology:AI.0/period-regularity`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.9(i); printed p.35. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Bounded and finitely presented A_inf torsion

`AInfCohomology:AI.2/ainf-bounded-torsion` · lemma · `TauCeti.AInfPlan.ainf_bounded_torsion`

For such M, M_tor is killed by p^n for some n and is finitely presented and perfect.

**Hypotheses.** M finitely presented; M[1/p] finite free; C as above; x=[varpi^flat] nonzero topologically nilpotent.

**Construction/proof.**

1. Bound p-torsion by a finite presentation and use the finite Witt coherent submodule criterion.

**Direct prerequisites.** `AInfCohomology:AI.0/witt-coherence`, `AInfCohomology:AI.0/witt-finite-presentation-devissage`, `AInfCohomology:AI.0/period-regularity`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.9(ii); printed p.35. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Tor bounds for A_inf modules

`AInfCohomology:AI.2/ainf-tor-bounds` · lemma · `TauCeti.AInfPlan.ainf_tor_bounds`

Such M has Tor-dimension≤2, Tor_2^(A_inf)(M,W(k))=0; if M has no x-torsion, Tor_i(M,W(k))=0 for i>0, where x=[varpi^flat] is a topologically nilpotent Teichmuller parameter.

**Hypotheses.** M finitely presented; M[1/p] finite free; C as above; x=[varpi^flat] nonzero topologically nilpotent.

**Construction/proof.**

1. Resolve over finite Witt valuation rings and use the x-root filtered quotient model of W(k).

**Direct prerequisites.** `AInfCohomology:AI.0/witt-coherence`, `AInfCohomology:AI.0/witt-finite-presentation-devissage`, `AInfCohomology:AI.0/period-regularity`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.9(iii); printed p.35. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Vector-bundle criterion and p-local freeness

`AInfCohomology:AI.2/punctured-vector-bundle-criterion` · lemma · `TauCeti.AInfPlan.punctured_vector_bundle_criterion`

A finitely generated p-torsion-free M with M[1/p] finite projective defines a vector bundle on U. Consequently every finite projective A_inf[1/p]-module is finite free.

**Hypotheses.** A_inf=W(O_C^flat) for C complete algebraically closed of characteristic zero; U is Spec(A_inf) minus its closed point. M is finitely generated and p-torsion-free, with M[1/p] finite projective.

**Construction/proof.**

1. On D(p), use the assumed projectivity. The only remaining prime of U containing p is (p).
2. Show A_inf,(p) is a DVR with uniformizer p: a nonzero Witt vector has a first nonzero p-adic coefficient, whose Teichmuller representative is a unit after localization at (p). A finite p-torsion-free module over this DVR is free.
3. Apply punctured-spectrum triviality; extend a finite projective A_inf[1/p]-module by a finitely generated p-torsion-free lattice to prove Corollary 4.12.

**Direct prerequisites.** `AInfCohomology:AI.2/punctured-spectrum-triviality`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.10, printed pp.36–37; Corollary 4.12, p.37. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### A_inf module structure theorem

`AInfCohomology:AI.2/ainf-module-structure` · theorem · `TauCeti.AInfPlan.ainf_module_structure` · Planet: **A_inf module structure theorem**

For finitely presented M with M[1/p] finite projective, there is a functorial exact sequence 0→M_tor→M→M_free→M_bar→0. M_free is finite free; M_tor is perfect and bounded p-power torsion; M_bar is finitely presented perfect and killed by a power of (p,x). If M⊗W(k) is p-torsion-free, or M⊗O_C is p-torsion-free in mixed characteristic, then M is finite free.

**Hypotheses.** Source hypotheses on M; ordinary scalar extensions in the last criterion.

**Construction/proof.**

1. Extend M/M_tor from U by global sections.
2. Its finite closed-point-supported cokernel yields the four-term exact sequence.
3. Compare generic and residue rank by Fitting ideals for the freeness criterion.

**Direct prerequisites.** `AInfCohomology:AI.2/ainf-module-perfectness`, `AInfCohomology:AI.2/ainf-bounded-torsion`, `AInfCohomology:AI.2/punctured-vector-bundle-criterion`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 4.13, printed pp.37–38. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Breuil–Kisin–Fargues module

`AInfCohomology:AI.2/bkf-module` · definition · `TauCeti.BKF.Module` · Planet: **Breuil–Kisin–Fargues module**

A BKF module is a finitely presented A_inf-module M, finite free after inverting p, with a phi-semilinear isomorphism M[1/xi]→M[1/tilde-xi]. Equivalently its linearization is phi^*M[1/tilde-xi]≅M[1/tilde-xi]; morphisms commute with the linearized Frobenius. Finite free and minuscule are additional conditions.

**Hypotheses.** Perfectoid field and chosen kernel generator; p-local finite freeness; semilinearity uses the existing Witt Frobenius.

**Construction/proof.**

1. Use localization and scalar restriction/extension on existing ModuleCat objects.
2. Transport xi to tilde-xi under Frobenius and prove the linearization dictionary.

**Direct prerequisites.** `AInfCohomology:AI.2/ainf-module-structure`, `AInfCohomology:AI.0/cyclotomic-coefficients`, `mathlib:LocalizedModule`.

**Uses.** `AInfCohomology:AI.5/global-bkf`: Proper cohomology is a BKF object. `AInfCohomology:AI.2/fargues-classification`: Finite free objects are classified by pairs.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.BKF.Module_linearized` | equivalence | Semilinear and linearized Frobenius presentations agree with localization at tilde-xi. |
| `TauCeti.BKF.Module_hom` | characterisation | Morphisms are A_inf-linear maps commuting with localized Frobenius. |
| `TauCeti.BKF.Module_ext` | extensionality | A morphism is determined by its underlying A_inf-linear map. |
| `TauCeti.BKF.Module_unit` | constructor | The unit is A_inf with Witt Frobenius. |
| `TauCeti.BKF.Module_twist` | constructor | A_inf{n} is finite free BKF with the source Frobenius factor. |
| `TauCeti.BKF.Module_base_change` | compatibility | Eligible perfectoid coefficient change preserves the linearized presentation. |
| `TauCeti.BKF.Module_twist_frobenius` | compatibility | On the conormal basis of A_inf{1}, the linearized Frobenius coefficient is tilde-xi^(-1), not 1; use the Frobenius-pulled source basis. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.BKF.Module_test_unit` | compatibility | The unit has étale realization Z_p and de Rham lattice B_dR^+. |
| `TauCeti.BKF.Module_test_twist` | computation | A_inf{1} has étale realization Z_p(1), not the untwisted unit with identity Frobenius. |
| `TauCeti.BKF.Module_test_torsion` | non-example | The object A_inf/p with Frobenius is allowed in the finitely presented category but is outside the finite-free Fargues equivalence. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 4.22; printed p.40. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Operations in valid BKF subcategories

`AInfCohomology:AI.2/bkf-valid-operations` · lemma · `TauCeti.AInfPlan.bkf_valid_operations`

The finite free BKF subcategory has tensor products, duals and internal Homs with localized Frobenius; the larger finitely presented BKF category is an exact tensor category with invertible Tate twist, but is not closed under arbitrary cokernels. The map A_inf⊗Z_p(1)→A_inf{1} has cokernel modeled by A_inf/(mu), which fails p-local projectivity. Kernel/cokernel closure is asserted only for the variant with specified compatible crystalline rigidification discussed after Lemma 4.27.

**Hypotheses.** C complete algebraically closed of characteristic zero for the cyclotomic counterexample. Tensor-dual/internal-Hom closure here is in the finite free subcategory. For abelian closure retain the specified crystalline comparison and require morphisms to respect it; this variant is not the unrigidified BKF category.

**Construction/proof.**

1. Tensor and dualize the localized Frobenius equivalences of finite free modules.
2. Use the dlog inclusion into the intrinsic twist and Example 4.23 to exhibit failure of cokernel closure.
3. For the separately rigidified variant use Lemma 4.19 and the compatible crystalline map to check the p-local condition on kernels and cokernels.

**Direct prerequisites.** `AInfCohomology:AI.2/bkf-module`, `AInfCohomology:AI.2/ainf-module-structure`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Examples 4.23–4.24, Remark 4.25; discussion following Lemma 4.27; printed pp.40–42. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Étale lattice and de Rham lattice pair

`AInfCohomology:AI.2/lattice-pair` · definition · `TauCeti.BKF.LatticePair` · Planet: **Étale and de Rham lattice pair**

A lattice pair (T,Xi) has T finite free over Z_p and Xi a finite free B_dR^+-submodule of T⊗Z_p B_dR spanning that ambient B_dR-vector space. Morphisms are Z_p-linear maps whose B_dR scalar extensions preserve Xi.

**Hypotheses.** Common B_dR^+ discrete valuation ring and B_dR supplied by R06.1; finite ranks.

**Construction/proof.**

1. Use a submodule of the existing scalar-extension carrier, with lattice conditions.
2. Use tensor and dual lattices with their actual ambient identifications.

**Direct prerequisites.** `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`, `mathlib:TensorProduct`.

**Uses.** `AInfCohomology:AI.2/fargues-classification`: This is the target category of the classification.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.BKF.LatticePair_standard` | constructor | The standard pair is (T,T⊗B_dR^+). |
| `TauCeti.BKF.LatticePair_hom` | characterisation | A Z_p-linear map is a pair morphism exactly when its scalar extension carries Xi into Xi′. |
| `TauCeti.BKF.LatticePair_ext` | extensionality | Morphisms agree if their maps on T agree. |
| `TauCeti.BKF.LatticePair_tensor` | constructor | Tensor pairs use Xi⊗Xi′ inside (T⊗T′)⊗B_dR. |
| `TauCeti.BKF.LatticePair_dual` | constructor | The dual lattice consists of functionals taking Xi into B_dR^+. |
| `TauCeti.BKF.LatticePair_bounds` | characterisation | Every lattice lies between xi^n and xi^(-n) multiples of the standard lattice for some n. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.BKF.LatticePair_test_zero` | degenerate | The rank-zero pair is the zero module and zero lattice. |
| `TauCeti.BKF.LatticePair_test_shift` | computation | (Z_p,xi^(-1)B_dR^+) is a nonstandard rank-one modification. |
| `TauCeti.BKF.LatticePair_test_nospan` | non-example | The zero submodule of B_dR is not a lattice for T=Z_p. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 4.28, printed pp.42–43. Finite-free BKF target pairs with their actual de Rham lattice.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition 12.4.6, printed pp.106–107; Theorem 14.1.1, printed pp.115–116. One-leg shtuka pairs and BKF realization; 12.4.6 is a proposition.

#### Integral Witt Frobenius descent

`AInfCohomology:AI.2/integral-frobenius-descent` · theorem · `TauCeti.AInfPlan.integral_frobenius_descent`

For an algebraically closed perfect characteristic-p field F, invariants and W(F) scalar extension give inverse equivalences between finite W(F)-modules with bijective semilinear Witt Frobenius and finite Z_p-modules. The canonical map W(F) tensor_Z_p M^(phi=1)→M is an isomorphism, including p-power-torsion modules. It preserves the finite-free subcategories, morphisms and tensor products.

**Hypotheses.** p prime. Witt Frobenius is an automorphism. The Z_p coefficient map is canonical and Frobenius-fixed; F=C^flat is the BKF application.

**Construction/proof.**

1. In the free case apply Artin–Schreier–Witt descent and algebraic closedness to trivialize the Frobenius module.
2. Apply the finite-level descent statement over W_n(F) to torsion modules and pass through finite p-power filtrations; finite W(F)-modules split into free and bounded-torsion parts over the DVR.
3. Identify the natural invariant/scalar-extension maps, including morphisms and tensor compatibility. This integral assertion precedes and differs from rational isocrystal classification.

**Direct prerequisites.** `mathlib:WittVector`, `mathlib:ModuleCat`, `mathlib:TensorProduct`.

**Acceptance.** Retain finite torsion modules: W(F)/p descends to F_p, not to a free Z_p-module.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.26 and its proof, printed pp.41–42. The BKF realization uses integral Frobenius descent for arbitrary finite Witt modules.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 12.3.4 and proof, printed p.104 (PDF p.114). Artin–Schreier–Witt descent supplies the finite-free case; finite-level descent supplies the torsion extension used by BMS.

#### Étale realization of BKF modules

`AInfCohomology:AI.2/bkf-etale-realization` · construction · `TauCeti.BKF.etale`

For any BKF module M, T(M)=(M⊗A_inf W(C^flat))^(phi=1) is finite over Z_p, and T(M)⊗Z_p W(C^flat)≅M⊗A_inf W(C^flat). For finite free M, T(M) is finite free; Xi(M)=M⊗A_inf B_dR^+ embeds as a lattice in T(M)⊗B_dR. Moreover M tensor A_inf[1/mu]=T(M) tensor A_inf[1/mu] as submodules of the common W(C^flat) extension.

**Hypotheses.** C algebraically closed; use the source completed Witt localization W(C^flat), not the fraction field of A_inf.

**Construction/proof.**

1. Apply the integral Frobenius descent theorem in this AI.2 layer to finite W(C^flat)-modules, including torsion; do not infer it from rational isocrystal classification.
2. Reduce the mu-inverted equality to finite free M via Proposition 4.13. Twist to make inverse Frobenius integral, use minimal valuations of Witt coefficients to put invariants in M, and apply the argument to the dual for the reverse inclusion.
3. Use the common map to B_dR to obtain the finite-free lattice.

**Direct prerequisites.** `AInfCohomology:AI.2/bkf-module`, `AInfCohomology:AI.2/ainf-module-structure`, `AInfCohomology:AI.2/lattice-pair`, `AInfCohomology:AI.2/integral-frobenius-descent`.

**Uses.** `AInfCohomology:AI.2/fargues-classification`: The forward functor is (T(M),Xi(M)).

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.BKF.etale_finite` | characterisation | T(M) is finite; finite free when M is finite free. |
| `TauCeti.BKF.etale_descent` | equivalence | The Frobenius-invariant reconstruction holds over W(C^flat). |
| `TauCeti.BKF.etale_lattice` | constructor | For finite free M the B_dR^+ realization is the lattice Xi(M). |
| `TauCeti.BKF.etale_tensor` | compatibility | Étale realization preserves finite-free tensor products and twists. |
| `TauCeti.BKF.etale_mu_comparison` | equivalence | M tensor A_inf[1/mu]≅T(M) tensor A_inf[1/mu] in the common W(C^flat) extension. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.BKF.etale_test_unit` | computation | T(A_inf)=Z_p. |
| `TauCeti.BKF.etale_test_twist` | compatibility | T(A_inf{1})=Z_p(1). |
| `TauCeti.BKF.etale_test_p_torsion` | computation | T(A_inf/p)=F_p, so finite presentation does not imply a free Z_p realization. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemmas 4.26–4.27, printed pp.41–43. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Full faithfulness of Fargues realization

`AInfCohomology:AI.2/fargues-full-faithfulness` · theorem · `TauCeti.AInfPlan.fargues_full_faithfulness`

The functor from finite free BKF modules to pairs (T,Xi) is fully faithful. Its early algebraic intersection proof depends on §4.2 and period maps, independently of the subsequent proper cohomology theorem.

**Hypotheses.** C algebraically closed; finite free source objects.

**Construction/proof.**

1. Identify a map after W(C^flat) extension by its map on T.
2. Intersect the integral A_inf lattice with the B_dR^+ condition to recover an A_inf-linear Frobenius-compatible map.

**Direct prerequisites.** `AInfCohomology:AI.2/bkf-etale-realization`, `AInfCohomology:AI.2/ainf-module-structure`, `AInfCohomology:AI.0/witt-limit-and-mu-kernel`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Remark 4.29, using Lemmas 3.23 and 4.26 (Theorem 4.28 is the statement only); printed pp.27–43. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Integral Robba Frobenius descent and no-leg shtukas

`AInfCohomology:AI.2/integral-robba-frobenius-descent` · theorem · `TauCeti.AInfPlan.integral_robba_frobenius_descent`

On the punctured analytic Y^an for C^flat, finite free phi-modules over the integral extended Robba ring Rtilde_int, finite free phi-modules over W(C^flat), and finite free Z_p-modules are equivalent. The first functor is coefficient extension and the second is phi-invariants. Shtukas over Spa(C^flat) with no legs, namely phi-vector bundles on Y_[0,infinity), are equivalent to these categories.

**Hypotheses.** C complete algebraically closed perfectoid of characteristic zero. Use the existing Y and its intervals and Frobenius, with the integral Robba rings of SW Definition 12.3.1.
 Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Construction/proof.**

1. Show equality of integral Robba and Witt Frobenius invariants by the Newton-polygon argument.
2. Use integral Witt descent for essential surjectivity.
3. Descend a phi^-1-module to a sufficiently small Y_[0,r] and extend successively by inverse Frobenius to Y_[0,infinity); these extensions recover the given localization.

**Direct prerequisites.** `AInfCohomology:AI.2/integral-frobenius-descent`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `PerfectoidSpaces:P1`.

**Acceptance.** Keep the integral coefficient ring and bijective semilinear Frobenius; rational isocrystals alone do not supply this equivalence.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Definition 12.3.1, Theorem 12.3.4 and Proposition 12.3.5, printed pp.103–104 (PDF pp.113–114). Integral coefficient extension, invariant descent and the no-leg equivalence.

#### Isocrystal origin of analytic annulus Frobenius modules

`AInfCohomology:AI.2/annulus-isocrystal-classification` · theorem · `TauCeti.AInfPlan.annulus_isocrystal_classification`

Fix a section k→O_C^flat of the residue map, inducing L=W(k)[1/p]→A_inf[1/p]. For a phi-vector bundle E on Y_[r,infinity), 0≤r<infinity, there is a finite-dimensional isocrystal M over L and a phi-equivariant isomorphism E≅M tensor_L O_Y_[r,infinity). The isocrystal carrier and its Witt Frobenius already exist in Mathlib; the new target is this analytic classification.

**Hypotheses.** C complete algebraically closed perfectoid, k its residue field, and the specified section. Use the shared analytic intervals and their Frobenius pullbacks.
 Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Construction/proof.**

1. Use Frobenius pullback to extend the interval toward zero without changing its phi-module category.
2. Identify phi-vector bundles with phi-modules over the extended Robba ring.
3. Apply Kedlaya’s analytic classification in the stated residue-field section; retain the induced L-coefficient map. Smaller Newton-polygon and slope arguments remain inside this proof.

**Direct prerequisites.** `mathlib:WittVector.Isocrystal`, `mathlib:WittVector.FractionRing.frobenius`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `AInfCohomology:AI.2/integral-robba-frobenius-descent`.

**Acceptance.** Do not substitute an algebraic vector-bundle classification on the curve for the analytic interval theorem.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 13.4.1, Remark 13.4.2 and Definition 13.4.3, printed pp.111–113 (PDF pp.121–123). Analytic phi-modules arise from isocrystals over the specified residue-field coefficient embedding.

#### Unique Frobenius extension across infinity

`AInfCohomology:AI.2/frobenius-extension-infinity` · theorem · `TauCeti.AInfPlan.frobenius_extension_infinity`

For 0≤r<infinity, restriction from phi-vector bundles on Y_[r,infinity] to phi-vector bundles on Y_[r,infinity) is an equivalence. In particular a one-leg shtuka becomes a phi-module beyond the radius of its leg and extends uniquely across x_L; this is the extension at infinity required by finite-free BKF reconstruction.

**Hypotheses.** Shared Y, x_L, radius function and Frobenius. The algebraically closed C used for analytic classification supplies essential surjectivity; full faithfulness also holds over a general perfectoid field.
 Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Construction/proof.**

1. For full faithfulness reduce to invariant sections of an internal Hom.
2. Use the Newton-polygon argument of Proposition 13.3.2 to extend Frobenius eigenvectors across x_L.
3. For essential surjectivity extend the isocrystal representative by scalar extension to Y_[r,infinity], then glue it to the shtuka on its bounded part.

**Direct prerequisites.** `AInfCohomology:AI.2/annulus-isocrystal-classification`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.

**Acceptance.** Retain both interval endpoints and uniqueness; the leg is outside the phi-module tail.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 13.2.1, Remark 13.2.2, Proposition 13.3.2 and Theorem 13.4.1, printed pp.109–111 (PDF pp.119–121). The missing endpoint is infinity; the theorem is not deletion of the zero endpoint.

#### Finite free A_inf modules and bundles on punctured analytic Y

`AInfCohomology:AI.2/analytic-vector-bundle-extension` · theorem · `TauCeti.AInfPlan.analytic_vector_bundle_extension`

Restriction of finite free A_inf-modules to the punctured analytic Y^an induces an equivalence with finite-rank vector bundles on Y^an. This is distinct from the algebraic punctured spectrum U=Spec(A_inf) minus its closed point. Applying it to the extended one-leg shtuka recovers the finite free underlying module; its Frobenius is then linearized after inverting tilde-xi.

**Hypotheses.** C complete algebraically closed of characteristic zero. Y^an is the punctured analytic locus of SW §12.2, printed pp.101–102; topology and endpoint carriers remain owned by upstream AdicSpaces.
 Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Construction/proof.**

1. Use the source two-open cover and the associated equalizer for sections; import the affinoid finite-projective/vector-bundle equivalence from the lower adic foundations.
2. Recover a finite free A_inf-module from a vector bundle by the source lattice and approximation argument.
3. Identify scalar extension back to Y and the Hom equalizer, giving essential surjectivity and full faithfulness.

**Direct prerequisites.** `AInfCohomology:AI.2/linear-module-patching`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `AdicSpacesPartII:R3`.

**Acceptance.** Reuse the existing interior spaY and request the two endpoints and their sheaf interfaces from its owner. The equivalence here is on Y^an, not on the interior Fargues–Fontaine cover alone.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 14.2.1 and proof, printed pp.116–117 (PDF pp.126–127). The equivalence is on analytic Y and recovers the finite-free A_inf coefficient module.

#### Analytic reconstruction of a finite free BKF module

`AInfCohomology:AI.2/fargues-essential-surjectivity` · construction · `TauCeti.BKF.reconstruct`

Reconstruct a finite free BKF module from a pair (T,Xi) using the one-leg shtuka, unique extension across infinity and finite-free/vector-bundle equivalence on the punctured analytic Y^an. AI.2 owns these linear patching and reconstruction theorems; the upstream AdicSpaces roadmap supplies the interior and is asked for the punctured endpoint extension and its Frobenius, so no new curve is constructed.

**Hypotheses.** C algebraically closed; pair as defined; in SW the leg is at phi^(-1)(x_C). Translate this to linearization inverted at tilde-xi=phi(xi), retaining the direction of Frobenius.
 Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Construction/proof.**

1. Use Proposition 12.4.6 to build the one-leg shtuka from (T,Xi): patch Xi at x_C and its successive Frobenius translates, with the leg at phi^-1(x_C). No-leg descent is supplied by integral-robba-frobenius-descent.
2. Use frobenius-extension-infinity to extend its phi-module tail across x_L; glue with the bounded part.
3. Use analytic-vector-bundle-extension to recover the finite free A_inf-module, then SW Theorem 14.1.1 to identify its Frobenius linearization after tilde-xi inversion.

**Direct prerequisites.** `AInfCohomology:AI.2/lattice-pair`, `AInfCohomology:AI.2/linear-module-patching`, `AInfCohomology:AI.2/integral-robba-frobenius-descent`, `AInfCohomology:AI.2/frobenius-extension-infinity`, `AInfCohomology:AI.2/analytic-vector-bundle-extension`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.

**Uses.** `AInfCohomology:AI.2/fargues-classification`: Gives an inverse, beyond merely a faithful realization.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.BKF.reconstruct_pair` | equivalence | The reconstructed BKF module realizes to the given pair. |
| `TauCeti.BKF.reconstruct_morphism` | functoriality | Pair morphisms induce Frobenius-compatible maps. |
| `TauCeti.BKF.reconstruct_tensor` | compatibility | Reconstruction preserves tensor products in the finite-free category. |
| `TauCeti.BKF.reconstruct_modification` | compatibility | Under the canonical realization-pair isomorphism, the image of the reconstructed B_dR^+-lattice equals the specified Xi, element by element. This identifies the completed-stalk lattice of the associated modification on the punctured analytic Y^an; it is not merely freeness of the underlying module. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.BKF.reconstruct_test_standard` | compatibility | The standard pair reconstructs the unit as a BKF object: the comparison and inverse commute with linearized Frobenius and have inverse underlying maps. |
| `TauCeti.BKF.reconstruct_test_shift` | computation | A xi-shifted rank-one lattice reconstructs the corresponding BK twist with the source sign convention: the comparison has a BKF morphism and inverse whose underlying maps are inverse and whose linearized Frobenius squares commute. |
| `TauCeti.BKF.reconstruct_test_zero` | degenerate | The zero pair reconstructs the zero finite-free BKF object. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 11.4.5, printed p.97; Theorem 12.3.4 and Proposition 12.3.5, p.104; Proposition 12.4.6, pp.106–107; Theorems 13.2.1,13.4.1, pp.109–113; Theorems 14.1.1,14.2.1, pp.115–117. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Fargues classification of finite free BKF modules

`AInfCohomology:AI.2/fargues-classification` · theorem · `TauCeti.AInfPlan.fargues_classification` · Planet: **Fargues classification**

Over algebraically closed C, finite free BKF modules are tensor equivalent to lattice pairs (T,Xi). The inverse and comparison preserve Tate twists and the associated FF modifications. No such equivalence is asserted for every finitely presented torsion BKF object.

**Hypotheses.** Common rational period rings and supplied analytic patching; finite free modules.

**Construction/proof.**

1. Combine full faithfulness with reconstruction and its two unit/counit comparisons.
2. Check tensor and twist identities in the two realizations.

**Direct prerequisites.** `AInfCohomology:AI.2/fargues-full-faithfulness`, `AInfCohomology:AI.2/fargues-essential-surjectivity`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 4.28, printed pp.42–43. Classification statement; full faithfulness and reconstruction are separate preceding targets.

**Source.** [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 14.1.1, printed pp.115–116. Finite-free BKF, one-leg shtuka and lattice-pair equivalences with source Frobenius normalization.

#### Continuous Galois descent of BKF pairs

`AInfCohomology:AI.2/bkf-galois-descent` · theorem · `TauCeti.AInfPlan.bkf_galois_descent`

For a discretely valued K with C its completed algebraic closure, retain a continuous semilinear G_K action on the BKF module and compatible continuous action on T and Xi. The Fargues correspondence respects this descent data; discarding the action does not recover the K-object.

**Hypotheses.** K complete discretely valued with perfect residue field; continuity for the p-adic and period topologies. Finite free BKF modules and their lattice pairs for transport by Fargues classification. The explicit crystalline case begins with a G_K-stable Z_p lattice in a crystalline representation.

**Construction/proof.**

1. Transport semilinear actions by the fully faithful Fargues functor.
2. Check continuity using the requested coefficient topologies, rather than infer it from algebraic equivariance.
3. For lattices in crystalline G_K representations, use the Frobenius on W(k) and T↦[pi-flat]^p in Proposition 4.32; Proposition 4.34 identifies the crystalline/de Rham lattice and its compatible action.

**Direct prerequisites.** `AInfCohomology:AI.2/fargues-classification`, `PadicHodgeTheory:R06.1`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), §4.4, Lemma 4.30, Proposition 4.32 and Proposition 4.34; printed pp.33–44. Section 4.4 gives the explicit crystalline lattice example and the corrected scalar map. General continuous action transport additionally needs the requested topology interface.

#### Minuscule BKF and prismatic Dieudonné dictionary

`AInfCohomology:AI.2/minuscule-prismatic-dictionary` · comparison · `TauCeti.AInfPlan.minuscule_prismatic_dictionary`

Over a perfectoid ring, admissible prismatic Dieudonné modules evaluated on the initial prism are precisely minuscule BKF modules. For O_C use (A_inf,tilde-xi) and a finite free linearized phi whose integral image lies in M with cokernel killed by tilde-xi and finite projective over O_C. This is a Frobenius-shifted dictionary with the theta prism.

**Hypotheses.** Perfectoid ring; finite projective/free conventions exactly as in the Dieudonné supplier; minuscule weights [0,1].

**Construction/proof.**

1. Import admissible prismatic Dieudonné objects and their perfectoid evaluation from the owner.
2. Identify the window filtration with the minuscule integral Frobenius image; check the conormal ideal orientation.

**Direct prerequisites.** `AInfCohomology:AI.2/bkf-module`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `PrismaticCohomology:PR.0`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [alb](https://arxiv.org/pdf/1907.10525v4), Definition 4.1.24, printed p.34; §4.3 perfectoid dictionary, pp.47–49. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Crystalline determination of a minuscule BKF module

`AInfCohomology:AI.2/minuscule-crystalline-triple` · theorem · `TauCeti.AInfPlan.minuscule_crystalline_triple` · Planet: **Minuscule crystalline triple**

A minuscule BKF module over O_C is determined up to isomorphism by (T_M,M_crys,alpha_M), where T_M=M[1/tilde-xi]^(phi=1), M_crys=M⊗A_inf A_crys and alpha is the Frobenius-compatible B_crys comparison. The natural map M→M_crys is part of the realization; the theorem is faithfulness of the triple, not essential surjectivity for arbitrary triples.

**Hypotheses.** C algebraically closed; minuscule finite free BKF; period maps as normalized in the prismatic dictionary.

**Construction/proof.**

1. Use the minuscule classification to recover the integral lattice from the compatible crystalline and étale realizations.
2. Separate the author erratum to Proposition 5.23 from this result; no nilpotence of divided Frobenius on the full crystalline kernel is assumed.

**Direct prerequisites.** `AInfCohomology:AI.2/minuscule-prismatic-dictionary`, `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`, `AInfCohomology:AI.2/fargues-classification`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [alb](https://arxiv.org/pdf/1907.10525v4), Proposition 4.3.5, printed p.48 (preprint v4; published Proposition 4.47). The export is the indicated source construction/result, with the corrected conventions explained in the reader.

### AInfCohomology:AI.3

Coverage: **planned**.

Refinements: Refine the corrected-site module enhancement and the continuous completed-cochain forgetful comparison; split finite-Witt injectivity/intersection proof interiors for almost-to-honest descent.

#### Completed integral structure sheaf

`AInfCohomology:AI.3/completed-integral-sheaf` · construction · `TauCeti.AInfSheaf.completedIntegral` · Planet: **Completed integral structure sheaf**

On X_proet for a locally noetherian analytic adic X over Spa(Q_p,Z_p), define hat O_X^+=lim_n O_X^+/p^n as a sheaf of rings. There are compatible O_X^+/p^n≅hat O_X^+/p^n, p-flatness and rational localization hat O_X=hat O_X^+[1/p]. The site uses the corrected transfinite covers.

**Hypotheses.** The corrected pro-étale site is supplied by AdicEtaleGeometry A1; smoothness is not required here.

**Construction/proof.**

1. Import the corrected site and its affinoid perfectoid basis.
2. Form the sheaf inverse limit and prove its finite-reduction properties.

**Direct prerequisites.** `AdicEtaleGeometry:A1`, `PerfectoidSpaces:P6/scholze-2013-affinoid-perfectoid-comparison`, `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`.

**Uses.** `AInfCohomology:AI.3/tilt-sheaf`: The tilt is the Frobenius limit of its mod-p quotient.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AInfSheaf.completedIntegral_mod_pn` | equivalence | hat O^+/p^n≅O^+/p^n as sheaves. |
| `TauCeti.AInfSheaf.completedIntegral_sections` | characterisation | For affinoid perfectoid Uhat=Spa(R,R+), hat O^+(U)=R+. |
| `TauCeti.AInfSheaf.completedIntegral_localization` | compatibility | Inverting p gives hat O. |
| `TauCeti.AInfSheaf.completedIntegral_pullback` | functoriality | The completed integral sheaf is functorial under eligible adic morphisms. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AInfSheaf.completedIntegral_test_point` | compatibility | On Spa(C,O_C) the canonical affinoid-perfectoid sections are O_C. |
| `TauCeti.AInfSheaf.completedIntegral_test_mod_p` | computation | The mod-p quotient is O^+/p, with no extra inverse-limit Tor. |
| `TauCeti.AInfSheaf.completedIntegral_test_profinite` | compatibility | On U×S for profinite S, sections are continuous maps S→R+ with the p-adic topology. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [sch13](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeTheory.pdf), Lemma 4.2, printed pp.21–22; Definition 4.3, pp.22–23. Completed integral structure sheaf on affinoid perfectoids, on the corrected site.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 5.4, Remark 5.5 and Lemma 5.6, printed pp.46–48. Integral coefficient sheaves and perfectoid sections.

**Source.** [sch13-erratum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf), 2016 corrigendum, pp.1–3. Replace the covering definition; the point claims deleted by the corrigendum are not used.

#### Tilted integral structure sheaf

`AInfCohomology:AI.3/tilt-sheaf` · construction · `TauCeti.AInfSheaf.tilt`

Define hat O_X^{+,flat}=lim_F (hat O_X^+/p); it is a perfect characteristic-p sheaf of rings. For an affinoid perfectoid Uhat=Spa(R,R+), its sections identify with R^{+,flat} and its higher cohomology is almost zero.

**Hypotheses.** X as above; quotient and Frobenius limit in the corrected pro-étale topos.

**Construction/proof.**

1. Compute sections and limits on the perfectoid basis.
2. Use the source almost acyclicity and inverse-limit argument, not exactness of arbitrary sheaf limits.

**Direct prerequisites.** `AInfCohomology:AI.3/completed-integral-sheaf`, `mathlib:PreTilt`, `PerfectoidSpaces:P6/scholze-2013-affinoid-perfectoid-comparison`.

**Uses.** `AInfCohomology:AI.3/derived-ainf-sheaf`: Witt vectors of the tilt give the coefficient sheaf.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AInfSheaf.tilt_sections` | equivalence | On affinoid perfectoids, sections are the existing PreTilt R+ p. |
| `TauCeti.AInfSheaf.tilt_frobenius` | equivalence | Frobenius is an automorphism of the tilt sheaf. |
| `TauCeti.AInfSheaf.tilt_untilt` | compatibility | The multiplicative sharp map agrees with the existing untilt on sections. |
| `TauCeti.AInfSheaf.tilt_pullback` | functoriality | Compatible with pullback and rational restriction. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AInfSheaf.tilt_test_char_p` | compatibility | For a perfect characteristic-p section ring the tilt is that ring. |
| `TauCeti.AInfSheaf.tilt_test_zero` | degenerate | The tilt of the zero section ring is zero. |
| `TauCeti.AInfSheaf.tilt_test_sharp_add` | non-example | Sharp is multiplicative and generally not additive; do not expose a ring homomorphism sharp. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [sch13](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeTheory.pdf), Lemma 5.10, printed p.33. Tilt coefficients on the corrected pro-etale site; the number is that of the pinned author copy.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 5.6, printed pp.47–48. Integral tilted sheaf sections.

#### Derived p-completed A_inf sheaf

`AInfCohomology:AI.3/derived-ainf-sheaf` · construction · `TauCeti.AInfSheaf.ainf` · Planet: **Derived A_inf sheaf**

Let A_inf,X be the derived p-completion of the Witt sheaf W(hat O_X^{+,flat}) in the shared enhancement. BMS1 Definition 5.4 uses this derived object, distinct from presuming an everywhere discrete ordinary limit. Its H^0 on affinoid perfectoids is W(R^{+,flat}), and H^{>0} of sections is almost zero.

**Hypotheses.** Corrected pro-étale topos; shared enhancement and derived p-completion; almost ideal determined by the perfectoid base.

**Construction/proof.**

1. Take Witt vectors sectionwise, sheafify and derive p-completion.
2. Use finite Witt acyclicity and the surjective-system inverse-limit theorem.

**Direct prerequisites.** `AInfCohomology:AI.3/tilt-sheaf`, `mathlib:WittVector`, `EnhancedDerivedSheaves:E4/derived-complete-sheaves`.

**Uses.** `AInfCohomology:AI.3/aomega`: Supplies the actual object to Rnu_* and Lη_mu. `PadicHodgeTheory:P8:local-rational`: Rational sheaves extend these common coefficients.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AInfSheaf.ainf_mod_pn` | compatibility | Finite derived p reductions agree with the finite Witt sheaf reductions. |
| `TauCeti.AInfSheaf.ainf_sections_H0` | equivalence | H^0 of sections on an affinoid perfectoid is W(R^{+,flat}). |
| `TauCeti.AInfSheaf.ainf_theta` | constructor | The common theta and finite theta_r maps define sheaf coefficient specializations. |
| `TauCeti.AInfSheaf.ainf_frobenius` | equivalence | The Witt Frobenius gives an equivalence of A_inf,X with its scalar-twisted form. |
| `TauCeti.AInfSheaf.ainf_complete` | characterisation | A_inf,X is derived p-complete. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AInfSheaf.ainf_test_point` | compatibility | On the canonical point affinoid, H^0 is the existing W(O_C^flat). |
| `TauCeti.AInfSheaf.ainf_test_higher` | non-example | The comparison is almost acyclicity, not a claim that all higher sheaf cohomology vanishes integrally. |
| `TauCeti.AInfSheaf.ainf_test_level_one` | compatibility | The theta_1 map on sections is the already fixed Fontaine map. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 5.4, Remark 5.5, Lemma 5.6; printed pp.46–47. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Integral period sections and profinite products

`AInfCohomology:AI.3/perfectoid-period-sections` · theorem · `TauCeti.AInfPlan.perfectoid_period_sections`

On an affinoid perfectoid Uhat=Spa(R,R+), the completed integral and tilt sections are R+ and R+flat, and H^0(Uhat,A_inf,X)=W(R+flat). Their higher integral cohomology is almost zero, not asserted zero. For Uhat×S with S profinite, the integral sections are continuous S-valued maps with the specified inverse-limit topology. Rational period-sheaf acyclicity is a subsequent P8:local-rational theorem.

**Hypotheses.** X locally noetherian over a perfectoid field; Uhat affinoid perfectoid in the corrected pro-etale site; S profinite.

**Construction/proof.**

1. Use the completed integral and tilt descriptions on the perfectoid basis.
2. Induct through finite Witt lengths and use the controlled derived inverse limit for A_inf,X; retain the almost-zero higher cohomology.

**Direct prerequisites.** `AInfCohomology:AI.3/derived-ainf-sheaf`, `AInfCohomology:AI.3/completed-integral-sheaf`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [sch13](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeTheory.pdf), Theorem 6.5 and Corollary 6.6, printed p.36. Integral structure-sheaf sections and almost acyclicity on affinoid perfectoids.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 5.6, printed pp.47–48. Integral A_inf and finite-Witt perfectoid sections; no rational sheaf is asserted here.

#### The AΩ complex

`AInfCohomology:AI.3/aomega` · construction · `TauCeti.AOmega.local` · Planet: **AΩ complex**

For a smooth p-adic formal O_C-scheme mathfrak X with analytic generic fiber X and nu:X_proet→mathfrak X_Zar, define AΩ_mathfrak X=Lη_mu Rnu_* A_inf,X in the shared enhanced derived category of A_inf-module sheaves. The ideal (mu), hence the object, is independent of epsilon.

**Hypotheses.** Smooth p-adic formal scheme; corrected site; derived p-completed coefficients; common enhancement.

**Construction/proof.**

1. Construct the morphism of ringed topoi and its derived pushforward using E1.
2. Apply generic Lη to the intrinsic ideal (mu).
3. Use change-of-generator descent to identify different root choices.

**Direct prerequisites.** `AInfCohomology:AI.3/derived-ainf-sheaf`, `AInfCohomology:AI.1/derived-decalage`, `AInfCohomology:AI.0/witt-limit-and-mu-kernel`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `AdicEtaleGeometry:A1`.

**Uses.** `AInfCohomology:AI.4/hodge-tate`: Local specializations reduce this object. `AInfCohomology:AI.5/proper-ainf-complex`: Proper cohomology is its derived global sections.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AOmega.local_definition` | characterisation | AΩ=Lη_mu Rnu_* A_inf,X in the enhancement. |
| `TauCeti.AOmega.local_roots` | equivalence | Changing epsilon gives a canonical comparison through the ideal (mu). |
| `TauCeti.AOmega.local_restriction` | functoriality | Restriction to a Zariski open agrees with its AΩ construction. |
| `TauCeti.AOmega.local_multiplication` | structure | There is coherent unital E_infinity multiplication from the lax functors. |
| `TauCeti.AOmega.local_frobenius` | constructor | The Witt Frobenius yields phi^*AΩ→AΩ, factoring through Lη_tilde-xi AΩ. |
| `TauCeti.AOmega.local_complete` | characterisation | AΩ is derived (p,xi)-complete in the smooth setting. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AOmega.local_test_point` | computation | For mathfrak X=Spf O_C, AΩ≃A_inf in degree 0. |
| `TauCeti.AOmega.local_test_torus` | compatibility | For a framed formal torus the toric q-Koszul model computes AΩ. |
| `TauCeti.AOmega.local_test_framings` | compatibility | Two framings on the same smooth affine yield equivalences through the single sheaf AΩ, not coordinatewise equality of formulas. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Definition 9.1; printed p.69. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Toric perfectoid cover

`AInfCohomology:AI.3/toric-perfectoid-cover` · construction · `TauCeti.AOmega.toricCover`

For a small framed smooth R over O_C, set R_infinity=R completed-tensor_(O_C<T_i±1>) O_C<T_i±1/p^infinity>. It gives an affinoid perfectoid pro-étale cover with continuous Gamma=Z_p(1)^d action. Its integral and nonintegral monomial weight summands are completed, not unrestricted products.

**Hypotheses.** R p-complete, p-torsion-free and formally étale over the displayed torus; choose compatible roots for the action.

**Construction/proof.**

1. Adjoin roots of all torus coordinates and p-complete.
2. Use étale base change and perfectoid completion to prove the cover properties.

**Direct prerequisites.** `PerfectoidSpaces:P6/scholze-2013-affinoid-perfectoid-comparison`, `PerfectoidSpaces:P3/almost-purity-theorem`, `AInfCohomology:AI.1/completed-sum-cohomology`.

**Uses.** `AInfCohomology:AI.3/toric-cohomology`: The cover gives the continuous cochains.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AOmega.toricCover_action` | constructor | gamma_i scales the p-power roots of T_i by the compatible roots of unity. |
| `TauCeti.AOmega.toricCover_perfectoid` | characterisation | The completed cover is affinoid perfectoid. |
| `TauCeti.AOmega.toricCover_integral_part` | projection | Integral weights give the completed original torus part. |
| `TauCeti.AOmega.toricCover_transition` | compatibility | Finite root covers and their transition maps give the corrected pro-étale cover. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AOmega.toricCover_test_d0` | degenerate | In relative dimension 0 the coordinate tower and Gamma are trivial. |
| `TauCeti.AOmega.toricCover_test_d1` | computation | gamma(T^(1/p^n))=zeta_(p^n)T^(1/p^n). |
| `TauCeti.AOmega.toricCover_test_continuity` | non-example | Giving Gamma the discrete topology does not supply the required continuous completed cochain comparison. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), §8.1; Definition 9.3 (framing and root tower); printed pp.61–69. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Integral toric cohomology computation

`AInfCohomology:AI.3/toric-cohomology` · theorem · `TauCeti.AInfPlan.toric_cohomology`

The continuous cohomology of R_infinity decomposes by weights. Integral weights have the source exterior cohomology, and nonintegral weights have the bounded root-of-unity annihilation estimates of Proposition 8.9 and Lemma 8.10. After Lη_(zeta_p−1), only the predicted differential-form part survives.

**Hypotheses.** Framed small smooth R; completed weight decomposition; continuous Gamma.

**Construction/proof.**

1. Compute each one-variable gamma−1 eigenvalue.
2. Use the scalar Koszul divisibility alternatives for each weight and tensor with correct signs.
3. Pass to completed direct sums using the uniform torsion estimate.

**Direct prerequisites.** `AInfCohomology:AI.3/toric-perfectoid-cover`, `AInfCohomology:AI.1/continuous-cochains-koszul`, `AInfCohomology:AI.1/koszul-decalage-calculation`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 8.9; Lemma 8.10; printed pp.63–64. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Finite Witt toric cohomology

`AInfCohomology:AI.3/witt-toric-cohomology` · theorem · `TauCeti.AInfPlan.witt_toric_cohomology`

For finite r, the toric W_r(R_infinity) cohomology has the integral-part and completed nonintegral weight decomposition in Lemma 9.7, with the annihilators used by Lη_[zeta_(p^r)]−1. The resulting cohomology modules have no almost-zero elements where Corollary 3.29 is invoked.

**Hypotheses.** Small framed R; r≥1; finite-level almost setting W_r(m).

**Construction/proof.**

1. Use the finite Witt polynomial weight decomposition.
2. Compute the gamma eigenvalues and apply finite Witt no-almost-zero results.

**Direct prerequisites.** `AInfCohomology:AI.3/toric-perfectoid-cover`, `AInfCohomology:AI.0/witt-polynomial-calculation`, `AInfCohomology:AI.0/no-almost-zero-witt-sections`, `AInfCohomology:AI.1/completed-sum-cohomology`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 9.7; Lemmas 9.8–9.9; printed pp.73–74. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Almost-to-honest décalage criterion

`AInfCohomology:AI.3/almost-to-honest` · lemma · `TauCeti.AInfPlan.almost_to_honest`

Let f∈I be regular in A. If g:C→D induces cohomology maps with I-annihilated kernel/cokernel, and H^i(C) and H^i(C)/f have no nonzero I-annihilated elements for every i, then Lη_f g is an equivalence. The assumptions are on C, not an unsupported assertion about all almost maps.

**Hypotheses.** A commutative ring; ideal I; regular f∈I; source no-almost-zero conditions.

**Construction/proof.**

1. Identify H/H[f] with fH.
2. Prove fH(C)=fH(D) using the absence of I-annihilated elements in H(C)/f.

**Direct prerequisites.** `AInfCohomology:AI.1/decalage-cohomology`.

**Acceptance.** The almost map m→O_C fails the source quotient condition and does not become an integral equivalence after Lη_(zeta_p−1).

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 8.11; printed p.64. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### The A_inf almost comparison criterion

`AInfCohomology:AI.3/ainf-almost-criterion` · lemma · `TauCeti.AInfPlan.ainf_almost_criterion`

For g:C→D between derived p-complete A_inf complexes, Lη_mu g is an equivalence if (i) g mod p is almost an equivalence over O_C^flat, (ii) H^i(Lη_mu g) is injective for every i, and (iii) intersection_{a∈W(m^flat), a divides mu}(mu/a)H^i(C)=mu H^i(C) for every i. W(m^flat) is not treated as an idempotent ideal in A_inf.

**Hypotheses.** All three displayed conditions; derived p-completeness of C,D.

**Construction/proof.**

1. Lift finite Witt almost multipliers and pass through derived p-completion.
2. Use the intersection condition to show that every cokernel class lifts from mu-torsion.

**Direct prerequisites.** `AInfCohomology:AI.1/decalage-cohomology`, `AInfCohomology:AI.0/witt-almost-ideal`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 9.12, printed pp.75–76. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Almost purity comparison for integral toric cochains

`AInfCohomology:AI.3/toric-almost-purity-comparison` · comparison · `TauCeti.AInfPlan.toric_almost_purity_comparison`

Continuous Gamma cochains on the toric perfectoid cover map to pro-finite-étale and pro-étale cohomology. Almost purity gives the finite-level almost comparisons; the toric injectivity and no-almost-zero/intersection estimates upgrade them under Lη to honest integral equivalences.

**Hypotheses.** Smooth framed affine; derived p-complete A_inf coefficients; exact source conditions in the almost criteria.

**Construction/proof.**

1. Use Faltings/Scholze almost purity to identify the almost cone.
2. Verify each independent hypothesis of Lemma 8.11 or 9.12 in the toric model.

**Direct prerequisites.** `PerfectoidSpaces:P3/almost-purity-theorem`, `AInfCohomology:AI.3/toric-cohomology`, `AInfCohomology:AI.3/witt-toric-cohomology`, `AInfCohomology:AI.3/almost-to-honest`, `AInfCohomology:AI.3/ainf-almost-criterion`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), §§8.2–8.3; Theorem 9.4(ii–iii), Lemma 9.13; printed pp.61–76. The displayed export uses this result or construction; the reader records its full hypotheses, normalization and supplier boundary.

#### Framed q-de Rham model

`AInfCohomology:AI.3/q-de-rham-model` · construction · `TauCeti.AOmega.qModel` · Planet: **Framed q-de Rham model**

For a framed torus algebra over A_inf, q=[epsilon], the normalized complex is η_(q−1)K(A_inf<T_i±1>;gamma_i−1), where gamma_i(T_i)=qT_i. In one variable d(T^n)=[n]_q T^n dlog_q T and dlog_q T*f(T)=f(qT)*dlog_q T. The model depends on the framing; it is not a commutative dga.

**Hypotheses.** Chosen framing and compatible roots; the smooth lift and completion are the source ones.

**Construction/proof.**

1. Split integral and nonintegral toric weights after eta.
2. Compute the divided gamma differential on monomials.
3. Check the twisted multiplication rather than assuming strict commutativity.

**Direct prerequisites.** `AInfCohomology:AI.3/toric-almost-purity-comparison`, `AInfCohomology:AI.1/koszul-products-and-cohomology`, `AInfCohomology:AI.0/cyclotomic-coefficients`.

**Uses.** `AInfCohomology:AI.4/de-rham`: The specialized differential is the usual derivative.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AOmega.qModel_monomial` | characterisation | d(T^n)=[n]_q T^n dlog_q T, also for negative n with the Laurent q-integer. |
| `TauCeti.AOmega.qModel_product` | relation | dlog_q T*f(T)=f(qT)*dlog_q T. |
| `TauCeti.AOmega.qModel_tensor` | compatibility | Several coordinates use the signed tensor product of one-variable models. |
| `TauCeti.AOmega.qModel_comparison` | equivalence | The framed model computes the sheaf AΩ on the small affine. |
| `TauCeti.AOmega.qModel_q_one` | compatibility | At q=1 the formula specializes to the ordinary de Rham differential after eligible derived coefficient change. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AOmega.qModel_test_T` | computation | d(T)=T dlog_q T. |
| `TauCeti.AOmega.qModel_test_T2` | computation | d(T²)=(1+q)T² dlog_q T. |
| `TauCeti.AOmega.qModel_test_noncommutative` | non-example | For q≠1, dlog_q T*T=qT*dlog_q T, so a strictly commutative product is wrong. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Example 7.7, Remark 7.8; §9 toric description; printed p.58. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Framing independence and sheaf descent

`AInfCohomology:AI.3/framing-independence-and-descent` · theorem · `TauCeti.AInfPlan.framing_independence_and_descent`

The toric, profinite-étale and pro-étale AΩ complexes on a small smooth affine map equivalently to RΓ(mathfrak X,AΩ). Their canonical comparisons imply independence of framing, étale restriction and descent for general smooth formal schemes.

**Hypotheses.** Small affine comparisons first; descent and limit conditions from the shared enhancement.

**Construction/proof.**

1. Prove étale base change at finite Witt level.
2. Use Scholze Lemma 3.18 with explicit acyclic-basis and Mittag-Leffler hypotheses for the sheaf limits.
3. Pass to p-complete A_inf and glue via the common sheaf object.

**Direct prerequisites.** `AInfCohomology:AI.3/aomega`, `AInfCohomology:AI.3/toric-almost-purity-comparison`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`, `AInfCohomology:AI.0/witt-etale-base-change`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 9.9, printed p.74; Lemmas 9.13–9.15, pp.76–78; Theorem 9.4(iii), pp.70–71. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### AΩ Frobenius and completeness

`AInfCohomology:AI.3/aomega-frobenius` · theorem · `TauCeti.AInfPlan.aomega_frobenius`

Frobenius gives phi^*AΩ≃Lη_tilde-xi AΩ and thus a map phi^*AΩ→AΩ that becomes an equivalence after tilde-xi inversion. AΩ is derived (p,xi)-complete; its coherent multiplication is obtained in the enhancement.

**Hypotheses.** Smooth formal O_C-scheme; local boundedness and regular coefficients.

**Construction/proof.**

1. Check phi(mu)=mu*tilde-xi in the toric calculation.
2. Use composition of eta and local descent to get the factorization.
3. Use finite reductions and derived completeness detection.

**Direct prerequisites.** `AInfCohomology:AI.3/q-de-rham-model`, `AInfCohomology:AI.1/decalage-composition`, `AInfCohomology:AI.1/preservation-derived-completeness`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), §9, printed pp.69–79; Theorem 1.10, pp.7–8; Theorem 14.3, pp.119–120. Frobenius factorization through eta_(tilde-xi), with the linearized tilde-xi localization.

#### Failure of a strictly commutative q-model

`AInfCohomology:AI.3/enhanced-noncommutative-regression` · application · `TauCeti.AInfPlan.enhanced_noncommutative_regression`

The E_infinity q-de Rham algebra in characteristic two cannot in general be represented by a commutative dga: in the source example Sq^0 on the degree-one q-log class is nonzero. The twisted cochain product is retained; E_infinity enhancement is the multiplicative target.

**Hypotheses.** A=F_2[q±1], R=A[T±1], q-variable as in Remark 7.8.

**Construction/proof.**

1. Import coherent algebra objects and Steenrod operations from the enhancement supplier.
2. Use the map to group cochains and the Frobenius-semilinearity of Sq^0 to detect the nonzero image.

**Direct prerequisites.** `AInfCohomology:AI.3/q-de-rham-model`, `AInfCohomology:AI.1/decalage-products`, `EnhancedDerivedSheaves:E5`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Remark 7.8 (E1=Lη_(q−1) E2 correction PAPER-BHATT-MORROW-SCHOLZE-18/E6); printed p.58. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

### AInfCohomology:AI.4

Coverage: **planned**.

Refinements: Refine full F-V-procomplex multiplication/coherence and the all-coordinate PD comparison; resolve the exact agreement of BLM and absolute crystalline comparison maps.

#### Hodge–Tate specialization

`AInfCohomology:AI.4/hodge-tate` · theorem · `TauCeti.AInfPlan.hodge_tate` · Planet: **Hodge–Tate specialization**

AΩ tensor^L_(A_inf,tilde-theta) O_C≃tilde-Omega:=Lη_(zeta_p−1) Rnu_* hat O_X^+. Its cohomology sheaves are Omega^i_(mathfrak X/O_C),cont{−i}; the comparison is canonical and multiplicative, not an arbitrary splitting of the graded object.

**Hypotheses.** Smooth p-adic formal O_C-scheme; continuous differentials; tilde-theta scalar extension.

**Construction/proof.**

1. Check the tilde-theta reduction of the q-Koszul calculation.
2. Use the almost-to-honest criterion and coordinate-free cotangent map to identify the degree-one generator.
3. Use exterior products and descent for all degrees.

**Direct prerequisites.** `AInfCohomology:AI.3/aomega`, `AInfCohomology:AI.3/toric-cohomology`, `AInfCohomology:AI.3/almost-to-honest`, `AInfCohomology:AI.0:integral/breuil-kisin-line`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorems 8.3,8.7 and 9.2(i); printed pp.61–69. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Cotangent description of the first Hodge–Tate truncation

`AInfCohomology:AI.4/hodge-tate-cotangent` · comparison · `TauCeti.AInfPlan.hodge_tate_cotangent`

For small smooth R, the canonical transitivity map induces Lhat_(R/Z_p)[−1]{−1}≃τ≤1 tilde-Omega_R. In degree zero it is R and in degree one Omega^1_(R/O_C),cont{−1}.

**Hypotheses.** Small formally smooth R; p-completed cotangent complex; source cohomological shifts.

**Construction/proof.**

1. Construct the transitivity map on the perfectoid cover.
2. Use the unique-factorization lemma and the Fontaine dlog normalization to factor it through eta.

**Direct prerequisites.** `AInfCohomology:AI.4/hodge-tate`, `AInfCohomology:AI.0:integral/completed-cotangent-twist`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Remark 8.4, printed pp.61–62; Proposition 8.15, pp.66–67. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Factorization criterion through connective décalage

`AInfCohomology:AI.4/eta-factorization-criterion` · lemma · `TauCeti.AInfPlan.eta_factorization_criterion`

If C∈D≤1(A), D∈D≥0(A), H^0(D) is f-torsion-free and f is regular, a map C→D factors through Lη_f D in at most one way. It factors exactly when H^1(C tensor^L A/f)→H^1(D tensor^L A/f) is zero, equivalently H^1(C)→H^1(D) factors through fH^1(D).

**Hypotheses.** The stated t-structure bounds and H^0 regularity are essential.

**Construction/proof.**

1. Compute the distinguished triangle Lη_f D→D→H^1(D/f)[−1] after truncating D.
2. Apply Hom(C,−); the preceding Hom vanishes by the t-structure bounds.

**Direct prerequisites.** `AInfCohomology:AI.1/connective-comparison`, `AInfCohomology:AI.1/decalage-cohomology`, `mathlib:DerivedCategory`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 8.16, printed pp.66–68. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Hodge–Tate extension and lifting obstruction

`AInfCohomology:AI.4/hodge-tate-lifting-obstruction` · comparison · `TauCeti.AInfPlan.hodge_tate_lifting_obstruction`

Under the cotangent identification, the extension class of τ≤1 tilde-Omega_R is the obstruction to lifting R to A_inf/(tilde-xi²), with the source twist and normalization. A chosen lift gives the corresponding splitting; existence of a canonical splitting is not asserted for every R.

**Hypotheses.** Smooth p-adic formal O_C-scheme, with the local statement on a small smooth R; the square-zero tilde-theta thickening; obstruction in Ext² of continuous differentials with the conormal line.

**Construction/proof.**

1. Use cotangent transitivity for A_inf/(tilde-xi²)→O_C.
2. Identify the connecting morphism with the square-zero lifting obstruction and compare the conormal line.

**Direct prerequisites.** `AInfCohomology:AI.4/hodge-tate-cotangent`, `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/derivations-cotangent-comparison`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Remark 8.4, printed pp.61–62; Proposition 8.15, pp.66–67. The following paragraph identifies the Ext² class with the obstruction to lifting to A_inf/(tilde-xi²). Proposition 8.17 is instead the torus dlog computation used in proving Proposition 8.15.

#### Local Künneth and multiplicativity

`AInfCohomology:AI.4/local-kunneth` · comparison · `TauCeti.AInfPlan.local_kunneth`

For two small smooth O_C-algebras R_1,R_2 and their completed tensor product R, the completed tensor maps for tilde-Omega and AΩ are equivalences; finite Witt reductions satisfy the compatible source tensor comparison. These are maps of coherent multiplicative objects.

**Hypotheses.** Smoothness, completed products and eligible bounded/perfect coefficient extensions as in Proposition 8.14 and Lemmas 9.16,9.18.

**Construction/proof.**

1. Use a product framing and the continuous Koszul tensor calculation.
2. Apply valuation monoidality and same-ideal completion where justified.
3. Prove finite-level tensor exchange with the source Tor conditions.

**Direct prerequisites.** `AInfCohomology:AI.4/hodge-tate`, `AInfCohomology:AI.3/framing-independence-and-descent`, `AInfCohomology:AI.1/valuation-monoidality`, `DerivedDeRhamCohomology:DD.1/completed-filtered-tensor`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 8.14, printed pp.65–66; Lemmas 9.16 and 9.18, pp.78–79. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Finite Witt specialization of AΩ

`AInfCohomology:AI.4/finite-witt-specialization` · comparison · `TauCeti.AInfPlan.finite_witt_specialization`

For r≥1, AΩ tensor^L_(A_inf,tilde-theta_r) W_r(O_C)≃tilde-W_r-Omega:=L_eta_([zeta_(p^r)]−1) Rnu_* W_r(hat O_X^+), compatibly on framed affines and after sheaf descent. The subsequent cohomology identification with relative de Rham–Witt is the separate relative-witt-comparison node; it is not used to prove this early finite reduction.

**Hypotheses.** Smooth formal scheme; r≥1; derived scalar extension and continuous relative de Rham–Witt.

**Construction/proof.**

1. Prove the finite coefficient reduction comparison on framed affines by the special nonflat eta/base-change criterion and explicit toric injectivity estimates.
2. Descend the compatible canonical finite Witt maps via the common sheaf construction.

**Direct prerequisites.** `AInfCohomology:AI.0/theta-witt-family`, `AInfCohomology:AI.3/witt-toric-cohomology`, `AInfCohomology:AI.3/framing-independence-and-descent`, `AInfCohomology:AI.1/flat-and-nonflat-base-change`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 9.2(ii); Theorem 9.4(i–iii). Theorem 9.4(iv)/11.1 is exported separately by relative-witt-comparison.; printed pp.69–86. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Witt Bockstein precomplex

`AInfCohomology:AI.4/fv-precomplex` · construction · `TauCeti.AOmega.wittPre`

For a commutative algebra object D over A_inf(S), with D and D/xi connective and a Frobenius automorphism, set W_r^n(D)_pre=H^n(D tensor^L A_inf/(tilde-xi_r)). The differential is the Bockstein, and F,V,R have the source coefficient-twisted definitions. This precomplex may contain nonintegral-weight torsion.

**Hypotheses.** D is a commutative algebra object in D(A_inf(S)) with phi-semilinear automorphism and H^i(D)=H^i(D tensor^L A_inf/(xi))=0 for i<0; equivalently D and D/xi are connective. Integral perfectoid S with the source chosen xi normalized so theta_r(xi)=V(1) for every r≥1. The initial precomplex is graded-anticommutative; odd squares need not vanish until the improvement hypotheses are imposed.

**Construction/proof.**

1. Define finite coefficient cohomology and its Bockstein.
2. Transport F,V,R through the finite Witt coefficient maps and Frobenius on D.

**Direct prerequisites.** `AInfCohomology:AI.0/witt-kernel-generators`, `AInfCohomology:AI.1/bockstein-differential`, `CrystallineCohomology:CR.4/relative-witt-complex`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `AInfCohomology:AI.0/theta-witt-family`.

**Uses.** `AInfCohomology:AI.4/fv-improved-complex`: The improved object maps into this precomplex.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AOmega.wittPre_term` | projection | W_r^n(D)_pre=H^n(D/tilde-xi_r). |
| `TauCeti.AOmega.wittPre_d` | characterisation | The differential is the coefficient Bockstein. |
| `TauCeti.AOmega.wittPre_FVR` | compatibility | RF=FR, RV=VR, FV=p, FdV=d; VF uses V(1), not automatically p. |
| `TauCeti.AOmega.wittPre_lambda` | universal-property | A family lambda_r:W_r(B)→W_r^0(D)_pre preserving the unit, multiplication and coefficient maps, compatible with F,V,R and satisfying F(d lambda_r([b]))=lambda_(r-1)([b^(p-1)]) d lambda_(r-1)([b]), induces a unique compatible family of relative de Rham–Witt maps. Require odd squares to vanish when using the relative F-V-procomplex universal property; this is a genuine extra condition for the unimproved precomplex. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AOmega.wittPre_test_degree_zero` | computation | W_r^0(D)_pre=H^0(D/tilde-xi_r). |
| `TauCeti.AOmega.wittPre_test_point` | compatibility | For D=A_inf, it is W_r(S) in degree zero. |
| `TauCeti.AOmega.wittPre_test_torsion` | non-example | On the toric nonintegral weight summands the precomplex has torsion that the improved construction removes. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 11.2 and §11.1.1; printed p.86. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Improved Witt Bockstein complex

`AInfCohomology:AI.4/fv-improved-complex` · construction · `TauCeti.AOmega.wittImproved`

Set W_r^n(D)=H^n((Lη_mu D) tensor^L A_inf/(tilde-xi_r)). Under Assumption 11.4 (p-torsion-free W_r^n(D) for every r≥1,n≥0; at p=2 this forces the odd squares to vanish), this is a relative F-V-procomplex with d,F,R,V and multiplication. The injection into the precomplex has the source scaled image; R is constructed using eta_(phi(mu)) and inverse Frobenius.

**Hypotheses.** D and D/xi are connective; D is an enhanced commutative algebra over A_inf(S) with phi-semilinear automorphism and H^0(D) mu-torsion-free. S p-torsion-free integral perfectoid with the chosen compatible primitive roots. Assumption 11.4: W_r^n(D) is p-torsion-free for every r≥1,n≥0; for p=2 this also forces odd squares to vanish.

**Construction/proof.**

1. Apply eta before the finite quotient and define the Bockstein.
2. Prove injection into the precomplex with the bounded comparison maps.
3. Construct R on regular representatives, correcting the source eta_(phi(mu)) target.

**Direct prerequisites.** `AInfCohomology:AI.4/fv-precomplex`, `AInfCohomology:AI.1/decalage-composition`, `AInfCohomology:AI.1/truncation-comparison-maps`.

**Uses.** `AInfCohomology:AI.4/relative-witt-comparison`: This F-V-procomplex is the target of the universal comparison map.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AOmega.wittImproved_term` | projection | W_r^n(D)=H^n((Lη_mu D)/tilde-xi_r). |
| `TauCeti.AOmega.wittImproved_inclusion` | constructor | The map to W_r^n(D)_pre is injective under Assumption 11.4. |
| `TauCeti.AOmega.wittImproved_FVR` | compatibility | The induced F,V,R obey the F-V-procomplex identities. |
| `TauCeti.AOmega.wittImproved_restriction` | characterisation | R is induced by multiplication by tilde-xi^n, eta_(phi(mu)) and inverse Frobenius. |
| `TauCeti.AOmega.wittImproved_universal_map` | universal-property | Under Assumption 11.4, a unit-preserving multiplicative family lambda_r:W_r(B)→W_r^0(D), compatible with F,V,R and the Teichmuller differential identity, extends uniquely to relative de Rham–Witt maps in every degree. The improved p-torsion-free hypotheses imply the odd-square condition, including at p=2. Uniqueness and all F,V,R/lambda compatibilities are part of the export. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AOmega.wittImproved_test_point` | compatibility | For D=A_inf the improved and precomplex agree in degree zero. |
| `TauCeti.AOmega.wittImproved_test_weight` | non-example | Toric nonintegral weights removed by eta cannot be reintroduced by using the precomplex. |
| `TauCeti.AOmega.wittImproved_test_r1` | compatibility | At r=1 the source differential is the Bockstein, not a zero differential on the graded modules. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Assumption 11.4; Proposition 11.5; Remark 11.6; printed pp.89–90. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Torus realization of the improved Witt complex

`AInfCohomology:AI.4/torus-witt-realization` · comparison · `TauCeti.AInfPlan.torus_witt_realization`

For D=RΓ(Z^d,A_inf[U_i±1/p^infinity]), the improved W_r^n(D) is p-torsion-free and canonically W_r Omega^n_(O_C[T_i±1]/O_C), compatible with d,F,R,V and multiplication. The degree-zero lambda has domain W_r(O_C[T_i±1]) and sends [T_i] to U_i^(p^r) in the source coordinate normalization.

**Hypotheses.** Uncompleted torus calculation first; no replacement of W_r(O[T]) by W_r(O)[T].

**Construction/proof.**

1. Compute eta on every weight by Lemma 7.9.
2. Use Lemmas 11.9 and 11.14 for the finite Witt weight decomposition.
3. Construct corrected lambda and reduce to the perfect residue field with the corrected Tor-independence statement.

**Direct prerequisites.** `AInfCohomology:AI.4/fv-improved-complex`, `AInfCohomology:AI.3/q-de-rham-model`, `AInfCohomology:AI.0/witt-polynomial-calculation`, `CrystallineCohomology:CR.4/torus-integral-part`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 11.8; Lemmas 11.9,11.11,11.14,11.16; Corollary 11.12; Theorem 11.13; printed pp.91–93. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Relative de Rham–Witt comparison

`AInfCohomology:AI.4/relative-witt-comparison` · theorem · `TauCeti.AInfPlan.relative_witt_comparison` · Planet: **Relative de Rham–Witt comparison**

The universal F-V-procomplex maps give H^i(tilde-W_r-Omega_R)≅W_r Omega^i_(R/O_C),cont{−i} for i≥0. For r≥1,s≥0, the Bockstein complex after the correct W_r(O_C)/p^s base change agrees with the relative Witt dga in Proposition 11.17. The relative Witt objects and their Cartier theory are imported from CR.4.

**Hypotheses.** Small smooth p-complete R; r≥1; source finite-level Tor-independence and ordinary p-completion of the continuous relative Witt terms.

**Construction/proof.**

1. Extend the torus comparison by étale base change.
2. Use the source completed coefficient exchange and Bockstein compatibility.
3. Descend as sheaves, retaining all twists.

**Direct prerequisites.** `AInfCohomology:AI.4/torus-witt-realization`, `AInfCohomology:AI.0/witt-etale-base-change`, `CrystallineCohomology:CR.4/perfectoid-base-change`, `CrystallineCohomology:CR.4/continuous-relative-witt`, `AInfCohomology:AI.4/finite-witt-specialization`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 11.1; §11.3; Proposition 11.17; printed pp.86–95. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### De Rham specialization

`AInfCohomology:AI.4/de-rham` · theorem · `TauCeti.AInfPlan.de_rham` · Planet: **De Rham specialization**

AΩ tensor^L_(A_inf,theta) O_C≃Omega^bullet_(mathfrak X/O_C),cont as multiplicative complexes. The ordinary de Rham differential is recovered by the appropriate Bockstein after the Frobenius/eta_(tilde-xi) identification; this theta statement is different from the tilde-theta Hodge–Tate graded cohomology description.

**Hypotheses.** Smooth p-adic formal scheme; derived theta extension; source Frobenius normalization.

**Construction/proof.**

1. Use phi^*AΩ≃Lη_tilde-xi AΩ and reduce the latter along tilde-theta.
2. Identify the Bockstein on the degree-one cotangent generator with the ordinary derivation.

**Direct prerequisites.** `AInfCohomology:AI.4/hodge-tate`, `AInfCohomology:AI.3/aomega-frobenius`, `AInfCohomology:AI.1/bockstein-reduction`, `AInfCohomology:AI.4/relative-witt-comparison`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 1.10, printed pp.7–8; Theorem 12.1 and discussion, pp.96–98. Theta specialization to completed de Rham cohomology, distinguished from the tilde-theta Hodge–Tate reduction.

#### Bounded divided-power coefficient subrings

`AInfCohomology:AI.4/bounded-pd-coefficients` · lemma · `TauCeti.AInfPlan.bounded_pd_coefficients`

Define A_crys^(m) as the p-adic completion of the A_inf-subalgebra of A_crys generated by xi^j/j! for 0≤j≤m. A_crys is the p-completion of colim_m A_crys^(m). For m≥p², tilde-xi_r=p^r times a unit and Lemma 12.2 holds in A_crys^(m); the filtrations ({a | mu*a belongs to p^s A_crys^(m)})_s and (p^s A_crys^(m))_s are intertwined, and intersection_r (mu/phi^(-r)(mu))A_crys^(m)=mu A_crys^(m). In particular the bounded quotient by mu is p-adically separated; the unbounded A_crys/mu is not assumed separated.

**Hypotheses.** Cyclotomic A_inf over O_C, completed integral PD coefficients; m≥p² and r≥1.

**Construction/proof.**

1. Establish Lemma 12.2 in the bounded subring and the unit formula for tilde-xi_r.
2. Descend the topology estimate to the noetherian bounded PD algebra over A_0=Z_p[[T]], with T mapping to [epsilon]^(1/p); use Artin–Rees and topological freeness over A_0.
3. Reduce the intersection statement modulo (mu,p^s), then to the tilt valuation calculation, before taking the separated inverse limit.

**Direct prerequisites.** `CrystallineCohomology:CR.0/fontaine-envelope`, `AInfCohomology:AI.0/period-regularity`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 12.8(i–iii), printed pp.100–101; Lemma 12.2, pp.96–97. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Toric décalage after crystalline coefficient change

`AInfCohomology:AI.4/pd-toric-eta-comparison` · comparison · `TauCeti.AInfPlan.pd_toric_eta_comparison`

For the toric complex, eta_mu after completed extension to A_crys^(m) compares equivalently with the extended q-de Rham model for m≥p². The bounded-coefficient annihilation and injectivity estimates justify this particular exchange; no unrestricted eta/base-change commutation is used.

**Hypotheses.** Small framed smooth R; bounded PD coefficients; source completion and regularity conditions.

**Construction/proof.**

1. Recompute every weight with the bounded PD estimates.
2. Use the almost-comparison criterion and finite reduction injectivity.
3. Use Lemma 12.8(iv) for each m≥p², and (v) for the all-coordinate comparison map before p-completing the filtered colimit.

**Direct prerequisites.** `AInfCohomology:AI.4/bounded-pd-coefficients`, `AInfCohomology:AI.3/ainf-almost-criterion`, `AInfCohomology:AI.3/q-de-rham-model`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 12.8(iv–v); Lemmas 12.4,12.6 and Corollaries 12.5,12.7; printed pp.97–100. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Crystalline logarithmic coordinate change

`AInfCohomology:AI.4/pd-logarithmic-coordinate` · lemma · `TauCeti.AInfPlan.pd_logarithmic_coordinate`

In the eligible bounded PD extension, log([epsilon])=log(1+mu) is mu times a unit, so the q-Koszul operators compare with ordinary logarithmic de Rham operators. The coordinate is log([epsilon]), not log(mu).

**Hypotheses.** PD convergence and bounded-subring hypotheses of Corollary 12.7.

**Construction/proof.**

1. Expand log(1+mu) by its convergent PD series.
2. Compare the gamma action and ordinary logarithmic derivation using this unit.

**Direct prerequisites.** `AInfCohomology:AI.4/pd-toric-eta-comparison`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 12.2(iii), Lemma 12.8(i), and Corollary 12.7 (correction PAPER-BHATT-MORROW-SCHOLZE-18/E15); printed pp.96–100. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Absolute A_crys comparison

`AInfCohomology:AI.4/absolute-crystalline-comparison` · theorem · `TauCeti.AInfPlan.absolute_crystalline_comparison` · Planet: **Absolute crystalline comparison**

There is a functorial multiplicative equivalence AΩ completed-tensor^L A_crys≃Ru_* O_crys for the absolute crystalline site of mathfrak X_(O_C/p) over A_crys. The all-coordinate PD-envelope construction and its cocycle comparisons make the framed maps presentation-independent.

**Hypotheses.** Smooth formal O_C-scheme; absolute crystalline base A_crys and its PD ideal; derived p-completion.

**Construction/proof.**

1. Use the corrected PD envelope of A_0→A_0/xi_0 in Lemma 12.8.
2. Identify the toric comparison map by Proposition 12.9.
3. Add all coordinates and use the PD universal property to prove common refinements and descent.

**Direct prerequisites.** `AInfCohomology:AI.4/pd-toric-eta-comparison`, `AInfCohomology:AI.4/pd-logarithmic-coordinate`, `CrystallineCohomology:CR.2/embedding-computation`, `CrystallineCohomology:CR.2/embedding-independence`, `CrystallineCohomology:CR.2/crystalline-cohomology`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 12.1, printed pp.96–98; Lemma 12.8, pp.100–101; Proposition 12.9, pp.102–103. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Derived crystalline special-fiber specialization

`AInfCohomology:AI.4/crystalline-witt-special-fiber` · comparison · `TauCeti.AInfPlan.crystalline_witt_special_fiber`

Further derived extension of the absolute A_crys comparison along A_crys→W(k), with its correct Frobenius scalar map, gives crystalline cohomology of mathfrak X_k. The identification uses CR.3 base change and relative/absolute Witt comparison; ordinary degreewise tensor is not substituted.

**Hypotheses.** Smooth formal scheme; source Tor/derived completion conditions.

**Construction/proof.**

1. Apply the crystalline base-change theorem to the common PD map.
2. Identify the special-fiber model and Frobenius through CR.4.

**Direct prerequisites.** `AInfCohomology:AI.4/absolute-crystalline-comparison`, `CrystallineCohomology:CR.3/derived-base-change`, `CrystallineCohomology:CR.4/crystalline-comparison`, `AInfCohomology:AI.0:integral/residue-map`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 1.10, printed pp.7–8; §12, pp.96–103; Theorem 14.3, pp.119–120. Derived crystalline/W(k) specialization of the smooth special fiber.

#### Agreement with the saturated de Rham–Witt route

`AInfCohomology:AI.4/blm-crystalline-route` · comparison · `TauCeti.AInfPlan.blm_crystalline_route`

The BLM saturated-de-Rham–Witt crystalline comparison for the smooth special fiber agrees with the AΩ crystalline map, including Frobenius and cup products. AI.1 supplies Lη_p completion and Bockstein; CR.4 supplies saturated complexes, Cartier/Nygaard theory and their crystalline equivalence.

**Hypotheses.** Smooth characteristic-p special fiber; the multiplicative comparison maps, not just an abstract isomorphism of groups.

**Construction/proof.**

1. Compare the degree-zero universal Witt maps and Bockstein normalization.
2. Request the precise agreement of BLM §10.3 maps with the all-coordinate AΩ construction from CR.4; record this proof-audit boundary as a gap.

**Direct prerequisites.** `AInfCohomology:AI.4/crystalline-witt-special-fiber`, `AInfCohomology:AI.1/dieudonne-consumer-contract`, `CrystallineCohomology:CR.4/leta-fixed-point`, `CrystallineCohomology:CR.4/crystalline-comparison`, `CrystallineCohomology:CR.4`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [blm](https://www.math.ias.edu/~lurie/papers/Crystalline.pdf), Theorem 10.2.1, printed p.128; §§10.3–10.4 and Theorem 10.4.4, pp.129–138. Saturated crystalline realization; identification with the other canonical comparison remains the explicit CR.4 map-agreement request.

#### Mu-inverted étale specialization

`AInfCohomology:AI.4/mu-inverted-etale` · theorem · `TauCeti.AInfPlan.mu_inverted_etale` · Planet: **Mu-inverted étale specialization**

For a smooth formal scheme mathfrak X over O_C, with analytic generic fiber X and nu:X_proet→mathfrak X_Zar, AΩ tensor A_inf[1/mu]≃(Rnu_* A_inf,X) tensor A_inf[1/mu], compatibly with multiplication. This is the local pro-etale A_inf-sheaf comparison of Theorem 14.1(iv). The comparison with RΓ_et(X,Z_p) is the separate proper theorem in AI.5/global-etale.

**Hypotheses.** C perfectoid of characteristic zero with compatible primitive p-power roots; mathfrak X smooth over O_C. A_inf,X is the derived p-completed Witt sheaf.

**Construction/proof.**

1. Invert mu in the defining L_eta_mu complex; eta becomes the identity after its parameter is a unit.
2. Use the natural comparison map to Rnu_* A_inf,X and retain the source derived sheaf. No primitive proper comparison is used locally.

**Direct prerequisites.** `AInfCohomology:AI.3/aomega`, `AInfCohomology:AI.1/connective-comparison`, `AInfCohomology:AI.3/derived-ainf-sheaf`, `EnhancedDerivedSheaves:E4/derived-complete-sheaves`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 1.10, printed pp.7–8; §9, pp.69–79; Theorem 14.3, pp.119–120. Local sheaf comparison after mu inversion, before taking proper global sections.

### AInfCohomology:AI.5

Coverage: **planned**.

Refinements: Refine the lower-tier DD.5 coefficient-free proper de Rham perfectness application and global tensor exchange; resolve the early primitive integral comparison supplier contract and adjacent-degree Tor arguments. Resolve the section-dependent non-Noetherian A_crys rational crystalline bridge of Proposition 13.21; the current CR.3 isogeny statement alone is insufficient.

#### Proper A_inf cohomology complex

`AInfCohomology:AI.5/proper-ainf-complex` · construction · `TauCeti.AOmega.proper` · Planet: **Proper A_inf cohomology**

For smooth proper mathfrak X/O_C set RΓ_Ainf(mathfrak X)=RΓ(mathfrak X,AΩ_mathfrak X) in the common enhancement. It carries functorial cup products and linearized Frobenius, and its cohomology modules are denoted H_Ainf^i.

**Hypotheses.** Smooth proper p-adic formal O_C-scheme; the common AΩ sheaf and derived global sections.

**Construction/proof.**

1. Apply enhanced derived global sections to the canonical sheaf AΩ.
2. Transport the coherent product and Frobenius factorization.

**Direct prerequisites.** `AInfCohomology:AI.3/aomega`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Uses.** `AInfCohomology:AI.5/global-bkf`: Finite cohomology modules with Frobenius become BKF modules. `CohomologyComparisons:CP.5`: Consumes the torsion and lattice interfaces.

| API declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.AOmega.proper_cohomology` | projection | H_Ainf^i=H^i(RΓ_Ainf). |
| `TauCeti.AOmega.proper_pullback` | functoriality | Formal morphisms induce pullback maps compatible with cup products. |
| `TauCeti.AOmega.proper_cup` | structure | The unit and cup products come from the enhanced AΩ algebra. |
| `TauCeti.AOmega.proper_frobenius` | constructor | Linearized phi on RΓ_Ainf becomes an equivalence after tilde-xi inversion. |
| `TauCeti.AOmega.proper_base_change` | compatibility | Eligible proper smooth coefficient change uses derived scalar extension with the specified completion. |

| Unit test | Kind | Required behavior |
| --- | --- | --- |
| `TauCeti.AOmega.proper_test_point` | computation | RΓ_Ainf(Spf O_C)=A_inf in degree 0. |
| `TauCeti.AOmega.proper_test_projective_line` | compatibility | The expected degree 0 and degree 2 lines for formal P^1 carry the unit and inverse degree twist. |
| `TauCeti.AOmega.proper_test_torsion` | non-example | Perfectness of the complex does not assert that all H_Ainf^i are finite free. |

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), §14, Theorem 1.8; printed p.5. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Perfectness of proper A_inf cohomology

`AInfCohomology:AI.5/proper-perfectness` · theorem · `TauCeti.AInfPlan.proper_perfectness` · Planet: **Perfectness of proper A_inf cohomology**

RΓ_Ainf is a perfect A_inf complex. It is derived xi-complete and its theta reduction is the proper de Rham complex, which is perfect over O_C; the lifted bounded finite-projective criterion proves perfectness over A_inf.

**Hypotheses.** Smooth proper formal O_C-scheme; derived completeness and finite-reduction criterion from E4/DD.1.

**Construction/proof.**

1. Import the lower-tier coefficient-free proper smooth de Rham perfectness theorem DD.5/proper-smooth-cohomological-control. Its finite-level Hodge filtration and compatible perfect-complex lifting apply over O_C without a Noetherian hypothesis.
2. Lift a bounded finite-projective complex through the regular xi-adic tower.
3. Use completeness to identify the lift.

**Direct prerequisites.** `AInfCohomology:AI.5/proper-ainf-complex`, `AInfCohomology:AI.3/aomega-frobenius`, `AInfCohomology:AI.4/de-rham`, `EnhancedDerivedSheaves:E4/mod-ideal-detection`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.5/proper-smooth-cohomological-control`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 14.3(i) and proof, printed pp.119–120. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Proper de Rham specialization

`AInfCohomology:AI.5/global-de-rham` · comparison · `TauCeti.AInfPlan.global_de_rham`

RΓ_Ainf tensor^L_(A_inf,theta) O_C≃RΓ_dR(mathfrak X/O_C), with cup products and functoriality. Perfect coefficient exchange justifies globalizing the local comparison.

**Hypotheses.** Proper smooth; derived scalar extension.

**Construction/proof.**

1. Use perfect tensor exchange with derived global sections and the local de Rham comparison.

**Direct prerequisites.** `AInfCohomology:AI.5/proper-perfectness`, `AInfCohomology:AI.4/de-rham`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 14.3; printed p.119. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Proper A_crys specialization

`AInfCohomology:AI.5/global-acrys` · comparison · `TauCeti.AInfPlan.global_acrys`

RΓ_Ainf completed-tensor^L A_crys≃RΓ_crys(mathfrak X_(O_C/p)/A_crys), compatibly with Frobenius and products. Bounded divided-power Frobenius diagrams use phi^r-twisted coefficient subrings A_crys^(m), as corrected in Theorem 14.1.

**Hypotheses.** Proper smooth; derived p-completion; explicit Frobenius scalar twisting.

**Construction/proof.**

1. Globalize the all-coordinate local equivalence via proper perfect tensor exchange.
2. Track phi^r on each bounded coefficient stage before the colimit.

**Direct prerequisites.** `AInfCohomology:AI.5/proper-perfectness`, `AInfCohomology:AI.4/absolute-crystalline-comparison`, `CrystallineCohomology:CR.3/derived-base-change`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorems 14.1 and 14.3 (PAPER-BHATT-MORROW-SCHOLZE-18/E18); printed pp.118–119. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Proper Witt special-fiber specialization

`AInfCohomology:AI.5/global-witt` · comparison · `TauCeti.AInfPlan.global_witt`

RΓ_Ainf tensor^L A_inf W(k)≃RΓ_crys(mathfrak X_k/W(k)), using the fixed Witt residue map. It respects semilinear Frobenius and cup products; torsion remains in the derived object.

**Hypotheses.** Proper smooth; perfect complex; k perfect.

**Construction/proof.**

1. Apply crystalline derived base change along the common A_crys→W(k) map.

**Direct prerequisites.** `AInfCohomology:AI.5/global-acrys`, `AInfCohomology:AI.4/crystalline-witt-special-fiber`, `CrystallineCohomology:CR.3/derived-base-change`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 14.3; printed p.119. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Proper mu-inverted étale comparison

`AInfCohomology:AI.5/global-etale` · comparison · `TauCeti.AInfPlan.global_etale`

RΓ_Ainf[1/mu]≃RΓ_et(X,Z_p) tensor_Z_p A_inf[1/mu] for the analytic generic fiber X; proper finite étale cohomology allows the final source simplification of completion. The integral primitive A_inf comparison is requested as an early primitive-comparison extension of P8:local-rational, independent of its subsequent proper rational suffix.

**Hypotheses.** Smooth proper formal scheme; actual generic-fiber p-adic étale cohomology; primitive comparison theorem as in BMS1 Theorem 5.7.

**Construction/proof.**

1. Use the primitive comparison with A_inf coefficients and invert the almost parameter.
2. Use proper finiteness to exchange finite cohomology and the required coefficient completion.

**Direct prerequisites.** `AInfCohomology:AI.5/proper-perfectness`, `AInfCohomology:AI.4/mu-inverted-etale`, `PadicHodgeTheory:P8:local-rational`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 5.7; Theorem 14.3; printed pp.47–119. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Primitive rational crystalline Frobenius input

`AInfCohomology:AI.5/rational-crystalline-frobenius` · lemma · `TauCeti.AInfPlan.rational_crystalline_frobenius`

Fix a section k→O_C/p. For Y=mathfrak X_(O_C/p) with mathfrak X proper smooth, there is a canonical phi-equivariant isomorphism H_crys^i(Y/A_crys)[1/p]≅H_crys^i(mathfrak X_k/W(k)) tensor_W(k) A_crys[1/p]. In particular the left side is finite free over A_crys[1/p], hence its B_crys^+ realization is free as required by Corollary 4.20. This is BMS1 Proposition 13.21, requested from CR.3 as an early Berthelot–Ogus bridge; it is not a consequence of the existing rational-frobenius node alone.

**Hypotheses.** C complete algebraically closed of characteristic zero, residue field k, and a specified section k→O_C/p. mathfrak X proper smooth over O_C; use the specified section-induced W(k)→A_crys map.

**Construction/proof.**

1. Request the non-Noetherian A_crys version of rational Frobenius bijectivity for qcqs smooth O_C/p-schemes, using affine reduction and descent along p^(1/p^n) thickenings to the residue field.
2. Iterate Frobenius-twisted crystalline base change. Use finite presentation to descend Y to its special fiber modulo p^(1/p^n); after enlarging n the choices agree.
3. Apply proper crystalline finiteness over W(k) and extend to A_crys[1/p] and B_crys^+. Retain the fixed residue-field section and do not assume H_Ainf[1/p] free beforehand.

**Direct prerequisites.** `AInfCohomology:AI.5/global-acrys`, `CrystallineCohomology:CR.3/derived-base-change`, `CrystallineCohomology:CR.3:Frobenius-isogeny/rational-frobenius`, `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Proposition 13.21, printed pp.116–117; Theorem 14.3 proof, pp.119–120. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Length increase under Witt specialization

`AInfCohomology:AI.5/finite-level-length-bound` · lemma · `TauCeti.AInfPlan.finite_level_length_bound`

For a finitely presented W_n(O_C^flat)-module M, the generic and residue specializations have finite length and l(M_eta)=l(M_s)−l(Tor_1(M,W_n(k)))≤l(M_s).

**Hypotheses.** n≥1; generic W_n(C^flat) and residue W_n(k); finite presentation.

**Construction/proof.**

1. Use Tor-dimension and Euler characteristic additivity.
2. Devise by p and the finitely presented valuation-module classification.

**Direct prerequisites.** `AInfCohomology:AI.2/ainf-tor-bounds`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.14; printed p.37. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Rank and torsion-length comparison

`AInfCohomology:AI.5/specialization-rank-and-length` · lemma · `TauCeti.AInfPlan.specialization_rank_and_length`

For finitely presented M with M[1/p] finite free, M⊗W(C^flat) and M⊗W(k) have equal rank; for every n≥1, l((M⊗W(k))/p^n)≥l((M⊗W(C^flat))/p^n).

**Hypotheses.** Ordinary scalar extensions; source finite presentation; no assertion that either torsion group is a subquotient of the other.

**Construction/proof.**

1. Compare ranks after p-inversion.
2. Apply the finite-level length bound to M/p^n.

**Direct prerequisites.** `AInfCohomology:AI.5/finite-level-length-bound`, `AInfCohomology:AI.2/ainf-module-structure`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Corollary 4.15; printed p.38. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Injection into derived Witt specialization

`AInfCohomology:AI.5/derived-witt-cohomology-injection` · lemma · `TauCeti.AInfPlan.derived_witt_cohomology_injection`

For C with every H^j(C)[1/p] free, H^i(C)⊗W(k)→H^i(C tensor^L W(k)) is injective and an isomorphism after p-inversion. It is an integral isomorphism if H^(i+1)(C) has no x-torsion.

**Hypotheses.** Unbounded C allowed as in the source; all p-local cohomology free; x=[varpi^flat].

**Construction/proof.**

1. First use the filtered x-root quotient model and its Koszul resolution.
2. Compare its p-completion with W(k); the kernel is p-inverted and tensor-exact under the source hypothesis.

**Direct prerequisites.** `AInfCohomology:AI.2/ainf-tor-bounds`, `AInfCohomology:AI.0:integral/residue-map`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.16; printed p.38. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Finite presentation and adjacent-degree freeness

`AInfCohomology:AI.5/adjacent-degree-freeness` · theorem · `TauCeti.AInfPlan.adjacent_degree_freeness` · Planet: **Adjacent-degree freeness criterion**

For a perfect C with all H^j(C)[1/p] free, every H^j(C) is finitely presented. If H^i(C tensor^L W(k)) is p-torsion-free, H^i(C) is finite free. If also H^(i+1)(C)⊗W(k) is p-torsion-free, H^i(C)⊗W(k)≅H^i(C tensor^L W(k)).

**Hypotheses.** Perfect C; all p-local cohomology free; retain the adjacent-degree hypothesis.

**Construction/proof.**

1. Descend in cohomological degree using perfectness of the next truncation.
2. Apply the structure theorem for degree-i freeness and use degree i+1 to eliminate the Tor obstruction.

**Direct prerequisites.** `AInfCohomology:AI.5/derived-witt-cohomology-injection`, `AInfCohomology:AI.2/ainf-module-structure`, `AInfCohomology:AI.2/ainf-module-perfectness`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Corollary 4.17; printed p.39. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### De Rham and crystalline torsion-freeness criterion

`AInfCohomology:AI.5/de-rham-crystalline-torsion-equivalence` · lemma · `TauCeti.AInfPlan.de_rham_crystalline_torsion_equivalence`

For perfect C over A_inf with every H^j(C)[1/p] free, H^i(C tensor^L W(k)) is p-torsion-free iff H^i(C tensor^L_(theta) O_C) is p-torsion-free.

**Hypotheses.** Mixed characteristic and all p-power roots of unity; perfect C and free p-local cohomology.

**Construction/proof.**

1. Apply the finite-free criterion to H^i(C).
2. Compare good truncations after the two scalar extensions and then reduce to the common residue field k.

**Direct prerequisites.** `AInfCohomology:AI.5/adjacent-degree-freeness`, `AInfCohomology:AI.2/ainf-tor-bounds`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.18; printed p.39. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### p-local freeness from two period realizations

`AInfCohomology:AI.5/p-local-freeness-from-periods` · lemma · `TauCeti.AInfPlan.p_local_freeness_from_periods`

For finitely presented M, if M[1/(p mu)] is finite projective and M⊗B_crys^+ is finite projective, then M[1/p] is finite free.

**Hypotheses.** Mixed characteristic cyclotomic base; common B_crys^+ and its map to the mu-adic completion of A_inf[1/p].

**Construction/proof.**

1. Construct the factorization through B_crys^+ using bounded divided-power estimates.
2. Apply Beauville–Laszlo and prove absence of mu-torsion by the source flat coefficient sequence.

**Direct prerequisites.** `AInfCohomology:AI.2/punctured-vector-bundle-criterion`, `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`, `AInfCohomology:AI.2/linear-module-patching`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Lemma 4.19; printed p.39. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Cohomology finiteness from period realizations

`AInfCohomology:AI.5/cohomology-finiteness-from-periods` · lemma · `TauCeti.AInfPlan.cohomology_finiteness_from_periods`

For perfect C with H^j(C)[1/(p mu)] free and H^j(C tensor^L B_crys^+) free for every j, every H^j(C) is finitely presented and free after p-inversion. The finite-free and adjacent-degree conclusions of Corollary 4.17 then apply.

**Hypotheses.** Perfect C and both free realization hypotheses; neither deduced merely from finiteness.

**Construction/proof.**

1. Use descending induction on top cohomology and the module criterion.
2. Apply the already proved adjacent-degree package.

**Direct prerequisites.** `AInfCohomology:AI.5/p-local-freeness-from-periods`, `AInfCohomology:AI.5/adjacent-degree-freeness`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Corollary 4.20; printed p.40. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### BKF structure on proper cohomology

`AInfCohomology:AI.5/global-bkf` · theorem · `TauCeti.AInfPlan.global_bkf` · Planet: **BKF structure on proper cohomology**

Each H_Ainf^i is finitely presented and free after p-inversion, and the localized linearized Frobenius makes it a BKF module. This follows from the two period realizations and rational crystalline Frobenius, without assuming all integral cohomology is free.

**Hypotheses.** Smooth proper formal scheme; all proper comparisons and primitive inputs established.

**Construction/proof.**

1. Use proper perfectness and the free p-mu and B_crys^+ realizations.
2. Apply Corollary 4.20 and then the localized Frobenius factorization.

**Direct prerequisites.** `AInfCohomology:AI.5/cohomology-finiteness-from-periods`, `AInfCohomology:AI.5/global-etale`, `AInfCohomology:AI.5/rational-crystalline-frobenius`, `AInfCohomology:AI.2/bkf-module`, `AInfCohomology:AI.3/aomega-frobenius`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorem 14.3; §14; printed p.119. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

#### Torsion and lattice exports to CP.5

`AInfCohomology:AI.5/torsion-and-lattice-export` · application · `TauCeti.AInfPlan.torsion_and_lattice_export`

Export the generic length inequality and adjacent-degree recovery maps to CP.5. For the proper complex they give crystalline torsion-length bounds against generic-fiber étale torsion and finite-free lattice recovery when the source consecutive crystalline degrees are torsion-free. CP.5 owns the uniform geometric formulation and examples.

**Hypotheses.** Use H^i and H^(i+1) hypotheses exactly where the recovery map needs them.

**Construction/proof.**

1. Apply the generic module estimates to the proper BKF cohomology.
2. Use the derived-specialization injection and adjacent-degree criterion before extracting an ordinary lattice.
3. Check the BMS §2 strict-inequality and non-subquotient examples as CP.5 acceptance cases, not prerequisites upstream of AI.2.

**Direct prerequisites.** `AInfCohomology:AI.5/global-bkf`, `AInfCohomology:AI.5/specialization-rank-and-length`, `AInfCohomology:AI.5/adjacent-degree-freeness`, `AInfCohomology:AI.2/fargues-full-faithfulness`.

**Acceptance.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** [bms1-v3](https://arxiv.org/pdf/1602.03148v3), Theorems 1.1,1.8, printed pp.2–3,5–7; Theorems 14.5–14.6, pp.120–122; §2, pp.11–18. The export is the indicated source construction/result, with the corrected conventions explained in the reader.

## Baseline and reuse boundary

The following entries supply carriers and already existing library results. They are cited rather than planned again. Generic derived completion, enhanced tensor, geometric sites and the theorem-specific comparison maps still require their exact roadmap suppliers.

| Declaration | Module | What is reused |
| --- | --- | --- |
| `mathlib:ModuleCat` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` | Bundled existing category of modules, not a new carrier. |
| `mathlib:ModuleCat.of` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` | Bundles an existing R-module. |
| `mathlib:ModuleCat.ofHom` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` | Converts a linear map to a categorical module morphism. |
| `mathlib:ModuleCat.Hom.hom` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` | Extracts the linear map from a categorical module morphism. |
| `mathlib:CochainComplex` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` | The existing cochain complex indexed by Z with differential raising degree. |
| `mathlib:CochainComplex.of` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` | Constructor for an arbitrary eligible index type, including Z, from adjacent maps and square-zero proofs. |
| `mathlib:CochainComplex.ofHom` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` | Constructor for chain maps from adjacent commuting squares. |
| `mathlib:HomologicalComplex.d_comp_d` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` | Every composable pair of differentials has zero composite. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | Chosen derived-category localization under HasDerivedCategory; not a décalage or enhancement implementation. |
| `mathlib:DerivedCategory.Q` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | Existing localization functor on cochain complexes. |
| `mathlib:Finsupp` | `Mathlib/Data/Finsupp/Defs.lean` | Finite-support sequences for the counterexample. |
| `mathlib:PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | Existing univariate formal power series. |
| `mathlib:PowerSeries.coeff` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | Coefficient maps specify the restricted-sequence condition. |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | Existing p-typical Witt-vector ring; not new A_inf constants. |
| `mathlib:WittVector.teichmuller` | `Mathlib/RingTheory/WittVector/Teichmuller.lean` | Multiplicative Teichmuller lift, not additive. |
| `mathlib:WittVector.frobeniusEquiv` | `Mathlib/RingTheory/WittVector/Frobenius.lean` | Witt Frobenius equivalence for a perfect characteristic-p ring. |
| `mathlib:WittVector.map` | `Mathlib/RingTheory/WittVector/Basic.lean` | Functorial ring map on Witt vectors. |
| `mathlib:WittVector.isAdicCompleteIdealSpanP` | `Mathlib/RingTheory/WittVector/Complete.lean` | p-adic completeness for Witt vectors of a perfect characteristic-p ring. |
| `mathlib:TruncatedWittVector` | `Mathlib/RingTheory/WittVector/Truncated.lean` | Existing finite Witt carrier and truncation APIs. |
| `mathlib:PreTilt` | `Mathlib/RingTheory/Perfection.lean` | The Frobenius-limit ring R/p; no perfectoid-field assertion by itself. |
| `mathlib:WittVector.fontaineTheta` | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` | Existing Fontaine ring map under explicit adic completeness and prime/nonunit instances. |
| `mathlib:BDeRhamPlus` | `Mathlib/RingTheory/Perfectoid/BDeRham.lean` | Existing kernel-adic completion carrier after p-inversion; DVR proof absent. |
| `mathlib:BDeRham` | `Mathlib/RingTheory/Perfectoid/BDeRham.lean` | Existing localization at generator images; principal-kernel proof needed for the familiar single-generator description. |
| `mathlib:continuousCohomology` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` | Existing topological representation/group cohomology carrier; no automatic p-adic derived completion comparison. |
| `mathlib:LocalizedModule` | `Mathlib/Algebra/Module/LocalizedModule/Basic.lean` | Existing module localization, with scalar-extension comparison. |
| `mathlib:HomologicalComplex.homology` | `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean` | Chosen homology object of an eligible homological complex. |
| `mathlib:KaehlerDifferential` | `Mathlib/RingTheory/Kaehler/Basic.lean` | Existing ordinary cotangent module I/I² and universal derivation; not the full cotangent complex. |
| `mathlib:WittVector.fontaineTheta_teichmuller` | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` | The Fontaine map on Teichmuller lifts equals PreTilt.untilt, under the same prime/nonunit/completeness hypotheses as fontaineTheta. |
| `mathlib:surjective_fontaineTheta` | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` | Surjectivity of fontaineTheta additionally assumes surjectivity of Frobenius on O/p; it is not asserted for arbitrary complete rings. |
| `mathlib:WittVector.Isocrystal` | `Mathlib/RingTheory/WittVector/Isocrystal.lean` | Existing isocrystal module/Frobenius carrier; analytic classification is the new AI.2 theorem. |
| `mathlib:WittVector.FractionRing.frobenius` | `Mathlib/RingTheory/WittVector/Isocrystal.lean` | Witt Frobenius automorphism on the existing fraction-field coefficient ring. |
| `mathlib:AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | Existing inverse-limit module completion. For the principal ideal used here, the algebra instance is in AdicCompletion.Algebra; it is not generic derived completion. |
| `mathlib:TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | Existing tensor product of modules; it is not derived tensor. |

## Source versions and corrections

The source routes and their original read dates are retained. On 2026-10-10 the ten public PDF digests were matched to the previously reviewed versions, and the locators needed for this revision were re-read. This is a targeted recheck, not a second complete reading of all the papers. The BLM published interior remains unavailable; its findings E2–E5 are scoped to the December 2019 author copy.

| Source | Version and reading scope |
| --- | --- |
| [bms1-v3](https://arxiv.org/pdf/1602.03148v3) | arXiv:1602.03148v3 (2019), 124 pages; §§3–4 (including all §4.2 statements and §4.3–4.4 classification/descent), §§5–9, §10 coefficient results, §11, §12 main comparison proofs, §§13–14 target statements.; Target-level decomposition; individual proof interiors not recursively split after all scoped targets are planned. |
| [bms1-published](https://pmihes.centre-mersenne.org/item/10.1007/s10240-019-00102-z.pdf) | Publ. Math. IHES 128 (2018), 219–397; online January 2019; Published Lemma 6.9 proof, Remark 7.8 and Lemma 7.9 checked against v3 for AInfCohomology/E1, E6 and E7; source corrections E1–E22 cross-referenced to the existing extraction. |
| [bms2](https://arxiv.org/pdf/1802.03261) | Public arXiv:1802.03261 PDF retrieved 2026-10-07; Proposition 5.8, Remark 5.9, Corollary 5.10 and proofs; §11 trace/Breuil–Kisin material belongs to AI.7, outside this part.; §6.2, Proposition 6.5 and Remark 6.6, conormal-limit normalization and comparison with BMS1 Example 4.24; the THH construction is outside this part. |
| [sch13](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeTheory.pdf) | Public author copy of Forum Math. Pi 1 (2013), e1; Lemmas 3.18,4.2,4.10,5.10; Corollary 4.7, Proposition 4.8; Theorem 6.5, Corollary 6.6.; Read the entire 2016 corrigendum; corrected site imported from A1, structural rational period sheaves owned by P8. |
| [sch13-erratum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf) | 2016 complete three-page author corrigendum; All three pages, corrected transfinite covers, deleted point claims, completed structural period sheaves. |
| [sw20](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf) | Public author copy (2020); Definitions 11.4.1,11.4.3 and Remark 11.4.6; Proposition 12.4.6; Theorems 11.4.5,13.2.1,14.1.1,14.2.1 with the supplier requirements. |
| [zavyalov](https://arxiv.org/pdf/2111.01830v3) | arXiv:2111.01830v3; Annals 201 (2025) source route; §1 Tate/BK twists and completed cotangent conventions; Theorem 3.3.3 and proof. The geometry/duality theorem itself is outside AI.0. |
| [alb](https://arxiv.org/pdf/1907.10525v4) | arXiv:1907.10525v4; published Forum Math. Pi (2023); Definition 4.1.24 and minuscule condition; §4.3 perfectoid dictionary; Proposition 4.3.5 (published 4.47).; Author erratum read in full: false divided-Frobenius nilpotence step in published 5.23 is not used by our crystalline-triple theorem. |
| [alb-erratum](https://lebras.perso.math.cnrs.fr/Erratum_PDT.pdf) | Public author erratum; Complete erratum for published Proposition 5.23. |
| [blm](https://www.math.ias.edu/~lurie/papers/Crystalline.pdf) | Public December 2019 author copy; published Asterisque 424 (2021); §§2.2–2.4, 7.1 selected completion statements, 7.2–7.4 fixed-point targets, 8.4, 10.3–10.4.; Only the homological interface and comparison agreement are owned here; Dieudonne/Nygaard/crystalline definitions imported from CR.4. |
| [stacks-flat](https://stacks.math.columbia.edu/tag/077J) | Online tags 077J, 03EW and 06XX inspected 2026-09-27; Lemma 21.17.10, including its references to Modules on Sites 18.28.8 and Derived Categories 13.29.1; those linked statements were opened as E1 source leads. This packet does not claim their complete recursive proof decomposition. |
| [stacks-completion](https://stacks.math.columbia.edu/tag/091N) | Online §15.93 inspected 2026-09-27; Definitions and affine cohomology/weak-Serre closure results 15.93.1–6, completion adjunction 15.93.10, and reduction criterion 15.93.20 (0G1U), used to specify DD.1 requests; not a new DD.1 implementation. |

### AInfCohomology/E1

**Locator.** Lemma 6.9 proof, published p.292; also arXiv v3 printed p.51.

**Mistake, paraphrased.** The proof identifies a quotient of the entire eta term in degree n−1 with line-twisted I-torsion in H^n(C).

**Correction.** Use the good-truncation boundary quotient: if x=f^(n−1)y lies in eta and dy=fz, H^n(C)[f]=0 implies z=dw; hence dx=f^n dw maps to zero in the target boundary quotient. Do not identify the entire degree n−1 term quotient with H^n(C)[I].

**Reason.** Take I=(2), n=1 and C=Z in degree0 with zero differential. The printed left quotient is Z/2, while H^1(C)[2]=0. The corrected boundary argument still constructs the lower-truncation comparison, so the theorem remains valid.

**Independent finding.** confirmed again by `REV-AInfCohomology--AI.0~2` on 2026-10-10.

### AInfCohomology/E2

**Locator.** Lemma 7.1.18 proof, author copy printed p.85; finding scoped to this author copy, published interior unavailable.

**Mistake, paraphrased.** The displayed boundary identification uses degree n−1 rather than degree n for its target.

**Correction.** The differential restricts to Y^(n−1)≃B^n.

**Reason.** B^n was defined as the image of d:X^(n−1)→X^n; a nonzero two-term differential has B^n nonzero and B^(n−1)=0.

**Independent finding.** confirmed again by `REV-AInfCohomology--AI.0~2` on 2026-10-10.

### AInfCohomology/E3

**Locator.** Proposition 7.2.4, author copy printed pp.86–87; finding scoped to this author copy, published interior unavailable.

**Mistake, paraphrased.** The completion premise refers to N again rather than to the domain M of the given map.

**Correction.** The premise says N is the derived p-completion of M.

**Reason.** As printed the premise is satisfied by any map into a p-complete N. For M=0 and N=Z_p it would incorrectly say Lη_p Z_p completes zero; the proof uses the corrected premise.

**Independent finding.** confirmed again by `REV-AInfCohomology--AI.0~2` on 2026-10-10.

### AInfCohomology/E4

**Locator.** Remark 8.4.3 final sentence, author copy printed p.105; finding scoped to this author copy, published interior unavailable.

**Mistake, paraphrased.** The final sentence sends the filtration index toward positive infinity to recover the underlying complex.

**Correction.** The underlying complex is the colimit as k→−infinity.

**Reason.** For the p-power filtration of Z[1/p], taking the inverse direction cannot recover the underlying localization; the preceding definition and decreasing-filtration transitions already use minus infinity.

**Independent finding.** confirmed again by `REV-AInfCohomology--AI.0~2` on 2026-10-10.

### AInfCohomology/E5

**Locator.** Example 8.4.7 proof, author copy printed p.106; finding scoped to this author copy, published interior unavailable.

**Mistake, paraphrased.** The proof orders the decreasing-filtration quotient using the previous index and truncates the whole complex instead of its associated graded piece.

**Correction.** Use F′k M/F′(k+1) M≃τ≤k(gr^k_F M), not τ≤k M.

**Reason.** The filtration is decreasing, so the printed quotient is not in that order. A filtered complex with two nonzero graded pieces shows that one graded quotient cannot be the truncation of the entire underlying M. The corrected formula follows term by term from the displayed F′ definition.

**Independent finding.** confirmed again by `REV-AInfCohomology--AI.0~2` on 2026-10-10.

### AInfCohomology/E6

**Locator.** Remark 7.8, published p.302; arXiv v3 printed p.58.

**Mistake, paraphrased.** The notation for the first enhanced algebra applies the decalage functor to that same, not yet defined algebra.

**Correction.** Set E1=Leta_(q-1)(E2), where E2 is the previously defined derived group cohomology algebra.

**Reason.** The following comparison E1 to E2 and Example 7.7 use the decalage of group cohomology; applying the functor to E1 itself would be circular.

**Already recorded.** PAPER-BHATT-MORROW-SCHOLZE-18/E6, confirmed by REV-PAPER-BHATT-MORROW-SCHOLZE-18.

**Independent finding.** confirmed by `REV-AInfCohomology--AI.0~2`; checked in both the published and arXiv PDFs.

### AInfCohomology/E7

**Locator.** Proof of Lemma 7.9, published p.303; arXiv v3 printed p.59, forward and converse divisibility checks.

**Mistake, paraphrased.** The two divisibility tests use multiplication by g on the second component y, rather than on the first component x.

**Correction.** For x in degree n and y in degree n-1, use differential (dx,dy+(-1)^n*g*x).

**Reason.** The second differential component has degree n; g*y has degree n-1. The differential displayed immediately before the tests and the intervening divisibility argument both use g*x.

**Already recorded.** PAPER-BHATT-MORROW-SCHOLZE-18/E7, confirmed by REV-PAPER-BHATT-MORROW-SCHOLZE-18.

**Independent finding.** confirmed by `REV-AInfCohomology--AI.0~2`; checked in both the published and arXiv PDFs.

## Supplier contracts

These 14 contracts identify exact missing extensions or named supplier stages. The direct prerequisite identifiers in the catalogue retain the already planned suppliers. Requests are planning endpoints; they do not assert that a missing implementation or map-agreement proof already exists.

### EnhancedDerivedSheaves:E1

Refine the existing K-flat replacement node to a termwise-flat K-flat replacement on ringed sites (strongly K-flat, BMS1 Lemma6.1); construct comparison roofs compatible with the chosen ordinary DerivedCategory and the invertible-ideal line-power/coherent tensor interface.

Needed by `AInfCohomology:AI.1/ideal-decalage-complex`, `AInfCohomology:AI.1/decalage-cohomology`, `AInfCohomology:AI.1/derived-decalage`, `AInfCohomology:AI.1/decalage-filtered-colimits`, `AInfCohomology:AI.1/decalage-truncations`, `AInfCohomology:AI.1/decalage-products`, `AInfCohomology:AI.1/bockstein-differential`, `AInfCohomology:AI.1/bockstein-reduction`, `AInfCohomology:AI.1/strongly-k-flat-replacements`.

### DerivedDeRhamCohomology:DD.1

Extend the existing scalar Koszul node to Koszul complexes of commuting endomorphisms, with cohomological exterior signs and the continuous completed-cochain comparison; generic derived completion and Beilinson infrastructure are already imported by exact node ids.

Needed by `AInfCohomology:AI.1/koszul-decalage-calculation`, `AInfCohomology:AI.1/koszul-products-and-cohomology`, `AInfCohomology:AI.1/continuous-cochains-koszul`, `AInfCohomology:AI.3/q-de-rham-model`.

### DerivedDeRhamCohomology:DD.0

Supply the integral perfectoid completed-cotangent results: Lhat_(O_C/Z_p)=O_C{1}[1] and Lhat_(S/O_C)=0 for p-complete integral perfectoid O_C-algebras S. Use cotangent transitivity and derived p-completion, not vanishing of ordinary differentials alone.

Needed by `AInfCohomology:AI.0:integral/completed-cotangent-twist`.

### PadicHodgeTheory:R06.1

Supply the actual topology, principal kernel, discrete valuation and common-map identification for the existing BDeRhamPlus/BDeRham carriers and B_crys^+; continuous Galois actions and coefficient scalar twists. AI.0 integral constructions precede this request and have no dependency on it.

Needed by `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`, `AInfCohomology:AI.2/bkf-galois-descent`.

### PadicHodgeTheory:P8:local-rational

Supply an early primitive-comparison child, independent of the proper rational suffix: Scholze Theorem 4.9, Lemma 4.12 and Theorem 5.1 (finite etale F_p cohomology and the O^+/p almost comparison), then the derived A_inf version BMS1 Theorem 5.7 by finite p-level induction and derived completion. The current local rational period-sheaf statements alone do not supply it; use the corrected pro-etale covers.

Needed by `AInfCohomology:AI.5/global-etale`.

### AdicEtaleGeometry:A1

Supply the corrected analytic pro-etale site, unchanged underlying category, transfinite covering towers in which every positive stage maps by pullback of a finite etale surjection to the limit of all preceding stages (including positive limit ordinals), and the generic-fiber/formal-Zariski morphism of ringed topoi. Do not use deleted 2013 point claims or splitting of arbitrary open profinite surjections.

Needed by `AInfCohomology:AI.3/completed-integral-sheaf`, `AInfCohomology:AI.3/aomega`.

### PerfectoidSpaces:P1

Supply the perfectoid field and valuation-ring setup for O_C^flat, its nondiscrete valuation, residue field and finite-generated torsion-free module lattice criterion; the Fontaine-kernel and perfectoid-basis nodes are imported separately by exact ids.

Needed by `AInfCohomology:AI.2/valuation-special-fiber-bound`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Early Part II of the field-valued Dieudonne stage: define admissible prismatic windows over the initial perfectoid prism and prove their evaluation dictionary with minuscule linearized BKF modules. This dictionary must precede classification applications that import AI.2; do not import the full subsequent perfectoid p-divisible-group classification backwards.

Needed by `AInfCohomology:AI.2/minuscule-prismatic-dictionary`.

### PrismaticCohomology:PR.0

Supply only the initial perfectoid prism and its Frobenius-shifted identification (A_inf,tilde-xi); generic delta rings/prisms and their initial-prism theorem stay with PR.0. No final AΩ/prismatic comparison is a prerequisite.

Needed by `AInfCohomology:AI.2/minuscule-prismatic-dictionary`.

### EnhancedDerivedSheaves:E5

Supply coherent E_infinity algebra objects, lax symmetric monoidal localization and the characteristic-two Sq^0 test for the noncommutative q-model; the q-model is not forced into a strictly commutative dga.

Needed by `AInfCohomology:AI.3/enhanced-noncommutative-regression`.

### CrystallineCohomology:CR.4

Audit the agreement of BLM10.3–10.4 saturated-de-Rham–Witt universal maps with the absolute all-coordinate AΩ crystalline comparison, preserving degree-zero maps, Bockstein differential and Frobenius. Existing relative Witt and crystalline objects are imported by exact node ids.

Needed by `AInfCohomology:AI.4/blm-crystalline-route`.

### CrystallineCohomology:CR.3

Early Berthelot–Ogus bridge BMS1 Proposition 13.21: after fixing k→O_C/p, rational crystalline base change from the proper smooth special fiber over W(k) to A_crys[1/p], with canonical phi-equivariant map. Include rational Frobenius bijectivity for qcqs smooth O_C/p-schemes over non-Noetherian A_crys and descent through p^(1/p^n) thickenings. The existing Noetherian-base Frobenius-isogeny theorem alone is insufficient; the bridge must not depend on AI.5 BKF freeness.

Needed by `AInfCohomology:AI.5/rational-crystalline-frobenius`, `AInfCohomology:AI.5/global-bkf`.

### tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve

Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied. In particular supply the Y^an_[0,r] neighborhoods and integral Robba stalk at x_(C^flat), the Y^an_[r,infinity] extension at x_L, and the two-open sheaf interface of SW Theorem 14.2.1. AI.2 owns only module restriction, patching and classification; no duplicate interior or curve construction.

Needed by `AInfCohomology:AI.2/integral-robba-frobenius-descent`, `AInfCohomology:AI.2/annulus-isocrystal-classification`, `AInfCohomology:AI.2/frobenius-extension-infinity`, `AInfCohomology:AI.2/analytic-vector-bundle-extension`, `AInfCohomology:AI.2/fargues-essential-surjectivity`.

### AdicSpacesPartII:R3

Supply the analytic affinoid finite-projective-module/vector-bundle equivalence for the source two-open cover, including the exact non-Noetherian sheaf descent hypotheses of SW Theorem 5.2.8, printed p.38. The existing analytic coherent-sheaf infrastructure is imported; AI.2 owns the global finite-free A_inf equivalence on the punctured analytic Y^an.

Needed by `AInfCohomology:AI.2/analytic-vector-bundle-extension`.

## Remaining refinements and review

All eight stages are planned; none is closed. Independent review `REV-AInfCohomology--AI.0~2` accepts this complete target-level pass on 2026-10-10, after correcting the reviewed files in place. The earlier review's blockers are resolved; the following nine supplier/substrate refinements remain explicit.

### Enhanced ringed-topos and invertible-line signatures

Pinned Mathlib has the ordinary derived category but not the requested coherent stable enhancement, derived sheaf tensor/pushforward, or invertible-ideal line-power interface. The Lean prototype uses actual affine complexes and derived-category objects; it omits precisely these unavailable hypotheses and records the narrower signatures in the reader.

Needed by `AInfCohomology:AI.1/ideal-decalage-complex`, `AInfCohomology:AI.1/decalage-products`, `AInfCohomology:AI.3/aomega`.

### Continuous completed cochain forgetful comparison

Mathlib continuousCohomology is in TopModuleCat with N-indexed cochains. The comparison must construct the completed p-adic cochain complex and its forgetful functor to Z-indexed ModuleCat complexes, with the finite-reduction hypotheses. It cannot be obtained by an unproved identification of discrete and continuous carriers.

Needed by `AInfCohomology:AI.1/continuous-cochains-koszul`, `AInfCohomology:AI.3/toric-perfectoid-cover`.

### Perfectoid minuscule-window supplier extension

R07.2 currently states field-valued Dieudonne theory, not the full perfectoid prismatic window interface. Request an early Part II dictionary with the PR.0 initial prism, before the subsequent classification applications that consume AI.2. Its proof is not assumed to follow from the finite-free Fargues equivalence alone.

Needed by `AInfCohomology:AI.2/minuscule-prismatic-dictionary`.

### Analytic reconstruction on the punctured adic locus

Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied. The SW module chain is planned in AI.2 with its exact sources. Boundary interval rings, Robba/local-ring restrictions and sheaf descent are a lower-owner supplier extension, beyond the existing interior radius windows. Native signatures omit these geometric identifications explicitly; refinement of the classification proofs stays with AI.2, not RF4/VB2.

Needed by `AInfCohomology:AI.2/integral-robba-frobenius-descent`, `AInfCohomology:AI.2/annulus-isocrystal-classification`, `AInfCohomology:AI.2/frobenius-extension-infinity`, `AInfCohomology:AI.2/analytic-vector-bundle-extension`, `AInfCohomology:AI.2/fargues-essential-surjectivity`.

### Agreement of the two crystalline comparison maps

BLM10.3–10.4 supplies the canonical saturated realization, but identification with every all-coordinate PD comparison map requires the shared degree-zero/Bockstein universal-map audit. This exact map agreement is requested from CR.4; no equality of unnamed isomorphisms is asserted.

Needed by `AInfCohomology:AI.4/blm-crystalline-route`.

### Geometric hypotheses absent from Lean substrate

The packet gives the full smooth/proper/formal/site hypotheses. The compilable signature proposal leaves out those not yet expressible on pinned carriers and marks each affected block. It is a proposed API, never a theorem verified by the elaborator.

Needed by `AInfCohomology:AI.3/aomega`, `AInfCohomology:AI.5/proper-perfectness`, `AInfCohomology:AI.5/global-bkf`, `AInfCohomology:AI.2/analytic-vector-bundle-extension`.

### Integral Frobenius-descent proof refinement

AI.2 now owns integral Witt descent, including finite torsion modules, and its invariant/scalar-extension signature. Artin–Schreier–Witt descent and the integral coefficient identifications remain source-supported proof refinements; Mathlib’s rational isocrystal carrier does not prove them. No supplier request to the higher/outside VB0 plan remains.

Needed by `AInfCohomology:AI.2/integral-frobenius-descent`, `AInfCohomology:AI.2/bkf-etale-realization`.

### Primitive proper integral comparison

P8:local-rational supplies local rational period sheaves, not Scholze Theorem 5.1 etale finiteness and primitive almost comparison. The request specifies an early primitive-comparison child and BMS1 Theorem 5.7. Until supplied, proper etale comparison is source-supported planning, not closed.

Needed by `AInfCohomology:AI.5/global-etale`.

### Non-Noetherian rational crystalline bridge

The inspected CR.3 rational Frobenius theorem assumes a Noetherian PD base (or W(k)). It does not by itself prove BMS1 Proposition 13.21 over A_crys. The section-dependent Berthelot–Ogus bridge and its qcqs Frobenius/descent inputs are requested from an early CR.3 extension.

Needed by `AInfCohomology:AI.5/rational-crystalline-frobenius`, `AInfCohomology:AI.5/global-bkf`.

The independent review checked every node, the 75 restored exports, the repaired APIs and reconstruction regression, the six ownership additions, and this synchronized reader. Supplier refinements remain with their stated owners. Acceptance concerns this plan; no proof, stage closure or implementation is claimed. The review report records the corrections and checks.
