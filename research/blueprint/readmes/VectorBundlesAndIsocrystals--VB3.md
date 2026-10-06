# Isocrystals, vector bundles and Banach–Colmez spaces: geometry and families

This second part continues the stable eleven-node checkpoint and plans the five
stages VB3, its three substages, and VB4. It is a complete target-level blueprint:
all their targets and the papers’ routed additions have declarations or explicit
owner imports. Every declaration remains **unchecked**. “Planned” records the
completed mathematical pass; the proof and supplier boundaries below prevent a
claim of gap-free closure.

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti
**f790474821cf4256814db967cb154e7af3d0c369**. Their source statements were read,
including sheaves, abelian and derived categories, short exact complexes,
homology, finite rank, modules, lattices, normed algebras, specialization and
spectral spaces. Tau Ceti already proves spectrality of the valuation spectrum
of a Huber pair with a pair of definition. These are genuine inputs. Neither
library supplies the perfectoid v-site, the relative Fargues–Fontaine curve,
its HN slopes, diamonds, period Vector Spaces or the Le Bras equivalence.
The reviewed library audit has no dedicated vector-bundle entry; the pinned
source/index search was therefore checked directly. We build on the corrected
companion nodes rather than restating that part or any upstream roadmap.

## Conventions and proof order

Fix a local field E with residue field F_q and uniformizer π. S is perfectoid
over F_q and X_S is the relative curve owned by RelativeFarguesFontaine. Standard
O(d/h), with h>0 and gcd(d,h)=1, has rank h and degree d. The bundle functor
reverses isocrystal slopes: Frobenius π^{-d} gives bundle slope d/h. Classical
BC, sympathetic Vector Spaces, and the CN height/curvature formalism in this
part use **E=Q_p** and a fixed complete algebraically closed C with distinguished
untilt point ∞. They must not be silently extended to every E. The relative
FS geometry and relative HN theorem do allow equal-characteristic E.

Complexes [E₁→E₀] have E₁ in **cohomological degree −1** and E₀ in degree zero.
FS’s “homological [0,1]” describes this same convention. BC of a complex means
**degree-zero derived hypercohomology**, never the cokernel of its map of raw
section groups. The universal condition H⁰(X_T,E₁,T)=0 is required for every
perfectoid T/S. Representability is proved separately from the sheaf definition.

Use the concave bundle HN polygon with horizontal coordinate rank and slopes
in decreasing order, repeated according to ranks. KL uses a convex lower polygon
with slopes in increasing order. For the same normalized slope multiset,
P_KL(x)=deg(E)−P_FS(n−x). Thus KL’s lower semicontinuity agrees with FS’s upper
semicontinuity after this transformation. This is not an axis exchange, and it
is separate from the isocrystal-to-bundle sign. KL’s φ^a convention has degrees
in (1/a)Z: its twist O(1) and untilt line have slope 1/a. Source normalization
corrections below retain this factor.

The construction has two branches. Derived section descent and the Lubin–Tate
calculation supply the basic twists used in geometric classification. Separately,
quantitative ampleness plus the twist calculation prove **ordinary projectivized
properness without classification**. That properness supplies the nowhere-zero
section argument for relative HN and pro-étale local systems. Relative HN then
supports positive presentations, vanishing and two-term BC geometry. The classical
BC category, Dimension, Le Bras and curvature use the geometric classification.

The binding RS15 review accepted on 2026-09-30 withholds the stage reversal
between general-BC and VB4 until narrowing and edge replacement can be applied
atomically. The node graph records the mathematical order. Lifting every node
edge mechanically into the current stage graph would be wrong. The companion
packet’s corrected node contracts are usable imports, but its independent review
still requires synchronization of its reader; its own proof gaps remain imports.

## Scope and owners

Ordinary projectivized properness has one owner, VB3:projectivized-properness.
VB4 owns the proper nowhere-zero-section v-cover application and relative HN.
The stronger two-term quotient theorem has its separate owner in general-BC.
RF2 owns divisor moduli, untilts and completed period DVRs; our divisor result
compares those existing objects with BC sections. Diamonds and v-stacks owns
generic spatiality criteria and locally profinite torsors. Six operations owns
smoothness and dimension descent. The generic torsion-pair tilt belongs to SF.0.
Upstream local class field theory owns Lubin–Tate arithmetic and reciprocity.
Upstream ReductiveGroups owns its representation/comodule dictionary; the required
integral extension is requested as ReductiveGroups, Part II.

CN items 309–312 are imports from the companion’s curve, HN, classification and
twist cohomology nodes. Items 300–308 and 313–330 are planned here. CN §3.3’s
h(W)=Hom_VS(W,B_dR), its exactness and rank/Ext correction are the accepted
**Part II** additions (items 331–333). They consume the parent’s BC, Le Bras,
curvature and Hom-vanishing results; this part does not duplicate h. SW’s
simple-connectivity consequence is likewise imported from the companion’s
finite-etale-constant-algebras node. KL’s generic ampleness definition and
cohomological criterion remain with VB2:ampleness; VB4 supplies their fibrewise
criterion and relative applications.

## How to read the declarations

The following sections state every target, its direct imports and the proof
route at target granularity. Each definition or construction has a named API,
its actual consumers and tests of values, boundary cases, compatibility or a
specific tempting wrong definition. Test names match the suggested file’s index.
Its supported categorical, linear, cochain, numerical and topological signatures
use the pinned carriers; missing geometric conditions are explicitly indexed
there instead of being encoded as arbitrary propositions. The packet and this
document are definitive for the full mathematical statements.

## VB3:positive-basic-examples — section sheaves and the independent calculation

<a id="banach-colmez-space-definition"></a>

### Banach–Colmez section and hypercohomology sheaves

**Declaration:** `BC` · **definition** · `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`.

For a perfectoid S/F_q and a bundle E on X_S, BC(E)(T)=H⁰(X_T,E_T). If E has only negative geometric slopes, BCneg(E)(T)=H¹(X_T,E_T). For a complex [E₁→E₀] in COHOMOLOGICAL degrees −1,0 with H⁰(X_T,E₁,T)=0 for EVERY T/S, BCcomplex(T)=H⁰ RΓ(X_T,[E₁→E₀]_T), the degree-zero hypercohomology v-sheaf. No representability is assumed. FS calls these homological degrees [0,1].

**Hypotheses.** S belongs to Perf_Fq; coefficients are the fixed local field E with uniformizer π. Derived v-descent is imported from the companion; the universal H⁰ vanishing prevents negative cohomology of the section complex.

**Construction/proof.** Apply companion derived v-descent to RΓ, then take degree-zero cohomology using the universal negative-degree vanishing. Recover H⁰(E₀) when E₁=0 and H¹(E₁) when E₀=0; use cohomological shifts. Local spatiality and partial properness remain the conclusions of separate nodes.

**API.**

| Name | Role and contract |
| --- | --- |
| `BC` | data: The v-sheaf T↦H⁰(X_T,E_T). |
| `BCneg` | data: For universally negative slopes, T↦H¹(X_T,E_T). |
| `BCcomplex` | data: Degree-zero hypercohomology of [E₁→E₀] in degrees −1,0, with universal H⁰(E₁) vanishing. |
| `BC.map` | functoriality: A bundle or complex map induces the corresponding E-linear map of v-sheaves; identity and composition are preserved. |
| `BC.baseChange` | compatibility: For U→S, restriction of BCcomplex on Perf_U is BCcomplex of the pulled-back complex. |
| `BC.directSum` | compatibility: BCcomplex(K⊕L)≅BCcomplex(K)⊕BCcomplex(L) in the abelian category of E-module v-sheaves. |

**Consumers.** [FS II.2.16: BC(E) is a locally spatial diamond partially proper over S, and its projectivization is proper](#properness-of-projectivized-BC) the properness theorem is about this functor and its projectivization. [FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness](#families-of-banach-colmez-spaces) the two-term form is what that theorem is stated for. [FS II.2.3 and II.2.4: the fundamental exact sequence and (BC(O(1)) minus 0)/E^times = Div^1](#fundamental-exact-sequence) the identification (BC(O(1)) minus 0)/E^times = Div^1 is a statement about this object.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `BCtest.zero` | degenerate: The zero complex has zero BC v-sheaf. |
| `BCtest.single` | compatibility: BCcomplex([0→E])=BC(E) and BCcomplex([E→0])=BCneg(E) when E is negative. |
| `BCtest.constantSections` | computation: For S the disjoint union of two geometric points, BC(O)(S)=E², not E; BC(O) is the constant SHEAF underline E. |
| `BCtest.hypercohomology` | non-example: For [O(−1)→0] over a geometric point, BCcomplex=H¹(O(−1))≠0 although the cokernel of the map of H⁰ groups is zero. |

**Direct imports.** `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles` (companion part), `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology` (companion part), `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology` (companion part), `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.ShortComplex.homology`.

**Acceptance.** Check the degrees −1,0 against both degenerate complexes. Check restriction to a disconnected base; evaluate the constant sheaf rather than the constant presheaf.

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition I.3.5, p. 19; two-term definition after II.2.1, p. 58; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Two-term definition after Proposition II.2.1, p. 58.

<a id="lubin-tate-universal-cover"></a>

### FS II.2.2: H^0(X_S,O(1)) is the universal cover of the Lubin-Tate formal group

**Declaration:** `LubinTateUniversalCover` · **theorem** · `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`.

Let S = Spa(R,R^+) be affinoid perfectoid over F_q with untilt S^sharp over E, and let O_{X_S}(1) correspond to the isocrystal (E, pi^{-1}). Then X -> sum over i in Z of pi^i [X^{q^{-i}}] defines a natural isomorphism G-tilde(R^{sharp+}) = R^{circ circ} -> H^0(X_S, O(1)) = H^0(Y_S, O_{Y_S})^{phi = pi}, and the evaluation map H^0(X_S,O(1)) -> R^sharp at S^sharp is the logarithm map log_G : G-tilde(R^{sharp+}) -> G(R^{sharp+}) -> R^sharp.

**Hypotheses.** G = G_LT is the Lubin-Tate formal O_E-module over O_E-breve, normalized by M = W_{O_E}(k) with F = sigma/pi in Dieudonne theory (with the SW20 renormalisation dividing F by p and base changing along W(k) tensor_{Z_p} O_E -> W_{O_E}(k)); under this normalisation G is already defined over O_E G-tilde = inverse limit of G along multiplication by pi, isomorphic to Spf O_E[[X-tilde^{1/p^infty}]]; for pi-adically complete A one has G-tilde(A) = G-tilde(A/pi) = Hom_{O_E}(E/O_E, G(A/pi))[1/pi] = the topologically nilpotent elements of A^flat The equal-characteristic case is a direct power-series computation with the condition r_i = r_{i+1}^q In the p-adic case the proof replaces B_{R,[1,infty]} by the crystalline period ring B^+_crys of R^{sharp+}/pi and cites [SW13, Theorem A]. What [SW13, Theorem A] actually states, read in the source, is: for R f-semiperfect the Dieudonne module functor on p-divisible groups UP TO ISOGENY is fully faithful, and if R = S/J with S perfect and J regular then it is fully faithful on p-divisible groups themselves. Here f-semiperfect means Frobenius is surjective and lim_Phi R has a finitely generated ideal of definition; O_C/p is the motivating example. The deduction of the displayed identity B^{phi=pi}_{R,[1,infty]} = Hom_{O_E}(E/O_E, G(R^{sharp+}/pi))[1/pi] from that full-faithfulness statement is NOT written out in Fargues-Scholze. The explicit-formula compatibility is [SW13, Lemma 3.5.1], read: the map G-tilde(R) -> M(G)(S)[1/p] coming from Dieudonne theory agrees with q log, proved by functoriality reduction to G = Q_p/Z_p. The perfectoid-ball shape of the universal cover is [SW13, Proposition 3.1.3(iii)], read: if R is perfect of characteristic p, G connected and Lie G free of dimension d, then G-tilde = Spf R[[X_1^{1/p^infty}, ..., X_d^{1/p^infty}]].

**Construction/proof.** Equal characteristic: H^0(Y_S,O) is a space of Laurent series sum r_i pi^i with convergence conditions; phi = pi forces r_i = r_{i+1}^q, so everything is determined by r_0, which may be any topologically nilpotent element of R. Mixed characteristic: rewrite H^0(X_S,O(1)) as B_{R,[1,infty]}^{phi = pi}; by the contracting property of Frobenius replace B_{R,[1,infty]} by B^+_crys of R^{sharp+}/pi and apply [SW13, Theorem A] to identify it with Hom_{O_E}(E/O_E, G(R^{sharp+}/pi))[1/pi] = G-tilde(R^{sharp+}). The π-divisible normalization and precise crystalline Hom comparison are supplier obligations G-LT; full faithfulness alone is not asserted to be essential surjectivity. The agreement with the explicit series is [SW13, Lemma 3.5.1]; compatibility with the logarithm is immediate from the formulas.

**Direct imports.** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition), `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent` (companion part), `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology` (companion part), `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology` (companion part), `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`.

**Acceptance.** Verify the series sum pi^i [X^{q^{-i}}] converges and is phi = pi in an explicit chart Verify the logarithm formula log_G(X) = X + X^q/pi + ... + X^{q^n}/pi^n + ... and its convergence as a map of rigid spaces Verify G-tilde(A) = A^{flat,circ circ} on a concrete A

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.2, p. 60; [SW13-moduli](https://arxiv.org/pdf/1211.6357v2), Theorem A, p. 3; [SW13-moduli](https://arxiv.org/pdf/1211.6357v2), Proposition 3.1.3(iii), p. 22; [SW13-moduli](https://arxiv.org/pdf/1211.6357v2), Lemma 3.5.1, p. 29.

<a id="fundamental-exact-sequence"></a>

### FS II.2.3 and II.2.4: the fundamental exact sequence and (BC(O(1)) minus 0)/E^times = Div^1

**Declaration:** `FundamentalExactSequence` · **theorem** · `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`.

For any perfectoid S with untilt S^sharp over E_infty, the above construction gives an exact sequence 0 -> O_{X_S} -> O_{X_S}(1) -> O_{S^sharp} -> 0 of O_{X_S}-modules. Consequently there is a well-defined map BC(O(1)) minus {0} -> Div^1 sending a nonzero section f to V(f), and it descends to an isomorphism (BC(O(1)) minus {0})/E^times = Div^1. The scalar E×-torsor is the Lubin–Tate Tate-module torsor; its comparison with the divisor-to-Weil-group map imports VS1 and arithmetic local reciprocity, rather than reproving class field theory.

**Hypotheses.** For II.2.3 the untilt S^sharp must be over E_infty (the completion of the union of the Lubin-Tate level fields E_n), not merely over E; this is what supplies the canonical nonzero section The check that the map O_{X_S} -> I(1) is an isomorphism is done on geometric points The vanishing locus computation identifies the zeroes of the logarithm on G-tilde^ad_E minus {0} with the disjoint union over n of Spa E_n, each a simple zero Corollary II.2.4 uses BC(O(1)) = Spd F_q[[X^{1/p^infty}]], so BC(O(1)) minus {0} = Spa F_q((X^{1/p^infty})) = Spd E_infty, and the map to Div^1 is Spd E_infty -> Spd E -> Spd E/phi^Z, a quotient first by O_E^times and then by pi^Z

**Construction/proof.** The Lubin-Tate section gives a map O_{X_S} -> I(1) where I is the ideal sheaf of S^sharp, a line bundle by Prop. II.1.18. To see it is an isomorphism, check on geometric points S = Spa C; the section is f = sum pi^i [X-tilde^{q^{-i}}], the base change of the function sum pi^i X-tilde^{q^{-i}} on (Spa O_E[[X-tilde^{1/p^infty}]])_E minus V(X-tilde). Under G-tilde = Spf O_E[[X-tilde^{1/p^infty}]] this function is the logarithm; its vanishing locus is exactly the disjoint union of the Spa E_n inside G-tilde^ad_E minus {0}, with a simple zero at each. This gives the exact sequence. For II.2.4: identify BC(O(1)) minus {0} with Spd E_infty; the resulting E^times-quotient is exactly Div^1 = Spd E/phi^Z, and the induced map from the absolute Galois group of E to the profinite completion of E^times is the Artin reciprocity map.

**Direct imports.** [FS II.2.2: H^0(X_S,O(1)) is the universal cover of the Lubin-Tate formal group](#lubin-tate-universal-cover), `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles` (companion part), `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `VStackSheavesAndLisseCategories:VS1`.

**Acceptance.** Verify the simple-zero claim for the logarithm at each level E_n Verify that O_{X_S}([S^sharp]) = O_{X_S}(1), which is what makes deg O(1) = 1 Verify the Artin reciprocity identification against local class field theory

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Propositions II.2.3–II.2.4, pp. 60–61.


## VB3:projectivized-properness — the topological input

<a id="properness-of-projectivized-BC"></a>

### FS II.2.16: BC(E) is a locally spatial diamond partially proper over S, and its projectivization is proper

**Declaration:** `PropernessOfProjectivizedBc` · **theorem** · `VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`.

Let S be a perfectoid space over F_q and E a vector bundle on X_S. Then BC(E) : T -> H^0(X_T, E∣_{X_T}) is a locally spatial diamond, partially proper over S, and (BC(E) minus {0})/E^times is a locally spatial diamond, proper over S. The proof uses only ampleness (II.2.6) and the positive-twist statement II.2.5(iii); it does not use the classification theorem.

**Hypotheses.** S may be assumed qcqs for the second part The presentation 0 -> E -> O_{X_S}(n)^m -> O_{X_S}(n')^{m'} is obtained by applying Thm. II.2.6 to E^dual and dualising, with n, n' > 0 - the positivity of n, n' is what lets II.2.5(iii) apply It suffices to treat (BC(E) minus {0})/pi^Z because the O_E^times-action is free, so ECD Proposition 11.24 (last part) applies The contracting-action criterion is checked by formally reducing to BC(O_{X_S}(n)^m) and then to A^1_{S^sharp} by evaluating sections at a collection of untilts

**Construction/proof.** Apply Thm. II.2.6 to get O_{X_S}(-n')^{m'} -> O_{X_S}(-n)^m -> E^dual with n, n' > 0; dualise to 0 -> E -> O_{X_S}(n)^m -> O_{X_S}(n')^{m'}. Hence BC(E) is a closed subspace of BC(O_{X/S}(n))^m, and the first part follows from Prop. II.2.5(iii). For the second part, reduce to the pi^Z-quotient and apply Lemma II.2.17 on contracting actions of an automorphism on a taut locally spectral space whose generalization sets are totally ordered chains.

**Direct imports.** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition), `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation` (companion part), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part), [FS II.2.17: quotients by contracting automorphisms of taut locally spectral spaces](#contracting-action-lemma), `DiamondsAndVStacks:D5/relative-representability`, `DiamondEtaleCohomology:C4`, [Scalar projectivization](#scalar-projectivization).

**Acceptance.** Verify that the image of (BC(E) minus {0})/E^times -> S is closed, which is the use made of properness in Thm. II.2.19(i) Verify the hypotheses of Lemma II.2.17 for A^1_{S^sharp} with the multiplication-by-pi action Check the independence of the argument from Thm. II.2.14, as the stage text requires

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.16, p. 72.

<a id="contracting-action-lemma"></a>

### FS II.2.17: quotients by contracting automorphisms of taut locally spectral spaces

**Declaration:** `ContractingActionLemma` · **theorem** · `VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma`.

Let X be a taut locally spectral space such that for every x the set X_x of generalizations of x is a totally ordered chain under specialization. Let gamma be an automorphism of X whose fixed-point set X_0 is a spectral space, such that (i) for all x, gamma^n(x) converges to X_0 as n -> +infinity, and (ii) for all x outside X_0, gamma^n(x) leaves every quasicompact open as n -> -infinity. Then X_0 is closed, gamma acts freely and totally discontinuously on X minus X_0, and (X minus X_0)/gamma^Z is a spectral space.

**Hypotheses.** X taut locally spectral; generalization sets totally ordered chains (automatic for locally spatial diamonds by ECD Prop. 11.19, and tautness holds if X is partially proper over a spatial diamond by ECD Prop. 18.10) X_0 must be a spectral space, and both convergence conditions (i) and (ii) are needed Total discontinuity is in the strong sense: the action map (X minus X_0) x Z -> (X minus X_0) x (X minus X_0) is a closed immersion

**Construction/proof.** Arrange a quasicompact open neighbourhood U of X_0 with gamma(U) contained in U, by covering U with the gamma^{-n}(U) and using quasicompactness. Show X_0 = intersection over n >= 0 of gamma^n(U), and that for any other quasicompact open neighbourhood V of X_0 some gamma^n(U) lies in V (the gamma^n(U) minus V form a decreasing sequence of spectral spaces with empty limit). Use tautness: the closure U-bar is quasicompact and the sequences gamma^n(U) and gamma^n(U-bar) are cofinal, so X_0 is closed. For freeness/discontinuity: for x outside X_0 pick V inside U minus gamma^{n+1}(U) containing x, so gamma^i(V) misses V for i >= n+1; for the finitely many remaining i use the totally ordered generalization hypothesis: X_x has a unique generic point eta, and X_x meeting gamma^i(X_x) forces gamma^i(eta) = eta, so eta in X_0, hence x in X_0 since X_0 is closed - contradiction. Conclude the quotient is locally spectral, quasiseparated (intersections of admissible V's are admissible) and quasicompact (U-bar minus gamma(U) surjects continuously and bijectively onto it from a spectral space).

**Direct imports.** `mathlib:SpectralSpace`, `mathlib:Specializes`, `DiamondsAndVStacks:D0/locally-spectral-space`, `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`.

**Acceptance.** Verify hypotheses (i),(ii) for A^1_C with multiplication by pi Verify that the totally ordered generalization hypothesis is genuinely used, by finding where the argument breaks without it Verify quasicompactness of the quotient on an explicit example

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Lemma II.2.17, pp. 72–74.

<a id="scalar-projectivization"></a>

### Scalar projectivization

**Declaration:** `BCProjectivization` · **construction** · `VectorBundlesAndIsocrystals:VB3:projectivized-properness/scalar-projectivization`.

For an E-module BC v-sheaf W over S, define W× as the complement of its zero section and PBC(W)=W×/underline E×, the v-sheaf quotient of the scalar action. The quotient map is an E×-torsor on this punctured locus. Representability and properness are separate theorems. Apply to both section and two-term hypercohomology objects.

**Hypotheses.** W is an E-module v-sheaf; the zero section is closed in the locally spatial cases where complement is used.

**Construction/proof.** Use the relative complement and v-sheafification of scalar orbits, importing generic groupoid quotients. Field scalar action is free away from zero; its torsor presentation specifies maps out of the quotient. Perfectoid pullback commutes with this quotient.

**API.**

| Name | Role and contract |
| --- | --- |
| `BCProjectivization` | data: The v-sheaf quotient of punctured W by scalar E×. |
| `BCProjectivization.torsor` | structure: W×→PBC(W) is an underline E× torsor. |
| `BCProjectivization.lift` | universal-property: An E×-invariant map W×→Z descends uniquely to PBC(W). |
| `BCProjectivization.baseChange` | compatibility: Perfectoid base change commutes with scalar projectivization. |

**Consumers.** [FS II.2.16: BC(E) is a locally spatial diamond partially proper over S, and its projectivization is proper](#properness-of-projectivized-BC) state scalar properness independently of classification. [FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness](#families-of-banach-colmez-spaces) state the stronger two-term quotient theorem.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `BCProjectivizationTest.zero` | degenerate: PBC(0) is empty. |
| `BCProjectivizationTest.line` | computation: PBC(underline E)=S. |
| `BCProjectivizationTest.unitTwist` | compatibility: PBC(BC(O(1)))≅Div¹, with the fundamental scalar torsor. |
| `BCProjectivizationTest.absolute` | non-example: Punctured BC(O(d)) is spatial while its π^Z-quotient is not quasiseparated; ordinary properness does not imply total absolute spatiality. |

**Direct imports.** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition), `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D5/relative-representability`.

**Acceptance.** PBC(0) is empty, whereas PBC(underline E)=S.

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Propositions II.2.16 and II.3.5, pp. 72,80.


## VB4 — HN, purity, local systems and ampleness

<a id="semicontinuity-of-HN-polygon"></a>

### FS II.2.19(i): upper semicontinuity of the Harder-Narasimhan polygon in families

**Declaration:** `SemicontinuityOfHnPolygon` · **theorem** · `VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon`.

For a constant-rank n bundle E on X_S, the concave HN polygon, horizontal coordinate rank and decreasing slopes repeated with their ranks, is upper semicontinuous on ∣S∣: for every x∈[0,n] its ordinate is upper semicontinuous. Rank and total degree are locally constant. This is FS II.2.19(i), including equal-characteristic coefficient fields. The polygon is the UPPER boundary of the convex hull of the exterior-power section points; do not replace it by KL’s convex lower polygon.

**Hypotheses.** S is perfectoid over F_q; rank n is constant on the component considered. Geometric-point values are invariant under extension of the complete algebraically closed field.

**Construction/proof.** Properness of punctured scalar quotients makes the nonzero-section locus closed. Apply this to all exterior powers and negative twists; the maximal integral degrees of sections recover the upper convex-hull boundary. Rank and determinant degree determine locally constant endpoints; use the companion normalization rather than swapping rank and degree axes.

**Direct imports.** [FS II.2.16: BC(E) is a locally spatial diamond partially proper over S, and its projectivization is proper](#properness-of-projectivized-BC), `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon` (companion part), `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism` (companion part), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part).

**Acceptance.** Verify the convex-hull description of the polygon on a rank-2 example with slopes 0 and 1 Exhibit a family where the polygon jumps and check the direction of semicontinuity Check that the argument does not use Thm. II.2.14

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Theorem II.2.19(i) and proof, p. 74.

<a id="relative-HN-filtration-and-proetale-splitting"></a>

### FS II.2.19(ii): the global HN filtration on constant-polygon loci and its pro-etale splitting

**Declaration:** `RelativeHnFiltrationAndProetaleSplitting` · **theorem** · `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`.

Assume the HN polygon of E is constant on S. Then there exists a global separated exhaustive decreasing Harder-Narasimhan filtration E^{>= lambda} in E specialising to the HN filtration at each point; and after replacing S by a PRO-ETALE cover the filtration can be split, with isomorphisms E^lambda = O_{X_S}(lambda)^{n_lambda} for integers n_lambda >= 0.

**Hypotheses.** S is perfectoid over F_q, the bundle has constant rank and constant geometric HN polygon. Splitting is PRO-ÉTALE local; it is not asserted étale local or globally split.

**Construction/proof.** Twist the maximal slope to zero and use the proper nowhere-zero-section locus to obtain a v-cover with a trivial rank-one subbundle and locally free cokernel. Induct on rank, descend the canonical HN subbundles by uniqueness, and use the geometric Hom/Ext calculations to split after extension. The graded isomorphism sheaf is a torsor for the relevant locally profinite automorphism groups; D3 makes it pro-étale.

**Direct imports.** [FS II.2.19(i): upper semicontinuity of the Harder-Narasimhan polygon in families](#semicontinuity-of-HN-polygon), [FS II.2.16: BC(E) is a locally spatial diamond partially proper over S, and its projectivization is proper](#properness-of-projectivized-BC), `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` (companion part), `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus` (companion part), `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondEtaleCohomology:C4`.

**Acceptance.** Verify that v-local splitting really upgrades to pro-etale and not to etale Verify the surjectivity of the dual map at a geometric point using stability of O(-lambda) Exhibit a constant-polygon family where the filtration does not split Zariski-locally

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Theorem II.2.19(ii), pp. 74–75.

<a id="slope-zero-local-systems"></a>

### FS II.2.20: slope-zero bundles are pro-etale E-local systems

**Declaration:** `SlopeZeroLocalSystems` · **theorem** · `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`.

There is an exact tensor equivalence between finite-rank pro-étale E-local systems on S and vector bundles on X_S whose EVERY geometric HN slope is zero, via L↦L⊗_E O_X. The quasi-inverse is T↦H⁰(X_T,E_T); it commutes with perfectoid base change and coefficient extension with its normalized Frobenius. Locally constant rank is handled componentwise. Total degree zero alone does not suffice.

**Hypotheses.** The condition is that the HN polygon is CONSTANT ZERO, i.e. everywhere semistable of slope 0, not merely fibrewise trivial Full faithfulness is proved by pro-etale descent, reducing to L trivial, and then by Prop. II.2.5(ii): H^0(X_S,O) = E and H^1(X_S,O) = RGamma_proet(S,E) in degree 1 Essential surjectivity is Thm. II.2.19(ii) applied with a single slope 0 A local system is not the same as a globally trivial bundle: the descent datum is the content

**Construction/proof.** Full faithfulness: descend pro-etale-locally to L trivial and apply Prop. II.2.5(ii) to identify Hom. Essential surjectivity: apply Thm. II.2.19(ii) to E with constant zero polygon; pro-etale locally E is trivial, and the descent datum gives the local system.

**Direct imports.** [FS II.2.19(ii): the global HN filtration on constant-polygon loci and its pro-etale splitting](#relative-HN-filtration-and-proetale-splitting), `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology` (companion part), `DiamondsAndVStacks:D3/locally-profinite-torsors`, `mathlib:CategoryTheory.Equivalence`.

**Acceptance.** Exhibit a slope-zero bundle with nontrivial monodromy, i.e. a nonconstant local system, confirming that pro-etale triviality is not global triviality Check tensor and scalar-extension compatibility of the equivalence Check that a bundle with fibrewise slope 0 but nonconstant polygon is excluded

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Corollary II.2.20, p. 75.

<a id="relative-cohomology-vanishing"></a>

### Slope-dependent cohomology vanishing

**Declaration:** `RelativeCohomologyVanishing` · **theorem** · `VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`.

For a bundle E on X_S: everywhere negative slopes imply H⁰(X_S,E)=0, universally after perfectoid base change; everywhere nonnegative slopes imply H¹(X_S,E)=0 after some pro-étale cover of S; everywhere positive slopes imply an étale cover S′→S such that H¹(X_T,E_T)=0 for EVERY affinoid perfectoid T/S′. The second assertion is local vanishing of cohomology, not vanishing on every original S.

**Hypotheses.** S∈Perf_Fq; slope assertions hold at all geometric points.

**Construction/proof.** Check H⁰=0 on geometric points and use v-descent. Resolve a nonnegative bundle by a slope-zero bundle and negative twists; use relative HN and the identification H¹(O)=H¹_proét(S,E), which vanishes pro-étale locally. For strict positivity use the étale presentation by O(1/r), then the standard positive-twist H¹ vanishing on affinoids.

**Direct imports.** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition), [FS II.2.19(ii): the global HN filtration on constant-polygon loci and its pro-etale splitting](#relative-HN-filtration-and-proetale-splitting), [FS II.3.1 and Cor. II.3.3: resolving a positive-slope bundle by semistable bundles of small slope](#positive-slope-resolution), [Étale positive-slope presentations](#strict-positive-etale-presentations), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part), `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology` (companion part).

**Acceptance.** O is the boundary case: H¹_proét(S,E) can be nonzero before a cover.

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.3.4(i)–(iii), p. 79.

<a id="annular-basis-approximation"></a>

### Annular basis approximation

**Declaration:** `AnnularBasisApproximation` · **theorem** · `VectorBundlesAndIsocrystals:VB4/annular-basis-approximation`.

Let M be a φ^a-module over ℛ̃_R with models M_r. (7.1.1) If v_1, …, v_n is a basis of M_{[r/q,r]} on which φ^a acts via an invertible matrix over ℛ̃^{r/q}_R, then it is a basis of M_r. (7.1.2) Let h ≥ 0, let D be diagonal with entries p^{d_1}, …, p^{d_n} (d_i ∈ ℤ, no two differing by more than h), and let e_1, …, e_n be a basis of M_{[r/q,r]} on which φ^a acts via F over ℛ̃^{[r/q,r/q]}_R with λ(α^{r/q})(FD − 1) < p^{−h}. Then M_r has a basis v_j = Σ_i U_{ij} e_i on which φ^a acts via F′ with F′D − 1 having entries in pℛ̃^{int,r/q}_R, where λ(α^{r/q})(U − 1), λ(α^r)(D^{−1}UD − 1) < p^{−h}.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Extend an annular basis inward with Frobenius and finite-projective gluing (7.1.1). For 7.1.2 correct the gauge matrices iteratively; the norm error strictly decreases, so the matrices converge. Preserve FD−1, not FD^{-1}−1, in the estimates.

**Direct imports.** `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent` (companion part), `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring` (companion part).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.1, Lemmas 7.1.1–7.1.2, pp. 145–146.

<a id="pure-models"></a>

### Pure models and purity loci

**Declaration:** `PureModel` · **definition** · `VectorBundlesAndIsocrystals:VB4/pure-models`.

Let c, d ∈ ℤ with d a positive multiple of a. A (c,d)-pure model of a φ^a-module M over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R) Let c, d ∈ ℤ with d a positive multiple of a. A (c,d)-pure model of a φ^a-module M over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R) is a W(R)-submodule (resp. ℛ̃^int_R-submodule) M_0 of M which is bounded (there is a finitely generated submodule N_0 over the same subring with p^n M_0 ⊆ N_0 and p^n N_0 ⊆ M_0 for some n ≥ 0) such that the natural map M_0 ⊗_{W(R)} ℰ̃_R → M (resp. M_0 ⊗_{ℛ̃^int_R} ℛ̃^bd_R → M, M_0 ⊗_{ℛ̃^int_R} ℛ̃_R → M) is an isomorphism and the φ^a-action on M induces an isomorphism (p^cφ^d)^*M_0 ≅ M_0 (only stability of M_0[p^{−1}] under φ^d, not φ^a, is assumed; Remark 7.3.2). Its existence makes M pointwise pure of constant slope c/d; a (0,d)-pure model is an étale model; a pure model is (locally) free if its underlying module is finite (locally) free, and a finitely presented pure model is locally free. A (locally free, free) local (c,d)-pure model at β ∈ ℳ(R) is a rational localization R → R′ encircling β together with a (locally free, free) (c,d)-pure model of the base extension of M to R′. M has a locally free local pure model at β iff it has a free one, and over ℛ̃^bd_R this can be tested over ℰ̃_R (Lemma 7.3.3). M is pure of slope s at β if it has a locally free local (c,d)-pure model at β with c/d = s (forcing s = μ(M, β) when rank(M, β) > 0; every slope when the rank is 0), pure if it is pure at every β (finitely many local models then cover ℳ(R)), étale = pure of slope 0, and globally pure if it has a locally free pure model. For the conditions (a) globally pure, (b) admits a pure model, (c) pure, (d) admits local pure models, (e) pointwise pure: over ℰ̃_R and ℛ̃^bd_R, (a) strictly implies (b) and (b)–(e) are equivalent; over ℛ̃_R, (a) strictly implies (b), (b) strictly implies (c), and (c)–(e) are equivalent (by Corollaries 7.3.9 and 8.5.14 and Examples 8.5.17 (Tate curve) and 8.5.18 (banana)). Purity of a φ^a-module over ℛ̃^bd_R cannot be read off from its base extension to ℛ̃_R.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Use bounded integral submodules generating M by scalar extension, with p^cφ^d-linearized action an isomorphism. Localize rationally around a seminorm to define local models; finite presentation gives local freeness. Separate globally pure from locally pure; zero-rank fibres count as pure of every slope.

**API.**

| Name | Role and contract |
| --- | --- |
| `PureModel` | data: A bounded integral submodule generating the ambient Frobenius module, with p^cφ^d linearization invertible. |
| `PureModel.lattice` | projection: The integral lattice is a Submodule of the restricted-scalars module, with its actual inclusion. |
| `PureModel.baseChange` | functoriality: Rational localization transports the pure model, its boundedness and its Frobenius isomorphism. |
| `PureModel.etale` | characterisation: A (0,d)-pure model is an étale model; globally pure means a globally finite locally free such model. |
| `PureModel.fibreSlope` | compatibility: On a nonzero fibre a (c,d)-pure model forces the Robba slope c/d, with p^cφ^d=1 on a trivializing basis. |

**Consumers.** [Openness and pointwise detection of purity](#purity-openness) spread integral fibre lattices to neighbourhoods. [Pure modules and twisted local systems](#pure-modules-local-systems) identify local models with twisted local systems.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `PureModelTest.unit` | computation: The trivial φ-module with unit integral lattice is (0,a)-pure. |
| `PureModelTest.zero` | degenerate: The zero module is pure of every slope; it has no distinguished numeric slope. |
| `PureModelTest.scaled` | computation: A rank-one action φ^d=p^{−c} with standard lattice is (c,d)-pure, detecting the sign of p^c. |
| `PureModelTest.localNotGlobal` | non-example: The perfected Tate-curve local system with p monodromy is locally étale but has no global integral étale model. |

**Direct imports.** `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules` (companion part), `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring` (companion part), `mathlib:Submodule`.

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.3, Definitions 7.3.1 and 7.3.4, Lemma 7.3.3 and Remarks 7.3.2, 7.3.5, 7.3.11, pp. 147–152.

<a id="pure-model-trivialization"></a>

### Pro-étale trivialization of pure models

**Declaration:** `PureModelTrivialization` · **theorem** · `VectorBundlesAndIsocrystals:VB4/pure-model-trivialization`.

If a φ^a-module M over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R) has a free (c,d)-pure model M_0, there is an R-algebra S, the completed direct limit of faithfully finite étale R-subalgebras, such that M_0 ⊗ W(S) (resp. M_0 ⊗ ℛ̃^int_S) has a basis fixed by p^cφ^d.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Trivialize modulo p by Lang/Artin–Schreier–Witt torsors. Correct the invariant basis p-adically and use contraction to keep it in the integral Robba subring; the extension is a COMPLETED finite-étale direct limit.

**Direct imports.** [Pure models and purity loci](#pure-models).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.3, Proposition 7.3.6, p. 149.

<a id="purity-openness"></a>

### Openness and pointwise detection of purity

**Declaration:** `PurityOpenness` · **theorem** · `VectorBundlesAndIsocrystals:VB4/purity-openness`.

Let M be a φ^a-module over ℛ̃_R of nowhere zero rank, β a point of its pure locus, and c, d ∈ ℤ with d a positive multiple of a and c/d = μ(M, β). Every (c,d)-pure model of M ⊗ ℛ̃_{ℋ(β)} extends to a free local (c,d)-pure model of M at β (Theorem 7.3.7). Consequently, for any φ^a-module M over ℛ̃_R: the pure and étale loci are open; M is étale (resp. pure) iff it is pointwise étale (resp. pointwise pure); and M is pure at β iff it has a (not necessarily locally free) local pure model at β.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Use a good pure fibre basis, spread its annular approximation to a rational neighbourhood, and correct it by the gauge estimate. Localize to make the integral lattice free; compactness supplies a finite rational cover of all seminorms.

**Direct imports.** [Annular basis approximation](#annular-basis-approximation), [Pure models and purity loci](#pure-models).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.3, Theorem 7.3.7 and Corollaries 7.3.8–7.3.10, pp. 150–151.

<a id="diagonal-gauge-normal-form"></a>

### Diagonal Frobenius gauge normal form

**Declaration:** `DiagonalGaugeNormalForm` · **lemma** · `VectorBundlesAndIsocrystals:VB4/diagonal-gauge-normal-form`.

Let M be a φ^a-module over ℛ̃^bd_R with a basis on which φ^a acts via AD, D diagonal with entries in p^ℤ and A − 1 with entries in pℛ̃^int_R. Then there are an R-algebra S which is the union (not only the completed union) of faithfully finite étale R-subalgebras and an invertible U over W(S), congruent to 1 modulo p, with U^{−1}ADφ^a(U) = D. In particular, at every β ∈ ℳ(R) the generic slopes of M are the negatives of the p-adic valuations of the diagonal entries of D, divided by a.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Solve the off-diagonal gauge equations by p-adic iteration after finite étale extensions. For every residue precision only finitely many étale extensions are needed; the coefficients live in their UNION, rather than requiring its completion.

**Direct imports.** [Annular basis approximation](#annular-basis-approximation).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.4, Lemma 7.4.4, p. 152.

<a id="robba-polygon-semicontinuity"></a>

### Robba slope-polygon semicontinuity

**Declaration:** `RobbaPolygonSemicontinuity` · **theorem** · `VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity`.

For any φ^a-module M over ℛ̃_R, β ↦ the slope polygon of M ⊗ ℛ̃_{ℋ(β)} is lower semicontinuous on ℳ(R): where the rank is constant, for each x ∈ [0, rank M] the y-coordinate of the polygon at x is a lower semicontinuous function of β, and it is locally constant at x = rank M.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Approximate a diagonalized fibre basis; the normal-form estimate controls the nearby polygons. Apply exterior powers to all vertices; the degree of the determinant is locally constant.

**Direct imports.** [Annular basis approximation](#annular-basis-approximation), [Diagonal Frobenius gauge normal form](#diagonal-gauge-normal-form), [Pure models and purity loci](#pure-models).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.4, Theorem 7.4.5, p. 153.

<a id="bounded-polygons-dense-locus"></a>

### Bounded polygons and dense constant loci

**Declaration:** `BoundedPolygonsDenseLocus` · **theorem** · `VectorBundlesAndIsocrystals:VB4/bounded-polygons-dense-locus`.

For any φ^a-module M over ℛ̃_R, the slope polygons of M at the points of ℳ(R) are bounded above and below (all slopes are at least −N/a for N as in Proposition 6.2.4, and the sum of the slopes is continuous). Hence the polygon takes finitely many values locally, and there is an open dense U ⊆ ℳ(R) on which it is locally constant.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Global generation of a sufficiently positive twist bounds the slopes below; determinant degree bounds them above. Bounded slopes of fixed finite rank and discrete denominators give finitely many polygons; semicontinuity gives a dense open locus of local constancy.

**Direct imports.** `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation` (companion part), [Robba slope-polygon semicontinuity](#robba-polygon-semicontinuity).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.4, Proposition 7.4.6 and Corollary 7.4.7, pp. 153–154.

<a id="constant-vertex-submodule"></a>

### Submodule at a constant polygon vertex

**Declaration:** `ConstantVertexSubmodule` · **theorem** · `VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule`.

(7.4.8) Let A be an n × n matrix over ℛ̃^int_R invertible over ℛ̃^bd_R, x_1, …, x_n ∈ ℛ̃^bd_R, and y_1, …, y_n ∈ ℰ̃_R with y_i − x_i = Σ_j A_{ij}φ^a(y_j). Then all y_i lie in ℛ̃^bd_R iff their images lie in ℛ̃^bd_{ℋ(β)} for every β ∈ ℳ(R). (7.4.9) Let M over ℛ̃_R have constant rank n and slopes μ_1(M,β) ≥ ⋯ ≥ μ_n(M,β) at β. If for some m ∈ {1, …, n−1} and all β we have μ_m(M,β) > μ_{m+1}(M,β) and μ_1 + ⋯ + μ_m constant, there is a unique φ^a-submodule N of rank m with M/N a φ^a-module such that at every β the slopes of N are μ_1, …, μ_m and those of M/N are μ_{m+1}, …, μ_n.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Use the uniformly bounded Frobenius difference-equation criterion 7.4.8 to descend the fibrewise summand to bounded Robba coefficients. Take the exterior-power line for the fixed vertex and descend its associated submodule; uniqueness follows from separated slopes. The quotient is finite projective. A global splitting is not a conclusion.

**Direct imports.** [Robba slope-polygon semicontinuity](#robba-polygon-semicontinuity), [Pure models and purity loci](#pure-models).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.4, Lemma 7.4.8 and Theorem 7.4.9, pp. 154–155.

<a id="robba-constant-polygon-filtration"></a>

### Robba filtration on a constant-polygon locus

**Declaration:** `RobbaConstantPolygonFiltration` · **theorem** · `VectorBundlesAndIsocrystals:VB4/robba-constant-polygon-filtration`.

If the slope polygon of a φ^a-module M over ℛ̃_R is constant on ℳ(R), there is a unique filtration 0 = M_0 ⊂ ⋯ ⊂ M_l = M by φ^a-submodules whose quotients are φ^a-modules pure of constant slope with μ(M_1/M_0) > ⋯ > μ(M_l/M_{l−1}).

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Apply the constant-vertex theorem at each strict break. Induct on rank, obtain pure graded pieces by pointwise purity, and use uniqueness for gluing.

**Direct imports.** [Submodule at a constant polygon vertex](#constant-vertex-submodule), [Openness and pointwise detection of purity](#purity-openness).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.4, Corollary 7.4.10, p. 155.

<a id="negative-frobenius-cohomology-detection"></a>

### Pointwise detection of negative Frobenius cohomology

**Declaration:** `NegativeFrobeniusCohomologyDetection` · **theorem** · `VectorBundlesAndIsocrystals:VB4/negative-frobenius-cohomology-detection`.

If M over ℛ̃_R has everywhere negative slopes, then H^0_{φ^a}(M) = 0, H^0_{φ^a}(M ⊗ ℛ̃_{ℋ(β)}) = 0 for all β ∈ ℳ(R), and H^1_{φ^a}(M) → ∏_β H^1_{φ^a}(M ⊗ ℛ̃_{ℋ(β)}) is injective. For any M this applies to M(n) for n small enough (by Proposition 7.4.6); the injectivity also holds for n large, since then H^1_{φ^a}(M(n)) = 0 by Proposition 6.2.2.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Negative slopes kill H⁰ on every fibre. Interpret an H¹ class as an extension by the trivial module; if it splits at all fibres, the constant-vertex filtration canonically splits it globally.

**Direct imports.** `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology` (companion part), [Robba filtration on a constant-polygon locus](#robba-constant-polygon-filtration).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §7.4, Corollary 7.4.11 and Remark 7.4.12, pp. 155–156.

<a id="ring-sheaf-frobenius-comparison"></a>

### Ring and sheaf Frobenius-module comparison

**Declaration:** `RingSheafFrobeniusComparison` · **comparison** · `VectorBundlesAndIsocrystals:VB4/ring-sheaf-frobenius-comparison`.

Let (R, R⁺) be a perfect uniform adic Banach algebra over 𝔽_p and X = Spa(R, R⁺). For ∗ ∈ {ℰ̃, ℛ̃^bd, ℛ̃}, the natural functor from φ^d-modules over ∗_R to φ^d-modules over the sheaf ∗_X (called local φ^d-modules over ∗_R) is fully faithful (Theorem 5.3.3). For ∗ = ℛ̃ it is an equivalence of categories (Corollary 6.3.13); for ∗ = ℰ̃ and ∗ = ℛ̃^bd it is not (Example 8.5.17). A φ^d-module over ∗_R is pure (resp. étale) if and only if the corresponding φ^d-module over ∗_X is.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Use sheafiness and rational descent for full faithfulness. Full Robba modules glue by the bundle equivalence; the Tate-curve example obstructs essential surjectivity for completed and bounded coefficient rings.

**Direct imports.** `VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence` (companion part), [Pure models and purity loci](#pure-models).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.5, Remark 8.5.10, p. 172 (arXiv 1301.0792v5).

<a id="adic-purity-loci"></a>

### Adic pure and étale loci

**Declaration:** `AdicPurityLoci` · **theorem** · `VectorBundlesAndIsocrystals:VB4/adic-purity-loci`.

Let X be a perfect uniform adic space over 𝔽_{p^d} and M a φ^d-module over ℛ̃_X. Then the pure locus and the étale locus of M [printed 'of ℛ̃_X'] are open and partially proper (partial properness, Definition 8.2.11, presupposes X over an analytic field). In particular, by Lemma 8.2.12, if X is taut then so are the pure locus and the étale locus.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Pull back the seminorm purity locus along the adic rank-one retraction. Openness and partial properness follow from saturation under generalization; partial properness requires a space over an analytic field.

**Direct imports.** [Openness and pointwise detection of purity](#purity-openness).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.5, Lemma 8.5.11, p. 173 (arXiv 1301.0792v5).

<a id="pure-modules-local-systems"></a>

### Pure modules and twisted local systems

**Declaration:** `PureModulesLocalSystems` · **comparison** · `VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems`.

Let X be a perfectoid adic space over ℚ_{p^d}, X′ the corresponding perfect uniform adic space over 𝔽_{p^d}, and c ∈ ℤ. The following categories are equivalent: (a) étale (c, d)-ℚ_p-local systems over X; (b) étale (c, d)-ℚ_p-local systems over X′; (c) étale (c, d)-ℚ_p-local systems over X_0′ for any adic space X_0′ whose inverse perfection is isomorphic to X′; (d) (c, d)-pure φ-modules over ℰ̃_{X′}; (e) (c, d)-pure φ-modules over ℛ̃^bd_{X′}; (f) (c, d)-pure φ-modules over ℛ̃_{X′}.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Combine the global isogeny-local-system/pure-model comparison with tilting and descent. Sheafify the equivalence on rational opens. Only Q_p and its unramified degree-d extension are claimed.

**Direct imports.** [Pure models and purity loci](#pure-models), [Pro-étale trivialization of pure models](#pure-model-trivialization), [Ring and sheaf Frobenius-module comparison](#ring-sheaf-frobenius-comparison), [Twisted rational local systems](#twisted-local-systems), [Integral Frobenius and local-system comparison](#integral-frobenius-local-systems), `mathlib:CategoryTheory.Equivalence`.

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.5, Theorem 8.5.12, p. 173 (arXiv 1301.0792v5).

<a id="purity-denominator-independence"></a>

### Independence of purity denominator

**Declaration:** `PurityDenominatorIndependence` · **theorem** · `VectorBundlesAndIsocrystals:VB4/purity-denominator-independence`.

Let X be a perfect uniform adic space over 𝔽_{p^d}. A φ^d-module over ℰ̃_X, ℛ̃^bd_X or ℛ̃_X is pure of slope s at a point x ∈ X if and only if it is (c′, d′)-pure at x for every (not just one) pair of integers (c′, d′) with d′ a positive multiple of d and c′/d′ = s.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Transport along the (c,d)-local-system comparison. Use unramified coefficient extension and Hilbert 90 for proportional pairs; do not declare the integral models equal.

**Direct imports.** [Pure modules and twisted local systems](#pure-modules-local-systems).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.5, Corollary 8.5.13, p. 173 (arXiv 1301.0792v5).

<a id="all-rings-pointwise-purity"></a>

### Pointwise purity over all three coefficient rings

**Declaration:** `AllRingsPointwisePurity` · **theorem** · `VectorBundlesAndIsocrystals:VB4/all-rings-pointwise-purity`.

Let (R, R⁺) be as in Hypothesis 5.0.1 (a perfect uniform adic Banach algebra over 𝔽_p that is a Banach algebra over an analytic field) and M a φ^d-module over ℰ̃_R, ℛ̃^bd_R or ℛ̃_R. If M is pointwise pure (M ⊗ ℋ(β) is pure for every β ∈ ℳ(R)), then M is pure (it admits a locally free local pure model at every β ∈ ℳ(R)).

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** For completed/bounded coefficients approximate a fibre cyclic vector on a rational neighbourhood. Its iterates yield a free pure local model; use the full Robba result separately.

**Direct imports.** [Openness and pointwise detection of purity](#purity-openness), [Pure modules and twisted local systems](#pure-modules-local-systems).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.5, Corollary 8.5.14, p. 173 (arXiv 1301.0792v5).

<a id="surjective-purity-descent"></a>

### Surjective descent and detection of purity

**Declaration:** `SurjectivePurityDescent` · **theorem** · `VectorBundlesAndIsocrystals:VB4/surjective-purity-descent`.

Let (R, R⁺) → (S, S⁺) be a bounded homomorphism of perfect uniform adic Banach algebras over 𝔽_{p^d} such that Spa(S, S⁺) → Spa(R, R⁺) is surjective, and let M be a local φ^d-module over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R). Then M is pure if and only if M ⊗ ℰ̃_S (resp. M ⊗ ℛ̃^bd_S, M ⊗ ℛ̃_S) is pure. Corollary 8.5.16 globalizes this equivalence to any surjective morphism of perfectoid adic spaces for full Robba sheaves.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Use purity’s dependence only on the corresponding rank-one seminorm and its residue extension. A bounded surjective adic map lifts every seminorm; apply pointwise detection and glue local models.

**Direct imports.** [Pointwise purity over all three coefficient rings](#all-rings-pointwise-purity).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.5, Corollary 8.5.15, p. 174 (arXiv 1301.0792v5).

<a id="local-global-purity-counterexamples"></a>

### Local purity without global pure models

**Declaration:** `LocalGlobalPurityCounterexamples` · **application** · `VectorBundlesAndIsocrystals:VB4/local-global-purity-counterexamples`.

Let K = 𝔽_p((q)) with ∣q∣ = ω < 1, B = K{ω²/T, T, U/ω^{−2}}/(U(T − q) − 1) (so Spa(B, B°) is the annulus ω² ≤ ∣T∣ ≤ 1 minus the open disc ∣T − q∣ < ω²), and B_1 = K{ω²/T, T/ω²}, B_2 = K{1/T, T} (its boundary circles ∣T∣ = ω² and ∣T∣ = 1). The substitution T ↦ q²T is an isomorphism σ_q: B_1 → B_2 [printed as a map B_2 → B_1]; identifying the two circles through it gives a strictly affinoid subspace Spa(A, A°) of the Tate curve over K with parameter q², the analytification of a smooth projective genus-1 curve over K. Glueing the trivial ℚ_p-local system on Spa(B, B°) along this identification by matching the generator 1 on one circle with p on the other gives an étale ℚ_p-local system V on Spa(A, A°). Let R, S, S_1, S_2 be the completed perfections of A, B, B_1, B_2 and X = Spa(R, R°). Then V corresponds to no étale φ-module over ℰ̃_R or ℛ̃^bd_R (a nonzero v would give x ∈ ℰ̃_S with x_2 = pσ_q(x_1) ∈ ℰ̃_{S_2}, forcing x ∈ ∩_m p^m W(S) = 0). By Theorem 8.5.12, V does correspond to an étale φ-module over ℛ̃_R and to étale φ-modules over ℰ̃_X and ℛ̃^bd_X, which therefore do not descend to ℰ̃_R, ℛ̃^bd_R (an obstruction to glueing finite projective modules over these rings, Remark 5.3.7); and the étale φ-module over ℛ̃_R admits no étale model, locally free or not. For the nodal example, we also retain Example 8.5.18 as a sheaf-level locally étale but not globally étale counterexample; the ring-level strengthening is G-PATCH.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** On the perfected Tate-curve annulus glue a generator to p times a generator; no nonzero global lattice is invariant under repeated transport. For the perfected nodal curve Y²=(X²−1)², p≠2, the infinite-chain cover gives a Q_p local system without a global Z_p lattice. Keep the latter SHEAF counterexample as stated. The ring-level strengthening needs Milnor patching (G-PATCH), not the sheaf comparison alone.

**Direct imports.** [Ring and sheaf Frobenius-module comparison](#ring-sheaf-frobenius-comparison), [Pure modules and twisted local systems](#pure-modules-local-systems).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.5, Example 8.5.17, pp. 174–175 (arXiv 1301.0792v5).

<a id="pure-two-out-of-three"></a>

### Pure modules in short exact sequences

**Declaration:** `PureTwoOutOfThree` · **theorem** · `VectorBundlesAndIsocrystals:VB4/pure-two-out-of-three`.

Assume Hypothesis 8.6.1. Let 0 → M_1 → M → M_2 → 0 be a short exact sequence of φ-modules over ℛ̃_R. If any two of M, M_1, M_2 are (c, d)-pure, then so is the third.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

**Construction/proof.** Reduce to a geometric seminorm; slope inequalities and rank-degree additivity make the third term pure of the common slope. Invoke pointwise purity detection to construct its local models.

**Direct imports.** [Pointwise purity over all three coefficient rings](#all-rings-pointwise-purity).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.6, Lemma 8.6.3, p. 176 (arXiv 1301.0792v5).

<a id="pointwise-ampleness"></a>

### Pointwise ampleness

**Declaration:** `PointwiseAmple` · **definition** · `VectorBundlesAndIsocrystals:VB4/pointwise-ampleness`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), let F be a vector bundle on Proj(P_R) and M the φ^a-module over ℛ̃_R corresponding to it (Theorem 6.3.12). The slope polygon of F is the function on ℳ(R) (and on Spa(R, R⁺) by retraction) given by the fibrewise Harder–Narasimhan polygon; it agrees with the slope polygon of M (Remark 4.2.18). F is pointwise ample at β ∈ ℳ(R) if all slopes of F at β are positive; by Theorem 7.4.5 this is an open condition on ℳ(R). F is pointwise ample if it is pointwise ample at every β.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

**Construction/proof.** Use the existing fibre polygon; require every slope to be strictly positive. Transfer the predicate across the companion Proj/Robba equivalence; no new generic definition of ample vector bundle is introduced.

**API.**

| Name | Role and contract |
| --- | --- |
| `PointwiseAmple` | data: At β the predicate that all slopes of the fibre polygon are strictly positive. |
| `PointwiseAmple.pullback` | functoriality: The predicate is preserved under residue-field extension and perfectoid pullback. |
| `PointwiseAmple.tensor` | compatibility: Tensor products of positive fibres are positive, with slopes added with their multiplicities. |
| `PointwiseAmple.projComparison` | compatibility: The predicate agrees for a Proj bundle and its full Robba module under the companion equivalence. |

**Consumers.** [Positive tensor powers dominate a bundle](#positive-tensor-domination) control large tensor powers. [Ampleness and positive fibre slopes](#ample-iff-pointwise) characterize the imported local ampleness predicate.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `PointwiseAmpleTest.positive` | computation: O(1) is pointwise ample. |
| `PointwiseAmpleTest.unit` | non-example: O is not pointwise ample: its slope is zero. |
| `PointwiseAmpleTest.mixed` | non-example: O(2)⊕O(−1) has positive total degree but is not pointwise ample. |
| `PointwiseAmpleTest.zero` | degenerate: The zero bundle satisfies the every-slope predicate vacuously; it has no positive rank or numerical slope. |

**Direct imports.** `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon` (companion part), `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness` (companion part), [Robba slope-polygon semicontinuity](#robba-polygon-semicontinuity).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.8, Definition 8.8.10, pp. 182–183 (arXiv 1301.0792v5).

<a id="positive-tensor-domination"></a>

### Positive tensor powers dominate a bundle

**Declaration:** `PositiveTensorDomination` · **theorem** · `VectorBundlesAndIsocrystals:VB4/positive-tensor-domination`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), for any pointwise ample vector bundle F on Proj(P_R) and any vector bundle G on Proj(P_R) there exists n_0 ∈ ℤ such that F^{⊗n} ⊗ G is pointwise ample for all n ≥ n_0.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

**Construction/proof.** Use the uniform lower bound on the least slope of the pointwise-positive F and upper/lower bounds for G. Tensor slope additivity gives positivity for all n beyond a common threshold.

**Direct imports.** [Bounded polygons and dense constant loci](#bounded-polygons-dense-locus), [Pointwise ampleness](#pointwise-ampleness).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.8, Lemma 8.8.11 and its proof, p. 183 (arXiv 1301.0792v5).

<a id="geometric-positive-generation"></a>

### Positive bundles on the geometric Proj curve

**Declaration:** `GeometricPositiveGeneration` · **theorem** · `VectorBundlesAndIsocrystals:VB4/geometric-positive-generation`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5) with R = L an analytic field, let F be an ample vector bundle on Proj(P_L). Then H^1(Proj(P_L), F) = 0. Under the same analytic-field hypothesis, F is generated by H⁰(Proj(P_L),F), Lemma 8.8.12(b).

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

**Construction/proof.** By the geometric classification reduce H¹=0 to a positive pure block. For generation multiply the slope denominator to make standard summands integral; descend generation from the unramified coefficient extension.

**Direct imports.** `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part), `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence` (companion part), [Pointwise ampleness](#pointwise-ampleness).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.8, Lemma 8.8.12(a) and its proof, p. 183 (arXiv 1301.0792v5).

<a id="nonnegative-extension"></a>

### Nonnegative extension by a negative twist

**Declaration:** `NonnegativeExtension` · **theorem** · `VectorBundlesAndIsocrystals:VB4/nonnegative-extension`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), let F be a vector bundle on Proj(P_R) whose slopes at some β ∈ ℳ(R) are all nonnegative but not all zero. Then there exists a short exact sequence 0 → O(−1) → G → F → 0 of vector bundles on Proj(P_R) such that the slopes of G at β are also all nonnegative.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

**Construction/proof.** Build 0→O(−1)→G→F→0 using a nontrivial fibrewise extension of the positive summand. Use stability and slope inequalities to show G still has nonnegative slopes at the specified point. Degrees lie in (1/a)Z: the twist O(−1) has degree −1/a.

**Direct imports.** [Robba slope-polygon semicontinuity](#robba-polygon-semicontinuity), [Positive bundles on the geometric Proj curve](#geometric-positive-generation).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.8, Lemma 8.8.13 and its proof, pp. 183–185 (arXiv 1301.0792v5).

<a id="etale-at-point-resolution"></a>

### Resolution by an étale-at-a-point bundle

**Declaration:** `EtaleAtPointResolution` · **theorem** · `VectorBundlesAndIsocrystals:VB4/etale-at-point-resolution`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), let F be a vector bundle on Proj(P_R) whose slopes at some β ∈ ℳ(R) are all nonnegative. Then there exists a short exact sequence 0 → H → G → F → 0 of vector bundles on Proj(P_R) such that G is étale at β.

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

**Construction/proof.** Repeat the nonnegative extension and direct-sum construction to reduce the positive degree. After finitely many steps obtain a bundle étale at the specified point and a finite locally free kernel.

**Direct imports.** [Nonnegative extension by a negative twist](#nonnegative-extension).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.8, Corollary 8.8.14, p. 185 (arXiv 1301.0792v5).

<a id="ample-iff-pointwise"></a>

### Ampleness and positive fibre slopes

**Declaration:** `AmpleIffPointwise` · **theorem** · `VectorBundlesAndIsocrystals:VB4/ample-iff-pointwise`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), a vector bundle F on Proj(P_R) is ample if and only if it is pointwise ample (all its slopes at every β ∈ ℳ(R) are positive).

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

**Construction/proof.** Locally positive tensor domination and the étale-at-a-point resolution reduce to positive twists of globally étale modules. Use the companion cohomological ampleness criterion to prove local ampleness; conversely ample generation tests all fibre slopes.

**Direct imports.** `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness` (companion part), [Positive tensor powers dominate a bundle](#positive-tensor-domination), [Resolution by an étale-at-a-point bundle](#etale-at-point-resolution), [Pointwise ampleness](#pointwise-ampleness).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.8, Theorem 8.8.15 and Remark 8.8.16, p. 185 (arXiv 1301.0792v5).

<a id="relative-ampleness"></a>

### Ampleness on the relative curve

**Declaration:** `RelativeAmple` · **definition** · `VectorBundlesAndIsocrystals:VB4/relative-ampleness`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), a vector bundle F on FF_X is ample if for every choice of (A, A⁺), (R, R⁺) and every morphism f : Spa(A, A⁺) → X, the bundle f^*F on FF_R corresponds via Theorem 8.7.7 to an ample vector bundle on Proj(P_R). By Theorem 8.8.15 this holds if and only if the slopes of F, as functions on X, are everywhere positive. Consequently: if X = Spa(A, A⁺), a vector bundle on Proj(P_R) is ample if and only if the corresponding vector bundle on FF_X is ample; if f : Y → X is a surjective morphism of perfectoid adic spaces and f^*F is ample then F is ample, so ampleness is local on the base; and ampleness is open on the base, even on its real quotient: if the restriction of F to FF_{H(x)} is ample for some x ∈ X, there is a partially proper open neighbourhood U of x in X such that the restriction of F to FF_U is ample (Theorem 7.4.5).

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

**Construction/proof.** Define ampleness by pulling back to every affinoid perfectoid over the base and using the already owned Proj notion. The pointwise criterion proves independence of those charts, surjective descent, and a partially proper open ample locus.

**API.**

| Name | Role and contract |
| --- | --- |
| `RelativeAmple` | data: A bundle on FF_X is ample if all perfectoid affinoid pullbacks are ample in the already owned Proj sense. |
| `RelativeAmple.fibreCriterion` | characterisation: Relative ampleness is equivalent to every geometric fibre slope being strictly positive. |
| `RelativeAmple.pullback` | functoriality: Perfectoid pullback preserves ampleness. |
| `RelativeAmple.surjectiveDescent` | compatibility: A bundle is ample iff its pullback along a surjective perfectoid map is ample. |
| `RelativeAmple.openLocus` | structure: The ample locus is a partially proper open subset on a base over an analytic field. |

**Consumers.** [The positive line of an untilt](#untilt-positive-line) identify the untilt line as a positive relative bundle. `VectorBundlesAndIsocrystalsPartII` supply positive-slope hypotheses for period constructions.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `RelativeAmpleTest.affinoid` | compatibility: On an affinoid perfectoid untilt, relative ampleness agrees with the companion Proj ampleness. |
| `RelativeAmpleTest.untiltLine` | computation: The untilt divisor line L_X is relatively ample; in KL normalization its slope is 1/a. |
| `RelativeAmpleTest.unit` | non-example: The unit bundle is not relatively ample on a nonempty base. |

**Direct imports.** `RelativeFarguesFontaine:RF1`, `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness` (companion part), [Ampleness and positive fibre slopes](#ample-iff-pointwise).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.8, Definition 8.8.17, pp. 185–186 (arXiv 1301.0792v5).

<a id="untilt-positive-line"></a>

### The positive line of an untilt

**Declaration:** `UntiltPositiveLine` · **comparison** · `VectorBundlesAndIsocrystals:VB4/untilt-positive-line`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5) with X = Spa(A, A⁺), write z = [z̄] + p z_1. Let M be the φ^a-module over ℛ̃_R free on one generator v with φ^a(v) = z_1^{−1} z v; it is globally étale. The convergent product u = ∏_{n≥0} φ^{an}(1 + p^{−1} z_1^{−1}[z̄]) ∈ ℛ̃⁺_R satisfies φ^a(u) = p z_1 z^{−1} u in ℛ̃_R, so uv defines an inclusion ℛ̃_R → M(1) of φ^a-modules, and M(1) is the φ^a-module corresponding to L_X. Hence the φ^a-module corresponding to L_X is globally pure of slope 1/a, i.e. globally (1, a)-pure (printed 'slope 1'; see source issue).

**Hypotheses.** KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

**Construction/proof.** Use the untilt primitive z=[z̄]+pz₁ and its divisor line L_X. The convergent product u=∏φ^{an}(1+p^{-1}z₁^{-1}[z̄]) satisfies φ^a(u)=pz₁z^{-1}u. The vector uv embeds the trivial module into M(1), identifying it with L_X; its slope is 1/a, not 1 for general a.

**Direct imports.** `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, [Pure models and purity loci](#pure-models), [Ampleness on the relative curve](#relative-ampleness).

**Acceptance.** Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), §8.8, Lemma 8.8.19 and its proof, p. 186 (arXiv 1301.0792v5).

<a id="twisted-local-systems"></a>

### Twisted rational local systems

**Declaration:** `TwistedLocalSystem` · **definition** · `VectorBundlesAndIsocrystals:VB4/twisted-local-systems`.

For c∈Z and d>0, a (c,d)-Q_p local system is an étale local system of finite-dimensional Q_{p^d}-vector spaces equipped with a Frobenius-semilinear automorphism τ such that p^c τ^d=1. Scheme-side isogeny (c,d)-Z_p local systems carry the same data on an isogeny Z_{p^d} local system. The categories for proportional pairs (c,d) are naturally equivalent, not literally equal.

**Hypotheses.** Q_{p^d}/Q_p unramified; τ acts semilinearly for arithmetic Frobenius. Étale rational local systems need not admit a global integral lattice.

**Construction/proof.** Import the generic locally constant sheaf and finite-dimensional coefficient categories. Impose the explicit p^cτ^d equation; use Hilbert 90 for proportional denominator equivalences.

**API.**

| Name | Role and contract |
| --- | --- |
| `TwistedLocalSystem` | data: Finite-rank Q_{p^d} étale local system with arithmetic-Frobenius-semilinear τ and p^cτ^d=1. |
| `TwistedLocalSystem.frobenius` | projection: The specified semilinear automorphism τ, with its coefficient Frobenius. |
| `TwistedLocalSystem.iterate` | relation: For every section v, p^c τ^d(v)=v. |
| `TwistedLocalSystem.pullback` | functoriality: Pullback transports τ and its equation; identities and composition agree. |
| `TwistedLocalSystem.reindex` | equivalence: Pairs of positive denominator with the same c/d give naturally equivalent categories by unramified scalar extension/descent. |

**Consumers.** [Pure modules and twisted local systems](#pure-modules-local-systems) the local-system side of the pure-module equivalence. [Independence of purity denominator](#purity-denominator-independence) prove denominator independence.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `TwistedLocalSystemTest.zeroSlope` | compatibility: At (0,1), τ=1 and the object is an ordinary Q_p local system. |
| `TwistedLocalSystemTest.nonzeroTwist` | non-example: For c≠0,d=1, τ=1 on a nonzero Q_p line fails p^cτ=1. |
| `TwistedLocalSystemTest.reindex` | compatibility: The categories for (1,2) and (2,4) are equivalent; the coefficient fields and underlying vector-space ranks are not literally identical. |

**Direct imports.** `DiamondsAndVStacks:D3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `mathlib:ModuleCat`.

**Acceptance.** At (c,d)=(0,1) the equation gives τ=1 and ordinary Q_p local systems.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), Definition 8.5.7, p. 172.

<a id="integral-frobenius-local-systems"></a>

### Integral Frobenius and local-system comparison

**Declaration:** `IntegralFrobeniusLocalSystems` · **comparison** · `VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems`.

For a perfect uniform adic Banach pair over F_{p^d}, étale Z_{p^d} local systems on Spec(R), on its inverse-perfecting complete subring, and on the corresponding untilt agree with φ^d-modules over W(R) and the integral relative Robba ring; the ring functor is scalar extension. The equivalence globalizes to perfectoid X and its tilt/inverse perfection. Over an algebraically closed complete C/Q_p, φ-modules over the integral Robba ring and W(C♭) agree with finite free Z_p modules (SW12.3.4). Taking isogenies yields globally pure models, not all rational étale local systems.

**Hypotheses.** KL Theorems 8.5.3–8.5.6, with integral finite projective modules. The absolute SW12.3.4 is restricted to E=Q_p and C algebraically closed.

**Construction/proof.** Solve Lang/Artin–Schreier–Witt equations to trivialize the integral Frobenius action pro-étale locally. Descend the invariant lattice; the Robba-to-Witt fully faithful map uses pure-model trivialization and intersection of integral rings. Produce essential surjectivity by the convergent Frobenius gauge correction; localize and glue, then invert p only for the isogeny category.

**Direct imports.** [Pro-étale trivialization of pure models](#pure-model-trivialization), [Twisted rational local systems](#twisted-local-systems), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `PerfectoidSpaces:P3`.

**Acceptance.** The unit integral φ-module has invariants Z_{p^d}; inverting p produces Q_{p^d}.

**Source.** [KL15](https://arxiv.org/pdf/1301.0792v5), Theorems 8.5.3–8.5.6, pp. 169–171; [SW20](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Theorem 12.3.4, book p. 104.

<a id="integral-boundary-realization"></a>

### Integral boundary realization

**Declaration:** `IntegralBoundaryRealization` · **comparison** · `VectorBundlesAndIsocrystals:VB4/integral-boundary-realization`.

For S∈Perf, finite free Z_p local systems on S_proét are equivalent to φ^{-1}-modules on Y_[0,r](S), including the characteristic-p boundary. Restriction to Y_(0,r] realizes the rationalized local system L[1/p], which has all Newton slopes zero. This distinguishes integral lattices at the boundary from a slope-zero bundle on the open curve.

**Hypotheses.** r>0; the integral period space and φ^{-1} pullback conventions are those of SW Lecture 22. Finite rank is locally constant; no boundary deletion in the integral comparison.

**Construction/proof.** Trivialize the local system on a pro-étale cover and tensor with the boundary structure sheaf. Use Frobenius invariants and the integral comparison to recover the lattice; descend both functors. Restrict away from p=0 to identify rationalization.

**Direct imports.** [Integral Frobenius and local-system comparison](#integral-frobenius-local-systems), [FS II.2.20: slope-zero bundles are pro-etale E-local systems](#slope-zero-local-systems), `RelativeFarguesFontaine:RF0:integral-Y`, `DiamondsAndVStacks:D3/locally-profinite-torsors`.

**Acceptance.** Two distinct Z_p lattices in the same Q_p space give the same interior bundle and different integral data.

**Source.** [SW20](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Proposition 22.3.2, book p. 209.

<a id="integral-group-torsors"></a>

### Integral group torsors and Frobenius

**Declaration:** `IntegralGroupTorsors` · **comparison** · `VectorBundlesAndIsocrystals:VB4/integral-group-torsors`.

For a smooth affine group scheme G/Z_p with connected fibres, pro-étale G(Z_p)-torsors on S are equivalent to φ^{-1}-G-torsors on Y_[0,r](S). For G=GL_n this is the integral local-system equivalence. Connectedness of fibres and the integral boundary are retained; extensions requiring a parahoric model are not inferred from this theorem.

**Hypotheses.** S perfectoid; r>0; smooth affine integral model with connected fibres.

**Construction/proof.** Use the representation/comodule dictionary and the integral exact tensor comparison to pass from representations to torsors. Lang’s map on the connected special fibre trivializes Frobenius torsors; lift and descend pro-étale locally.

**Direct imports.** [Integral boundary realization](#integral-boundary-realization), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `RelativeFarguesFontaine:RF0:integral-Y`, `DiamondsAndVStacks:D3/locally-profinite-torsors`.

**Acceptance.** G=GL₁ recovers Z_p× torsors, with the boundary lattice retained.

**Source.** [SW20](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Proposition 22.6.1, book p. 213.


## VB3:general-BC — presentations, classical BC and curvature

<a id="positive-slope-resolution"></a>

### FS II.3.1 and Cor. II.3.3: resolving a positive-slope bundle by semistable bundles of small slope

**Declaration:** `PositiveSlopeResolution` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`.

If all geometric slopes of a bundle E are ≥1/r, r≥1, then analytically locally on S there is 0→O^m→F→E→0 with F fibrewise semistable of SLOPE 1/r. On a constant-rank n, degree d component, rank(F)=dr and m=dr−n. This extends FS II.3.1’s geometric construction via II.3.3(i). Rank-zero E is treated separately.

**Hypotheses.** r is a positive integer; standard O(1/r) has rank r and degree 1. Analytic-local existence is distinguished from the strict-positive étale-local presentation in the next node.

**Construction/proof.** Reduce to constant rank n and degree d and affinoid S; set m = dr - n. Choose m pairwise disjoint untilts via m maps S -> BC(O(1)) minus {0}, using fractional powers of a pseudouniformizer to force disjointness. Build F as the corresponding modification, checking fibrewise semistability of slope 1/r. For Cor. II.3.3(ii): apply II.3.1 to pi_{2r}^* E(-1) over X_{S,E_{2r}}, push forward, and use that E is a direct summand of E tensor_E E_{2r}.

**Direct imports.** [FS II.2.19(ii): the global HN filtration on constant-polygon loci and its pro-etale splitting](#relative-HN-filtration-and-proetale-splitting), `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus` (companion part), `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` (companion part), `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation` (companion part), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part).

**Acceptance.** Verify disjointness of the chosen untilts explicitly Verify the degree/rank bookkeeping m = dr - n on an example Verify that E is only a summand of the pushforward, so the conclusion is about a summand

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.3.1, pp. 75–76; Corollary II.3.3(i), p. 78.

<a id="strict-positive-etale-presentations"></a>

### Étale positive-slope presentations

**Declaration:** `StrictPositiveEtalePresentations` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations`.

If all slopes of E are >1/r, étale locally 0→G→O(1/r)^m→E→0 with G of slope zero. If slopes are ≥1/r, analytically locally 0→O(1/(2r))^m→F→E′→0 with F of slope 1/r and E a direct summand of E′. If slopes are >1/r, étale locally 0→G→O(1/r)^m→E′→0 with G of slope 1/(2r) and E a direct summand of E′. The last two claims retain E′. In the first exact sequence degree forces m=deg(E), since deg O(1/r)=1.

**Hypotheses.** r≥1; finite constant ranks and degrees after passing to components. The analytic and étale topologies in the three assertions are distinct.

**Construction/proof.** Use the geometric presentation and positivity of Hom(O(1/r),E); the universal surjection/kernel conditions define an open locus. Approximate a section at a geometric point by solving φ−A with a uniform bound near a diagonal positive matrix; this makes the open locus meet an étale neighbourhood. For the direct-summand variants pull back to the unramified 2r coefficient extension, twist, apply the first presentation and push forward; the adjunction makes E a summand.

**Direct imports.** [FS II.3.1 and Cor. II.3.3: resolving a positive-slope bundle by semistable bundles of small slope](#positive-slope-resolution), [FS II.2.19(ii): the global HN filtration on constant-polygon loci and its pro-etale splitting](#relative-HN-filtration-and-proetale-splitting), `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent` (companion part), `VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change` (companion part), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part).

**Acceptance.** At r=2 a quotient O(1/2)^m→E with slope-zero kernel has degree m, not 2m. The source explicitly declines to remove the auxiliary summand E′.

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Corollary II.3.3(i)–(iv), pp. 78–79; II.3.2 proof, pp. 76–78.

<a id="families-of-banach-colmez-spaces"></a>

### FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness

**Declaration:** `FamiliesOfBanachColmezSpaces` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`.

For [E₁→E₀] in degrees −1,0, with E₁ negative at every geometric point of S, BCcomplex is a locally spatial diamond partially proper over S; its punctured E×-quotient is locally spatial and proper over S. If E₀ is everywhere strictly positive, BCcomplex→S is cohomologically smooth. In this positive range, 0→BC(E₀)→BCcomplex→BCneg(E₁)→0 is exact as E-module v-sheaves. Neither unpunctured absolute spatiality nor perfectoid representability is asserted.

**Hypotheses.** E_1 must have only NEGATIVE slopes at all geometric points; this is what makes H^0(X_T,E_1) = 0 (Prop. II.3.4(i)) so that the two-term complex has a well-defined H_0 Part (iii) additionally requires all slopes of E_0 to be POSITIVE All assertions are etale-local, in fact v-local, on S The reduction replaces [E_1 -> E_0] by a quasi-isomorphic [E'_1 -> O_{X_S}(-d)^m] obtained from a surjection O_{X_S}(-d)^m -> E_0 with d > 0 given by Thm. II.2.6; E'_1 still has only negative slopes Separatedness of BC(O_{X_S}(-d)^m[1]) from Prop. II.2.5(i) is used to reduce (i) and (ii) to BC(E'_1[1])

**Construction/proof.** Simplify the complex: choose d > 0 and a surjection O_{X_S}(-d)^m -> E_0 (Thm. II.2.6), let E'_1 = ker(E_1 + O_{X_S}(-d)^m -> E_0); then [E'_1 -> O_{X_S}(-d)^m] -> [E_1 -> E_0] is a quasi-isomorphism. Use 0 -> BC([E'_1 -> O(-d)^m]) -> BC(E'_1[1]) -> BC(O(-d)^m[1]) and separatedness of the last term to reduce (i),(ii) to BC(E'_1[1]). Apply Cor. II.3.3(iv) to the dual of E'_1 to get, etale-locally and after adding a bundle, 0 -> BC(E'_1[1]) -> BC(O(-1/r)^m[1]) -> BC(G[1]), reducing to the explicitly known negative Banach-Colmez spaces of Prop. II.2.5(i). Part (iii) uses Cor. II.3.3 again to present E_0 and then Prop. II.2.5(iii)'s cohomological smoothness.

**Direct imports.** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition), [FS II.3.1 and Cor. II.3.3: resolving a positive-slope bundle by semistable bundles of small slope](#positive-slope-resolution), [FS II.2.19(ii): the global HN filtration on constant-polygon loci and its pro-etale splitting](#relative-HN-filtration-and-proetale-splitting), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part), `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation` (companion part), [FS II.2.17: quotients by contracting automorphisms of taut locally spectral spaces](#contracting-action-lemma), `DiamondSixOperations:S4`, `DiamondSixOperations:S5`, `DiamondsAndVStacks:D5/relative-representability`, [Étale positive-slope presentations](#strict-positive-etale-presentations), [Slope-dependent cohomology vanishing](#relative-cohomology-vanishing), [Scalar projectivization](#scalar-projectivization).

**Acceptance.** Verify the negative-slope hypothesis is necessary by exhibiting failure of partial properness otherwise Verify (iii) on [0 -> O(1)] where cohomological smoothness is II.2.5(iii) Verify the quasi-isomorphism step preserves the negative-slope condition

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.3.5, pp. 79–81.

<a id="positive-range-dimension"></a>

### Dimension in the positive range

**Declaration:** `PositiveRangeDimension` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension`.

For bundles E₀,E₁ with E₀ everywhere positive and E₁ everywhere negative, the cohomologically smooth relative BCcomplex([E₁→E₀]) has locally constant dimension deg(E₀)−deg(E₁), componentwise. In particular a positive bundle E has BC dimension deg(E); a negative bundle has shifted BC dimension −deg(E). Geometrically these are the first entries of the BC Dimension; height is rank(E₀)−rank(E₁). Slope-zero section sheaves are locally profinite of dimension zero via the E-local-system equivalence.

**Hypotheses.** Use the canonical geometric degree and fixed coefficient field E. Diamond relative dimension is the cohomologically smooth dimension, not the rank or height; the numeric Dimension comparison is classical Q_p over fixed C.

**Construction/proof.** For standard blocks read the numerator dimension from the open-ball calculation and negative exact-sequence presentation. Positive presentations and pro-étale trivialization of slope-zero kernels reduce arbitrary positive bundles to those blocks. The exact sequence in the two-term theorem and six-operations dimension additivity give the difference of degrees; the classical Dimension theorem identifies height.

**Direct imports.** [FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness](#families-of-banach-colmez-spaces), [FS II.3.1 and Cor. II.3.3: resolving a positive-slope bundle by semistable bundles of small slope](#positive-slope-resolution), [Étale positive-slope presentations](#strict-positive-etale-presentations), [FS II.2.20: slope-zero bundles are pro-etale E-local systems](#slope-zero-local-systems), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part), [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples), `DiamondSixOperations:S5`.

**Acceptance.** O(1/2) has rank two and BC dimension one; height two. A slope-zero rank-two local system has geometric dimension zero.

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition I.3.5 and examples, p. 19; II.3.5, pp. 79–81; [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Example 3.3 and §3.2.5, pp. 13,16.

<a id="divisor-section-comparison"></a>

### Effective divisors and projective sections

**Declaration:** `DivisorSectionComparison` · **comparison** · `VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison`.

For d≥1, the already owned absolute divisor v-sheaf Div^d is (BC(O(d)) minus zero)/E×. It is proper, representable in spatial diamonds and cohomologically smooth. The map (Div¹)^d→Div^d is a quasi-pro-étale Σ_d-cover, hence Div^d=(Div¹)^d/Σ_d in v-sheaves, with its spatial-diamond descent proved by the generic spatiality criteria.

**Hypotheses.** Absolute curve over k=bar F_q; coefficient field E as in FS; d positive integral.

**Construction/proof.** Divisor of a nonzero section supplies the comparison with RF2’s divisor moduli; scalar multiples give the same divisor. Geometrically factor a divisor into degree-one points; compare (Div¹)^d as a quotient by the finite permutation group. Use the DD5 spatiality criteria to prove the spatial quotient statement, and six-operations smoothness descent.

**Direct imports.** [FS II.2.3 and II.2.4: the fundamental exact sequence and (BC(O(1)) minus 0)/E^times = Div^1](#fundamental-exact-sequence), [FS II.2.16: BC(E) is a locally spatial diamond partially proper over S, and its projectivization is proper](#properness-of-projectivized-BC), `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `DiamondsAndVStacks:D5/spatial-v-sheaf-criterion`, `DiamondsAndVStacks:D5`, `DiamondSixOperations:S5`.

**Acceptance.** d=1 recovers the fundamental E×-torsor. Σ_d permutes ordered factors; this is not a degree-d étale cover.

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.3.6, pp. 81–82.

<a id="absolute-BC-spatiality"></a>

### FS II.3.6-II.3.7: Div^d as a diamond and absolute Banach-Colmez spaces of pure-sign isocrystals

**Declaration:** `AbsoluteBcSpatiality` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality`.

Over the absolute base Perf_k, k=bar F_q, a nonzero pure NEGATIVE isocrystal D yields the punctured positive space BC(E(D)) minus zero, which is spatial; a nonzero pure POSITIVE isocrystal yields the punctured negative space BCneg(E(D)) minus zero, also spatial. Both are cohomologically smooth, and their E×-quotients are proper and representable in spatial diamonds. Bundle slopes reverse isocrystal slopes. Relative representability in spatial diamonds does not assert that every total quotient over the nonspatial absolute base is spatial.

**Hypotheses.** D has slopes of a single sign; mixed-sign isocrystals are not covered by this statement One works on Perf_k with k algebraically closed The proof of (i) chooses, by Dieudonne-Manin, a basis in which phi is E-rational and U = phi^N is diagonal with entries powers of pi for some N > 0 - i.e. D is DECENT in the sense of Rapoport-Zink Definition 1.8 The identification of the U-action with Frob^N holds only after base change to Spa F_q((t^{1/p^infty})), and uses that the absolute Frobenius acts trivially on topological spaces Surjectivity of the sum map is checked on geometric points using Prop. II.2.9 (every element of P_d is a product of elements of P_1)

**Construction/proof.** For II.3.6: all spaces are proper over * by Prop. II.2.16(ii), so the sum map is proper; surjectivity as v-sheaves is checked on geometric points via the factorisation in the proof of Prop. II.2.9; one gets bijectivity up to Sigma_d, hence Div^d = (Div^1)^d/Sigma_d; the projection is quasi-pro-etale, and Div^1 = Spd E/phi^Z is a diamond, so Div^d is a diamond. For II.3.7(ii): apply Prop. II.3.5 and, for cohomological smoothness after the E^times-quotient, ECD Proposition 24.2. For II.3.7(i): use decency to make U = phi^N act as Frob^N; then U^{-1} (resp. U) on the base change to Spa F_q((t^{1/p^infty})) satisfies the hypotheses of Lemma II.2.17, so the quotient is a spatial diamond, and one translates back using triviality of the absolute Frobenius on topological spaces; then apply Lemma II.3.8. For positive Banach-Colmez spaces one concludes from Prop. II.3.6, as BC(D) minus {0} is an E^times-torsor over a space built from Div^d.

**Direct imports.** [FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness](#families-of-banach-colmez-spaces), `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals` (companion part), `DiamondsAndVStacks:D5/spatial-v-sheaf-criterion`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondSixOperations:S4`, `DiamondSixOperations:S5`, [Effective divisors and projective sections](#divisor-section-comparison), `DiamondsAndVStacks:D5`.

**Acceptance.** Verify decency explicitly for the simple isocrystal of slope 1/n Verify Div^2 = (Div^1)^2/Sigma_2 on geometric points Verify the identification of the U-action with Frob^N after base change

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.3.7, pp. 82–83.

<a id="punctured-absolute-quotients"></a>

### Punctured absolute spaces and scalar quotients

**Declaration:** `PuncturedAbsoluteQuotients` · **application** · `VectorBundlesAndIsocrystals:VB3:general-BC/punctured-absolute-quotients`.

For d≥1, punctured BC(O(d)) is spatial. Its quotient by π^Z is not quasiseparated and therefore not spatial, although the punctured scalar quotient BC(O(d))/E×→Div^d is representable in spatial diamonds and proper. In equal characteristic positive punctured BC spaces from pure negative isocrystals are perfectoid; negative ones from pure positive isocrystals are generally diamonds. In mixed characteristic BC(O(−1)[1]) is not perfectoid.

**Hypotheses.** Use punctured spaces throughout; absolute spatiality and relative spatial representability are different assertions.

**Construction/proof.** Use the E×-torsor over Div^d and the generic smooth-cover spatiality criterion. Apply the absolute quotient calculation in FS II.3.10 to retain the failure of quasiseparatedness. Use the open-ball/perfected additive description in equal characteristic; keep the negative shifted non-perfectoid example.

**Direct imports.** [FS II.3.6-II.3.7: Div^d as a diamond and absolute Banach-Colmez spaces of pure-sign isocrystals](#absolute-BC-spatiality), [Effective divisors and projective sections](#divisor-section-comparison), `DiamondsAndVStacks:D5/relative-representability`, `DiamondsAndVStacks:D5`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part).

**Acceptance.** BC(O(d)) punctured spatial does not make its π^Z-quotient spatial.

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Remarks II.3.10–II.3.11, pp. 83–84.

<a id="negative-quaternion-example"></a>

### Quaternion presentation of negative Banach–Colmez space

**Declaration:** `NegativeQuaternionExample` · **comparison** · `VectorBundlesAndIsocrystals:VB3:general-BC/negative-quaternion-example`.

For C/k algebraically closed and a chosen untilt C♯/E, punctured BC(O(−1)[1]) identifies with punctured BC(O(1/2)) modulo the reduced-norm-one group SL₁(D), D the quaternion division algebra of invariant 1/2. Its base change to C♯ admits the description (Ω_{C♯})^diamond/E, where Ω=P¹_E minus P¹(E); the full sheaf is (A¹_{C♯})^diamond/E. The latter description uses the untilt and is not an identification with a perfectoid quotient space.

**Hypotheses.** The nonzero extension has fixed determinant; the acting group is SL₁(D), not D×.

**Construction/proof.** A nonzero class of Ext¹(O,O(−1)) has semistable middle term O(−1/2); use classification and fix its determinant. The torsor of determinant-preserving identifications yields the norm-one quotient; duality gives positive O(1/2). Use the fundamental exact sequence to identify the additive quotient and punctured Drinfeld upper half-plane description.

**Direct imports.** `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` (companion part), `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus` (companion part), `VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison` (companion part), `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign` (companion part), [FS II.2.3 and II.2.4: the fundamental exact sequence and (BC(O(1)) minus 0)/E^times = Div^1](#fundamental-exact-sequence), [FS II.3.6-II.3.7: Div^d as a diamond and absolute Banach-Colmez spaces of pure-sign isocrystals](#absolute-BC-spatiality).

**Acceptance.** Replacing SL₁(D) by D× loses the fixed determinant.

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Example II.3.12, p. 84.

<a id="negative-sl2-example"></a>

### SL₂ presentation of negative Banach–Colmez space

**Declaration:** `NegativeSl2Example` · **comparison** · `VectorBundlesAndIsocrystals:VB3:general-BC/negative-sl2-example`.

Punctured BC(O(−2)[1])≅U/SL₂(E), where U⊂BC(O(1))² is the open locus of pairs of sections that are E-linearly independent. The corresponding extension 0→O(−1)→O²→O(1)→0 is specified by a surjection and its determinant trivialization; changing the determinant-preserving basis gives SL₂(E), not GL₂(E).

**Hypotheses.** Nonzero extension class; determinant fixed.

**Construction/proof.** Classify the middle term of 0→O(−2)→F→O→0 and twist by O(1). Show that the surjection O²→O(1) is equivalent to E-linear independence of its two sections. Use the determinant to identify its kernel with O(−1); quotient the choices of determinant-preserving basis.

**Direct imports.** [FS II.2.2: H^0(X_S,O(1)) is the universal cover of the Lubin-Tate formal group](#lubin-tate-universal-cover), [FS II.2.3 and II.2.4: the fundamental exact sequence and (BC(O(1)) minus 0)/E^times = Div^1](#fundamental-exact-sequence), `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` (companion part), `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus` (companion part), [FS II.3.6-II.3.7: Div^d as a diamond and absolute Banach-Colmez spaces of pure-sign isocrystals](#absolute-BC-spatiality).

**Acceptance.** An E-dependent pair lies outside U; GL₂ does not preserve the kernel determinant identification.

**Source.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Example II.3.13, p. 84.

<a id="sympathetic-vector-spaces"></a>

### Sympathetic Vector Spaces

**Declaration:** `SympatheticVS` · **definition** · `VectorBundlesAndIsocrystals:VB3:general-BC/sympathetic-vector-spaces`.

A Vector Space (VS) W is a functor Λ ↦ W(Λ) from sympathetic algebras to Q_p-vector spaces, and a sequence 0 → W_1 → W → W_2 → 0 is exact precisely when it is exact on W(Λ) for every Λ. Sympathetic algebras are, following Colmez, the spectral connected C-Banach algebras Λ on which x ↦ x^p is surjective on {x : ‖x−1‖_Λ < 1}, with O_Λ the unit ball; this paper imposes two further conditions, that Λ → C(Spm(Λ) → C) be injective — a property taken for granted in the earlier arguments but failing for instance for Λ = O_{C′} with C′ the spherical closure of C — and that Λ be separable, i.e. have a dense C-subspace of countable dimension, so that Hahn–Banach is available without assuming C spherically complete. Since O_C/p is countable, the sympathetic closure of a separable such algebra is again separable.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Import normed C-algebra topology; take connected spectral Banach algebras with p-root surjectivity near 1. Include injectivity into C-valued functions on Spm and countable-dimensional dense C-subspace. A VS is a covariant functor to Q_p-vector spaces; exactness is tested on every sympathetic algebra.

**API.**

| Name | Role and contract |
| --- | --- |
| `SympatheticVS` | data: A covariant functor from the stated sympathetic C-Banach algebras to ModuleCat Q_p. |
| `SympatheticVS.constant` | constructor: The constant functor of a finite-dimensional Q_p vector space. |
| `SympatheticVS.additive` | constructor: V_d evaluates to Λ^d and maps by the C-algebra homomorphism in every coordinate. |
| `SympatheticVS.exact` | compatibility: A short complex is short exact iff its evaluated ModuleCat complex is short exact at every Λ. |
| `SympatheticVS.periodTargets` | compatibility: The source period Rings BdR⁺ and BdR and the quotients B_m are VS targets via the R06.1 period-functor construction. |

**Consumers.** [Finite-Dimensional Banach–Colmez presentations](#banach-colmez-presentations) make the two exact presentation sequences meaningful. [VS Hom vanishing from torsion period modules](#torsion-vs-hom-vanishing) state Hom for all VS natural maps, not only period-linear ones.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `SympatheticVSTest.constants` | computation: The constant Q_p functor evaluates to Q_p at C, whereas V₁ evaluates to C. |
| `SympatheticVSTest.zero` | degenerate: V₀ is the zero functor. |
| `SympatheticVSTest.finiteSum` | compatibility: V_{d+e}≅V_d⊕V_e coordinatewise. |
| `SympatheticVSTest.evaluation` | non-example: The C-valued spectrum-injectivity condition excludes the spherical-closure example singled out by footnote 6; p-root surjectivity alone is insufficient. |

**Direct imports.** `mathlib:NormedAlgebra`, `mathlib:ModuleCat`.

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), §3.1.1 with footnote 6, p. 12.

<a id="abstract-banach-colmez-category"></a>

### Abstract Banach–Colmez category

**Declaration:** `AbstractBC` · **definition** · `VectorBundlesAndIsocrystals:VB3:general-BC/abstract-banach-colmez-category`.

For fixed C/Q_p algebraically closed and complete, BC is the smallest strictly full abelian subcategory of sheaves of Q_p-modules on Perf_C,proét, stable under extensions and containing underline Q_p and the additive untilt sheaf G_a. Equivalently close these generators under finite biproducts, kernels and cokernels of morphisms BETWEEN BC objects, extensions and isomorphisms. Do not require closure under every ambient subobject.

**Hypotheses.** The untilt additive sheaf is over Perf_C; Frobenius coefficients are Q_p here.

**Construction/proof.** Import the generic sheaf and abelian category machinery. Define membership as the generated finite abelian-extension closure, equivalently the intersection of such full subcategories. Le Bras identifies this subcategory with the presentation-defined BC category and the tilted heart.

**API.**

| Name | Role and contract |
| --- | --- |
| `AbstractBC` | data: The generated abelian extension-closed strictly full subcategory of Q_p-module sheaves containing Q_p and G_a. |
| `AbstractBC.rational` | constructor: The constant sheaf Q_p is a member. |
| `AbstractBC.additive` | constructor: The untilt additive sheaf G_a is a member. |
| `AbstractBC.kernelCokernel` | structure: Kernels and cokernels of maps between member objects remain members, computed in the ambient abelian sheaf category. |
| `AbstractBC.extension` | constructor: A short exact extension of two members is a member. |
| `AbstractBC.leBras` | equivalence: Degree-zero hypercohomology induces the exact equivalence with BCTiltedHeart; sympathetic values agree with the presentation realization. |

**Consumers.** [Le Bras equivalence](#le-bras-equivalence) identify the three BC realizations. `VectorBundlesAndIsocrystalsPartII` import the abelian category before introducing h.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `AbstractBCTest.generators` | computation: The two generators are Q_p and G_a, with Dimensions (0,1) and (1,0). |
| `AbstractBCTest.zero` | degenerate: The zero sheaf is in AbstractBC. |
| `AbstractBCTest.quotient` | compatibility: The cokernel G_a/Q_p belongs and is BC(O(−1)[1]) after choosing ∞. |
| `AbstractBCTest.points` | non-example: C and C⊕Q_p are isomorphic as topological Q_p-vector spaces but their BC Dimensions (1,0) and (1,1) differ. |

**Direct imports.** `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.Abelian`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D3`.

**Acceptance.** Q_p and G_a are generators; G_a/Q_p belongs as a cokernel; the category is not all ambient Q_p-module sheaves.

**Source.** [SW20](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Definition 15.2.1, book p. 133; [SW20](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Theorem 15.2.12, book p. 139.

<a id="banach-colmez-presentations"></a>

### Finite-Dimensional Banach–Colmez presentations

**Declaration:** `BCPresentation` · **construction** · `VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations`.

Morally a BC is a finite dimensional C-vector space up to a finite dimensional Q_p-vector space, with Dimension Dim W = (a,b) where a = dim W is the C-dimension and b = ht W ∈ Z the Q_p-dimension. Precisely, a VS W is finite Dimensional — a BC — if it equals V_d up to finite dimensional Q_p-vector spaces: there are finite dimensional Q_p-vector spaces V_1, V_2 and exact sequences 0 → V_1 → Y → V_d → 0 and 0 → V_2 → Y → W → 0, so that W is obtained from V_d by adding V_1 and quotienting by V_2; then dim W = d and ht W = dim_{Q_p}V_1 − dim_{Q_p}V_2. These are the objects often called Banach–Colmez spaces.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Choose Y with two short exact sequences 0→V₁→Y→V_d→0 and 0→V₂→Y→W→0. Finite Q_p spaces V₁,V₂ give Dim=(d,finrank V₁−finrank V₂). The separate Dimension theorem proves independence; continuous Q_p-Banach points alone do not determine Dim.

**API.**

| Name | Role and contract |
| --- | --- |
| `BCPresentation` | data: Y and exact 0→V₁→Y→V_d→0, 0→V₂→Y→W→0 with finite Q_p spaces V₁,V₂. |
| `BCPresentation.dim` | projection: The natural number d. |
| `BCPresentation.height` | projection: The integer finrank_Qp(V₁)−finrank_Qp(V₂). |
| `BCPresentation.dimension` | compatibility: The pair (d,height) is independent of the presentation by DimensionAbelian. |
| `BCPresentation.stabilize` | constructor: Adding the same finite Q_p vector space to Y,V₁,V₂ gives another presentation of W and the same Dimension. |

**Consumers.** [Dimension and the abelian BC category](#dimension-abelian) prove independence and additivity. [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples) compute basic period objects.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `BCPresentationTest.additive` | computation: The tautological presentation of V_d has Dimension (d,0). |
| `BCPresentationTest.constant` | computation: A finite Q_p vector space of dimension h has Dimension (0,h). |
| `BCPresentationTest.quotient` | computation: The cokernel V₁/Q_p of a nonzero Q_p→V₁ map has Dimension (1,−1). |
| `BCPresentationTest.stabilize` | compatibility: Increasing both finite Q_p dimensions by one leaves height unchanged. |

**Direct imports.** [Sympathetic Vector Spaces](#sympathetic-vector-spaces), `mathlib:CategoryTheory.ShortComplex.ShortExact`, `mathlib:Module.finrank`.

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), §3.1.1, pp. 12–13.

<a id="tilted-coherent-heart"></a>

### The tilted coherent heart

**Declaration:** `BCTiltedHeart` · **definition** · `VectorBundlesAndIsocrystals:VB3:general-BC/tilted-coherent-heart`.

Coh⁻_X is the full subcategory of Dᵇ(Coh_X) with cohomology only in degrees −1 and 0, H^{−1} of negative slopes and H⁰ of nonnegative slopes INCLUDING torsion sheaves. It is the torsion-pair tilt heart, hence abelian. Objects split noncanonically as H⁰⊕H^{−1}[1] because the curve has cohomological dimension one. For such a zero-differential representative BC(F)=H⁰(X,H⁰F)⊕H¹(X,H^{−1}F), noncanonically; general morphisms include Ext¹(H⁰F,H^{−1}G).

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Import the derived category and the torsion-pair tilt construction from SF.0. Take complexes with cohomology only in degrees −1,0, H^{−1} negative and H⁰ nonnegative including torsion. Cohomological dimension one gives an isomorphism H⁰⊕H^{−1}[1], noncanonically; record the Ext¹ off-diagonal morphisms.

**API.**

| Name | Role and contract |
| --- | --- |
| `BCTiltedHeart` | data: Objects K∈Dᵇ(Coh_X) with HⁱK=0 except i=−1,0, H^{-1} negative and H⁰ nonnegative including torsion. |
| `BCTiltedHeart.positive` | constructor: A coherent sheaf of nonnegative slopes enters in degree zero. |
| `BCTiltedHeart.negative` | constructor: A negative bundle enters with shift [1]. |
| `BCTiltedHeart.split` | compatibility: K is isomorphic to H⁰K⊕H^{-1}K[1], noncanonically, using Ext²=0 on the curve. |
| `BCTiltedHeart.homMatrix` | compatibility: Morphisms between these decompositions have diagonal Hom and off-diagonal Ext¹(E₀,F₋₁). |

**Consumers.** [Le Bras equivalence](#le-bras-equivalence) state Le Bras as an equivalence of actual abelian categories. [Banach–Colmez morphism calculus](#bc-morphism-calculus) retain nontrivial Ext¹ off-diagonal maps.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `BCTiltedHeartTest.positive` | computation: O(1) in degree zero belongs to the heart. |
| `BCTiltedHeartTest.negative` | computation: O(−1)[1] belongs, while O(−1) in degree zero does not. |
| `BCTiltedHeartTest.torsion` | compatibility: The torsion skyscraper at any untilt point belongs in degree zero. |
| `BCTiltedHeartTest.shift` | non-example: O[1] is excluded, since its H^{-1} has slope zero rather than negative. |

**Direct imports.** `mathlib:DerivedCategory`, `SchemeAndStackFoundations:SF.0`, `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism` (companion part), `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification` (companion part), `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension` (companion part).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), §3.2.4, p. 15.

<a id="le-bras-equivalence"></a>

### Le Bras equivalence

**Declaration:** `LeBrasEquivalence` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`.

The functor BC realises an equivalence of categories Coh^-_X ≃ BC. In its pro-étale sheaf realization every BC object is a diamond (SW Theorem 15.2.12); no perfectoid representability is inferred.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Take degree-zero hypercohomology after base change, then sheafify; compare values on sympathetic algebras. Compute Hom via the triangular Hom/Ext¹ matrix, rather than treating BC as pointwise Banach spaces. Use the standard/torsion blocks and extension closure to prove essential surjectivity and exactness.

**Direct imports.** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition), [The tilted coherent heart](#tilted-coherent-heart), `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus` (companion part), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part), [Finite-Dimensional Banach–Colmez presentations](#banach-colmez-presentations), `DiamondsAndVStacks:D3`, [Abstract Banach–Colmez category](#abstract-banach-colmez-category), [FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness](#families-of-banach-colmez-spaces), `mathlib:CategoryTheory.Equivalence`.

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Theorem 3.12, p. 15.

<a id="dimension-abelian"></a>

### Dimension and the abelian BC category

**Declaration:** `DimensionAbelian` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`.

(i) The Dimension of a BC is independent of the choices in its definition. (ii) For f : W_1 → W_2 a morphism of BC's, ker f, coker f and im f are BC's, with Dim W_1 = Dim ker f + Dim im f and Dim W_2 = Dim coker f + Dim im f. (iii) If dim W = 0 then ht W ≥ 0. (iv) If W has an increasing filtration with successive quotients V_1, then every sub-BC W′ has ht W′ ≥ 0. The category BC of BC's is abelian.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Use the equivalence with the tilted coherent heart to obtain kernels, cokernels and images inside BC. Transport rank and degree from the curve to prove independence of presentation and additivity of Dim. Dimension zero gives a finite-dimensional Q_p space with nonnegative height; subobjects of successive V₁-extensions have nonnegative height.

**Direct imports.** [Le Bras equivalence](#le-bras-equivalence), [Finite-Dimensional Banach–Colmez presentations](#banach-colmez-presentations), `mathlib:CategoryTheory.Abelian`.

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Proposition 3.2, p. 13; [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Preface, Theorem 2.12(i)–(ii), printed pp. 16–17.

<a id="exact-banach-points"></a>

### Exact faithful Banach realization

**Declaration:** `ExactBanachPoints` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/exact-banach-points`.

(i) One is in general only interested in W = W(C), but without the extra structure its Dimension could not be spoken of — for example C and C ⊕ Q_p are isomorphic as topological Q_p-vector spaces. (ii) The functor W ↦ W(C) is faithful on BC's; moreover W(Λ) is a Q_p-banach for every Λ, a morphism of BC's induces continuous strict maps W_1(Λ) → W_2(Λ), and an exact sequence of BC's induces a strictly exact sequence for every sympathetic Λ.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Evaluate the source VS functor on C or an arbitrary sympathetic algebra. Use the BC presentation and the source strictness theorem to obtain Banach values and continuous strict maps. Faithfulness holds for W(C); fullness into all continuous Q_p-linear maps is not claimed.

**Direct imports.** [Finite-Dimensional Banach–Colmez presentations](#banach-colmez-presentations).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Remark 3.1, p. 13; [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), §8.4.1, main text pp. 245–247.

<a id="standard-dimension-examples"></a>

### Dimensions of standard Banach–Colmez spaces

**Declaration:** `StandardDimensionExamples` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples`.

The Spaces B_m and U_{h,d} are BC's, with Dim B_m = (m,0) and Dim U_{h,d} = (d,h) if d ≥ 0, (−d,−h) if d < 0.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Combine the companion cohomology of standard O(d/h) with the chosen-untilt fundamental sequence. Identify B_m= BdR⁺/t^m and U_{h,d}: for d≥0 the φ^h=p^d invariants, for d<0 the quotient B_{−d}/Q_p^h. Dimension additivity gives (m,0), (d,h) for d≥0 and (−d,−h) for d<0; unreduced pairs give direct-sum multiplicities.

**Direct imports.** [Dimension and the abelian BC category](#dimension-abelian), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` (companion part), [FS II.2.3 and II.2.4: the fundamental exact sequence and (BC(O(1)) minus 0)/E^times = Div^1](#fundamental-exact-sequence), `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Example 3.3, p. 13.

<a id="euler-poincare-height"></a>

### Euler–Poincaré height formula

**Declaration:** `EulerPoincareHeight` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height`.

From the formulas (3.10), ht(H^0(X,O(λ))) − ht(H^1(X,O(λ))) = h for every λ; by additivity this gives ht(H^0(X,E)) − ht(H^1(X,E)) = rk E for every vector bundle E on X, and the formula extends to coherent sheaves.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Compute heights on every standard positive, zero and shifted negative block. Add over the geometric classification; torsion contributes height zero and rank zero.

**Direct imports.** [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples), `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification` (companion part).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Remark 3.11, p. 15.

<a id="bc-hn-invariants"></a>

### Banach–Colmez HN invariants

**Declaration:** `BCHNInvariants` · **definition** · `VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-invariants`.

One endows Coh^-_X with rk^-(E_{−1} → E_0) = deg(E_0) − deg(E_{−1}) and deg^-(E_{−1} → E_0) = rk(E_{−1}) − rk(E_0), making it a Harder–Narasimhan category, and transports this to BC, where rk^- = dim and deg^- = −ht; a torsion F_x gives µ^-(BC(0 → F_x)) = 0. One writes W_{≥λ}, W_{>λ} for the Harder–Narasimhan filtration and W_{>−∞} := ∪_λ W_{≥λ}. For λ = d/h in lowest terms, U_λ := U_{h,d}, with U_{eh,ed} = U_λ^e for e ≥ 1, and U_λ = H^0(X,O(λ)) = BC(0 → O(λ)) if λ ≥ 0, U_λ = H^1(X,O(λ)) = BC(O(λ) → 0) if λ < 0; then rk^-(U_λ) = sign(λ)d, deg^-(U_λ) = −sign(λ)h and µ^-(U_λ) = −1/λ.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Transport rank⁻=deg E₀−deg E₋₁ and degree⁻=rank E₋₁−rank E₀ through Le Bras. Equivalently rank⁻=dim and degree⁻=−ht; finite Q_p spaces have slope −∞. For nonzero curve slope λ, slope_BC(U_λ)=−1/λ; torsion sheaves give BC slope zero.

**API.**

| Name | Role and contract |
| --- | --- |
| `BCHNInvariants` | data: BC rank=dim, BC degree=−ht, with the zero object assigned no slope. |
| `BCHNInvariants.fromHeart` | compatibility: For E₋₁[1]⊕E₀, rank=deg E₀−deg E₋₁ and degree=rank E₋₁−rank E₀. |
| `BCHNInvariants.slope` | projection: For positive dimension use −ht/dim; a nonzero dimension-zero object has slope −∞. |
| `BCHNInvariants.standard` | compatibility: For a nonzero standard curve slope λ, BC slope of U_λ is −1/λ. |
| `BCHNInvariants.additive` | relation: Rank and degree add in a BC short exact sequence; slope does not simply add. |

**Consumers.** [HN decomposition and connected components](#bc-hn-decomposition) construct HN and connected components. [Curvature and HN support](#curvature-hn-characterisation) compare HN and curvature without conflating them.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `BCHNInvariantsTest.rational` | computation: Q_p has rank zero, degree −1 and slope −∞. |
| `BCHNInvariantsTest.affine` | computation: V₁ has rank one, degree zero and slope zero. |
| `BCHNInvariantsTest.inversion` | computation: U_{2,1} has BC rank one, degree −2 and slope −2, while O(1/2) has curve rank two and degree one. |
| `BCHNInvariantsTest.negative` | computation: U_{1,−1}=H¹(O(−1)) has BC rank one, degree one and slope one. |
| `BCHNInvariantsTest.zero` | degenerate: The zero object has BC rank and degree zero and no slope; it is not assigned the slope −∞ of a nonzero finite Q_p space. |

**Direct imports.** [Dimension and the abelian BC category](#dimension-abelian), [Le Bras equivalence](#le-bras-equivalence), `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism` (companion part).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), §3.2.5, p. 16.

<a id="bc-hn-decomposition"></a>

### HN decomposition and connected components

**Declaration:** `BcHnDecomposition` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition`.

(i) Since Q_p = U_0, µ^-(Q_p) = −∞. (ii) BC's are naturally diamonds — among the first non-trivial examples — and as such have connected components: W_{>−∞} is the connected component of 0 and the quotient W_{−∞} is the largest étale quotient, a finite dimensional Q_p-vector space. (iii) The Harder–Narasimhan filtration splits non-canonically and every BC decomposes as (3.14) W = U_{−1/λ_1} ⊕ ⋯ ⊕ U_{−1/λ_r} ⊕ (⊕_x H^0(X,F_x)), with λ_i nonzero in Q ∪ {−∞}, U_{−1/λ_i} of slope λ_i, and F_x torsion supported at x and zero for almost all x with H^0(X,F_x) of slope 0; the λ_i are the slopes of W, to which 0 is added if some F_x is nonzero. (iv) In the sequence of §3.2.4, H^1(X,E_{−1}) is the subspace of slopes > 0 of BC(E_{−1} → E_0).

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Transport classification and HN filtration across Le Bras. Identify the finite Q_p quotient as the maximal étale quotient; its kernel is the connected component of zero. Retain noncanonical splitting and the torsion summands at ALL closed points.

**Direct imports.** [Banach–Colmez HN invariants](#bc-hn-invariants), `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification` (companion part), [Le Bras equivalence](#le-bras-equivalence), `DiamondsAndVStacks:D5/relative-representability`.

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Remark 3.13 and (3.14), p. 16.

<a id="artinian-bc"></a>

### Artinian property of BC

**Declaration:** `ArtinianBc` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/artinian-bc`.

(i) The exact sequence 0 → W_{>−∞} → W → W_{−∞} → 0 makes it possible to show that a decreasing sequence (W_n) of BC's is stationary: dim(W_n) is decreasing and bounded below, hence constant for n ≥ N; then W_N/W_n has dimension 0 and is a quotient of W_N^{−∞}, and ht(W_N/W_n) is increasing and bounded by ht(W_N^{−∞}) < ∞, so W_N/W_n and hence W_n are eventually constant. (ii) Alternatively one uses a presentation to reduce to W = V_d and induces on d, using that a sub-BC of V_1 is either V_1 or a finite dimensional Q_p-vector space; this proof applies verbatim to almost C-representations.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** In a descending chain, nonnegative integer dimension stabilizes. The resulting dimension-zero quotients factor through the maximal finite Q_p quotient, whose finite height bounds the chain.

**Direct imports.** [HN decomposition and connected components](#bc-hn-decomposition), [Dimension and the abelian BC category](#dimension-abelian).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Remark 3.15, p. 16.

<a id="embedding-height-bound"></a>

### Height bound for non-affine additive subobjects

**Declaration:** `EmbeddingHeightBound` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/embedding-height-bound`.

For a NONZERO sub-BC W⊂V_N which contains no subobject isomorphic to V₁, dim(W)<ht(W); all its BC HN slopes are <−1. The zero object has no slopes but does not satisfy the strict numerical inequality. Include finite Q_p summands (slope −∞) in the proof.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Decompose a nonzero subobject of V_N containing no V₁ into stable blocks; include the finite-Q_p boundary λ=0. For λ=d/h>0 factor the injection through the fibre at ∞ to obtain U_λ↪V_h. Cokernel Dimension is (h−d,−h); nonnegative height in dimension zero forces h>d. Do not reverse the printed inequality.

**Direct imports.** [HN decomposition and connected components](#bc-hn-decomposition), [Dimension and the abelian BC category](#dimension-abelian), [Banach–Colmez morphism calculus](#bc-morphism-calculus).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Lemma 3.16, pp. 16–17.

<a id="bc-morphism-calculus"></a>

### Banach–Colmez morphism calculus

**Declaration:** `BcMorphismCalculus` · **comparison** · `VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus`.

For zero-map tilted-heart representatives E₋₁[1]⊕E₀ and F₋₁[1]⊕F₀, BC morphisms are triangular matrices with diagonal Hom(E₋₁,F₋₁), Hom(E₀,F₀) and off-diagonal Ext¹(E₀,F₋₁). End_BC(U_λ)=End(O(λ))=D_λ. For λ=d/h≥0 in lowest terms Hom_BC(U_λ,V₁) has C-dimension h with basis θ∘φ^i, 0≤i<h. All tensor multiplicities and Brauer signs are imported from the companion, not the unqualified rank-one-looking formula in the review paper.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Under the tilted-heart equivalence compute diagonal Hom and the off-diagonal Ext¹(E₀,F₋₁); the other off-diagonal term vanishes. Use the companion endomorphism algebra for standard blocks, with invariant λ for BUNDLE slope λ. For λ=d/h≥0 the maps U_λ→V₁ are the C-span of θφ^i, i=0,…,h−1, and form a C-vector space of dimension h.

**Direct imports.** [Le Bras equivalence](#le-bras-equivalence), `VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison` (companion part), `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign` (companion part), `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus` (companion part), `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), §3.2.4 and §3.2.6, pp. 15,17.

<a id="torsion-point-realization"></a>

### Torsion at an untilt point

**Declaration:** `TorsionPointRealization` · **comparison** · `VectorBundlesAndIsocrystals:VB3:general-BC/torsion-point-realization`.

For x a closed point, F ↦ H^0(X,F) is an equivalence from torsion coherent sheaves supported at x to finite length B^+_dR(C_x)-modules; such a module is a sum of B_m(C_x) = B^+_dR(C_x)/t_x^m, and the sequence 0 → O --t_x^m--> O(m) → i_{x,*}B_m → 0 together with H^1(X,O) = 0 gives H^0(X,i_{x,*}B_m) = U_m/Q_p t_x^m. Hence End_BC(U_m/Q_p t_x^m) ≅ B_m(C_x), so for m = 1 the endomorphisms are C_x; and for x ≠ ∞, Hom_BC(U_1/Q_p t_x, V_1) = 0 because the two sheaves are supported at distinct points. In the case x = ∞, crucial for the paper's results, t_x = t and U_m/Q_p t^m = B_m, and the object of BC attached to a finite length B^+_dR-module M is simply M ⊗_{B^+_dR} B^+_dR.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Use the completed local DVR at x and finite-support coherent sheaves. The divisor exact sequence gives H⁰(i_{x,*}B_m(C_x))=U_m/Q_p t_x^m. Compute End as B_m(C_x); distinct-point supports make Hom to V₁ zero when x≠∞.

**Direct imports.** [Le Bras equivalence](#le-bras-equivalence), [FS II.2.3 and II.2.4: the fundamental exact sequence and (BC(O(1)) minus 0)/E^times = Div^1](#fundamental-exact-sequence), `VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison` (companion part), `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification` (companion part).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), §3.2.7, pp. 17–18.

<a id="curvature"></a>

### Curvature

**Declaration:** `BCCurvature.positive` · **definition** · `VectorBundlesAndIsocrystals:VB3:general-BC/curvature`.

For W ∈ BC one says W has curvature > 0 if Hom(W,V_1) = 0; curvature ≥ 0 if Hom(W,B^+_dR) = 0; curvature = 0, or affine, if it is a successive extension of V_1's; curvature < 0 if it injects into B_dR^d, equivalently into (B^+_dR)^d; curvature ≤ 0 if it injects into a B^+_dR-Module, i.e. a VS with an action of B^+_dR.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Define the two positive predicates by VS Hom vanishing against V₁ and BdR⁺. Define curvature zero by a finite filtration with V₁ quotients, strict negative by injection into a finite BdR (equivalently BdR⁺) power, nonpositive by injection into a BdR⁺-Module. Keep curvature distinct from HN slope and height, especially at other untilt points.

**API.**

| Name | Role and contract |
| --- | --- |
| `BCCurvature.positive` | data: Hom_VS(W,V₁)=0. |
| `BCCurvature.nonnegative` | data: Hom_VS(W,BdR⁺)=0. |
| `BCCurvature.affine` | data: A finite filtration with V₁ quotients. |
| `BCCurvature.negative` | data: An injection into (BdR⁺)^d for some finite d, equivalently BdR^d. |
| `BCCurvature.nonpositive` | data: An injection into a VS carrying a BdR⁺-Module structure. |
| `BCCurvature.iso` | functoriality: Every curvature predicate is invariant under BC isomorphism. |

**Consumers.** [Canonical curvature filtration](#canonical-curvature-filtration) define the canonical curvature filtration. [Curvature subobjects and quotients](#curvature-subquotients) avoid the false dual quotient assertion.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `BCCurvatureTest.rational` | computation: Q_p has strict negative curvature and height one. |
| `BCCurvatureTest.affine` | computation: V₁ has curvature zero and height zero. |
| `BCCurvatureTest.shifted` | computation: H¹(O(−1)) has positive curvature and height −1. |
| `BCCurvatureTest.otherPoint` | non-example: At x≠∞, U₁/Q_p t_x has height zero and positive curvature but not curvature zero. |
| `BCCurvatureTest.zero` | degenerate: The zero object satisfies all five predicates; strict height inequalities require nonzero objects. |

**Direct imports.** [Sympathetic Vector Spaces](#sympathetic-vector-spaces), [Finite-Dimensional Banach–Colmez presentations](#banach-colmez-presentations), `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `PadicHodgeTheory:R06.1`.

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Definition 3.5, p. 13.

<a id="affine-finite-length-equivalence"></a>

### Curvature-zero finite-length modules

**Declaration:** `AffineFiniteLengthEquivalence` · **comparison** · `VectorBundlesAndIsocrystals:VB3:general-BC/affine-finite-length-equivalence`.

The functor M ↦ M ⊗_{B^+_dR} B^+_dR is an equivalence between the category of B^+_dR-modules of finite length and the subcategory of BC of objects of curvature 0.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** The completed local DVR realizes finite-length BdR⁺ modules as torsion sheaves at ∞. Under Le Bras, their successive residue-field extensions are exactly curvature-zero BC objects. Prove full faithfulness and essential surjectivity; modules at another closed point need not have curvature zero.

**Direct imports.** [Torsion at an untilt point](#torsion-point-realization), [Curvature](#curvature).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Proposition 3.17, p. 18.

<a id="torsion-vs-hom-vanishing"></a>

### VS Hom vanishing from torsion period modules

**Declaration:** `TorsionVsHomVanishing` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing`.

(i) The kernel and cokernel of a morphism of objects of curvature 0 are of curvature 0. (ii) If W is a torsion B^+_dR-Module, i.e. annihilated by t^r for some r ≥ 1, then Hom_VS(W,B^+_dR) = 0 and Hom_VS(W,B_dR) = 0. For (ii) one writes W = W ⊗_{B^+_dR} B^+_dR by Proposition 3.17 and computes Hom_VS(W,B^+_dR) = lim_k Hom_{B^+_dR}(W,B^+_dR/t^k) = Hom_{B^+_dR}(W,B^+_dR) = 0; for B_dR one uses that a BC of dimension 1 is a quotient of Q_p^r ⊕ L_ℓ for L_ℓ the Graph of an additive element, hence one of dimension d a quotient of Q_p^r ⊕ L_{ℓ_1} ⊕ ⋯ ⊕ L_{ℓ_d}, so that the image of any α : W → B_dR factors through t^{−N}B^+_dR for some N.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Curvature-zero kernels and cokernels follow from the finite-length equivalence. For a BC killed by t^r, use the inverse-limit comparison to identify Hom_VS(W,BdR⁺) with the zero Hom into a torsion-free module. For arbitrary VS maps into BdR, prove their image lands in t^{-N}BdR⁺ by the bounded-image argument, then reduce to the preceding vanishing; do not assume the maps BdR-linear.

**Direct imports.** [Curvature-zero finite-length modules](#affine-finite-length-equivalence), [Banach–Colmez morphism calculus](#bc-morphism-calculus), `PadicHodgeTheory:R06.1`.

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Corollary 3.18, p. 18.

<a id="curvature-hn-characterisation"></a>

### Curvature and HN support

**Declaration:** `CurvatureHnCharacterisation` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation`.

(i) W is of curvature < 0 (resp. ≤ 0) if and only if W ≅ H^0(X,E) with E a vector bundle of slopes ≥ 0 (resp. the sum of such a bundle and a torsion sheaf supported at ∞). (ii) An extension of two BC's of curvature < 0 (resp. ≤ 0) is again of curvature < 0 (resp. ≤ 0).

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Use the HN decomposition: negative BC slopes are H⁰ of nonnegative bundles, positive slopes are shifted negative bundles. Torsion at ∞ forms the affine middle piece; torsion at x≠∞ belongs to the strictly positive-curvature piece even though its HN slope is zero. Conclude closure of nonpositive/negative curvature under extensions from the heart.

**Direct imports.** [Curvature](#curvature), [HN decomposition and connected components](#bc-hn-decomposition), [Torsion at an untilt point](#torsion-point-realization), [VS Hom vanishing from torsion period modules](#torsion-vs-hom-vanishing).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), §3.2.8 and Corollary 3.19, p. 18.

<a id="curvature-hom-orthogonality"></a>

### Curvature orthogonality

**Declaration:** `CurvatureHomOrthogonality` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hom-orthogonality`.

(i) If W has curvature > 0 (resp. ≥ 0) and W′ has curvature ≤ 0 (resp. < 0), then Hom_BC(W,W′) = 0. (ii) A sub-VS of one of curvature ≤ 0 (resp. < 0) has curvature ≤ 0 (resp. < 0). (iii) A quotient of one of curvature ≥ 0 (resp. > 0) has curvature ≥ 0 (resp. > 0).

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Use the Hom definitions and filtrations of BdR⁺-modules to prove orthogonality. Sub-VS embeddings preserve the negative predicates; quotient maps preserve the positive Hom-vanishing predicates.

**Direct imports.** [Curvature](#curvature), [Curvature and HN support](#curvature-hn-characterisation).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Remark 3.6, p. 13.

<a id="canonical-curvature-filtration"></a>

### Canonical curvature filtration

**Declaration:** `BCCanonicalFiltration` · **construction** · `VectorBundlesAndIsocrystals:VB3:general-BC/canonical-curvature-filtration`.

Every W ∈ BC has a unique filtration W_{>0} ⊂ W_{≥0} ⊂ W, the canonical filtration, with W_{>0} of curvature > 0, W_{≥0}/W_{>0} of curvature 0 and W/W_{≥0} of curvature < 0. One defines W_{>0} as the intersection of the kernels of all morphisms W → B_m, m ≥ 1, and W_{≥0} as the intersection of the kernels of all morphisms W → B_dR; the outer two properties are then clear, while the curvature-0 property of the middle piece comes from the description of the canonical filtration in terms of the Harder–Narasimhan filtration in §3.2.8. One writes W_{≤0} := W/W_{>0}, the largest quotient of curvature ≤ 0, and W_{=0} := W_{≥0}/W_{>0}, the largest affine sub-VS of W_{≤0}. The filtration and a number of results about it are due to Plût; most of them can be recovered from the relation of BC to vector bundles on the Fargues–Fontaine curve and Le Bras's Harder–Narasimhan theory. For W a BC the relation between (3.14) and the filtration of Proposition 3.7 is: W_{>0} ≅ (⊕_{λ_i>0}U_{−1/λ_i}) ⊕ (⊕_{x≠∞}H^0(X,F_x)); W_{≤0} ≅ (⊕_{λ_i<0}U_{−1/λ_i}) ⊕ H^0(X,F_∞) = H^0(X, F_∞ ⊕ (⊕_{λ_i<0}O(−1/λ_i))); W_{<0} ≅ ⊕_{λ_i<0}U_{−1/λ_i}; W_{=0} ≅ H^0(X,F_∞). In particular W is of curvature < 0 if and only if its Harder–Narasimhan slopes are < 0, and if its slopes are > 0 then it is of curvature > 0.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Intersect kernels of all W→B_m for W_{>0}, and W→BdR for W_{≥0}. The Artinian BC property reduces these intersections to finite subobjects; the HN/support description identifies their graded pieces. Orthogonality proves uniqueness, functoriality, the largest nonpositive quotient W/W_{>0}, and its maximal affine subobject W_{≥0}/W_{>0}.

**API.**

| Name | Role and contract |
| --- | --- |
| `BCCanonicalFiltration` | data: Subobjects W_{>0}≤W_{≥0}≤W with positive, affine and negative graded pieces. |
| `BCCanonicalFiltration.positive` | characterisation: W_{>0} is the intersection of kernels of all W→B_m. |
| `BCCanonicalFiltration.nonnegative` | characterisation: W_{≥0} is the intersection of kernels of all W→BdR. |
| `BCCanonicalFiltration.map` | functoriality: Every BC map preserves these subobjects. |
| `BCCanonicalFiltration.nonpositiveQuotient` | universal-property: Every map from W to a nonpositive-curvature BC factors uniquely through W/W_{>0}. |
| `BCCanonicalFiltration.affinePart` | universal-property: W_{≥0}/W_{>0} is the maximal affine subobject of W/W_{>0}. |

**Consumers.** [Nonpositive curvature extension criterion](#nonpositive-curvature-extensions) identify nonpositive-curvature extensions. `VectorBundlesAndIsocrystalsPartII` supply the input to the height categorification h.

**Unit tests.**

| Name | Kind and mathematical test |
| --- | --- |
| `BCCanonicalFiltrationTest.rational` | computation: For Q_p, W_{>0}=W_{≥0}=0. |
| `BCCanonicalFiltrationTest.affine` | computation: For V₁, W_{>0}=0 and W_{≥0}=W. |
| `BCCanonicalFiltrationTest.positive` | computation: For H¹(O(−1)), W_{>0}=W_{≥0}=W. |
| `BCCanonicalFiltrationTest.otherPoint` | non-example: For torsion at x≠∞, W_{>0}=W despite BC HN slope zero; HN cut at zero alone is insufficient. |

**Direct imports.** [Curvature](#curvature), [HN decomposition and connected components](#bc-hn-decomposition), [Artinian property of BC](#artinian-bc), [VS Hom vanishing from torsion period modules](#torsion-vs-hom-vanishing).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Proposition 3.7 and Remark 3.8, pp. 13–14; [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), §3.2.8, p. 18.

<a id="curvature-height-signs"></a>

### Height signs from curvature

**Declaration:** `CurvatureHeightSigns` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/curvature-height-signs`.

Curvature zero implies height zero; NONZERO strictly negative-curvature BC objects have strictly positive height; positive-curvature objects have height ≤0. A nonzero torsion object at x≠∞ has height zero and strictly positive curvature, so ≤ cannot be strengthened to <.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Apply the explicit support decomposition and Dimension on standard blocks. Strict positivity of height for strictly negative curvature requires W≠0; positive curvature only forces ht≤0.

**Direct imports.** [Curvature and HN support](#curvature-hn-characterisation), [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Corollary 3.20 and footnote 9, p. 18.

<a id="curvature-subquotients"></a>

### Curvature subobjects and quotients

**Declaration:** `CurvatureSubquotients` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/curvature-subquotients`.

Negative/nonpositive curvature is preserved by sub-BCs; positive/nonnegative curvature is preserved by quotients. A height-zero subobject of a nonpositive-curvature object has curvature zero. The printed dual quotient assertion is false: a height-zero quotient of a nonnegative-curvature BC has HN slope zero (torsion support), and has curvature zero if and only if its support is at ∞.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Use negative-curvature embeddings for subobjects and positive Hom vanishing for quotients. A height-zero subobject of a nonpositive-curvature BC is affine by the torsion-at-∞ characterization. Correct the false quotient assertion: height-zero nonnegative-curvature quotients have HN slope zero, and curvature zero exactly when supported at ∞.

**Direct imports.** [Curvature and HN support](#curvature-hn-characterisation), [Dimension and the abelian BC category](#dimension-abelian).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Corollary 3.21, p. 18; corrected (iv).

<a id="torsion-subobjects-height"></a>

### Height of torsion period subobjects

**Declaration:** `TorsionSubobjectsHeight` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/torsion-subobjects-height`.

A sub-BC U of a torsion B^+_dR-Module W satisfies ht(U) ≥ 0, and is itself a torsion B^+_dR-Module if and only if ht(U) = 0. This can also be proved without the Harder–Narasimhan decomposition, by induction on the length of W, using that a sub-BC of V_1 is either V_1 or a finite dimensional Q_p-vector space and that an extension of B^+_dR-Modules is one; that proof extends verbatim to almost C-representations, thanks to Proposition 2.5.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Apply the preceding subobject theorem to an affine torsion BdR⁺ object. Nonnegative height follows by dévissage; height zero identifies a finite-length BdR⁺ module via the curvature-zero equivalence.

**Direct imports.** [Curvature subobjects and quotients](#curvature-subquotients), [Curvature-zero finite-length modules](#affine-finite-length-equivalence).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Remark 3.22, p. 19.

<a id="generating-image-cokernel"></a>

### Cokernel of a generating period-module image

**Declaration:** `GeneratingImageCokernel` · **theorem** · `VectorBundlesAndIsocrystals:VB3:general-BC/generating-image-cokernel`.

Let f : W_1 → W_2 be a morphism of BC's with W_2 a B^+_dR-Module whose image generates it as a B^+_dR-Module. Then coker(f), if nonzero, is of curvature > 0 and height < 0. One may assume f injective and not surjective; then W_1 = H^0(X,F_1), W_2 = H^0(X,F_2) with F_1, F_2 of vanishing H^1 and F_2 supported at ∞, and f induced by f_X : F_1 → F_2, which the generation hypothesis makes surjective and the injectivity makes H^0(X,ker f_X) = 0; vanishing of H^1(X,F_1) gives coker(f) ≅ H^1(X,ker f_X). Since F_1 is not torsion — else it would be supported at ∞, making W_1 a B^+_dR-module and f surjective — neither is ker f_X, and its H^0 being zero its slopes are < 0, whence the conclusion.

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Replace the map by its image; realize both objects through the curve with vanishing H¹. Generation makes the coherent map surjective; BC injectivity kills H⁰ of its kernel. The nonzero cokernel is H¹ of a negative vector bundle, hence positive-curvature and strictly negative height.

**Direct imports.** [Curvature and HN support](#curvature-hn-characterisation), [Euler–Poincaré height formula](#euler-poincare-height), [Le Bras equivalence](#le-bras-equivalence).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Proposition 3.23, p. 19.

<a id="nonpositive-curvature-extensions"></a>

### Nonpositive curvature extension criterion

**Declaration:** `NonpositiveCurvatureExtensions` · **comparison** · `VectorBundlesAndIsocrystals:VB3:general-BC/nonpositive-curvature-extensions`.

For W ∈ BC the following are equivalent: (i) W is of curvature ≤ 0; (ii) there is an exact sequence (3.25) 0 → V → W → M → 0 with M of curvature 0 and V finite dimensional over Q_p. For (i)⇒(ii) one writes W = H^0(X,F_∞) ⊕ (⊕_{d_i/h_i≥0}U_{d_i/h_i}) and uses the sequences 0 → Q_p^{h_i} → U_{d_i/h_i} → B_{d_i} → 0, taking V = ⊕ Q_p^{h_i}; the converse is Corollary 3.19(ii).

**Hypotheses.** E=Q_p; C is a fixed complete algebraically closed nonarchimedean field with chosen untilt point ∞ on X_{C♭}. The sympathetic algebras have the two extra CN conditions (evaluation injective, separable); countability of O_C/p is used for sympathetic closure.

**Construction/proof.** Use 0→Q_p^h→U_{h,d}→B_d→0 on each nonnegative bundle block. Sum these sequences and the ∞-torsion piece to present W as an extension of an affine object by a finite Q_p space. The converse follows from extension closure.

**Direct imports.** [Curvature and HN support](#curvature-hn-characterisation), [FS II.2.3 and II.2.4: the fundamental exact sequence and (BC(O(1)) minus 0)/E^times = Div^1](#fundamental-exact-sequence), [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples).

**Acceptance.** Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

**Source.** [CN25](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Lemma 3.24, p. 19.

<a id="semistable-period-example"></a>

### Dimension of the semistable period space

**Declaration:** `SemistablePeriodExample` · **application** · `VectorBundlesAndIsocrystals:VB3:general-BC/semistable-period-example`.

For the supercuspidal rank-two slope-1/2 L-(φ,N,G_F)-module M of CDN §2.1.2, X_st⁺(M)=(B_cris⁺⊗M)^{φ=p} is a positive Banach–Colmez space of L-Dimension ([L:Q_p],2). The one-dimensional multiplicity conclusion of Lemma 2.7 also uses the admissibility/p-adic Hodge representation input; it is not deduced from Dimension for an arbitrary rank-two module.

**Hypotheses.** Retain the paper’s supercuspidal hypothesis, coefficient action, and normalization of L-Dimension. No extension to arbitrary rank-two M or a new local-Langlands theorem is claimed.

**Construction/proof.** Identify X_st⁺ as the positive section object after the φ=p twist; use the standard positive Dimension calculation. Export its source-normalized L-Dimension to the routed Drinfeld-tower consumer. Use R06.2 only for the representation-theoretic uniqueness/multiplicity application; the tower cohomology remains with its owner.

**Direct imports.** [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples), [Dimension and the abelian BC category](#dimension-abelian), [FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness](#families-of-banach-colmez-spaces), `PadicHodgeTheory:R06.2`.

**Acceptance.** A slope-zero rank-two module does not have this positive Dimension.

**Source.** [CDN20](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §2.1.2, author preprint p. 21; published p. 328.

## Source corrections

The source versions are fixed by their hashes in the packet. CN findings concern
the author preprint CN5.pdf; the paywalled Duke version was not read. FF’s current
author PDF is a living 404-page copy with separately paginated preface; its hash
replaces the stale checkpoint hash. SW book pagination is ten pages below its PDF
page number. Previously confirmed extraction findings retain their attribution;
no self-review verdict is claimed.

**VectorBundlesAndIsocrystals/E16 — Lemma 3.16, end of proof, p. 17.** implies h > d The inequality is reversed relative to both the lemma and its own proof. The lemma asserts dim(W) < ht(W), i.e. d < h, and three lines earlier the proof states its goal as 'we need to show that h > d'. Dimension additivity (Proposition 3.2(ii)) applied to the injection U_λ ↪ V^h gives Dim Coker = (h−d, −h), and ht Coker = −h < 0 forces dim Coker > 0 by Proposition 3.2(iii), i.e. h > d. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-COLMEZ-NIZIOL-25

**VectorBundlesAndIsocrystals/E17 — Corollary 3.21(iv), p. 18.** A quotient of height 0 of a BC of curvature ≥ 0 has Harder-Narasimhan slope 0, i.e. is of the form ⊕_x H^0(X,F_x) with each F_x torsion; it has curvature 0 only if in addition the support is {∞}, equivalently if it is a B^+_dR-Module. The statement is refuted by the paper's own footnote 9 on the same page, which records that for x ≠ ∞ the object U_1/Q_p t_x has ht = 0 but curvature > 0. Take W = U_1/Q_p t_x with x ≠ ∞ and let the quotient be the identity: W is of curvature > 0, hence of curvature ≥ 0, has height 0, and is a quotient of itself, so (iv) would give it curvature 0. But curvature 0 and curvature > 0 are incompatible for W ≠ 0: a nonzero object of curvature 0 is a finite length B^+_dR-module by Proposition 3.17 and so admits a nonzero map to V_1, whereas §3.2.7 computes Hom_BC(U_1/Q_p t_x, V_1) = 0 and End = C_x. The asymmetry with the correct part (ii) is that curvature ≤ 0 already forces support at ∞ (Corollary 3.19(i)), while curvature ≥ 0 does not. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-COLMEZ-NIZIOL-25

**VectorBundlesAndIsocrystals/E18 — §3.2.7, p. 17.** Hom_{Coh_X}(i_{x,*}B_1, i_{∞,*}B_1) = 0 The left-hand side is the case m = 1, so both sheaf indices should be 1: under the isomorphism H^0(X, i_{x,*}B_m) = U_m/Q_p t_x^m displayed just above, U_1/Q_p t_x corresponds to i_{x,*}B_1, and V_1 = B_1 corresponds to i_{∞,*}B_1. The vanishing conclusion holds for any indices, the two sheaves being supported at distinct points, but as printed the two sides do not correspond. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-COLMEZ-NIZIOL-25

**VectorBundlesAndIsocrystals/E19 — Corollary 3.20(b), p. 18.** a nonzero BC of curvature < 0 has height > 0 The nonvanishing hypothesis is missing: W = 0 has curvature < 0, injecting into B_dR^0, and height 0. By Corollary 3.19(i) a BC of curvature < 0 is H^0(X,E) for E a vector bundle of slopes ≥ 0, and Remark 3.11 gives ht(W) = rk E, which is > 0 precisely when W ≠ 0. A degenerate case only, recorded because a formalisation must carry the hypothesis. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-COLMEZ-NIZIOL-25

**VectorBundlesAndIsocrystals/E20 — Lemma 3.16, proof, p. 17.** λ = d/h ≥ 0, the summand λ = 0 being treated separately The reduction is incomplete. The hypothesis that W contains no V_1 rules out torsion-at-∞ summands and, by §3.2.8, the summands of negative curve slope, but it does not rule out Q_p = U_0: indeed Q_p ⊂ V_1 ⊂ V_N, so the decomposition (3.14) of a sub-BC of V_N may have U_0 summands. Only the proof is incomplete, not the statement: for Q_p one has dim = 0 < 1 = ht and slope −∞ < −1, so the conclusion holds trivially. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-COLMEZ-NIZIOL-25

**VectorBundlesAndIsocrystals/E21 — Proof of Lemma 7.1.2, display after (7.1.2.1), p. 146 (arXiv 1301.0792v5).** F_{l+1} = U_{l+1}^{−1} F φ^a(U_{l+1}) = (1 + Z_l)^{−1} F_l (1 + φ^a(Z_l)) Condition (b) defines F_l = U_l^{−1} F φ^a(U_l), the matrix of φ^a on the basis given by U_l. With U_{l+1} = U_l(1 + Z_l) one gets U_{l+1}^{−1} F φ^a(U_{l+1}) = (1 + Z_l)^{−1} U_l^{−1} F φ^a(U_l)(1 + φ^a(Z_l)) = (1 + Z_l)^{−1} F_l (1 + φ^a(Z_l)), which is the second expression; U_{l+1}^{−1} F φ^a(U_l) equals (1 + Z_l)^{−1} F_l instead. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-KEDLAYA-LIU-15

**VectorBundlesAndIsocrystals/E22 — Lemma 8.5.11, p. 173 (arXiv 1301.0792v5).** Then the pure locus and the étale locus of M are open and (when X is an adic space over an analytic field, so that its real quotient and partial properness are defined) partially proper. The loci belong to the φ^d-module M (Definitions 7.2.3 and 8.5.9), not to the sheaf of rings ℛ̃_X. Partial properness (Definition 8.2.11) and Lemma 8.2.12 are set up only for spaces over an analytic field, which a perfect uniform adic space over 𝔽_{p^d} need not be; Definition 8.5.9 itself says 'when the latter is defined'. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-KEDLAYA-LIU-15

**VectorBundlesAndIsocrystals/E23 — Example 8.5.17, first paragraph, p. 174 (arXiv 1301.0792v5).** Let σ_q : B_1 → B_2 be the substitution T ↦ q²T (an isomorphism from the ring of the circle |T| = ω² onto that of |T| = 1); equivalently, B_2 → B_1 is T ↦ q^{−2}T. In B_1 = K{ω²/T, T/ω²} one has |T| = ω², so a map B_2 → B_1 with T ↦ q²T would send the power-bounded unit T^{−1} of B_2 = K{1/T, T} to q^{−2}T^{−1}, of norm ω^{−4} > 1; it is not a bounded homomorphism. The example later uses σ_q in the direction B_1 → B_2: 'x2 = pσq(x1) ∈ ẼS2 = W(S2)[p−1]' with x_1 ∈ ℰ̃_{S_1}. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-KEDLAYA-LIU-15

**VectorBundlesAndIsocrystals/E24 — Example 8.5.17, first paragraph, p. 174 (arXiv 1301.0792v5).** … of the Tate curve over K for the parameter q². No space X is defined in the example; the Tate curve is over the base field K = 𝔽_p((q)), as the next sentence ('a smooth projective curve over K of genus 1') says. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-KEDLAYA-LIU-15

**VectorBundlesAndIsocrystals/E25 — Example 8.5.18, p. 175 (arXiv 1301.0792v5).** … over ℰ̃_X, ℛ̃^bd_X, ℛ̃_X … The paper has no ring Ẽ^bd (Definitions 5.1.1 and 8.3.4); the three rings of Theorems 8.5.8 and 8.5.12 and of Remark 7.3.5 are ℰ̃, ℛ̃^bd and ℛ̃. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-KEDLAYA-LIU-15

**VectorBundlesAndIsocrystals/E26 — Example 8.5.18, p. 175, as invoked in Remark 7.3.5, p. 149 (arXiv 1301.0792v5).** To justify the ring-level invocation, show that the nodal sheaf modules descend to φ-modules over ℰ̃_R and ℛ̃^bd_R. A proposed route is the nodal fibre-product description A≅{(f,g)∈K{X}²:f(±1)=g(±1)} for p≠2, its completed perfection and the corresponding Witt/Robba fibre products, followed by Milnor patching with transitions 1 and p. The completed/bounded coefficient-ring fibre-product statements and φ compatibility must be verified (G-PATCH); the established statement in this packet remains sheaf-level. Remark 7.3.5's claim concerns φ-modules over the rings ℰ̃_R and ℛ̃^bd_R, and 'globally étale' is defined for them (Definition 7.3.4). Example 8.5.18 produces modules over the sheaves ℰ̃_X, ℛ̃^bd_X, and Remark 8.5.10 with Example 8.5.17 shows that such modules need not descend to ℰ̃_R, ℛ̃^bd_R. Over ℛ̃_R there is no gap, since Corollary 6.3.13 makes the functor an equivalence. With the descent supplied, the claim of Remark 7.3.5 holds. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-KEDLAYA-LIU-15

**VectorBundlesAndIsocrystals/E27 — Definition 8.8.18 and Lemma 8.8.19, p. 186; also the proofs of Lemma 8.8.13 (p. 184) and Theorem 8.8.15 (p. 185) and Conjecture 8.8.20 (p. 186) (arXiv 1301.0792v5).** … L_X is pure of slope 1/a … the φ^a-module corresponding to L_X is globally pure of slope 1/a (globally (1, a)-pure). Likewise deg O(−1) = −1/a: in the proof of Lemma 8.8.13 read 'deg(H_1) ≥ −1/a with equality only if H_1 = O(−1)' (the conclusion deg(H) ≥ 0 still follows because degrees lie in a^{−1}ℤ); in the proof of Theorem 8.8.15 read 'nα_m − 1/a ≥ 0'; in Conjecture 8.8.20, deg(F) takes values in a^{−1}ℤ and the twist is F(−a·deg(F)). Everything is as printed when a = 1. Definition 7.2.1 computes degrees of φ^a-modules with Convention 4.1.13 (the p-adic valuation of the determinant, with the sign of Remark 4.1.12, divided by a), and 'pure of slope s' means admitting a (c, d)-pure model, (p^c φ^d)^*M_0 ≅ M_0, with c/d = s (Definitions 7.3.1, 7.3.4). The proof of Lemma 8.8.19 identifies the φ^a-module of L_X with M(1), where M is free on v with φ^a(v) = z_1^{−1}z v and is étale; in M(1) (Definition 6.2.1) φ^a acts by p^{−1} times this unit, so p·φ^a preserves an étale model and M(1) is (1, a)-pure, of degree and slope 1/a. The ampleness conclusions only use positivity and are unaffected. Inherited from the independently reviewed paper extraction; passages independently reread in this pass. Original review: REV-PAPER-KEDLAYA-LIU-15

**VectorBundlesAndIsocrystals/E28 — FS Proposition II.3.1, p. 75.** semistable of slope 1/r F has rank dr and degree d in the proof; for general d,r its degree is not 1/r. Binding RS15 already records this correction. Previously recorded in the binding RS-15 result; the source passage and rank/degree computation were reread here.

**VectorBundlesAndIsocrystals/E29 — FS proof of Proposition II.3.2, p. 77.** we set m = d. O(1/r) has rank r and degree 1. In 0→G→O(1/r)^m→E→0 with G of slope zero and deg(E)=d, degree additivity forces m=d. dr is the rank of the middle term, not its number of copies. For r=2,d=1 the printed choice gives degree 2 instead of 1. The public-version finding awaits independent review.

**VectorBundlesAndIsocrystals/E30 — CN author preprint, Lemma 3.16, pp. 16–17.** For NONZERO such W, dim(W)<ht(W); every such W, including zero, has all HN slopes <−1. The zero subobject has no V1 and dim=ht=0, contradicting the strict inequality. Positive and finite-Q_p nonzero cases prove the corrected claim; the empty slope multiset accounts for the zero case. The public-version finding awaits independent review.

## Closure, supplier requests and acceptance

Every stage is **planned**. The packet’s targetCoverage lists all stage targets,
CN items 300–330 and all 29 routed KL items; off-scope items name their actual
owner. The eleven checkpoint IDs remain stable. The following are proof or
supplier refinements, rather than missing target-level declarations.

**G-LT — Crystalline Lubin–Tate Hom comparison.** SW13 Theorem A supplies full faithfulness; FSII.2.2 compresses the specific Hom/eigenspace calculation and the σ/π normalization. R07.2 must provide exactly the displayed comparison, with OE action and Frobenius. SW20 p.99 normalization was read; this is now a proof boundary, not an unread source or an asserted essential-surjectivity theorem. Needs: [FS II.2.2: H^0(X_S,O(1)) is the universal cover of the Lubin-Tate formal group](#lubin-tate-universal-cover).

**G-CONTRACT — Quantitative verification of contraction on BC charts.** FSII.2.16 reduces in one sentence from embeddings into BC(O(n)^m) to evaluation at a finite family of untilts. Verify that those evaluations jointly detect vanishing and provide a common contraction/escape bound on each quasicompact open. The topological lemma itself is fully stated; the missing quantitative application affects ordinary and two-term properness. Needs: [FS II.2.16: BC(E) is a locally spatial diamond partially proper over S, and its projectivization is proper](#properness-of-projectivized-BC), [FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness](#families-of-banach-colmez-spaces).

**G-SPATIAL — Two generic spatiality extensions.** DD5 has generic spatiality and relative representability nodes but does not yet state the two exact FSII.3.8 contracts. Requested there; proof must keep smallness, qcqs/surjectivity for the smooth cover, and a covering family of locally closed generalizing strata. Needs: [FS II.3.6-II.3.7: Div^d as a diamond and absolute Banach-Colmez spaces of pure-sign isocrystals](#absolute-BC-spatiality), [Effective divisors and projective sections](#divisor-section-comparison), [Punctured absolute spaces and scalar quotients](#punctured-absolute-quotients).

**G-LEBRAS — Construction-level proof of Le Bras.** SW15.2.12 and CN3.12 state and use the exact equivalence and triangular Hom matrix. Both are read; the underlying proof in Le Bras’s thesis/article was not available among the supplied sources read. Obtain its hypercohomology full-faithfulness and sympathetic-evaluation comparison, not just cite an abstract categorical equivalence. Needs: [Le Bras equivalence](#le-bras-equivalence), [Dimension and the abelian BC category](#dimension-abelian).

**G-HOM — Bounded-image step for unrestricted VS morphisms.** CN3.18’s BdR vanishing uses presentations by Graphs of additive elements and a bound landing the image in t^{-N}BdR⁺. The graph theorem in §4 was not read in this pass. The finite-length/BdR⁺ part is sourced, but the uniform bound for arbitrary VS maps must be proved or imported from the routed CN PartII, without a cyclic use of its h-exactness theorem. Needs: [VS Hom vanishing from torsion period modules](#torsion-vs-hom-vanishing).

**G-PATCH — Ring-level nodal purity counterexample.** KL8.5.18 explicitly gives sheaf modules. The accepted extraction’s E68 supplies a possible Milnor fibre-product patching argument to produce modules over completed and bounded coefficient RINGS. Verify the Witt and Robba fibre-product/intersection statements and φ compatibility before claiming Remark7.3.5’s stronger ring-level separation. This packet’s application keeps the established sheaf version. Needs: [Local purity without global pure models](#local-global-purity-counterexamples), [Pure models and purity loci](#pure-models).

**G-INTEGRAL — Integral Tannakian reconstruction.** The upstream ReductiveGroups Layer1 is over a field. SW22.6.1 requires an integral smooth affine model with connected fibres and exact tensor fibre-functor torsors over Z_p. Requested as the upstream roadmap’s PartII, preserving the connected-fibre Lang input. Needs: [Integral group torsors and Frobenius](#integral-group-torsors).

**G-COMPANION — Imported companion proof obligations.** VB0 packet is complete but its independent review currently needs_changes because its reader is unsynchronized. Import its corrected NODE statements. Retain its G-DM, G-GEOM, G-HN, G-GG and G-KEY obligations where used: equal-characteristic DM, early chart/PID comparison, HN degree bounds, general-E global-generation comparison and perfected-A¹ endomorphisms. This part neither duplicates nor treats those proof gaps as resolved. Needs: [FS II.2.2: H^0(X_S,O(1)) is the universal cover of the Lubin-Tate formal group](#lubin-tate-universal-cover), [FS II.2.16: BC(E) is a locally spatial diamond partially proper over S, and its projectivization is proper](#properness-of-projectivized-BC), [FS II.2.19(ii): the global HN filtration on constant-polygon loci and its pro-etale splitting](#relative-HN-filtration-and-proetale-splitting), [FS II.3.1 and Cor. II.3.3: resolving a positive-slope bundle by semistable bundles of small slope](#positive-slope-resolution), [Le Bras equivalence](#le-bras-equivalence).

**G-ORDER — Atomic stage-order integration.** Binding RS15 review accepted 2026-09-30 withholds the reversal general-BC→VB4. The node order is acyclic and uses VB4→positive resolutions→general two-term geometry, while early basic calculations feed VB1 twists. Never mechanically lift these node dependencies into the current stage graph. Apply the parent-stage narrowing and edge replacement atomically in a separate integration change. Needs: [FS II.3.1 and Cor. II.3.3: resolving a positive-slope bundle by semistable bundles of small slope](#positive-slope-resolution), [Étale positive-slope presentations](#strict-positive-etale-presentations), [FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness](#families-of-banach-colmez-spaces).

**G-LEAN — Missing geometric Lean carriers.** The pinned libraries contain sheaves, abelian/derived categories, ModuleCat, short complexes, spectral topology and lattices, but no Perf site, FF curve, slopes, diamonds, period VS or Le Bras functor. Suggested signatures give their available categorical, linear, cochain, numeric and topological components, and an exact contract index lists every definition, API item, test and missing geometric clause. Generic category/functor/height parameters are uninstantiated supplier interfaces, not verified models. Compilation with admitted proofs verifies these component types only; it proves neither geometric hypotheses nor the complete contracts. Needs: .

The requests are exact consumer contracts. A stage is used only when no finer
node currently supplies the needed statement.

| Supplier | Required contract |
| --- | --- |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` | Formal π-divisible O_E Lubin–Tate group, its Tate module, logarithm convergence and étale torsion exact sequence, in the covariant normalization F=σ/π. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` | Normalized π-divisible Dieudonné Hom comparison over R♯+/π: crystalline φ=π invariants identify with Hom_OE(E/O_E,G(R♯+/π))[1/π]; Lang/Artin–Schreier–Witt integral Frobenius trivialization. Full faithfulness alone is not an essential-surjectivity assertion. |
| `VStackSheavesAndLisseCategories:VS1` | Divisor-to-Weil map and local reciprocity comparison for the fundamental E×-torsor; supplier owns the Weil/étale-local-system map, this part only its BC/Lubin–Tate identification. |
| `DiamondEtaleCohomology:C4` | Taut partial properness, properness descent and valuative criteria of ECD 11.19,11.24,18.10; a surjective proper map is a v-cover on perfectoid geometric points, used by the nowhere-zero-section locus. |
| `DiamondSixOperations:S4` | Cohomological smoothness is v-local and stable under composition/extension of E-module v-sheaves, with the hypotheses of ECD23.13. |
| `DiamondSixOperations:S5` | Perfectoid balls, locally profinite torsor quotients and scalar quotient examples; ECD24.2, including cohomologically smooth dimension and additivity through the BC presentations. |
| `DiamondsAndVStacks:D5` | Extend the existing spatial-v-sheaf criterion to FSII.3.8: a surjective qcqs cohomologically smooth map from a spatial diamond to a small v-sheaf makes the target spatial; a COVER by locally closed GENERALIZING spatial-diamond sub-v-sheaves makes a spatial v-sheaf a spatial diamond. Do not omit coverage or generalizing hypotheses. |
| `DiamondsAndVStacks:D3` | Pro-étale sites of perfectoid spaces and finite-rank coefficient local systems, with effective sheaf/tensor descent; the specialized locally profinite torsor theorem is imported by node id. |
| `PadicHodgeTheory:R06.1` | Period Rings as functors on sympathetic algebras (BdR⁺,BdR,Bcris⁺ and their reductions), compatible evaluation and completion/filtration maps. No abstract replacement of these Rings by arbitrary VS targets. |
| `PadicHodgeTheory:R06.2` | Admissible rank-two supercuspidal (φ,N,G_F)-module realization and the representation input used alongside X_st⁺ Dimension in CDN Lemma2.7. |
| `PerfectoidSpaces:P3` | Tilting/untilting equivalence of finite étale sites for the integral Frobenius comparisons and inverse perfection; finite-étale completed limit control. |
| `RelativeFarguesFontaine:RF0:integral-Y` | Integral Y_[0,r] with characteristic-p boundary, Frobenius-inverse equivariance, and comparison with the open Y_(0,r]; the boundary integral period rings W(R) and integral Robba sheaves. |
| `RelativeFarguesFontaine:RF1` | KL relative schematic FF_X over affinoid perfectoid untilts, compatible with Proj(P_R) and with perfectoid pullback. The E-general adic curve is already imported via companion node contracts. |
| `SchemeAndStackFoundations:SF.0` | Generic torsion-pair tilt heart inside the existing bounded derived category, its abelianness and triangular Hom/Ext¹ description; finite-support coherent sheaves on a regular curve are hereditary (Ext²=0). Keep this generic derived machinery in SF.0. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence` | Arithmetic Lubin–Tate module and reciprocity normalization; BC carries only the geometric universal-cover comparison. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality` | Unramified Q_{p^d}/Q_p and its arithmetic Frobenius; semilinear Hilbert90 descent for proportional (c,d) pairs. |
| `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules` | Representation/comodule and tensor-functor torsor dictionary; the integral smooth-affine connected-fibre version needed by SW19.5.2/22.6.1 exceeds the upstream field-only reconstruction and is requested as ReductiveGroups, PartII. |

The formalization acceptance set includes O(−1), O, O(1), O(1/2), unequal-slope
sums, a nontrivial extension, a varying polygon, a constant-polygon locus and a
slope-zero local system with nontrivial monodromy. It also includes the p-monodromy
Tate-curve local system, the nodal sheaf example, a torsion object at x≠∞, and the
fixed-determinant quaternion/SL₂ quotients. The zero object is tested separately
where strict numerical inequalities would otherwise fail. Never turn a local
statement into a global one, a rational local system into an integral lattice,
or a relative spatial morphism into an absolute spatiality assertion.

## Atlas landmarks and integration

| Layer | Planets |
| --- | --- |
| `VectorBundlesAndIsocrystals:VB3:positive-basic-examples` | Banach–Colmez spaces, Lubin–Tate universal cover, Fundamental exact sequence |
| `VectorBundlesAndIsocrystals:VB3:projectivized-properness` | Projectivized Banach–Colmez properness, Contracting action lemma, Scalar projectivization |
| `VectorBundlesAndIsocrystals:VB3:general-BC` | Two-term Banach–Colmez families, Dimension, Curvature, Canonical curvature filtration, Le Bras equivalence, Banach–Colmez category |
| `VectorBundlesAndIsocrystals:VB4` | HN semicontinuity, Relative Harder–Narasimhan filtration, Slope-zero local systems, Pure models, Ampleness and positive slopes, Twisted rational local systems |

The packet proposes atomic stage-edge integration, a generic topology owner
for the contracting-action theorem, and the integral ReductiveGroups Part II
extension. Current IDs and scope remain unchanged while those proposals are
reviewed. All declarations remain unchecked, and no gap-free closure or
implementation claim follows from a successful signature check.
