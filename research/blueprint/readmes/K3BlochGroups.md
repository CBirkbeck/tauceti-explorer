# Explicit K₃ and Bloch groups

Degree-three algebraic K-theory admits two complementary descriptions: cycles
in the bar complex of a stable Steinberg group, and symbols in a Bloch group.
This roadmap builds the maps between them, keeps their integral torsion, and
makes their representatives usable. Its principal comparison is the Suslin
sequence

\[
0\longrightarrow\widetilde{\operatorname{Tor}}_1^{\mathbb Z}
(\mu(F),\mu(F))\longrightarrow K_3^{\mathrm{ind}}(F)
\xrightarrow{s_F}B(F)\longrightarrow0.
\]

The infinite-field proof belongs to V.4. Finite fields of at least four
elements use V.5's refined Bloch–Wigner comparison. The small fields are
computed directly from their presentations. A rational isomorphism is a
consequence of this sequence; it does not determine the integral maps or the
choice of a lift.

## Scope and ownership

V.1 starts with associative unital rings. V.2's symbols and V.3–V.6's Bloch
groups use fields. V.4's stability and configuration-acyclicity arguments
require infinite fields. Number-field and coefficient statements carry their
additional hypotheses explicitly. Every item below is a library target,
including its representative formulas, naturality, quotient or kernel API,
and discriminating tests. Supplier results are imported at their stated
generality. A cited proof input without an exact supplier is an explicit
closure requirement, not an implementation claim.

The neighbouring roadmaps delimit the work as follows.

| Supplier or consumer | Boundary |
| --- | --- |
| [General algebraic K-theory](../../../content/campaign/GeneralAlgebraicKTheory/README.md), K.2:plus | Owns Quillen K-groups, their plus model, products and stable GL. This roadmap identifies degree three with Steinberg homology. K.2:low-degree-comparisons consumes that identification; the whole K.2 stage is therefore not an admissible prerequisite for V.4. |
| [K₂, symbols and Brauer groups](../../../content/campaign/K2SymbolsBrauer/README.md), T.1:classical and T.2:symbols | Owns Steinberg and elementary groups, universal central extensions, Milnor K-theory, Matsumoto symbols and the general Bass–Tate real-signature theorem. V.1 applies superperfection; V.2 uses the degree-three map and its image. |
| [Low-degree K-theory](../../../content/campaign/KTheoryLowDegrees/README.md), U.1 | Supplies elementary and stable linear-group interfaces. V.1 constructs the degree-three homological model. |
| [Homotopy foundations for K-theory](../../../content/campaign/StableHomotopyKTheory/README.md), H.1–H.3 | Supplies classifying-space/bar comparisons, homotopy fibres and plus constructions, building on upstream topology. Hopf/Whitehead operations, the sphere-unit action and general discrete-group homology tools need the precise extensions listed below. H.6's spectral-sequence machinery for spectra does not replace group-module hyperhomology. |
| [Algebraic topology](../../../content/tau-ceti/AlgebraicTopology/README.md), Stage 8, and [Universal covers](../../../content/tau-ceti/UniversalCovers/README.md), Stages 2–3 | Own absolute Hurewicz, its naturality and covering lifts. V.1 applies these to the Steinberg plus space and elementary cover; it does not re-plan their ordinary topological theory. |
| [Motivic and étale K-theory](../../../content/campaign/MotivicEtaleKTheory/README.md), M.5–M.8 | Supplies motivic spectral sequences, the off-diagonal motivic-to-étale comparison and finite Chern classes. V.2 consumes its weight-two edge; V.4 needs an early torsion-detection slice before regulator comparisons; V.6 consumes the normalized finite comparison. |
| [Finite and local-field K-theory](../../../content/campaign/KTheoryFiniteLocalFields/README.md), L.1 | Owns stable finite-field K-groups, restriction and transfer. V.5 owns the indecomposable and unstable-to-Bloch applications. |
| [Arithmetic K-theory](../../../content/campaign/ArithmeticKTheory/README.md), N.5, N.7 and N.8 | Owns ambient arithmetic K-groups and the Adams–Bott invariant. V.5 tracks their Milnor image and Bloch quotient. The requested N.8 certificates must import N.5, rather than depend back on V.5. |
| [Polylogarithms](../../../content/campaign/Polylogarithms/README.md), P.1–P.2, and [Borel regulators](../../../content/campaign/BorelRegulators/README.md), R.7 | Own dilogarithm analysis and regulator normalization. V.3 consumes Bloch–Wigner descent, V.5 consumes the interval Rogers identities to detect integral torsion, and V.6 states the algebraic comparison needed by regulators. |
| [Algebraic curves](../../../content/tau-ceti/AlgebraicCurves/README.md), Layer 12A dictionary | Supplies the canonical local-DVR and specialization interface for all smooth, separated finite-type curves, including open curves. V.3 owns the resulting Goncharov relation quotient, not another curve theory. |
| [Habiro number fields](../../../content/campaign/HabiroNumberFields/README.md), HB.1–HB.2 | Consumes the published CGZ convention, finite-field Cartan maps and algebraic root classes. It owns the étale Bloch extension and cyclotomic trivialization used by V.6's finite-coefficient comparison. The algebraic export must precede the arithmetic comparison; no whole-stage circular import is permitted. |
| [p-adic Hodge regulators](../../../content/campaign/PadicHodgeRegulators/README.md), D.2 | Owns the syntomic/étale regulator and p-adic dilogarithm. Its comparison must specify how decomposable K₃ classes are removed. |

The upstream link maps in [research/blueprint/links](../links/) supply boundary
evidence for these existing directions; exact internal prerequisite IDs are
listed with each target. No dedicated K3BlochGroups link map is required to
define a second owner for an imported result.

## Conventions

Write the unit group additively when forming integral tensors. Set

\[
Q_s(F)=\frac{F^\times\otimes_{\mathbb Z}F^\times}
 {\langle u\otimes v+v\otimes u\rangle},\qquad
\partial[x]=x\wedge(1-x).
\]

This antisymmetric quotient retains the diagonal two-torsion. It is not the
exterior square integrally. The canonical map to \(\bigwedge^2 F^\times\)
has kernel described by the diagonal map from \(F^\times/2F^\times\).
Tau Ceti's existing `antisymmetricTensors` is a negative-eigenspace kernel;
it does not supply this cokernel over ℤ.

For distinct \(x,y\ne0,1\), use the ordered relation

\[
[x]-[y]+[y/x]-[(1-x^{-1})/(1-y^{-1})]+[(1-x)/(1-y)]=0.
\]

The primary pre-Bloch group \(P(F)\) is the free group on nonzero elements,
modulo these relations and \([1]=0\). The reduced presentation on
\(F\setminus\{0,1\}\) is canonically equivalent. Junk symbols at 0 and 1
are zero in this presentation. Suslin's Bloch group is
\(B(F)=\ker(\partial:P(F)\to Q_s(F))\). Use a separate name
\(\widetilde B(F)\) for the exterior-boundary kernel.

The class \(c=[x]+[1-x]\) is independent of admissible \(x\). The assignment
\(\langle u\rangle=[u]+[u^{-1}]\) exists for every field, but its additive
homomorphism law is asserted only for \(|F|\ge4\). For example,
\(P(\mathbb F_3)=\mathbb Z[-1]\) and \(\langle-1\rangle=2[-1]\).

Keep the following convention dictionary throughout the six layers.

| Name | Carrier and comparison |
| --- | --- |
| Bloch's lecture kernel | The kernel of \([x]\mapsto(1-x)\otimes x\) on the *raw* reduced free group. Its comparison with B(F) first divides out the raw relation kernel. The remaining obstruction is killed by six for \(|F|\ge4\). Rationalizing the raw kernel alone is insufficient. |
| Goncharov's generic B₂ | The quotient by alternating cross-ratio relations of five distinct points. It is P(F) integrally, not B(F). Its boundary has sign opposite to the chosen Suslin boundary, and its cycle kernel identifies with B(F). |
| Goncharov's rational all-curve B₂ | The quotient by specializations over every admissible smooth curve. It has a canonical rational generic-to-curve quotient map after the local-DVR dictionary is supplied; injectivity requires the separate K_curv input. The F(t) case does not establish the all-curve result. |
| `cgzBloch`, written B_CGZ,old | The inherited exterior-target construction: take raw exterior cycles on ℙ¹ and their image in the extended five-term quotient. Its comparison from B(F) has kernel and cokernel killed by two. |
| `CGZPublished.B`, written B_CGZ,new | The published CGZ construction uses \(Q_-(F)=(F^\times\otimes F^\times)/\langle u\otimes(-u)\rangle\) and the kernel of its descended boundary on the extended quotient. For \(|F|\ge4\), κ_new is surjective with kernel \(B(F)\cap H(F)\), killed by two. It injects into B_CGZ,old. |

Here \(H(F)\) is generated by the angle assignment. The distinction between
the two CGZ carriers is visible over \(\mathbb F_{11}\): B_CGZ,old is ℤ/6
and B_CGZ,new is ℤ/3. Setting the projective symbol [0] to zero imposes a
further relation and cannot be silently treated as either carrier. Published
CGZ citations refer to B_CGZ,new; inherited exterior-convention target IDs
continue to refer to B_CGZ,old.

For coefficients, distinguish the ordinary quotient \(K_3(F)/n\) from
\(K_3(F;\mathbb Z/n)\), whose right-hand Bockstein term is \(K_2(F)[n]\).
Similarly B(F)/n is not the étale Bloch extension. The root coefficient
class uses B(F)⊗R with R on the right; a unit root order is required, flatness
is not. A coefficient kernel need not equal the tensor of the integral kernel.

## Sources and library inputs

The principal sources are Weibel's *K-book*, Suslin's degree-three Bloch-group
paper and his characteristic-class/Milnor-homology paper, Bass–Tate for global
Milnor K-theory, Bloch and Goncharov for the convention presentations,
Calegari–Garoufalidis–Zagier for the published modified and étale groups,
Hutchinson for finite-field unstable homology and the refined Bloch–Wigner
complex, and Hutchinson's finite Chern-class comparison. The source register
below distinguishes the combined K-book from its standalone chapters and
published CGZ from arXiv versions. A citation's edition and locator belong
together.

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
at `f790474821cf4256814db967cb154e7af3d0c369`. The
[library audit](../../../data/library-coverage.json) supplies the reusable
carriers: free abelian groups, additive quotients and kernels, tensor and
exterior powers, chain complexes, group homology and its bar cycles/maps,
roots of unity, norm-one and special-linear matrix interfaces, and real places.
It does not supply the headline K₃/Bloch comparisons. The declaration register
records the imported statements, rather than proposing them again.

## Layer overview and dependency order

| Layer | Development | Primary exports |
| --- | --- | --- |
| [V.1](#v1) | Steinberg plus construction, two-connected Hurewicz comparison, bar certificates, Hopf/product kernel | K₃(A)≃H₃(St(A),ℤ), representative evaluation and naturality, K₂→K₃→H₃(E)→0 |
| [V.2](#v2) | Degree-three Milnor map, indecomposable quotient, real signatures, motivic edge and arithmetic rank | K₃ᶦⁿᵈ, real-place basis, stable SL homology quotient |
| [V.3](#v3) | Suslin, lecture, exterior, generic/all-curve Goncharov and the two CGZ conventions | Named quotient/kernel maps with their exact torsion discrepancies |
| [V.4](#v4) | Frames, stability, configuration hyperhomology, cross-ratios, monomial and Chern torsion detection | Infinite-field Suslin sequence with enhanced Tor and natural maps |
| [V.5](#v5) | Finite unstable homology and refined comparison, Cartan maps, arithmetic Milnor images, Rogers detector | Finite Bloch orders and coefficient maps; arithmetic indecomposables; exact order of c |
| [V.6](#v6) | Finite five-term/boundary certificates, integral root multiples, coefficient classes and lift fibres | Certified representative interfaces and explicitly normalized coefficient comparisons |

V.1 and V.3 provide independent starting directions. V.2 uses V.1's Hurewicz
sequence. V.4 uses V.1–V.3; V.5 uses the finite L.1 and arithmetic N.5 inputs
alongside those algebraic exports. V.6 combines their representative APIs.
The elementary cross-ratio definition `V.4/cross-ratio` precedes V.3's generic
configuration presentation as a foundational slice: it uses only field
arithmetic and projective coordinates, not V.4's Bloch-valued homology maps.
This exact node dependency does not import the whole V.4 stage into V.3.

For consumers, distinguish V.6's algebraic certificates and root classes
from its arithmetic finite-Chern and regulator comparison slice. The former
exports to HB.2, P.2 and D.2; the latter imports HB.1/M.7/M.8 and the analytic
normalizations. Supplier closure requires the early Chern slice for V.4 and
removal of the reverse N.8 arithmetic edge. Neither direction is concealed by
a whole-roadmap prerequisite.

The following layers give every target once. Each entry states its hypotheses,
proof route, exact imports, source locators and usable API or tests. The named
closure requirements at the end of each layer explain where a proof input
still needs a supplier or a source decomposition.

<a id="v1"></a>

## V.1: Steinberg homology and bar representatives

Start from the universal central extension St(A)→E(A) supplied by
T.1:classical. Its superperfect source gives a two-connected Steinberg plus
space. Compare it with the two-connected cover of BGL(A)⁺, then apply the
natural degree-three Hurewicz isomorphism and the classifying-space/bar
comparison. The order of these isomorphisms defines the canonical K₃
evaluation; an arbitrary isomorphism between abstract groups does not.

Use Mathlib's unnormalised bar complex. A cycle certificate is a finite chain
with vanishing differential; equality of homology classes has a finite
degree-four boundary witness. Ring maps act entrywise and commute with
evaluation. Filtered stabilization requires both eventual cycles and eventual
boundary witnesses. For E(A), transport the H-space structure through covering
lifts, compute the degree-three Hopf kernel, and identify the operation with
multiplication by the central K₁(ℤ) class of −1. In characteristic two the
central map factors through ℤ→𝔽₂→A, so this operation vanishes even for an
associative noncommutative ring.

**Planets.** [Superperfection of St(A)](#v-1-steinberg-superperfect); [Homological model of K₃](#v-1-k3-h3-steinberg); [Bar model of K₃](#v-1-bar-cycle-model); [K₃ and H₃ of the elementary group](#v-1-k2-to-k3-h3-e); [Suslin’s Hurewicz lemma](#v-1-hspace-hopf-kernel-refinement).

<a id="v-1-steinberg-superperfect"></a>

### V.1.1: The stable Steinberg group is superperfect

`K3BlochGroups:V.1/steinberg-superperfect` · theorem

For every associative unital ring A the stable Steinberg group St(A) satisfies H_1(St(A), Z) = 0 and H_2(St(A), Z) = 0, i.e. it is superperfect in the sense of K2SymbolsBrauer:T.1:classical/superperfect. The statement is about the stable group, with no stable-range hypothesis on A; no claim is made for the finite-rank groups St_n(A), whose kernels K2SymbolsBrauer T.1 keeps separate. It is a corollary of two imported theorems and is not proved here: St(A) → E(A) is a universal central extension (K2SymbolsBrauer:T.1/steinberg-is-uce), and the source of a universal central extension is superperfect (K2SymbolsBrauer:T.1:classical/uce-source-superperfect, the Recognition Theorem's (1) ⇒ (3)).

**Hypotheses.** A is an associative unital ring in Type (Mathlib's integral group homology needs St(A) in the universe of ℤ). St(A) is the stable Steinberg group of K2SymbolsBrauer:T.1/stabilisation, the colimit of the St_n(A).

**Construction and proof.**

1. Import from K2SymbolsBrauer:T.1/steinberg-is-uce that St(A) → E(A) is a universal central extension with kernel K_2(A), for every ring (K-book Theorem III.5.5 has no hypothesis on A).
2. Apply K2SymbolsBrauer:T.1:classical/uce-source-superperfect to it. The group-theoretic argument (perfectness, splitting of central extensions of a universal source, and the vanishing of H_2 when central extensions by Q/Z split) is owned there; this layer formerly planned it as V.1/uce-superperfect, V.1/central-extension-comp and V.1/split-extensions-kill-h2, which moved to K2SymbolsBrauer T.1:classical under RT-AREA-ktheory-1/29.
3. Record explicitly that no finite-rank statement is asserted.

**Acceptance.**

- For A the zero ring St(0) is trivial and the statement holds.
- For A = Z, H_2(E(Z), Z) ≅ K_2(Z) ≅ Z/2 (K-book III.5.5; K2SymbolsBrauer T.5) while H_2(St(Z), Z) = 0: superperfection is a property of St(A), not of E(A).

**Imports.** [`K2SymbolsBrauer:T.1/stabilisation`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.1/steinberg-is-uce`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.1:classical/uce-source-superperfect`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.1:classical/superperfect`](../packets/K2SymbolsBrauer--T.1.json), [`mathlib:groupHomology.H1`](#baseline-mathlib-grouphomology-h1), [`mathlib:groupHomology.H2`](#baseline-mathlib-grouphomology-h2).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Theorem III.5.5 (PDF p. 228); [Kbook.2013](#source-0-kbook-2013) — Ex. IV.1.9 (PDF p. 282).

<a id="v-1-bst-plus"></a>

### V.1.2: The plus construction on the classifying space of the stable Steinberg group

`K3BlochGroups:V.1/bst-plus` · construction

For a ring A, BSt(A)⁺ is the plus construction of the classifying space B St(A) relative to the perfect normal subgroup St(A) itself (StableHomotopyKTheory H.3). It comes with the canonical map ι: B St(A) → BSt(A)⁺, which induces an isomorphism on integral homology, and with the map q: BSt(A)⁺ → BGL(A)⁺ induced by St(A) → E(A) ⊂ GL(A). Both are determined up to homotopy, and a ring map A → B induces BSt(A)⁺ → BSt(B)⁺ compatibly with ι and q. Its connectivity, its homotopy groups and the fibration over BE(A)⁺ are the separate nodes V.1/bst-plus-two-connected, V.1/bst-plus-connected-cover and V.1/uce-plus-fibration.

**Hypotheses.** A is an associative unital ring. The plus construction is the one of StableHomotopyKTheory H.3, taken relative to the named perfect normal subgroup.

**Construction and proof.**

1. Apply H.3 to the connected space B St(A) (StableHomotopyKTheory H.1) and the perfect normal subgroup St(A) of its fundamental group (perfect by V.1/steinberg-superperfect, that is, by K2SymbolsBrauer:T.1:classical/stable-steinberg-perfect).
2. H.3 gives π_1(BSt(A)⁺) = 1 and the homology isomorphism ι; H.1 identifies H_*(B St(A); Z) with Mathlib group homology of St(A) with coefficients Rep.trivial Z (St A) Z.
3. St(A) → E(A) (K2SymbolsBrauer T.1:classical) followed by E(A) ⊂ GL(A) (KTheoryLowDegrees U.1) carries St(A) into E(A), the perfect subgroup selected for BGL(A)⁺ (GeneralAlgebraicKTheory K.2:plus), so H.3's functoriality gives q.
4. A ring map A → B induces St(A) → St(B) (T.1:classical), hence BSt(A)⁺ → BSt(B)⁺ compatible with ι and q up to homotopy.
5. Every assertion is up to homotopy; no chosen model is asserted to be equal to another.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `bStPlus` | constructor | For a ring A, the space BSt(A)⁺ together with the canonical map ι : B St(A) → BSt(A)⁺. |
| `bStPlus.ι_homology` | structure | ι induces isomorphisms H_n(B St(A); Z) ≅ H_n(BSt(A)⁺; Z) for all n. |
| `bStPlus.toBGLPlus` | projection | The map q : BSt(A)⁺ → BGL(A)⁺ induced by St(A) → E(A) ⊂ GL(A). |
| `bStPlus_map` | functoriality | A ring map A → B induces a map BSt(A)⁺ → BSt(B)⁺ compatible with ι and q up to homotopy. |
| `bStPlus_map_id` | functoriality | The map induced by the identity of A is homotopic to the identity. |
| `bStPlus_map_comp` | functoriality | The map induced by g ∘ f is homotopic to the composite of the maps induced by g and f. |
| `bStPlus_twoConnected` | characterisation | BSt(A)⁺ is 2-connected (node V.1/bst-plus-two-connected). |
| `bStPlus_pi_eq_K` | compatibility | For n ≥ 3, q induces π_n(BSt(A)⁺) ≅ K_n(A), natural in A (node V.1/bst-plus-connected-cover). |
| `bStPlus_fibration` | structure | The homotopy fibration B K_2(A) → BSt(A)⁺ → BE(A)⁺ (node V.1/uce-plus-fibration). |

**Unit tests.**

- `bStPlus_zero_ring` (degenerate): For the zero ring, St(0) is trivial and BSt(0)⁺ is contractible.
- `bStPlus_pi_one_Z` (non-example): π_1(BSt(Z)⁺) = 1 although π_1(B St(Z)) = St(Z) ≠ 1: a definition taking the plus construction relative to the trivial subgroup fails this test.
- `bStPlus_homology_compat` (compatibility): ι induces H_3(BSt(A)⁺; Z) ≅ groupHomology (Rep.trivial Z (St A) Z) 3, through the comparison of StableHomotopyKTheory H.1.
- `bStPlus_ne_BEPlus` (non-example): π_2(BSt(Z)⁺) = 0 whereas π_2(BE(Z)⁺) ≅ K_2(Z) ≅ Z/2, so BSt(A)⁺ is not BE(A)⁺.
- `bStPlus_ne_BGLPlus` (non-example): π_1(BGL(Q)⁺) ≅ K_1(Q) ≅ Q^× is nontrivial while π_1(BSt(Q)⁺) = 1, so BSt(A)⁺ is not BGL(A)⁺.

**Uses.**

- V.1's identification of K_3 with H_3(St(A), Z): the degree-three isomorphism is read off this space through the Hurewicz theorem.
- GeneralAlgebraicKTheory K.2:low-degree-comparisons: the explicit K_3 model this roadmap exports is assembled there with the K_1 and K_2 models.
- V.5's route to K_3(Z): Lee and Szczarba's calculation runs through a variant of this model, as the K-book records.

**Acceptance.**

- π_1(BSt(Z)⁺) = 1 although π_1(B St(Z)) = St(Z) ≠ 1: the construction is taken relative to St(A), not the trivial subgroup.
- For A = Z, π_2(BSt(Z)⁺) = 0 while π_2(BE(Z)⁺) ≅ K_2(Z) ≅ Z/2, so BSt(A)⁺ is not BE(A)⁺.

**Imports.** [`K3BlochGroups:V.1/steinberg-superperfect`](#v-1-steinberg-superperfect), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`K2SymbolsBrauer:T.1:classical`](../packets/K2SymbolsBrauer--T.1.json), [`GeneralAlgebraicKTheory:K.2:plus`](../packets/GeneralAlgebraicKTheory--K.1.json), [`KTheoryLowDegrees:U.1`](../packets/KTheoryLowDegrees--U.1.json), [`mathlib:Rep.trivial`](#baseline-mathlib-rep-trivial).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Ex. IV.1.9 (PDF p. 282).

<a id="v-1-uce-plus-fibration"></a>

### V.1.3: The plus construction on a universal central extension

`K3BlochGroups:V.1/uce-plus-fibration` · lemma

For a universal central extension 1 → A → S → P → 1, with plus constructions taken relative to S and to P (both perfect), the induced sequence BA → BS⁺ → BP⁺ is a homotopy fibration. Consequently π_n(BS⁺) → π_n(BP⁺) is an isomorphism for every n ≥ 3.

**Hypotheses.** S → P is a universal central extension; S and P are perfect (K-book Lemma III.5.3.2, imported as K2SymbolsBrauer:T.1/uce-perfect).

**Construction and proof.**

1. BA → BS → BP is a fibration with fibre the K(A, 1) space BA (StableHomotopyKTheory H.1 and H.2).
2. P acts trivially on the homology of BA because A is central in S.
3. The comparison of fibres after the plus construction (StableHomotopyKTheory H.3, requested for central extensions of perfect groups) makes BA → BS⁺ → BP⁺ a homotopy fibration.
4. The long exact sequence of homotopy groups (H.2) and π_n(BA) = 0 for n ≥ 2 give the isomorphisms in degrees at least three.

**Acceptance.**

- For S = St(A) and P = E(A) the fibre is B K_2(A), and π_2(BE(A)⁺) ≅ K_2(A).

**Imports.** [`K2SymbolsBrauer:T.1/universal-central-extension`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.1/uce-perfect`](../packets/K2SymbolsBrauer--T.1.json), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.2`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Ex. IV.1.9 (PDF p. 282).

<a id="v-1-bst-plus-two-connected"></a>

### V.1.4: BSt(A)⁺ is two-connected

`K3BlochGroups:V.1/bst-plus-two-connected` · lemma

For every associative unital ring A, π_1(BSt(A)⁺) = 0 and π_2(BSt(A)⁺) = 0.

**Hypotheses.** A is an associative unital ring.

**Construction and proof.**

1. π_1(BSt(A)⁺) = St(A)/St(A) = 1 (StableHomotopyKTheory H.3).
2. For the simply connected space BSt(A)⁺ the Hurewicz theorem gives π_2 ≅ H_2(BSt(A)⁺; Z) (Tau Ceti AlgebraicTopology Stage 8; recorded gap on upstream citations).
3. H_2(BSt(A)⁺; Z) ≅ H_2(B St(A); Z) (H.3) ≅ H_2(St(A), Z) (StableHomotopyKTheory H.1), which is 0 by V.1/steinberg-superperfect.

**Acceptance.**

- The statement fails for BE(Z)⁺, whose π_2 is K_2(Z) ≅ Z/2; superperfection is what is used.

**Imports.** [`K3BlochGroups:V.1/bst-plus`](#v-1-bst-plus), [`K3BlochGroups:V.1/steinberg-superperfect`](#v-1-steinberg-superperfect), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Ex. IV.1.9 (PDF p. 282).

<a id="v-1-bst-plus-connected-cover"></a>

### V.1.5: BSt(A)⁺ as the two-connected cover of BGL(A)⁺

`K3BlochGroups:V.1/bst-plus-connected-cover` · comparison

For every associative unital ring A and every n ≥ 3, the map q : BSt(A)⁺ → BGL(A)⁺ of V.1/bst-plus induces isomorphisms π_n(BSt(A)⁺) ≅ π_n(BGL(A)⁺) = K_n(A), natural in A. With V.1/bst-plus-two-connected, q exhibits BSt(A)⁺ as a two-connected cover of the base-point component of the K-theory space: a map from a two-connected space inducing isomorphisms on π_n for n ≥ 3.

**Hypotheses.** A is an associative unital ring; no stable-range hypothesis.

**Construction and proof.**

1. Apply V.1/uce-plus-fibration to the universal central extension St(A) → E(A) with kernel K_2(A) (K2SymbolsBrauer T.1:classical): π_n(BSt(A)⁺) ≅ π_n(BE(A)⁺) for n ≥ 3.
2. BE(A)⁺ is homotopy equivalent to the universal cover of BGL(A)⁺, so π_n(BE(A)⁺) ≅ π_n(BGL(A)⁺) for n ≥ 2 (K-book Ex. IV.1.8, requested from StableHomotopyKTheory H.3).
3. K_n(A) = π_n(BGL(A)⁺) for n ≥ 1 (GeneralAlgebraicKTheory K.2:plus); naturality follows from the functoriality of the plus construction (H.3).

**Acceptance.**

- In degree two the map is 0 → K_2(A), not an isomorphism; the comparison starts in degree three.

**Imports.** [`K3BlochGroups:V.1/bst-plus`](#v-1-bst-plus), [`K3BlochGroups:V.1/uce-plus-fibration`](#v-1-uce-plus-fibration), [`K3BlochGroups:V.1/bst-plus-two-connected`](#v-1-bst-plus-two-connected), [`K2SymbolsBrauer:T.1:classical`](../packets/K2SymbolsBrauer--T.1.json), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json), [`GeneralAlgebraicKTheory:K.2:plus`](../packets/GeneralAlgebraicKTheory--K.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Ex. IV.1.8 (PDF p. 282); [Kbook.2013](#source-0-kbook-2013) — Ex. IV.1.9 (PDF p. 282).

<a id="v-1-k3-h3-steinberg"></a>

### V.1.6: K_3 of a ring is the third homology of its stable Steinberg group

`K3BlochGroups:V.1/k3-h3-steinberg` · theorem

For every ring A the composite K_3(A) ≅ π_3(BSt(A)⁺) → H_3(BSt(A)⁺; Z) ≅ H_3(B St(A); Z) ≅ H_3(St(A), Z) is an isomorphism. The maps are, in order: the inverse of the degree-three case of V.1/bst-plus-connected-cover, the Hurewicz map of the 2-connected space BSt(A)⁺, the inverse of the homology isomorphism of the plus construction, and the comparison of StableHomotopyKTheory H.1 with Mathlib group homology with trivial coefficients Z. Naturality is the separate node V.1/k3-naturality.

**Hypotheses.** A is an associative unital ring.

**Construction and proof.**

1. BSt(A)⁺ is 2-connected (V.1/bst-plus-two-connected).
2. The absolute Hurewicz theorem in degree three, for a 2-connected space, identifies π_3(BSt(A)⁺) with H_3(BSt(A)⁺; Z) (owned by the Tau Ceti AlgebraicTopology roadmap, Stage 8; see the recorded gap on upstream citations).
3. The homology isomorphism ι of V.1/bst-plus (StableHomotopyKTheory H.3) and H.1's comparison of bar homology with singular homology of B St(A) identify H_3(BSt(A)⁺; Z) with groupHomology (Rep.trivial Z (St A) Z) 3.
4. π_3(BSt(A)⁺) ≅ K_3(A) by V.1/bst-plus-connected-cover.

**Acceptance.**

- For A = F_q the right-hand side is finite (Kuku, K-book IV.1.16) and cyclic of order q² − 1 (KTheoryFiniteLocalFields L.1).
- For A the zero ring both sides are 0.
- Non-example: H_3(E(Z), Z) ≅ Z/24 (V.1/k2-to-k3-h3-e) differs from K_3(Z) ≅ Z/48, so the Steinberg group cannot be replaced by the elementary group.

**Imports.** [`K3BlochGroups:V.1/bst-plus`](#v-1-bst-plus), [`K3BlochGroups:V.1/bst-plus-two-connected`](#v-1-bst-plus-two-connected), [`K3BlochGroups:V.1/bst-plus-connected-cover`](#v-1-bst-plus-connected-cover), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json), [`mathlib:groupHomology`](#baseline-mathlib-grouphomology), [`mathlib:Rep.trivial`](#baseline-mathlib-rep-trivial).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Ex. IV.1.9 (PDF p. 282).

<a id="v-1-bar-cycle-model"></a>

### V.1.7: The bar model for H_3 of the stable Steinberg group

`K3BlochGroups:V.1/bar-cycle-model` · construction

Present H_3(St(A), Z) through Mathlib's inhomogeneous (bar) chain complex with trivial coefficients Z: a bar 3-chain is a finitely supported function St(A) × St(A) × St(A) → Z (chainsIso₃); it is a bar 3-cycle when d₃₂ vanishes on it, and a bar 3-boundary when it is the image of a 4-chain under the general differential of the inhomogeneous complex. Construct the evaluation sending a bar 3-cycle to the element of K_3(A) that corresponds, under V.1/k3-h3-steinberg, to its homology class, and the induced chain map along a ring homomorphism.

**Hypotheses.** A is an associative unital ring. Coefficients are the trivial representation on Z.

**Construction and proof.**

1. Instantiate the inhomogeneous chain complex at G = St(A) and the trivial representation Rep.trivial Z (St A) Z.
2. Use chainsIso₃ and d₃₂ (with d₃₂_single) to describe bar 3-cycles in coordinates, cyclesMk to make a cycle from a chain with vanishing differential, and inhomogeneousChains.d on 4-chains (with d_single) to describe bar 3-boundaries.
3. Define the evaluation: the homology class groupHomology.π of a cycle, followed by the inverse of the isomorphism of V.1/k3-h3-steinberg.
4. Construct the induced chain map along a ring homomorphism from chainsMap applied to St(A) → St(B), and prove that evaluation commutes with it using groupHomology.map and V.1/k3-naturality's square.
5. Record that a representative is not unique: two 3-cycles differing by a boundary evaluate equally.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `barCycle3` | data | The type of bar 3-cycles of St(A) with trivial integer coefficients. |
| `barCycle3.mk` | constructor | A finitely supported c : St(A) × St(A) × St(A) → Z with d₃₂ c = 0 gives a bar 3-cycle (via chainsIso₃ and cyclesMk). |
| `barBoundary3` | data | The bar 3-boundaries: images of 4-chains under the differential of the inhomogeneous complex. |
| `evalBarCycle` | constructor | A bar 3-cycle determines an element of K_3(A). |
| `evalBarCycleHom` | structure | Evaluation is an additive homomorphism from bar 3-cycles to K_3(A). |
| `evalBarCycle_eq` | compatibility | evalBarCycle z is the image of groupHomology.π z under the inverse of the isomorphism of V.1/k3-h3-steinberg. |
| `evalBarCycle_boundary` | simp | A bar 3-boundary evaluates to zero. |
| `evalBarCycle_surjective` | characterisation | Every element of K_3(A) is the evaluation of some bar 3-cycle. |
| `evalBarCycle_map` | functoriality | For a ring map A → B, evaluation commutes with the induced chain map. |
| `evalBarCycle_eq_iff` | characterisation | Two bar 3-cycles evaluate equally exactly when their difference is a boundary. |

**Unit tests.**

- `evalBarCycle_boundary_four_chain` (characterisation): The evaluation of the boundary of any 4-chain is zero.
- `evalBarCycle_one_one_one` (degenerate): The 3-cycle single (1,1,1) 1 is the boundary of single (1,1,1,1) 1, so its evaluation is 0.
- `single_g11_not_cycle` (non-example): For g = x_12(1) in St(Z), the chain single (g,1,1) 1 is not a bar 3-cycle: its image under d₃₂ is single (1,1) 1 − single (g,1) 1 ≠ 0.
- `evalBarCycle_naturality_square` (compatibility): For the inclusion Z → Q, evaluation commutes with the induced map on K_3.
- `evalBarCycle_not_injective` (non-example): The distinct cycles single (1,1,1) 1 and 0 have the same evaluation: evaluation is not injective on cycles.

**Uses.**

- V.6's certificates: a relation certificate is transported to a bar 3-cycle so that an integral comparison can be evaluated.
- V.4's comparison of the degree-three map with V.1: the configuration-complex map is compared with this evaluation on representatives.
- V.5's route to K_3(Z): Lee and Szczarba compute with an explicit variant of this model.

**Acceptance.**

- A boundary evaluates to zero.
- The evaluation commutes with a ring map, checked on an explicit cycle.
- The cycle [1|1|1] is the boundary of [1|1|1|1] (its five faces are equal and carry alternating signs, inhomogeneousChains.d_single), so it evaluates to zero; a general degenerate triple [g|1|h] is not a cycle (groupHomology.d₃₂_single_one_snd gives [1|h] − [g|1]), so evaluation is not defined on it.

**Imports.** [`K3BlochGroups:V.1/k3-h3-steinberg`](#v-1-k3-h3-steinberg), [`mathlib:groupHomology.inhomogeneousChains`](#baseline-mathlib-grouphomology-inhomogeneouschains), [`mathlib:groupHomology.chainsIso₃`](#baseline-mathlib-grouphomology-chainsiso-u2083), [`mathlib:groupHomology.d₃₂`](#baseline-mathlib-grouphomology-d-u2083--u2082), [`mathlib:groupHomology.d₃₂_single`](#baseline-mathlib-grouphomology-d-u2083--u2082--single), [`mathlib:groupHomology.d₃₂_single_one_snd`](#baseline-mathlib-grouphomology-d-u2083--u2082--single-one-snd), [`mathlib:groupHomology.inhomogeneousChains.d`](#baseline-mathlib-grouphomology-inhomogeneouschains-d), [`mathlib:groupHomology.inhomogeneousChains.d_single`](#baseline-mathlib-grouphomology-inhomogeneouschains-d-single), [`mathlib:groupHomology.cycles`](#baseline-mathlib-grouphomology-cycles), [`mathlib:groupHomology.cyclesMk`](#baseline-mathlib-grouphomology-cyclesmk), [`mathlib:groupHomology.π`](#baseline-mathlib-grouphomology--u3c0), [`mathlib:groupHomology.chainsMap`](#baseline-mathlib-grouphomology-chainsmap), [`mathlib:groupHomology.map`](#baseline-mathlib-grouphomology-map), [`mathlib:Rep.trivial`](#baseline-mathlib-rep-trivial).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Ex. IV.1.9 (PDF p. 282); [Kbook.2013](#source-0-kbook-2013) — Example VI.2.1.2 (PDF p. 478).

<a id="v-1-steinberg-homology-colimit"></a>

### V.1.8: Homology of the stable Steinberg group as a colimit

`K3BlochGroups:V.1/steinberg-homology-colimit` · lemma

For every associative unital ring A and every k ≥ 0, the maps St_n(A) → St(A) induce an isomorphism from the colimit of the H_k(St_n(A), Z) to H_k(St(A), Z). More generally, group homology with trivial coefficients commutes with filtered colimits of groups.

**Hypotheses.** St(A) is the colimit of the St_n(A) along the stabilisation maps (K2SymbolsBrauer T.1:classical).

**Construction and proof.**

1. The inhomogeneous k-chains (Fin k → G) →₀ Z commute with filtered colimits in G, compatibly with chainsMap and the differentials.
2. Filtered colimits are exact in ModuleCat Z (Mathlib's AB5 instance, Mathlib/Algebra/Category/ModuleCat/AB.lean:29), so homology commutes with them.

**Acceptance.**

- For k = 1 both sides vanish (the groups are perfect in the stable range and St(A) is perfect).

**Imports.** [`K2SymbolsBrauer:T.1:classical`](../packets/K2SymbolsBrauer--T.1.json), [`mathlib:groupHomology.inhomogeneousChains`](#baseline-mathlib-grouphomology-inhomogeneouschains), [`mathlib:groupHomology.chainsMap`](#baseline-mathlib-grouphomology-chainsmap), [`mathlib:CategoryTheory.AB5`](#baseline-mathlib-categorytheory-ab5).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — III.5.2 (PDF p. 225).

<a id="v-1-k3-naturality"></a>

### V.1.9: Naturality and stabilisation compatibility of the homological model

`K3BlochGroups:V.1/k3-naturality` · lemma

(a) Naturality: for every unital ring map f : A → B, the square formed by K_3(f), the isomorphisms of V.1/k3-h3-steinberg for A and B, and groupHomology.map for St(f) : St(A) → St(B) in degree three (trivial coefficients) commutes, and evalBarCycle commutes with chainsMap. (b) Stabilisation: the composites H_3(St_n(A), Z) → H_3(St(A), Z) ≅ K_3(A) are compatible with the maps St_n(A) → St_{n+1}(A), and every element of K_3(A) is the image of a class of H_3(St_n(A), Z) for some n.

**Hypotheses.** f : A → B is a unital ring homomorphism; A and B are associative unital rings.

**Construction and proof.**

1. A ring map induces homomorphisms of the Steinberg groups St_n and St, compatible with stabilisation (K2SymbolsBrauer T.1:classical).
2. The plus construction is functorial (StableHomotopyKTheory H.3), the comparison of V.1/bst-plus-connected-cover is natural, and the Hurewicz map is natural (Tau Ceti AlgebraicTopology Stage 8); compose the squares.
3. The homology comparison is natural in the group (StableHomotopyKTheory H.1), which gives the square with groupHomology.map.
4. Stabilisation: St(A) is the colimit of the St_n(A) and trivial-coefficient homology commutes with that colimit (V.1/steinberg-homology-colimit).

**Acceptance.**

- The naturality square commutes for the inclusion Z → Q, the case used in V.5.
- For the map from A to the zero ring the square is the zero map to 0.

**Imports.** [`K3BlochGroups:V.1/k3-h3-steinberg`](#v-1-k3-h3-steinberg), [`K3BlochGroups:V.1/bar-cycle-model`](#v-1-bar-cycle-model), [`K3BlochGroups:V.1/bst-plus-connected-cover`](#v-1-bst-plus-connected-cover), [`K3BlochGroups:V.1/steinberg-homology-colimit`](#v-1-steinberg-homology-colimit), [`K2SymbolsBrauer:T.1:classical`](../packets/K2SymbolsBrauer--T.1.json), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json), [`mathlib:groupHomology.map`](#baseline-mathlib-grouphomology-map), [`mathlib:groupHomology.chainsMap`](#baseline-mathlib-grouphomology-chainsmap).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Ex. IV.1.9 (PDF p. 282); [Kbook.2013](#source-0-kbook-2013) — III.5.2 (PDF p. 225).

<a id="v-1-eta-hurewicz-sequence"></a>

### V.1.10: Suslin's Hurewicz sequence in degree three

`K3BlochGroups:V.1/eta-hurewicz-sequence` · lemma

For a simply connected H-space X of CW type, the composition product with the Hopf map η and the Hurewicz map fit into an exact sequence π_2(X) → π_3(X) → H_3(X; Z) → 0.

**Hypotheses.** X is a simply connected H-space of CW type (Remark IV.1.19.1); in particular a simply connected loop space.

**Construction and proof.**

1. Maps f(i) : S² → X representing generators of π_2(X) give f : Y = ∨ S² → X, surjective on π_2.
2. π_3(Y) is generated by the classes of η on each sphere and the Whitehead products [ι_i, ι_j] with i < j (Hilton–Milnor), and Whitehead products map to zero in an H-space (recorded gap).
3. Since π_2(Y) → π_2(X) is onto and X is simply connected, π_3(Y) → π_3(X) → H_3(X) → 0 is exact (K-book Ex. IV.1.25, via relative Hurewicz; recorded gaps).
4. Hence the image of π_3(Y) is generated by the f(i) ∘ η, which is the image of composition with η on π_2(X).

**Acceptance.**

- For X = BE(Z)⁺ the sequence gives H_3(E(Z), Z) ≅ Z/24 (V.1/k2-to-k3-h3-e).

**Imports.** .

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma IV.1.19 (PDF p. 280); [Kbook.2013](#source-0-kbook-2013) — Remark IV.1.19.1 (PDF p. 281).

<a id="v-1-k2-to-k3-h3-e"></a>

### V.1.11: The product with [−1] and the Hurewicz map onto H_3 of the elementary group

`K3BlochGroups:V.1/k2-to-k3-h3-e` · theorem

For every associative unital ring R, the sequence K_2(R) → K_3(R) → H_3(E(R), Z) → 0 is exact. The first map is the product with [−1] ∈ K_1(Z) (the external product K_1(Z) ⊗ K_2(R) → K_3(Z ⊗ R) = K_3(R)); the second is the Hurewicz map of BE(R)⁺, the universal cover of BGL(R)⁺, followed by H_3(BE(R)⁺; Z) ≅ H_3(E(R), Z). The field version is the separate node V.2/k3-to-h3-sl-field.

**Hypotheses.** R is an associative unital ring.

**Construction and proof.**

1. BE(R)⁺ is a simply connected H-space: BGL(R)⁺ is the base-point component of a loop space (GeneralAlgebraicKTheory K.2:plus), BE(R)⁺ is its universal cover (K-book Ex. IV.1.8, requested from StableHomotopyKTheory H.3), and the universal cover of a connected H-space is an H-space (recorded gap on upstream citations).
2. Apply V.1/eta-hurewicz-sequence to X = BE(R)⁺.
3. Identify π_2(BE(R)⁺) ≅ K_2(R) and π_3(BE(R)⁺) ≅ K_3(R) (Ex. IV.1.8; K2SymbolsBrauer T.1:plus), and H_3(BE(R)⁺; Z) ≅ H_3(E(R), Z) (StableHomotopyKTheory H.3 and H.1).
4. Identify composition with η on π_2 with the product with [−1] ∈ K_1(Z) (K-book Ex. IV.1.12(a) and (e); recorded gap), the product being the external product of GeneralAlgebraicKTheory K.7.

**Acceptance.**

- For R = Z: K_2(Z) ≅ Z/2 on {−1,−1}; its image {−1,−1,−1} is the element of order two of K_3(Z) ≅ Z/48 (K-book VI.2.1.3), so H_3(E(Z), Z) ≅ Z/24.
- For R = F_q, K_2(F_q) = 0, so the Hurewicz map K_3(F_q) → H_3(E(F_q), Z) is an isomorphism.

**Imports.** [`K3BlochGroups:V.1/eta-hurewicz-sequence`](#v-1-eta-hurewicz-sequence), [`K2SymbolsBrauer:T.1:plus`](../packets/K2SymbolsBrauer--T.1.json), [`GeneralAlgebraicKTheory:K.2:plus`](../packets/GeneralAlgebraicKTheory--K.1.json), [`GeneralAlgebraicKTheory:K.7`](../packets/GeneralAlgebraicKTheory--K.6.json), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — IV.1.19–IV.1.20 (PDF pp. 280–281); [Kbook.2013](#source-0-kbook-2013) — Remark VI.2.1.3 (PDF p. 478).

<a id="v-1-two-connected-hurewicz-input"></a>

### V.1.12: Hurewicz input for the Steinberg plus space

`K3BlochGroups:V.1/two-connected-hurewicz-input` · theorem

For every associative unital ring A, let X_A = BSt(A)⁺ be the parent plus model. It is path connected with π₁(X_A)=π₂(X_A)=0. Its degree-three Hurewicz map is an isomorphism π₃(X_A) ≅ H₃(X_A; ℤ), natural for the chosen based ring-induced maps. This is the first nonzero-degree Hurewicz map, not a Hurewicz isomorphism for BGL(A)⁺.

**Hypotheses.** A is an associative unital ring; use the stable Steinberg group in the same universe as ℤ. Classifying spaces and plus models have CW homotopy type, with chosen basepoints.

**Construction and proof.**

1. Import the UCE-source superperfection corollary from the parent: H₁(St(A))=H₂(St(A))=0, using only K2SymbolsBrauer T.1:classical theory.
2. Apply the existing plus-cell construction and its homology preservation to the perfect group St(A); π₁ vanishes. The bar/singular comparison transfers H₂=0 to X_A.
3. Apply upstream absolute Hurewicz in degree two to obtain π₂=0, then in degree three to obtain the displayed isomorphism. Its naturality comes from the upstream Hurewicz transformation; no new general Hurewicz theorem is planned here.

**Acceptance.**

- Reject applying degree-three Hurewicz to BGL(A)⁺ merely because it is an H-space.
- When St(A) is trivial all positive homotopy and homology groups in the comparison vanish.

**Imports.** [`K3BlochGroups:V.1/steinberg-superperfect`](#v-1-steinberg-superperfect), [`K3BlochGroups:V.1/bst-plus`](#v-1-bst-plus), [`StableHomotopyKTheory:H.1/homology-of-small-categories`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.3/plus-construction-by-cell-attachment`](../packets/StableHomotopyKTheory.json), [`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`](../../../content/tau-ceti/AlgebraicTopology/README.md#stage-8-relative-homotopy-hurewicz-and-whitehead).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, Exercise 1.9, IV.14–15.

<a id="v-1-cover-and-fibre-interface"></a>

### V.1.13: The connected-cover comparison and its supplier boundary

`K3BlochGroups:V.1/cover-and-fibre-interface` · comparison

For each ring A the canonical map q_A:BSt(A)⁺→BGL(A)⁺, induced by St(A)→E(A)→GL(A), factors through the simply connected cover Y_A of BGL(A)⁺. Under the imported relative-plus comparison there is a homotopy fibration BK₂(A)→BSt(A)⁺→BE(A)⁺, and BE(A)⁺≃Y_A under BE(A). Thus q_A induces π_n isomorphisms for n≥3 and exhibits BSt(A)⁺ as a two-connected cover of the base component of K(A). Chosen space representatives commute with ring maps up to based homotopy; induced homotopy-group maps commute exactly.

**Hypotheses.** A is associative and unital. Use the central kernel K₂(A) of the stable UCE, not an unstable Steinberg kernel. The generic relative-plus/fibre assertions are supplier outputs, including their source gaps.

**Construction and proof.**

1. Import the generic BP⁺ universal-cover and UCE-fibration assertions from H.3/plus-pi2-universal-central-extension; specialize P=E(A), G=GL(A), S=St(A), kernel=K₂(A).
2. Use the homotopy-fibre LES and BK₂(A)=K(K₂(A),1) to get π_n(BSt⁺)→π_n(BE⁺) isomorphisms for n≥3; in degree two the fibre is not contractible.
3. Use covering invariance in degrees n≥2 to compare BE⁺ with BGL⁺, and two-connected-hurewicz-input for the source.
4. Specify the composite under BSt and the based homotopy naturality, rather than declaring chosen plus spaces strictly equal.

**Acceptance.**

- The n=2 analogue for BSt⁺→BGL⁺ would force K₂(A)=0 and is not asserted.
- The map is the one induced by the UCE, not an arbitrary homotopy equivalence of spaces.

**Imports.** [`K3BlochGroups:V.1/bst-plus`](#v-1-bst-plus), [`K3BlochGroups:V.1/uce-plus-fibration`](#v-1-uce-plus-fibration), [`K3BlochGroups:V.1/two-connected-hurewicz-input`](#v-1-two-connected-hurewicz-input), [`K2SymbolsBrauer:T.1/steinberg-is-uce`](../packets/K2SymbolsBrauer--T.1.json), [`StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.1/nerve-and-classifying-space`](../packets/StableHomotopyKTheory.json), [`tauceti:TauCetiRoadmap/UniversalCovers#stage-3-higher-homotopy`](../../../content/tau-ceti/UniversalCovers/README.md#stage-3-higher-homotopy), [`GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`](../packets/GeneralAlgebraicKTheory--K.1.json).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, Exercises 1.8–1.9, IV.14–15.

<a id="v-1-canonical-comparison-interface"></a>

### V.1.14: The canonical homological K₃ comparison

`K3BlochGroups:V.1/canonical-comparison-interface` · construction

For every associative unital ring A, refine the parent comparison to the canonical additive isomorphism c_A:K₃(A)≅H₃(St(A);ℤ). If q₃:π₃(BSt⁺)≅K₃(A), h₃:π₃(BSt⁺)≅H₃(BSt⁺), j₃:H₃(BSt)≅H₃(BSt⁺) and b₃:H₃(BSt)≅H₃(St(A);ℤ) are the specified supplier maps, define c_A=b₃∘j₃⁻¹∘h₃∘q₃⁻¹. All homology uses trivial integral coefficients. An additive isomorphism is automatically ℤ-linear.

**Hypotheses.** A is associative and unital; K₃ is the imported plus/Q K-theory group. Maps q₃, h₃, j₃ and b₃ are the canonical maps indicated, with the agreed basepoints and orientations.

**Construction and proof.**

1. Use cover-and-fibre-interface to obtain q₃ and two-connected-hurewicz-input to obtain h₃.
2. Import the plus homology isomorphism j₃ and the bar/singular comparison b₃; its unnormalised Mathlib convention requires the natural normalisation bridge requested from H.1.
3. Compose the four additive isomorphisms in the stated directions; independent model choices produce the same homomorphism under the canonical comparison of models.
4. The composite is the refinement of the parent k3-h3-steinberg node, not a second definition of Quillen K₃.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `K3Homological.comparison` | constructor | Given the four canonical isomorphisms, form c_A in the specified order. |
| `K3Homological.comparison_apply` | characterisation | c_A(x)=b₃(j₃⁻¹(h₃(q₃⁻¹(x)))). |
| `K3Homological.comparison_symm_apply` | characterisation | c_A⁻¹(z)=q₃(h₃⁻¹(j₃(b₃⁻¹(z)))). |
| `K3Homological.comparison_zero` | simp | c_A(0)=0. |
| `K3Homological.comparison_add` | structure | c_A(x+y)=c_A(x)+c_A(y), hence c_A is ℤ-linear. |

**Unit tests.**

- `comparison_identity_data` (compatibility): If all four groups agree and all four imported isomorphisms are identities, c_A is the identity.
- `comparison_trivial_group` (degenerate): For a subsingleton Steinberg group G and any genuine c:K≅H₃(G;ℤ), K is subsingleton.
- `comparison_detects_nonzero` (characterisation): For each x, c_A(x)=0 if and only if x=0; the constant-zero map fails this for every nonzero x.

**Uses.**

- K3BlochGroups V.1 bar-cycle-model; V.4 Suslin comparison: Turn a homology class of the stable Steinberg group into its canonical Quillen K₃ element..
- K-book IV.1.9 and Corollary 1.20: Fix the exact natural comparison, including the map to H₃(E(A))..

**Acceptance.**

- Changing a chosen based plus model transports c_A through its canonical homotopy comparison.
- The forward map starts with q₃ inverse; reversing j₃ would be ill-typed.

**Imports.** [`K3BlochGroups:V.1/k3-h3-steinberg`](#v-1-k3-h3-steinberg), [`K3BlochGroups:V.1/two-connected-hurewicz-input`](#v-1-two-connected-hurewicz-input), [`K3BlochGroups:V.1/cover-and-fibre-interface`](#v-1-cover-and-fibre-interface), [`StableHomotopyKTheory:H.1/homology-of-small-categories`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.3/acyclic-map-homology-criterion`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`](../packets/GeneralAlgebraicKTheory--K.1.json).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, Exercise 1.9, IV.14–15.

<a id="v-1-cycle-certificate-evaluator"></a>

### V.1.15: K₃ evaluation with explicit bar-boundary certificates

`K3BlochGroups:V.1/cycle-certificate-evaluator` · construction

For the existing unnormalised integral bar complex C_*(St(A)), let Z₃ be Mathlib’s cycles object and β:C₄→Z₃ its toCycles map. Refine the parent evaluation to the additive map ev_A:Z₃→K₃(A), ev_A(z)=c_A⁻¹(π(z)). It is surjective and ev_A(z)=ev_A(z′) if and only if there is a finitely supported w∈C₄ with β(w)=z−z′. The underlying chain condition is d₃z=0; no map C₃→K₃ is asserted on arbitrary chains.

**Hypotheses.** A is associative and unital; use the canonical comparison c_A. C_n consists of finitely supported integer combinations of Fin n-tuples. Identity entries are retained.

**Construction and proof.**

1. Use the existing cycles and homology projection from Mathlib, then compose with c_A inverse.
2. Identify the kernel of π with the image of β, using homology as cycles modulo boundaries in ModuleCat ℤ. This gives an explicit finite chain witness for equality, including both directions.
3. Use groupHomology_induction_on for surjectivity. The cycle and boundary objects, their differentials, and tuplewise chain maps are baseline constructions.
4. For trivial coefficients d₃[g|h|k]=[h|k]−[gh|k]+[g|hk]−[g|h]; d₄[g|h|k|l]=[h|k|l]−[gh|k|l]+[g|hk|l]−[g|h|kl]+[g|h|k]. In particular d₄[1|1|1|1]=[1|1|1].

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `K3Homological.eval3` | constructor | Compose π:Z₃→H₃(St(A)) with c_A inverse, as an additive map. |
| `K3Homological.eval3_comparison` | compatibility | c_A(ev_A(z))=π(z), with the exact pinned groupHomology.π. |
| `K3Homological.eval3_zero` | simp | ev_A(0)=0. |
| `K3Homological.eval3_add` | simp | ev_A(z+z′)=ev_A(z)+ev_A(z′). |
| `K3Homological.eval3_zsmul` | structure | ev_A(mz)=m ev_A(z) for each integer m. |
| `K3Homological.eval3_boundary` | relation | ev_A(β(w))=0 for each 4-chain w. |
| `K3Homological.eval3_eq_iff_certificate` | characterisation | ev_A(z)=ev_A(z′) iff ∃w:C₄, β(w)=z−z′. |
| `K3Homological.eval3_surjective` | universal-property | Every element of K₃(A) is ev_A(z) for some cycle z. |

**Unit tests.**

- `eval3_identity_triple` (computation): The nonzero chain [1|1|1] is a cycle and has evaluation zero, with witness [1|1|1|1].
- `eval3_zero_cycle` (degenerate): The zero cycle evaluates to zero.
- `eval3_baseline_projection` (compatibility): After c_A, evaluation agrees exactly with the pinned groupHomology.π on every cycle.
- `eval3_not_injective` (non-example): Evaluation on cycles is not injective: [1|1|1] and zero are distinct cycles with equal values, even for the trivial group.
- `single_g_one_one_not_cycle` (non-example): For g≠1 the differential of [g|1|1] is nonzero; the constructor cannot silently treat every 3-chain as a cycle.

**Uses.**

- K3BlochGroups V.4 configuration and comparison maps: Use explicit representatives and check equality by finite boundary certificates..
- K3BlochGroups V.5/V.6 concrete classes: Transport a proved integral cycle to K₃ with no rationalisation or omitted torsion..

**Acceptance.**

- Given z,z′, the equality interface returns an actual 4-chain certificate, not just membership in an unspecified relation.
- A single [g|1|1] with g≠1 has d₃=[1|1]−[g|1]≠0 and is not as a cycle.

**Imports.** [`K3BlochGroups:V.1/bar-cycle-model`](#v-1-bar-cycle-model), [`K3BlochGroups:V.1/canonical-comparison-interface`](#v-1-canonical-comparison-interface), [`mathlib:groupHomology.inhomogeneousChains`](#baseline-mathlib-grouphomology-inhomogeneouschains), [`mathlib:groupHomology.inhomogeneousChains.d_single`](#baseline-mathlib-grouphomology-inhomogeneouschains-d-single), [`mathlib:groupHomology.cycles`](#baseline-mathlib-grouphomology-cycles), [`mathlib:groupHomology.cyclesMk`](#baseline-mathlib-grouphomology-cyclesmk), [`mathlib:groupHomology.iCycles`](#baseline-mathlib-grouphomology-icycles), [`mathlib:groupHomology.toCycles`](#baseline-mathlib-grouphomology-tocycles), [`mathlib:groupHomology`](#baseline-mathlib-grouphomology), [`mathlib:groupHomology.π`](#baseline-mathlib-grouphomology--u3c0), [`mathlib:groupHomology_induction_on`](#baseline-mathlib-grouphomology-induction-on).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, Exercise 1.9 and Definition 1.1, IV.2,14–15.

<a id="v-1-ring-map-comparison-square"></a>

### V.1.16: Naturality on classes and cycle certificates

`K3BlochGroups:V.1/ring-map-comparison-square` · theorem

For a unital ring map f:A→B let s_f:St(A)→St(B), K₃(f):K₃(A)→K₃(B), Z₃(f) and H₃(s_f) be the canonical maps. Then c_B∘K₃(f)=H₃(s_f)∘c_A and K₃(f)(ev_A(z))=ev_B(Z₃(f)z). If β_A(w)=z−z′, tuplewise chainsMap sends w to a certificate β_B(C₄(f)w)=Z₃(f)z−Z₃(f)z′. Identity and composition laws are strict on chains, cycles and groups; the space-level comparison uses based homotopies.

**Hypotheses.** A and B associative unital rings; f preserves the unit. All coefficient maps are the identity of ℤ with trivial actions.

**Construction and proof.**

1. Refine the parent k3-naturality square using naturality of UCE/group maps, the relative-plus maps, Hurewicz, and the natural bar/singular comparison requested from H.1.
2. Invert the canonical isomorphism squares to prove the first identity, then apply the pinned π_map to prove the evaluator identity.
3. The chain map commutes with the differential and toCycles; apply it to the certificate equation.
4. Use the pinned map_id and map_comp, together with ring-functor laws; retain based homotopy naturality of chosen plus maps rather than claiming strict functoriality of chosen spaces.

**Acceptance.**

- Test the identity ring map and a composite of two unital maps.
- Tuplewise image of the all-identity 4-chain still certifies vanishing of the all-identity 3-cycle.
- No commutativity or injectivity hypothesis is imposed on f.

**Imports.** [`K3BlochGroups:V.1/k3-naturality`](#v-1-k3-naturality), [`K3BlochGroups:V.1/canonical-comparison-interface`](#v-1-canonical-comparison-interface), [`K3BlochGroups:V.1/cycle-certificate-evaluator`](#v-1-cycle-certificate-evaluator), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json), [`mathlib:groupHomology.chainsMap`](#baseline-mathlib-grouphomology-chainsmap), [`mathlib:groupHomology.chainsMap_f_single`](#baseline-mathlib-grouphomology-chainsmap-f-single), [`mathlib:groupHomology.cyclesMap`](#baseline-mathlib-grouphomology-cyclesmap), [`mathlib:groupHomology.map`](#baseline-mathlib-grouphomology-map), [`mathlib:groupHomology.π_map`](#baseline-mathlib-grouphomology--u3c0--map), [`mathlib:groupHomology.map_id`](#baseline-mathlib-grouphomology-map-id), [`mathlib:groupHomology.map_comp`](#baseline-mathlib-grouphomology-map-comp).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, Functoriality 1.1.2, IV.3.

<a id="v-1-finite-stage-cycle-certificates"></a>

### V.1.17: Finite-stage representatives and eventual boundary witnesses

`K3BlochGroups:V.1/finite-stage-cycle-certificates` · theorem

For any ring A and the directed tower St_n(A) defining St(A), every x∈K₃(A) has a representative cycle z_n∈Z₃(St_n(A);ℤ) at some finite rank n. If two finite-stage cycles have the same value in K₃(A), there is a common later rank m and a 4-chain w_m with d₄w_m equal to the difference of their stabilised underlying chains. Conversely any such witness proves equality. Neither injectivity of St_n→St(A) nor a uniform stable range is assumed.

**Hypotheses.** A associative unital; use the imported colimit tower and its universal maps. Finite stages need not be superperfect, and are not assigned K₃(A) by a finite-rank Hurewicz theorem.

**Construction and proof.**

1. Reuse parent steinberg-homology-colimit for surjectivity on homology; compose with c_A inverse to get representatives at some rank.
2. For an explicit stable chain, finitely many tuple entries lift to a common rank. Its differential may only become zero after enlarging the rank: lift the finitely many relations asserting d₃z=0 to that later rank.
3. For equality, lift the stable finite boundary witness from cycle-certificate-evaluator and the finite equality of its differential with the difference of cycles to a common later rank.
4. Use chainsMap for all stabilization maps. Retain existential ranks and eventual witnesses; no homological-stability theorem or injectivity assumption is inserted.

**Acceptance.**

- The certificate is produced at a common later rank, not necessarily the rank where its entries were first lifted.
- For x=0 take the zero cycle; the all-identity 4-chain gives a second vanishing witness at every rank.
- Do not assert a fixed bound on n for arbitrary rings.

**Imports.** [`K3BlochGroups:V.1/steinberg-homology-colimit`](#v-1-steinberg-homology-colimit), [`K3BlochGroups:V.1/cycle-certificate-evaluator`](#v-1-cycle-certificate-evaluator), [`K2SymbolsBrauer:T.1/stabilisation`](../packets/K2SymbolsBrauer--T.1.json), [`mathlib:groupHomology.chainsMap`](#baseline-mathlib-grouphomology-chainsmap), [`mathlib:groupHomology.inhomogeneousChains`](#baseline-mathlib-grouphomology-inhomogeneouschains), [`mathlib:groupHomology.toCycles`](#baseline-mathlib-grouphomology-tocycles).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, stable GL convention, IV.2; Exercise 1.9, IV.15.

<a id="v-1-elementary-cover-hspace"></a>

### V.1.18: The H-space on the elementary plus cover

`K3BlochGroups:V.1/elementary-cover-hspace` · application

Let X_A be a well-pointed CW-type model of BGL(A)⁺ with the block-sum H-space structure of K.2:plus, and p_A:Y_A→X_A a based simply connected covering model, Y_A locally path connected, p_A(y₀)=e_X. Lift μ_X∘(p_A×p_A) uniquely through p_A with value y₀ at (y₀,y₀). This multiplication, y₀, and lifted unit homotopies give Mathlib’s HSpace Y_A. Its multiplication projects exactly to μ_X; under the imported BE(A)⁺≃Y_A it supplies the H-space needed in the parent η-Hurewicz argument.

**Hypotheses.** A associative unital; p_A is an actual covering map of the chosen CW-type K-space model. Y_A is simply connected and locally path connected, with chosen y₀ over the H-space unit. The block-sum H-space has based unit homotopies, as in the pinned HSpace carrier.

**Construction and proof.**

1. Import the cover and BE⁺ comparison from the finer H.3 node and the block-sum H-space from K.2:plus. No new universal-cover object or HSpace carrier is introduced.
2. Apply the general H-space lifting application requested from upstream UniversalCovers stage 2: lift multiplication from Y_A×Y_A, prescribe its value at (y₀,y₀), and use the existing unique lifting theorem.
3. Use that supplier’s relative homotopy-lift compatibility to obtain based unit homotopies. The requested generic construction supplies every field of the existing HSpace carrier; V.1 imports it and records this ring application only.
4. The application is ring-specific. The general covering/lifting and homotopy-lifting statements remain in upstream UniversalCovers; the requested block-sum naturality gives the needed H-map on covers.

**Acceptance.**

- The universal cover is equipped with a genuine continuous multiplication and based unit homotopies.
- A homotopy equivalence BE⁺≃Y_A is used for transport; it is not identified with an actual covering projection.

**Imports.** [`K3BlochGroups:V.1/cover-and-fibre-interface`](#v-1-cover-and-fibre-interface), [`StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension`](../packets/StableHomotopyKTheory.json), [`GeneralAlgebraicKTheory:K.2:plus`](../packets/GeneralAlgebraicKTheory--K.1.json), [`tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`](../../../content/tau-ceti/UniversalCovers/README.md#stage-2-lifting-criterion-and-galois-correspondence), [`mathlib:HSpace`](#baseline-mathlib-hspace), [`mathlib:IsCoveringMap.existsUnique_continuousMap_lifts`](#baseline-mathlib-iscoveringmap-existsunique-continuousmap-lifts), [`mathlib:IsCoveringMap.liftHomotopyRel`](#baseline-mathlib-iscoveringmap-lifthomotopyrel).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, Exercise 1.11 and Corollary 1.20, IV.14–15.

<a id="v-1-hspace-hopf-kernel-refinement"></a>

### V.1.19: Suslin’s degree-three Hurewicz kernel

`K3BlochGroups:V.1/hspace-hopf-kernel-refinement` · theorem

For a based simply connected well-pointed CW-type H-space X, composition with the based Hopf generator η:S³→S² gives an additive map η_X:π₂(X)→π₃(X), and π₂(X)→π₃(X)→H₃(X;ℤ)→0 is exact. In particular H₃(X)≅π₃(X)/im(η_X), naturally for based H-maps. The proof uses the elementary degree-three wedge calculation and a relative-Hurewicz consequence with H₃(Y)=0; it does not use Exercise IV.1.25 as printed.

**Hypotheses.** X simply connected and of well-pointed CW homotopy type. HSpace X is the existing carrier, with based unit homotopies. The generic Hopf generator, wedge calculation, Whitehead products, their naturality and H-space vanishing require the proposed foundational extension recorded as gap G1.

**Construction and proof.**

1. Choose a wedge Y=∨_I S² and a based map f:Y→X surjective on π₂; for example choose one sphere representative for each element of π₂(X). The CW wedge has H₃(Y)=0.
2. Apply the upstream pair LES and relative Hurewicz to the mapping-cylinder pair (M_f,Y), which is two-connected: X,Y simply connected and π₂(f) surjective. Compare with the homology LES, using H₃(Y)=0 and π₂(Y)≅H₂(Y), to obtain exact π₃(Y)→π₃(X)→H₃(X)→0.
3. Use Hatcher Example 4.52: π₃(Y) is freely generated by the Hopf maps on each sphere and by the Whitehead products of distinct sphere inclusions, with unordered indexing i<j. Infinite wedges use finite-subcomplex factorization of both maps and homotopies. This only needs the degree-three calculation, not the full Hilton–Milnor theorem.
4. In an H-space every Whitehead product vanishes: multiplication extends the wedge of two based maps to the product, after correcting wedge restrictions by the based unit homotopies and the CW homotopy extension property.
5. Only Hopf composites remain in the image of π₃(Y). The same vanishing kills the Hopf composition addition cross-term, so η_X is additive; the image equals the Hurewicz kernel. Record the additional H₃(Y)=0 condition absent from printed Exercise 1.25 as source issue E31.

**Acceptance.**

- For K(ℤ,2), η_X is zero and H₃(X)=π₃(X)=0.
- Simply connected alone does not make η_X additive: in S² the degree-k map composes with η with coefficient k². Thus the H-space hypothesis cannot be dropped.
- The counterexample point→S³→S³ to printed IV.1.25 has nonzero H₃(Y) and cannot enter the corrected relative-Hurewicz step.

**Imports.** [`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`](../../../content/tau-ceti/AlgebraicTopology/README.md#stage-8-relative-homotopy-hurewicz-and-whitehead), [`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`](../../../content/tau-ceti/AlgebraicTopology/README.md#stage-4-cw-pairs-cellular-homology-and-cofibrations), [`mathlib:HSpace`](#baseline-mathlib-hspace).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, Lemma 1.19 and Remark 1.19.1, IV.13; [Hatcher-AT-author](#source-1-hatcher-at-author) — Section 4.2, Examples 4.51–4.52, printed pp.380–381; Exercise 37, p.392.

<a id="v-1-hopf-minus-one-product-refinement"></a>

### V.1.20: The Hopf operation is multiplication by minus one

`K3BlochGroups:V.1/hopf-minus-one-product-refinement` · comparison

For every associative unital ring A, transport π₂(Y_A) and π₃(Y_A) to K₂(A) and K₃(A) through its covering projection and the imported plus model. Then the Hopf composition operation equals α↦α·[−1], the external pairing K₂(A)×K₁(ℤ)→K₃(A⊗ℤ)≅K₃(A). Under the canonical sphere-unit map π₁ˢ→K₁(ℤ), stable η maps to the unit class [−1]. No internal tensor product of two arbitrary A-modules, or commutativity of A, is required.

**Hypotheses.** A associative unital; use the external tensor product over ℤ and the standard unit A⊗ℤ≅A. The Hopf map and stable η are the same class under stabilization, with the sphere-unit action and K-product conventions fixed. The missing stable-unit/Barratt–Priddy–Quillen compatibility is assigned to the foundational extension in gap G2.

**Construction and proof.**

1. Import the external K-theory pairing from K.7/biexact-pairings-and-products; request its associative-ring specialization and compatible plus/spectrum models rather than constructing products here.
2. In the multiplicative finite-set/BΣ∞⁺ sphere model, the stable η is represented in π₁ by an odd transposition. Its permutation matrix has determinant −1, so its image in K₁(ℤ) is [−1]. The BPQ identification and compatibility with the sphere unit belong to the proposed H extension, not to V.1.
3. For a spectrum represented by its K-theory infinite-loop space, precomposition α∘β agrees with the right action of the stabilized sphere class [β]. Specialize n=2, β=η and transport through the cover. This compatibility, not merely an isomorphism of abstract groups, is the content required from IV.1.12(e).
4. Conclude the two operations agree on each α. The degree-two sign is even, so reversing the scalar side introduces no sign; keep the stated right-scalar convention.

**Acceptance.**

- The degree-one permutation class is sent to [−1] via its determinant, not to the additive integer −1 in a higher K-group.
- In characteristic two, factor the external ℤ-scalar pairing through the central prime field 𝔽₂. The image of [-1] in K₁(𝔽₂) is [1]=0, so bilinearity makes the operation zero; no internal K-product on a noncommutative A is assumed.
- For a noncommutative A use A×ℤ external coefficients, rather than assuming A has a commutative-ring K-product.

**Imports.** [`K3BlochGroups:V.1/elementary-cover-hspace`](#v-1-elementary-cover-hspace), [`K3BlochGroups:V.1/hspace-hopf-kernel-refinement`](#v-1-hspace-hopf-kernel-refinement), [`GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`](../../../content/campaign/GeneralAlgebraicKTheory/README.md), [`StableHomotopyKTheory:H.5:spectra`](../packets/StableHomotopyKTheory.json), [`GeneralAlgebraicKTheory:K.7`](../packets/GeneralAlgebraicKTheory--K.6.json).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, Exercise 1.12(a),(e), IV.15; IV.4, Theorem 4.9.3, IV.43.

<a id="v-1-elementary-homology-exact-sequence-refinement"></a>

### V.1.21: The degree-three elementary homology quotient

`K3BlochGroups:V.1/elementary-homology-exact-sequence-refinement` · theorem

For every associative unital ring A define h_A:K₃(A)→H₃(E(A);ℤ) by h_A=H₃(St(A)→E(A))∘c_A. Then K₂(A) --(α↦α·[−1])→ K₃(A) --h_A→ H₃(E(A);ℤ)→0 is exact and natural for unital ring maps. Equivalently c_A⁻¹ identifies the kernel of H₃(St(A))→H₃(E(A)) with the image of the minus-one product. This is a quotient of K₃, not an isomorphism K₃(A)≅H₃(E(A)).

**Hypotheses.** A associative unital; trivial integral homology and the right K₁(ℤ)-scalar convention. Use all canonical comparison maps and the covering H-space structure, rather than arbitrary abstract group isomorphisms.

**Construction and proof.**

1. Apply hspace-hopf-kernel-refinement to Y_A and identify its π₂,π₃ with K₂(A),K₃(A) using the cover and K.2:plus; identify H₃(Y_A) with H₃(E(A)) using BE⁺ and its plus homology comparison.
2. Use hopf-minus-one-product-refinement to identify the kernel-generating operation.
3. Check the displayed Hurewicz map is H₃(St→E)∘c_A by the naturality square of Hurewicz with BSt⁺→BE⁺, the two plus maps and the two bar/singular comparisons. This is why the direction and naturality of c_A are part of the construction.
4. Transport exactness and naturality across the comparisons. In characteristic two, ℤ→A factors through its central prime field 𝔽₂. External-product naturality identifies the ℤ-scalar action with the 𝔽₂ pairing, using A⊗𝔽₂≅A; [-1] maps to [1]=0 in K₁(𝔽₂), so the first map vanishes and h_A is an isomorphism. In general only the quotient assertion is made.

**Acceptance.**

- For A of characteristic two, the first map is zero and h_A is an isomorphism.
- The map from a bar cycle z to H₃(E(A)) is π_E(Z₃(St→E)z), directly compatible with cycle-certificate-evaluator.
- Keep the [-1] product distinct from V.2’s full Milnor-image quotient defining K₃^ind.

**Imports.** [`K3BlochGroups:V.1/k2-to-k3-h3-e`](#v-1-k2-to-k3-h3-e), [`K3BlochGroups:V.1/hspace-hopf-kernel-refinement`](#v-1-hspace-hopf-kernel-refinement), [`K3BlochGroups:V.1/hopf-minus-one-product-refinement`](#v-1-hopf-minus-one-product-refinement), [`K3BlochGroups:V.1/canonical-comparison-interface`](#v-1-canonical-comparison-interface), [`K3BlochGroups:V.1/ring-map-comparison-square`](#v-1-ring-map-comparison-square), [`K2SymbolsBrauer:T.1:plus`](../packets/K2SymbolsBrauer--T.1.json), [`StableHomotopyKTheory:H.1/homology-of-small-categories`](../packets/StableHomotopyKTheory.json), [`GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`](../../../content/campaign/GeneralAlgebraicKTheory/README.md), [`K3BlochGroups:V.1/elementary-cover-hspace`](#v-1-elementary-cover-hspace).

**Sources.** [Kbook-IV-author](#source-1-kbook-iv-author) — IV.1, Corollary 1.20, IV.13–14.

### V.1 closure requirements

**Shared low-degree Hopf and Whitehead package has no explicit owner node.** Neither exact pin has a Hopf-generator/Whitehead-product/wedge-π₃ library package; all relevant atlas stage descriptions and supplier nodes were screened. AT stage 8 supplies relative Hurewicz, not the sphere computation. The missing shared output is π₃(S²)=ℤ·η, π₃(∨_I S²) freely generated by individual Hopf classes and unordered Whitehead pairs, naturality, and vanishing/additivity in based H-spaces. Hatcher 4.51–4.52 and Exercise 37 give the elementary proof route read here. Propose the foundational Part II extension described below, without introducing generic topology nodes in V.1. The full Hilton–Milnor theorem is unnecessary for this target.

Consumers: [`K3BlochGroups:V.1/hspace-hopf-kernel-refinement`](#v-1-hspace-hopf-kernel-refinement), [`K3BlochGroups:V.1/hopf-minus-one-product-refinement`](#v-1-hopf-minus-one-product-refinement).

**Shared stable sphere-unit and minus-one action compatibility.** No explicit atlas stage or node names multiplicative BPQ or the stable-η/transposition identification, and H.5:spectra’s carrier alone does not prove IV.1.12(a),(e). Needed: a compatible sphere-unit/finite-set model, π₁ˢ=ℤ/2 with η its transposition, its image [-1] under permutation matrices, and α∘β=α·[β] for the K-spectrum action. IV.4.9.3 cites the BPQ proof rather than providing it; that cited proof was not acquired. Route once to the H foundational extension, shared with parent V.4’s BPQ/stem needs. Do not certify the operation equality from a bare abstract isomorphism of groups.

Consumers: [`K3BlochGroups:V.1/hopf-minus-one-product-refinement`](#v-1-hopf-minus-one-product-refinement), [`K3BlochGroups:V.1/elementary-homology-exact-sequence-refinement`](#v-1-elementary-homology-exact-sequence-refinement).

**Transitive supplier proof boundaries remain visible.** The StableHomotopyKTheory decomposition’s plus-pi2-universal-central-extension node includes IV.1.8/1.9 with hints rather than complete proofs; its generic plus acyclicity/universal-property sources and relative construction remain open there. Import that node and request its naturality interface; do not mark those supplier proofs closed or replan them in V.1. The exact AT and UniversalCovers stage IDs identify the topological suppliers.

Consumers: [`K3BlochGroups:V.1/cover-and-fibre-interface`](#v-1-cover-and-fibre-interface), [`K3BlochGroups:V.1/canonical-comparison-interface`](#v-1-canonical-comparison-interface), [`K3BlochGroups:V.1/ring-map-comparison-square`](#v-1-ring-map-comparison-square).

<a id="v2"></a>

## V.2: Milnor classes and indecomposable K₃

Define the degree-three Milnor-to-Quillen map by the imported graded product,
and take the actual quotient by its range. Exactness and quotient naturality
do not require injectivity of that map. The integral injectivity theorem is a
separate target for every field: first bound the kernel by two using the
motivic Chern product rule; use Izhboldin in characteristic two, and the
weight-two motivic-to-étale degree-zero comparison plus algebraically closed
divisibility otherwise. The diagonal norm-residue theorem alone does not
identify H⁰(F,ℤ/2(2)).

For number fields import the Bass–Tate sign isomorphism. Its coordinate
vectors give distinct real-place generators, represented by {-1,-1,u_v}
with isolated signs. Compare these with the −1 product from V.1 to identify
the decomposable subgroup and stable SL homology quotient. A totally imaginary
field has r₁=0, so the Milnor contribution is zero. Borel supplies the rational
rank r₂. The motivic edge map to H¹(F,ℤ(2)) must carry its integral mod-two
obstruction and normalization, rather than be inferred from equal ranks.

**Planets.** [Indecomposable K₃](#v-2-k3-indecomposable); [Borel rank of K3](#v-2-k3-rank-borel); [Injectivity of Milnor K3](#v-2-milnor-k3-injective); [Real-place basis of Milnor K₃](#v-2-real-place-basis); [Product with −1](#v-2-minus-one-product-surjective); [Stable Hurewicz quotient](#v-2-number-field-stable-hurewicz-equivalence).

<a id="v-2-milnor-to-quillen-degree-three"></a>

### V.2.1: The degree-three part of the graded Milnor-to-Quillen map

`K3BlochGroups:V.2/milnor-to-quillen-degree-three` · construction

Specialise the graded ring map K^M_*(F) -> K_*(F) imported from K2SymbolsBrauer T.2:graded-map to degree three, obtaining a homomorphism K_3^M(F) -> K_3(F) determined by the product of three units. Nothing about this map is asserted in degrees other than three, and its degree-two case, an isomorphism by Matsumoto's theorem, is not a model for degree three.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Import the graded ring map K^M_*(F) → K_*(F) constructed from products (K2SymbolsBrauer T.2:graded-map).
2. Take its degree-three component and record that it sends the Milnor symbol {a,b,c} to the product [a]·[b]·[c] of the classes in K_1(F), in this order.
3. Well-definedness on the Steinberg quotient and multiplicativity are supplied by T.2:graded-map; nothing is reproved here.
4. Record that the degree-three map is not asserted to be an isomorphism; injectivity is V.2/milnor-k3-injective and surjectivity is false for most fields.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `milnorToQuillen3` | constructor | The homomorphism K_3^M(F) → K_3(F). |
| `milnorToQuillen3_symbol` | characterisation | It sends the Milnor symbol {a,b,c} to the product [a]·[b]·[c] of K_1 classes, in this order. |
| `milnorToQuillen3_symbol_eq_mul` | relation | milnorToQuillen3 {a,b,c} = [a]·m({b,c}) under the product K_1(F) ⊗ K_2(F) → K_3(F), where m is Matsumoto's isomorphism K_2^M(F) ≅ K_2(F). |
| `milnorToQuillen3_map` | functoriality | It is natural in the field for every field homomorphism. |
| `milnorToQuillen3_map_id` | functoriality | The naturality square for the identity of F is the identity. |
| `milnorToQuillen3_map_comp` | functoriality | The naturality squares compose along composites of field homomorphisms. |
| `milnorToQuillen3_graded` | compatibility | It is the degree-three component of the imported graded ring map. |

**Unit tests.**

- `finite_field_source_zero` (degenerate): For a finite field the source vanishes, so the map is zero.
- `symbol_of_minus_ones` (computation): For F = Q the symbol {−1,−1,−1} has nonzero image, of order two.
- `natural_in_F` (compatibility): For Q inside R the square with the induced maps commutes.
- `not_surjective` (non-example): For a number field with r_2 > 0 the map is not surjective, since the target has positive rank and the source is torsion.
- `symbol_eq_triple_product` (characterisation): For units a, b, c of F, milnorToQuillen3 {a,b,c} = [a]·[b]·[c] in K_3(F), with the product taken in this order.

**Uses.**

- V.2's definition of the indecomposable quotient: the quotient is formed by the cokernel of exactly this map.
- V.5's bookkeeping for Q: the decomposable class of order two in K_3(Q) is the image of the Milnor symbol with three -1 entries.
- V.4's Suslin sequence: the sequence is stated for the indecomposable quotient, so its construction depends on this map.

**Acceptance.**

- The symbol {a, 1−a, b} maps to 0 for a ≠ 0, 1, and {a, a, b} maps to the image of {−1, a, b}.
- For a finite field the source is zero in degree three (K-book III.7.2(a)), so the map is zero; the target is not.
- For F = Q the image is the subgroup of order two identified in V.5.

**Imports.** [`K2SymbolsBrauer:T.2:graded-map`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json), [`GeneralAlgebraicKTheory:K.2:plus`](../packets/GeneralAlgebraicKTheory--K.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Example IV.1.10.1 (PDF p. 274); [Kbook.2013](#source-0-kbook-2013) — VI.5 opening (PDF p. 495).

<a id="v-2-k3-indecomposable"></a>

### V.2.2: The indecomposable K_3 of a field

`K3BlochGroups:V.2/k3-indecomposable` · definition

Define K_3^ind(F) as the cokernel of the degree-three Milnor-to-Quillen map, together with the quotient map K_3(F) -> K_3^ind(F). The decomposable part is by definition the image of that map; it is a subgroup of K_3(F) isomorphic to K_3^M(F) only once injectivity has been proved, which is a separate theorem.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Form the image of the degree-three map and the quotient of K_3(F) by it.
2. Prove that the quotient map is surjective with the stated kernel.
3. Prove functoriality in the field, which follows from the naturality of the degree-three map.
4. Keep the decomposable part as the image, and record separately that it is isomorphic to Milnor K_3 exactly when the degree-three map is injective.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `K3ind` | data | The abelian group K_3^ind(F). |
| `K3ind.mk` | constructor | The surjection K_3(F) → K_3^ind(F). |
| `K3ind.mk_surjective` | characterisation | K3ind.mk is surjective. |
| `K3ind.mk_eq_zero_iff` | characterisation | A class dies in the quotient exactly when it lies in the image of the degree-three map. |
| `K3ind.mk_milnorToQuillen3` | simp | K3ind.mk (milnorToQuillen3 x) = 0 for every x in K_3^M(F). |
| `K3ind.lift` | universal-property | A homomorphism f : K_3(F) → M with f ∘ milnorToQuillen3 = 0 descends to K3ind F → M. |
| `K3ind.lift_mk` | universal-property | K3ind.lift f (K3ind.mk x) = f x. |
| `K3ind.ext` | extensionality | Two homomorphisms out of K_3^ind(F) agree when their composites with the quotient map agree. |
| `K3ind.map` | functoriality | A field homomorphism induces a map of indecomposable quotients, compatibly with the quotient maps. |
| `K3ind.map_id` | functoriality | The map induced by the identity is the identity. |
| `K3ind.map_comp` | functoriality | The map induced by a composite is the composite of the induced maps. |
| `K3ind.map_mk` | simp | K3ind.map φ (K3ind.mk x) = K3ind.mk (K_3(φ) x). |
| `K3ind.equivQuotient` | compatibility | K3ind F is isomorphic to the quotient of K_3(F) by the range of milnorToQuillen3, as a Mathlib QuotientAddGroup. |
| `K3ind.decomposable` | structure | The decomposable subgroup, defined as the image, with its inclusion. |

**Unit tests.**

- `finite_field` (degenerate): For a finite field the quotient map is an isomorphism (K_3^M(F_q) = 0).
- `rational_numbers` (computation): For Q the quotient is cyclic of order 24 while K_3 is cyclic of order 48.
- `rank_r2` (computation): For a number field the quotient has free rank r_2.
- `not_torsion_quotient` (non-example): K_3(Q) modulo its torsion subgroup is 0, but K_3^ind(Q) ≅ Z/24: the indecomposable quotient is not the torsion-free quotient.

**Uses.**

- V.4's Suslin exact sequence: the middle term of the sequence is this group.
- V.5's number-field answers: the structure theorem is stated for this quotient before it is lifted to K_3.
- HabiroNumberFields HB.1: the integral convention consumed there is a statement about this quotient and the Bloch group.

**Acceptance.**

- The quotient is zero exactly when the degree-three map is onto.
- For a finite field the quotient map is an isomorphism, because the source of the degree-three map vanishes.
- For a number field the quotient has rank r_2, matching the rank of K_3.

**Imports.** [`K3BlochGroups:V.2/milnor-to-quillen-degree-three`](#v-2-milnor-to-quillen-degree-three).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5 opening (PDF p. 495).

<a id="v-2-decomposable-exactness"></a>

### V.2.3: Exactness and functoriality of the decomposable-indecomposable sequence

`K3BlochGroups:V.2/decomposable-exactness` · lemma

The sequence K_3^M(F) -> K_3(F) -> K_3^ind(F) -> 0 is exact and natural in F. Exactness on the left is not asserted here; it is the content of the injectivity theorem.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Exactness at the middle and the right is the definition of a cokernel.
2. Naturality follows from naturality of the degree-three map and the universal property of the cokernel.
3. State the missing left-exactness as a hypothesis to be supplied by the injectivity theorem, not as part of this lemma.

**Acceptance.**

- The sequence for a finite field reduces to 0 -> K_3(F_q) -> K_3^ind(F_q) -> 0.
- Naturality is checked on the inclusion of Q in a number field.

**Imports.** [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5 opening (PDF p. 495).

<a id="v-2-milnor-k3-number-field"></a>

### V.2.4: Milnor K_3 of a number field is elementary abelian of rank the number of real places

`K3BlochGroups:V.2/milnor-k3-number-field` · theorem

For a number field F with r_1 real places, the signature map K_3^M(F) → ⊕_{v real} K_3^M(F_v)_tors ≅ (Z/2)^{r_1}, sending {a,b,c} to −1 at v exactly when a, b and c are all negative at v (K-book III.7.2(c)), is an isomorphism. In particular K_3^M(F) is torsion, is detected at the real places, and vanishes exactly when F is totally imaginary.

**Hypotheses.** F is a number field; r_1 = NumberField.InfinitePlace.nrRealPlaces F.

**Construction and proof.**

1. Import the general real-signature isomorphism of T.2:symbols/milnor-number-field in degree three, retaining its Bass–Tate proof gap.
2. Specialize the number of real places and retain the existing Q versus Q(i) tests; the indecomposable quotient still uses the imported graded Milnor-to-Quillen map.

**Acceptance.**

- For F = Q the group is cyclic of order two, generated by the symbol with three -1 entries.
- For F = Q(i) the group is trivial.
- The rank is the number of real places, not the number of infinite places.

**Imports.** [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json), [`mathlib:NumberField.InfinitePlace.nrRealPlaces`](#baseline-mathlib-numberfield-infiniteplace-nrrealplaces), [`K2SymbolsBrauer:T.2:symbols/milnor-number-field`](../packets/K2SymbolsBrauer--T.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Example III.7.2(d) (PDF pp. 253–254); [Kbook.2013](#source-0-kbook-2013) — VI.5 before Corollary 5.3 (PDF p. 496).

<a id="v-2-k3-rank-borel"></a>

### V.2.5: The rank of K_3 of a number field is the number of complex places

`K3BlochGroups:V.2/k3-rank-borel` · theorem

For a number field F, K_3(F) is finitely generated and its free rank is r_2, the number of complex places. The same holds for the indecomposable quotient, since the kernel of the quotient map is torsion by the previous node.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Import the rank r_2 of K_3 of the ring of integers O_F from ArithmeticKTheory N.3:ranks, which applies Borel's theorem (BorelRegulators R.3; reserved node BorelRegulators:R.3/borel-rank-theorem) in degree three, where n = 3 ≡ 3 mod 4.
2. Import finite generation of K_3(O_F) (ArithmeticKTheory N.3:finite-generation).
3. Import the isomorphism K_3(O_F) ≅ K_3(F) (ArithmeticKTheory N.5, case j = 2).
4. The kernel of K_3(F) → K_3^ind(F) is the image of the torsion group K_3^M(F) (V.2/milnor-k3-number-field), so the quotient is finitely generated of the same rank.

**Acceptance.**

- For F = Q the rank is zero, consistent with K_3(Q) finite.
- For F = Q(i) the rank is one, consistent with the value recorded in V.5.
- The rank is r_2 and not r_1 + r_2, which is the answer in degree one modulo four; using the wrong row of the period-four pattern is the error this test catches.

**Imports.** [`ArithmeticKTheory:N.3:ranks`](../packets/ArithmeticKTheory--N.1.json), [`ArithmeticKTheory:N.3:finite-generation`](../packets/ArithmeticKTheory--N.1.json), [`ArithmeticKTheory:N.5`](../packets/ArithmeticKTheory--N.5.json), [`K3BlochGroups:V.2/milnor-k3-number-field`](#v-2-milnor-k3-number-field), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`mathlib:NumberField.InfinitePlace.nrComplexPlaces`](#baseline-mathlib-numberfield-infiniteplace-nrcomplexplaces).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5 before Corollary 5.3 (PDF p. 496).

<a id="v-2-rationalisation-loss"></a>

### V.2.6: What rationalisation destroys

`K3BlochGroups:V.2/rationalisation-loss` · comparison

For a number field F, the quotient map induces an isomorphism K_3(F) ⊗_Z Q ≅ K_3^ind(F) ⊗_Z Q of rational vector spaces of dimension r_2, and K_3^M(F) ⊗_Z Q = 0.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Tensor the right exact sequence K_3^M(F) → K_3(F) → K_3^ind(F) → 0 of V.2/decomposable-exactness with Q (right exactness, rTensor_exact); K_3^M(F) is torsion (V.2/milnor-k3-number-field), so its tensor product with Q vanishes.
2. Identify the dimension with r_2 by V.2/k3-rank-borel.
3. No injectivity is needed: the statement is rational.

**Acceptance.**

- For F = Q both sides are zero, so no integral information can be recovered from the comparison.
- For F = Q(i), K_3(F) ≅ Z ⊕ Z/24 but K_3(F) ⊗ Q ≅ Q: the torsion Z/w_2 is lost.
- What is lost integrally: the decomposable class (V.2), the enhanced torsion term of V.4 and the 2-primary convention difference of V.3 all vanish rationally, so agreement of two models after rationalisation is not evidence of integral agreement.

**Imports.** [`K3BlochGroups:V.2/decomposable-exactness`](#v-2-decomposable-exactness), [`K3BlochGroups:V.2/milnor-k3-number-field`](#v-2-milnor-k3-number-field), [`K3BlochGroups:V.2/k3-rank-borel`](#v-2-k3-rank-borel), [`mathlib:rTensor_exact`](#baseline-mathlib-rtensor-exact).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.3 (PDF p. 496).

<a id="v-2-k3-to-h3-sl-field"></a>

### V.2.7: K_3 of a field onto H_3 of the special linear group

`K3BlochGroups:V.2/k3-to-h3-sl-field` · theorem

For a field F, the Hurewicz map K_3(F) → H_3(SL(F), Z) is surjective, and its kernel is the image under milnorToQuillen3 of the subgroup {−1}·K_2^M(F) of K_3^M(F) generated by the symbols {−1, a, b}. Once V.2/milnor-k3-injective is available, the kernel is that subgroup itself.

**Hypotheses.** F is a field.

**Construction and proof.**

1. E(F) = SL(F), since SK_1(F) = 0 (KTheoryLowDegrees U.3).
2. Apply V.1/k2-to-k3-h3-e with R = F: the kernel is [−1]·K_2(F).
3. K_2(F) is generated by the symbols {a, b} (Matsumoto, K2SymbolsBrauer T.2:symbols), and [−1]·{a, b} = milnorToQuillen3 {−1, a, b} (milnorToQuillen3_symbol_eq_mul, from T.2:graded-map).

**Acceptance.**

- For F = Q the kernel is Z/2, generated by the image of {−1,−1,−1}.
- For a finite field the kernel is 0 and K_3(F_q) ≅ H_3(SL(F_q), Z).

**Imports.** [`K3BlochGroups:V.1/k2-to-k3-h3-e`](#v-1-k2-to-k3-h3-e), [`K3BlochGroups:V.2/milnor-to-quillen-degree-three`](#v-2-milnor-to-quillen-degree-three), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.2:graded-map`](../packets/K2SymbolsBrauer--T.1.json), [`KTheoryLowDegrees:U.3`](../packets/KTheoryLowDegrees--U.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5 opening (PDF p. 495).

<a id="v-2-motivic-low-degree-sequence"></a>

### V.2.8: Low-degree sequence of the motivic spectral sequence of a field

`K3BlochGroups:V.2/motivic-low-degree-sequence` · lemma

For a field k, the motivic spectral sequence E_2^{p,q} = H^{p−q}(k, Z(−q)) ⇒ K_{−p−q}(k) yields an exact sequence K_4(k) → H^0(k, Z(2)) → K_3^M(k) → K_3(k) → H^1(k, Z(2)) → 0, in which the middle map is milnorToQuillen3 under the Nesterenko–Suslin–Totaro isomorphism K_3^M(k) ≅ H^3(k, Z(3)), and the map into K_3^M(k) is the differential d_2.

**Hypotheses.** k is a field.

**Construction and proof.**

1. Take the motivic spectral sequence for Spec k (MotivicEtaleKTheory M.6).
2. The vanishing of H^n(k, Z(0)) for n < 0, of H^n(k, Z(1)) for n ≤ 0 and of H^n(k, Z(i)) for n > i (MotivicEtaleKTheory M.4) leaves only the displayed terms in total degrees three and four.
3. The edge map from H^3(k, Z(3)) ≅ K_3^M(k) is the product map (multiplicativity of the spectral sequence, requested from M.6; the identification of Milnor K-theory on the diagonal, M.4), hence milnorToQuillen3.

**Acceptance.**

- With Z/m coefficients the corresponding d_2 can be nonzero (k = Q, m = 8); the integral d_2 is shown to vanish in V.2/milnor-k3-injective.

**Imports.** [`MotivicEtaleKTheory:M.6`](../packets/MotivicEtaleKTheory--M.5d.json), [`MotivicEtaleKTheory:M.4`](../packets/MotivicEtaleKTheory--M.1.json), [`K3BlochGroups:V.2/milnor-to-quillen-degree-three`](#v-2-milnor-to-quillen-degree-three), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Low degree terms VI.4.3.1 (PDF p. 490); [Kbook.2013](#source-0-kbook-2013) — Edge Map VI.4.3 (PDF p. 489).

<a id="v-2-milnor-k3-kernel-exponent-two"></a>

### V.2.9: The kernel of the degree-three Milnor-to-Quillen map has exponent two

`K3BlochGroups:V.2/milnor-k3-kernel-exponent-two` · lemma

For every field F, twice every element of the kernel of K_3^M(F) → K_3(F) is zero.

**Hypotheses.** F is a field.

**Construction and proof.**

1. The composite of milnorToQuillen3 with the motivic Chern class c_{3,3} : K_3(F) → H^{3,3}(F) ≅ K_3^M(F) is multiplication by (−1)^2 · 2! = 2 (K-book Lemma V.11.13; recorded gap on motivic Chern classes).
2. Hence the kernel is killed by 2.

**Acceptance.**

- In degree n the same argument gives exponent (n − 1)!, which is not sharp in degree three (V.2/milnor-k3-injective).

**Imports.** [`K3BlochGroups:V.2/milnor-to-quillen-degree-three`](#v-2-milnor-to-quillen-degree-three), [`MotivicEtaleKTheory:M.4`](../packets/MotivicEtaleKTheory--M.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma V.11.13 (PDF p. 466).

<a id="v-2-milnor-k3-injective"></a>

### V.2.10: Milnor K_3 of a field injects into Quillen K_3

`K3BlochGroups:V.2/milnor-k3-injective` · theorem

For every field F the degree-three map K_3^M(F) -> K_3(F) is injective. Consequently the decomposable part is isomorphic to K_3^M(F) and the sequence of the previous lemma is short exact.

**Hypotheses.** F is a field.

**Construction and proof.**

1. The kernel of K_3^M(k) → K_3(k) is killed by 2 (V.2/milnor-k3-kernel-exponent-two).
2. If char k = 2, K_3^M(k) has no 2-torsion (Izhboldin's theorem, K-book III.7.8; recorded gap), so the kernel is 0.
3. If char k ≠ 2, the image of the differential d_2 : H^0(k, Z(2)) → K_3^M(k) of V.2/motivic-low-degree-sequence lies in that kernel, so d_2 factors through H(k) = H^0(k, Z(2))/2, a subgroup of H^0(k, Z/2(2)) ≅ H^0_et(k, Z/2) = Z/2 (recorded gap on the weight-two degree-zero norm residue identification); by naturality (MotivicEtaleKTheory M.4) H(k) injects into H(k̄) for an algebraic closure k̄.
4. For k̄ algebraically closed, K_4(k̄) is divisible and K_3^M(k̄) is uniquely divisible (recorded gap), so the exact sequence of V.2/motivic-low-degree-sequence makes H^0(k̄, Z(2)) divisible and H(k̄) = 0; hence d_2 = 0 and the map is injective.
5. Conclude the short exact sequence 0 → K_3^M(F) → K_3(F) → K_3^ind(F) → 0, natural in F, with V.2/decomposable-exactness.

**Acceptance.**

- For a number field the short exact sequence has torsion left-hand term of order 2 to the power r_1, which is the input to the V.5 calculations.
- Degree four fails: {−1,−1,−1,−1} is nonzero in K_4^M(Q) but zero in K_4(Q) (K-book Ex. IV.1.12(d)).
- Finite coefficients fail: K_3^M(Q)/8 → K_3(Q; Z/8) is not injective (K-book VI.4.3, PDF p. 489).

**Imports.** [`K3BlochGroups:V.2/milnor-to-quillen-degree-three`](#v-2-milnor-to-quillen-degree-three), [`K3BlochGroups:V.2/decomposable-exactness`](#v-2-decomposable-exactness), [`K3BlochGroups:V.2/motivic-low-degree-sequence`](#v-2-motivic-low-degree-sequence), [`K3BlochGroups:V.2/milnor-k3-kernel-exponent-two`](#v-2-milnor-k3-kernel-exponent-two), [`MotivicEtaleKTheory:M.4`](../packets/MotivicEtaleKTheory--M.1.json), [`MotivicEtaleKTheory:M.5`](../packets/MotivicEtaleKTheory--M.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proposition VI.4.3.2 (PDF p. 490); [Kbook.2013](#source-0-kbook-2013) — Low degree terms VI.4.3.1 (PDF p. 490).

<a id="v-2-real-place-basis"></a>

### V.2.11: Real-place basis of Milnor K₃

`K3BlochGroups:V.2/real-place-basis` · construction

Let R(F) be the finite subtype of real infinite places and σ_F:K₃ᴹ(F)≃⊕_{v∈R(F)} Z/2 the imported Bass–Tate signature, written additively with 1 for an all-negative triple. Define b_v=σ_F⁻¹(δ_v), where δ_v is 1 at v and 0 elsewhere. This is canonical; choosing a sign-isolating unit is not part of its data.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Use the supplier isomorphism, not a fresh presentation of Milnor K-theory.
2. Transport the coordinate generators and their finite expansion through σ_F.
3. Naturality of signatures transports restriction: a basis class at v maps to the sum of basis classes over real places lying above v. If no real place lies above v the sum is zero.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `realBasis` | constructor | b_v=σ_F⁻¹(δ_v). |
| `realBasis_signature` | simp | σ_F(b_v)(w) equals 1 if w=v and 0 otherwise. |
| `realBasis_nonzero` | characterisation | b_v≠0 for each real place v. |
| `realBasis_two_nsmul` | relation | 2b_v=0. |
| `realBasis_expand` | extensionality | Every x is the sum of b_v over the real places with σ_F(x)(v)=1. |
| `realBasis_map` | functoriality | For an embedding F→L of number fields, restriction sends b_v to the sum over real places w of L restricting to v. |

**Unit tests.**

- `realBasis_single` (computation): With the single real coordinate of Q, σ_Q(b)=1.
- `realBasis_empty` (degenerate): When R(F) is empty every x∈K₃ᴹ(F) equals zero.
- `realBasis_distinct` (non-example): For two distinct real places v,w, b_v≠b_w. Defining every generator as {−1,−1,−1} fails this test.

**Uses.**

- Bass–Tate II §2 proof, pp.401–402: Canonicalise the sign-isolating generators used in the proof..
- HabiroNumberFields:HB.2: Keep the real signature contribution visible in the integral K₃ input..
- V.5 number-field computation: Track the separate real-place decomposable classes..

**Acceptance.**

- For Q the unique generator is {−1,−1,−1}.
- An empty real-place type gives the zero group.
- Distinct coordinates give distinct nonzero elements of order two.

**Imports.** [`K2SymbolsBrauer:T.2:symbols/milnor-number-field`](../packets/K2SymbolsBrauer--T.1.json), [`mathlib:NumberField.InfinitePlace.nrRealPlaces`](#baseline-mathlib-numberfield-infiniteplace-nrrealplaces).

**Sources.** [BT1973](#source-2-bt1973) — Chapter II §2, Theorem (2.1)(3), printed p.396; final proof paragraph, printed p.402 (volume PDF pp.406,412)..

<a id="v-2-real-basis-symbol-representatives"></a>

### V.2.12: Symbol representatives of the real-place basis

`K3BlochGroups:V.2/real-basis-symbol-representatives` · lemma

For each real place v of a number field F, there exists u_v∈F× negative at v and positive at every other real place. For every such u_v, b_v={−1,−1,u_v}. Thus the symbol is independent of the chosen sign-isolating unit.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Use weak approximation on a nonempty open sign box, including arbitrary open constraints at the complex places. The chosen element is nonzero because it has negative value at v.
2. Evaluate {−1,−1,u_v} under σ_F: it has exactly the v coordinate equal to 1.
3. Apply injectivity of σ_F. Alternatively Bass–Tate rewrites {u_v,u_v,u_v} as {−1,−1,u_v} using the Milnor repeated-entry identity.

**Acceptance.**

- For Q choose u=−1.
- Changing u without changing its signs does not change the class.

**Imports.** [`K3BlochGroups:V.2/real-place-basis`](#v-2-real-place-basis), [`K2SymbolsBrauer:T.2/milnor-alternating`](../packets/K2SymbolsBrauer--T.1.json), [`mathlib:NumberField.InfinitePlace.embedding_of_isReal`](#baseline-mathlib-numberfield-infiniteplace-embedding-of-isreal), [`mathlib:NumberField.InfinitePlace.denseRange_algebraMap_pi`](#baseline-mathlib-numberfield-infiniteplace-denserange-algebramap-pi).

**Sources.** [BT1973](#source-2-bt1973) — Chapter II §2, Theorem (2.1)(3), printed p.396; final proof paragraph, printed p.402 (volume PDF pp.406,412)..

<a id="v-2-minus-one-product-surjective"></a>

### V.2.13: Surjectivity of the product with −1

`K3BlochGroups:V.2/minus-one-product-surjective` · theorem

For a number field F the additive homomorphism p_F:K₂ᴹ(F)→K₃ᴹ(F), x↦{−1}·x, is surjective. Under Matsumoto and the imported graded comparison, the image of K₂(F) --[−1]·→ K₃(F) equals the decomposable subgroup D(F)=im(m₃). This statement is about number fields; no all-fields equality of these two images is asserted.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Each b_v has preimage {−1,u_v} under p_F. Finite coordinate expansion therefore proves surjectivity.
2. The natural product square p_F,m₂,m₃ and [−1]· commutes by the graded comparison, with m₂ an isomorphism. Equality of images follows.
3. Combining with the inherited stable Hurewicz kernel identifies that kernel with D(F).

**Acceptance.**

- For Q the all-minus-one triple is in the image.
- For a totally imaginary number field both images are zero.
- No Quillen K₃ order calculation is used to prove surjectivity.

**Imports.** [`K3BlochGroups:V.2/real-basis-symbol-representatives`](#v-2-real-basis-symbol-representatives), [`K2SymbolsBrauer:T.2/matsumoto`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.2/graded-map-degree-three`](../packets/K2SymbolsBrauer--T.1.json), [`K3BlochGroups:V.2/k3-to-h3-sl-field`](#v-2-k3-to-h3-sl-field).

**Sources.** [BT1973](#source-2-bt1973) — Chapter II §2, Theorem (2.1)(3), printed p.396; final proof paragraph, printed p.402 (volume PDF pp.406,412)..

<a id="v-2-decomposable-signature"></a>

### V.2.14: Signature of the decomposable subgroup

`K3BlochGroups:V.2/decomposable-signature` · construction

For a number field F, let D(F)=im(m₃)⊆K₃(F), the inherited decomposable subgroup. Integral injectivity gives j:K₃ᴹ(F)≃D(F). Construct s_D:D(F)≃⊕_{v real} Z/2 as σ_F∘j⁻¹. In particular |D(F)|=2^{r₁} and every element of D(F) is killed by 2; do not identify D(F) with all torsion in K₃(F).

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Use injectivity to corestrict m₃ to an isomorphism onto its actual range.
2. Compose its inverse with the supplier signature isomorphism.
3. Count the finite product and transport exponent two; functoriality is the naturality of m₃ and signatures.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `decomposableSignature` | equivalence | The additive equivalence s_D:D(F)≃(R(F)→Z/2). |
| `decomposableSignature_apply` | simp | s_D(m₃(x), membership in its range)=σ_F(x). |
| `decomposableSignature_symm` | simp | s_D⁻¹(t) has ambient K₃ class m₃(σ_F⁻¹(t)). |
| `decomposableSignature_two_nsmul` | relation | 2d=0 for d∈D(F). |
| `decomposableSignature_card` | characterisation | The finite cardinality of D(F) equals 2^{r₁}. |
| `decomposableSignature_map` | functoriality | Restriction of D(F)→D(L) corresponds to pulling back sign functions along R(L)→R(F). |

**Unit tests.**

- `decomposableSignature_zero` (compatibility): The signature of m₃(0) is the zero function.
- `decomposableSignature_one_real` (computation): A class mapping to the unique coordinate 1 is nonzero, so D(Q) is not zero.
- `decomposableSignature_empty` (degenerate): With an empty real-place type every ambient decomposable class is zero.
- `decomposableSignature_coordinate` (characterisation): For every real place v, the decomposable signature of the ambient Milnor image m₃(b_v) is δ_v. Postcomposing with a nontrivial coordinate permutation or another additive automorphism fails this test.

**Uses.**

- V.5 number-field integral structure: Specify the actual embedded real-place subgroup before computing the quotient..
- HabiroNumberFields:HB.2: Separate real-place 2-torsion from the remaining torsion and free parts..

**Acceptance.**

- D(Q) has two elements; its nonzero element is m₃{−1,−1,−1}.
- If r₁=0 then D(F)=0.
- The inclusion D(F)⊆torsion(K₃(F)) need not be equality.

**Imports.** [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective), [`K2SymbolsBrauer:T.2:symbols/milnor-number-field`](../packets/K2SymbolsBrauer--T.1.json), [`mathlib:CommGroup.torsion`](#baseline-mathlib-commgroup-torsion).

**Sources.** [KVI](#source-2-kvi) — VI.4.3.2, chapter PDF p.18.; [BT1973](#source-2-bt1973) — Chapter II §2, Theorem (2.1)(3), printed p.396; final proof paragraph, printed p.402 (volume PDF pp.406,412)..

<a id="v-2-totally-imaginary-quotient-equivalence"></a>

### V.2.15: Indecomposable quotient for totally imaginary number fields

`K3BlochGroups:V.2/totally-imaginary-quotient-equivalence` · construction

If F is a number field with r₁=0, the inherited quotient q_F:K₃(F)→K₃^ind(F) is an additive equivalence e_F. Construct it from q_F and D(F)=0; its inverse is the unique lift of a quotient class. It is natural for embeddings between totally imaginary number fields.

**Hypotheses.** F is a number field. F has no real infinite places: r₁(F)=0.

**Construction and proof.**

1. The supplier Bass–Tate signature makes K₃ᴹ(F)=0, hence the image subgroup is zero.
2. The quotient map is surjective and has zero kernel, hence bijective.
3. Use uniqueness of the inverse to prove its evaluation, inverse laws and naturality.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `totallyImaginaryQuotientEquiv` | equivalence | e_F:K₃(F)≃+K₃^ind(F). |
| `totallyImaginaryQuotientEquiv_apply` | simp | e_F(x)=q_F(x). |
| `totallyImaginaryQuotientEquiv_symm_apply` | simp | e_F⁻¹(q_F(x))=x. |
| `totallyImaginaryQuotientEquiv_map` | functoriality | For an embedding of totally imaginary number fields, e_L∘K₃(f)=K₃^ind(f)∘e_F. |

**Unit tests.**

- `totallyImaginaryQuotient_zero` (degenerate): The equivalence takes zero to the zero quotient class.
- `totallyImaginaryQuotient_representative` (compatibility): Applying the inverse to the quotient class of x recovers x.
- `totallyImaginaryQuotient_injective` (characterisation): q_F(x)=q_F(y) iff x=y under D(F)=0.

**Uses.**

- V.5 computation for Q(i): Pass the integral K₃ structure to the indecomposable quotient with the canonical map..
- HabiroNumberFields:HB.2: Use integral K₃ directly when there are no real places..

**Acceptance.**

- The result applies to Q(i), independently of the later calculation of its K₃.
- It cannot be applied to Q, whose decomposable subgroup is nonzero.

**Imports.** [`K3BlochGroups:V.2/decomposable-signature`](#v-2-decomposable-signature), [`K3BlochGroups:V.2/decomposable-exactness`](#v-2-decomposable-exactness), [`mathlib:QuotientGroup.mk'`](#baseline-mathlib-quotientgroup-mk-u27).

**Sources.** [BT1973](#source-2-bt1973) — Chapter II §2, Theorem (2.1)(3), printed p.396; final proof paragraph, printed p.402 (volume PDF pp.406,412).; [KVI](#source-2-kvi) — VI.5 opening, chapter PDF p.23 (definition of the cokernel)..

<a id="v-2-number-field-stable-hurewicz-equivalence"></a>

### V.2.16: Stable homology and indecomposable K₃ of a number field

`K3BlochGroups:V.2/number-field-stable-hurewicz-equivalence` · construction

For a number field F the inherited stable Hurewicz map h_F:K₃(F)→H₃(SL(F),Z) factors uniquely through an additive equivalence e_h:K₃^ind(F)≃H₃(SL(F),Z). Here SL(F) is the stable special linear group, not SL₂(F). The equivalence is natural under embeddings of number fields.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. The inherited Hurewicz map is surjective, with kernel im(m₃∘p_F).
2. The product theorem makes that kernel D(F).
3. Apply the baseline quotient equivalence with its evaluation on representatives; naturality follows from surjectivity of q_F.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `stableHurewiczQuotientEquiv` | equivalence | e_h:K₃^ind(F)≃+H₃(SL(F),Z). |
| `stableHurewiczQuotientEquiv_apply` | simp | e_h(q_F(x))=h_F(x). |
| `stableHurewiczQuotientEquiv_symm_apply` | simp | e_h⁻¹(h_F(x))=q_F(x). |
| `stableHurewiczQuotientEquiv_unique` | universal-property | Every additive homomorphism with this evaluation on q_F equals e_h. |
| `stableHurewiczQuotientEquiv_map` | functoriality | e_h commutes with K₃^ind(f) and stable H₃(SL(f),Z). |

**Unit tests.**

- `stableHurewiczQuotient_zero` (degenerate): The equivalence sends the zero class to zero.
- `stableHurewiczQuotient_decomposable` (compatibility): e_h(q_F(m₃(x)))=0 for every Milnor class x.
- `stableHurewiczQuotient_kernel` (characterisation): h_F(x)=0 iff q_F(x)=0.
- `stableHurewiczQuotient_representative` (compatibility): For every ambient class x, e_h(q_F(x))=h_F(x). An unrelated isomorphism with the same kernel or a postcomposition by an automorphism of stable H₃ fails this test.

**Uses.**

- V.4 passage from stable homology to the Bloch group: Give the number-field specialization with its canonical quotient map, without importing the downstream Suslin sequence..
- Bass–Tate product generators and V.1 Hurewicz sequence: Identify the precise kernel rather than comparing ranks..

**Acceptance.**

- h_F kills every decomposable class.
- For a totally imaginary number field, h_F itself is an isomorphism.
- This conclusion does not identify unstable H₃(SL₂(F),Z) with K₃^ind(F).

**Imports.** [`K3BlochGroups:V.2/minus-one-product-surjective`](#v-2-minus-one-product-surjective), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`K3BlochGroups:V.2/k3-to-h3-sl-field`](#v-2-k3-to-h3-sl-field), [`mathlib:QuotientGroup.liftEquiv`](#baseline-mathlib-quotientgroup-liftequiv).

**Sources.** [BT1973](#source-2-bt1973) — Chapter II §2, Theorem (2.1)(3), printed p.396; final proof paragraph, printed p.402 (volume PDF pp.406,412).; [KVI](#source-2-kvi) — VI.5 opening paragraph, chapter PDF p.23..

<a id="v-2-weight-two-mod-two-obstruction-zero"></a>

### V.2.17: Vanishing of the integral weight-two mod-two obstruction

`K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero` · theorem

For every field F of characteristic different from 2, H⁰(F,Z(2))/2=0. Consequently the integral differential d₂:H⁰(F,Z(2))→K₃ᴹ(F) in the inherited low-degree sequence is zero. This theorem refines the characteristic-not-two branch of the inherited injectivity proof; it does not use that injectivity theorem as an input.

**Hypotheses.** F is a field. char(F)≠2.

**Construction and proof.**

1. The exponent-two kernel bound makes d₂ factor through H(F)=H⁰(F,Z(2))/2.
2. The coefficient exact sequence injects H(F) into H⁰(F,Z/2(2)). The natural motivic-to-étale comparison in degree zero, weight two identifies the latter with H⁰_et(F,μ₂⊗²)=Z/2. The map on these constant groups for F→Fbar is the identity, hence H(F)→H(Fbar) is injective.
3. Over Fbar, Milnor K₃ is uniquely divisible, hence has no 2-torsion. The exponent-two bound first forces d₂=0 there. Exactness then makes K₄(Fbar)→H⁰(Fbar,Z(2)) surjective. Divisibility of K₄ therefore makes H⁰ divisible. Thus H(Fbar)=0 and H(F)=0.
4. Use the corrected characteristic scope of the divisibility supplier: VI.1.6 in characteristic zero; VI.1.3.1(i) in positive characteristic. Do not use rational Chern characters to deduce the integral exponent-two bound.

**Acceptance.**

- The argument applies to Q and to fields of odd positive characteristic.
- Characteristic two instead requires Izhboldin’s no-2-torsion theorem and the inherited kernel bound.
- The coefficient spectral-sequence differential may still be nonzero.

**Imports.** [`K3BlochGroups:V.2/motivic-low-degree-sequence`](#v-2-motivic-low-degree-sequence), [`K3BlochGroups:V.2/milnor-k3-kernel-exponent-two`](#v-2-milnor-k3-kernel-exponent-two), [`K2SymbolsBrauer:T.2:symbols/milnor-algebraically-closed`](../packets/K2SymbolsBrauer--T.1.json), [`MotivicEtaleKTheory:M.4`](../packets/MotivicEtaleKTheory--M.1.json), [`MotivicEtaleKTheory:M.5`](../packets/MotivicEtaleKTheory--M.1.json), [`MotivicEtaleKTheory:M.7`](../packets/MotivicEtaleKTheory--M.5d.json).

**Sources.** [KVI](#source-2-kvi) — VI.4.3.1–4.3.2, chapter PDF pp.17–18; for the corrected K₄-divisibility citation, VI.1.3.1(i), p.3, and VI.1.6(i), pp.4–5.; [KV](#source-2-kv) — V.11.3, V.11.11, Lemma 11.13, chapter PDF pp.81–82,85–87.

<a id="v-2-indecomposable-motivic-edge-equivalence"></a>

### V.2.18: Motivic edge description of indecomposable K₃

`K3BlochGroups:V.2/indecomposable-motivic-edge-equivalence` · construction

For every field F the edge map e_F:K₃(F)→H¹(F,Z(2)) in the inherited low-degree integral sequence induces a natural additive equivalence e_m:K₃^ind(F)≃H¹(F,Z(2)), characterized by e_m(q_F(x))=e_F(x). This is a quotient assertion; it uses right exactness of the sequence and does not need injectivity of m₃.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Right exactness identifies ker(e_F)=D(F) and gives surjectivity of the edge map.
2. Apply QuotientAddGroup.liftEquiv; prove uniqueness by surjectivity of q_F.
3. Use naturality of the low-degree sequence to prove the field-map square.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `motivicEdgeQuotientEquiv` | equivalence | e_m:K₃^ind(F)≃+H¹(F,Z(2)). |
| `motivicEdgeQuotientEquiv_apply` | simp | e_m(q_F(x))=e_F(x). |
| `motivicEdgeQuotientEquiv_symm_apply` | simp | e_m⁻¹(e_F(x))=q_F(x). |
| `motivicEdgeQuotientEquiv_unique` | universal-property | Every additive homomorphism with this evaluation on representatives equals e_m. |
| `motivicEdgeQuotientEquiv_map` | functoriality | The equivalence commutes with maps induced by every field homomorphism. |

**Unit tests.**

- `motivicEdgeQuotient_zero` (degenerate): The equivalence takes the zero quotient class to zero.
- `motivicEdgeQuotient_symbol` (compatibility): e_m(q_F(m₃(x)))=0 for every Milnor class x.
- `motivicEdgeQuotient_lift` (characterisation): The inverse of the edge image e_F(x) is exactly q_F(x).

**Uses.**

- K-book VI.4.3.1 and opening of VI.5: Identify the cokernel in the low-degree motivic sequence..
- V.4 and V.5 consumers of K₃^ind: Provide a natural integral realization without changing the quotient convention..

**Acceptance.**

- The equivalence kills all Milnor images.
- Its domain is the quotient rather than the full K₃ group.
- It is integral, not an equivalence only after rationalisation.

**Imports.** [`K3BlochGroups:V.2/motivic-low-degree-sequence`](#v-2-motivic-low-degree-sequence), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`mathlib:QuotientGroup.liftEquiv`](#baseline-mathlib-quotientgroup-liftequiv).

**Sources.** [KVI](#source-2-kvi) — VI.4.3.1, chapter PDF p.17..

### V.2 closure requirements

**Foundational integral motivic Chern construction needs its own supplier extension.** The V.11.11 construction uses motivic cohomology on simplicial B•GL, the projective-bundle theorem, localization and Whitney/splitting formulas. V.11.3 then produces natural higher operations c_{i,n}; V.11.13 gives c_{i,i}∘m_i=(-1)^{i−1}(i−1)!id, hence c_{3,3}∘m₃=+2id. The passages and proofs were read; Bloch [Bl86], MVW projective-bundle/localization foundations and the product-rule exercise were not independently decomposed. No existing fine node supplies the integral construction. Route it to MotivicEtaleKTheory, Part II over M.4/M.6 and the higher-Chern direction of SchemeKTheory S.7. Do not use regulator stage M.8: its V.4 dependency would create a backedge. The inherited kernel-exponent-two theorem remains conditional on this supplier refinement. The author-copy localization display requires the first projective bundle to be P(F′), as recorded in E31; the Gysin weight n′ is already correct.

Consumers: [`K3BlochGroups:V.2/milnor-k3-kernel-exponent-two`](#v-2-milnor-k3-kernel-exponent-two), [`K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero`](#v-2-weight-two-mod-two-obstruction-zero), [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective).

**General characteristic-prime Milnor torsion theorem lacks a fine owner node.** K-book III.7.8 and its proof were read. The proof uses the differential-symbol injection III.7.7.2, p-divisibility of the p-torsion subgroup from Bloch–Kato [2.8], Artin–Schreier extension transfer, and the inductive P(E)=I(E) auxiliary result III.7.8.2. These underlying primary papers were not obtained/read in the cited source decomposition. The theorem is a Milnor-theory Part II request, not a new V.2 theorem or an assertion that M.5d already states it. Once supplied, the inherited exponent-two bound kills the degree-three kernel in characteristic two.

Consumers: [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective).

**Degree-zero motivic comparison and algebraically-closed divisibility are requested extensions.** M.5 currently states the diagonal norm-residue isomorphism; it does not by itself identify H⁰(F,Z/2(2)) with étale H⁰. M.7 has rigidity/comparison scope but no inspected fine K₄-divisibility node. The exact statements and characteristic restrictions are in the requests. The V.2 obstruction proof records the natural constant-group restriction needed for its descent step. This prevents treating an injection into Z/2 as an unsupported injection into the algebraic closure group.

Consumers: [`K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero`](#v-2-weight-two-mod-two-obstruction-zero), [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective).

**Inherited Milnor supplier proof gaps remain with their owners.** The general Bass–Tate and algebraically closed Milnor theorem nodes exist and are imported without duplication. Their supplier proof boundaries remain explicit. BT1973 II §2 gives the original proof and the sign-basis representatives; II §§3–5 and the cited Moore/Tate/Weil proofs were not read, so the general theorem is not certified source-decomposed by this consumer development. The algebraically closed unique-divisibility input is imported in the valid range n≥2. Refine both supplier proofs rather than copy them into V.2.

Consumers: [`K3BlochGroups:V.2/real-place-basis`](#v-2-real-place-basis), [`K3BlochGroups:V.2/minus-one-product-surjective`](#v-2-minus-one-product-surjective), [`K3BlochGroups:V.2/decomposable-signature`](#v-2-decomposable-signature), [`K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero`](#v-2-weight-two-mod-two-obstruction-zero).

<a id="v3"></a>

## V.3: Bloch presentations and their comparisons

Build the antisymmetric tensor cokernel and its diagonal/exterior comparison
before the Bloch boundary. Give the free and reduced symbol presentations a
canonical equivalence, then descend the ordered five-term relation. The
kernel inclusion, lift uniqueness, field maps and small-field tests determine
the integral convention.

Compare Bloch's raw full-tensor kernel through its relation quotient; the
six-torsion obstruction is meaningful only after removing that raw kernel.
For Goncharov's generic presentation, alternating cross-ratios give precisely
the ordinary five-term subgroup. Its group is P(F), while its cycle kernel is
B(F). The all-curve rational presentation uses projective specializations at
every point of every admissible smooth curve. Clear denominators, then multiply
again to kill integral boundary torsion. Over 𝔽₃ that all-curve quotient is
zero, whereas the generic rational presentation is ℚ; no unconditional
all-field comparison is asserted.

For the extended projective presentation, descend the boundary to the
negative-unit tensor quotient before taking the published CGZ kernel. Prove
κ_new surjective with kernel B∩H for |F|≥4, then compare it with the inherited
exterior-cycle image B_CGZ,old. The old map can have a nonzero cokernel even
though the published map is surjective. Keep the diagonal two-torsion and the
universal class c throughout these comparisons.

**Planets.** [Antisymmetric tensor quotient](#v-3-antisymmetric-tensor-quotient); [Five-term relation](#v-3-five-term-relation); [Pre-Bloch group P(F)](#v-3-pre-bloch-group); [Bloch group B(F)](#v-3-bloch-group); [The element c of B(F)](#v-3-element-c); [Bloch group, CGZ convention](#v-3-cgz-bloch-group).

<a id="v-3-antisymmetric-tensor-quotient"></a>

### V.3.1: Suslin's antisymmetric tensor quotient

`K3BlochGroups:V.3/antisymmetric-tensor-quotient` · definition

For a commutative ring R and an R-module M, antisymSquare R M is the quotient of M ⊗_R M by the submodule LinearMap.range (id + comm), which is the submodule spanned by all a ⊗ b + b ⊗ a; the class of a ⊗ b is written a ∧ b. The roadmap uses R = ℤ and M = Additive Fˣ, which is the K-book's ∧̃²A. It is the cokernel of 1 + τ (τ the flip): it is not Tau Ceti's antisymmetricTensors, which is the kernel of 1 + τ, and it is not the exterior square, since the class a ∧ a need not vanish.

**Hypotheses.** R is a commutative ring and M is an R-module; the roadmap uses R = ℤ and M = Additive Fˣ. No hypothesis on 2: the construction is used over ℤ, where 2 is not invertible.

**Construction and proof.**

1. Form M ⊗[R] M; for a multiplicative group such as Fˣ use the additive type tag Additive Fˣ, which is a ℤ-module.
2. Take the quotient by LinearMap.range (LinearMap.id + (TensorProduct.comm R M M).toLinearMap) with Submodule.mkQ, and record that this range is the span of the elements a ⊗ b + b ⊗ a, because pure tensors span M ⊗ M and id + comm is linear.
3. Define a ∧ b as the class of a ⊗ b; bilinearity is inherited from the tensor product, and a ∧ b + b ∧ a = 0 because a ⊗ b + b ⊗ a lies in the range.
4. Universal property: a bilinear map f with f a b + f b a = 0 gives TensorProduct.lift f, which vanishes on the range and so descends by Submodule.liftQ; uniqueness holds because the a ∧ b span the quotient.
5. Do not divide by two anywhere: over ℤ the tensor square does not split into symmetric and antisymmetric parts, and the object needed is the cokernel of 1 + τ.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `antisymSquare` | data | The R-module antisymSquare R M = (M ⊗[R] M) ⧸ LinearMap.range (id + comm). |
| `antisymSquare.mk` | constructor | The bilinear map M → M → antisymSquare R M, (a, b) ↦ a ∧ b. |
| `antisymSquare.ker_mkQ` | characterisation | The kernel of the quotient map M ⊗ M → antisymSquare R M is LinearMap.range (id + comm), which is the span of the a ⊗ b + b ⊗ a. |
| `antisymSquare.antisymm` | relation | a ∧ b + b ∧ a = 0 for all a, b. |
| `antisymSquare.wedge_self_add` | relation | (a + b) ∧ (a + b) = a ∧ a + b ∧ b. |
| `antisymSquare.two_smul_wedge_self` | relation | 2 • (a ∧ a) = 0. |
| `antisymSquare.wedgeSelf` | constructor | The additive map M → antisymSquare R M, a ↦ a ∧ a, which vanishes on 2M. |
| `antisymSquare.lift` | universal-property | A bilinear map f : M → M → N with f a b + f b a = 0 factors uniquely through antisymSquare R M. |
| `antisymSquare.lift_mk` | universal-property | lift f (a ∧ b) = f a b. |
| `antisymSquare.hom_ext` | extensionality | Two linear maps out of antisymSquare R M that agree on every a ∧ b are equal. |
| `antisymSquare.map` | functoriality | A linear map g : M → N induces antisymSquare R M → antisymSquare R N with map g (a ∧ b) = g a ∧ g b, map id = id and map (g ∘ h) = map g ∘ map h. |
| `antisymSquare.toExterior` | compatibility | The canonical surjection onto Mathlib's exterior square ⋀[R]^2 M, with toExterior (a ∧ b) = exteriorPower.ιMulti R 2 ![a, b]. |
| `antisymSquare.equivAntisymmetricTensors` | compatibility | When 2 is invertible in R, a ∧ b ↦ ⅟2 • (a ⊗ b − b ⊗ a) is an R-linear equivalence from antisymSquare R M onto TauCeti.antisymmetricTensors R M. |
| `antisymSquare.equivCoinvariants` | compatibility | antisymSquare R M is equivalent to Representation.Coinvariants of the action of Multiplicative (ZMod 2) on M ⊗ M in which the generator acts by −comm. |
| `antisymSquare.prodEquiv` | other | antisymSquare R (M × N) ≃ antisymSquare R M × antisymSquare R N × (M ⊗[R] N). |
| `antisymSquare.zmodEquiv` | example | antisymSquare ℤ (ZMod n) ≃ ZMod (gcd 2 n), and antisymSquare ℤ ℤ ≃ ZMod 2. |

**Unit tests.**

- `square_class_nonzero` (non-example): For M = ZMod 2 the class 1 ∧ 1 is nonzero, which the exterior square would kill.
- `antisymmetry` (characterisation): a ∧ b = −(b ∧ a) for all a and b.
- `int_equiv` (computation): antisymSquare ℤ ℤ ≃ ZMod 2, generated by 1 ∧ 1. This fails for the exterior square (which is zero), for the tensor square ℤ ⊗ ℤ ≅ ℤ, and for TauCeti.antisymmetricTensors ℤ ℤ (which is ⊥).
- `zmod_three` (degenerate): antisymSquare ℤ (ZMod 3) = 0, because 1 + τ = 2 is invertible on ZMod 3 ⊗ ZMod 3; the unquotiented tensor square fails this.
- `agrees_with_eigenspace_when_two_invertible` (compatibility): For R with ⅟2 and any R-module M, equivAntisymmetricTensors is an equivalence antisymSquare R M ≃ₗ[R] TauCeti.antisymmetricTensors R M; for R = M = ℤ no such equivalence exists (ZMod 2 against ⊥).
- `not_exterior_square` (non-example): For M = ZMod 2 the map toExterior is not injective: its source is ZMod 2 and its target is zero.

**Uses.**

- V.3's boundary map: the boundary of the pre-Bloch group lands in this group, and Suslin's Bloch group is its kernel.
- V.4's spectral sequence: the K-book (PDF p. 499) identifies the σ-coinvariants of the second homology of the diagonal torus as the sum of the exterior square and this group, which is what equivCoinvariants serves.
- V.3's comparisons with the exterior-square conventions: the kernel of toExterior is A/2A, which bounds the discrepancy between the conventions.
- V.6's root-of-unity symbols: the order of a boundary in this group decides which multiple of a symbol is a Bloch element; wedgeSelf computes it.

**Acceptance.**

- For M = ℤ/2 the quotient is cyclic of order two, generated by 1 ∧ 1, so a ∧ a ≠ 0: this distinguishes it from the exterior square.
- a ∧ b + b ∧ a = 0 for all a and b.
- For M = ℤ the quotient is cyclic of order two, while the exterior square of ℤ is zero and Tau Ceti's antisymmetricTensors ℤ ℤ is the zero submodule.

**Imports.** [`mathlib:TensorProduct`](#baseline-mathlib-tensorproduct), [`mathlib:TensorProduct.comm`](#baseline-mathlib-tensorproduct-comm), [`mathlib:TensorProduct.lift`](#baseline-mathlib-tensorproduct-lift), [`mathlib:LinearMap.range`](#baseline-mathlib-linearmap-range), [`mathlib:Submodule.mkQ`](#baseline-mathlib-submodule-mkq), [`mathlib:Submodule.liftQ`](#baseline-mathlib-submodule-liftq), [`mathlib:Additive`](#baseline-mathlib-additive).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5, opening of the section (PDF p. 495).

<a id="v-3-antisym-exterior-comparison"></a>

### V.3.2: The antisymmetric quotient over the exterior square, and its A/2A kernel

`K3BlochGroups:V.3/antisym-exterior-comparison` · theorem

For every abelian group A, the canonical surjection toExterior from antisymSquare ℤ A onto the exterior square ⋀[ℤ]^2 A has kernel the subgroup of classes a ∧ a, and a ↦ a ∧ a induces an isomorphism from A/2A onto that kernel. So 0 → A/2A → antisymSquare ℤ A → ⋀[ℤ]^2 A → 0 is exact.

**Hypotheses.** A is an abelian group.

**Construction and proof.**

1. Define toExterior as the lift of the bilinear map (a, b) ↦ exteriorPower.ιMulti ℤ 2 ![a, b], which kills a ⊗ b + b ⊗ a because ιMulti is alternating; it is surjective because the ιMulti span the exterior power (exteriorPower.ιMulti_span).
2. The kernel contains the classes a ∧ a because ιMulti ![a, a] = 0. For the reverse inclusion, v ↦ [v 0 ∧ v 1] is an alternating map from Fin 2 → A to antisymSquare ℤ A modulo the classes a ∧ a, so exteriorPower.alternatingMapLinearEquiv gives a map out of ⋀[ℤ]^2 A that is inverse to the map induced by toExterior (check on generators).
3. The map a ↦ a ∧ a is additive, since (a + b) ∧ (a + b) − a ∧ a − b ∧ b = a ∧ b + b ∧ a = 0, and it kills 2A; so it induces A/2A → antisymSquare ℤ A with image the classes a ∧ a.
4. Injectivity of the induced map: let V = ZMod 2 ⊗[ℤ] A = A/2A, choose a ZMod 2-basis e of V (Module.Basis.ofVectorSpace) and put β(a, b) = Σ_i e.coord_i(ā) e.coord_i(b̄) e_i. β is ℤ-bilinear and symmetric, and V has exponent two, so β(a, b) + β(b, a) = 0 and β descends to antisymSquare ℤ A → V. Since t² = t in ZMod 2, β(a, a) = ā, so the composite A/2A → antisymSquare ℤ A → V is the identity.
5. Record the consequence: antisymSquare ℤ A and ⋀[ℤ]^2 A differ by a group of exponent two, isomorphic to A/2A, which is the source of every 2-primary discrepancy between Bloch-group conventions.

**Acceptance.**

- For A cyclic of order two the kernel is cyclic of order two and the exterior square is trivial.
- For A uniquely 2-divisible the map is an isomorphism; this is why no 2-primary discrepancy appears rationally.
- For A the group of units of a finite field of odd order, A/2A is cyclic of order two.
- For A = ℤ/4, A/2A ≅ antisymSquare ℤ (ℤ/4) ≅ ℤ/2 while ⋀²(ℤ/4) = 0, which exercises the injectivity step on a group with 4-torsion.

**Imports.** [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient), [`mathlib:ExteriorAlgebra.exteriorPower`](#baseline-mathlib-exterioralgebra-exteriorpower), [`mathlib:exteriorPower.ιMulti`](#baseline-mathlib-exteriorpower--u3b9-multi), [`mathlib:exteriorPower.ιMulti_span`](#baseline-mathlib-exteriorpower--u3b9-multi-span), [`mathlib:exteriorPower.alternatingMapLinearEquiv`](#baseline-mathlib-exteriorpower-alternatingmaplinearequiv), [`mathlib:Module.Basis.ofVectorSpace`](#baseline-mathlib-module-basis-ofvectorspace), [`mathlib:TensorProduct`](#baseline-mathlib-tensorproduct), [`mathlib:ZMod`](#baseline-mathlib-zmod).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5, opening of the section (PDF p. 495).

<a id="v-3-five-term-relation"></a>

### V.3.3: The five-term relation

`K3BlochGroups:V.3/five-term-relation` · definition

For a field F and elements x, y of F with x and y outside the set consisting of 0 and 1 and with x different from y, the five-term element of the free abelian group on the symbols [z], z in F without 0, is [x] - [y] + [y/x] - [(1 - x^{-1})/(1 - y^{-1})] + [(1 - x)/(1 - y)]. The five-term subgroup is the subgroup generated by all these elements together with the element [1]. This is Suslin's normalisation, as presented in the K-book; the Calegari-Garoufalidis-Zagier normalisation indexes the same expression over the projective line and is compared in a separate node.

**Hypotheses.** F is a field; x and y lie in F, are different from 0 and 1, and are different from each other. The five arguments are then all defined and different from 0.

**Construction and proof.**

1. Check that each of the five arguments lies in F without 0 and 1 under the stated hypotheses: y/x ≠ 1 because x ≠ y, and the two quotients equal 1 only when x = y. So the expression is a well-formed element of the free abelian group.
2. Define the five-term subgroup as the subgroup generated by these elements and by [1] (the additive closure, the @[to_additive] twin of Subgroup.closure).
3. Record the degenerate conventions explicitly: [1] is set to zero, and the arguments 0 and infinity are excluded from the generators rather than silently given values.
4. Record the two substitutions the K-book uses (PDF p. 497): the pairs (1 − y, 1 − x) and (x^{-1}, y^{-1}) are admissible, and after simplifying their arguments the corresponding five-term elements are fiveTerm_oneSub and fiveTerm_inv. The derived relations in P(F) are proved in element-c and angle-bracket-two-torsion, where |F| ≥ 4 is available.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `fiveTerm` | constructor | The five-term element [x] − [y] + [y/x] − [(1 − x^{-1})/(1 − y^{-1})] + [(1 − x)/(1 − y)] attached to an admissible pair (x ≠ y, both in F − {0, 1}). |
| `fiveTermSubgroup` | data | The subgroup generated by all five-term elements and by [1]. |
| `fiveTerm_mem` | characterisation | Membership in the five-term subgroup as a finite integer combination of five-term elements and of [1]. |
| `fiveTerm_args_ne_zero` | other | For an admissible pair, the five arguments are nonzero. |
| `fiveTerm_args_ne_one` | other | For an admissible pair, the five arguments are different from 1. |
| `Admissible.oneSub` | constructor | If (x, y) is admissible then so is (1 − y, 1 − x). |
| `Admissible.inv` | constructor | If (x, y) is admissible then so is (x^{-1}, y^{-1}). |
| `fiveTerm_oneSub` | relation | fiveTerm (1 − y) (1 − x) = [1 − y] − [1 − x] + [(1 − x)/(1 − y)] − [(1 − x^{-1})/(1 − y^{-1})] + [y/x]. |
| `fiveTerm_inv` | relation | fiveTerm x^{-1} y^{-1} = [x^{-1}] − [y^{-1}] + [x/y] − [(1 − x)/(1 − y)] + [(1 − x^{-1})/(1 − y^{-1})]. |
| `fiveTerm_map` | functoriality | A field homomorphism sends five-term elements to five-term elements. |

**Unit tests.**

- `arguments_defined` (characterisation): For an admissible pair all five arguments are nonzero elements of F different from 1.
- `fiveTerm_sub_oneSub` (characterisation): In the free abelian group, fiveTerm x y − fiveTerm (1 − y) (1 − x) = [x] + [1 − x] − [y] − [1 − y].
- `fiveTerm_add_inv_add_swap` (characterisation): In the free abelian group, fiveTerm x y + fiveTerm x^{-1} y^{-1} + fiveTerm y x + fiveTerm y^{-1} x^{-1} = 2([y/x] + [x/y]).
- `fiveTerm_F4` (computation): Over F_4 with ω² + ω + 1 = 0, fiveTerm ω ω² = 3[ω] − 2[ω²].
- `diagonal` (degenerate): The defining formula evaluated at x = y equals [1], so a definition that silently admits the diagonal changes nothing, whereas one that admits y = 1 produces a division by zero.

**Uses.**

- V.3's pre-Bloch group: the pre-Bloch group is the quotient by exactly this subgroup.
- V.6's certificates: a certificate is a finite list of five-term instances with integer coefficients.
- V.4's configuration complex: the boundary of a 4-simplex of the configuration complex is a five-term element.

**Acceptance.**

- At x = y the five arguments are x, x, 1, 1, 1 and the expression is [1]. The source excludes the diagonal; including it would add only the relation [1]. The degenerate cases are x or y in {0, 1}, where 1 − y^{-1} or 1 − y vanishes.
- Over F_4 = {0, 1, ω, ω²} the admissible pairs are (ω, ω²) and (ω², ω); over F_3 there are none, because F_3 − {0, 1} = {−1}.
- The two substitution identities fiveTerm_oneSub and fiveTerm_inv hold in the free abelian group, which is the acceptance test for the normalisation.

**Imports.** [`mathlib:FreeAbelianGroup`](#baseline-mathlib-freeabeliangroup), [`mathlib:Subgroup.closure`](#baseline-mathlib-subgroup-closure).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.1 (PDF p. 495).

<a id="v-3-pre-bloch-group"></a>

### V.3.4: The pre-Bloch group

`K3BlochGroups:V.3/pre-bloch-group` · definition

For a field F define the pre-Bloch group P(F) as the abelian group presented by generators [x], one for each x in F without 0, subject to [1] = 0 and to all five-term relations. Equivalently it is the quotient of the free abelian group on F without 0 by the five-term subgroup.

**Hypotheses.** F is a field, of at least four elements wherever a statement of this section is invoked.

**Construction and proof.**

1. Form the free abelian group on the set of nonzero elements of F.
2. Quotient by the five-term subgroup (the additive quotient, the @[to_additive] twin of QuotientGroup.mk). Do not use PresentedGroup, which is a quotient of a free non-abelian group.
3. Prove the universal property from FreeAbelianGroup.lift: a homomorphism out of P(F) is the same as a function on generators killing [1] and every five-term element.
4. Prove functoriality in F: a field homomorphism induces a homomorphism of pre-Bloch groups, with map id = id and map (g ∘ h) = map g ∘ map h.
5. Record the degenerate-symbol convention: the generator set excludes 0, and [1] is zero. Record the equivalence with the presentation on F − {0, 1} used by the README and by the reserved-id statement. The symbols [0] and [∞] of the projective-line convention belong to cgz-bloch-group.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `preBloch` | data | The pre-Bloch group P(F). |
| `preBloch.gen` | constructor | The class [x] of a nonzero element x. |
| `preBloch.gen_one` | simp | [1] = 0. |
| `preBloch.fiveTerm` | relation | Every five-term element is zero in P(F). |
| `preBloch.lift` | universal-property | A function on nonzero elements killing [1] and all five-term elements extends uniquely to a homomorphism out of P(F). |
| `preBloch.lift_gen` | universal-property | lift f [x] = f x. |
| `preBloch.hom_ext` | extensionality | Two homomorphisms out of P(F) that agree on every generator [x] are equal. |
| `preBloch.induction_on` | characterisation | P(F) is generated by the classes [x]. |
| `preBloch.map` | functoriality | A field homomorphism induces a homomorphism of pre-Bloch groups, with map_id and map_comp. |
| `preBloch.equivAdmissible` | equivalence | P(F) ≃ the free abelian group on F − {0, 1} modulo the five-term elements. |

**Unit tests.**

- `one_is_zero` (degenerate): [1] = 0.
- `five_term_vanishes` (characterisation): A five-term element evaluates to zero.
- `preBloch_F2` (degenerate): P(F_2) = 0: its only generator is [1].
- `preBloch_F3` (degenerate): P(F_3) ≅ ℤ, free on [−1], since there is no admissible pair; a definition that forgot [1] = 0 would give ℤ².
- `preBloch_F4` (computation): P(F_4) ≅ ℤ/5, from the relations 3[ω] − 2[ω²] and 3[ω²] − 2[ω].
- `preBloch_F5` (computation): P(F_5) ≅ ℤ/6 on [3], with [2] = 2[3] and [4] = 0.

**Uses.**

- V.3's Bloch group: the Bloch group is the kernel of the boundary defined on P(F).
- V.4's configuration complex: the degree-three homology of the coinvariant complex is identified with P(F).
- V.6's constructors: an explicit Bloch element is produced as a finite combination of generators of P(F) with vanishing boundary.

**Acceptance.**

- [1] is zero in P(F).
- P(F_4) ≅ ℤ/5 on [ω], with [ω²] = −[ω], so the presentation is not vacuous.
- P(F_5) ≅ ℤ/6 on [3], with [2] = 2[3] and [4] = 0; the relations are [4], 3[2] − 2[4] and 2[3] − [2].

**Imports.** [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`mathlib:FreeAbelianGroup`](#baseline-mathlib-freeabeliangroup), [`mathlib:FreeAbelianGroup.lift`](#baseline-mathlib-freeabeliangroup-lift), [`mathlib:QuotientGroup.mk`](#baseline-mathlib-quotientgroup-mk).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.1 (PDF p. 495).

<a id="v-3-bloch-boundary"></a>

### V.3.5: The boundary of the pre-Bloch group

`K3BlochGroups:V.3/bloch-boundary` · construction

Construct the homomorphism from P(F) to the antisymmetric tensor quotient of the group of units of F sending [x] to x wedge (1 - x) for x different from 1, and [1] to 0. The sign convention is the one displayed here; the opposite sign gives the same kernel but a different map, and the choice is recorded rather than left implicit.

**Hypotheses.** F is a field. The target is the antisymmetric tensor quotient of the multiplicative group of F, written additively.

**Construction and proof.**

1. Define the map on generators by the displayed formula, using the additive type tag on the units, with [1] ↦ 0.
2. Verify that every five-term element maps to zero. Write the arguments over x, y, 1 − x, 1 − y and x − y: 1 − y/x = (x − y)/x; (1 − x^{-1})/(1 − y^{-1}) = y(1 − x)/(x(1 − y)) with complement (x − y)/(x(1 − y)); 1 − (1 − x)/(1 − y) = (x − y)/(1 − y). Expand bilinearly. The terms u ∧ u that survive in the antisymmetric quotient cancel exactly: +x ∧ x from the third term, −x ∧ x − (1 − y) ∧ (1 − y) from the fourth, +(1 − y) ∧ (1 − y) from the fifth. The remaining terms cancel in pairs by antisymmetry. The identity therefore holds in the antisymmetric quotient, and a fortiori in the exterior square.
3. Conclude by the universal property of P(F) that the map descends.
4. Prove naturality in F.
5. Compute the boundary of the two derived elements: ∂([x] + [1 − x]) = x ∧ (1 − x) + (1 − x) ∧ x = 0; and ∂([x] + [x^{-1}]) = x ∧ (−x), using 1 − x^{-1} = (−1)(1 − x)x^{-1}, bilinearity, and that x ∧ (−1) has order dividing two.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `blochBoundary` | constructor | The homomorphism P(F) → antisymSquare ℤ (Additive Fˣ). |
| `blochBoundary_gen` | simp | The boundary of [x] is x ∧ (1 − x) for x ≠ 0, 1. |
| `blochBoundary_one` | simp | The boundary of [1] is zero. |
| `blochBoundary_c` | relation | ∂([x] + [1 − x]) = 0 for x ∈ F − {0, 1}. |
| `blochBoundary_angle` | relation | ∂([x] + [x^{-1}]) = x ∧ (−x) for x ∈ Fˣ. |
| `blochBoundary_map` | functoriality | The boundary commutes with the maps induced by a field homomorphism. |
| `blochBoundary_comp_exterior` | compatibility | Composing with antisymSquare.toExterior gives the classical boundary [x] ↦ x ∧ (1 − x) in ⋀[ℤ]^2 (Additive Fˣ). |

**Unit tests.**

- `five_term_to_zero` (characterisation): The boundary of a five-term element is zero.
- `sign_convention` (non-example): Over ℚ, β(∂[3]) = −1 for the alternating form β(a, b) = v_2(a)v_3(b) − v_3(a)v_2(b), so ∂[3] = 3 ∧ (−2) and not (−2) ∧ 3.
- `compatible_with_exterior` (compatibility): The composite with antisymSquare.toExterior is [x] ↦ x ∧ (1 − x) in ⋀[ℤ]^2 (Additive Fˣ).
- `not_injective` (computation): Over F_5, ∂ maps P(F_5) ≅ ℤ/6 onto antisymSquare ℤ (Additive F_5ˣ) ≅ ℤ/2 with kernel ℤ/3: ∂[3] = 3 ∧ 3 ≠ 0 and ∂[2] = 0.
- `angle_boundary` (computation): Over F_5, ∂([2] + [3]) = 2 ∧ 3 ≠ 0, so the angle-bracket element at 2 is not a Bloch element.

**Uses.**

- V.3's Bloch group: the Bloch group is its kernel.
- V.3's four-term exact sequence: its cokernel is identified with K_2(F).
- V.6's constructors: an element is admitted only when its boundary is proved to vanish.

**Acceptance.**

- ∂([x] + [1 − x]) = 0. The sign is pinned over ℚ instead: under the alternating form β(a, b) = v_2(a)v_3(b) − v_3(a)v_2(b), β(∂[3]) = β(3, −2) = −1, whereas β((−2) ∧ 3) = +1.
- The five-term element maps to zero, checked symbolically over the free abelian group on x, y, 1 − x, 1 − y, x − y.
- The composite with the surjection onto the exterior square is the classical Bloch boundary, which is the map used by the Calegari-Garoufalidis-Zagier convention.

**Imports.** [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.1 (PDF p. 495).

<a id="v-3-bloch-group"></a>

### V.3.6: The Bloch group in Suslin's convention

`K3BlochGroups:V.3/bloch-group` · definition

Define B(F), Suslin's Bloch group, as the kernel of the boundary from P(F) to the antisymmetric tensor quotient of the units of F. It is a subgroup of P(F), not a quotient, and the target of the boundary is the antisymmetric quotient rather than the exterior square.

**Hypotheses.** F is a field, of at least four elements wherever a theorem of this section is applied.

**Construction and proof.**

1. Take the kernel of the boundary constructed above.
2. Prove functoriality: a field homomorphism carries the kernel into the kernel.
3. Record membership as the statement that a finite combination of generators has vanishing boundary; this is the form the V.6 constructors consume.
4. Record that quotient-then-kernel (the K-book) agrees with kernel-then-quotient (the kernel of the lifted boundary on the free abelian group, modulo the five-term subgroup), because the five-term subgroup lies in that kernel. The genuine differences from the Calegari-Garoufalidis-Zagier convention are the generator set (the projective line against Fˣ) and the target (the exterior square against the antisymmetric quotient).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `blochGroup` | data | The subgroup B(F) of P(F). |
| `blochGroup.mem_iff` | characterisation | An element lies in B(F) exactly when its boundary vanishes. |
| `blochGroup.map` | functoriality | A field homomorphism induces a homomorphism of Bloch groups. |
| `blochGroup.coe` | coercion | The inclusion of B(F) into P(F). |
| `blochGroup.ext` | extensionality | Two elements of B(F) are equal exactly when their images in P(F) are. |

**Unit tests.**

- `bloch_F5` (computation): B(F_5) ≅ ℤ/3, generated by c = [2]; [2] ∈ B(F_5) and [3] ∉ B(F_5).
- `bloch_F7` (computation): B(F_7) ≅ ℤ/4, generated by [−1] = 2[3].
- `bloch_F4` (degenerate): B(F_4) = P(F_4) ≅ ℤ/5, because antisymSquare ℤ (Additive F_4ˣ) = 0.
- `exterior_target_nonexample` (non-example): B(F_5) has order 3, whereas the kernel of P(F_5) → ⋀²(F_5ˣ) = 0 is all of P(F_5), of order 6; and [−1] ∉ B(F_3). A definition with the exterior square as target fails both.
- `c_lies_in_B` (characterisation): The element [x] + [1 - x] lies in B(F) for every admissible x.

**Uses.**

- V.4's Suslin exact sequence: the right-hand term of the sequence is this group.
- Polylogarithms P.2: the Bloch-Wigner function is descended through exactly this convention, as that layer states.
- HabiroNumberFields HB.1: the convention comparison consumed there is between this group and the Calegari-Garoufalidis-Zagier group.

**Acceptance.**

- For the rational numbers B(F) is cyclic of order six, generated by the class of [2] + [-1]; this is proved in V.5/k3-Q-splitting, not here.
- For the field with two elements the group is trivial and for the field with three elements it is infinite cyclic; both are excluded by the standing hypothesis and computed in small-field-conventions.
- An element of B(F) has vanishing boundary by definition, so the constructor of V.6 cannot produce a class without a proof.

**Imports.** [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.1 (PDF p. 495).

<a id="v-3-bloch-four-term-exact"></a>

### V.3.7: The four-term exact sequence of the Bloch group

`K3BlochGroups:V.3/bloch-four-term-exact` · theorem

For every field F the sequence 0 -> B(F) -> P(F) -> antisymSquare of the units of F -> K_2(F) -> 0 is exact. In particular the cokernel of the boundary is Matsumoto's presentation of K_2(F).

**Hypotheses.** F is a field.

**Construction and proof.**

1. Exactness at B(F) and at P(F) is the definition of the kernel.
2. Define antisymSquare ℤ (Additive Fˣ) → K_2(F) by a ∧ b ↦ {a, b}: the symbol map Fˣ ⊗ Fˣ → K_2^M(F) ≅ K_2(F) (Matsumoto, from K2SymbolsBrauer T.2:symbols) kills a ⊗ b + b ⊗ a because {a, b} = −{b, a} (also from T.2:symbols), so it descends by antisymSquare.lift.
3. The map is surjective because the symbols generate K_2^M(F).
4. Exactness at the antisymmetric quotient: the kernel of Fˣ ⊗ Fˣ → K_2^M(F) is the Steinberg subgroup St generated by the x ⊗ (1 − x), which contains the symmetrised elements by step 2. So the kernel on the quotient is St modulo the symmetrised elements, which is generated by the x ∧ (1 − x) = ∂[x], i.e. it is the image of ∂.

**Acceptance.**

- For F_5, ∂ : P(F_5) ≅ ℤ/6 → antisymSquare ℤ (Additive F_5ˣ) ≅ ℤ/2 is onto (∂[3] ≠ 0), B(F_5) ≅ ℤ/3, and K_2(F_5) = 0.
- For F_3, ∂[−1] = (−1) ∧ (−1) generates antisymSquare ℤ (Additive F_3ˣ) ≅ ℤ/2, B(F_3) = 2P(F_3) ≅ ℤ and K_2(F_3) = 0, so the sequence also holds for the small fields.
- With the exterior square in place of the antisymmetric quotient, the cokernel of the boundary is K_2(F)/{−1, Fˣ}, because {a, a} = {a, −1}. This differs from K_2(F) for F = ℚ ({−1, −1} ≠ 0), and the kernel becomes the larger group of exterior-kernel-bloch-group.

**Imports.** [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.1 (PDF p. 495).

<a id="v-3-element-c"></a>

### V.3.8: The element c of B(F)

`K3BlochGroups:V.3/element-c` · construction

Let F have at least four elements. For x ≠ y in F − {0, 1}, [x] + [1 − x] = [y] + [1 − y] in P(F). The common value c lies in B(F), since ∂c = x ∧ (1 − x) + (1 − x) ∧ x = 0 in the antisymmetric quotient. Define c ∈ B(F) as this element. Part (b) of the source lemma, on the elements ⟨x⟩, is angle-bracket-two-torsion; those elements need not lie in B(F).

**Hypotheses.** F is a field with at least four elements. x lies in F and is different from 0 and 1.

**Construction and proof.**

1. For x ≠ y in F − {0, 1} the pair (1 − y, 1 − x) is admissible, and the five-term relation there is fiveTerm_oneSub: its fourth argument (1 − (1 − y)^{-1})/(1 − (1 − x)^{-1}) simplifies to y(1 − x)/(x(1 − y)) = (1 − x^{-1})/(1 − y^{-1}), and its fifth argument to y/x.
2. Subtract it from the relation at (x, y) to get [x] + [1 − x] − [y] − [1 − y] = 0.
3. Define c as the class of [x] + [1 − x] for any x ∈ F − {0, 1}; by the previous step it is independent of x.
4. ∂c = x ∧ (1 − x) + (1 − x) ∧ x = 0 by antisymmetry (blochBoundary_c), so c ∈ B(F).
5. Naturality: a field homomorphism F → E sends c_F to c_E; compute both with x and with its image.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `BlochGroup.c` | data | The element c ∈ B(F), for \|F\| ≥ 4. |
| `BlochGroup.c_eq` | characterisation | c = [x] + [1 − x] in P(F) for every x ∈ F − {0, 1}. |
| `BlochGroup.c_mem` | relation | The class [x] + [1 − x] lies in B(F). |
| `BlochGroup.map_c` | functoriality | A field homomorphism sends c to c. |

**Unit tests.**

- `c_F5` (computation): Over F_5, c = [2] = 2[3], of order 3 in B(F_5) ≅ ℤ/3.
- `c_F7` (computation): Over F_7, c = 2[−1] = 2[4] ≠ 0, of order 2 in B(F_7) ≅ ℤ/4; in particular c ≠ [4].
- `c_F11` (computation): Over F_11, c has order 6 and generates B(F_11) ≅ ℤ/6.
- `c_F4` (degenerate): Over F_4, c = 0.

**Uses.**

- V.4/symmetric-group-image: the image of the homology of the symmetric groups is generated by 2c.
- V.3/cgz-convention-comparison: κ(c) = [0], which is 3-torsion in the CGZ convention.
- V.3/c-characteristic-torsion and V.3/three-c-angle-minus-one: the order of c.

**Acceptance.**

- c is independent of x, checked on all admissible x in F_5, F_7 and F_11.
- c ∈ B(F) even though the individual generators need not be: over F_5, [3] ∉ B(F_5).
- Over F_3 (excluded) c = 2[−1] is still defined, but it has infinite order.

**Imports.** [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.4 (a) (PDF p. 496); [Kbook.2013](#source-0-kbook-2013) — Proof of VI.5.4 (PDF p. 497); [Kbook.2013](#source-0-kbook-2013) — Proof of VI.5.4 (PDF p. 497).

<a id="v-3-bloch-wigner-dilogarithm"></a>

### V.3.9: The Bloch-Wigner function, imported, and its vanishing on real points

`K3BlochGroups:V.3/bloch-wigner-dilogarithm` · comparison

The Bloch-Wigner function D of this roadmap is Polylogarithms:P.1/bloch-wigner-dilogarithm, imported unchanged; its definition, branch conventions and continuity are owned there. What V.3 records is the consequence it needs for its torsion warning: D vanishes on P^1(ℝ), because D(z̄) = −D(z) and D is continuous. So D is zero on every class coming from P(ℝ), in particular on c ∈ B(ℚ). It cannot detect the order of c; the Rogers dilogarithm, built from Li_2 on the real line, does.

**Hypotheses.** D is the function of Polylogarithms:P.1/bloch-wigner-dilogarithm.

**Construction and proof.**

1. Import D and its conjugation relation from Polylogarithms:P.1/bloch-wigner-dilogarithm.
2. For real z, D(z) = D(z̄) = −D(z), so D(z) = 0; at 0, 1 and ∞ D vanishes by definition.
3. Record the consequence for V.3 and V.5: the regulator built from D is zero on the image of B(ℚ) and B(ℝ), so it cannot bound the order of c from below.

**Uses.**

- V.3's torsion warning: D kills torsion and all real classes, so agreement under D is not evidence of agreement integrally.
- Polylogarithms P.2: the weight-two regulator is D descended through the V.3 convention; the descent is P.2/bloch-wigner-descent.

**Acceptance.**

- D vanishes at every real point and at infinity.
- D(i) is Catalan's constant 0.9159655…, a nonreal point where D is nonzero (checked numerically).
- No construction of D is made in this node: its only analytic prerequisite is the owning node.

**Imports.** [`Polylogarithms:P.1/bloch-wigner-dilogarithm`](../packets/Polylogarithms.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.2.1 (PDF p. 496).

<a id="v-3-small-field-conventions"></a>

### V.3.10: The small finite fields, computed from the presentation

`K3BlochGroups:V.3/small-field-conventions` · lemma

P(F_2) = B(F_2) = 0. P(F_3) is infinite cyclic on [−1], since there is no admissible pair; ∂[−1] = (−1) ∧ (−1) is the generator of antisymSquare ℤ (Additive F_3ˣ) ≅ ℤ/2, so B(F_3) = 2P(F_3) is infinite cyclic, generated by ⟨−1⟩ = 2[−1] = c. For these two fields the |F| ≥ 4 statements of this layer fail: 2⟨−1⟩ ≠ 0 and 3c ≠ ⟨−1⟩ in P(F_3). Directly from the presentation: B(F_4) = P(F_4) ≅ ℤ/5; P(F_5) ≅ ℤ/6 on [3] and B(F_5) ≅ ℤ/3 on c = [2] = 2[3], with [−1] = 0 and [3] ∉ B(F_5); P(F_7) ≅ ℤ/8 on [3] and B(F_7) ≅ ℤ/4 on [−1] = 2[3], with c = 2[−1] = 2[4]. The general formula for q > 3 is V.5/bloch-group-finite-field and is not used here.

**Hypotheses.** F is a finite field with 2, 3, 4, 5 or 7 elements.

**Construction and proof.**

1. List the five-term relations: none for F_2 and F_3; for F_4, 3[ω] − 2[ω²] and 3[ω²] − 2[ω]; for F_5, [4], 3[2] − 2[4] and 2[3] − [2] (the other three coincide with these); for F_7, the twenty relations of the pairs x ≠ y in {2, …, 6}.
2. For each field, define an explicit homomorphism from P(F) to ℤ/n (or ℤ) on generators, check that it kills [1] and the listed relations, and give the inverse from a generator whose order is checked from the relations.
3. Compute the target: antisymSquare ℤ (ℤ/m) ≅ ℤ/gcd(2, m), generated by g ∧ g for a generator g of Fˣ, so ∂[x] = dlog(x) · dlog(1 − x) · (g ∧ g).
4. Read off B(F) as the kernel of ∂ on each computed P(F).

**Acceptance.**

- The |F| ≥ 4 conclusions fail at F_3: ⟨−1⟩ = 2[−1] has infinite order.
- The orders 5, 3 and 4 for F_4, F_5 and F_7 are consistent with V.5/bloch-group-finite-field; this is a check, not a proof of the general formula.
- The V.3 stage requirement that small finite fields have separate calculations is met without Suslin's theorem.

**Imports.** [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient), [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`mathlib:ZMod`](#baseline-mathlib-zmod), [`mathlib:GaloisField`](#baseline-mathlib-galoisfield).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.1.1 (PDF p. 495); [Kbook.2013](#source-0-kbook-2013) — Exercise VI.5.3 (PDF p. 508).

<a id="v-3-angle-bracket-two-torsion"></a>

### V.3.11: The difference relation and two-torsion of the angle-bracket elements

`K3BlochGroups:V.3/angle-bracket-two-torsion` · lemma

Let F have at least four elements and write ⟨x⟩ = [x] + [x^{-1}] ∈ P(F). For x ≠ y in F − {0, 1}, ⟨y⟩ − ⟨x⟩ = ⟨y/x⟩ in P(F). For every x ∈ Fˣ, 2⟨x⟩ = 0 in P(F). These are statements in P(F): ⟨x⟩ need not lie in B(F).

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. For x ≠ y in F − {0, 1} the pair (x^{-1}, y^{-1}) is admissible, and its five-term relation is fiveTerm_inv.
2. Add it to the relation at (x, y). Using ⟨y/x⟩ = [y/x] + [x/y], this gives ⟨x⟩ − ⟨y⟩ + ⟨y/x⟩ = 0, i.e. ⟨y⟩ − ⟨x⟩ = ⟨y/x⟩.
3. Interchange x and y: ⟨x⟩ − ⟨y⟩ = ⟨x/y⟩ = ⟨y/x⟩. Adding the two relations gives 2⟨y/x⟩ = 0.
4. Given z ∈ F − {0, 1}, choose x ∈ F − {0, 1, z^{-1}}, which exists because |F| ≥ 4, and put y = zx. Then y ∈ F − {0, 1}, y ≠ x and y/x = z, so 2⟨z⟩ = 0.
5. For z = 1, ⟨1⟩ = 2[1] = 0.

**Acceptance.**

- In P(F_13) ≅ ℤ/14, ⟨x⟩ ∈ {0, 7} for every x (checked by computing).
- The hypothesis is necessary: in P(F_3) ≅ ℤ, ⟨−1⟩ = 2[−1] has infinite order.
- ⟨2⟩ ∉ B(F_5), so the lemma is about P(F) and not about B(F).

**Imports.** [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.4 (b) (PDF p. 496); [Kbook.2013](#source-0-kbook-2013) — Proof of VI.5.4 (PDF p. 497).

<a id="v-3-angle-bracket-homomorphism"></a>

### V.3.12: The angle-bracket homomorphism into the pre-Bloch group

`K3BlochGroups:V.3/angle-bracket-homomorphism` · lemma

Let F have at least four elements and write ⟨x⟩ = [x] + [x^{-1}] ∈ P(F). The map x ↦ ⟨x⟩ is a group homomorphism from Additive Fˣ to P(F). Its image is an elementary abelian 2-group, and it sends squares to zero. ⟨x⟩ lies in B(F) if and only if x ∧ (−x) = 0 in antisymSquare ℤ (Additive Fˣ), because ∂⟨x⟩ = x ∧ (−x). For example ⟨−1⟩ ∈ B(F), but ⟨2⟩ ∉ B(F_5). The K-book states the target as B(F); the correct target is P(F), see the source issues.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. ⟨1⟩ = 2[1] = 0 and ⟨a^{-1}⟩ = ⟨a⟩.
2. For a, b ∈ Fˣ − {1} with ab ≠ 1, put x = a^{-1} and y = b. Then x ≠ y and both lie in F − {0, 1}, so angle-bracket-two-torsion gives ⟨ab⟩ = ⟨y/x⟩ = ⟨y⟩ − ⟨x⟩ = ⟨b⟩ − ⟨a⟩ = ⟨a⟩ + ⟨b⟩, using 2⟨a⟩ = 0.
3. If ab = 1 then ⟨ab⟩ = 0 = 2⟨a⟩ = ⟨a⟩ + ⟨b⟩; if a = 1 or b = 1 the identity is immediate.
4. Squares: ⟨z²⟩ = 2⟨z⟩ = 0.
5. Boundary: ∂⟨x⟩ = x ∧ (−x) by blochBoundary_angle; so ⟨x⟩ ∈ B(F) exactly when x ∧ (−x) = 0. For x = −1, (−1) ∧ 1 = 0.

**Acceptance.**

- In P(F_13) ≅ ℤ/14 the image of x ↦ ⟨x⟩ is {0, 7}, and the homomorphism property holds for all a, b (checked by computing).
- ⟨2⟩ = [2] + [3] ∉ B(F_5): ∂⟨2⟩ = 2 ∧ 3 is the nonzero element of antisymSquare ℤ (Additive F_5ˣ) ≅ ℤ/2. This is the counterexample to the target B(F).
- The homomorphism sends a square to zero.

**Imports.** [`K3BlochGroups:V.3/angle-bracket-two-torsion`](#v-3-angle-bracket-two-torsion), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.4 (c) (PDF p. 496); [Kbook.2013](#source-0-kbook-2013) — Before VI.5.4 (PDF p. 496).

<a id="v-3-three-c-angle-minus-one"></a>

### V.3.13: Three times c is the angle-bracket element at −1

`K3BlochGroups:V.3/three-c-angle-minus-one` · lemma

Let F have at least four elements. Then 3c = ⟨−1⟩ in P(F); both sides lie in B(F), and 6c = 0 in B(F).

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. For x ∈ F − {0, 1}, the elements x^{-1} and (1 − x)^{-1} also lie in F − {0, 1}, so by element-c, 3c = ([x] + [1 − x]) + ([x^{-1}] + [1 − x^{-1}]) + ([(1 − x)^{-1}] + [1 − (1 − x)^{-1}]).
2. Regroup: [x] + [x^{-1}] = ⟨x⟩ and [1 − x] + [(1 − x)^{-1}] = ⟨1 − x⟩; and 1 − x^{-1} = −(1 − x)/x and 1 − (1 − x)^{-1} = −x/(1 − x) are mutually inverse, so the remaining two terms form ⟨1 − x^{-1}⟩.
3. By angle-bracket-homomorphism, ⟨x⟩ + ⟨1 − x⟩ + ⟨1 − x^{-1}⟩ = ⟨x(1 − x)(1 − x^{-1})⟩ = ⟨−(1 − x)²⟩ = ⟨−1⟩ + 2⟨1 − x⟩ = ⟨−1⟩.
4. ∂⟨−1⟩ = (−1) ∧ 1 = 0 and ∂c = 0, so both lie in B(F); and 6c = 2⟨−1⟩ = 0 by angle-bracket-two-torsion.

**Acceptance.**

- Over F_11, c has order exactly 6 in B(F_11) ≅ ℤ/6, so 6c = 0 cannot be improved in general (as over ℚ, K-book Remark 5.2.1).
- Over F_7, 3c = c = ⟨−1⟩ = 2[−1] ≠ 0.
- Over F_3 (excluded), c = ⟨−1⟩ = 2[−1] has infinite order, so 3c ≠ ⟨−1⟩: the hypothesis is needed.

**Imports.** [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism), [`K3BlochGroups:V.3/angle-bracket-two-torsion`](#v-3-angle-bracket-two-torsion), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.4 (d) (PDF p. 496); [Kbook.2013](#source-0-kbook-2013) — Proof of VI.5.4 (PDF p. 497).

<a id="v-3-c-characteristic-torsion"></a>

### V.3.14: When c has smaller order

`K3BlochGroups:V.3/c-characteristic-torsion` · lemma

Let F have at least four elements. (i) If char F = 2 or F contains a square root of −1, then 3c = 0 in B(F). (ii) If F contains a root ζ of t² − t + 1 (a primitive sixth root of unity when char F ≠ 3, and ζ = −1 when char F = 3), then c = ⟨ζ⟩ and 2c = 0 in B(F). The K-book's '∛−1 ∈ F' means such a ζ: −1 itself is always a cube root of −1. Neither statement says that c = 0; c = 0 when both hypotheses hold.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. (i) 3c = ⟨−1⟩ by three-c-angle-minus-one. In characteristic two −1 = 1 and ⟨1⟩ = 2[1] = 0. If i² = −1 then ⟨−1⟩ = ⟨i⟩ + ⟨i⟩ = 2⟨i⟩ = 0, by angle-bracket-homomorphism and angle-bracket-two-torsion.
2. (ii) ζ ∉ {0, 1}, because 0² − 0 + 1 = 1² − 1 + 1 = 1 ≠ 0. Also ζ(1 − ζ) = ζ − ζ² = 1, so 1 − ζ = ζ^{-1}. By element-c, c = [ζ] + [1 − ζ] = [ζ] + [ζ^{-1}] = ⟨ζ⟩, and 2⟨ζ⟩ = 0 by angle-bracket-two-torsion.
3. In characteristic three t² − t + 1 = (t + 1)², so ζ = −1 and the hypothesis char F = 3 is the case ζ = −1 of (ii).
4. State the two hypotheses separately: a claim that c always has order six is false, and so is the literal reading in which −1 counts as a cube root of −1.

**Acceptance.**

- F_5 (√−1 = 2): c = [2] has order exactly 3 in B(F_5) ≅ ℤ/3.
- F_7 (ζ = 3): c = 2[−1] has order exactly 2 in B(F_7) ≅ ℤ/4.
- F_11 (neither hypothesis): c has order exactly 6 and generates B(F_11) ≅ ℤ/6, which refutes the literal reading.
- F_4, F_9, F_13 (both hypotheses): c = 0.

**Imports.** [`K3BlochGroups:V.3/three-c-angle-minus-one`](#v-3-three-c-angle-minus-one), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism), [`K3BlochGroups:V.3/angle-bracket-two-torsion`](#v-3-angle-bracket-two-torsion), [`K3BlochGroups:V.3/element-c`](#v-3-element-c).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.4.1 (PDF p. 497).

<a id="v-3-exterior-kernel-bloch-group"></a>

### V.3.15: The Bloch group with the exterior square as target

`K3BlochGroups:V.3/exterior-kernel-bloch-group` · definition

For a field F let B̃(F) be the kernel of P(F) → ⋀[ℤ]^2 (Additive Fˣ), [x] ↦ x ∧ (1 − x), the composite of the boundary with antisymSquare.toExterior. This is the group CGZ's Definition 2.1 calls Suslin's Bloch group. It contains this layer's B(F), and it is in general larger.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Compose blochBoundary with antisymSquare.toExterior and take the kernel.
2. B(F) ⊆ B̃(F) because the composite factors through the boundary.
3. Functoriality in F from that of the boundary and of toExterior.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `extBloch` | data | The subgroup B̃(F) of P(F). |
| `mem_extBloch_iff` | characterisation | z ∈ B̃(F) iff toExterior (∂z) = 0. |
| `blochGroup_le_extBloch` | compatibility | B(F) ≤ B̃(F). |
| `extBloch.map` | functoriality | A field homomorphism maps B̃(F) into B̃(E). |

**Unit tests.**

- `ext_F5` (non-example): B̃(F_5) = P(F_5) ≅ ℤ/6, because ⋀² of a cyclic group is zero, while B(F_5) ≅ ℤ/3.
- `ext_F3` (degenerate): B̃(F_3) = P(F_3) ≅ ℤ, while B(F_3) = 2P(F_3).
- `ext_C` (compatibility): B̃(ℂ) = B(ℂ), because ℂˣ is 2-divisible, so toExterior is an isomorphism for Additive ℂˣ.
- `angle_two_Q` (non-example): ⟨2⟩ ∉ B̃(ℚ): its exterior boundary 2 ∧ (−1) is detected by the alternating form (a, b) ↦ s(a)v_2(b) − s(b)v_2(a) mod 2, where s is the sign.

**Uses.**

- V.3/cgz-convention-comparison: the comparison κ factors through this group.
- README V.3 handoff row: 'give explicit comparison homomorphisms to the exterior-square convention and compute their 2-primary discrepancy'.

**Acceptance.**

- B̃(F_5) ≅ ℤ/6 while B(F_5) ≅ ℤ/3.
- B̃(ℂ) = B(ℂ).
- ⟨2⟩ ∉ B̃(ℚ).

**Imports.** [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`mathlib:ExteriorAlgebra.exteriorPower`](#baseline-mathlib-exterioralgebra-exteriorpower).

**Sources.** [CGZ.2018](#source-0-cgz-2018) — Definition 2.1, §2.1, p. 8.

<a id="v-3-exterior-kernel-discrepancy"></a>

### V.3.16: The two-primary discrepancy between the antisymmetric and exterior targets

`K3BlochGroups:V.3/exterior-kernel-discrepancy` · theorem

For every field F there is an exact sequence 0 → B(F) → B̃(F) → Fˣ/Fˣ² → K_2(F), where ξ maps to the class a with ∂ξ = a ∧ a, and a maps to {−1, a}. Hence B̃(F)/B(F) ≅ {a ∈ Fˣ/Fˣ² : {−1, a} = 0 in K_2(F)}: this is Fˣ/Fˣ² for finite F, and zero when Fˣ is 2-divisible.

**Hypotheses.** F is a field.

**Construction and proof.**

1. ∂ maps B̃(F) into the kernel of toExterior, which is the group of classes a ∧ a, isomorphic to Fˣ/Fˣ² by antisym-exterior-comparison. The kernel of the induced map is B(F).
2. The image is ∂P(F) ∩ {a ∧ a}, which by the four-term exact sequence is the kernel of {a ∧ a} → K_2(F).
3. Under the map to K_2(F), a ∧ a goes to {a, a} = {a, −1} (the formula for {a, a} from K2SymbolsBrauer T.2:symbols).

**Acceptance.**

- F_5: B̃(F_5)/B(F_5) ≅ ℤ/2 = F_5ˣ/F_5ˣ², since K_2(F_5) = 0.
- ℚ: the class of 2 lies in the image ({−1, 2} = 0 because 2 = 1 − (−1)), so B̃(ℚ) ≠ B(ℚ); the class of −1 does not ({−1, −1} ≠ 0).
- ℂ: the quotient is zero.

**Imports.** [`K3BlochGroups:V.3/bloch-four-term-exact`](#v-3-bloch-four-term-exact), [`K3BlochGroups:V.3/antisym-exterior-comparison`](#v-3-antisym-exterior-comparison), [`K3BlochGroups:V.3/exterior-kernel-bloch-group`](#v-3-exterior-kernel-bloch-group), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5, opening of the section (PDF p. 495); [Kbook.2013](#source-0-kbook-2013) — VI.5.1 (PDF p. 495).

<a id="v-3-cgz-bloch-group"></a>

### V.3.17: The Calegari-Garoufalidis-Zagier Bloch group

`K3BlochGroups:V.3/cgz-bloch-group` · definition

Let Z(F) be the free abelian group on P^1(F) = F ∪ {∞}. Let d : Z(F) → ⋀[ℤ]^2 (Additive Fˣ) be [X] ↦ X ∧ (1 − X), with [0], [1], [∞] ↦ 0, and A(F) = ker d. Let ⟨ξ⟩ be the subgroup generated by the elements ξ_{X,Y} = [X] − [Y] + [Y/X] − [(1 − X^{-1})/(1 − Y^{-1})] + [(1 − X)/(1 − Y)] for X, Y ∈ P^1(F) with no argument of the form 0/0 or ∞/∞. The arithmetic of P^1 is: a/0 = ∞ for a ≠ 0, a/∞ = 0 for a ≠ ∞, 1 − ∞ = ∞, 0^{-1} = ∞, ∞^{-1} = 0. Define B_CGZ(F) = A(F)/(A(F) ∩ ⟨ξ⟩), the image of A(F) in Z(F)/⟨ξ⟩. This is CGZ's Definition 1.1 with C(F) read as A(F) ∩ ⟨ξ⟩. As printed, C(F) ⊆ A(F) fails: ξ_{2,1} = [2] + [1/2] − [1] is allowed and d ξ_{2,1} = 2 ∧ (−1) ≠ 0 in ⋀²(ℚˣ).

Here the inherited CGZ object is **B_CGZ,old**, with exterior target and image of raw cycles. The published negative-target object is [B_CGZ,new](#v-3-cgz-published-bloch-group).

**Hypotheses.** F is a field.

**Construction and proof.**

1. Define the arithmetic of P^1(F) and the index set of pairs (X, Y) whose arguments contain no 0/0 or ∞/∞.
2. Define d, A(F), the subgroup ⟨ξ⟩, and B_CGZ(F) as the image of A(F) in Z(F)/⟨ξ⟩.
3. Functoriality: a field homomorphism induces a map of projective lines compatible with d and with the ξ_{X,Y}.
4. Record the relations in B_CGZ(F): [1] = 0 (from ξ_{X,X}, or ξ_{1,0} = [1]); [0] = the image of c (from ξ_{X,0} = c − [0]); [∞] = −[0] (from ξ_{0,1} = [0] − [1] + [∞]); 3[0] = 0 (from ξ_{0,∞} = 2[0] − [∞]).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `cgzBloch` | data | The group B_CGZ(F). |
| `cgzBloch.mk` | constructor | The class of an element of A(F). |
| `cgzBloch.gen_one` | simp | [1] = 0. |
| `cgzBloch.gen_infty` | relation | [∞] = −[0]. |
| `cgzBloch.three_zero` | relation | 3[0] = 0. |
| `cgzBloch.xi_mem` | relation | An admissible ξ_{X,Y} that lies in A(F) is zero in B_CGZ(F). |
| `cgzBloch.map` | functoriality | A field homomorphism induces B_CGZ(F) → B_CGZ(E), with map_id and map_comp. |

**Unit tests.**

- `cgz_F2` (degenerate): B_CGZ(F_2) ≅ ℤ/3, generated by [0], whereas B(F_2) = 0.
- `cgz_F5` (computation): B_CGZ(F_5) ≅ ℤ/3, with [0] of order 3 and [1] = 0.
- `cgz_F11` (computation): B_CGZ(F_11) ≅ ℤ/6, with [0] of order 3.
- `xi_21_not_in_A` (non-example): ξ_{2,1} = [2] + [1/2] − [1] ∉ A(ℚ): d ξ_{2,1} = 2 ∧ (−1), detected by (a, b) ↦ s(a)v_2(b) − s(b)v_2(a) mod 2. So C(F) := ⟨ξ⟩ taken literally is not a subgroup of A(F).

**Uses.**

- V.3/cgz-convention-comparison: the target of κ.
- HabiroNumberFields HB.1: the convention of the CGZ statements consumed there.

**Acceptance.**

- [1] = 0, [∞] = −[0] and 3[0] = 0 hold in B_CGZ(F).
- Over finite fields ⋀²(Fˣ) = 0, so A(F) = Z(F) and B_CGZ(F) = Z(F)/⟨ξ⟩.
- The reading A(F) ∩ ⟨ξ⟩ is forced, since ξ_{2,1} ∉ A(ℚ).

**Imports.** [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`mathlib:FreeAbelianGroup`](#baseline-mathlib-freeabeliangroup), [`mathlib:ExteriorAlgebra.exteriorPower`](#baseline-mathlib-exterioralgebra-exteriorpower).

**Source convention.** [CGZ.2018](#source-0-cgz-2018) — Definition 1.1, §1.1, p. 2; [CGZ.2018](#source-0-cgz-2018) — Definition 1.1, §1.1, p. 2. The published CGZ references specify the negative-target variant, whose precise comparison with this exterior-cycle image is [V.3/cgz-published-to-older](#v-3-cgz-published-to-older).

<a id="v-3-cgz-degenerate-relations"></a>

### V.3.18: The degenerate five-term relations of the CGZ convention

`K3BlochGroups:V.3/cgz-degenerate-relations` · lemma

Let F have at least four elements. The kernel of P(F) → Z(F)/⟨ξ⟩, the map induced by the inclusion of generators, is ⟨Fˣ⟩, the image of x ↦ ⟨x⟩. The target is generated by that image together with [0] ≡ c and [∞] ≡ −c. Consequently B̃(F) → B_CGZ(F) is surjective with kernel B̃(F) ∩ ⟨Fˣ⟩, an elementary abelian 2-group. ⟨X⟩ itself lies in B̃(F) only when X ∧ (−1) = 0 in the exterior square.

Here the inherited CGZ object is **B_CGZ,old**, with exterior target and image of raw cycles. The published negative-target object is [B_CGZ,new](#v-3-cgz-published-bloch-group).

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. List the degenerate specialisations, using P^1 arithmetic, for X, Y ∈ F − {0, 1}: ξ_{X,0} = c − [0]; ξ_{X,1} = ⟨X⟩ − [1]; ξ_{X,∞} = ⟨X⟩ − c + [0]; ξ_{X,X} = ξ_{1,Y} = [1]; ξ_{0,Y} = ⟨1 − Y⟩ − (c − [0]); ξ_{∞,Y} = 2[∞] + [0] − 2c + ⟨1 − Y⟩. With both entries in {0, 1, ∞}: ξ_{0,1} = [0] − [1] + [∞]; ξ_{1,0} = ξ_{1,∞} = [1]; ξ_{0,∞} = 2[0] − [∞]; ξ_{∞,0} = 2[∞] − [0]; ξ_{∞,1} = [∞] − [1] + [0].
2. Eliminate [0] = c and [∞] = −c. The relations left in P(F) are the ⟨X⟩, the ⟨1 − Y⟩ − 3c, and 3c. Since 3c = ⟨−1⟩ (three-c-angle-minus-one), the kernel is ⟨Fˣ⟩.
3. Surjectivity: every element of A(F) is congruent to an element of Ã(F) plus multiples of [0], [1] and [∞], and [0] ≡ c ∈ B̃(F).
4. ∂⟨X⟩ = X ∧ (−X) (blochBoundary_angle), whose image in the exterior square is X ∧ (−1).

**Acceptance.**

- For q = 4, 5, 7, 11 and 13, |B_CGZ(F_q)| = |P(F_q)|/|⟨F_qˣ⟩| = 5, 3, 4, 6 and 7 (checked by computing).
- The lemma fails at F_3: the kernel 2ℤ of B̃(F_3) ≅ ℤ → B_CGZ(F_3) ≅ ℤ/2 is not 2-torsion.
- The lemma fails at F_2: B̃(F_2) = 0 but B_CGZ(F_2) ≅ ℤ/3, so the map is not surjective.

**Imports.** [`K3BlochGroups:V.3/cgz-bloch-group`](#v-3-cgz-bloch-group), [`K3BlochGroups:V.3/exterior-kernel-bloch-group`](#v-3-exterior-kernel-bloch-group), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/three-c-angle-minus-one`](#v-3-three-c-angle-minus-one), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary).

**Source convention.** [CGZ.2018](#source-0-cgz-2018) — Lemma 2.2, §2.1, p. 9; [CGZ.2018](#source-0-cgz-2018) — Proof of Lemma 2.2, p. 9. The published CGZ references specify the negative-target variant, whose precise comparison with this exterior-cycle image is [V.3/cgz-published-to-older](#v-3-cgz-published-to-older).

<a id="v-3-cgz-convention-comparison"></a>

### V.3.19: Suslin's convention against the Calegari-Garoufalidis-Zagier convention

`K3BlochGroups:V.3/cgz-convention-comparison` · comparison

Let F be a field with at least four elements. The inclusion of generators ℤ[F − {0, 1}] ⊂ ℤ[P^1(F)] induces κ : B(F) → B_CGZ(F), from this layer's Bloch group to the CGZ Bloch group of cgz-bloch-group, with κ(c) = [0]. κ factors as B(F) ⊆ B̃(F) ↠ B_CGZ(F) through the exterior-kernel group B̃(F) of CGZ's Definition 2.1. Hence ker κ = B(F) ∩ ⟨Fˣ⟩ and coker κ ≅ B̃(F)/(B(F) + (B̃(F) ∩ ⟨Fˣ⟩)), where ⟨Fˣ⟩ ⊆ P(F) is the image of x ↦ ⟨x⟩. Both are elementary abelian 2-groups, and κ becomes an isomorphism after ⊗ ℤ[1/2] and after ⊗ ℤ/n for odd n. Neither vanishes in general: over F_11, κ maps B(F_11) ≅ ℤ/6 (generated by c) onto ⟨[0]⟩ ≅ ℤ/3 ⊂ B_CGZ(F_11) ≅ ℤ/6, so ker κ = {0, 3c} ≅ ℤ/2 and coker κ ≅ ℤ/2. In particular B_CGZ(F) is not in general a quotient of this layer's B(F); CGZ's remark that it is a quotient of 'Suslin's Bloch group' concerns B̃(F), whose boundary target is the exterior square.

Here the inherited CGZ object is **B_CGZ,old**, with exterior target and image of raw cycles. The published negative-target object is [B_CGZ,new](#v-3-cgz-published-bloch-group).

**Hypotheses.** F is a field with |F| ≥ 4. For F_2, B(F_2) = 0 while B_CGZ(F_2) ≅ ℤ/3 on [0]. B_CGZ(F) is read as in cgz-bloch-group: the image of A(F) in ℤ[P^1(F)] modulo the five-term elements. Both conventions are read in their own sources and neither is adjusted to the other.

**Construction and proof.**

1. The map. The K-book's relations ([1], and the five-term elements for x ≠ y in F − {0, 1}) are among CGZ's five-term elements (ξ_{X,X} = [1]), so P(F) → ℤ[P^1(F)]/⟨ξ⟩. An element of B(F) has a lift whose boundary vanishes in the antisymmetric quotient, hence in the exterior square (blochBoundary_comp_exterior), so it lands in B_CGZ(F). κ(c) = [0] because ξ_{X,0} = c − [0].
2. Factorisation: B(F) ⊆ B̃(F) (exterior-kernel-bloch-group), and B̃(F) → B_CGZ(F) is surjective with kernel B̃(F) ∩ ⟨Fˣ⟩ (cgz-degenerate-relations).
3. Kernel and cokernel: read off from the factorisation. ⟨Fˣ⟩ has exponent two (angle-bracket-homomorphism), and B̃(F)/B(F) embeds in Fˣ/Fˣ² (exterior-kernel-discrepancy), so both are elementary abelian 2-groups.
4. Localisation: a homomorphism whose kernel and cokernel have exponent two is an isomorphism after ⊗ ℤ[1/2], and after ⊗ ℤ/n for odd n, because ⊗ ℤ/n and Tor(−, ℤ/n) vanish on groups of exponent two.
5. The F_11 computation: P(F_11) ≅ ℤ/12 on [2], c = 10[2], B(F_11) = 2P(F_11); B̃(F_11) = P(F_11) because ⋀²(F_11ˣ) = 0; ⟨F_11ˣ⟩ = {0, 6[2]}; so B_CGZ(F_11) ≅ ℤ/6 and κ(B(F_11)) = ⟨[0]⟩ ≅ ℤ/3.
6. Record what the comparison is for: a finite or p-adic regulator can distinguish the conventions, a real regulator cannot (bloch-wigner-five-term).

**Acceptance.**

- F_5: κ is an isomorphism ℤ/3 → ℤ/3, since c ↦ [0] and both have order 3.
- F_11: ker κ = {0, 3c} ≅ ℤ/2 and coker κ ≅ ℤ/2.
- ℚ: κ(3c) = 3[0] = 0 while 3c = ⟨−1⟩ ≠ 0 in B(ℚ) (c has order 6 there, K-book Remark 5.2.1), so the 2-primary discrepancy is visible over ℚ.
- After ⊗ ℤ/n with n odd, κ is an isomorphism, which is the form CGZ Theorem 2.11 uses.

**Imports.** [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism), [`K3BlochGroups:V.3/exterior-kernel-bloch-group`](#v-3-exterior-kernel-bloch-group), [`K3BlochGroups:V.3/exterior-kernel-discrepancy`](#v-3-exterior-kernel-discrepancy), [`K3BlochGroups:V.3/cgz-bloch-group`](#v-3-cgz-bloch-group), [`K3BlochGroups:V.3/cgz-degenerate-relations`](#v-3-cgz-degenerate-relations).

**Source convention.** [CGZ.2018](#source-0-cgz-2018) — Definition 1.1 and the remark after it, §1.1, p. 2; [CGZ.2018](#source-0-cgz-2018) — Proof of Theorem 2.11, §2.5, p. 15; [Kbook.2013](#source-0-kbook-2013) — VI.5.1 (PDF p. 495). The published CGZ references specify the negative-target variant, whose precise comparison with this exterior-cycle image is [V.3/cgz-published-to-older](#v-3-cgz-published-to-older).

<a id="v-3-bloch-wigner-five-term"></a>

### V.3.20: The descended Bloch-Wigner map, imported, cannot separate the integral conventions

`K3BlochGroups:V.3/bloch-wigner-five-term` · comparison

Let F be a field with at least four elements and φ a homomorphism from B(F), or from P(F), to a torsion-free abelian group, for example the descended Bloch–Wigner map B(ℂ) → ℝ of Polylogarithms:P.2/bloch-wigner-descent, which is built downstream of this layer from the five-term identity of Polylogarithms:P.1/bloch-wigner-five-term. Then φ kills all torsion, in particular c and every ⟨x⟩, and a torsion-free-valued map on the CGZ-convention group, composed with κ, sees exactly what it sees on this layer's group after ⊗ ℚ, because the kernel and cokernel of κ are elementary abelian 2-groups. So no real-valued regulator can distinguish the integral conventions; this is the torsion warning V.3's stage text demands.

**Hypotheses.** F is a field with at least four elements. φ takes values in a torsion-free abelian group.

**Construction and proof.**

1. A torsion-free target kills every torsion element, in particular c (6c = 0, V.3/three-c-angle-minus-one) and each ⟨x⟩ (2⟨x⟩ = 0 in P(F), V.3/angle-bracket-homomorphism).
2. The kernel and cokernel of κ are killed by 2 (V.3/cgz-convention-comparison), so κ ⊗ ℚ is an isomorphism and torsion-free-valued maps on the two conventions correspond.
3. The analytic map itself, its five-term identity and its descent are imported by the downstream owners Polylogarithms P.1 and P.2, which consume this layer; nothing analytic is proved or imported here.

**Acceptance.**

- The descended map vanishes on c and on every angle-bracket element.
- The K-book normalisation of the five-term identity holds for D numerically: at x = 0.3 + 0.7i, y = −0.4 + 0.2i the alternating sum is below 10^{-14} (checked), while the all-plus sum is not zero.
- No analytic statement is proved or imported in this node; the earlier prerequisites on Polylogarithms P.1 and P.2 were removed because P.2 is downstream of V.3 and P.1's node rests on the stage K3BlochGroups:V.3 (a cycle).

**Imports.** [`K3BlochGroups:V.3/three-c-angle-minus-one`](#v-3-three-c-angle-minus-one), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.2.1 (PDF p. 496).

<a id="v-3-bloch-lecture-kernel"></a>

### V.3.21: Bloch’s full-tensor lecture kernel

`K3BlochGroups:V.3/bloch-lecture-kernel` · definition

For every field F put A₀(F)=ℤ[F−{0,1}], T(F)=Additive(Fˣ)⊗ℤ Additive(Fˣ), and λ:A₀(F)→T(F), [x]↦(1−x)⊗x. Define B_raw(F)=ker λ as a subgroup of A₀(F), before imposing any five-term relations. Symbols at 0 and 1, when used in formulas, mean zero in A₀. Its inclusion into A₀ is part of the interface. This is Bloch’s lecture object, not the inherited Suslin kernel inside P(F).

**Hypotheses.** F is a field; no field-size hypothesis.

**Construction and proof.**

1. Use FreeAbelianGroup on the subtype x≠0,1, and its lift to extend the displayed generator assignment. The codomain is the full tensor product, not either wedge quotient.
2. Take the additive kernel. Restricting the free-symbol field-embedding map gives functoriality, because embeddings preserve units and commute with λ.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `LectureBloch.lambda_symbol` | simp | λ([x])=(1−x)⊗x for x≠0,1. |
| `LectureBloch.mem_iff` | characterisation | α lies in B_raw exactly when λ(α)=0; equality in B_raw is equality in A₀. |
| `LectureBloch.inclusion_injective` | compatibility | The kernel inclusion B_raw→A₀ is injective, using the Mathlib additive-kernel subtype. |
| `LectureBloch.map_symbol` | functoriality | For a field embedding f:F→E, the free map [x]↦[f(x)] commutes with λ via the tensor map of units, restricts to B_raw, and has identity/composition laws. |

**Unit tests.**

- `LectureBloch.test_F2` (degenerate): B_raw(F₂)=0 because A₀(F₂)=0.
- `LectureBloch.test_F3` (computation): A₀(F₃)≅ℤ on [−1], T(F₃)≅ℤ/2, and λ([−1]) is its nonzero generator; B_raw(F₃)=2ℤ.
- `LectureBloch.test_F5_relation` (non-example): Over F₅ the admissible relation R(2,3) equals [4] in A₀, and λ([4]) is nonzero of order 2. The ordinary relation subgroup is not contained in B_raw.

**Uses.**

- Bloch §6.1 and §7.2: specifies the source of the full-tensor regulator construction without moving its K₃ comparison from V.4/V.6.
- V.3 convention ledger; V.6 consumers: prevents replacing a full-tensor cycle by an arbitrary five-term class.

**Acceptance.**

- The F₃ kernel is 2ℤ inside ℤ[−1].
- Five-term elements need not be λ-cycles.

**Imports.** [`mathlib:FreeAbelianGroup`](#baseline-mathlib-freeabeliangroup), [`mathlib:FreeAbelianGroup.lift`](#baseline-mathlib-freeabeliangroup-lift), [`mathlib:TensorProduct`](#baseline-mathlib-tensorproduct), [`mathlib:MonoidHom.ker`](#baseline-mathlib-monoidhom-ker), [`mathlib:Additive`](#baseline-mathlib-additive), [`mathlib:TensorProduct.map`](#baseline-mathlib-tensorproduct-map).

**Sources.** [Bloch2000](#source-3-bloch2000) — §6.1, p. 43, (6.1.2).

<a id="v-3-bloch-lecture-comparison"></a>

### V.3.22: The map from lecture cycles to Suslin classes

`K3BlochGroups:V.3/bloch-lecture-comparison` · construction

Let R₅≤A₀ be generated by the inherited admissible five-term elements, q:A₀↠P(F) the reduced-generator presentation map, and π:T↠Q_s the inherited antisymmetric tensor quotient. Then ∂q=−πλ. Hence q restricts to μ:B_raw→B(F). Define K_raw=R₅∩ker λ, regarded as a subgroup of B_raw. The induced map μ_rel:B_raw/K_raw→B(F) is injective and has image μ(B_raw). No quotient A₀/R₅→T with generator assignment λ exists in general.

**Hypotheses.** F is a field; all symbols and signs as in bloch-lecture-kernel and the inherited bloch-boundary.

**Construction and proof.**

1. Identify A₀/R₅ with the inherited free-on-F−0 presentation killing [1], by the two inverse generator maps.
2. For each nondegenerate generator π((1−x)⊗x)=−x∧(1−x); extend by the free universal property.
3. Restrict q to ker λ, identify its kernel with R₅∩ker λ, and use the additive quotient to obtain μ_rel.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `LectureBloch.boundary_compare` | compatibility | ∂∘q=−π∘λ as homomorphisms A₀→Q_s. |
| `LectureBloch.mu_coe` | simp | For α∈B_raw the image of μ(α) in P(F) is q(α). |
| `LectureBloch.mu_ker` | characterisation | μ(α)=0 iff the underlying free element α belongs to R₅. |
| `LectureBloch.muRel_injective` | universal-property | μ_rel is the unique map from B_raw/K_raw composing with the quotient map to μ, and is injective. |

**Unit tests.**

- `LectureBloch.test_F5_kernel` (non-example): The nonzero free element 2[4] in A₀(F₅) is a lecture cycle and maps to zero under μ; K_raw is not finite torsion.
- `LectureBloch.test_F5_generator` (computation): The lecture cycle 4[3] over F₅ maps to 4[3]=2c, a nonzero generator of B(F₅)≅ℤ/3.
- `LectureBloch.test_Q_kernel` (non-example): Over ℚ, 4[−1] is a nonzero lecture cycle in ker μ and has infinite additive order. Thus μ⊗ℚ itself is not injective.

**Uses.**

- V.3 rational convention comparisons: specifies which relation quotient has a rational identification.
- V.6 explicit cycle recipes: tests whether a representative really is a full-tensor cycle.

**Acceptance.**

- The sign is negative before kernels are taken.
- The kernel of μ is a relation kernel, without a torsion bound.

**Imports.** [`K3BlochGroups:V.3/bloch-lecture-kernel`](#v-3-bloch-lecture-kernel), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient), [`mathlib:QuotientGroup.mk'`](#baseline-mathlib-quotientgroup-mk-u27).

**Sources.** [Bloch2000](#source-3-bloch2000) — §6.1, p. 43, (6.1.2).

<a id="v-3-bloch-lecture-obstruction"></a>

### V.3.23: The exact obstruction to lifting a Suslin class

`K3BlochGroups:V.3/bloch-lecture-obstruction` · theorem

For every field F set S=range(1+τ)≤T, E=im λ∩S and L=λ(R₅)≤E. There is a canonical obstruction o:B(F)→E/L: choose α with qα=β and take λ(α) mod L. It is independent of the lift and is surjective. The sequence 0→K_raw→B_raw→B(F)→E/L→0 is exact. In particular ker μ=K_raw and coker μ≅E/L, not merely an unspecified torsion discrepancy.

**Hypotheses.** F is a field. τ is the tensor flip; R₅, q, λ and K_raw are the preceding definitions.

**Construction and proof.**

1. Since ∂R₅=0 and ∂q=−πλ, λ(R₅) lies in ker π=S, proving L≤E.
2. A lift of a boundary-zero class has λ-image in E. Changing the lift by an element of R₅ changes λ by an element of L, so the additive quotient lift is well-defined.
3. Every e∈E has e=λ(α), and πe=0 implies qα∈B(F); this proves surjectivity. The obstruction vanishes exactly when subtracting a relation from α produces a lecture cycle.
4. Identify the first kernel using the preceding comparison and translate range=kernel into Function.Exact.

**Acceptance.**

- Over F₅, E=L≅ℤ/2, so μ is surjective even though it has an infinite kernel.
- The formula remains meaningful over F₂ and F₃, where the six-torsion identities need not hold.

**Imports.** [`K3BlochGroups:V.3/bloch-lecture-comparison`](#v-3-bloch-lecture-comparison), [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient), [`mathlib:Function.MulExact`](#baseline-mathlib-function-mulexact), [`mathlib:QuotientGroup.mk'`](#baseline-mathlib-quotientgroup-mk-u27).

**Sources.** [Bloch2000](#source-3-bloch2000) — §6.1, p. 43, (6.1.2).

<a id="v-3-bloch-lecture-six-torsion"></a>

### V.3.24: Six kills the lecture comparison obstruction

`K3BlochGroups:V.3/bloch-lecture-six-torsion` · theorem

For a field F with at least four elements, 6·(E/L)=0. Consequently μ_rel:B_raw/K_raw→B(F) is injective with cokernel killed by 6, and becomes an isomorphism after tensoring with ℤ[1/6] or ℚ. Explicitly, if qα=β∈B(F), let σ[x]=[1−x], let deg([x])=1, and interpret [−1]=0 in characteristic 2. Then γ=3(α−σα)+deg(α)·2[−1] belongs to B_raw and μγ=6β. No such conclusion identifies B_raw itself rationally with B(F).

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. The full tensor flip sends λ(α) to λ(σα). Since λ(α)∈range(1+τ), applying 1−τ gives λ(α−σα)=0.
2. The inherited constant relation gives q(σα)=deg(α)c−β, hence q(α−σα)=2β−deg(α)c.
3. The symbol 2[−1] is a lecture cycle since the second tensor factor has order dividing 2. Its image is h(−1)=3c, by the inherited three-c-angle-minus-one. The displayed γ therefore maps to 6β.
4. Apply exactness and flat localization; the quotient by K_raw must precede the coefficient change. The coefficient-exports node also treats coprime moduli.

**Acceptance.**

- The lift is explicit and compatible with the sign convention.
- The nonzero rational kernel 4[−1] over ℚ survives if K_raw is omitted.
- For F₂/F₃ use direct presentations, not the |F|≥4 constant and angle identities.

**Imports.** [`K3BlochGroups:V.3/bloch-lecture-obstruction`](#v-3-bloch-lecture-obstruction), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/three-c-angle-minus-one`](#v-3-three-c-angle-minus-one), [`mathlib:TensorProduct.comm`](#baseline-mathlib-tensorproduct-comm), [`mathlib:Module.Flat.lTensor_exact`](#baseline-mathlib-module-flat-ltensor-exact).

**Sources.** [Bloch2000](#source-3-bloch2000) — §6.1, p. 43, (6.1.2).

<a id="v-3-goncharov-generic-b2"></a>

### V.3.25: Goncharov’s generic configuration group B₂

`K3BlochGroups:V.3/goncharov-generic-b2` · definition

For every field F define G₂^gen(F)=A₀(F)/R_conf, where R_conf is generated by ∑_{i=0}^4(−1)^i[cr(x₀,…,x̂ᵢ,…,x₄)] for pairwise distinct points x₀,…,x₄∈P¹(F). Use exactly the cross-ratio of K3BlochGroups:V.4/cross-ratio, cr(0,∞,1,z)=z. The generators are P¹(F)−{0,1,∞}; degenerate symbols are zero by notation. No relations from coinciding points are imposed. Its boundary δ_gen is [x]↦(1−x)∧x in Q_s, with descent proved in goncharov-generic-comparison.

**Hypotheses.** F is a field, possibly F₂ or F₃. Only injective five-tuples occur in R_conf.

**Construction and proof.**

1. Import the cross-ratio and its five normalized face values from V.4, rather than reconstructing configurations or PGL₂.
2. Form the free additive relation subgroup and quotient. The reduced generators are explicit on p. 218; p. 203’s projective-line shorthand does not authorize free degenerate generators.
3. The map induced by a field embedding respects cross-ratios, so it takes R_conf into the corresponding relation subgroup; the universal property is the ordinary additive quotient lift.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `GoncharovB2.class` | constructor | For x≠0,1, class(x) is the quotient class of [x]; symbols 0,1,∞ evaluate to zero. |
| `GoncharovB2.eq_iff` | characterisation | The classes of α and β agree iff α−β belongs to R_conf. |
| `GoncharovB2.lift` | universal-property | Any assignment into an abelian group annihilating all injective five-point relations extends uniquely to G₂^gen. |
| `GoncharovB2.map_symbol` | functoriality | A field embedding maps class(x) to class(f(x)); identity and composition maps agree with those on the free symbols. |

**Unit tests.**

- `GoncharovB2.test_F2` (degenerate): G₂^gen(F₂)=0; the projective line has only three points and there are no nondegenerate generators.
- `GoncharovB2.test_F3` (computation): G₂^gen(F₃)≅ℤ on [−1], since its projective line has only four points and no relation five-tuple.
- `GoncharovB2.test_F5` (non-example): G₂^gen(F₅)≅ℤ/6 on [3], while its boundary kernel is ℤ/3. In particular G₂^gen is not the Bloch kernel.

**Uses.**

- Goncharov §1.8 Bloch–Suslin complex: places the generic B₂ in degree one before taking its boundary kernel.
- Polylogarithms:P.3/polylogarithmic-complex and P.4/explicit-to-inductive-comparison: imports the algebraic weight-two presentation and boundary sign.
- K3BlochGroups:V.4 configuration homology: shares one cross-ratio convention and relation set.

**Acceptance.**

- A five-point relation is the inherited admissible five-term relation after normalization.
- Reducing the generator set does not kill the inherited constant c.

**Imports.** [`mathlib:FreeAbelianGroup`](#baseline-mathlib-freeabeliangroup), [`mathlib:QuotientGroup.mk'`](#baseline-mathlib-quotientgroup-mk-u27), [`K3BlochGroups:V.4/cross-ratio`](#v-4-cross-ratio).

**Sources.** [Goncharov1995](#source-3-goncharov1995) — pp. 202–203 and §2.3 pp. 253–254; [Goncharov1995](#source-3-goncharov1995) — §1.8, p. 218, definition before the Bloch–Suslin complex.

<a id="v-3-goncharov-generic-comparison"></a>

### V.3.26: Integral identification of the generic B₂ presentation

`K3BlochGroups:V.3/goncharov-generic-comparison` · comparison

For every field F the identity on nondegenerate symbols gives e_gen:G₂^gen(F)≃P(F), integrally, and δ_gen=−∂∘e_gen into Q_s. Consequently ker δ_gen≃B(F), with zero kernel and zero cokernel. If one instead composes with the ordinary exterior-square projection, its kernel corresponds to the inherited B̃(F); the exact discrepancy is exterior-kernel-discrepancy. Tensoring with ℚ makes both wedge targets coincide. Neither G₂^gen itself nor a free projective-line presentation is identified with B(F).

**Hypotheses.** F is a field; the boundary uses the antisymmetric tensor quotient specified on p. 218.

**Construction and proof.**

1. Normalize any injective five-tuple by the imported V.4 three-point normalization. Its five face cross-ratios give exactly [x]−[y]+[y/x]−[(1−x⁻¹)/(1−y⁻¹)]+[(1−x)/(1−y)].
2. Conversely each admissible pair x,y gives the injective tuple (0,∞,1,x,y); hence R_conf=R₅. The additive quotient yields the inverse generator maps.
3. Extend the displayed negative boundary identity by the universal property; transfer kernels, and apply the inherited antisymmetric/exterior exact sequence for the alternative wedge target.

**Acceptance.**

- Over F₅, [3] has nonzero boundary, c=[2] has order 3 and lies in the kernel.
- Over F₁₁, c has order 6: the notation [0]=0 in the reduced free group does not imply [x]+[1−x]=0.
- The rational degree-one cohomology identification with K₃^ind is imported from V.4, not proved a second time.

**Imports.** [`K3BlochGroups:V.3/goncharov-generic-b2`](#v-3-goncharov-generic-b2), [`K3BlochGroups:V.4/cross-ratio`](#v-4-cross-ratio), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/antisym-exterior-comparison`](#v-3-antisym-exterior-comparison), [`K3BlochGroups:V.3/exterior-kernel-discrepancy`](#v-3-exterior-kernel-discrepancy).

**Sources.** [Goncharov1995](#source-3-goncharov1995) — pp. 202–203 and §2.3 pp. 253–254; [Goncharov1995](#source-3-goncharov1995) — §1.8 p. 218, displayed Bloch–Suslin complex.

<a id="v-3-goncharov-curve-b2"></a>

### V.3.27: Goncharov’s rational smooth-curve group

`K3BlochGroups:V.3/goncharov-curve-b2` · definition

For every field F let V_F=ℚ[P¹(F)] and W_F=ℚ⊗ℤ Q_s(F), and define d_F:V_F→W_F by [x]↦1⊗((1−x)∧x) for x≠0,1,∞, with degenerate values zero. For each smooth connected curve X/F and F-rational points u,v, projective specialization sends rational functions in F(X) to F∪{∞}. Let R_curv^ℚ(F) be the ℚ-span of [0], [∞], and sp_u(α)−sp_v(α), for every such curve and every α∈ker d_{F(X)}. Define G₂^curv(F)=V_F/R_curv^ℚ(F). This is the rational version of §1.9, (1.25a), with the rationalization on both sides. Smooth connected curves over a field are integral; the suggested carrier uses integral schemes smooth of relative dimension one, not arbitrary fields with unexplained evaluation maps.

**Hypotheses.** F is a field. u,v are F-rational points, not geometric points over an unspecified extension. Specializations take zeros to 0 and poles to ∞. All smooth connected curves occur; F(t) alone is a different relation set. Curve has its usual algebraic meaning: separated and of finite type over F; smoothness has relative dimension one. The integral carrier expresses connectedness in this smooth setting.

**Construction and proof.**

1. Use the Mathlib smooth-relative-dimension, integral-scheme and function-field carriers. Import the canonical projective specialization at rational points from the AlgebraicCurves dictionary; it is an explicit outstanding request, not a new curve theory planned here. The suggested bundle also requires quasi-compactness and separatedness of the structure morphism; smoothness gives local finite presentation, so these are finite-type algebraic curves.
2. Use Finsupp over ℚ for V_F and the tensor product for W_F. The relation subspace is the span of the displayed degenerate generators and all specialized cycle differences.
3. The rational version agrees with rationalizing the source’s integral cycle-difference relations. Clear the finitely many coefficients of a rational cycle to obtain an integral symbol sum β. Its integral boundary may still be torsion: zero after tensoring with ℚ means some nonzero integer m kills that boundary. Thus mβ is an integral cycle. Conversely integral cycles rationalize to rational cycles. Equivalently, flatness of ℚ identifies the rationalized integral kernel with the rational boundary kernel.
4. Taking X=P¹ and the cycle [t]+[1−t], specializing at 0 and ∞ and using the two degenerate generators gives [1]∈R_curv^ℚ. This also pins the rationalization convention independently of (1.25a)’s typography.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `GoncharovCurve.class` | constructor | class_F(z) is the image of the basis vector [z] under the Mathlib submodule quotient projection. |
| `GoncharovCurve.eq_iff` | characterisation | class(α)=class(β) iff α−β∈R_curv^ℚ. |
| `GoncharovCurve.lift` | universal-property | An ℚ-linear map V_F→M annihilating [0], [∞] and every specialized cycle difference factors uniquely through G₂^curv(F). |
| `GoncharovCurve.specialization_relation` | relation | For every smooth connected X/F, u,v∈X(F) and α∈ker d_{F(X)}, the quotient classes of sp_u α and sp_v α agree. |

**Unit tests.**

- `GoncharovCurve.test_zero` (degenerate): class(0)=0 and class(∞)=0; both are relation generators, not additional free summands.
- `GoncharovCurve.test_one` (computation): class(1)=0, using [t]+[1−t] and the points 0,∞ on P¹.
- `GoncharovCurve.test_inversion` (characterisation): For x∈Fˣ, class(x)+class(x⁻¹)=0: rationally [t]+[t⁻¹] is a cycle, and specialize at x and 0. The same integral assertion in P(F) is false in general.

**Uses.**

- Goncharov §1.9, Conjecture 1.20: keeps the generic and universal-curve relation presentations distinct.
- Polylogarithms:P.4 inductive presentation: records the difference between all curves and the relation construction over F(t).

**Acceptance.**

- The definition is rational and quantifies over all curves.
- The missing canonical specialization API remains visible in requests/gaps; arbitrary evaluation data do not discharge it.

**Imports.** [`mathlib:Finsupp.linearCombination`](#baseline-mathlib-finsupp-linearcombination), [`mathlib:Submodule.mkQ`](#baseline-mathlib-submodule-mkq), [`mathlib:AlgebraicGeometry.Scheme.functionField`](#baseline-mathlib-algebraicgeometry-scheme-functionfield), [`mathlib:AlgebraicGeometry.IsIntegral`](#baseline-mathlib-algebraicgeometry-isintegral), [`mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`](#baseline-mathlib-algebraicgeometry-smoothofrelativedimension), [`mathlib:Module.Flat.lTensor_exact`](#baseline-mathlib-module-flat-ltensor-exact), [`tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`](../../../content/tau-ceti/AlgebraicCurves/README.md#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts), [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient), [`mathlib:TensorProduct`](#baseline-mathlib-tensorproduct), [`mathlib:AlgebraicGeometry.QuasiCompact`](#baseline-mathlib-algebraicgeometry-quasicompact), [`mathlib:AlgebraicGeometry.IsSeparated`](#baseline-mathlib-algebraicgeometry-isseparated).

**Sources.** [Goncharov1995](#source-3-goncharov1995) — §1.9, pp. 221–224, (1.25a) and Corollary 1.19.

<a id="v-3-goncharov-curve-boundary"></a>

### V.3.28: Boundary descent for curve specializations

`K3BlochGroups:V.3/goncharov-curve-boundary` · construction

For every field F, R_curv^ℚ(F)≤ker d_F. Therefore d_F descends uniquely to δ_curv:G₂^curv(F)→W_F, with δ_curv class(x)=1⊗((1−x)∧x). At a rational point u of a smooth curve, the local ring is a DVR with residue field F. The degree-two valuation-specialization formula, imported from Polylogarithms:P.4/specialization-and-delta, implies d_F(sp_u α)=0 whenever d_{F(X)}α=0. This supplies boundary descent once the requested geometric dictionary is instantiated.

**Hypotheses.** F is a field; canonical projective specialization as in goncharov-curve-b2. The scalar field is ℚ: diagonal and sign 2-torsion vanish.

**Construction and proof.**

1. Obtain the local DVR, its fraction field identification with F(X), and residue identification with F from the requested curve dictionary.
2. Apply the degree-two identity Λ²(u_π)∘δ₂=δ₂∘s_v of the imported specialization-and-delta node. Its zero/pole convention agrees with projective evaluation followed by killing [0] and [∞]. Thus each specialized cycle has zero boundary.
3. The two explicit degenerate relation generators also have zero boundary. Extend over their ℚ-span and descend through Submodule.liftQ; the formula and uniqueness use the quotient universal property.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `GoncharovCurve.boundary_class` | simp | δ_curv(class(x))=d_F([x]); it is zero on the three degenerate classes. |
| `GoncharovCurve.boundary_unique` | universal-property | δ_curv is the unique linear map whose composite with the quotient projection is d_F. |
| `GoncharovCurve.mem_kernel` | characterisation | For α∈V_F, its quotient class lies in ker δ_curv iff d_F(α)=0. |

**Unit tests.**

- `GoncharovCurve.test_boundary_degenerate` (degenerate): δ_curv(class(0))=δ_curv(class(1))=δ_curv(class(∞))=0.
- `GoncharovCurve.test_boundary_sign` (compatibility): Under the generic comparison, δ_curv of an image is −(∂⊗ℚ) of its Suslin pre-Bloch class, in W_F.
- `GoncharovCurve.test_boundary_complex` (non-example): Over ℂ, δ_curv(class(i))=1⊗((1−i)∧i)=0, since i is torsion in ℂˣ; class(i) is a cycle. Replacing the wedge of multiplicative units by the field’s additive vector space would not give this value.

**Uses.**

- Goncharov’s weight-two motivic complex: makes the all-curve degree-one kernel a specified object.
- V.3 comparison with Suslin cycles: distinguishes a quotient comparison from an asserted isomorphism.

**Acceptance.**

- The formula is independent of the chosen uniformizer on cycles.
- No geometric evaluation is assumed to be a field homomorphism; poles are retained before the quotient kills them.

**Imports.** [`K3BlochGroups:V.3/goncharov-curve-b2`](#v-3-goncharov-curve-b2), [`Polylogarithms:P.4/specialization-and-delta`](../packets/Polylogarithms.json), [`mathlib:Submodule.liftQ`](#baseline-mathlib-submodule-liftq), [`K3BlochGroups:V.3/antisym-exterior-comparison`](#v-3-antisym-exterior-comparison), [`tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`](../../../content/tau-ceti/AlgebraicCurves/README.md#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts).

**Sources.** [Goncharov1995](#source-3-goncharov1995) — §1.9, pp. 221–224, (1.25a) and Corollary 1.19; [Goncharov1995](#source-3-goncharov1995) — §1.9 pp. 221–222, Lemma 1.16.

<a id="v-3-goncharov-curve-comparison"></a>

### V.3.29: The rational generic-to-curve quotient comparison

`K3BlochGroups:V.3/goncharov-curve-comparison` · comparison

For every field F the identity on symbols induces a surjection ψ:P(F)⊗ℚ→G₂^curv(F), compatible with δ_curv=−∂_ℚ. Let R_red=spanℚ([0],[1],[∞])+R₅⊗ℚ inside V_F and K_curv=R_curv^ℚ/R_red. Then ker ψ≅K_curv and coker ψ=0. Because K_curv consists of cycles, ψ restricts to a surjection B(F)⊗ℚ→ker δ_curv with the same kernel K_curv. Over F₃, canonical projective-line inversion gives class(−1)+class(−1)=0, so G₂^curv(F₃)=0 and K_curv≅ℚ, whereas P(F₃)⊗ℚ≅ℚ. Over F₂ both groups and K_curv are zero. Thus an all-field isomorphism is false, and any relation-equality theorem must respect small-field exceptions. No bound by 2, 3 or 6 can dispose of a nonzero rational vector-space kernel. For fields with at least four elements, the statement K_curv=0 is the rational weight-two instance of Conjecture 1.20 in the source; the cited source decomposition has not established it. The separate F(t)-inductive comparison for infinite fields is imported from Polylogarithms:P.4/explicit-to-inductive-comparison, and is not substituted for the all-curve assertion.

**Hypotheses.** F is a field. All-curve specializations and the boundary closure are as in the preceding two nodes.

**Construction and proof.**

1. The degenerate symbols lie in R_curv^ℚ. For an admissible pair x,y, use on P¹ the free cycle R(1+t(x−1),y); its values at t=1 and t=0 are R(x,y) and [1]. This puts every R₅ generator into R_curv^ℚ, as claimed on p. 225.
2. The inclusion R_red≤R_curv^ℚ gives a surjective linear quotient map. The quotient-of-quotient theorem identifies its exact kernel with R_curv^ℚ/R_red.
3. Boundary compatibility follows on generators and hence everywhere. Since R_curv^ℚ is a cycle subspace, every preimage of a δ_curv-cycle is already a ∂_ℚ-cycle, proving surjectivity on kernels with the same kernel.
4. Record injectivity as a source-sensitive mathematical gap. The P.4 F(t)-inductive comparison is a related comparison with a different relation set and an infinite-field hypothesis; it is not a prerequisite of this quotient-map proof and does not discharge the gap.

**Acceptance.**

- For F₂ the rational generic group, curve group and correction are zero. For F₃ the rational generic group is ℚ, the curve group is zero by inversion antisymmetry, and K_curv≅ℚ. A relation-equality theorem needs a field-size qualification.
- The equality conjecture is not passed to downstream consumers as an unconditional rational identification.

**Imports.** [`K3BlochGroups:V.3/goncharov-generic-comparison`](#v-3-goncharov-generic-comparison), [`K3BlochGroups:V.3/goncharov-curve-b2`](#v-3-goncharov-curve-b2), [`K3BlochGroups:V.3/goncharov-curve-boundary`](#v-3-goncharov-curve-boundary), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`mathlib:Submodule.mkQ`](#baseline-mathlib-submodule-mkq).

**Sources.** [Goncharov1995](#source-3-goncharov1995) — §1.9, p. 225, Conjecture 1.20; [Goncharov1995](#source-3-goncharov1995) — §1.9, pp. 221–224, (1.25a) and Corollary 1.19.

<a id="v-3-cgz-published-negative-tensor"></a>

### V.3.30: The published CGZ negative-unit tensor quotient

`K3BlochGroups:V.3/cgz-published-negative-tensor` · definition

For every field F let N_neg≤T(F) be the subgroup generated by u⊗(−u), u∈Fˣ, and put Q_neg(F)=T(F)/N_neg, where −u means the multiplicative unit −1 times u, not the inverse or the additive negative of Additive Fˣ. Write ρ:T↠Q_neg. Since range(1+τ)≤N_neg, ρ factors uniquely as T↠Q_s --p_neg→Q_neg. The factor is surjective and its kernel is the subgroup generated by the classes u∧(−u), killed by 2. This is not in general the ordinary exterior square.

**Hypotheses.** F is a field; no field-size hypothesis for the tensor quotient.

**Construction and proof.**

1. Generate the ℤ-submodule of the actual tensor product from the stated pure tensors and form its Mathlib submodule quotient.
2. For multiplicative units x,y, expand n(xy)−n(x)−n(y)=x⊗y+y⊗x. This proves the symmetrizer range is contained in N_neg and constructs p_neg by quotient descent.
3. Its kernel is the image of N_neg in Q_s; each generator u∧(−u) is killed by 2 since u∧u is and −1 has order dividing 2.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `CGZPublished.negativeTensor_zero` | relation | ρ(u⊗(−u))=0 for every multiplicative unit u. |
| `CGZPublished.tensorProjection_surjective` | projection | The canonical ρ:T→Q_neg is surjective, and p_neg∘π=ρ. |
| `CGZPublished.tensorLift` | universal-property | A ℤ-linear map T→M killing every u⊗(−u) factors uniquely through Q_neg. |
| `CGZPublished.symmetrizer_le` | compatibility | range(1+τ)≤N_neg; the comparison from Q_s is a quotient map, not a projection to the exterior square. |

**Unit tests.**

- `CGZPublished.test_tensor_F3` (computation): Q_neg(F₃)≅ℤ/2, whereas ⋀² Additive(F₃ˣ)=0.
- `CGZPublished.test_tensor_F5` (computation): Q_s(F₅)≅ℤ/2 but Q_neg(F₅)=0, since for a generator g of F₅ˣ, g⊗(−g) is 3 times the generator of T≅ℤ/4.
- `CGZPublished.test_tensor_Q` (non-example): In the ordinary exterior square of ℚˣ, 2∧(−2)=2∧(−1)≠0, while Q_neg kills it. Thus the ordinary exterior boundary cannot be substituted for the published target.

**Uses.**

- CGZ published Definition 2.1: ensures every allowed projective five-term specialization has zero boundary.
- HB.1 finite Chern-class input; QT.5 quantum dilogarithm input: provides the versioned boundary target and the exact 2-primary comparison.

**Acceptance.**

- The minus in −u is an operation in the field’s multiplicative units.
- Over F₃, Q_neg≅ℤ/2 while the ordinary exterior square of F₃ˣ is zero.

**Imports.** [`mathlib:TensorProduct`](#baseline-mathlib-tensorproduct), [`mathlib:Submodule.mkQ`](#baseline-mathlib-submodule-mkq), [`mathlib:Submodule.liftQ`](#baseline-mathlib-submodule-liftq), [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient).

**Sources.** [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Definition 2.1.

<a id="v-3-cgz-published-target-kernel"></a>

### V.3.31: The negative-target kernel is the boundary of the angle image

`K3BlochGroups:V.3/cgz-published-target-kernel` · lemma

Assume |F|≥4 and let H=im(h:Fˣ→P(F)), h(u)=[u]+[u⁻¹], as in angle-bracket-homomorphism. Then ker(p_neg:Q_s→Q_neg)=∂H. Equivalently ker(p_neg∘∂:P→Q_neg)=B(F)+H. Here H lies in P(F) and need not be a subgroup of B(F); only B(F)∩H is a Bloch subgroup. Also 2H=0.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. The negative-target kernel is generated by u∧(−u). The inherited angle homomorphism computes ∂h(u)=u∧(−u), so its image is exactly that kernel.
2. If p_neg(∂α)=0, choose h∈H with ∂h=∂α; then α−h∈B. Conversely B+H is killed by the composite.
3. Use the inherited 2-torsion angle relation, not an assertion that each angle symbol is a Bloch cycle.

**Acceptance.**

- Over F₅, h(2) has nonzero boundary in Q_s and zero boundary in Q_neg.
- Over F₃, the H-torsion statement is not used.

**Imports.** [`K3BlochGroups:V.3/cgz-published-negative-tensor`](#v-3-cgz-published-negative-tensor), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism), [`K3BlochGroups:V.3/angle-bracket-two-torsion`](#v-3-angle-bracket-two-torsion), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group).

**Sources.** [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Definition 2.1; [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Lemma 2.2 and proof.

<a id="v-3-cgz-published-boundary"></a>

### V.3.32: The published projective boundary and its relation subgroup

`K3BlochGroups:V.3/cgz-published-boundary` · construction

For every field F define d_new:Z_P¹(F)=ℤ[P¹(F)]→Q_neg(F) by [x]↦ρ(x⊗(1−x)) when x≠0,1,∞ and the three degenerate symbols↦0. Reuse the projective arithmetic and all admissible extended five-term elements ξ_{X,Y} of the inherited cgz-bloch-group, including diagonal X=Y when the displayed fractions are defined. Let C_ext be their generated subgroup, unchanged from the inherited CGZ presentation. Then C_ext≤ker d_new. Thus d_new descends to d_quot:Z_P¹/C_ext→Q_neg. No intersection repair is necessary for this published definition.

**Hypotheses.** F is a field. Admissibility forbids 0/0 and ∞/∞; it does not simply exclude all degenerate points.

**Construction and proof.**

1. Use the inherited projective arithmetic and the free additive lift; keep d_new’s generator sign x⊗(1−x), which is opposite to Bloch’s λ.
2. For nondegenerate admissible pairs, apply the inherited five-term boundary calculation and project Q_s→Q_neg.
3. For degenerate and diagonal pairs use the inherited complete specializations: their boundaries are combinations of u∧(−u), hence vanish in Q_neg. Degenerate tensor terms vanish by definition. This direct finite list also covers F₂ and F₃ without invoking angle-torsion identities.
4. Extend to the generated relation subgroup and descend using the additive quotient universal property.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `CGZPublished.boundary_symbol` | simp | d_new([x])=ρ(x⊗(1−x)) for x≠0,1,∞; d_new([0])=d_new([1])=d_new([∞])=0. |
| `CGZPublished.relations_le_kernel` | relation | Every admissible extended ξ_{X,Y} belongs to ker d_new; hence C_ext≤ker d_new. |
| `CGZPublished.boundaryQuotient_unique` | universal-property | d_quot is the unique additive map with d_quot∘q_ext=d_new. |
| `CGZPublished.boundary_ordinary` | compatibility | On reduced nondegenerate symbols, d_quot∘j=p_neg∘∂, where j:P(F)→Z_P¹/C_ext is the inherited presentation map. |

**Unit tests.**

- `CGZPublished.test_boundary_degenerate` (degenerate): The three free symbols [0],[1],[∞] all have zero d_new boundary before taking the quotient.
- `CGZPublished.test_boundary_F5` (computation): d_new([2]+[3])=0 in Q_neg(F₅), although ∂([2]+[3])≠0 in Q_s(F₅).
- `CGZPublished.test_boundary_Q_relation` (compatibility): For F=ℚ, ξ_{2,1}=[2]+[1/2]−[1] has d_new boundary zero; its ordinary-exterior boundary is the nonzero 2∧(−1).

**Uses.**

- CGZ Definition 2.1 and Lemma 2.2: makes the quotient ker(d_new)/C_ext a legal additive-group quotient.
- HabiroNumberFields:HB.1: imports this algebraic input before constructing the finite Chern maps.

**Acceptance.**

- The boundary of ξ_{2,1} is zero in Q_neg, although it can be nonzero in either wedge target.
- The relation subgroup is the same one used by the older repaired CGZ convention.

**Imports.** [`K3BlochGroups:V.3/cgz-published-negative-tensor`](#v-3-cgz-published-negative-tensor), [`K3BlochGroups:V.3/cgz-bloch-group`](#v-3-cgz-bloch-group), [`K3BlochGroups:V.3/cgz-degenerate-relations`](#v-3-cgz-degenerate-relations), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`mathlib:FreeAbelianGroup.lift`](#baseline-mathlib-freeabeliangroup-lift), [`mathlib:QuotientGroup.mk'`](#baseline-mathlib-quotientgroup-mk-u27).

**Sources.** [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Definition 2.1.

<a id="v-3-cgz-published-bloch-group"></a>

### V.3.33: The published modified CGZ Bloch group

`K3BlochGroups:V.3/cgz-published-bloch-group` · definition

Define B_new(F)=ker(d_new)/C_ext for every field F, using the containment from cgz-published-boundary. Equivalently B_new≃ker(d_quot:Z_P¹/C_ext→Q_neg), via the inclusion of free cycles. The kernel presentation is the suggested carrier; it canonically agrees with the cycle quotient. For |F|≥4 the extended pre-Bloch presentation is P(F)/H, so B_new≃(B(F)+H)/H. In particular the modified cycle condition, not the exterior cycle condition, selects its subgroup of P/H. The inherited id cgz-bloch-group continues to denote B_old, the repaired arXiv-v3 exterior-kernel convention.

**Hypotheses.** F is a field. The P/H description uses |F|≥4; the free projective presentation itself does not.

**Construction and proof.**

1. Take the additive kernel of d_quot; the first-isomorphism theorem identifies it with ker(d_new)/C_ext because C_ext≤ker d_new.
2. For fields of size at least four, import cgz-degenerate-relations to identify Z_P¹/C_ext with P/H. The target-kernel lemma identifies the preimage of the modified cycle subgroup with B+H.
3. The equivalence of the two presentations is explicit on cycle representatives and does not relabel the inherited older object.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `CGZPublished.cycleClass` | constructor | A free projective cycle α∈ker d_new gives cycleClass(α)∈B_new. |
| `CGZPublished.cycleClass_eq_iff` | characterisation | cycleClass(α)=cycleClass(β) iff α−β∈C_ext. |
| `CGZPublished.kernelEquiv` | compatibility | The map ker(d_new)/C_ext≃ker d_quot sends a cycle class to its class in the extended presentation. |
| `CGZPublished.cycleLift` | universal-property | An additive map ker d_new→M killing C_ext descends uniquely to B_new. |

**Unit tests.**

- `CGZPublished.test_group_F2` (non-example): B_new(F₂)≅ℤ/3 on [0], although B(F₂)=0. The unrestricted field version of Lemma 2.2 is false.
- `CGZPublished.test_group_F3` (computation): B_new(F₃)=0. The extended presentation is ℤ/2 on [−1], whose d_quot map to Q_neg≅ℤ/2 is an isomorphism.
- `CGZPublished.test_group_F11` (non-example): B_new(F₁₁)≅ℤ/3 on the image of c, whereas B_old(F₁₁)≅ℤ/6. The two CGZ versions are not interchangeable integrally.

**Uses.**

- Published CGZ Lemma 2.2: the actual target of its surjection from the classical group.
- HB.1/HB.2 and ArithmeticQuantumTopology:QT.5: consumes the modified group with its version and coefficient restrictions explicit.

**Acceptance.**

- B_new(F₃)=0, whereas the inherited exterior convention B_old(F₃)≅ℤ/2.
- The containment C_ext≤ker d_new is part of the definition contract.

**Imports.** [`K3BlochGroups:V.3/cgz-published-boundary`](#v-3-cgz-published-boundary), [`K3BlochGroups:V.3/cgz-published-target-kernel`](#v-3-cgz-published-target-kernel), [`K3BlochGroups:V.3/cgz-degenerate-relations`](#v-3-cgz-degenerate-relations), [`mathlib:MonoidHom.ker`](#baseline-mathlib-monoidhom-ker), [`mathlib:QuotientGroup.mk'`](#baseline-mathlib-quotientgroup-mk-u27).

**Sources.** [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Definition 2.1; [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Lemma 2.2 and proof.

<a id="v-3-cgz-published-comparison-map"></a>

### V.3.34: The classical-to-published CGZ map

`K3BlochGroups:V.3/cgz-published-comparison-map` · construction

For every field F, inclusion of nondegenerate symbols induces κ_new:B(F)→B_new(F), by boundary compatibility. For |F|≥4, identify it with B↪B+H↠(B+H)/H. It sends c to [0], sends h(u) to zero whenever h(u) lies in B, and is natural under field embeddings. Its quotient target does not mean all h(u) are Bloch cycles. Surjectivity and the exact 2-primary kernel are the separate published-lemma-two-two theorem.

**Hypotheses.** F is a field. Statements involving the inherited c and H use |F|≥4.

**Construction and proof.**

1. The reduced-symbol inclusion into the extended quotient is well-defined by the ordinary five-term relations. Compose boundary compatibility with the B-kernel inclusion to factor through the d_quot-kernel.
2. Use the inherited degenerate relations for c↦[0] and h(u)↦0. The target-kernel description identifies the factor with the displayed map.
3. Field embeddings preserve the symbol assignment, negative-unit relation and projective arithmetic, yielding naturality; the maps’ identity/composition laws follow on generators.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `CGZPublished.compare_coe` | compatibility | The underlying extended-quotient class of κ_new(β) is j(β) for β∈B. |
| `CGZPublished.compare_c` | simp | For \|F\|≥4, κ_new(c)=[0] in B_new. |
| `CGZPublished.compare_angle` | relation | For \|F\|≥4, if h(u)∈B then κ_new(h(u))=0; the membership hypothesis is required. |
| `CGZPublished.compare_natural` | functoriality | For a field embedding f, the Bloch and modified-CGZ symbol maps commute with κ_new, with identity/composition laws inherited from the free maps. |

**Unit tests.**

- `CGZPublished.test_compare_F5` (computation): κ_new:B(F₅)≅ℤ/3→B_new(F₅)≅ℤ/3 is an isomorphism and preserves c.
- `CGZPublished.test_compare_F7` (non-example): κ_new:B(F₇)≅ℤ/4→B_new(F₇)≅ℤ/2 has kernel generated by h(−1)=c, of order 2; κ_new(c)=0.
- `CGZPublished.test_compare_F11` (computation): κ_new:B(F₁₁)≅ℤ/6→B_new(F₁₁)≅ℤ/3 sends c to a generator and has kernel {0,3c}.

**Uses.**

- CGZ §2.1 and HB.1: provides a canonical input conversion before odd-primary finite Chern constructions.
- V.3 coefficient exports: specifies which integral map becomes the rational isomorphism.

**Acceptance.**

- κ_new(c)=[0], with 3[0]=0 when |F|≥4.
- No integral inverse is offered before the exact kernel is checked.

**Imports.** [`K3BlochGroups:V.3/cgz-published-bloch-group`](#v-3-cgz-published-bloch-group), [`K3BlochGroups:V.3/cgz-published-boundary`](#v-3-cgz-published-boundary), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/cgz-degenerate-relations`](#v-3-cgz-degenerate-relations), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism).

**Sources.** [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Lemma 2.2 and proof; [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Definition 2.1.

<a id="v-3-cgz-published-lemma-two-two"></a>

### V.3.35: CGZ Lemma 2.2 with its exact kernel

`K3BlochGroups:V.3/cgz-published-lemma-two-two` · theorem

For |F|≥4, κ_new:B(F)→B_new(F) is surjective, ker κ_new=B(F)∩H and 2·ker κ_new=0. Thus 0→B∩H→B→B_new→0 is exact, and B_new≃B/(B∩H) canonically. The cokernel is zero. This proves the published Lemma 2.2 without importing the nonzero-cokernel statement belonging to the older exterior convention. The |F|≥4 hypothesis is necessary for this theorem as stated: F₂ has a nonzero cokernel, and F₃ has an infinite kernel not killed by 2.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. Combine ker(p_neg∘∂)=B+H with Z_P¹/C_ext≃P/H, so B_new=(B+H)/H.
2. Every class represented by b+h equals the class of b, giving surjectivity. A Bloch class maps to zero exactly when it lies in H.
3. The inherited angle image is killed by 2, so its intersection with B is killed by 2. Use the additive quotient first-isomorphism theorem.
4. For F₂/F₃ compute the finite extended-relation matrices directly; no field-size-dependent angle lemma is invoked.

**Acceptance.**

- F₅ has zero kernel; F₇ and F₁₁ have a nonzero kernel of order 2.
- F₂ gives B=0 and B_new=ℤ/3; F₃ gives B=2ℤ and B_new=0.

**Imports.** [`K3BlochGroups:V.3/cgz-published-comparison-map`](#v-3-cgz-published-comparison-map), [`K3BlochGroups:V.3/cgz-published-target-kernel`](#v-3-cgz-published-target-kernel), [`K3BlochGroups:V.3/cgz-degenerate-relations`](#v-3-cgz-degenerate-relations), [`K3BlochGroups:V.3/angle-bracket-two-torsion`](#v-3-angle-bracket-two-torsion), [`K3BlochGroups:V.3/small-field-conventions`](#v-3-small-field-conventions), [`mathlib:Function.MulExact`](#baseline-mathlib-function-mulexact).

**Sources.** [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Lemma 2.2 and proof.

<a id="v-3-cgz-published-to-older"></a>

### V.3.36: The inclusion of the published group into the older CGZ convention

`K3BlochGroups:V.3/cgz-published-to-older` · comparison

For |F|≥4 let B_old be the inherited repaired exterior-kernel group. There is a canonical injection ι_new_old:B_new→B_old, identifying B_new with the image of B inside P/H. Its kernel is zero and its cokernel is B̃/(B+(B̃∩H)), killed by 2. The older comparison factors as κ_old=ι_new_old∘κ_new. The map is defined using the shared extended presentation P/H, not by a nonexistent general projection Q_neg→⋀²Fˣ. Over F₁₁ the inclusion is ℤ/3↪ℤ/6 of index 2. Over F₇ it is ℤ/2↪ℤ/4 of index 2. Hence the source version changes the integral target even though all three groups agree after inverting 2.

**Hypotheses.** F is a field with at least four elements. B_old retains the inherited id cgz-bloch-group and its repaired cycle-quotient definition.

**Construction and proof.**

1. Inside P/H the inherited old group is the image of B̃ and the published new group is the image of B. Since B≤B̃, their images have a canonical subgroup inclusion.
2. The image of B̃ is B̃/(B̃∩H); divide by the image of B to obtain the displayed cokernel. Injectivity is the subgroup inclusion, and its factorization follows on Bloch classes.
3. The inherited exterior-kernel-discrepancy, or cgz-convention-comparison, kills this cokernel by 2. The preceding published theorem supplies κ_new’s exact kernel.

**Acceptance.**

- Published surjectivity and older non-surjectivity are simultaneously visible in the F₁₁ diagram.
- Consumers cite a versioned node, not an unqualified CGZ Definition number.

**Imports.** [`K3BlochGroups:V.3/cgz-published-lemma-two-two`](#v-3-cgz-published-lemma-two-two), [`K3BlochGroups:V.3/cgz-bloch-group`](#v-3-cgz-bloch-group), [`K3BlochGroups:V.3/cgz-degenerate-relations`](#v-3-cgz-degenerate-relations), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`K3BlochGroups:V.3/exterior-kernel-discrepancy`](#v-3-exterior-kernel-discrepancy).

**Sources.** [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Lemma 2.2 and proof; [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Definition 2.1.

<a id="v-3-convention-coefficient-exports"></a>

### V.3.37: Coefficient changes for the exact convention maps

`K3BlochGroups:V.3/convention-coefficient-exports` · theorem

For |F|≥4, tensoring κ_new and ι_new_old with ℤ[1/2] or ℚ gives isomorphisms B→B_new→B_old; κ_old is their composite. Tensoring these maps with ℤ/n gives isomorphisms whenever n>0 is odd. The lecture comparison μ_rel:B_raw/K_raw→B becomes an isomorphism over ℤ[1/6] and ℚ, and modulo n>0 coprime to 6. These are the specified canonical maps, not merely abstract isomorphisms. The integral generic Goncharov comparison already has zero correction. For G₂^curv the exact rational kernel K_curv remains; its vanishing is not a coefficient export. Imposing the further relation [0]=0 on B_new kills its subgroup generated by κ_new(c), of order dividing 3, and the composite B→B_new/⟨[0]⟩ has exact kernel (B∩H)+⟨c⟩, killed by 6, with zero cokernel. This last quotient describes the effect of an extra degenerate-zero relation; it is not the generic Goncharov presentation.

**Hypotheses.** F is a field with at least four elements. Modulo n uses n>0 and the stated coprimality; the 2 and 3 exclusions are mathematical, not blanket algorithmic exclusions.

**Construction and proof.**

1. Flat localization or rationalization kills the displayed bounded-torsion kernels/cokernels while preserving exactness; apply the pinned Module.Flat.lTensor_exact and injectivity theorem.
2. For modulo n, do not invoke flatness of ℤ/n. If K and C are killed by m coprime to n, multiplication by n on them is an automorphism: Bézout gives the inverse. Use the two short exact sequences through the image to check f induces an isomorphism on quotient-by-n groups; then identify those with tensoring ℤ/n.
3. Apply this with m=2 to κ_new and ι_new_old, and m=6 to μ_rel; use the integral generic identification unchanged.
4. The extra quotient kills precisely the image of c: preimages differ by ker κ_new=B∩H. The inherited 6c=0 and 2H=0 give the kernel bound, with its 3-primary contribution explicitly located.

**Acceptance.**

- For F₁₁ the maps fail modulo 2 and become isomorphisms modulo every odd n.
- For F₅ the additional [0]=0 quotient is zero; its map from B≅ℤ/3 fails modulo 3.
- The lecture relation kernel is removed before tensoring: B_raw(ℚ)⊗ℚ→B(ℚ)⊗ℚ still has the infinite-order 4[−1] in its kernel.

**Imports.** [`K3BlochGroups:V.3/bloch-lecture-six-torsion`](#v-3-bloch-lecture-six-torsion), [`K3BlochGroups:V.3/cgz-published-lemma-two-two`](#v-3-cgz-published-lemma-two-two), [`K3BlochGroups:V.3/cgz-published-to-older`](#v-3-cgz-published-to-older), [`K3BlochGroups:V.3/goncharov-generic-comparison`](#v-3-goncharov-generic-comparison), [`K3BlochGroups:V.3/goncharov-curve-comparison`](#v-3-goncharov-curve-comparison), [`K3BlochGroups:V.3/three-c-angle-minus-one`](#v-3-three-c-angle-minus-one), [`mathlib:Module.Flat.lTensor_exact`](#baseline-mathlib-module-flat-ltensor-exact), [`mathlib:Module.Flat.lTensor_preserves_injective_linearMap`](#baseline-mathlib-module-flat-ltensor-preserves-injective-linearmap), [`mathlib:TensorProduct.map`](#baseline-mathlib-tensorproduct-map).

**Sources.** [Bloch2000](#source-3-bloch2000) — §6.1, p. 43, (6.1.2); [CGZ2023](#source-3-cgz2023) — §2.1, p. 391, Lemma 2.2 and proof; [Goncharov1995](#source-3-goncharov1995) — §1.9, p. 225, Conjecture 1.20.

### V.3 closure requirements

**Canonical smooth-curve projective specialization is an upstream dictionary input.** The pinned library has the scheme, integral/smooth predicates and function field, but no verified canonical map F(X)→P¹(F) at F-rational points with the complete local-DVR comparison contract. The requested AlgebraicCurves dictionary owns this input. Suggested signatures use its concrete typed imported map and do not define a private Prop proxy or assert this geometry is implemented. Boundary descent and the curve quotient comparison are conditional on that imported canonical construction.

Consumers: [`K3BlochGroups:V.3/goncharov-curve-b2`](#v-3-goncharov-curve-b2), [`K3BlochGroups:V.3/goncharov-curve-boundary`](#v-3-goncharov-curve-boundary), [`K3BlochGroups:V.3/goncharov-curve-comparison`](#v-3-goncharov-curve-comparison).

**The all-curve generic comparison has an unestablished rational kernel.** For fields with at least four elements and the precise all-smooth-connected-curves relation set of Goncharov 1995 §1.9, the map is a surjection with exact kernel K_curv=R_curv^ℚ/R_red. Equality of relation groups is Conjecture 1.20 in that source. No proof of the weight-two all-curve assertion for those fields was verified in the cited source decomposition. F₃ is a demonstrated exception with K_curv≅ℚ, not an unresolved case. The F(t)-only isomorphism from Polylogarithms:P.4 is a different statement and does not discharge this gap. The proof must locate and read an applicable proof or preserve this as a conjectural comparison; it must not claim a bounded-torsion correction for a rational vector-space kernel.

Consumers: [`K3BlochGroups:V.3/goncharov-curve-comparison`](#v-3-goncharov-curve-comparison), [`K3BlochGroups:V.3/convention-coefficient-exports`](#v-3-convention-coefficient-exports).

<a id="v4"></a>

## V.4: The infinite-field Suslin sequence

Use affine-block homology invariance and independent-vector chains to build
the frame coinvariant algebra. Its splitting separates Milnor symbols from
the complementary summand; multiplication by the frame element e must be
injective. Prove that injectivity together with spectral-sequence stability,
not by invoking the completed stability theorem. The ordered Milnor map gives
the stable quotient normalization and the degree-three torus generation used
by the configuration argument.

The projective-line complex gives ψ on H₃(GL₂); the projective-plane cyclic
construction gives ψ on H₃(GL₃). The d¹ swap and d³ Bloch-boundary calculations
fix the sign. Infinite configuration acyclicity, torus/Borel comparison and
the monomial-plus calculation produce the Suslin sequence. The enhanced Tor
arrow is an actual natural homomorphism, not a choice based on group orders.

Detect its left-hand torsion through algebraic closure and finite Chern
classes. The finite-coefficient Hurewicz arrow is K₄(F̄;ℤ/m)→H₄(SL(F̄);ℤ/m).
The cyclic Chern evaluation holds for every invertible m. The Bott-product
argument used in the comparison square has the sourced range m odd or 8∣m;
it is not stated at m=4. Detection of the order-two element therefore uses
m=8. Powering a cyclic group by a acts on H₃ by a², so the seventh-root
example with a=2 has multiplier 4. Ordinary tensors of divisible torsion
groups vanish; the surviving enhanced term is Tor, not their ordinary tensor.

**Planets.** [Configuration complex](#v-4-configuration-complex); [Enhanced roots of unity](#v-4-enhanced-mu); [Cross-ratio](#v-4-cross-ratio); [The map ψ : H₃(GL₃) → B(F)](#v-4-psi3-map); [The map ψ : H₃(GL₂) → B(F)](#v-4-psi-map); [Suslin's exact sequence](#v-4-suslin-exact-sequence).

<a id="v-4-configuration-complex"></a>

### V.4.1: The configuration complex of a set

`K3BlochGroups:V.4/configuration-complex` · construction

For a set X let C_n(X) be the free abelian group on the ordered tuples of n + 1 pairwise distinct points of X, with the alternating-sum differential that deletes one entry, and with the augmentation sending each singleton to 1. When a group acts on X this is a complex of modules over the group ring. The tuples are ordered and the entries are required to be distinct; both are part of the definition.

**Hypotheses.** X is a set; G is a group acting on X when the equivariant structure is used.

**Construction and proof.**

1. Define C_n(X) as the free abelian group on the injective maps Fin (n + 1) ↪ X, that is, ordered (n + 1)-tuples of pairwise distinct points.
2. Define d as the alternating sum of the n + 1 deletion maps and prove d ∘ d = 0: deleting entries i < j in the two orders gives the same tuple with opposite signs.
3. Define the augmentation C_0(X) → ℤ, (x) ↦ 1, and prove that it kills d(C_1(X)), since d(x_0, x_1) = (x_1) − (x_0).
4. For a group G acting on X, make C_n(X) the permutation representation of G on Fin (n + 1) ↪ X (Mathlib's Rep.ofMulAction) and prove that d and the augmentation are G-equivariant, so C_*(X) is a chain complex of G-modules.
5. Prove functoriality for injective maps of sets; a non-injective map does not preserve the generators. The general-position subcomplex of the projective plane and the rotations are separate nodes (V.4/general-position-complex, V.4/cyclic-complex-d).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `configComplex` | data | The chain complex C_*(X) of abelian groups (and of G-modules when G acts on X), indexed by ℕ. |
| `configComplex.single` | constructor | For an injective tuple x : Fin (n + 1) ↪ X, the basis element [x] of C_n(X). |
| `configComplex.d_single` | simp | d [x] = Σ_{i=0}^{n} (−1)^i [x ∘ Fin.succAbove i]. |
| `configComplex.d_comp_d` | relation | The differential squares to zero. |
| `configComplex.aug` | constructor | The augmentation C_0(X) → ℤ with aug [x] = 1. |
| `configComplex.aug_comp_d` | relation | aug ∘ d_1 = 0. |
| `configComplex.smul` | structure | The action of a group acting on X, by acting on every entry; g • [x] = [g • x]. |
| `configComplex.toRep` | compatibility | C_n(X) is Rep.ofMulAction ℤ G (Fin (n + 1) ↪ X) and d is a morphism of representations, so C_*(X) is a ChainComplex (Rep ℤ G) ℕ; Fin (n + 1) ↪ X is the index type of Mathlib's MulAction.IsMultiplyPretransitive. |
| `configComplex.map` | functoriality | An injection f : X ↪ Y induces a chain map, with map id = id and map (g ∘ f) = map g ∘ map f, compatible with the augmentations. |

**Unit tests.**

- `d_squared` (characterisation): d ∘ d = 0 in every degree; the unsigned sum of deletions fails, giving d d (x, y, z) = 2(x) + 2(y) + 2(z).
- `one_point` (degenerate): For a one-point set X, C_0(X) = ℤ, C_n(X) = 0 for n ≥ 1, and the augmentation is an isomorphism.
- `two_points_H1` (non-example): For X = {x, y}, H_1(C_*(X)) ≅ ℤ, generated by (x, y) + (y, x); a definition admitting repeated entries gives an acyclic complex here.
- `three_points_ranks` (computation): For |X| = 3 the groups C_0, C_1, C_2 have ranks 3, 6, 6 (ordered tuples, not the ranks 3, 3, 1 of subsets) and the homology is ℤ, 0, ℤ² in degrees 0, 1, 2.
- `d_one` (computation): d(x_0, x_1) = (x_1) − (x_0), and aug(d(x_0, x_1)) = 0.
- `equivariance` (compatibility): For G acting on X, d(g • s) = g • d(s) and aug(g • s) = aug(s) for every chain s.

**Uses.**

- V.4's computation of the coinvariants for the projective line: the degree-three coinvariants are identified with the pre-Bloch group.
- V.4's map psi on the homology of the general linear groups: the map is the edge map of the hyperhomology spectral sequence of this complex.
- Polylogarithms P.2: the configuration and cross-ratio cocycle used there is built on this complex.

**Acceptance.**

- The differential squares to zero.
- For X with a single point the complex is the integers in degree zero and nothing else.
- For X = {x, y} the complex is ℤ² → ℤ² with C_n = 0 for n ≥ 2 and H_1 ≅ ℤ generated by (x, y) + (y, x), whereas the chains of the simplicial set with n-simplices X^{n+1} (duplications allowed) are acyclic in positive degrees: the two are different complexes.

**Imports.** [`mathlib:FreeAbelianGroup`](#baseline-mathlib-freeabeliangroup), [`mathlib:Finsupp`](#baseline-mathlib-finsupp).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Definition VI.5.5 (PDF p. 497).

<a id="v-4-configuration-acyclicity"></a>

### V.4.2: Acyclicity of the configuration complex

`K3BlochGroups:V.4/configuration-acyclicity` · lemma

If X is an infinite set, the augmented configuration complex C_*(X) → ℤ is exact; equivalently the augmentation is a quasi-isomorphism. The identification of hyperhomology with group homology that the K-book deduces (Corollary VI.5.5.2) is part of V.4/hyperhomology-map, and the finite case (Exercise VI.5.1) is not planned, since it is used only for finite fields.

**Hypotheses.** X is an infinite set.

**Construction and proof.**

1. Let s be a chain of positive degree with d s = 0, or a chain of degree zero with augmentation zero. Its support is a finite subset X_0 of X; choose z ∈ X − X_0.
2. The prepending map s_z(x_0, …, x_n) = (z, x_0, …, x_n) sends injective tuples of X_0 to injective tuples of X and satisfies d s_z + s_z d = id on C_n(X_0) for n ≥ 1, and d s_z (x) = (x) − (z) in degree zero.
3. Hence s = d(s_z s) in positive degrees, and s = d(s_z s) also in degree zero when aug(s) = 0; so the augmented complex is exact.

**Acceptance.**

- For F infinite the augmented complexes C_*(ℙ¹(F)) → ℤ and C_*(ℙ²(F)) → ℤ are exact.
- A finite set never gives an acyclic complex: for |X| = d the homology is ℤ in degree 0 and free of rank the number of derangements of d letters in degree d − 1 (ranks 1, 2, 9, 44 for d = 2, 3, 4, 5, checked by computer). So ℙ¹(F_2) (3 points) and ℙ¹(F_3) (4 points) fail in degrees 2 and 3.
- The homotopy lands in C_*(X), not in C_*(X_0): each finite X_0 has nonzero top homology, and only the colimit is acyclic.

**Imports.** [`K3BlochGroups:V.4/configuration-complex`](#v-4-configuration-complex).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.5.1 and its proof (PDF p. 497); [Kbook.2013](#source-0-kbook-2013) — Exercise VI.5.1 (PDF p. 508).

<a id="v-4-hyperhomology-map"></a>

### V.4.3: Hyperhomology of a group with configuration coefficients, and the map to the coinvariants

`K3BlochGroups:V.4/hyperhomology-map` · construction

For a group G acting on a set X, construct the hyperhomology H_n(G, C_*(X)) as the homology of the total complex of P ⊗_G C_*(X) for a projective resolution P of ℤ over ℤ[G], prove that it does not depend on P and that a G-equivariant quasi-isomorphism of bounded-below complexes induces an isomorphism, and construct the canonical map H_n(G, C_*(X)) → H_n(C_G), where C_G = C_*(X) ⊗_G ℤ. When X is infinite the augmentation gives H_n(G, C_*(X)) ≅ H_n(G, ℤ) (K-book Corollary VI.5.5.2), and hence a map H_n(G, ℤ) → H_n(C_G).

**Hypotheses.** G is a group acting on the set X. For the identification with H_n(G, ℤ): X is infinite.

**Construction and proof.**

1. Form the double complex P ⊗_G C_*(X) from a projective resolution P of the trivial module (CategoryTheory.ProjectiveResolution; Mathlib's bar resolution) and take the homology of its total complex (HomologicalComplex₂.total).
2. Prove independence of P and naturality in the pair (G, X) by the comparison theorem.
3. Prove that a quasi-isomorphism of bounded-below complexes of G-modules induces an isomorphism on hyperhomology, by filtering the total complex by the resolution degree; apply it to the augmentation C_*(X) → ℤ, a quasi-isomorphism for infinite X by the acyclicity lemma.
4. Construct the map to H_n(C_G) induced by P → ℤ, that is, P ⊗_G C_*(X) → ℤ ⊗_G C_*(X).
5. Prove naturality for a group homomorphism G → G′ and a compatible injection X → X′.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `configHyperhomology` | data | H_n(G, C_*(X)), the homology of the total complex of P ⊗_G C_*(X). |
| `configHyperhomology.toCoinvariants` | constructor | The canonical map H_n(G, C_*(X)) → H_n(C_*(X) ⊗_G ℤ). |
| `configHyperhomology.iso_groupHomology` | compatibility | For X infinite, the augmentation induces H_n(G, C_*(X)) ≅ groupHomology (Rep.trivial ℤ G ℤ) n. |
| `configHyperhomology.map_quasiIso` | characterisation | A G-equivariant quasi-isomorphism of bounded-below complexes induces an isomorphism of hyperhomology. |
| `configHyperhomology.map` | functoriality | Naturality for a group homomorphism with a compatible injection of G-sets, commuting with toCoinvariants and iso_groupHomology. |

**Unit tests.**

- `trivial_group` (degenerate): For the trivial group the map H_n(1, C_*(X)) → H_n(C_*(X)) is the identity.
- `shapiro_terms` (compatibility): For G = GL_2(F) acting on ℙ¹(F), H_q(G, C_1(ℙ¹(F))) ≅ H_q(T_2, ℤ) via groupHomology.indIso; the stabiliser of (0, ∞, 1) is the centre, so H_q(G, C_2(ℙ¹(F))) ≅ H_q(F^×, ℤ).
- `range_restriction` (non-example): For G trivial and X = {x, y}, H_1(G, C_*(X)) ≅ ℤ while H_1(G, ℤ) = 0: without acyclicity the identification with group homology fails.
- `degree_zero` (computation): For X infinite and G transitive on X, H_0(G, C_*(X)) ≅ ℤ ≅ H_0(C_G), and the canonical map is an isomorphism.

**Uses.**

- V.4's map psi on the homology of GL_2: psi is the composite of this map with the identification of the coinvariants with the pre-Bloch group.
- V.4's map psi on the homology of GL_3: the same construction applied to the projective plane and the cyclic subcomplex.

**Acceptance.**

- For the trivial group the hyperhomology is H_n(C_*(X)) and the map to H_n(C_G) = H_n(C_*(X)) is the identity.
- For G = GL_2(F) and X = ℙ¹(F), H_q(G, C_1(X)) ≅ H_q(T_2, ℤ) by Shapiro's lemma (Mathlib's groupHomology.indIso) for the stabiliser T_2 of (0, ∞).
- The identification with group homology needs the acyclicity: for G trivial and X = {x, y}, H_1(G, C_*(X)) = H_1(C_*(X)) ≅ ℤ while H_1(G, ℤ) = 0.

**Imports.** [`K3BlochGroups:V.4/configuration-complex`](#v-4-configuration-complex), [`K3BlochGroups:V.4/configuration-acyclicity`](#v-4-configuration-acyclicity), [`mathlib:groupHomology`](#baseline-mathlib-grouphomology), [`mathlib:HomologicalComplex₂.total`](#baseline-mathlib-homologicalcomplex-u2082--total), [`mathlib:CategoryTheory.ProjectiveResolution`](#baseline-mathlib-categorytheory-projectiveresolution), [`mathlib:Representation.Coinvariants`](#baseline-mathlib-representation-coinvariants), [`mathlib:groupHomology.indIso`](#baseline-mathlib-grouphomology-indiso), [`mathlib:QuasiIso`](#baseline-mathlib-quasiiso).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Definition VI.5.5, second paragraph (PDF p. 497); [Kbook.2013](#source-0-kbook-2013) — Corollary VI.5.5.2 (PDF p. 497).

<a id="v-4-enhanced-mu"></a>

### V.4.4: The enhanced group of roots of unity

`K3BlochGroups:V.4/enhanced-mu` · definition

For a finite cyclic group A of even order there is a unique nontrivial extension Ã of A by ℤ/2 (0 → ℤ/2 → Ã → A → 0, with Ã cyclic of twice the order); for A of odd order set Ã = A. The K-book defines μ̃(F) as the union of the μ̃_n(F). A union needs transition maps, and these are not canonical (an extension of A = ℤ/m, m even, by ℤ/2 has the automorphism x ↦ (1 + m)x over A and ℤ/2), so define μ̃(F) by the choice-free model μ̃(F) = {ζ ∈ F̄^× : ζ² ∈ μ(F)} in a fixed algebraic closure, with the surjection ζ ↦ ζ² onto μ(F). Its kernel is μ_2(F̄) = {±1}, so μ̃(F) is the nontrivial extension when char F ≠ 2 (μ(F) contains −1 and has even order), and squaring is bijective when char F = 2, where μ̃(F) = μ(F). The group μ̃(F) is abstractly isomorphic to Tor_1^ℤ(μ(F), μ(F))~, but not naturally in F (V.4/tor-form-comparison).

**Hypotheses.** F is a field; the roots of unity are those of F.

**Construction and proof.**

1. Prove uniqueness of the nontrivial extension of a finite cyclic group of even order by ℤ/2, from Ext^1(ℤ/m, ℤ/2) ≅ ℤ/2.
2. Define μ̃(F) inside AlgebraicClosure F as the square roots of the roots of unity of F, with the squaring map to μ(F); prove it is surjective with kernel {±1}.
3. Prove that μ̃(F) is locally cyclic (a subgroup of μ(F̄)), so for char F ≠ 2 the extension does not split and each μ̃_n(F) is the K-book's enhancement; for char F = 2 prove μ̃(F) = μ(F).
4. Prove functoriality: an embedding F → E and a compatible embedding of algebraic closures give an injection μ̃(F) → μ̃(E) over μ(F) → μ(E); another choice of embedding changes it by a character μ̃(F) → {±1}, and injectivity, which is what the proof of Theorem 5.2 uses, holds for every choice.
5. Record the comparison with Tor_1^ℤ(μ(F), μ(F)): abstractly isomorphic to μ(F), naturally only up to the square of the cyclotomic character.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `enhancedRootsOfUnity` | data | μ̃(F) = {ζ ∈ (AlgebraicClosure F)^× : ζ² ∈ μ(F)}. |
| `enhancedRootsOfUnity.toRoots` | projection | The surjection ζ ↦ ζ² onto μ(F), with kernel {±1} (trivial in characteristic two). |
| `enhancedRootsOfUnity.odd_eq` | characterisation | In characteristic two the surjection is an isomorphism. |
| `enhancedRootsOfUnity.even_card` | characterisation | For char F ≠ 2 and μ(F) finite of order w, μ̃(F) is cyclic of order 2w, and the extension does not split. |
| `enhancedRootsOfUnity.finite_eq` | compatibility | For A = μ_n(F) of even order the preimage of A is the K-book's Ã. |
| `enhancedRootsOfUnity.map` | functoriality | A field embedding with a compatible embedding of algebraic closures induces an injection μ̃(F) → μ̃(E) over μ(F) → μ(E). |
| `enhancedRootsOfUnity.ne_tor` | compatibility | μ̃(F) ≅ Tor_1^ℤ(μ(F), μ(F))~ abstractly; no isomorphism is natural in F. |

**Unit tests.**

- `characteristic_two` (degenerate): In characteristic two, μ̃(F) = μ(F) and the surjection is the identity.
- `rational_numbers` (computation): For F = ℚ, μ̃(ℚ) = μ_4 is cyclic of order four while μ(ℚ) = {±1} has order two.
- `finite_field` (computation): For F = F_5, μ̃(F_5) = μ_8 ⊂ F_25^×, cyclic of order eight.
- `nonsplit` (non-example): For char F ≠ 2 the extension does not split: μ̃(ℚ) = μ_4 is not ℤ/2 ⊕ ℤ/2.
- `not_ordinary_tor` (non-example): For F = ℚ, Tor_1^ℤ(μ(ℚ), μ(ℚ)) ≅ ℤ/2 has order two, while μ̃(ℚ) has order four.

**Uses.**

- V.4's Suslin exact sequence: it is the left-hand term of the sequence.
- V.5's calculation for the rational numbers: its order four is what turns the order 24 of the indecomposable part into the order 6 of the Bloch group.
- HabiroNumberFields HB.1: the integral convention consumed there depends on which of the two groups is used.

**Acceptance.**

- For a field of characteristic two the enhancement is the identity, since the roots of unity have odd order.
- For the rational numbers the group of roots of unity has order two and its enhancement is μ_4, of order four, which is the value used in V.5.
- For an algebraically closed field of characteristic zero, μ̃(F) = μ(F) ≅ ℚ/ℤ, and the extension 0 → {±1} → μ̃(F) → μ(F) → 0 (squaring) does not split, although μ̃(F), μ(F) and Tor_1(μ(F), μ(F)) are all abstractly isomorphic to ℚ/ℤ. The groups differ for F = ℚ (orders four and two), not for algebraically closed F.

**Imports.** [`mathlib:rootsOfUnity`](#baseline-mathlib-rootsofunity), [`mathlib:CommGroup.torsion`](#baseline-mathlib-commgroup-torsion), [`mathlib:ZMod`](#baseline-mathlib-zmod), [`mathlib:AlgebraicClosure`](#baseline-mathlib-algebraicclosure).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Remark VI.5.1.2 (PDF p. 495).

<a id="v-4-cross-ratio"></a>

### V.4.5: The cross-ratio of four distinct points of the projective line

`K3BlochGroups:V.4/cross-ratio` · construction

For a field F and pairwise distinct points (a, b, c, d) of ℙ¹(F), let cr(a, b, c, d) = g(d) ∈ F − {0, 1}, where g is the unique element of PGL_2(F) with g(a) = 0, g(b) = ∞ and g(c) = 1; in homogeneous coordinates cr(a, b, c, d) = [d, a][c, b] / ([d, b][c, a]) with [u, v] = u₀v₁ − u₁v₀. Then cr is GL_2(F)-invariant, cr(0, ∞, 1, x) = x, cr induces a bijection from the GL_2(F)-orbits of injective 4-tuples onto F − {0, 1}, and the stabiliser in GL_2(F) of every injective triple is the centre.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Prove that PGL_2(F) acts simply transitively on injective triples of ℙ¹(F) (sharp 3-transitivity), refining Mathlib's 2-pretransitivity instance: for (a, b, c) take the matrix whose columns are lifts of a and b, scaled so that their sum lifts c.
2. Define cr by the determinant formula, prove it equals g(d) for the normalising g, and deduce invariance and cr(0, ∞, 1, x) = x.
3. Deduce that injective 4-tuples are classified up to GL_2(F) by cr, and that the stabiliser of an injective triple in GL_2(F) is the scalar subgroup.
4. Compute the cross-ratios of the five faces of (0, ∞, 1, x, y): (∞, 1, x, y) ↦ (1 − x)/(1 − y), (0, 1, x, y) ↦ (1 − x^{−1})/(1 − y^{−1}), (0, ∞, x, y) ↦ y/x, (0, ∞, 1, y) ↦ y and (0, ∞, 1, x) ↦ x.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `crossRatio` | data | cr : (Fin 4 ↪ ℙ¹(F)) → F − {0, 1}, by the determinant formula. |
| `crossRatio_smul` | simp | cr(g • t) = cr(t) for g ∈ GL_2(F). |
| `crossRatio_std` | simp | cr(0, ∞, 1, x) = x for x ∉ {0, 1}. |
| `crossRatio_eq_iff` | characterisation | cr(t) = cr(t′) if and only if t′ = g • t for some g ∈ GL_2(F). |
| `isMultiplyPretransitive_three` | instance | GL_2(F) is 3-pretransitive on ℙ¹(F), and the stabiliser of (0, ∞, 1) is the centre. |
| `crossRatio_swap` | relation | cr(b, a, c, d) = cr(a, b, c, d)^{−1} and cr(a, b, d, c) = cr(a, b, c, d)^{−1}. |
| `crossRatio_faces` | relation | The five face values of (0, ∞, 1, x, y) listed in the proof steps. |

**Unit tests.**

- `crossRatio_std_test` (computation): cr(0, ∞, 1, x) = x and cr(∞, 0, 1, x) = x^{−1}.
- `crossRatio_invariant` (characterisation): Over ℚ, z ↦ z + 1 sends (0, ∞, 1, 2) to (1, ∞, 2, 3), and cr(1, ∞, 2, 3) = 2.
- `crossRatio_F3` (degenerate): Over F_3, every ordering of the four points of ℙ¹(F_3) has cross-ratio −1.
- `crossRatio_not_unordered` (non-example): cr(0, ∞, 1, x) ≠ cr(∞, 0, 1, x) when x² ≠ 1, so cr is not a function of the underlying set of four points.

**Uses.**

- V.4/coinvariants-p1-homology: identifies C_3 ⊗_G ℤ with the free abelian group on the [x] and computes the boundary of a 4-simplex.
- Polylogarithms P.2/hyperbolic-volume: imports the configuration and cross-ratio machinery from V.4, which owns it.

**Acceptance.**

- cr(0, ∞, 1, x) = x and cr(∞, 0, 1, x) = x^{−1}.
- The face values of step 4 are those displayed in the proof of K-book Lemma 5.6, so the boundary of a 4-simplex is the five-term element of V.3.
- Over F_2 there are no injective 4-tuples (ℙ¹(F_2) has three points), and over F_3 there is exactly one orbit, with cross-ratio −1.

**Imports.** [`mathlib:OnePoint.equivProjectivization`](#baseline-mathlib-onepoint-equivprojectivization), [`mathlib:Projectivization.generalLinearGroup_is_two_pretransitive`](#baseline-mathlib-projectivization-generallineargroup-is-two-pretransitive), [`mathlib:MulAction.IsMultiplyPretransitive`](#baseline-mathlib-mulaction-ismultiplypretransitive), [`mathlib:Matrix.GeneralLinearGroup`](#baseline-mathlib-matrix-generallineargroup).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proof of Lemma VI.5.6 (PDF p. 498).

<a id="v-4-coinvariants-p1-homology"></a>

### V.4.6: The coinvariant complex of the projective line

`K3BlochGroups:V.4/coinvariants-p1-homology` · lemma

Let F be a field, G the group of invertible two by two matrices over F acting on the projective line of F, and C_G the coinvariant complex. Then the degree-zero homology is the integers, the homology vanishes in degrees one and two, and the degree-three homology is the pre-Bloch group P(F). The identification sends the class of the tuple consisting of 0, infinity, 1 and x to the generator [x].

**Hypotheses.** F is a field (any field: the computation also holds for F_2, where C_3 = 0 = P(F_2), and for F_3, where C_4 = 0 and P(F_3) ≅ ℤ on [−1]); G = GL_2(F) acts on ℙ¹(F).

**Construction and proof.**

1. For n ≤ 2, G acts transitively on the injective (n + 1)-tuples of ℙ¹(F) (sharp 3-transitivity, V.4/cross-ratio), so C_n ⊗_G ℤ ≅ ℤ; this is the coinvariants of a transitive permutation module, and needs no Shapiro lemma.
2. d_1 ⊗ ℤ = 0, since d(0, ∞) = (∞) − (0) ≡ 0; d_2 ⊗ ℤ is an isomorphism ℤ → ℤ, since d(0, 1, ∞) ≡ (0, 1); hence H_0 = ℤ and H_1 = H_2 = 0.
3. In degree three the G-orbits of injective 4-tuples are classified by the cross-ratio, normalised by (0, ∞, 1, x) ↦ x, and every stabiliser is the centre F^×·1. So C_3 is the direct sum over x ∈ F − {0, 1} of permutation modules ℤ[G/F^×] (not a free ℤ[G]-module, as the K-book says), and C_3 ⊗_G ℤ is free abelian on the symbols [x]. Likewise C_4 ⊗_G ℤ is free on the orbits of (0, ∞, 1, x, y).
4. d_3 ⊗ ℤ = 0: the four faces of (0, ∞, 1, x) all map to the generator of C_2 ⊗_G ℤ ≅ ℤ, with alternating signs.
5. By the face values of V.4/cross-ratio, d(0, ∞, 1, x, y) = [(1 − x)/(1 − y)] − [(1 − x^{−1})/(1 − y^{−1})] + [y/x] − [y] + [x], the five-term element of V.3. Since no tuple has cross-ratio 1, the cokernel of d_4 ⊗ ℤ is the free group on [x], x ∉ {0, 1}, modulo the five-term elements, which is P(F) with [1] = 0.

**Acceptance.**

- The boundary of the four-simplex is the five-term element, which is the acceptance test tying the geometry to the presentation of V.3.
- The lemma holds for every field, including F_2 and F_3; what fails for small fields is the acyclicity of C_*(ℙ¹(F)), since |ℙ¹(F_q)| = q + 1 (three points for F_2, not seven).
- The stabiliser of four distinct points in GL_2(F) is the centre, so E^1_{3,q} = ⊕_x H_q(F^×, ℤ) is nonzero for q > 0; only the coinvariants (q = 0) are free on the [x].

**Imports.** [`K3BlochGroups:V.4/configuration-complex`](#v-4-configuration-complex), [`K3BlochGroups:V.4/cross-ratio`](#v-4-cross-ratio), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`mathlib:Representation.Coinvariants`](#baseline-mathlib-representation-coinvariants), [`mathlib:OnePoint.equivProjectivization`](#baseline-mathlib-onepoint-equivprojectivization).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.6 and its proof (PDF p. 498).

<a id="v-4-monomial-subgroups"></a>

### V.4.7: The diagonal and monomial subgroups

`K3BlochGroups:V.4/monomial-subgroups` · definition

For a field F and n ≥ 1 let T_n ⊂ GL_n(F) be the diagonal matrices, Σ_n ⊂ GL_n(F) the permutation matrices and M_n = T_n ⋊ Σ_n ≅ F^× ≀ Σ_n the monomial matrices (one nonzero entry in each row and column). Let M = ⋃_n M_n ≅ F^× ≀ Σ_∞ and Σ_∞ = ⋃_n Σ_n inside GL(F), with M_n ⊂ M_{n+1} by block sum with 1.

**Hypotheses.** F is a field; n ≥ 1.

**Construction and proof.**

1. T_n is the image of (F^×)^n under the diagonal embedding, and Σ_n the image of the permutation-matrix embedding.
2. M_n is generated by T_n and Σ_n, T_n is normal in M_n, and M_n = T_n ⋊ Σ_n.
3. Block sum with 1 gives compatible inclusions, and M and Σ_∞ are the unions.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `diagonalSubgroup` | data | T_n as a subgroup of GL_n(F). |
| `permSubgroup` | data | Σ_n as permutation matrices in GL_n(F). |
| `monomialSubgroup` | data | M_n as a subgroup of GL_n(F). |
| `diagonalSubgroup_normal` | relation | T_n is normal in M_n with quotient Σ_n, and M_n = T_n ⋊ Σ_n. |
| `diagonalSubgroup_equiv` | characterisation | T_n ≅ (F^×)^n. |
| `monomialSubgroup.stable` | functoriality | The inclusions M_n ⊂ M_{n+1} by block sum, and M = ⋃ M_n ≅ F^× ≀ Σ_∞ in GL(F). |

**Unit tests.**

- `monomial_card_F2` (computation): For F = F_2, M_2 has order two and T_2 is trivial.
- `diagonal_iso` (characterisation): T_n is isomorphic to (F^×)^n.
- `monomial_not_all` (non-example): For n = 2 and F = F_3, M_2 is a proper subgroup of GL_2(F_3), of order 8 against 48.
- `monomial_one` (degenerate): For n = 1, T_1 = M_1 = GL_1(F) = F^×.

**Uses.**

- V.4/psi-gl2 and V.4/psi-gl3: the exactness through H_3(M_2) and H_3(T_3) is stated with these subgroups.
- V.4/monomial-sequence and V.4/pi3-bm-plus: M = colim M_n is the monomial group whose plus construction computes the enhanced term.

**Acceptance.**

- M_2(F_2) = Σ_2 has order two and T_2(F_2) is trivial.
- For |F| ≥ 3, M_n is the normaliser of T_n in GL_n(F).

**Imports.** [`mathlib:Matrix.GeneralLinearGroup`](#baseline-mathlib-matrix-generallineargroup).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Before Theorem VI.5.7 (PDF p. 498); [Kbook.2013](#source-0-kbook-2013) — Monomial matrices, before Proposition VI.5.15 (PDF p. 503).

<a id="v-4-general-position-complex"></a>

### V.4.8: The general-position complex of the projective plane

`K3BlochGroups:V.4/general-position-complex` · construction

For a field F let GP_n ⊆ C_n(ℙ²(F)) be spanned by the (n + 1)-tuples of points of ℙ²(F) no three of which are collinear. GP_* is a subcomplex of the configuration complex, stable under GL_3(F) and under the rotations t_n. For F infinite, GP_* → ℤ, and hence GP_* → C_*(ℙ²(F)), is a quasi-isomorphism.

**Hypotheses.** F is a field; for the acyclicity, F is infinite.

**Construction and proof.**

1. Deleting a point preserves general position, so GP_* is a subcomplex; linear automorphisms and cyclic reordering preserve collinearity.
2. For a cycle with finite support S, choose z ∈ ℙ²(F) outside S and off the finitely many lines through two points of S (possible since F is infinite, so ℙ²(F) is not a finite union of lines); the prepending homotopy of V.4/configuration-acyclicity then stays inside GP_*.
3. Compose with the acyclicity of C_*(ℙ²(F)).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `gpComplex` | data | The subcomplex GP_* of configComplex (ℙ²(F)). |
| `gpComplex.le` | compatibility | GP_* is a subcomplex of configComplex (ℙ²(F)), with the induced augmentation. |
| `gpComplex.smul` | structure | The GL_3(F)-action on GP_*. |
| `gpComplex.rotate` | structure | The rotations t_n preserve GP_n. |
| `gpComplex.aug_quasiIso` | characterisation | For F infinite, GP_* → ℤ is a quasi-isomorphism. |

**Unit tests.**

- `frame_orbit` (computation): GL_3(F) acts transitively on GP_3, and GP_3 ⊗_{GL_3(F)} ℤ ≅ ℤ, generated by P = (p_1, p_2, q, p_3).
- `collinear_excluded` (non-example): ((1 : 0 : 0), (0 : 1 : 0), (1 : 1 : 0)) is a generator of C_2(ℙ²(F)) but not of GP_2.
- `rotation_stable` (characterisation): t_n(GP_n) = GP_n, and every face map sends GP_n into GP_{n−1}.
- `small_field` (degenerate): Over F_2, GP_n = 0 for n ≥ 4: the largest sets of points of ℙ²(F_2) with no three collinear have four points.

**Uses.**

- V.4/cyclic-complex-d: the cone construction is applied to this subcomplex of the configuration complex of P^2.
- V.4/psi3-map: the map ψ′ is defined on its degree-three coinvariants.

**Acceptance.**

- For F infinite, GP_* → ℤ is a quasi-isomorphism.
- GL_3(F) acts transitively on GP_n for n ≤ 3 (on ordered projective frames for n = 3), and the stabiliser of the frame (p_1, p_2, q, p_3) is the centre.

**Imports.** [`K3BlochGroups:V.4/configuration-complex`](#v-4-configuration-complex), [`K3BlochGroups:V.4/configuration-acyclicity`](#v-4-configuration-acyclicity), [`mathlib:Projectivization`](#baseline-mathlib-projectivization), [`mathlib:Matrix.GeneralLinearGroup`](#baseline-mathlib-matrix-generallineargroup).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Example VI.5.9.1 (PDF p. 500).

<a id="v-4-cyclic-complex-d"></a>

### V.4.9: The rotations, the complex omitting the last face, the norm and the cone D

`K3BlochGroups:V.4/cyclic-complex-d` · construction

Let C_* be the configuration complex C_*(X), or the general-position complex of ℙ²(F). The rotations t_n(x_0, …, x_n) = (x_n, x_0, …, x_{n−1}) preserve the generators and satisfy t_n^{n+1} = 1, ∂_0 t_n = ∂_n and ∂_i t_n = t_{n−1} ∂_{i−1} for i ≥ 1: C_* is a precyclic abelian group (faces and rotations, no degeneracies; duplicating an entry leaves the complex). Construct C^a_*, with the same terms and differential d^a = Σ_{i=0}^{n−1} (−1)^i ∂_i (the last face omitted), the norm N = Σ_{i=0}^{n} ((−1)^n t_n)^i : C_n → C^a_n, which is a chain map, and the mapping cone D_* of the truncated morphism N : C_{≥1} → C^a_{≥1}: D_0 = C^a_1 and D_n = C^a_{n+1} ⊕ C_n for n > 0, with differential (x, y) ↦ (d^a x − N y, −d y). For X infinite (for the general-position complex, F infinite), C^a_* is acyclic and ε : D_0 → ℤ, (x_0, x_1) ↦ 1, induces a quasi-isomorphism D_* → ℤ.

**Hypotheses.** X is a set; for the acyclicity statements X is infinite, and for the general-position complex of ℙ²(F), F is infinite.

**Construction and proof.**

1. Check that faces and rotations preserve injective tuples and general-position tuples, and check the precyclic identities.
2. Prove d^a N = N d, so N is a chain map C_* → C^a_*. The K-book's N = Σ_i (−1)^i t_n^i is not a chain map for even n (it fails on (x, y, z)); the signed rotation (−1)^n t_n is needed (source issues).
3. Prove C^a_* acyclic for infinite X by the prepending homotopy s_z(x) = (z, x): d^a s_z + s_z d^a = id on chains whose support avoids z. For the general-position complex choose z off the finitely many lines through two points of the support. The extra degeneracy of a cyclic set with duplications is not available here.
4. Since N_0 is the identity, truncate and form D_* with the displayed differential; check d ∘ d = 0 using d^a N = N d.
5. Prove that (b, c) ↦ b gives a quasi-isomorphism cone(N)[1] → C_* (C^a_* is acyclic) and that cone(N)[1] → D_* is a quasi-isomorphism; with the acyclicity of C_* (V.4/configuration-acyclicity, V.4/general-position-complex) conclude that ε : D_* → ℤ is a quasi-isomorphism.
6. Record equivariance: a group acting on X (GL_3(F) on ℙ²(F)) acts on C_*, C^a_*, N and D_*.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `precyclicConfig` | structure | The rotations t_n on injective (or general-position) tuples, with t_n^{n+1} = 1, ∂_0 t_n = ∂_n and ∂_i t_n = t_{n−1} ∂_{i−1} for i ≥ 1. |
| `acyclicConfig` | data | The complex C^a_* with differential d^a omitting the last face. |
| `acyclicConfig_exact` | characterisation | For infinite X (general position: infinite F), C^a_* is exact in every degree, including degree zero. |
| `normMap` | constructor | N = Σ_{i=0}^{n} ((−1)^n t_n)^i, a chain map C_* → C^a_*. |
| `coneD` | data | The complex D_* with D_0 = C^a_1, D_n = C^a_{n+1} ⊕ C_n and differential (x, y) ↦ (d^a x − N y, −d y). |
| `coneD.aug` | constructor | ε : D_0 → ℤ, (x_0, x_1) ↦ 1. |
| `coneD_quasiIso` | characterisation | The shifted cone of N maps quasi-isomorphically to C_* and to D_*, and ε : D_* → ℤ is a quasi-isomorphism for infinite X. |
| `coneD.smul` | structure | The action of a group acting on X, commuting with d^a, N and the cone differential. |

**Unit tests.**

- `acyclicity` (characterisation): For X infinite, H_n(C^a_*(X)) = 0 for all n ≥ 0; in degree zero d^a(x_0, x_1) = (x_1) is onto.
- `finite_failure` (non-example): For |X| = 3, H_2(C^a_*(X)) is free of rank 3 (and for |X| = 4, H_3 has rank 8; checked by computer), so the infinite hypothesis is needed.
- `norm_chain_map` (non-example): On (x, y, z) the norm Σ_i ((−1)^2 t)^i = 1 + t + t² satisfies d^a N = N d, while Σ_i (−1)^i t^i does not.
- `cone_degree_zero` (computation): D_0 = C^a_1, and d(x, y) = d^a x − N y on D_1 = C^a_2 ⊕ C_1.
- `cyclic_identities` (characterisation): t_n^{n+1} = 1 and ∂_0 t_n = ∂_n on injective tuples; for X = {x, y}, t_1(x, y) = (y, x).

**Uses.**

- V.4/psi3-map: ψ is defined on the coinvariants of D_* for the general-position complex of ℙ²(F).
- V.4/psi3-torus-vanishing: the T_3-equivariant section of ε splits D_* as ℤ ⊕ D′_*.

**Acceptance.**

- For X infinite, and for the general-position complex over an infinite field, D_* → ℤ is a quasi-isomorphism.
- D_0 = C^a_1, and d : D_1 = C^a_2 ⊕ C_1 → D_0 is (x, y) ↦ d^a x − N y.
- C_*(X) is not the normalised complex of the simplicial abelian group ℤ[X^{•+1}] of tuples with duplications: for X = {x, y} the latter is acyclic, the former has H_1 ≅ ℤ. No degeneracy is used anywhere in the construction.

**Imports.** [`K3BlochGroups:V.4/configuration-complex`](#v-4-configuration-complex), [`K3BlochGroups:V.4/configuration-acyclicity`](#v-4-configuration-acyclicity), [`K3BlochGroups:V.4/general-position-complex`](#v-4-general-position-complex), [`mathlib:QuasiIso`](#baseline-mathlib-quasiiso).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Definition VI.5.9 (PDF p. 500); [Kbook.2013](#source-0-kbook-2013) — (5.9.1) (PDF p. 500).

<a id="v-4-psi3-map"></a>

### V.4.10: The map psi from the third homology of GL_3 to the pre-Bloch group

`K3BlochGroups:V.4/psi3-map` · construction

Let F be infinite, D_* the cone complex of V.4/cyclic-complex-d for the general-position complex of ℙ²(F), and D_G = D_* ⊗_{GL_3(F)} ℤ. Then (D_G)_3 = ℤP ⊕ ⊕ ℤ[a; x], with P = (p_1, p_2, q, p_3) in the C_3 summand and [a; x] = (p_1, p_2, q, (1 : a : x), p_3) in the C^a_4 summand (a, x ∉ {0, 1}, a ≠ x), and d : (D_G)_3 → (D_G)_2 is zero. Define ψ′ : (D_G)_3 → P(F) by ψ′([a; x]) = [a] (the cross-ratio of the projection from the last point) and ψ′(P) = −2c. Then ψ′ vanishes on d((D_G)_4), so it induces ψ : H_3(GL_3(F), ℤ) ≅ H_3(GL_3(F), D_*) → H_3(D_G) → P(F). The K-book prints ψ′([a; x]) = a and ψ′(P) = 2c; with its displayed cone differential the sign of the P-value must be −2c (source issues).

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. Identify (D_G)_n for n ≤ 4: GL_3(F) is transitive on general-position tuples of length at most four, and 5- and 6-tuples are parametrised by [a; x] and [a b; x y] (a, x, b, y ∉ {0, 1}, a ≠ x, b ≠ y, a ≠ b, x ≠ y, ay ≠ bx).
2. Check in D_G that d^a[a; x] = 0, N(P) = 0 and d(P) = 0, so d : (D_G)_3 → (D_G)_2 is zero; d[a; x] = P in C_3 ⊗ ℤ. (The K-book writes N([a; x]) = 0, which is false: N[a; x] is a sum of five generators.)
3. ψ′ kills d(z, 0) = (d^a z, 0) for 6-tuples z, by the five-term relation for the five points projected from p_3.
4. ψ′ kills d(0, [a; x]) = (−N[a; x], −P): Σ_{i=0}^{4} ψ′(t^i[a; x]) = 2c in P(F), so this needs ψ′(P) = −2c. This is the calculation of [187, 3.3], not reproduced in the K-book (recorded gap); it was checked by computer in P(F_p) for p = 7, 11, 13, 17, 19 and all admissible (a, x).
5. Compose with H_3(GL_3(F), ℤ) ≅ H_3(GL_3(F), D_*) (D_* → ℤ is a quasi-isomorphism) and the map to H_3(D_G) (V.4/hyperhomology-map).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `psiPrime` | data | ψ′ : (D_G)_3 → P(F), with ψ′([a; x]) = [a] and ψ′(P) = −2c. |
| `psiPrime_comp_d` | relation | ψ′ ∘ d = 0 on (D_G)_4. |
| `psiGL3` | constructor | The induced homomorphism H_3(GL_3(F), ℤ) → P(F). |
| `psiGL3_natural` | functoriality | Naturality for field homomorphisms F → E. |
| `psiGL3_stable` | compatibility | The extension of ψ to H_3(GL(F), ℤ) through H_3(GL_3(F)) ≅ H_3(GL(F)) (Remark VI.5.12.1). |

**Unit tests.**

- `psi3_std` (computation): ψ′([a; x]) = [a], the cross-ratio of the projection of (p_1, p_2, q, (1 : a : x)) from p_3.
- `psi3_norm` (characterisation): Σ_{i=0}^{4} ψ′(t^i[a; x]) = 2c in P(F); for F = F_11 this holds for all 72 admissible (a, x), and forces ψ′(P) = −2c.
- `psi3_five_term` (characterisation): ψ′ ∘ d^a vanishes on every general-position 6-tuple (p_1, p_2, q, r, s, p_3).
- `psi3_not_B` (non-example): ψ′ does not take values in B(F): ψ′([2; x]) = [2] ∉ B(ℚ). Only the induced map on H_3 lands in B(F) (Proposition 5.12).

**Uses.**

- V.4/psi-gl3: Proposition 5.12 identifies the image of this map with B(F).
- V.4/suslin-functoriality: naturality of Suslin's sequence is checked through this map.

**Acceptance.**

- ψ′([a; x]) = [a] is forced by Lemma 5.10: the projection of (p_1, p_2, q, (1 : a : x)) from p_3 is (0, ∞, 1, a).
- With the K-book's values ψ′(P) = 2c and ψ′([a; x]) = [a] and its cone differential, ψ′(d(0, [a; x])) = −4c = 2c, which is nonzero in P(F_11) and P(F_17).

**Imports.** [`K3BlochGroups:V.4/cyclic-complex-d`](#v-4-cyclic-complex-d), [`K3BlochGroups:V.4/general-position-complex`](#v-4-general-position-complex), [`K3BlochGroups:V.4/hyperhomology-map`](#v-4-hyperhomology-map), [`K3BlochGroups:V.4/cross-ratio`](#v-4-cross-ratio), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Before Lemma VI.5.10 (PDF p. 501).

<a id="v-4-psi3-torus-vanishing"></a>

### V.4.11: psi vanishes on the homology of the diagonal torus

`K3BlochGroups:V.4/psi3-torus-vanishing` · lemma

Let F be infinite and T_3 ⊂ GL_3(F) the diagonal torus. For n > 0 the map H_n(T_3, ℤ) → H_n(D_* ⊗_{T_3} ℤ) is zero; hence ψ vanishes on the image of H_3(T_3, ℤ) in H_3(GL_3(F), ℤ).

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. p_1 = (1 : 0 : 0) and p_2 = (0 : 1 : 0) are fixed by T_3 (the K-book writes p_2 = (0 : 0 : 1)), so ε : D_0 → ℤ has the T_3-equivariant section 1 ↦ (p_1, p_2), and D_* ≅ ℤ ⊕ D′_* as T_3-complexes with D′_* acyclic.
2. Hence H_n(T_3, D′_*) = 0 for n > 0, and H_n(T_3, ℤ) → H_n(D_{T_3}) = H_n(D′_{T_3}) factors through it.
3. ψ on H_3(T_3) factors as H_3(T_3) → H_3(D_{T_3}) → H_3(D_G) −ψ′→ P(F), so it is zero.

**Acceptance.**

- ψ vanishes on the image of H_3(T_3, ℤ).
- The lemma is about T_3 only: it fails for GL_2 ⊂ GL_3, whose image under ψ is B(F).

**Imports.** [`K3BlochGroups:V.4/psi3-map`](#v-4-psi3-map), [`K3BlochGroups:V.4/cyclic-complex-d`](#v-4-cyclic-complex-d), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`K3BlochGroups:V.4/hyperhomology-map`](#v-4-hyperhomology-map).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.11 (PDF p. 501).

<a id="v-4-dupont-sah-identity"></a>

### V.4.12: The Dupont-Sah identities in the pre-Bloch group

`K3BlochGroups:V.4/dupont-sah-identity` · lemma

Let F be a field with at least four elements and x ∈ F − {0, 1, −1}. Then (i) [x²] = 2([x] + [−x] + [−1]) in P(F), and (ii) [x²] + 2[−x^{−1}] − 2[x − 1] − [(1 − x)^{−2}] = 2c. The K-book's Exercise VI.5.5 prints (ii) as [x²] + 2[−x²] − 2[x − 1] − [1/x²] = 2c, which is false (source issues).

**Hypotheses.** F is a field with at least four elements; x ∉ {0, 1, −1}; [1] = 0.

**Construction and proof.**

1. Derive (i) from five-term relations (the distribution relation of Dupont and Sah). The K-book leaves it as an exercise, so the derivation must be written out (recorded gap).
2. Derive (ii) from (i), the five-term relations and the independence of c (V.3/element-c).

**Acceptance.**

- (ii) holds in P(F_p) for p = 5, 7, 11, 13, 17, 19, 23 and every admissible x (checked by computer), and the Bloch–Wigner function vanishes on (ii) minus 2c; the printed form fails in P(F_5) at x = 3, and the Bloch–Wigner value of its left side is nonzero.
- (i) holds in P(F_p) for p = 5, …, 17 and has Bloch–Wigner value zero.

**Imports.** [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`K3BlochGroups:V.3/element-c`](#v-3-element-c).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Exercise VI.5.5 (PDF p. 508).

<a id="v-4-pi3ind-definition"></a>

### V.4.13: The indecomposable third homotopy group of the monomial plus construction

`K3BlochGroups:V.4/pi3ind-definition` · definition

For a field F let M = F^× ≀ Σ_∞ be the monomial group and BM^+ its plus construction with respect to the perfect commutator subgroup P = [M, M]. Define π_3^ind(BM^+) as the quotient of π_3(BM^+) by the image of the products π_1(BM^+) ⊗ π_2(BM^+) → π_3(BM^+) in the graded ring π_*(ℤ × BM^+) ≅ π_*K(F^×-Sets_fin), together with the natural maps π_3^ind(BM^+) → π^s_3/(η³) ≅ ℤ/12 and π_3^ind(BM^+) → K_3^ind(F).

**Hypotheses.** F is a field.

**Construction and proof.**

1. Import the plus construction (StableHomotopyKTheory H.3) and the Barratt–Priddy–Quillen identification ℤ × BM^+ ≃ K(F^×-Sets_fin) with its ring structure (recorded gap).
2. Define the quotient by the image of the product map.
3. The map to π^s_3/(η³) comes from the retraction onto the base-point summand F^× → 1, and the map to K_3^ind(F) from the ring map to K_*(F), which sends products into the image of K^M_3(F).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `pi3Ind` | data | π_3^ind(BM^+) for the monomial group of F. |
| `pi3Ind.mk` | constructor | The quotient map π_3(BM^+) → π_3^ind(BM^+). |
| `pi3Ind.toStable` | projection | The natural map to π^s_3/(η³) ≅ ℤ/12, split by the unit π^s_3 → π_3(BM^+). |
| `pi3Ind.toK3ind` | projection | The map to K_3^ind(F) induced by the ring map to K_*(F). |
| `pi3Ind.map` | functoriality | Naturality for field homomorphisms, through F^× ≀ Σ_∞ → E^× ≀ Σ_∞. |

**Unit tests.**

- `pi3ind_F2` (degenerate): For F = F_2, π_3^ind(BM^+) ≅ ℤ/12.
- `pi3ind_toStable_split` (characterisation): π_3^ind(BM^+) → ℤ/12 is split surjective, split by the unit π^s_3 → π_3(BM^+).
- `pi3ind_not_pi3` (non-example): For F = F_2 the quotient is ℤ/12, not π_3 = ℤ/24: the product η · η² = η³ ≠ 0 is divided out.
- `pi3ind_Q` (computation): For F = ℚ, π_3^ind(BM^+) ≅ ℤ/4 ⊕ ℤ/12.

**Uses.**

- V.4/pi3ind-sequence and V.4/pi3ind-ahss: Corollary 5.16.1 and Proposition 5.17 are statements about this quotient.
- V.4/enhanced-tor and V.4/e-invariant-detection: the enhanced torsion term is the kernel of its map to Z/12.

**Acceptance.**

- For F = F_2, M = Σ_∞, π_3(BM^+) = π^s_3 ≅ ℤ/24 and the products are generated by η³ = 12ν, so π_3^ind(BM^+) ≅ ℤ/12.
- For F = ℚ, π_3^ind(BM^+) ≅ ℤ/4 ⊕ ℤ/12 (Corollary 5.20).

**Imports.** [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — After Theorem VI.5.16 (PDF p. 505).

<a id="v-4-pi3ind-ahss"></a>

### V.4.14: The Atiyah-Hirzebruch computation of the indecomposable group

`K3BlochGroups:V.4/pi3ind-ahss` · theorem

For a field F there is a natural exact sequence 0 → μ_2(F) → π_3^ind(BM^+) −γ→ Tor_1^ℤ(μ(F), μ(F)) ⊕ ℤ/12 → 0, where the Tor term is H_3(F^×, ℤ)/∧³F^× (Ex. VI.5.9(a)). The K-book writes μ(F) for that term; the two are isomorphic, but not naturally in F (Ex. VI.5.9(b)).

**Hypotheses.** F is a field.

**Construction and proof.**

1. Analyse the Atiyah–Hirzebruch spectral sequence E^2_{p,q} = H_p(F^×, π^s_q) ⇒ π_{p+q}(ℤ × BM^+) as a module over π^s_* (StableHomotopyKTheory H.6 for the spectral sequence of a filtered spectrum; the Barratt–Priddy–Quillen input is a recorded gap).
2. E^2_{1,1} = F^×/F^{×2} → E^∞_{1,1} ⊂ π_2 is injective (x ↦ x ⊗ x in ∧̃²F^×), so d : E^2_{3,0} → E^2_{1,1} is zero and E^∞_{3,0} = H_3(F^×).
3. E^2_{2,1} = H_2(F^×, ℤ/2) is an extension of μ_2(F) by (∧²F^×)/2, and d : E^2_{4,0} → E^2_{2,1} lands in (∧²F^×)/2 (naturality, via the divisible group H_4(F̄^×)).
4. Divide by the products: what remains is π^s_3/(η³) plus an extension of H_3(F^×)/∧³F^× ≅ Tor_1(μ(F), μ(F)) by μ_2(F).

**Acceptance.**

- In characteristic two, μ_2(F) = 1 and γ is an isomorphism.
- For F = ℚ, 0 → ℤ/2 → ℤ/4 ⊕ ℤ/12 → ℤ/2 ⊕ ℤ/12 → 0.

**Imports.** [`K3BlochGroups:V.4/pi3ind-definition`](#v-4-pi3ind-definition), [`StableHomotopyKTheory:H.6`](../packets/StableHomotopyKTheory.json), [`mathlib:CategoryTheory.Tor`](#baseline-mathlib-categorytheory-tor).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proposition VI.5.17 (PDF p. 505); [Kbook.2013](#source-0-kbook-2013) — Proof of Proposition VI.5.17 (PDF p. 506).

<a id="v-4-delta-squaring"></a>

### V.4.15: The diagonal embedding of the roots of unity composed with gamma is doubling

`K3BlochGroups:V.4/delta-squaring` · lemma

Let δ : H_3(μ(F), ℤ) → H_3(P, ℤ) → π_3^ind(BM^+) be induced by x ↦ diag(x, x^{−1}). Then the μ-component of γ ∘ δ is twice the canonical isomorphism H_3(μ(F), ℤ) ≅ Tor_1(μ(F), μ(F)). The K-book states this as 'μ(F) → μ(F), x ↦ x²' after identifying H_3(μ(F)) with μ(F).

**Hypotheses.** F is a field.

**Construction and proof.**

1. δ factors through D = μ(F) ⋊ Σ_2, with Σ_2 → A_∞ ⊂ P given by (12)(34); the image of H_3(μ) in H_3(D) lies in H_3(μ)_{Σ_2} ≅ μ/{±1}.
2. By Ex. VI.5.13, the composite H_3(D) → H_3(P) −γ→ Tor_1(μ, μ) sends the class of x to twice its canonical image (recorded gap for Ex. 5.13).

**Acceptance.**

- For F algebraically closed, γδ is onto, since multiplication by two is onto the divisible group Tor_1(μ(F), μ(F)).
- The element of order two of H_3(μ(F)) lies in the kernel of γδ, and δ of it is the generator of μ_2(F) ⊂ π_3^ind(BM^+) (used in Corollary 5.20).

**Imports.** [`K3BlochGroups:V.4/pi3ind-ahss`](#v-4-pi3ind-ahss), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`mathlib:Rep.FiniteCyclicGroup.resolution`](#baseline-mathlib-rep-finitecyclicgroup-resolution).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.18 (PDF p. 506).

<a id="v-4-e-invariant-detection"></a>

### V.4.16: The e-invariant detects the image of the roots of unity

`K3BlochGroups:V.4/e-invariant-detection` · lemma

For a field F the composite H_3(μ(F), ℤ) −δ→ π_3^ind(BM^+) → K_3^ind(F) −e→ H^0(F, μ^{⊗2}) is injective, and it is an isomorphism when F is algebraically closed.

**Hypotheses.** F is a field; the e-invariant is taken at primes invertible in F.

**Construction and proof.**

1. If F ⊂ F′ then μ(F) ⊆ μ(F′), so it suffices to treat F algebraically closed.
2. For F algebraically closed, K^M_3(F) is uniquely divisible and a summand of K_3(F), so mK_3(F) ≅ mK_3^ind(F).
3. For 1/m ∈ F and m ≢ 2 mod 4, K_4(F; ℤ/m) ≅ ℤ/m on β² (Suslin rigidity), c_1(β) = ζ, and the product formula gives c_2(β²) = ζ^{−1} ⊗ ζ; with the Bockstein K_4(F; ℤ/m) ≅ mK_3(F) the e-invariant is −c_{2,4} on mK_3(F).
4. The diagram through H_4(μ; ℤ/m) → H_4(P; ℤ/m) → H_4(SL(F); ℤ/m) −c_{2,4}→ H^0_et(F, μ_m^{⊗2}), whose top row is an isomorphism (Ex. V.11.5), gives the claim. The étale Chern classes and the e-invariant have no admissible supplier (recorded gap).

**Acceptance.**

- For F = ℂ the composite is an isomorphism H_3(μ(ℂ)) ≅ ℚ/ℤ ≅ H^0(ℂ, μ^{⊗2}).
- The target has twist two, like H_3(μ(F)) and Tor_1(μ, μ); it is not μ(F) as a Galois module.

**Imports.** [`K3BlochGroups:V.4/pi3ind-definition`](#v-4-pi3ind-definition), [`K3BlochGroups:V.4/delta-squaring`](#v-4-delta-squaring), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`MotivicEtaleKTheory:M.7`](../packets/MotivicEtaleKTheory--M.5d.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.19 (PDF p. 507).

<a id="v-4-enhanced-tor"></a>

### V.4.17: The enhanced torsion term

`K3BlochGroups:V.4/enhanced-tor` · definition

For a field F define the enhanced torsion term T̃(F) = ker(π_3^ind(BM^+) → ℤ/12), natural for all field homomorphisms. By V.4/pi3ind-ahss it is an extension 0 → μ_2(F) → T̃(F) → Tor_1^ℤ(μ(F), μ(F)) → 0, and T̃(F) ≅ Tor_1(μ(F), μ(F)) when char F = 2 (μ_2(F) = 1); that the extension does not split when char F ≠ 2 is proved in V.4/pi3ind-bm-plus. This is Suslin's Tor_1^ℤ(μ(F), μ(F))~ with its characteristic-dependent convention, in a form in which naturality is visible.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Define T̃(F) as the kernel; naturality follows from that of π_3^ind(BM^+).
2. Read off the extension from V.4/pi3ind-ahss.
3. Record the characteristic-two case: μ_2(F) = 1, so toTor is an isomorphism.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `enhancedTor` | data | T̃(F) = ker(π_3^ind(BM^+) → ℤ/12). |
| `enhancedTor.toTor` | projection | The surjection onto Tor_1^ℤ(μ(F), μ(F)), with kernel μ_2(F). |
| `enhancedTor.map` | functoriality | Naturality for all field homomorphisms, with map_id and map_comp. |
| `enhancedTor.char_two` | characterisation | For char F = 2, toTor is an isomorphism. |
| `enhancedTor.nonsplit` | characterisation | For char F ≠ 2 the extension does not split (a consequence of V.4/pi3ind-bm-plus, stated there). |
| `enhancedTor.equivEnhancedMu` | compatibility | An isomorphism T̃(F) ≅ μ̃(F), depending on a choice; no such isomorphism is natural in F. |

**Unit tests.**

- `enhancedTor_Q` (computation): T̃(ℚ) ≅ ℤ/4, while Tor_1(μ(ℚ), μ(ℚ)) ≅ ℤ/2.
- `enhancedTor_char2` (degenerate): For char F = 2, T̃(F) → Tor_1(μ(F), μ(F)) is an isomorphism.
- `enhancedTor_galois` (non-example): Complex conjugation on F = ℚ(ζ_3) acts trivially on Tor_1(μ_6, μ_6) but by inversion on μ(F) = μ_6, so T̃(F) is not naturally isomorphic to μ̃(F).
- `enhancedTor_nonsplit` (characterisation): For char F ≠ 2, T̃(F) is locally cyclic, so 0 → μ_2 → T̃ → Tor_1 → 0 does not split.

**Uses.**

- V.4/suslin-exact-sequence: it is the left-hand term, in the natural form.
- HabiroNumberFields HB.1: the integral convention consumed there depends on which torsion term is used.

**Acceptance.**

- T̃(ℚ) ≅ ℤ/4 while Tor_1(μ(ℚ), μ(ℚ)) ≅ ℤ/2.
- Complex conjugation on ℚ(ζ_3) acts trivially on the quotient Tor_1(μ_6, μ_6), unlike its action on μ(ℚ(ζ_3)).

**Imports.** [`K3BlochGroups:V.4/pi3ind-definition`](#v-4-pi3ind-definition), [`K3BlochGroups:V.4/pi3ind-ahss`](#v-4-pi3ind-ahss), [`mathlib:CategoryTheory.Tor`](#baseline-mathlib-categorytheory-tor), [`mathlib:rootsOfUnity`](#baseline-mathlib-rootsofunity).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proposition VI.5.17 (PDF p. 505); [Kbook.2013](#source-0-kbook-2013) — Proof of Theorem VI.5.2 (PDF p. 507).

<a id="v-4-pi3ind-bm-plus"></a>

### V.4.18: The indecomposable third homotopy group of the plus construction on the monomial group

`K3BlochGroups:V.4/pi3ind-bm-plus` · theorem

For every field F, π_3^ind(BM^+) ≅ T̃(F) ⊕ ℤ/12, where T̃(F) = ker(π_3^ind(BM^+) → ℤ/12) is the enhanced torsion term (V.4/enhanced-tor) and ℤ/12 is the image of the unit π^s_3 → π_3(BM^+); abstractly T̃(F) ≅ μ̃(F), which is the K-book's form π_3^ind(BM^+) ≅ μ̃(F) ⊕ ℤ/12.

**Hypotheses.** F is a field.

**Construction and proof.**

1. If char F = 2, μ_2(F) = 1 and the result is immediate from V.4/pi3ind-ahss.
2. If F ⊂ E, then μ(F) ⊆ μ(E), and by naturality of V.4/pi3ind-ahss and the five lemma π_3^ind(BM_F^+) → π_3^ind(BM_E^+) is injective; so it suffices to treat F algebraically closed.
3. For F algebraically closed, γδ is onto by V.4/delta-squaring (multiplication by two on the divisible group), and δ of the element of order two is a nonzero element of the kernel μ_2(F) of γ (V.4/e-invariant-detection); so (δ, i) : H_3(μ(F)) ⊕ ℤ/12 → π_3^ind(BM^+) is an isomorphism.
4. For general F, T̃(F) is the preimage of Tor_1(μ(F), μ(F)) in T̃(F̄) ≅ μ(F̄), which is the nontrivial extension by μ_2 when char F ≠ 2; this identifies it abstractly with μ̃(F).

**Acceptance.**

- In characteristic two the decomposition is immediate from the exact sequence.
- For F = ℚ, π_3^ind(BM^+) ≅ ℤ/4 ⊕ ℤ/12.
- The summand is the enhanced group and not the roots of unity: substituting the latter breaks the count for the rational numbers in V.5.

**Imports.** [`K3BlochGroups:V.4/pi3ind-ahss`](#v-4-pi3ind-ahss), [`K3BlochGroups:V.4/delta-squaring`](#v-4-delta-squaring), [`K3BlochGroups:V.4/e-invariant-detection`](#v-4-e-invariant-detection), [`K3BlochGroups:V.4/enhanced-tor`](#v-4-enhanced-tor), [`K3BlochGroups:V.4/enhanced-mu`](#v-4-enhanced-mu), [`K3BlochGroups:V.4/pi3ind-definition`](#v-4-pi3ind-definition).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Corollary VI.5.20 and its proof (PDF p. 507).

<a id="v-4-scalar-homology-vanishing"></a>

### V.4.19: Scalar acyclicity for additive coefficients

`K3BlochGroups:V.4/scalar-homology-vanishing` · theorem

For an infinite field F, an F-vector space V, a prime field k, j>0 and i≥0, Hᵢ(Fˣ,Hⱼ(V_add,k))=0, where Fˣ acts by scalar multiplication on V and hence on its additive-group homology. V need not be finite-dimensional. This is coefficient homology, not the assertion that Hⱼ(V_add,k) itself vanishes.

**Hypotheses.** F infinite; k=Q or F_p; j>0.

**Construction and proof.**

1. Su84 1.1–1.6: the diagonal tensor-power scalar action has zero coinvariants, including mixed symmetric/exterior powers. A maximal-ideal argument would otherwise give embeddings of F whose product is identically1, forcing F finite. The symmetric-invariant algebra filtration extends this to the mixed powers.
2. Su84 1.7–1.8: in matching positive characteristic use the exterior/symmetric decomposition of elementary-abelian homology (Sym in degree1 at p=2). In characteristic zero use exterior powers and the central scalar annihilator. In mismatching positive characteristic positive homology is zero. Pass through finite-dimensional subspaces.
3. Use that the scalar elements act trivially on their own group homology with coefficients and that the ideal of scalar-minus-one elements is the unit ideal. The precise general homology inputs are requested at H.1 Part II.

**Acceptance.**

- j=0 is excluded: H₀(Fˣ,k)=k for the trivial action.
- For F₂ with V=F₂ and k=F₂, H₀(F₂ˣ,H₁(V,k))=F₂, so dropping infinitude is false.

**Imports.** [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`mathlib:Subfield.closure`](#baseline-mathlib-subfield-closure).

**Sources.** [Su84](#source-4-su84) — Corollary1.8, p191.

<a id="v-4-affine-block-homology"></a>

### V.4.20: Homology invariance under affine blocks

`K3BlochGroups:V.4/affine-block-homology` · theorem

Let G₁≤GLₙ(F), G₂≤GLₘ(F), and M≤Matₙ,ₘ(F) be an F-linear subspace stable under left G₁ and right G₂ multiplication. If F is infinite and either G₁ or G₂ contains every scalar matrix, the block-diagonal inclusion G₁×G₂→{(g₁ u;0 g₂):u∈M} induces an isomorphism on integral homology in every degree. The stronger all-diagonal hypothesis printed in Su84 implies this sufficient scalar hypothesis.

**Hypotheses.** n,m≥1; F infinite; scalar containment in at least one block; M stable.

**Construction and proof.**

1. The upper-block group is M_add⋊(G₁×G₂). In the matching central scalar subgroup, the induced action on M is t or t⁻¹, both covered by scalar-homology-vanishing.
2. Apply LHS first to the central scalar subgroup of G₁×G₂, then to M_add⋊(G₁×G₂). All positive-M rows vanish over every prime field. The split inclusion and projection are inverse on homology.
3. Detect an integral homology equivalence from rational and all F_p coefficient equivalences, using UCT on the mapping cone. No averaging by |Fˣ| is allowed.

**Acceptance.**

- M=0 gives the product-group identity.
- For F₂ the scalar group is trivial and the one-by-one unipotent group is C₂, whose H₁ is nonzero: the infinite-field qualification is essential.

**Imports.** [`K3BlochGroups:V.4/scalar-homology-vanishing`](#v-4-scalar-homology-vanishing), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`](../../../content/tau-ceti/AlgebraicTopology/README.md#stage-5-bundles-covers-products-and-finite-cover-descent).

**Sources.** [Su84](#source-4-su84) — Theorem1.9 and proof, p191.

<a id="v-4-torus-borel-homology"></a>

### V.4.21: The diagonal torus and the Borel subgroup have the same homology

`K3BlochGroups:V.4/torus-borel-homology` · lemma

For an infinite field F the inclusion of the diagonal torus T_2 into the upper triangular group B_2 of GL_2(F) induces an isomorphism H_*(T_2, ℤ) → H_*(B_2, ℤ).

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. Write B_2 = U ⋊ T_2 with U ≅ (F, +); by the Lyndon–Hochschild–Serre spectral sequence it suffices that H_p(T_2, H_q(U, ℤ)) = 0 for q > 0.
2. Apply V.4/affine-block-homology to the triangular subgroup and its diagonal projection over the infinite field. Scalar homology vanishing for the unipotent coefficient groups gives the integral homology equivalence, naturally in the field; this uses the general homology supplier inputs recorded in that refinement.

**Acceptance.**

- The statement fails for F = F_4: B_2 = U ⋊ T_2 with |U| = 4 and |T_2| = 9 coprime, so H_2(B_2, ℤ) ≅ H_2(T_2) ⊕ H_2(U)_{T_2} = ℤ/3 ⊕ ℤ/2, because T_2 acts on H_2(U, ℤ) = ∧²_{F_2}F_4 through the norm to F_2, which is trivial.
- In degree one it says B_2^{ab} = T_2, i.e. [B_2, B_2] = U, which holds once F has an element a ∉ {0, 1}: commutators of diag(a, 1) with unipotents give all of U.

**Imports.** [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`mathlib:groupHomology`](#baseline-mathlib-grouphomology), [`mathlib:Matrix.GeneralLinearGroup`](#baseline-mathlib-matrix-generallineargroup), [`K3BlochGroups:V.4/affine-block-homology`](#v-4-affine-block-homology).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Paragraph after Theorem VI.5.7 (PDF p. 498).

<a id="v-4-gl2-d1-involution"></a>

### V.4.22: The first differential out of the pair column is one minus the swap

`K3BlochGroups:V.4/gl2-d1-involution` · lemma

Let F be infinite and σ(a, b) = (b, a) on T_2. Under the Shapiro identifications E^1_{1,q} ≅ H_q(T_2, ℤ) and E^1_{0,q} ≅ H_q(B_2, ℤ) ≅ H_q(T_2, ℤ), the differential d^1 : E^1_{1,q} → E^1_{0,q} of the configuration spectral sequence of GL_2(F) on ℙ¹(F) is induced by 1 − σ.

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. d^1 is induced by d^1_0 − d^1_1 : C_1 → C_0, with d^1_0(x_0, x_1) = (x_1) and d^1_1(x_0, x_1) = (x_0).
2. Under Shapiro, d^1_1 ι is the map induced by T_2 ⊂ B_2.
3. d^1_0 ι = σ ∘ (d^1_1 ι): the matrix [[0, 1], [1, 0]] exchanges 0 and ∞ and conjugates T_2 by σ, and inner automorphisms act trivially on group homology.
4. With V.4/torus-borel-homology, d^1 = 1 − σ.

**Acceptance.**

- On H_1(T_2) = T_2, d^1(a, b) = (a/b, b/a), whose kernel is the centre T_2^σ = {(a, a)}.
- On H_0, d^1 = 0, as 1 − σ vanishes on ℤ.

**Imports.** [`K3BlochGroups:V.4/hyperhomology-map`](#v-4-hyperhomology-map), [`K3BlochGroups:V.4/torus-borel-homology`](#v-4-torus-borel-homology), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`mathlib:groupHomology.indIso`](#baseline-mathlib-grouphomology-indiso).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.8.1 (PDF p. 499); [Kbook.2013](#source-0-kbook-2013) — Exercise VI.5.2(iii) (PDF p. 508).

<a id="v-4-gl2-spectral-sequence"></a>

### V.4.23: The low-degree terms of the configuration spectral sequence for the two by two matrices

`K3BlochGroups:V.4/gl2-spectral-sequence` · lemma

Let F be an infinite field and G = GL_2(F) act on X = ℙ¹(F). The hyperhomology spectral sequence E^1_{p,q} = H_q(G, C_p(X)) ⇒ H_{p+q}(G, ℤ) has E^1_{0,q} = H_q(B, ℤ), E^1_{1,q} = H_q(T_2, ℤ) and E^1_{2,q} = H_q(Δ, ℤ), where B is the upper triangular group (the stabiliser of 0), T_2 the diagonal torus (the stabiliser of (0, ∞)) and Δ = {(a, a)} the centre (the stabiliser of (0, ∞, 1)); its row q = 0 is the coinvariant complex, so E^2_{p,0} = H_p(C_G), which is ℤ, 0, 0, P(F) for p = 0, 1, 2, 3. The differential d^1 : H_q(Δ) → H_q(T_2) is induced by the inclusion and is split injective, so E^2_{2,q} = 0; with the d^1 involution lemma, E^2_{0,q} = H_q(T_2)_σ, E^2_{1,q} = H_q(T_2)^σ / H_q(Δ), E^2_{0,1} = F^× and E^2_{1,1} = 0.

**Hypotheses.** F is an infinite field. B, T_2 and the centre Δ are the stabilisers named in the statement.

**Construction and proof.**

1. Build the spectral sequence of the double complex P ⊗_G C_*(X) filtered by the configuration degree p, and identify its abutment with H_*(G, ℤ) by V.4/hyperhomology-map (X is infinite). The double-complex spectral sequence itself is a recorded gap.
2. Identify E^1_{p,q} for p ≤ 2 by Shapiro's lemma (groupHomology.indIso), using transitivity on injective (p + 1)-tuples and the stabilisers B, T_2 and Δ = {(a, a)}. The K-book prints Δ = {(a, a^{−1})}, which is not the stabiliser of (0, ∞, 1) (source issues).
3. Replace H_q(B) by H_q(T_2) using V.4/torus-borel-homology.
4. d^1 : H_q(Δ) → H_q(T_2) is induced by the inclusion Δ ⊂ T_2, split by the first projection, so E^2_{2,q} = 0.
5. By V.4/gl2-d1-involution, d^1 : H_q(T_2) → H_q(T_2) is 1 − σ, so E^2_{0,q} = H_q(T_2)_σ (coinvariants) and E^2_{1,q} = H_q(T_2)^σ / H_q(Δ) (invariants modulo the image); in row one, E^2_{0,1} = F^× and E^2_{1,1} = 0 because T_2^σ = Δ.
6. Row q = 0 of E^1 is C_* ⊗_G ℤ, so E^2_{p,0} = H_p(C_G), computed by V.4/coinvariants-p1-homology.

**Acceptance.**

- E^2_{0,1} = F^× and E^2_{1,1} = 0. With Δ = {(a, a^{−1})} the page would not even be a complex: (1 − σ)(a, a^{−1}) = (a², a^{−2}) ≠ 1, contradicting d^1 ∘ d^1 = 0.
- Row zero of the second page is ℤ, 0, 0, P(F) in columns 0 to 3.
- For F = F_4 the identification E^1_{0,2} = H_2(T_2) fails: H_2(B, ℤ) ≅ ℤ/3 ⊕ ℤ/2 while H_2(T_2, ℤ) ≅ ℤ/3. This is one reason F is infinite.

**Imports.** [`K3BlochGroups:V.4/hyperhomology-map`](#v-4-hyperhomology-map), [`K3BlochGroups:V.4/coinvariants-p1-homology`](#v-4-coinvariants-p1-homology), [`K3BlochGroups:V.4/torus-borel-homology`](#v-4-torus-borel-homology), [`K3BlochGroups:V.4/gl2-d1-involution`](#v-4-gl2-d1-involution), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`mathlib:groupHomology.indIso`](#baseline-mathlib-grouphomology-indiso).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — (5.8) and the paragraph after Theorem VI.5.7 (PDF p. 498); [Kbook.2013](#source-0-kbook-2013) — Proof of Theorem VI.5.7 (PDF p. 499).

<a id="v-4-gl2-d3-boundary"></a>

### V.4.24: The third differential is the Bloch boundary

`K3BlochGroups:V.4/gl2-d3-boundary` · lemma

For F infinite, in the configuration spectral sequence of GL_2(F) on ℙ¹(F), E^2_{0,2} = H_2(T_2)_σ ≅ ∧²F^× ⊕ ∧̃²(F^×) (Künneth: σ exchanges the two copies of H_2(F^×) = ∧²F^× and acts on F^× ⊗ F^× by x ⊗ y ↦ −y ⊗ x), and d^3 : E^3_{3,0} = P(F) → E^3_{0,2} is the boundary [x] ↦ x ⊗ (1 − x) of V.3 followed by the split inclusion of ∧̃²(F^×). Hence E^∞_{3,0} = B(F) and E^∞_{0,2} ≅ ∧²F^× ⊕ K_2(F).

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. E^3_{3,0} = E^2_{3,0} = P(F) and E^3_{0,2} = E^2_{0,2}, since E^2_{1,1} = E^2_{2,1} = 0.
2. Künneth for H_2(F^× × F^×) and H_2(A, ℤ) ≅ ∧²A for abelian A (Ex. VI.5.9(a)) give the decomposition of H_2(T_2)_σ (recorded gap: neither is in Mathlib).
3. Identify d^3 with the boundary followed by the split inclusion: the 'routine but tedious calculation' of [187, 2.4], not reproduced in the K-book (recorded gap).
4. Conclude E^∞_{3,0} = ker d^3 = B(F), and coker d^3 ≅ ∧²F^× ⊕ K_2(F) by the four-term sequence of V.3.

**Acceptance.**

- The summand hit is ∧̃²(F^×), not ∧²F^×: the coinvariants of F^× ⊗ F^× under x ⊗ y ↦ −y ⊗ x are F^× ⊗ F^× / ⟨x ⊗ y + y ⊗ x⟩.
- E^∞_{3,0} is B(F) and the cokernel of d^3 is ∧²F^× ⊕ K_2(F), the H_2 computation of Theorem 5.7.
- For F = ℚ, [2] ∈ P(ℚ) does not survive: d^3[2] is the image of 2 ⊗ (−1), which is nonzero in ∧̃²(ℚ^×).

**Imports.** [`K3BlochGroups:V.4/gl2-spectral-sequence`](#v-4-gl2-spectral-sequence), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/bloch-four-term-exact`](#v-3-bloch-four-term-exact).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proof of Theorem VI.5.7 (PDF p. 499).

<a id="v-4-psi-map"></a>

### V.4.25: The map psi from the third homology of GL_2 to the Bloch group

`K3BlochGroups:V.4/psi-map` · construction

For an infinite field F construct ψ : H_3(GL_2(F), ℤ) → B(F) as the edge map H_3(GL_2(F), ℤ) → E^∞_{3,0} of the configuration spectral sequence for ℙ¹(F), where E^∞_{3,0} ⊆ E^1_{3,0} = H_3(C_G) = P(F) and E^∞_{3,0} = B(F) by the identification of d^3 with the Bloch boundary.

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. Form the spectral sequence E^1_{p,q} = H_q(G, C_p(X)) ⇒ H_{p+q}(G, ℤ) (V.4/gl2-spectral-sequence).
2. The edge map H_3(G, ℤ) → E^∞_{3,0} is onto and E^∞_{3,0} ⊆ E^1_{3,0} = P(F) (V.4/coinvariants-p1-homology); it agrees with H_3(G, ℤ) ≅ H_3(G, C_*) → H_3(C_G) (V.4/hyperhomology-map).
3. E^∞_{3,0} = ker d^3 = B(F) (V.4/gl2-d3-boundary), so the image is B(F).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `psiGL2` | constructor | The homomorphism H_3(GL_2(F), ℤ) → B(F). |
| `psiGL2_coe` | projection | Its composite with B(F) ⊆ P(F) is H_3(GL_2(F), ℤ) → H_3(C_G) ≅ P(F). |
| `psiGL2_surjective` | characterisation | ψ is onto B(F). |
| `psiGL2_natural` | functoriality | For a field homomorphism F → E, ψ_E ∘ H_3(GL_2(F) → GL_2(E)) = B(F → E) ∘ ψ_F. |

**Unit tests.**

- `psiGL2_surjective_test` (characterisation): ψ is onto B(F).
- `psiGL2_coe_test` (compatibility): The composite with B(F) ⊆ P(F) equals the canonical map H_3(GL_2(F), ℤ) → H_3(C_G) ≅ P(F) of V.4/hyperhomology-map.
- `psiGL2_not_onto_P` (non-example): For F = ℚ the image is a proper subgroup of P(ℚ): [2] is not in B(ℚ), since its boundary 2 ∧ (−1) is nonzero in ∧̃²(ℚ^×).
- `psiGL2_torus` (computation): ψ vanishes on the image of H_3(T_2, ℤ).

**Uses.**

- V.4/psi-gl2: the exact sequence H_3(M_2) → H_3(GL_2(F)) → B(F) → 0 is about this map.
- V.4/psi-compatibility: ψ on H_3(GL_2) is compared with the map of V.4/psi3-map on H_3(GL_3).

**Acceptance.**

- ψ is onto B(F).
- ψ vanishes on the image of H_3(T_2, ℤ): the augmentation of C_*(ℙ¹(F)) has the T_2-equivariant section 1 ↦ (0).

**Imports.** [`K3BlochGroups:V.4/hyperhomology-map`](#v-4-hyperhomology-map), [`K3BlochGroups:V.4/coinvariants-p1-homology`](#v-4-coinvariants-p1-homology), [`K3BlochGroups:V.4/gl2-spectral-sequence`](#v-4-gl2-spectral-sequence), [`K3BlochGroups:V.4/gl2-d3-boundary`](#v-4-gl2-d3-boundary), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Paragraph after Theorem VI.5.7 (PDF p. 498).

<a id="v-4-psi-gl2"></a>

### V.4.26: The map psi on the third homology of the two by two matrices

`K3BlochGroups:V.4/psi-gl2` · theorem

For every infinite field F, H_1(GL_2(F), ℤ) ≅ F^×, H_2(GL_2(F), ℤ) ≅ ∧²F^× ⊕ K_2(F), and the sequence H_3(M_2, ℤ) → H_3(GL_2(F), ℤ) −ψ→ B(F) → 0 is exact, where M_2 is the monomial subgroup and ψ is the map of V.4/psi-map.

**Hypotheses.** F is an infinite field. The K-book's 'For all F' is false even with its standing |F| ≥ 4: the H_2 formula fails for F_4 (source issues).

**Construction and proof.**

1. H_1: in total degree one E^∞ is E^2_{0,1} = F^× (E^2_{1,0} = 0), so H_1(GL_2(F)) ≅ F^×.
2. H_2: E^∞_{2,0} = E^∞_{1,1} = 0 and E^∞_{0,2} = coker d^3 ≅ ∧²F^× ⊕ K_2(F), by V.4/gl2-d3-boundary and the four-term sequence of V.3 (Matsumoto identifies the cokernel of the boundary with K_2(F)).
3. ψ is the edge map of V.4/psi-map, which is onto B(F).
4. The kernel K of ψ is an extension of a quotient Q_2 of E^2_{1,2} = H_2(T_2)^σ by a quotient Q_3 of E^2_{0,3} = H_3(T_2)_σ. For M_2 = T_2 ⋊ Σ_2, the Lyndon–Hochschild–Serre spectral sequence (H_p(Σ_2, T_2) = 0 for p ≠ 0) shows that the cokernel of H_3(T_2) ⊕ H_3(Σ_2) → H_3(M_2) is a quotient of H_2(T_2)_σ.
5. Suslin's analysis of Q_2 [187, p. 223], which the K-book does not reproduce (recorded gap), shows that K is the image of H_3(M_2, ℤ); conclude exactness.

**Acceptance.**

- The second homology contains K_2(F) as a direct summand, which is a check on the identification of the third differential.
- psi is surjective onto B(F), not onto P(F); a construction landing in P(F) at this stage would be wrong.
- For F = F_4 the H_2 formula is false: GL_2(F_4) ≅ F_4^× × SL_2(F_4) ≅ ℤ/3 × A_5 has H_2 ≅ ℤ/2 (the Schur multiplier of A_5), while ∧²F_4^× ⊕ K_2(F_4) = 0. So the hypothesis must be 'infinite', not only |F| ≥ 4.

**Imports.** [`K3BlochGroups:V.4/psi-map`](#v-4-psi-map), [`K3BlochGroups:V.4/gl2-spectral-sequence`](#v-4-gl2-spectral-sequence), [`K3BlochGroups:V.4/gl2-d3-boundary`](#v-4-gl2-d3-boundary), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/bloch-four-term-exact`](#v-3-bloch-four-term-exact), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Theorem VI.5.7 (PDF p. 498); [Kbook.2013](#source-0-kbook-2013) — Proof of Theorem VI.5.7 (PDF p. 499).

<a id="v-4-psi-compatibility"></a>

### V.4.27: Compatibility of the two constructions of psi

`K3BlochGroups:V.4/psi-compatibility` · lemma

The composite of the map induced by the inclusion of the two by two matrices into the three by three matrices with the map psi of the rank-three construction is the map psi of the rank-two theorem, followed by the inclusion of B(F) into P(F).

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. GL_2(F) ⊂ GL_3(F) fixes p_3 = (0 : 0 : 1), so it acts on X_0 = ℙ²(F) − {p_3}.
2. The maps f_n(x_0, …, x_n) = (x_0, …, x_n, p_3) satisfy f d = d^a f (the appended point is the omitted last face). Let C′_n ⊂ C_n(X_0) be spanned by the tuples with (x_0, …, x_n, p_3) in general position; f is a GL_2-equivariant chain map C′_* → C^a_{*+1} ⊂ D_*, compatible with the augmentations.
3. C′_* → ℤ is a quasi-isomorphism for F infinite, by the prepending homotopy (choose z off the lines through p_3 or two support points); so H_3(GL_2, C′_*) = H_3(GL_2, ℤ), and the composite of the lemma factors as H_3(GL_2) → H_3(C′_{GL_2}) → H_3(D_G) −ψ′→ P(F).
4. Projection from p_3 is a GL_2-equivariant map X_0 → ℙ¹(F) sending C′_* to C_*(ℙ¹(F)); on a generator, ψ′(f(x)) is the cross-ratio of the projected 4-tuple, so the composite is the edge map of V.4/psi-map.

**Acceptance.**

- The composite lands in B(F) inside P(F), not in P(F) generally.
- On the generator (p_1, p_2, q, (1 : a : x)) of C′_3, ψ′ ∘ f gives [a], which is the cross-ratio of the projected tuple ((1 : 0), (0 : 1), (1 : 1), (1 : a)) = (0, ∞, 1, a). The frame P = (p_1, p_2, q, p_3) lies in the C_3 summand of D_3 and is not in the image of f, so it plays no role here.

**Imports.** [`K3BlochGroups:V.4/psi3-map`](#v-4-psi3-map), [`K3BlochGroups:V.4/psi-map`](#v-4-psi-map), [`K3BlochGroups:V.4/general-position-complex`](#v-4-general-position-complex), [`K3BlochGroups:V.4/hyperhomology-map`](#v-4-hyperhomology-map), [`K3BlochGroups:V.4/cross-ratio`](#v-4-cross-ratio).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.10 and its proof (PDF p. 501).

<a id="v-4-alternating-group-image"></a>

### V.4.28: The image of the homology of the alternating group on three letters

`K3BlochGroups:V.4/alternating-group-image` · lemma

Let F be an infinite field and A_3 ⊂ GL_3(F) the even permutation matrices. The image of H_3(A_3, ℤ) ≅ ℤ/3 under H_3(A_3) → H_3(GL_3(F)) −ψ→ B(F) is the subgroup generated by 2c.

**Hypotheses.** F is an infinite field (the K-book's |F| ≥ 4 is needed only for the choice of x and y).

**Construction and proof.**

1. If char F = 3, the permutation representation of A_3 is conjugate to a unipotent upper-triangular one, so H_*(A_3) → H_*(GL_3(F)) is trivial ([181], recorded gap), and 2c = 0 (V.3/c-characteristic-torsion).
2. If char F ≠ 3, the permutation representation is conjugate to 1 ⊕ (A_3 → GL_2(F) with generator λ = [[0, −1], [1, −1]]). Inner automorphisms act trivially on H_*(GL_3), so the composite is H_3(A_3) → H_3(GL_2(F)) → H_3(GL_3(F)) −ψ→ P(F), which is ψ of V.4/psi-map by V.4/psi-compatibility.
3. Compare the periodic resolution (Rep.FiniteCyclicGroup.resolution) with C_*(ℙ¹(F)), where λ acts by z ↦ 1 − 1/z: f_0(1) = (0), f_1(1) = (∞, 0), f_2(1) = (∞, 0, x) + (1, ∞, x) + (0, 1, x) (the K-book prints '= (0, 1, x)' for the last '+'), and, with w = 1 − 1/x and y ∉ {∞, 0, 1, x, w}, f_3(1) = −(∞, 0, x, y) − (1, ∞, x, y) − (0, 1, x, y) + (1, ∞, w, y) + (0, 1, w, y) + (∞, 0, w, y).
4. By the cross-ratio, ψ(f_3(1)) = −[x/y] − [(y − 1)/(x − 1)] − [y(x − 1)/(x(y − 1))] + [x(1 − y)] + [(x − 1)/(xy)] + [y/((1 − x)(y − 1))]. The K-book's last two terms, [(1 − x)/(xy)] and [y/((1 − x)(1 − y))], have the wrong sign inside the brackets.
5. Take x ∉ {0, 1, −1, 2} and y = x^{−1} (then y ≠ w because x ≠ 2): the expression becomes −[x²] − 2[−x^{−1}] + 2[x − 1] + [(1 − x)^{−2}], which is −2c by V.4/dupont-sah-identity.

**Acceptance.**

- In P(F_p) the corrected six-term expression equals −2c for every admissible (x, y), for p = 5, 7, 11, 13, 17. The printed one does so for 0 of 3 pairs when p = 5 and 8 of 63 when p = 11 (checked by computer).
- For F = ℚ, 2c has order three (c has order six, Remark VI.5.2.1), so H_3(A_3) → B(ℚ) is injective.
- In characteristic three the image is zero.

**Imports.** [`K3BlochGroups:V.4/psi-map`](#v-4-psi-map), [`K3BlochGroups:V.4/psi-compatibility`](#v-4-psi-compatibility), [`K3BlochGroups:V.4/cross-ratio`](#v-4-cross-ratio), [`K3BlochGroups:V.4/dupont-sah-identity`](#v-4-dupont-sah-identity), [`K3BlochGroups:V.4/configuration-acyclicity`](#v-4-configuration-acyclicity), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/c-characteristic-torsion`](#v-3-c-characteristic-torsion), [`mathlib:Rep.FiniteCyclicGroup.resolution`](#baseline-mathlib-rep-finitecyclicgroup-resolution).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.14 (PDF p. 502); [Kbook.2013](#source-0-kbook-2013) — Proof of Lemma VI.5.14 (PDF p. 503).

<a id="v-4-unimodular-vector-chains"></a>

### V.4.29: Independent-vector chain complex

`K3BlochGroups:V.4/unimodular-vector-chains` · construction

For a field F and n,m≥0, C₀ⁿ,ᵐ=Z and C_qⁿ,ᵐ is the free abelian group on ordered q-tuples (vᵢ,wᵢ)∈Fⁿ⊕Fᵐ with the projected family vᵢ linearly independent, q≥1. The boundary is alternating deletion, d(v,w)=1 in degree1. Thus C_q=0 for q>n. This is the shifted augmented complex of Um(Fⁿ,Fᵐ), not the projective configuration complex. It carries the natural action of Aₙ,ₘ={ (g 0;u 1):g∈GLₙ(F),u∈Hom(Fⁿ,Fᵐ)}.

**Hypotheses.** F any field, n,m≥0; no infinitude required for construction.

**Construction and proof.**

1. Use LinearIndependent for the projected family, free abelian groups and the usual deletion boundary. Pairwise face cancellation proves d²=0.
2. Represent Aₙ,ₘ by the displayed block subgroup of the existing general linear group; its action preserves projected independence. The m=0 action gives a chain complex in Rep Z GLₙ.
3. The empty tuple is the augmentation generator in degree0. Keep the q versus simplex-dimension shift explicit.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `unimodularChains` | constructor | The complex Cⁿ,ᵐ with the stated augmentation, differential and action. |
| `unimodularChains.frame` | constructor | An independent ordered q-frame gives a basis chain in degreeq, including the empty frame. |
| `unimodularChains.frame_d` | simp | For q≥1, the boundary of a basis frame is the alternating sum of its q deleted frames. |
| `unimodularChains.basisEquiv` | equivalence | The degreeq underlying module is linearly equivalent to the free abelian group on the projected-independent q-frames. |
| `unimodularChains.glRepresentation` | structure | For m=0 the complex is a complex in Rep Z GLₙ; forgetting the action recovers Cⁿ,⁰. |
| `unimodularChains.mapField` | functoriality | A field embedding acts on both coordinate blocks and induces a chain map, commuting with augmentation; identity and composite embeddings induce identity and composite maps. |
| `unimodularChains.affineMap` | structure | The lower block (g 0;u 1) acts by (v,w)↦(gv,uv+w), giving a chain automorphism. Identity and composition follow the actual lower-block multiplication, including the shear when m>0. |
| `unimodularChains.affineMap_frame` | simp | The action sends each independent frame basis chain to the basis chain of its coordinatewise lower-block transform. |
| `unimodularChains.glRepresentation_frame` | compatibility | For m=0 the underlying-complex equivalence identifies the GL representation on every basis frame with the coordinatewise g action; merely giving the right underlying module is insufficient. |

**Unit tests.**

- `unimodularChains_rank_zero` (degenerate): C⁰,ᵐ has degree0 Z and zero positive terms, even when m>0.
- `unimodularChains_rank_one` (computation): For n=1,m=0, d(a)=1 for a≠0, so d((2)−(1))=0 over Q; there are no degree2 independent frames.
- `unimodularChains_ordered_boundary` (computation): For the standard frame (e₁,e₂) in F², d(e₁,e₂)=(e₂)−(e₁); forgetting the order or using an all-positive boundary fails.
- `unimodularChains_linear_independence` (non-example): The distinct vectors e₁ and 2e₁ in Q² are not a degree2 generator. Distinctness alone is insufficient.
- `unimodularChains_affine_shear` (computation): For n=m=1 over Q, the block (1 0;1 1) sends the degree-one frame (1,0) to (1,1). A trivial action on the lower coordinates fails.

**Uses.**

- Su84 §3 spectral sequence: Ordered frames have affine stabilizers; their homology calculates the E¹ page..
- K3BlochGroups:V.4/homological-stability: Its top homology and connecting map supply the stability proof..

**Acceptance.**

- Use the exact hypotheses and normalization in the statement.

**Imports.** [`mathlib:FreeAbelianGroup`](#baseline-mathlib-freeabeliangroup), [`mathlib:LinearIndependent`](#baseline-mathlib-linearindependent), [`mathlib:Rep`](#baseline-mathlib-rep), [`mathlib:Matrix.GeneralLinearGroup`](#baseline-mathlib-matrix-generallineargroup).

**Sources.** [Su84](#source-4-su84) — §2 definitions, Lemmas2.1–2.2, pp191–192.

<a id="v-4-unimodular-acyclic-range"></a>

### V.4.30: Acyclic range of independent frames

`K3BlochGroups:V.4/unimodular-acyclic-range` · theorem

For infinite F, H_q(Cⁿ,ᵐ)=0 for q≠n. Equivalently Um(Fⁿ,Fᵐ) is (n−2)-acyclic in reduced homology; the only possible homology of the shifted augmented complex is its top group Uₙ,ₘ=H_n(Cⁿ,ᵐ). For n=0 the empty augmentation Z is precisely that top group.

**Hypotheses.** F infinite; n,m≥0.

**Construction and proof.**

1. Su84 Lemma2.2: a finite-support cycle in the general-position vector complex can be coned by a new projected vector avoiding finitely many proper subspaces. Prove this finite-subspace avoidance over an infinite field, not merely avoidance of finitely many vectors.
2. The q≤n skeleton of general position is exactly independent tuples. Hence the cone kills homology below n; there are no terms above n. For n=0 inspect C₀ directly.

**Acceptance.**

- For n=1, U₁,₀ is the augmentation kernel of Z[Fˣ]→Z; C itself is not acyclic in degree1.

**Imports.** [`K3BlochGroups:V.4/unimodular-vector-chains`](#v-4-unimodular-vector-chains).

**Sources.** [Su84](#source-4-su84) — Lemmas2.1–2.2, pp191–192.

<a id="v-4-stability-coinvariants"></a>

### V.4.31: Coinvariants of top frame homology

`K3BlochGroups:V.4/stability-coinvariants` · construction

Define Sₙ(F)=H₀(GLₙ(F),Uₙ,₀) using integral coefficient homology and the representation on top frame homology. For n≥1, ⟨a₁,…,aₙ⟩ is the coinvariant class of d(e₁,…,eₙ,Σaᵢeᵢ), aᵢ∈Fˣ. Direct-sum concatenation of independent frames induces associative products Sₙ⊗Sₘ→Sₙ₊ₘ, with S₀=Z as unit. This is Suslin’s frame-homology algebra, not Milnor K-theory itself.

**Hypotheses.** F infinite for the generator presentation; the underlying coinvariants are defined for any field.

**Construction and proof.**

1. Take top homology of the m=0 Rep-valued complex and then the existing H₀ group homology.
2. The acyclic general-position complex presents U by degree n+1 boundaries. Transitive GL-orbit normalization yields the generators and the precise relation stated below.
3. For a direct-sum decomposition concatenate frames; use the shifted Leibniz sign d(xy)=dx·y+(−1)^deg(x)x·dy to descend the product through homology and coinvariants. In the affine variant use affine-block-homology and Shapiro to identify the same coinvariants.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `stabilityCoinvariants` | constructor | The existing H₀ of the top-homology representation. |
| `stabilityCoinvariants.gen` | constructor | For n≥1 and nonzero entries, the specified boundary class ⟨a⟩. |
| `stabilityCoinvariants.ext` | extensionality | Two additive homomorphisms out of Sₙ agreeing on every ⟨a⟩ agree, n≥1. |
| `stabilityCoinvariants.relation` | relation | For pairwise distinct λᵢ∈Fˣ, ⟨λ₁a₁,…,λₙaₙ⟩−⟨a₁,…,aₙ⟩=Σᵢ(−1)ⁱ⁺ⁿ⟨a₁(λ₁−λᵢ),…, omit aᵢ(λᵢ−λᵢ),…,aₙ(λₙ−λᵢ),λᵢ⟩, with indices1,…,n. |
| `stabilityCoinvariants.mul` | structure | Associative bilinear direct-sum product, with S₀=Z acting by integer multiplication; the product uses ordered concatenation. |
| `stabilityCoinvariants.milnorRetraction` | compatibility | The unique homomorphism Sₙ→Kₙᴹ(F) sends every ⟨a⟩ to {a₁,…,aₙ}, using T.2’s Milnor-symbol presentation. |
| `stabilityCoinvariants.unit` | constructor | The empty-frame augmentation class 1 in S₀=Z is the multiplicative unit. |
| `stabilityCoinvariants.mul_unit` | simp | Multiplication by that unit on either side is the identity, after transporting 0+n and n+0. |
| `stabilityCoinvariants.eMul` | structure | Multiplication by e=⟨1,1⟩ is the additive map Sₙ→Sₙ₊₂, with the displayed ordered-product formula. |
| `stabilityCoinvariants.eMul_apply` | simp | eMul(x)=mul(⟨1,1⟩⊗x), transporting the codomain index 2+n to n+2. |

**Unit tests.**

- `stabilityCoinvariants_zero` (degenerate): S₀(F) is Z, not the zero group.
- `stabilityCoinvariants_one` (compatibility): S₁(F)≅Fˣ written additively, and ⟨a⟩ maps to a; in particular ⟨1⟩=0.
- `stabilityCoinvariants_two_unit` (non-example): Under S₂(F)≅K₂ᴹ(F)⊕Z, ⟨1,1⟩ maps to (0,1), so S₂ is not just K₂ᴹ and this class is nonzero.
- `stabilityCoinvariants_product_two` (computation): ⟨a⟩·⟨b⟩=⟨a,b⟩−⟨1,b⟩−⟨a,1⟩+⟨1,1⟩; the Milnor retraction sends it to {a,b}.

**Uses.**

- Su84 Theorem3.4: The edge filtration splits off the degree-two class ⟨1,1⟩..
- K3BlochGroups:V.4/h3-gl3-generation: The symbol quotient is normalized through S₃ and its Milnor retraction..

**Acceptance.**

- Use the exact hypotheses and normalization in the statement.

**Imports.** [`K3BlochGroups:V.4/unimodular-vector-chains`](#v-4-unimodular-vector-chains), [`K3BlochGroups:V.4/unimodular-acyclic-range`](#v-4-unimodular-acyclic-range), [`K3BlochGroups:V.4/affine-block-homology`](#v-4-affine-block-homology), [`mathlib:groupHomology`](#baseline-mathlib-grouphomology), [`mathlib:groupHomology.indIso`](#baseline-mathlib-grouphomology-indiso), [`K2SymbolsBrauer:T.2/milnor-k-theory`](../packets/K2SymbolsBrauer--T.1.json), [`mathlib:Representation.Coinvariants`](#baseline-mathlib-representation-coinvariants).

**Sources.** [Su84](#source-4-su84) — §2.3–2.5, pp192–195.

<a id="v-4-frame-connecting-map"></a>

### V.4.32: Iterated frame connecting homomorphism

`K3BlochGroups:V.4/frame-connecting-map` · construction

For infinite F and n≥1, the exact augmented frame complex defines δₙ:Hₙ(GLₙ(F),Z)→Sₙ(F) by n successive connecting homomorphisms. Its restriction along GLₙ₋₁→GLₙ is zero. With ordered block-sum homology products, δₙ₊ₘ(x×y)=δₙ(x)·δₘ(y). The connecting-map convention is pinned by δ₁([a])=⟨a⟩, so the Milnor symbol comparison has no unspecified sign.

**Hypotheses.** F infinite; n≥1; integral homology; stabilization is diag(g,1).

**Construction and proof.**

1. Use unimodular-acyclic-range to get the exact coefficient sequence 0→Uₙ→Cₙ→⋯→C₁→Z→0. Compose the standard homology connecting maps with the augmentation convention just stated.
2. After restriction to GLₙ₋₁, the augmentation has the fixed-vector section 1↦eₙ, making δ vanish.
3. The concatenation chain pairing and its shifted Leibniz rule compare the iterated connecting maps with the homological cross product. This is Su84 2.6.1, not a Quillen K-theory product calculation.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `frameConnecting` | constructor | The homomorphism δₙ defined from the exact augmented complex. |
| `frameConnecting_stabilization` | relation | δₙ vanishes on the image of Hₙ(GLₙ₋₁), not on all of Hₙ(GLₙ). |
| `frameConnecting_product` | compatibility | δₙ₊ₘ sends the ordered block-sum product to the S-algebra product. |
| `frameConnecting_one` | simp | On H₁(GL₁)=Fˣ written additively, δ₁([a])=⟨a⟩. |
| `frameConnecting_field` | functoriality | The connecting map commutes with field embeddings and the induced maps on group homology and Sₙ. |

**Unit tests.**

- `frameConnecting_one_test` (compatibility): δ₁([2])=⟨2⟩ over Q under the abelianisation identification.
- `frameConnecting_old_rank` (degenerate): Every H₃(GL₂) class maps to zero under δ₃ after stabilization.
- `frameConnecting_torus_three` (computation): The Milnor retraction of δ₃([a]×[b]×[c]) is {a,b,c}, including the order of the three factors.

**Uses.**

- Su84 3.2.2 and Theorem3.4: Identify the E∞ edge map with this connecting homomorphism..
- K3BlochGroups:V.4/h3-gl3-generation: Pin the normalization of the Milnor quotient on ordered torus products..

**Acceptance.**

- Use the exact hypotheses and normalization in the statement.

**Imports.** [`K3BlochGroups:V.4/unimodular-acyclic-range`](#v-4-unimodular-acyclic-range), [`K3BlochGroups:V.4/stability-coinvariants`](#v-4-stability-coinvariants), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`](../../../content/tau-ceti/AlgebraicTopology/README.md#stage-5-bundles-covers-products-and-finite-cover-descent).

**Sources.** [Su84](#source-4-su84) — §2.6 and Lemma2.6.1, p195.

<a id="v-4-normalized-milnor-homology-map"></a>

### V.4.33: Ordered Milnor-to-homology quotient map

`K3BlochGroups:V.4/normalized-milnor-homology-map` · construction

For infinite F and n≥1 define θₙ:Kₙᴹ(F)→Hₙ(GLₙ(F),Z)/im Hₙ(GLₙ₋₁(F),Z) by {a₁,…,aₙ}↦the quotient class of the ordered block-diagonal product [a₁]×⋯×[aₙ]. It is the unique homomorphism with this generator formula. Multilinearity and the Steinberg relation make it well-defined before stability is proved.

**Hypotheses.** F infinite; n≥1; ordered homology cross products, not Quillen products.

**Construction and proof.**

1. Su84 2.7.1 proves multilinearity. The rank-two Steinberg/SL₂ presentation input in the T.2 gap kills the pair a,1−a modulo the old-rank image; ordered block multiplication kills the corresponding relation in all degrees.
2. Descend the tensor-algebra presentation of Milnor K-theory. Uniqueness follows from its symbols generating the group. No stability theorem is used to construct θ.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `milnorHomologyTheta` | constructor | The symbol-induced additive map θₙ to the quotient by the stabilization image. |
| `milnorHomologyTheta_symbol` | simp | A Milnor symbol maps to the quotient class of the ordered degree-one homology product. |
| `milnorHomologyTheta_field` | functoriality | θ commutes with field embeddings and their maps on Milnor K-theory, GL homology and stabilization quotients. |
| `milnorHomologyTheta_unique` | universal-property | Every additive map from Kₙᴹ to the stabilization quotient with the ordered-product formula on symbols equals θₙ. |

**Unit tests.**

- `milnorHomologyTheta_one` (degenerate): θ₁ is Fˣ≅H₁(GL₁) because H₁(GL₀)=0.
- `milnorHomologyTheta_steinberg` (characterisation): The ordered torus product [a]×[1−a]×[b] has zero class modulo im H₃(GL₂), for a≠0,1 and b≠0.
- `milnorHomologyTheta_real_sign` (non-example): Over R, {-1,-1,-1} maps to a nonzero quotient class of order2. An erroneous multiplication-by-2 normalization would kill it.

**Uses.**

- K3BlochGroups:V.4/h3-gl3-generation and psi-gl3: Generate the stable degree-three map from rank2 and diagonal-torus inputs..
- GeneralAlgebraicKTheory:K.2:low-degree-comparisons: Distinguish the ordered homological symbol map from the Quillen/Milnor comparison with factorial coefficients..

**Acceptance.**

- Use the exact hypotheses and normalization in the statement.

**Imports.** [`K3BlochGroups:V.4/frame-connecting-map`](#v-4-frame-connecting-map), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.2/milnor-k-theory`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.2:symbols/milnor-real`](../packets/K2SymbolsBrauer--T.1.json), [`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`](../../../content/tau-ceti/AlgebraicTopology/README.md#stage-5-bundles-covers-products-and-finite-cover-descent), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json).

**Sources.** [Su84](#source-4-su84) — 2.7.1–2.7.4 and Theorem3.4(d), pp195–198.

<a id="v-4-cross-ratio-coefficient-change"></a>

### V.4.34: Field naturality of the cross-ratio

`K3BlochGroups:V.4/cross-ratio-coefficient-change` · theorem

For a field embedding f:F→E and an ordered injective quadruple t in P¹(F), the parent cross-ratio satisfies cr_E(P¹(f)t)=f(cr_F(t)). It induces the corresponding square between degree-three configuration coinvariants and P(F)→P(E), so the maps ψ₂ and the rank-comparison ψ₃ commute with field embeddings. Use cr(0,∞,1,x)=x, not the reciprocal convention of the polylogarithm cocycle.

**Hypotheses.** F,E fields; f a unital field embedding; t consists of four distinct points. Infinitude is needed for ψ from acyclic configurations, not for the cross-ratio identity.

**Construction and proof.**

1. Import the parent cross-ratio construction, its determinant formula and five-face API. Coordinatewise f preserves determinants and nonzero denominators, including points at infinity.
2. The alternating faces of (0,∞,1,x,y) give, in order, (1−x)/(1−y), (1−x⁻¹)/(1−y⁻¹), y/x, y, x. Their alternating sum is the parent V.3 five-term relation. This existing relation, rather than an unordered quadruple, makes the coefficient-change square descend.
3. Use naturality of bar resolution comparison and the parent hyperhomology and rank-comparison maps for ψ. Polylogarithms:P.2 imports r=1/cr, so r(∞,0,1,x)=x.

**Acceptance.**

- For x=2,y=3 over Q the ordered face values are 1/2,3/4,3/2,3,2.
- Over F₃ the unique admissible cross-ratio is −1; a map that needs an infinite field for the ratio itself is too restrictive.

**Imports.** [`K3BlochGroups:V.4/cross-ratio`](#v-4-cross-ratio), [`K3BlochGroups:V.4/coinvariants-p1-homology`](#v-4-coinvariants-p1-homology), [`K3BlochGroups:V.4/hyperhomology-map`](#v-4-hyperhomology-map), [`K3BlochGroups:V.4/psi-compatibility`](#v-4-psi-compatibility), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`mathlib:OnePoint.equivProjectivization`](#baseline-mathlib-onepoint-equivprojectivization), [`mathlib:groupHomology.map`](#baseline-mathlib-grouphomology-map).

**Sources.** [Su91](#source-4-su91) — Lemma2.2, p221.

<a id="v-4-milnor-frame-retraction"></a>

### V.4.35: Milnor retraction of the symbol section

`K3BlochGroups:V.4/milnor-frame-retraction` · theorem

The composite Kₙᴹ(F)→θₙ Hₙ(GLₙ)/im Hₙ(GLₙ₋₁)→δₙ Sₙ(F)→Kₙᴹ(F) is the identity, for infinite F and n≥1. In particular θₙ and its lift into Sₙ are injective. This statement is established before the stability spectral-sequence induction.

**Hypotheses.** F infinite; n≥1; the connecting convention δ₁([a])=⟨a⟩.

**Construction and proof.**

1. Evaluate on a Milnor symbol using the product compatibility of δ. Expand the product of degree-one frame classes by Su84 2.5.3: the term with no entries replaced by1 is ⟨a₁,…,aₙ⟩, all other terms have an entry1.
2. The Milnor retraction sends the first term to {a₁,…,aₙ} and the remaining terms to zero. Symbols generate, proving identity and injectivity.

**Acceptance.**

- Use the exact hypotheses and normalization in the statement.

**Imports.** [`K3BlochGroups:V.4/normalized-milnor-homology-map`](#v-4-normalized-milnor-homology-map), [`K3BlochGroups:V.4/frame-connecting-map`](#v-4-frame-connecting-map), [`K3BlochGroups:V.4/stability-coinvariants`](#v-4-stability-coinvariants), [`K2SymbolsBrauer:T.2/milnor-k-theory`](../packets/K2SymbolsBrauer--T.1.json).

**Sources.** [Su84](#source-4-su84) — Corollary2.7.4, p196.

<a id="v-4-frame-algebra-splitting"></a>

### V.4.36: Splitting of the frame coinvariant algebra

`K3BlochGroups:V.4/frame-algebra-splitting` · theorem

For infinite F, S₂(F)≅K₂ᴹ(F)⊕Z with ⟨a,b⟩↦({a,b},1). For n≥2, Sₙ is the internal sum of the embedded Kₙᴹ and the image of multiplication by e=⟨1,1⟩ from Sₙ₋₂; the intersection is zero. Multiplication by e is injective once the stability induction below is established. For n≥3 all Sₙ are generated by products of positive-degree classes.

**Hypotheses.** F infinite; use the normalized Milnor section θ through δ and the Milnor retraction.

**Construction and proof.**

1. Su84 2.7.1–2.7.4 proves the ordered homology product respects multilinearity and Steinberg relations. The delicate rank-two Steinberg step uses the SL₂ universal-central-extension presentation and its Fˣ-coinvariants; this precise input is a gap in the current T.2 supplier.
2. Su84 3.3.1 changes one coordinate at a time: the difference of generators is decomposable by an explicit cone/concatenation calculation. Thus every generator is congruent to ⟨1,…,1⟩ modulo decomposables.
3. Use the defining relation for pairwise distinct λ’s in odd degree, and multiply ⟨1,…,1⟩ by e in even degree, to show Sₙ is decomposable for n≥3. The degree-two calculation gives K₂ᴹ⊕Z.
4. The section/retraction is the identity on Milnor symbols. Since e retracts to zero and commutes with degree-one elements (Su84 3.3.5), induction gives Sₙ=Kₙᴹ⊕eSₙ₋₂. Injectivity of e belongs to the simultaneous spectral-sequence induction, so it is not assumed here.

**Acceptance.**

- The e summand must survive even when K₂ᴹ(F)=0; no integral identification S₂=K₂ᴹ is permitted.

**Imports.** [`K3BlochGroups:V.4/stability-coinvariants`](#v-4-stability-coinvariants), [`K3BlochGroups:V.4/frame-connecting-map`](#v-4-frame-connecting-map), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.2/milnor-k-theory`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.2/matsumoto`](../packets/K2SymbolsBrauer--T.1.json), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`K3BlochGroups:V.4/milnor-frame-retraction`](#v-4-milnor-frame-retraction).

**Sources.** [Su84](#source-4-su84) — 2.7.4, 3.3.1–3.3.5, pp196–198.

<a id="v-4-frame-spectral-sequence-collapse"></a>

### V.4.37: Suslin’s stability induction

`K3BlochGroups:V.4/frame-spectral-sequence-collapse` · theorem

For infinite F and n≥1, the frame hyperhomology spectral sequence has E¹_{p,q}=H_p(GLₙ₋q(F),Z), 0≤q≤n, and abuts to H_{p+q−n}(GLₙ(F),Uₙ) with the finite frame filtration. The d¹ in odd q is stabilization and in even q is zero. Its dʳ vanish for every r≥2. Multiplication by e:Sₙ₋₂→Sₙ is injective for n≥2. The degree-n edge has kernel im Hₙ(GLₙ₋₁) and its Milnor retraction identifies the quotient with Kₙᴹ. Consequently the finite-step stabilization H_i(GLₙ₋₁)→H_i(GLₙ) is an isomorphism for i≤n−1. These assertions are proved simultaneously, rather than invoking the parent stability theorem to prove itself.

**Hypotheses.** F infinite; GL₀ is the trivial group; homological indexing p=group degree, q=augmented frame length.

**Construction and proof.**

1. Resolve the coefficient complex by the existing bar/projective resolution. Shapiro and affine-block-homology identify each frame orbit stabilizer with GLₙ₋q; the frame filtration has finite length, so no unbounded convergence assertion is used.
2. The alternating q face maps are conjugate stabilization maps, giving stabilization for oddq and zero for evenq. Its total-degree-n edge is exactly frameConnecting.
3. Su84 Theorem3.4 chooses a degree-two cycle mapping to e and constructs the shifted comparison from the (n−2)-rank affine complex to the n-rank frame complex by concatenation. On q≥2 the E¹ comparison is an isomorphism; the shifted source has no q<2 terms. With induction this kills all higher differentials and makes e injective on the abutment.
4. The finite filtration separates the Milnor section from the e summand. Its E∞ terms give both the quotient isomorphism in degree n and the absence of a kernel in degree n−1. Induct over all n before extracting n≤3 or passing to GL∞ via filtered-colimit homology.

**Acceptance.**

- The abutment is top-frame homology with shift n, not H_{p+q}(GLₙ,Z).
- Taking rank4 gives H₃(GL₃)≅H₃(GL₄); the stated range does not assert H₃(GL₂)≅H₃(GL₃).

**Imports.** [`K3BlochGroups:V.4/affine-block-homology`](#v-4-affine-block-homology), [`K3BlochGroups:V.4/unimodular-acyclic-range`](#v-4-unimodular-acyclic-range), [`K3BlochGroups:V.4/frame-algebra-splitting`](#v-4-frame-algebra-splitting), [`K3BlochGroups:V.4/frame-connecting-map`](#v-4-frame-connecting-map), [`mathlib:groupHomology.indIso`](#baseline-mathlib-grouphomology-indiso), [`mathlib:HomologicalComplex₂.total`](#baseline-mathlib-homologicalcomplex-u2082--total), [`mathlib:CategoryTheory.ProjectiveResolution`](#baseline-mathlib-categorytheory-projectiveresolution), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`mathlib:CategoryTheory.SpectralSequence`](#baseline-mathlib-categorytheory-spectralsequence).

**Sources.** [Su84](#source-4-su84) — §3.1–3.2 and Theorem3.4(a–d), pp196–198.

<a id="v-4-homological-stability"></a>

### V.4.38: The homological stability input

`K3BlochGroups:V.4/homological-stability` · lemma

For an infinite field F and r ≥ n, the map H_n(GL_r(F), ℤ) → H_n(GL(F), ℤ) is an isomorphism, and there is a canonical isomorphism H_n(GL_n(F), ℤ)/im H_n(GL_{n−1}(F), ℤ) ≅ K^M_n(F) (Suslin). Only n ≤ 3 is used: H_3(GL_3(F)) ≅ H_3(GL(F)) extends ψ to the stable group (Remark VI.5.12.1), and the quotient statement gives V.4/h3-gl3-generation.

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. V.4 owns this input. Its stage asks to prove the homology-stability lemmas 'here when they are not supplied by H', and no stage supplies them: StableHomotopyKTheory H.3 is the plus construction and GeneralAlgebraicKTheory K.2:plus the ring and plus model; neither states homological stability.
2. Use the scalar and affine-block homology invariance, independent-frame complex, frame-coinvariant algebra splitting, and simultaneous e-injectivity/stability induction of V.4/frame-spectral-sequence-collapse, following Suslin's characteristic-class/Milnor-homology paper (Su84 §§1–2). The normalized Milnor quotient map is V.4/normalized-milnor-homology-map; the general group-homology proof inputs remain its named supplier gaps.
3. Specialise to n = 3 for the extension of ψ to H_3(GL(F), ℤ).

**Acceptance.**

- In degree three rank three suffices and rank two does not: for F = ℝ the quotient H_3(GL_3)/H_3(GL_2) is K^M_3(ℝ), which contains {−1, −1, −1} ≠ 0.
- The quotient identification in degree three gives Milnor K_3(F), matching V.2.
- For a finite field the statement is not asserted; this is one reason V.4 is stated for infinite fields only.

**Imports.** [`mathlib:groupHomology`](#baseline-mathlib-grouphomology), [`mathlib:Matrix.GeneralLinearGroup`](#baseline-mathlib-matrix-generallineargroup), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json), [`K3BlochGroups:V.4/frame-spectral-sequence-collapse`](#v-4-frame-spectral-sequence-collapse), [`K3BlochGroups:V.4/normalized-milnor-homology-map`](#v-4-normalized-milnor-homology-map).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — IV.1.14, IV.1.14.1 and IV.1.15 (PDF p. 278).

<a id="v-4-h3-gl3-generation"></a>

### V.4.39: H_3 of GL_3 is generated by the torus and GL_2

`K3BlochGroups:V.4/h3-gl3-generation` · lemma

For an infinite field F, H_3(GL_3(F), ℤ) is generated by the images of H_3(T_3, ℤ) and H_3(GL_2(F), ℤ).

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. By V.4/homological-stability, H_3(GL_3(F))/im H_3(GL_2(F)) ≅ K^M_3(F), by an isomorphism that carries the class of the product of [a], [b], [c] ∈ H_1(GL_1(F)) (a class in the image of H_3(T_3)) to {a, b, c} up to a universal sign. That compatibility with products is part of Suslin's theorem [183, 3.4] (recorded gap).
2. K^M_3(F) is generated by symbols, so the image of H_3(T_3) maps onto the quotient.

**Acceptance.**

- For F = ℝ the image of H_3(GL_2(ℝ)) is a proper subgroup, since K^M_3(ℝ) ≠ 0.
- The generators needed from the torus are the products of three degree-one classes.

**Imports.** [`K3BlochGroups:V.4/homological-stability`](#v-4-homological-stability), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proof of Proposition VI.5.12 (PDF p. 502).

<a id="v-4-psi-gl3"></a>

### V.4.40: The image of psi on the third homology of the three by three matrices

`K3BlochGroups:V.4/psi-gl3` · theorem

For an infinite field F the image of the map ψ : H_3(GL_3(F), ℤ) → P(F) of V.4/psi3-map is B(F), and the sequence H_3(M_2, ℤ) ⊕ H_3(T_3, ℤ) → H_3(GL_3(F), ℤ) −ψ→ B(F) → 0 is exact.

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. By V.4/h3-gl3-generation, H_3(GL_3(F)) is generated by the images of H_3(T_3) and H_3(GL_2(F)).
2. ψ vanishes on the image of H_3(T_3) (V.4/psi3-torus-vanishing).
3. On the image of H_3(GL_2(F)), ψ is the rank-two map, with image B(F) and kernel the image of H_3(M_2) (V.4/psi-compatibility, V.4/psi-gl2).
4. Hence the image of ψ is B(F); if ψ(t + g) = 0 with t from T_3 and g from GL_2, then ψ(g) = 0, so g comes from H_3(M_2), which gives exactness.

**Acceptance.**

- The composite of the inclusion of the rank-two group with psi is the rank-two map, which is the compatibility lemma.
- psi vanishes on the third homology of the diagonal subgroup.
- The image is B(F): ψ′ itself takes values outside B(F) (ψ′([2; x]) = [2] ∉ B(ℚ)), and only the induced map on homology lands in B(F).

**Imports.** [`K3BlochGroups:V.4/psi3-map`](#v-4-psi3-map), [`K3BlochGroups:V.4/psi-compatibility`](#v-4-psi-compatibility), [`K3BlochGroups:V.4/psi3-torus-vanishing`](#v-4-psi3-torus-vanishing), [`K3BlochGroups:V.4/h3-gl3-generation`](#v-4-h3-gl3-generation), [`K3BlochGroups:V.4/psi-gl2`](#v-4-psi-gl2), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proposition VI.5.12 and its proof (PDF p. 502).

<a id="v-4-symmetric-group-image"></a>

### V.4.41: The image of the homology of the symmetric groups

`K3BlochGroups:V.4/symmetric-group-image` · lemma

Let F be an infinite field and regard Σ_∞ as the group of permutation matrices in GL(F). The image of H_3(Σ_∞, ℤ) −ι_*→ H_3(GL(F), ℤ) −ψ→ B(F) is the subgroup generated by 2c, which is trivial or cyclic of order three.

**Hypotheses.** F is an infinite field (ψ on H_3(GL(F), ℤ) needs the stability input).

**Construction and proof.**

1. Import H_3(Σ_∞, ℤ) ≅ ℤ/12 ⊕ (ℤ/2)² (Ex. IV.1.13) and Nakaoka's H_3(Σ_6, ℤ) ≅ H_3(Σ_∞, ℤ); so only 2- and 3-primary torsion occurs (recorded gap).
2. Use the transfer: for a Sylow p-subgroup S of a finite group, the p-primary part of H_n(G, ℤ), n > 0, is the image of H_n(S, ℤ).
3. Import Suslin's vanishing of the 2-primary part of H_3(Σ_6) in B(F) [183, 4.4.1] (recorded gap).
4. For p = 3 take S = A_3 × σA_3σ^{−1} ⊂ Σ_6 with σ = (14)(25)(36); since H_2(A_3) = 0, Künneth gives H_3(S) = H_3(A_3) ⊕ H_3(σA_3σ^{−1}), and the two summands have the same image because conjugation acts trivially on homology.
5. Conclude with V.4/alternating-group-image; 6c = 0 gives order at most three.

**Acceptance.**

- In characteristic three the image is trivial.
- For F = ℚ the image is cyclic of order three, since c has order six in B(ℚ) (Remark VI.5.2.1).
- The image is generated by twice c, not by c: a wrong computation that produced c would contradict the order of c.

**Imports.** [`K3BlochGroups:V.4/alternating-group-image`](#v-4-alternating-group-image), [`K3BlochGroups:V.4/psi-gl3`](#v-4-psi-gl3), [`K3BlochGroups:V.4/homological-stability`](#v-4-homological-stability), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/c-characteristic-torsion`](#v-3-c-characteristic-torsion).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proposition VI.5.13 and its proof (PDF p. 502).

<a id="v-4-monomial-sequence"></a>

### V.4.42: The monomial-matrix exact sequence

`K3BlochGroups:V.4/monomial-sequence` · theorem

Let F be an infinite field, M = ⋃_n M_n ⊂ GL(F) the monomial group and ι : Σ_∞ → GL(F) the permutation matrices. The sequence H_3(M, ℤ) → H_3(GL(F), ℤ) ⊕ H_3(Σ_∞, ℤ) −(ψ, −ψι_*)→ B(F) → 0 is exact, where the first map is (inclusion_*, π_*) for the projection π : M = F^× ≀ Σ_∞ → Σ_∞.

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. Let H^0_3 M_n be the kernel of H_3(M_n) → H_3(Σ_n); it suffices that its image in H_3(GL(F)) is ker ψ for large n.
2. ker ψ is contained in the image: by Proposition 5.12 it comes from H_3(T_3), which lies in H^0_3 M_n, and from H_3(M_2), which lies in H^0_3 M_n by Ex. VI.5.10(d), because the image of H_3(Σ_2) lies in the image of H_3([M, M]) (Ex. VI.5.12).
3. Conversely, by Ex. VI.5.10(e), H_3(T_3) ⊕ A maps onto H^0_3 M_n, where A = ker(H_3(M_2 × Σ_{n−2}) → H_3(Σ_2 × Σ_{n−2})); by Künneth A = H^0_3(M_2) ⊕ H^0_2(M_2) ⊗ H_1(Σ_{n−2}) ⊕ F^× ⊗ H_2(Σ_{n−2}), and the last two summands land in the image of H_3(T_n) for large n [183, 4.2] (recorded gap).
4. So the image of H^0_3 M_n is ker ψ, which gives exactness; surjectivity is Proposition 5.12.

**Acceptance.**

- The cokernel of H_3(M) → H_3(GL(F)) is B(F)/⟨2c⟩, which is the homological half of Theorem 5.16.
- For a field of characteristic three the symmetric-group contribution is trivial, consistent with the previous lemma.

**Imports.** [`K3BlochGroups:V.4/psi-gl3`](#v-4-psi-gl3), [`K3BlochGroups:V.4/symmetric-group-image`](#v-4-symmetric-group-image), [`K3BlochGroups:V.4/homological-stability`](#v-4-homological-stability), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proposition VI.5.15 (PDF p. 503) and its proof (PDF p. 504).

<a id="v-4-pi3-bm-plus"></a>

### V.4.43: The cokernel of the third homotopy of the plus construction on the monomial group

`K3BlochGroups:V.4/pi3-bm-plus` · theorem

For an infinite field F the cokernel of π_3(BM^+) → K_3(F) is B(F)/⟨2c⟩, and there is an exact sequence π_3(BM^+) → K_3(F) ⊕ π^s_3 −(ψ, −ψι_*)→ B(F) → 0. The indecomposable reformulation (Corollary 5.16.1) is the separate node V.4/pi3ind-sequence.

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. Import that π_*(ℤ × BM^+) ≅ π_*K(F^×-Sets_fin) is a graded-commutative ring with π_1 ≅ F^× × π^s_1, that the map to K_*(F) is a ring map, and that π_2(BM^+) ≅ π^s_2 ⊕ ∧̃²F^× (Ex. VI.5.11) (recorded gap).
2. By Matsumoto's theorem π_2(BM^+) → K_2(F) is onto; multiplying by π_1, K^M_3(F) lies in the image of π_3(BM^+).
3. With P = [M, M] (perfect), π_n(BP^+) ≅ π_n(BM^+) for n ≥ 2, and the ∘η sequences for BP^+ and BSL(F)^+ (V.1/k2-to-k3-h3-e), a diagram chase gives K_3(F)/π_3(BM^+) ≅ H_3(SL(F))/H_3(P).
4. Using BSM^+ ≃ BP^+ × BΣ_2, Künneth and Ex. VI.5.12, H_3(SL(F))/H_3(P) = H_3(SL(F))/H_3(SM); the compatible determinant splittings of H_*(GL(F)) and H_*(M) make H_3(SL)/H_3(SM) → H_3(GL)/H_3(M) an isomorphism.
5. By V.4/monomial-sequence and V.4/symmetric-group-image the cokernel of H_3(M) → H_3(GL(F)) is B(F)/⟨2c⟩; the exact sequence follows as in Proposition 5.15.

**Acceptance.**

- The cokernel is B(F) modulo twice c, not B(F): the difference is the three-torsion detected by the symmetric groups.
- For a field of characteristic three the two statements coincide, since twice c vanishes there.
- For F = ℚ, B(ℚ)/⟨2c⟩ ≅ ℤ/2 (B(ℚ) ≅ ℤ/6 generated by c).

**Imports.** [`K3BlochGroups:V.4/monomial-sequence`](#v-4-monomial-sequence), [`K3BlochGroups:V.4/symmetric-group-image`](#v-4-symmetric-group-image), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups), [`K3BlochGroups:V.4/homological-stability`](#v-4-homological-stability), [`K3BlochGroups:V.1/k2-to-k3-h3-e`](#v-1-k2-to-k3-h3-e), [`K3BlochGroups:V.2/milnor-to-quillen-degree-three`](#v-2-milnor-to-quillen-degree-three), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json), [`StableHomotopyKTheory:H.3`](../packets/StableHomotopyKTheory.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Theorem VI.5.16 (PDF p. 504).

<a id="v-4-pi3ind-sequence"></a>

### V.4.44: The indecomposable form of the monomial exact sequence

`K3BlochGroups:V.4/pi3ind-sequence` · theorem

For an infinite field F the sequence of Theorem 5.16 induces an exact sequence π_3^ind(BM^+) → K_3^ind(F) ⊕ ℤ/12 → B(F) → 0.

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. The image of the products π_1 ⊗ π_2 in K_3(F) ⊕ π^s_3 is K^M_3(F) ⊕ (η³): it contains K^M_3(F), since π_1 → K_1(F) and π_2 → K_2(F) are onto (Matsumoto), it is contained in it, and it contains the image ({−1, −1, −1}, η³) of η³. It maps to zero in B(F) by exactness.
2. Divide the sequence of V.4/pi3-bm-plus by these images, using V.2's definition of K_3^ind(F) as a cokernel.

**Acceptance.**

- For F = ℚ the sequence reads ℤ/4 ⊕ ℤ/12 → ℤ/24 ⊕ ℤ/12 → ℤ/6 → 0.
- Its symmetric-group part is π^s_3/(η³) ≅ ℤ/12, not π^s_3.

**Imports.** [`K3BlochGroups:V.4/pi3-bm-plus`](#v-4-pi3-bm-plus), [`K3BlochGroups:V.4/pi3ind-definition`](#v-4-pi3ind-definition), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`K3BlochGroups:V.2/milnor-to-quillen-degree-three`](#v-2-milnor-to-quillen-degree-three).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Corollary VI.5.16.1 (PDF p. 505).

<a id="v-4-suslin-exact-sequence"></a>

### V.4.45: Suslin's exact sequence

`K3BlochGroups:V.4/suslin-exact-sequence` · theorem

For every infinite field F there is an exact sequence 0 → T̃(F) → K_3^ind(F) → B(F) → 0 (its naturality is V.4/suslin-functoriality), where T̃(F) is the enhanced torsion term of V.4/enhanced-tor (Suslin's Tor_1^ℤ(μ(F), μ(F))~) and B(F) is the Bloch group in Suslin's convention of V.3. Abstractly T̃(F) ≅ μ̃(F), which is the K-book's form 0 → μ̃(F) → K_3^ind(F) → B(F) → 0; that isomorphism is not natural in F.

**Hypotheses.** F is an infinite field. The K-book asserts |F| ≥ 4, but its proof uses F infinite (Lemma 5.11, Example 5.9.1, Remark 5.12.1, and the T_2 ⊂ B isomorphism, which fails for F_4); the finite-field case is a recorded gap. B(F) is the Bloch group in Suslin's convention of V.3 and K_3^ind is the quotient of V.2.

**Construction and proof.**

1. By V.4/pi3ind-sequence and V.4/pi3ind-bm-plus, and since the ℤ/12 summand of π_3^ind(BM^+) maps isomorphically onto the ℤ/12 factor, K_3^ind(F) → B(F) is onto and its kernel is the image of T̃(F).
2. T̃(F) → K_3^ind(F) is injective for F algebraically closed, by V.4/e-invariant-detection.
3. For general F, T̃(F) → T̃(F̄) is injective and the square with K_3^ind(F) → K_3^ind(F̄) commutes, so T̃(F) → K_3^ind(F) is injective.
4. Record that both maps are induced by natural constructions (π_3^ind(BM^+), ψ), so that V.4/suslin-functoriality can prove naturality.

**Acceptance.**

- For the rational numbers the sequence reads 0 → ℤ/4 → ℤ/24 → ℤ/6 → 0, consistent with K_3(ℚ) ≅ ℤ/48 and K_3^M(ℚ) ≅ ℤ/2.
- Complex conjugation on F = ℚ(ζ_3) acts on the quotient Tor_1(μ_6, μ_6) of T̃(F) trivially and on μ(F) = μ_6 by inversion, so the sequence cannot be natural with μ̃(F) as the left-hand term.
- Finite fields are not covered: the proof's inputs fail for F_4 (H_2(B) ≠ H_2(T_2), H_2(GL_2(F_4)) ≅ ℤ/2).

**Imports.** [`K3BlochGroups:V.4/pi3ind-sequence`](#v-4-pi3ind-sequence), [`K3BlochGroups:V.4/pi3ind-bm-plus`](#v-4-pi3ind-bm-plus), [`K3BlochGroups:V.4/enhanced-tor`](#v-4-enhanced-tor), [`K3BlochGroups:V.4/e-invariant-detection`](#v-4-e-invariant-detection), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Theorem VI.5.2 (PDF p. 495); [Kbook.2013](#source-0-kbook-2013) — Proof of Theorem VI.5.2 (PDF p. 507).

<a id="v-4-tor-form-comparison"></a>

### V.4.46: The Tor form of the left-hand term

`K3BlochGroups:V.4/tor-form-comparison` · comparison

Compare the enhanced torsion term T̃(F) = Tor_1^ℤ(μ(F), μ(F))~ (V.4/enhanced-tor) with μ̃(F) (V.4/enhanced-mu). (i) They are isomorphic as abstract groups: both are locally cyclic, with Tor_1(A, A) ≅ A for a locally cyclic torsion group A, and both are the nontrivial extension by ℤ/2 exactly when char F ≠ 2. (ii) No isomorphism is natural in F: an automorphism acting on μ(F) by ζ ↦ ζ^k acts on Tor_1(μ(F), μ(F)) by k² (Ex. VI.5.9(b)), so Galois groups act on T̃ through the square of the cyclotomic character and on μ̃ through the character itself. (iii) The ordinary Tor group cannot replace T̃: for F = ℚ there is no exact sequence 0 → Tor_1(μ(ℚ), μ(ℚ)) → K_3^ind(ℚ) → B(ℚ) → 0, since 2 · 6 ≠ 24.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Compute Tor_1^ℤ(ℤ/n, ℤ/n) ≅ ℤ/n and Tor_1(ℤ/p^∞, ℤ/p^∞) ≅ ℤ/p^∞; since μ(F) is locally cyclic, Tor_1(μ(F), μ(F)) ≅ μ(F) after a choice of compatible generators.
2. Tor_1 is additive in each variable, so the endomorphism k of μ(F) induces k² on Tor_1(μ(F), μ(F)); this is the natural form H_3^ind(A) ≅ Tor(A, A)^τ of Ex. VI.5.9.
3. Deduce (ii) from the example F = ℚ(ζ_3) with complex conjugation: it acts on μ(F) = μ_6 by inversion and on Tor_1(μ_6, μ_6) trivially, so no isomorphism of extensions T̃(F) ≅ μ̃(F) commutes with it.
4. For (iii), with F = ℚ: Tor_1(μ(ℚ), μ(ℚ)) ≅ ℤ/2, K_3^ind(ℚ) ≅ ℤ/24 and B(ℚ) ≅ ℤ/6, and 2 · 6 ≠ 24.

**Acceptance.**

- For the rational numbers the ordinary Tor group has order two and the enhanced group has order four, so the two differ.
- In characteristic two the two agree, so the distinction is invisible there.
- The comparison in (i) is an isomorphism of groups depending on a choice; it is not natural, which is why Suslin's sequence is stated with the Tor form.

**Imports.** [`K3BlochGroups:V.4/enhanced-mu`](#v-4-enhanced-mu), [`K3BlochGroups:V.4/enhanced-tor`](#v-4-enhanced-tor), [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence), [`mathlib:CategoryTheory.Tor`](#baseline-mathlib-categorytheory-tor).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Exercise VI.5.9 (PDF p. 509); [Kbook.2013](#source-0-kbook-2013) — Exercise VI.5.9(b) (PDF p. 509).

<a id="v-4-suslin-functoriality"></a>

### V.4.47: Functoriality and compatibility of the degree-three map

`K3BlochGroups:V.4/suslin-functoriality` · lemma

The Suslin sequence 0 → T̃(F) → K_3^ind(F) → B(F) → 0 is natural for all homomorphisms of infinite fields, and the composite K_3(F) → B(F) agrees with h : K_3(F) → H_3(GL(F), ℤ) (the Hurewicz map, equivalently the composite through V.1's H_3(St(F), ℤ)) followed by the stable ψ of V.4/psi3-map, and it vanishes on the image of K^M_3(F), so it factors through K_3^ind(F).

**Hypotheses.** F and E are infinite fields and F → E is a field homomorphism.

**Construction and proof.**

1. Naturality termwise: T̃ is natural (V.4/enhanced-tor), K_3^ind by V.2, B by V.3, and ψ because F → E induces GL_3(F)-equivariant maps ℙ²(F) → ℙ²(E) of general-position complexes and P(F) → P(E).
2. Compare the two constructions of the map to B(F), through ψ and through the quotient by the image of π_3(BM^+), using the diagram in the proof of Theorem 5.16.
3. Compare with V.1: K_3(F) ≅ H_3(St(F), ℤ) → H_3(E(F), ℤ) = H_3(SL(F), ℤ) → H_3(GL(F), ℤ), and ψ is defined there by stability.
4. The image of {a, b, c} ∈ K^M_3(F) in H_3(GL(F)) comes from H_3(T_3), on which ψ vanishes (V.4/psi3-torus-vanishing), so the map factors through K_3^ind(F).

**Acceptance.**

- For the inclusion of the rational numbers into the reals the naturality square commutes.
- The composite K_3(F) → B(F) vanishes on the symbols {a, b, c} of K^M_3(F).
- With μ̃(F) in place of T̃(F) the square for complex conjugation on ℚ(ζ_3) does not commute (V.4/tor-form-comparison).

**Imports.** [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence), [`K3BlochGroups:V.4/psi3-map`](#v-4-psi3-map), [`K3BlochGroups:V.4/psi3-torus-vanishing`](#v-4-psi3-torus-vanishing), [`K3BlochGroups:V.4/homological-stability`](#v-4-homological-stability), [`K3BlochGroups:V.1/k3-h3-steinberg`](#v-1-k3-h3-steinberg), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.16 proof and VI.5.12.1 (PDF pp. 502, 504-505).

<a id="v-4-degree-three-torus-quotient"></a>

### V.4.48: Degree-three torus generation with normalization

`K3BlochGroups:V.4/degree-three-torus-quotient` · theorem

For infinite F, θ₃ is an isomorphism with inverse the descended Milnor retraction of δ₃. If t₃:H₃((Fˣ)³)→H₃(GL₃) is induced by diagonal matrices and s₂:H₃(GL₂)→H₃(GL₃) by diag(g,1), then im t₃+im s₂=H₃(GL₃). The quotient sends the ordered degree-one product for (a,b,c) to {a,b,c}, with coefficient +1. This supplies the proof interface of the parent h3-gl3-generation; it does not change the primary ψ₃.

**Hypotheses.** F infinite; all homology integral; order of factors fixed.

**Construction and proof.**

1. The pre-stability left-inverse identity and the edge-kernel/surjectivity in frame-spectral-sequence-collapse give a two-sided inverse of θ₃.
2. Every Milnor class is a finite sum of symbols. Lift the symbols through the three-factor torus cross product. Subtract the lift from an arbitrary H₃(GL₃) class; its quotient is zero, hence the difference belongs to im H₃(GL₂).
3. This generation is subsequently used with the parent psi-compatibility and psi3-torus-vanishing to extend the rank-two Bloch map through stable H₃. Those subsequent uses are not prerequisites of generation and do not redefine ψ.

**Acceptance.**

- The same proof does not identify the Quillen-to-Milnor product comparison with coefficient1: its factorial is a different map.
- Over R the repeated symbol of −1 remains nonzero of order2.

**Imports.** [`K3BlochGroups:V.4/normalized-milnor-homology-map`](#v-4-normalized-milnor-homology-map), [`K3BlochGroups:V.4/milnor-frame-retraction`](#v-4-milnor-frame-retraction), [`K3BlochGroups:V.4/frame-spectral-sequence-collapse`](#v-4-frame-spectral-sequence-collapse), [`K3BlochGroups:V.4/monomial-subgroups`](#v-4-monomial-subgroups).

**Sources.** [Su84](#source-4-su84) — Theorem3.4(d), p198.

<a id="v-4-closure-torsion-detector"></a>

### V.4.49: Torsion detector through algebraic closure

`K3BlochGroups:V.4/closure-torsion-detector` · construction

For infinite F choose an algebraic closure Ω and let µ(F) be its roots-of-unity subgroup in Fˣ. The parent δ:H₃(µ(F),Z)→π₃ⁱⁿᵈ(BM(F)⁺)→K₃ⁱⁿᵈ(F), followed by scalar extension to Ω, lands in the torsion of K₃ⁱⁿᵈ(Ω). Uniquely divisible Milnor K₃ and its split embedding identify that torsion with K₃(Ω)_tors. Compose with e_Ω to obtain D_F:H₃(µ(F),Z)→µ_Ω(2)^{Aut(Ω/F)}. Here µ_Ω(2) is the second Tate twist, naturally Tor₁^Z(µ(Ω),µ(Ω)); it is not the ordinary tensor product µ(Ω)⊗Zµ(Ω). This construction uses the e-invariant only on torsion.

**Hypotheses.** F infinite; Ω algebraically closed over F; roots have order prime to the characteristic. The chosen closure is transported along embeddings, with independence of the transport on the invariant target.

**Construction and proof.**

1. The source is locally cyclic; its H₃ is torsion, naturally Tor₁(µ(F),µ(F)), so its image after scalar extension is torsion. The locally-cyclic homology comparison with its natural transition maps is requested at H.1.
2. Use T.2’s unique divisibility of K₃ᴹ(Ω), the existing V.2/milnor-k3-injective, and the pinned injectivity of divisible abelian groups to split its embedding in K₃(Ω). The resulting torsion isomorphism with K₃ⁱⁿᵈ(Ω) is canonical: the divisible torsion-free kernel contributes no torsion and multiplication by m is bijective on it. A splitting need not be chosen naturally.
3. Apply KVI Definition2.1 to the torsion class in the closure. Naturality makes its image fixed by all Ω/F automorphisms. The Tate-twist module and coefficient Chern normalization are the early M interface in the recorded gap.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `closureTorsionDetector` | constructor | The additive homomorphism D_F given by this composite through closure torsion. |
| `closureTorsionDetector_formula` | compatibility | On every H₃(µ(F)) class it equals e_Ω of the torsion class obtained from the parent δ and scalar extension. |
| `closureTorsionDetector_field` | functoriality | Under F→E and compatible closures, D_E∘H₃(µ(F)→µ(E)) is the Tate-twist restriction of D_F; the equality is independent of the closure embedding on the invariant target. |
| `closureTorsionDetector_fixed` | characterisation | Every value is fixed by Aut(Ω/F) under its weight-two action; an automorphism acting on µ_m by ζ↦ζᵃ acts on the detected m-torsion by a². |

**Unit tests.**

- `closureTorsionDetector_alg_closed` (compatibility): For Ω algebraically closed the detector identifies H₃(µ(Ω)) with the entire second Tate twist. The companion tensor-zero test separately excludes the ordinary tensor target.
- `closureTorsionDetector_two` (non-example): For F=Q, H₃(µ(Q))=H₃(C₂)=Z/2 has nonzero detected image; the square of the projection back to Tor multiplies by2 and therefore cannot serve as this detector.
- `closureTorsionDetector_weight_two` (computation): For the actual power-two endomorphism of C₇, the induced H₃ map multiplies by4, and its detector image is multiplied by4 rather than2. The example does not assume this homology calculation as a hypothesis.
- `closureTorsionDetector_tensor_zero` (non-example): For a divisible torsion root group µ, the ordinary tensor product of its underlying additive group with itself is zero. The detector target therefore must be the Tate twist/ordinary Tor, not this tensor product.

**Uses.**

- K3BlochGroups:V.4/e-invariant-detection: Give that target a torsion-correct, natural detector without extending e to every K₃ⁱⁿᵈ class..
- K3BlochGroups:V.4/enhanced-tor and suslin-exact-sequence: Detect the order-two kernel and prove injectivity of the enhanced Tor arrow..

**Acceptance.**

- Use the exact hypotheses and normalization in the statement.

**Imports.** [`K3BlochGroups:V.4/pi3ind-definition`](#v-4-pi3ind-definition), [`K3BlochGroups:V.4/delta-squaring`](#v-4-delta-squaring), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`K2SymbolsBrauer:T.2:symbols/milnor-algebraically-closed`](../packets/K2SymbolsBrauer--T.1.json), [`KTheoryFiniteLocalFields:L.2`](../packets/KTheoryFiniteLocalFields.json), [`MotivicEtaleKTheory:M.7`](../packets/MotivicEtaleKTheory--M.5d.json), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`mathlib:CategoryTheory.Tor`](#baseline-mathlib-categorytheory-tor), [`mathlib:CommGroup.torsion`](#baseline-mathlib-commgroup-torsion), [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective), [`mathlib:AddCommGrpCat.injective_of_divisible`](#baseline-mathlib-addcommgrpcat-injective-of-divisible).

**Sources.** [KVI](#source-4-kvi) — Definition2.1 p6; Lemma5.19 p34; [Su91](#source-4-su91) — Lemma5.7, p236.

<a id="v-4-cyclic-chern-evaluation"></a>

### V.4.50: Chern evaluation on the determinant-one torus

`K3BlochGroups:V.4/cyclic-chern-evaluation` · theorem

Let Ω be algebraically closed, m≥2 prime to char Ω, and ρ_m:µ_m→SL₂(Ω) be ζ↦diag(ζ,ζ⁻¹). If λ is the tautological character and u=c₁(λ), then c₂(ρ_m)=−u∪u in H⁴(µ_m,µ_m^{⊗2}). Evaluation gives an isomorphism H₄(µ_m,Z/m)→µ_m^{⊗2}. The finite-level cyclic resolution fixes its generator and the negative sign. This evaluates the supplier’s Chern class; it does not construct Chern classes in V.4.

**Hypotheses.** Ω algebraically closed; m invertible; finite-level coefficient tensor products over Z/m, with the cyclic generator specified.

**Construction and proof.**

1. Import the early Chern-class interface: c₁ of a character is its Kummer boundary, c₁ of the inverse is −c₁, and the total Chern class satisfies Whitney sum. Thus (1+u)(1−u)=1−u².
2. Use the pinned finite cyclic resolution for the homology groups. Its cohomological product/periodicity and the pairing with H₄ are requested at H.1; the degree-two Kummer class is a periodicity generator.
3. The generator maps to minus a generator of µ_m⊗µ_m. This is still an isomorphism, including evenm. Do not introduce the m≠2 mod4 restriction here; that restriction belongs to the Bott-product route.

**Acceptance.**

- For m=3, c₂ evaluates a generator to −ζ⊗ζ; negating c₂, as in the e normalization, gives +ζ⊗ζ.
- For m=2 the sign is invisible, so m=3 is required as a discriminating test.

**Imports.** [`MotivicEtaleKTheory:M.7`](../packets/MotivicEtaleKTheory--M.5d.json), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json), [`mathlib:Rep.FiniteCyclicGroup.resolution`](#baseline-mathlib-rep-finitecyclicgroup-resolution).

**Sources.** [Su91](#source-4-su91) — Lemma5.7 proof, p236; [KV](#source-4-kv) — Exercise11.5, p89.

<a id="v-4-chern-bockstein-square"></a>

### V.4.51: Finite-coefficient comparison square

`K3BlochGroups:V.4/chern-bockstein-square` · theorem

For algebraically closed Ω and m≥2 invertible with m odd or 8 dividing m, K₄(Ω;Z/m) has generator β², ∂β=ζ, and its Bockstein identifies it with K₃(Ω)[m] and K₃ⁱⁿᵈ(Ω)[m]. Under the early Chern interface c₁,₂(β)=ζ and c₂,₄(β²)=−ζ⊗ζ, so e_Ω=−c₂,₄ after that Bockstein identification. The square from H₄(µ(Ω);Z/m), through the parent monomial/SL homology maps, to c₂,₄ commutes with its integral Bockstein and the parent δ arrow to K₃ⁱⁿᵈ(Ω)[m].

**Hypotheses.** Ω algebraically closed; m≥2 invertible; m odd or 8|m for the cited Chern product rule KV11.3.2. This sufficient cofinal set of moduli covers every prime-to-characteristic torsion order. The order-two case is covered at m=8. No mod4 product normalization is assumed.

**Construction and proof.**

1. Import the algebraically-closed finite-coefficient K-theory calculation from the L.2 Part II request. The Milnor torsion comparison follows from closure-torsion-detector. Import the finite-coefficient K-theory object and Bockstein, already planned at L.1/H.6.
2. The early Chern supplier gives its Bott value, the finite-coefficient product rule of KV11.3.2 (m odd or 8|m), and Hurewicz/Bockstein factorization. Evaluate on β²: e has value +ζ⊗ζ and c₂ has its negative. Hurewicz goes from K₄(Ω;Z/m) to H₄(SL(Ω);Z/m), and the Chern class then evaluates on homology; there is no reverse Hurewicz map.
3. Naturality of the group-homology Bockstein gives the displayed KVI5.19 square through the parent determinant-one torus/monomial map. For 2-primary torsion choose m=2ʳ with r≥3. These levels contain all finite 2-primary orders and use the explicitly supported product rule. The cyclic Chern evaluation itself remains valid at all invertible m, including m=2 and m=4.

**Acceptance.**

- The order-two detector follows at m=8, and all higher 2-primary levels are covered cofinally; excluding m=2 or m=4 from this product proof must not discard 2-primary torsion.
- The integral Bockstein lands in m-torsion, not in the quotient K₃/m.

**Imports.** [`K3BlochGroups:V.4/cyclic-chern-evaluation`](#v-4-cyclic-chern-evaluation), [`K3BlochGroups:V.4/closure-torsion-detector`](#v-4-closure-torsion-detector), [`KTheoryFiniteLocalFields:L.1/k-theory-mod-m`](../packets/KTheoryFiniteLocalFields.json), [`KTheoryFiniteLocalFields:L.1/bott-element`](../packets/KTheoryFiniteLocalFields.json), [`KTheoryFiniteLocalFields:L.2`](../packets/KTheoryFiniteLocalFields.json), [`StableHomotopyKTheory:H.6`](../packets/StableHomotopyKTheory.json), [`MotivicEtaleKTheory:M.7`](../packets/MotivicEtaleKTheory--M.5d.json), [`K3BlochGroups:V.2/k3-to-h3-sl-field`](#v-2-k3-to-h3-sl-field), [`K3BlochGroups:V.4/delta-squaring`](#v-4-delta-squaring).

**Sources.** [KVI](#source-4-kvi) — Lemma5.19 proof and diagram, p34; [KV](#source-4-kv) — Finite coefficients 11.3.2, p82.

<a id="v-4-closure-detector-injectivity"></a>

### V.4.52: Injectivity of the closure torsion detector

`K3BlochGroups:V.4/closure-detector-injectivity` · theorem

For every infinite field F the detector D_F is injective. For algebraically closed F it is an isomorphism onto the second Tate twist. In particular the parent composite H₃(µ(F))→π₃ⁱⁿᵈ(BM(F)⁺)→K₃ⁱⁿᵈ(F) is injective. The assertion concerns ordinary Tor; the parent enhanced-Tor exact kernel additionally uses its AHSS and extension argument.

**Hypotheses.** F infinite; all finite root orders are prime to the characteristic.

**Construction and proof.**

1. For the algebraic closure apply chern-bockstein-square and cyclic-chern-evaluation on every prime-to-characteristic finite torsion level. Take m divisible by8 for the 2-primary levels. Filtered-colimit compatibility passes from µ_m to µ(Ω).
2. Identify H₃(µ(F)) with Tor(µ(F),µ(F)) naturally, and use the injective locally-cyclic transition to Tor(µ(Ω),µ(Ω)). This is weight-two functoriality, so an arbitrary one-root identification is inadequate.
3. The naturality square and the isomorphism at Ω force D_F to be injective. Use the parent AHSS/delta-squaring/enhanced-tor argument to obtain the enhanced kernel and then the imported suslin-exact-sequence. This final use preserves the primary characteristic-two and infinite-field conditions.

**Acceptance.**

- For F=Q the ordinary Tor detected here has order2, while the enhanced kernel in the Suslin sequence has order4. The two groups cannot be substituted for one another.

**Imports.** [`K3BlochGroups:V.4/chern-bockstein-square`](#v-4-chern-bockstein-square), [`K3BlochGroups:V.4/closure-torsion-detector`](#v-4-closure-torsion-detector), [`StableHomotopyKTheory:H.1`](../packets/StableHomotopyKTheory.json).

**Sources.** [Su91](#source-4-su91) — Lemma5.7 and Lemma5.8, pp236–237; [KVI](#source-4-kvi) — Lemma5.19, p34.

### V.4 closure requirements

**General homology supplier closure.** Part II after H.1’s classifying-space/bar/local-coefficient comparison: LHS for group extensions with coefficients, projective-resolution double-complex hyperhomology spectral sequences with finite filtrations and edge/connectors, integral UCT detection from Q and all F_p, ordered products and filtered colimits for group homology, the trivial action of central coefficient operators on homology, mixed exterior/symmetric elementary-abelian homology in all characteristics, finite cyclic cohomology periodicity/cup evaluation, and natural H₃(A)=Tor₁(A,A) for locally cyclic A with injective root-group transitions. Existing Mathlib SpectralSequence, total complexes, resolutions and cyclic resolutions are inputs, not new definitions. The H.1 packet and upstream stage5 already provide the entry points; the extra results are a Part II, not presumed to follow from the name of H.1.

Consumers: [`K3BlochGroups:V.4/scalar-homology-vanishing`](#v-4-scalar-homology-vanishing), [`K3BlochGroups:V.4/affine-block-homology`](#v-4-affine-block-homology), [`K3BlochGroups:V.4/frame-spectral-sequence-collapse`](#v-4-frame-spectral-sequence-collapse), [`K3BlochGroups:V.4/closure-detector-injectivity`](#v-4-closure-detector-injectivity).

**Unstable SL₂ Steinberg input.** The existing integral symbol identities and product presentation. Additional input needed for Su84 Proposition2.7.2: the unstable H₂(SL₂(F)) coinvariant presentation used to kill the ordered degree-two Steinberg product modulo H₂(GL₁). Stable Matsumoto/UCE is insufficient; propose T.2 Part II for this presentation. Su84 Proposition2.7.2 cites its unstable symbols source; that proof input has not been obtained and read in the cited source decomposition.

Consumers: [`K3BlochGroups:V.4/normalized-milnor-homology-map`](#v-4-normalized-milnor-homology-map).

**Algebraically closed finite-coefficient K-theory.** Part II extending the henselian/local finite-coefficient remit to algebraically closed fields: K₄(Ω) uniquely divisible, K₄(Ω;Z/m) cyclic with Bott-square generator for m invertible and m odd or 8|m for this proof, and Bockstein isomorphism to K₃(Ω)[m], with natural coefficient changes. Current henselian finite-residue-field rigidity does not state this input. The calculation is stated in KVI1.3.1/1.4; its cited proof has not been decomposed. Milnor injectivity is imported from V.2, not requested anew.

Consumers: [`K3BlochGroups:V.4/chern-bockstein-square`](#v-4-chern-bockstein-square).

**Early Chern supplier and regulator cycle.** An early supplier interface adjacent to M.7: prime-to-characteristic Tate twists and invariants; finite-coefficient étale c₁,c₂, Kummer/Whitney and Bott values, and their group-homology/Hurewicz/Bockstein factorization. The full M.8 regulator stage is not usable here: M.8→BorelRegulators:R.7→Polylogarithms:P2→V.4 gives a stage cycle. Split off the early Chern slice without those regulator prerequisites. The product normalization is requested only for odd m or 8|m, as in KV11.3.2; no mod4 rule is inferred from the cited theorem.

Consumers: [`K3BlochGroups:V.4/closure-torsion-detector`](#v-4-closure-torsion-detector), [`K3BlochGroups:V.4/cyclic-chern-evaluation`](#v-4-cyclic-chern-evaluation), [`K3BlochGroups:V.4/chern-bockstein-square`](#v-4-chern-bockstein-square).

**The source omits the GL₂ d³ calculation.** Su91 Lemma2.4 p222 states the boundary formula and explicitly omits the long calculation. Acquisition of the original paper therefore does not close the primary chain-level sign/computation gap. Need an actual bar-chain proof in the parent conventions, not a citation saying the computation was read.

Consumers: [`K3BlochGroups:V.4/gl2-d3-boundary`](#v-4-gl2-d3-boundary), [`K3BlochGroups:V.4/coinvariants-p1-homology`](#v-4-coinvariants-p1-homology), [`K3BlochGroups:V.4/psi-gl2`](#v-4-psi-gl2).

**Inherited ψ₃ and symmetric-group proof inputs.** Retain the inherited nodes and their gaps. Su91 §§3–4 chain construction, torus boundary and rank-two-kernel arguments are not fully read in the cited source decomposition. The symmetric/alternating-group image needs the distinct GL₃ homology source cited as [184], including its 2-primary calculation; Su84 [183] stability is not that source. Need those source proofs and the monomial Künneth summand identifications.

Consumers: [`K3BlochGroups:V.4/psi3-map`](#v-4-psi3-map), [`K3BlochGroups:V.4/psi3-torus-vanishing`](#v-4-psi3-torus-vanishing), [`K3BlochGroups:V.4/dupont-sah-identity`](#v-4-dupont-sah-identity), [`K3BlochGroups:V.4/symmetric-group-image`](#v-4-symmetric-group-image), [`K3BlochGroups:V.4/alternating-group-image`](#v-4-alternating-group-image).

**Inherited plus-construction and enhanced Tor closure.** Retain the primary BPQ/low stable stems, η³, homology-to-AHSS comparison and extension-class gaps. Ordinary Tor detection in this packet does not itself prove the enhanced extension is nonsplit in characteristic≠2. Need exact early H suppliers with no downstream V.4 cycle and the source’s 2-primary AHSS/extension computation. Infinite-field scope is retained; V.5 owns the independent finite-field route.

Consumers: [`K3BlochGroups:V.4/pi3-bm-plus`](#v-4-pi3-bm-plus), [`K3BlochGroups:V.4/pi3ind-ahss`](#v-4-pi3ind-ahss), [`K3BlochGroups:V.4/pi3ind-sequence`](#v-4-pi3ind-sequence), [`K3BlochGroups:V.4/enhanced-tor`](#v-4-enhanced-tor), [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence).

<a id="v5"></a>

## V.5: Finite fields, number fields and integral torsion

Import Quillen's finite-field K₃ and transfer from L.1 and Milnor K₂
vanishing from T.2. This gives K₃ᶦⁿᵈ(𝔽_q)=K₃(𝔽_q)=ℤ/(q²−1) for all q,
including 2 and 3. The unstable group used by the comparison is instead
H₃(SL₂(𝔽_q),ℤ[1/ℓ]), with ℓ the characteristic. Its integral counterpart has
an extra ℤ/ℓ for q=2,3,4,5,8,9,27. For q=5 its integral order is 120.

The stabilization composite with V.2's Hurewicz map defines σ_F. Use the
finite refined configuration complex, rather than infinite-set acyclicity,
to construct λ_F; then b_F=λ_F∘σ_F⁻¹. For q≥4 the Bloch order is q+1 in even
characteristic and (q+1)/2 in odd characteristic. B(𝔽₂)=0 and
B(𝔽₃)=2ℤ≅ℤ lie outside that formula. The odd-n comparison requires n>0
and gcd(n,q−1)=1. The case q=7,n=3 fails this condition.

Build the nonsplit Cartan from the norm-one units of the quadratic extension,
using a basis to obtain actual determinant-one matrices. Its induced homology
map and generator-change rule are essential; an abstract cyclic isomorphism
does not define this map. Number-field applications import the ambient N.5
groups and use V.2's signs to determine the decomposable image. Over ℚ the
orders 48, 2 and 24 retain the nonsplit extension. For ℚ(i), r₁=0 and the
w₂=24 certificate gives ℤ⊕ℤ/24. Finally, the Rogers homomorphism with period
π²ℤ detects c of exact order six over ℝ and ℚ; Bloch–Wigner vanishes on real
points and cannot give that lower bound.

**Planets.** [K₃ of a number field](#v-5-k3-number-field); [Lee–Szczarba computation of K₃(ℤ)](#v-5-k3-z-and-q); [K₃ of a finite field](#v-5-k3-finite-field); [Finite Bloch–Wigner map](#v-5-finite-cross-ratio-map); [Bloch group of a finite field](#v-5-bloch-group-finite-field); [Universal Bloch torsion](#v-5-universal-class-order-six).

<a id="v-5-k3-number-field"></a>

### V.5.1: K_3 of a number field

`K3BlochGroups:V.5/k3-number-field` · theorem

Let F be a number field with r_1 real and r_2 complex places, and let w = w_2(F) be the order of the Galois invariants µ(2)^G of the second Tate twist of the roots of unity (K-book Definition VI.2.1); equivalently w_2(F) = 2 ∏_p p^{ν_p}, with ν_p the largest ν such that ζ_{p^ν} + ζ_{p^ν}^{−1} lies in F. Then K_3^ind(F) ≅ Z^{r_2} ⊕ Z/w. If F is totally imaginary, K_3(F) ≅ Z^{r_2} ⊕ Z/w; if r_1 > 0, K_3(F) ≅ Z^{r_2} ⊕ Z/(2w) ⊕ (Z/2)^{r_1 − 1}. The isomorphisms are abstract: no natural splitting and no canonical generator of the free part is asserted.

**Hypotheses.** F is a number field with r_1 real and r_2 complex places. w = w_2(F) as defined in K-book Definition VI.2.1.

**Construction and proof.**

1. Import the n = 3 rows of ArithmeticKTheory N.5 (stage text: 'For a totally imaginary field the abstract group is Z^{r_2}⊕Z/w_j(F)' and, for r₁>0 and n ≡ 3 mod 8, 'Z^{r_2}⊕Z/(2w_j(F))⊕(Z/2)^{r_1−1}') with j = 2.
2. K_3^M(F) ≅ (Z/2)^{r_1} (V.2/milnor-k3-number-field) injects into K_3(F) (V.2/milnor-k3-injective), and K_3^ind(F) is the quotient (V.2/decomposable-exactness).
3. If F is totally imaginary, K_3^M(F) = 0 and K_3^ind(F) = K_3(F).
4. If r_1 > 0, the torsion subgroup T = Z/(2w) ⊕ (Z/2)^{r_1 − 1} has 2-torsion T[2] ≅ (Z/2)^{r_1}; the image of K_3^M(F) is an elementary abelian subgroup of rank r_1 of T, hence equals T[2], and K_3^ind(F) ≅ Z^{r_2} ⊕ T/T[2] ≅ Z^{r_2} ⊕ 2T ≅ Z^{r_2} ⊕ Z/w.
5. Record that the decomposition is an abstract isomorphism, not a natural splitting.

**Acceptance.**

- For Q (r_1 = 1, r_2 = 0, w_2 = 24) the formulas give K_3 ≅ Z/48 and K_3^ind ≅ Z/24, as in V.5/k3-Q-splitting.
- For Q(√−3) (r_2 = 1, w_2 = 24) they give K_3 ≅ Z ⊕ Z/24.
- For Q(√2) (r_1 = 2, w_2 = 48) they give K_3 ≅ Z/96 ⊕ Z/2 and K_3^ind ≅ Z/48, which exercises the (Z/2)^{r_1 − 1} factor.
- The name w_2(F) is the K-book's; 'Adams-Bott invariant' is not a term of either source.

**Imports.** [`ArithmeticKTheory:N.5`](../packets/ArithmeticKTheory--N.5.json), [`K3BlochGroups:V.2/milnor-k3-number-field`](#v-2-milnor-k3-number-field), [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective), [`K3BlochGroups:V.2/decomposable-exactness`](#v-2-decomposable-exactness).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Corollary VI.5.3 (PDF p. 496); [Kbook.2013](#source-0-kbook-2013) — Definition VI.2.1 (PDF p. 477); [CGZ.2018](#source-0-cgz-2018) — §1.2, equation (10), p. 4.

<a id="v-5-k3-z-and-q"></a>

### V.5.2: K_3 of the integers and of the rational numbers

`K3BlochGroups:V.5/k3-Z-and-Q` · theorem

K_3(Z) and K_3(Q) are both cyclic of order 48, and the map K_3(Z) → K_3(Q) induced by the inclusion is an isomorphism. The decomposable class {−1, −1, −1} is nonzero in K_3(Q), so the e-invariant K_3(Q) → Z/24 is not injective. The group K_3(Q) is the case F = Q of V.5/k3-number-field, the localisation isomorphism is imported from ArithmeticKTheory N.5, and the decomposable class comes from V.2. ArithmeticKTheory N.8 records these values by importing this node, so N.8 is not a prerequisite.

**Hypotheses.** No hypotheses beyond the two rings named.

**Construction and proof.**

1. Apply V.5/k3-number-field to F = Q, which has r_1 = 1, r_2 = 0 and w_2(Q) = 24 (K-book Example VI.2.1.2): the case r_1 > 0 gives K_3(Q) ≅ Z/(2·24) ⊕ (Z/2)^0 = Z/48.
2. Import from ArithmeticKTheory N.5, whose stage text reads 'Prove K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F) for j≥2', the case F = Q, S = ∅, j = 2: the inclusion Z → Q induces K_3(Z) ≅ K_3(Q). N.5 also owns the natural e-invariant.
3. K_3^M(Q) ≅ Z/2 is generated by {−1, −1, −1} (V.2/milnor-k3-number-field with r_1 = 1) and injects into K_3(Q) (V.2/milnor-k3-injective), so {−1, −1, −1} ≠ 0 in K_3(Q).
4. The e-invariant has target Z/24 and source of order 48, so it is not injective; the K-book records that it vanishes on {−1, −1, −1}.

**Acceptance.**

- The order is 48, not 24: the decomposable class of order 2 is nonzero.
- The comparison between Z and Q is an isomorphism, the localisation statement of N.5.
- The e-invariant is not injective, which detects a model that forgets the decomposable class.

**Imports.** [`ArithmeticKTheory:N.5`](../packets/ArithmeticKTheory--N.5.json), [`K3BlochGroups:V.5/k3-number-field`](#v-5-k3-number-field), [`K3BlochGroups:V.2/milnor-k3-number-field`](#v-2-milnor-k3-number-field), [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Example VI.2.1.2 (PDF p. 478); [Kbook.2013](#source-0-kbook-2013) — Remark VI.2.1.3 (PDF p. 478); [Kbook.2013](#source-0-kbook-2013) — Corollary VI.5.3 (PDF p. 496); [Kbook.2013](#source-0-kbook-2013) — Example VI.2.1.2 (PDF p. 478).

<a id="v-5-k3-q-splitting"></a>

### V.5.3: The decomposable and indecomposable parts for the rational numbers, and the Bloch group

`K3BlochGroups:V.5/k3-Q-splitting` · comparison

For the rational numbers: K_3^M(Q) is cyclic of order two, generated by {−1, −1, −1}, and injects into K_3(Q) ≅ Z/48, so K_3^ind(Q) is cyclic of order 24. The enhanced roots of unity form a cyclic group of order four, Suslin's sequence reads 0 → Z/4 → Z/24 → B(Q) → 0, and B(Q) is cyclic of order six. The element c = [2] + [−1] lies in B(Q) and 6c = 0; that c has order exactly six, and hence generates B(Q), is the separate node V.5/element-c-order-six.

**Hypotheses.** The field is the rational numbers.

**Construction and proof.**

1. K_3^M(Q) ≅ Z/2 = ⟨{−1, −1, −1}⟩ (V.2/milnor-k3-number-field, r_1 = 1) injects into K_3(Q) ≅ Z/48 (V.2/milnor-k3-injective, V.5/k3-Z-and-Q).
2. By the exact sequence of V.2/decomposable-exactness, K_3^ind(Q) is the quotient of Z/48 by its unique subgroup of order 2, which is cyclic of order 24.
3. µ(Q) = {±1} has even order, so µ̃(Q) is cyclic of order 4 (V.4/enhanced-mu).
4. Suslin's sequence (V.4/suslin-exact-sequence, |Q| ≥ 4) makes B(Q) a quotient of Z/24 by a subgroup of order 4, cyclic of order 6.
5. c = [2] + [1 − 2] lies in B(Q) (V.3/element-c) and 6c = 0 (V.3/angle-bracket-homomorphism, which needs |F| ≥ 4).

**Acceptance.**

- The four orders are 2, 24, 4 and 6, consistent with 48 = 2 · 24 and 24 = 4 · 6.
- The sequence 0 → Z/4 → Z/24 → Z/6 → 0 does not split, since Z/24 is not isomorphic to Z/4 ⊕ Z/6.
- No analytic input is used here; the lower bound on the order of c is isolated in V.5/element-c-order-six.

**Imports.** [`K3BlochGroups:V.5/k3-Z-and-Q`](#v-5-k3-z-and-q), [`K3BlochGroups:V.2/milnor-k3-number-field`](#v-2-milnor-k3-number-field), [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective), [`K3BlochGroups:V.2/decomposable-exactness`](#v-2-decomposable-exactness), [`K3BlochGroups:V.4/enhanced-mu`](#v-4-enhanced-mu), [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Remark VI.5.2.1 (PDF p. 496).

<a id="v-5-k3-gaussian"></a>

### V.5.4: K_3 of the Gaussian rationals

`K3BlochGroups:V.5/k3-gaussian` · theorem

K_3 of the field obtained by adjoining a square root of minus one to the rational numbers is the direct sum of a free group of rank one and a cyclic group of order twenty-four. The free summand is the assertion that a basis exists; no canonical generator is asserted, and none is available from the proof.

**Hypotheses.** The field is the rational numbers with a square root of minus one adjoined.

**Construction and proof.**

1. Apply V.5/k3-number-field: Q(i) is totally imaginary with r_2 = 1, and w_2(Q(i)) = w_2(Q) = 24 by K-book Example VI.2.1.2, so the first case gives Z ⊕ Z/24.
2. Record that K_3^M(Q(i)) = 0 (V.2/milnor-k3-number-field, r_1 = 0), so K_3 and its indecomposable quotient agree.
3. State the caveat about the free summand explicitly.
4. Record the direction of the dependency: ArithmeticKTheory N.8, whose stage text reads 'compute K₂(Z[i])=0 and K₃(Q(i)) ≅ Z ⊕ Z/24', records this value by importing this node, so N.8 is not a prerequisite.

**Acceptance.**

- The torsion order is twenty-four and the rank is one.
- Milnor K_3 vanishes, so there is no decomposable class to track, unlike the rational numbers.
- No canonical generator of the free part is produced; a definition that names one is asserting more than the proof gives.

**Imports.** [`K3BlochGroups:V.5/k3-number-field`](#v-5-k3-number-field), [`K3BlochGroups:V.2/milnor-k3-number-field`](#v-2-milnor-k3-number-field).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Corollary VI.5.3 (PDF p. 496); [Kbook.2013](#source-0-kbook-2013) — Example VI.2.1.2 (PDF p. 478).

<a id="v-5-milnor-k3-finite-field"></a>

### V.5.5: Milnor K_3 of a finite field vanishes

`K3BlochGroups:V.5/milnor-k3-finite-field` · lemma

For every finite field F_q, including q = 2 and q = 3, K_3^M(F_q) = 0. Consequently the quotient map K_3(F_q) → K_3^ind(F_q) of V.2 is an isomorphism.

**Hypotheses.** F_q is a finite field with q elements.

**Construction and proof.**

1. K_2(F_q) = 0 (K2SymbolsBrauer T.5, whose stage text reads 'Prove K₂(Z) ≅ Z/2 with generator {−1,−1}, K₂(F_q)=0'), and K_2^M(F_q) ≅ K_2(F_q) by Matsumoto's theorem (K2SymbolsBrauer T.2:symbols).
2. K_3^M(F) is generated by the symbols {a, b, c}, each the product of {a, b} ∈ K_2^M(F) with {c}; so K_2^M(F_q) = 0 forces K_3^M(F_q) = 0.
3. The degree-three Milnor-to-Quillen map (V.2/milnor-to-quillen-degree-three) therefore has zero image, and the exact sequence of V.2/decomposable-exactness gives K_3(F_q) ≅ K_3^ind(F_q).

**Acceptance.**

- The lemma holds for q = 2 and q = 3, unlike the Bloch-group statements.
- K_3(F_q) → K_3^ind(F_q) is an isomorphism, so no decomposable class needs tracking over finite fields.
- The proof uses only K_2(F_q) = 0, not the injectivity theorem of V.2.

**Imports.** [`K2SymbolsBrauer:T.5`](../packets/K2SymbolsBrauer--T.3.json), [`K2SymbolsBrauer:T.2:symbols`](../packets/K2SymbolsBrauer--T.1.json), [`K3BlochGroups:V.2/milnor-to-quillen-degree-three`](#v-2-milnor-to-quillen-degree-three), [`K3BlochGroups:V.2/decomposable-exactness`](#v-2-decomposable-exactness).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Examples III.7.2(a) (PDF p. 253).

<a id="v-5-k3-finite-field"></a>

### V.5.6: K_3 of a finite field

`K3BlochGroups:V.5/k3-finite-field` · theorem

For every finite field with q elements, K_3 is cyclic of order q squared minus one. The statement includes q = 2 and q = 3, where it is obtained from the finite-field calculation and not from any Bloch-group presentation, since the Bloch groups of those two fields are exceptional.

**Hypotheses.** F is a finite field with q elements.

**Construction and proof.**

1. Import Quillen's calculation from KTheoryFiniteLocalFields L.1 in the case j = 2, whose stage text reads: 'Prove, for every finite field with q elements and every j≥1, K_0(F_q)=Z, K_{2j}(F_q)=0, K_{2j−1}(F_q)≅Z/(q^j−1).' This gives K_3(F_q) cyclic of order q² − 1.
2. Record that the import is valid for every q, including q = 2 and q = 3, because L.1 states it for every finite field; no Bloch-group input is used.
3. By V.5/milnor-k3-finite-field, K_3^M(F_q) = 0, so the quotient map K_3(F_q) → K_3^ind(F_q) of V.2 is an isomorphism for every q.
4. Record the prohibition the roadmap states: the two small cases must not be deduced from Suslin's sequence, which is stated only for |F| ≥ 4 and whose Bloch-group term is B(F_2) = 0, B(F_3) ≅ Z in Suslin's convention.

**Acceptance.**

- For q = 2 the group is cyclic of order three and for q = 3 it is cyclic of order eight; both come from the import, not from a Bloch-group count.
- For q = 4 the group is cyclic of order fifteen, which together with the enhanced roots of unity of order three gives the Bloch group of order five recorded in V.3.
- The group is cyclic; a wrong deduction through a presentation excluding small fields would leave the two exceptional cases unproved.

**Imports.** [`KTheoryFiniteLocalFields:L.1`](../packets/KTheoryFiniteLocalFields.json), [`K3BlochGroups:V.5/milnor-k3-finite-field`](#v-5-milnor-k3-finite-field), [`mathlib:ZMod`](#baseline-mathlib-zmod).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Corollary IV.1.13 (PDF p. 277).

<a id="v-5-finite-field-transfer"></a>

### V.5.7: Restriction and transfer in degree three for finite fields

`K3BlochGroups:V.5/finite-field-transfer` · lemma

Let F_q ⊂ F_{q^d} be an extension of finite fields of degree d, with Galois group G generated by the Frobenius. In degree three: the restriction K_3(F_q) → K_3(F_{q^d}) is injective and identifies K_3(F_q) with the invariants K_3(F_{q^d})^G, the unique subgroup of order q² − 1 of the cyclic group of order q^{2d} − 1; the transfer K_3(F_{q^d}) → K_3(F_q) is surjective; transfer after restriction is multiplication by d; and restriction after transfer is the sum of the Galois conjugations, which is multiplication by (q^{2d} − 1)/(q² − 1) because the Frobenius acts on K_3(F_{q^d}) as multiplication by q². No cyclic generator is chosen. These are the case j = 2 of KTheoryFiniteLocalFields L.1, which constructs the maps and proves the formulas; this node only specialises them.

**Hypotheses.** F_q ⊂ F_{q^d} is an extension of finite fields of degree d ≥ 1, with Galois group G.

**Construction and proof.**

1. Import from KTheoryFiniteLocalFields L.1 the restriction and transfer maps and their formulas in the functorial model; its stage text reads: 'Construct the restriction and transfer maps for finite extensions and prove their formulas in the functorial model. Choosing a cyclic generator may introduce choices; the product/transfer formulas must not depend on pretending such a generator is canonical.'
2. Specialise to j = 2 using V.5/k3-finite-field: the source and target are cyclic of orders q² − 1 and q^{2d} − 1.
3. Injectivity of restriction, its identification with the G-invariants and surjectivity of transfer are the degree-three case of the K-book statement quoted below.
4. Transfer after restriction is multiplication by d (projection formula, imported from L.1); restriction after transfer is the sum over G, and the Frobenius acts as multiplication by q² in degree three, so the sum is multiplication by 1 + q² + … + q^{2(d−1)} = (q^{2d} − 1)/(q² − 1).
5. Check that no generator enters: all four statements are about maps and subgroups.

**Acceptance.**

- For d = 1 both maps are the identity.
- For q = 2 and d = 2 the restriction Z/3 → Z/15 has image the subgroup of order 3, transfer after restriction is multiplication by 2, and restriction after transfer is multiplication by 5.
- The composites are consistent: (q^{2d} − 1)/(q² − 1) = 1 + q² + … + q^{2(d−1)} is congruent to d modulo q² − 1, as it must be, since restriction after transfer after restriction equals restriction after multiplication by d.
- The formulas are stated without choosing a generator, which is the acceptance test the imported layer asks for.

**Imports.** [`K3BlochGroups:V.5/k3-finite-field`](#v-5-k3-finite-field), [`KTheoryFiniteLocalFields:L.1`](../packets/KTheoryFiniteLocalFields.json).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Corollary IV.1.13 (PDF p. 277).

<a id="v-5-finite-indecomposable-specialization"></a>

### V.5.8: Finite-field indecomposable quotient

`K3BlochGroups:V.5/finite-indecomposable-specialization` · application

For every finite field F of cardinality q, including q=2,3, the canonical quotient K₃(F)→K₃ⁱⁿᵈ(F) is an isomorphism. Its group has order q²−1, imported from L.1; no Quillen model or generator is constructed here.

**Hypotheses.** F is a finite field with cardinality q≥2 and prime characteristic ℓ.

**Construction and proof.**

1. Use the primary finite Milnor vanishing, whose proof reduces tensors to the exact finite K₂ vanishing at T.2, not to the unrelated T.5 stage.
2. The image of the degree-three Milnor map is zero; the cokernel quotient is therefore an isomorphism.
3. Apply L.1/quillen-k-groups with i=2.

**Acceptance.**

- q=2 gives Z/3, q=3 gives Z/8, q=5 gives Z/24.

**Imports.** [`K3BlochGroups:V.5/milnor-k3-finite-field`](#v-5-milnor-k3-finite-field), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`KTheoryFiniteLocalFields:L.1/quillen-k-groups`](../packets/KTheoryFiniteLocalFields.json), [`K2SymbolsBrauer:T.2/k2-finite-field`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.2/matsumoto`](../packets/K2SymbolsBrauer--T.1.json).

**Sources.** [KIII](#source-5-kiii) — III.7.2(a), p61; [KIV](#source-5-kiv) — IV.1.13, p10.

<a id="v-5-transfer-on-indecomposables"></a>

### V.5.9: Restriction and transfer on finite indecomposables

`K3BlochGroups:V.5/transfer-on-indecomposables` · application

Transport L.1’s restriction, transfer and Frobenius along the canonical quotient isomorphisms. For Fq⊂Fqᵈ: restriction is injective with image the Gal-invariants, transfer is onto, tr∘res=d, res∘tr=(q²ᵈ−1)/(q²−1), and Frobenius acts by q². The same formulas hold on K₃ⁱⁿᵈ and do not specify generators.

**Hypotheses.** E/F is an extension of finite fields, |F|=q and [E:F]=d≥1. Restriction, transfer and Frobenius are the L.1 maps, transported through the canonical indecomposable quotient isomorphisms.

**Construction and proof.**

1. Use the naturality of the V.2 quotient and its finite-field inverse.
2. Conjugate the supplier’s i=2 maps and identities by these isomorphisms.

**Acceptance.**

- d=1 gives identity maps.
- F₂⊂F₄: tr∘res=2, res∘tr=5 on Z/15; Frob₂ acts by4.

**Imports.** [`K3BlochGroups:V.5/finite-indecomposable-specialization`](#v-5-finite-indecomposable-specialization), [`KTheoryFiniteLocalFields:L.1/finite-field-transfer-formulas`](../packets/KTheoryFiniteLocalFields.json), [`KTheoryFiniteLocalFields:L.1/finite-field-galois-descent`](../packets/KTheoryFiniteLocalFields.json).

**Sources.** [KIV](#source-5-kiv) — IV.1.13, p10.

<a id="v-5-localized-sl2-homology"></a>

### V.5.10: Prime-to-characteristic third homology

`K3BlochGroups:V.5/localized-sl2-homology` · theorem

Let F be finite of characteristic ℓ and cardinality q. H₃(SL₂(F),Z[1/ℓ]) is cyclic of order q²−1. For a subgroup C⊂SL₂(F) of order prime to ℓ the inclusion induces an injection on integral H₃ and H₃(C,Z) is cyclic of order |C|. GL₂(F) conjugation acts trivially on localized H₃. Integral H₃ is not asserted to have order q²−1.

**Hypotheses.** F is a finite field with cardinality q≥2 and prime characteristic ℓ. C≤SL₂(F) is a subgroup whose order is prime to ℓ, for the subgroup assertion.

**Construction and proof.**

1. Hutchinson §3 computes Sylow subgroups: away from ℓ they are cyclic, except the generalized quaternion 2-Sylow for odd q. Normalizers act by inversion on split and nonsplit cyclic Sylows.
2. Apply the stable-elements and periodic-homology facts quoted as Theorem 3.1 and Brown III.9–10 in the source. Their formal supplier is an explicit gap, not an assumed Mathlib theorem.
3. Combine primary factors to get q²−1. Injectivity for subgroups follows from periodic resolutions and stable elements; GL₂-conjugation becomes inner after passing to Fq², where restriction is injective.

**Acceptance.**

- q=5 localized order24, not120.
- The norm-one Cartan of order q+1 injects on H₃.

**Imports.** [`mathlib:groupHomology`](#baseline-mathlib-grouphomology), [`mathlib:Rep.trivial`](#baseline-mathlib-rep-trivial), [`mathlib:Matrix.SpecialLinearGroup`](#baseline-mathlib-matrix-speciallineargroup), [`mathlib:groupHomology.map`](#baseline-mathlib-grouphomology-map).

**Sources.** [Hutch](#source-5-hutch) — §3, Corollaries 3.6–3.7 and Lemma 3.8, pp14–15.

<a id="v-5-sl2-characteristic-exceptions"></a>

### V.5.11: Characteristic torsion in third homology

`K3BlochGroups:V.5/sl2-characteristic-exceptions` · theorem

For finite Fq of characteristic ℓ, the ℓ-primary summand of integral H₃(SL₂(Fq),Z) is Z/ℓ exactly for q∈{2,3,4,5,8,9,27}, and is zero otherwise. Thus integral H₃ is abstractly Z/(ℓ(q²−1)) in these exceptional cases, and Z/(q²−1) otherwise.

**Hypotheses.** F is a finite field with cardinality q≥2 and prime characteristic ℓ.

**Construction and proof.**

1. Use transfer from the unipotent Sylow subgroup with its torus action. Lemmas 3.11–3.13 reduce stable elements to invariant exterior and symmetric tensors.
2. The explicit invariant calculations in Lemma 3.14 give the seven nonzero cases; combine with the coprime cyclic factor of the preceding node. The elementary-abelian homology and stable-elements inputs remain in the same gap.

**Acceptance.**

- H₃(SL₂(F₅),Z) has order120; H₃(SL₂(F₃),Z) has order24.
- H₃(SL₂(F₁₁),Z) has order120.

**Imports.** [`K3BlochGroups:V.5/localized-sl2-homology`](#v-5-localized-sl2-homology).

**Sources.** [Hutch](#source-5-hutch) — §3, Lemma 3.14, pp17–18.

<a id="v-5-finite-stabilization-map"></a>

### V.5.12: Finite-field stabilization map

`K3BlochGroups:V.5/finite-stabilization-map` · construction

Construct σF:H₃(SL₂(F),Z[1/ℓ])→K₃(F) from SL₂→SL∞ and the inverse stable Hurewicz identification K₃(F)/(−1·K₂(F))≅H₃(SL∞(F),Z). Finite K₂=0 and K₃ has no ℓ-primary torsion, so the integral map extends uniquely over localization. This is the actual stabilization map, not an arbitrary cyclic isomorphism.

**Hypotheses.** F is a finite field with cardinality q≥2 and prime characteristic ℓ.

**Construction and proof.**

1. Use V.2/k3-to-h3-sl-field, which already specializes the V.1 stable Hurewicz sequence and identifies E(F)=SL∞(F). Compose its inverse with the homology map induced by SL₂→SL∞. The algebraically closed unstable comparison needed for bijectivity remains a recorded gap.
2. Kill the −1·K₂ term using the exact T.2 finite theorem.
3. Extend along coefficient localization uniquely because ℓ acts invertibly on K₃ by L.1.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `finiteStabilization` | constructor | The σF homomorphism with the specified stabilization composite. |
| `finiteStabilization_natural` | functoriality | For an embedding F→L of finite fields, σL∘H₃(SL₂(f))=K₃(f)∘σF, with the same localized coefficient ring. |
| `finiteStabilization_unique` | universal-property | A homomorphism on localized H₃ agreeing on all integral coefficient classes with stabilization equals σF. |
| `finiteStabilization_hurewicz` | compatibility | For the actual stable Hurewicz map h and the homology stabilization s, h(σF(loc z))=s(z) for every integral class z. This fixes σF as the stabilization composite, including its normalization. |

**Unit tests.**

- `finiteStabilization_char_torsion` (non-example): The integral stabilization sends every characteristic-primary class to zero.
- `finiteStabilization_F2_F4` (compatibility): The F₂→F₄ square commutes for the actual entrywise inclusion.
- `finiteStabilization_not_integral_iso_F5` (non-example): Integral stabilization at F₅ has a nontrivial kernel; the localized map is bijective.

**Uses.**

- Hutchinson Corollary 3.9: Supplies the natural comparison with stable K₃..
- CGZ Lemma 4.4: Preserves field maps and hence the local comparison squares..

**Acceptance.**

- No identification is chosen by comparing two group orders.

**Imports.** [`K3BlochGroups:V.5/finite-indecomposable-specialization`](#v-5-finite-indecomposable-specialization), [`K3BlochGroups:V.1/k2-to-k3-h3-e`](#v-1-k2-to-k3-h3-e), [`K2SymbolsBrauer:T.2/k2-finite-field`](../packets/K2SymbolsBrauer--T.1.json), [`mathlib:groupHomology.map`](#baseline-mathlib-grouphomology-map), [`K3BlochGroups:V.2/k3-to-h3-sl-field`](#v-2-k3-to-h3-sl-field), [`mathlib:Matrix.SpecialLinearGroup.map`](#baseline-mathlib-matrix-speciallineargroup-map).

**Sources.** [Hutch](#source-5-hutch) — §3, proof of Corollary 3.9, p15.

<a id="v-5-finite-stabilization-equivalence"></a>

### V.5.13: Finite-field stabilization comparison

`K3BlochGroups:V.5/finite-stabilization-equivalence` · comparison

The map σF is bijective for every finite field, including F₂ and F₃. Consequently H₃(SL₂(F),Z[1/ℓ])≅K₃(F)≅K₃ⁱⁿᵈ(F) naturally in finite fields.

**Hypotheses.** F is a finite field with cardinality q≥2 and prime characteristic ℓ.

**Construction and proof.**

1. Pass to the algebraic closure. Hutchinson invokes Sah’s algebraically closed unstable-to-stable comparison; its exact supplier is a recorded gap.
2. Quillen restriction is injective and the homology inclusion is injective on all prime-to-characteristic factors. The commutative square proves injectivity of σF.
3. The source and target have equal finite orders q²−1, hence σF is onto.

**Acceptance.**

- q=2 and q=3 are covered for K₃, without introducing a small-field Bloch exact sequence.

**Imports.** [`K3BlochGroups:V.5/finite-stabilization-map`](#v-5-finite-stabilization-map), [`K3BlochGroups:V.5/localized-sl2-homology`](#v-5-localized-sl2-homology), [`KTheoryFiniteLocalFields:L.1/finite-field-galois-descent`](../packets/KTheoryFiniteLocalFields.json).

**Sources.** [Hutch](#source-5-hutch) — §3, Corollary 3.9, p15.

<a id="v-5-finite-cross-ratio-map"></a>

### V.5.14: Finite Bloch–Wigner map

`K3BlochGroups:V.5/finite-cross-ratio-map` · construction

For finite F with q≥4 construct λF:H₃(SL₂(F),Z)→Bₛ(F), where Bₛ is precisely the V.3 Suslin kernel using the antisymmetric tensor quotient. Use Hutchinson’s refined configuration edge map followed by RB(F)→Bₛ(F). On a cyclic bar class represented by Σᵢ(1,t,tⁱ⁺¹,tⁱ⁺²), evaluate using the chain map βx,y of §6.3 and the refined cross-ratio map, then forget square classes. Degenerate tuples are handled by β, not by inserting inadmissible symbols.

**Hypotheses.** F is a finite field with cardinality q≥4 and prime characteristic ℓ. Bₛ(F) is the V.3 Suslin Bloch kernel in the antisymmetric tensor quotient, with no extra relation.

**Construction and proof.**

1. Use the actual group action on P¹ and the refined square-class configuration complex. The infinite acyclicity theorem in V.4 is not applied to a finite set.
2. Hutchinson Theorem 4.3’s finite spectral-sequence analysis and Lemma 7.1 give the edge map into the ordinary Bloch kernel. The refined complex and exactness input are recorded as a gap.
3. Apply the explicit chain map β and cross ratio of §6 to cyclic generators; homotopies prove independence of x,y.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `finiteBlochHom` | constructor | The homomorphism λF induced by the refined configuration edge map. |
| `finiteBlochHom_natural` | functoriality | Bₛ(f)∘λF=λL∘H₃(SL₂(f)) for embeddings between finite fields of cardinality at least4. |
| `finiteBlochHom_char_torsion` | simp | If ℓᵃz=0, λF(z)=0. |
| `finiteBlochHom_cyclic_bar` | characterisation | For a cyclic subgroup and the specified bar generator, λ equals the sum of cr(βx,y(1,t,tⁱ⁺¹,tⁱ⁺²)) in Bₛ; the result is independent of x,y. |

**Unit tests.**

- `finiteBlochHom_F5_kernel` (computation): The kernel for F₅ has order40, distinguishing integral H₃ from its order24 localization.
- `finiteBlochHom_F7_kernel` (computation): The kernel for F₇ has order12 and the target has order4.
- `finiteBlochHom_F4_kernel` (computation): The kernel for a field of cardinality4 has order6 and target order5.

**Uses.**

- Hutchinson §§6–7: Computes cyclic and quaternion images and fixes the finite Bloch order..
- HabiroNumberFields:HB.2, CGZ §4.2: Carries actual unstable homology classes to Bloch classes modulo odd n..

**Acceptance.**

- At q=5 the map has kernel order40 and target order3.

**Imports.** [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.4/configuration-complex`](#v-4-configuration-complex), [`K3BlochGroups:V.4/hyperhomology-map`](#v-4-hyperhomology-map), [`K3BlochGroups:V.4/cross-ratio`](#v-4-cross-ratio), [`mathlib:groupHomology.map`](#baseline-mathlib-grouphomology-map), [`mathlib:Matrix.SpecialLinearGroup.map`](#baseline-mathlib-matrix-speciallineargroup-map).

**Sources.** [Hutch](#source-5-hutch) — §4 Theorem 4.3; §6.3–6.4 pp30–33; §7 Lemma 7.1.

<a id="v-5-finite-bloch-orders"></a>

### V.5.15: Bloch groups of finite fields

`K3BlochGroups:V.5/finite-bloch-orders` · theorem

For q≥4, Bₛ(Fq) is cyclic of order (q+1)/2 when q is odd, and q+1 when q is even. At q=2,3 the unmodified Suslin presentation instead gives Bₛ(F₂)=0 and Bₛ(F₃)=Z; these are separate presentation calculations, not instances of the finite exact sequence. The CGZ convention agrees modulo odd n through V.3/κ, not integrally.

**Hypotheses.** F is a finite field with cardinality q≥4 for the cyclic order formula. The separate small-field assertions use the same Suslin presentation at F₂ and F₃.

**Construction and proof.**

1. In characteristic2 the square-class terms vanish and Theorem 4.3 gives order q+1.
2. For odd q the initial sequence allows q+1 or (q+1)/2. If q≡1 mod4, kill the generalized quaternion image with square angle-brackets; if q≡−1 mod4 kill the cyclic subgroup generated by w using 2{−1/y}=0.
3. For F₂ there are no admissible generators. For F₃ the pre-Bloch group has one generator [−1] and no admissible five-term pairs. Its antisymmetric tensor boundary is the nonzero generator of Z/2, so the Bloch kernel is 2Z≅Z, generated by2[−1]. This differs from the exterior-square kernel, which is all of Z. Parent small-field groups are used only as abstract groups, with this corrected embedding.

**Acceptance.**

- Bₛ(F₄)=Z/5, Bₛ(F₅)=Z/3, Bₛ(F₇)=Z/4, Bₛ(F₁₁)=Z/6.

**Imports.** [`K3BlochGroups:V.5/finite-cross-ratio-map`](#v-5-finite-cross-ratio-map), [`K3BlochGroups:V.5/localized-sl2-homology`](#v-5-localized-sl2-homology), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group).

**Sources.** [Hutch](#source-5-hutch) — §7 Lemma 7.4 and preceding paragraph, pp34–35.

<a id="v-5-finite-k3-bloch-map"></a>

### V.5.16: Finite K₃-to-Bloch map

`K3BlochGroups:V.5/finite-k3-bloch-map` · construction

For q≥4, factor λF through coefficient localization (its target has order prime to ℓ), obtaining λF,loc. Define bF=λF,loc∘σF⁻¹:K₃(F)→Bₛ(F). It is a natural surjection and satisfies bF∘σF∘localization=λF. The inverse of σ is canonical, so no cyclic generator enters the definition.

**Hypotheses.** F is a finite field with cardinality q≥4 and prime characteristic ℓ. σF is the actual stabilization comparison and λF the finite refined edge map followed by RB→Bₛ.

**Construction and proof.**

1. The target order from the preceding node is coprime to ℓ; localization therefore gives a unique extension.
2. Compose with the inverse of the actual bijective σF and inherit field-map naturality.
3. Surjectivity is supplied by the finite refined edge-map theorem, not inferred from existence of some group isomorphism.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `finiteK3Bloch` | constructor | bF is λF,loc∘σF⁻¹. |
| `finiteK3Bloch_triangle` | compatibility | bF(σF(localization(z)))=λF(z). |
| `finiteK3Bloch_natural` | functoriality | Bₛ(f)∘bF=bL∘K₃(f) for finite-field embeddings. |
| `finiteK3Bloch_surjective` | characterisation | Every finite Bloch class is the image of an actual K₃ class. |

**Unit tests.**

- `finiteK3Bloch_F5_kernel` (computation): Its kernel at F₅ has order8.
- `finiteK3Bloch_F7_kernel` (computation): Its kernel at F₇ has order12.
- `finiteK3Bloch_F4_kernel` (computation): Its kernel at cardinality4 has order3.

**Uses.**

- K3BlochGroups:V.5 odd-coefficient comparison: Constructs the map whose tensor is proved bijective..
- CGZ Lemma 4.4: Gives the finite vertical comparison with field-map compatibility..

**Acceptance.**

- The triangle commutes before reducing modulo n.

**Imports.** [`K3BlochGroups:V.5/finite-cross-ratio-map`](#v-5-finite-cross-ratio-map), [`K3BlochGroups:V.5/finite-bloch-orders`](#v-5-finite-bloch-orders), [`K3BlochGroups:V.5/finite-stabilization-equivalence`](#v-5-finite-stabilization-equivalence).

**Sources.** [Hutch](#source-5-hutch) — §7 Corollary 7.5 and proof, pp35–36.

<a id="v-5-finite-enhanced-torsion-sequence"></a>

### V.5.17: Finite Bloch–Wigner exact sequence

`K3BlochGroups:V.5/finite-enhanced-torsion-sequence` · theorem

For q≥4, 0→T̃(Fq)→K₃(Fq)−bF→Bₛ(Fq)→0 is natural and exact; T̃ is exactly the enhanced Tor term of V.4. It is cyclic of order2(q−1) for odd q and q−1 for even q. The left arrow is the homological torsion map of Hutchinson Corollary 7.5. The statement does not identify this arrow with an untwisted roots-of-unity inclusion.

**Hypotheses.** F is a finite field with cardinality q≥4 and prime characteristic ℓ. T̃(F) and its monomial arrow are the V.4 enhanced Tor construction; the finite identification of this arrow is the recorded refined-chain gap.

**Construction and proof.**

1. Apply the finite refined Bloch–Wigner sequence and the explicit 2-primary calculation of Lemma 7.4.
2. Transport through σF and RB≅B. Identify the kernel with enhanced Tor via the diagonal homology map used in the source. The compatibility of the parent monomial model with this map is recorded in the refined-comparison gap.
3. Use μ(Fq) of order q−1 and the V.4 enhanced Tor computation to obtain the two kernel orders.

**Acceptance.**

- For q=5 orders8→24→3 multiply correctly; for q=4 orders3→15→5.

**Imports.** [`K3BlochGroups:V.5/finite-k3-bloch-map`](#v-5-finite-k3-bloch-map), [`K3BlochGroups:V.4/enhanced-tor`](#v-4-enhanced-tor), [`K3BlochGroups:V.4/tor-form-comparison`](#v-4-tor-form-comparison), [`K3BlochGroups:V.5/finite-bloch-orders`](#v-5-finite-bloch-orders).

**Sources.** [Hutch](#source-5-hutch) — §7 Corollary 7.5, p35.

<a id="v-5-finite-field-bloch-comparison"></a>

### V.5.18: The finite-field Bloch–Wigner comparison map

`K3BlochGroups:V.5/finite-field-bloch-comparison` · theorem

For F_q of characteristic ℓ and q≥4, the natural stabilization/Hurewicz map H₃(SL₂(F_q),ℤ[1/ℓ])→K₃(F_q)=K₃^ind(F_q) is an isomorphism. Through this map the finite-field refined Bloch–Wigner map gives 0→T̃(F_q)→K₃(F_q)→B(F_q)→0, naturally in the finite field. Here T̃ is the enhanced Tor term of V.4/enhanced-tor; its abstract identification with μ̃ is sufficient for orders but is not asserted to be natural. This is Hutchinson’s finite-field theorem, not V.4’s infinite-field Suslin theorem.

**Hypotheses.** q≥4; invert the characteristic ℓ in the unstable homology group. B is the Suslin convention of V.3; the natural enhanced Tor term is V.4/enhanced-tor. Its abstract enhanced-roots-of-unity description is V.4/enhanced-mu.

**Construction and proof.**

1. Use Hutchinson Corollaries 3.6–3.9: prime-to-characteristic H₃ is cyclic of order q²−1; the map is the actual stabilization/Hurewicz composite, injective by comparison with the algebraic closure and Quillen restriction.
2. Use Hutchinson’s refined Bloch–Wigner complex (Theorem 4.3), the trivial F_q× action of Lemma 3.8 and Lemma 7.1 to identify the refined Bloch group with B(F_q).
3. Apply the explicit two-primary calculation in Lemma 7.4 (quaternion subgroup if q≡1 mod4, order-four subgroup if q≡−1 mod4) and Corollary 7.5. This gives the exact map and its kernel; equal cardinalities alone do not identify a map.

**Unit tests.**

- `finite_field_bloch_comparison_1` (characterisation): At q=5, integral H₃(SL₂(F₅),ℤ) has characteristic-primary information that is excluded by ℤ[1/5]; do not identify the integral group with ℤ/24.
- `finite_field_bloch_comparison_2` (characterisation): q=2 and q=3 remain outside this Bloch convention’s finite-field order formula.

**Acceptance.**

- At q=5, integral H₃(SL₂(F₅),ℤ) has characteristic-primary information that is excluded by ℤ[1/5]; do not identify the integral group with ℤ/24.
- q=2 and q=3 remain outside this Bloch convention’s finite-field order formula.

**Imports.** [`K3BlochGroups:V.5/k3-finite-field`](#v-5-k3-finite-field), [`K3BlochGroups:V.5/milnor-k3-finite-field`](#v-5-milnor-k3-finite-field), [`K3BlochGroups:V.4/enhanced-mu`](#v-4-enhanced-mu), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.4/enhanced-tor`](#v-4-enhanced-tor), [`K3BlochGroups:V.5/finite-stabilization-equivalence`](#v-5-finite-stabilization-equivalence), [`K3BlochGroups:V.5/finite-enhanced-torsion-sequence`](#v-5-finite-enhanced-torsion-sequence).

**Sources.** [Hutchinson.1107.0264v2](#source-0-hutchinson-1107-0264v2) — Corollaries 3.6–3.9, PDF pp.14–15; §7, pp.34–36.

<a id="v-5-bloch-group-finite-field"></a>

### V.5.19: The Bloch group of a finite field

`K3BlochGroups:V.5/bloch-group-finite-field` · theorem

Let F_q be a finite field with q ≥ 4 elements and B(F_q) the Bloch group in Suslin's convention of V.3. Then B(F_q) is cyclic, of order (q + 1)/2 if q is odd and of order q + 1 if q is even. For q = 2 and q = 3 the Bloch groups are B(F_2) = 0 and B(F_3) ≅ Z, and the formula does not apply.

**Hypotheses.** F_q is a finite field with q ≥ 4 elements. B(F_q) is Suslin's Bloch group of V.3/bloch-group.

**Construction and proof.**

1. Apply V.5/finite-field-bloch-comparison (Hutchinson Corollary 7.5), with K₃^ind(F_q)=K₃(F_q). V.4’s Suslin proof is for infinite fields.
2. Substitute K_3^ind(F_q) = K_3(F_q), cyclic of order q² − 1 (V.5/milnor-k3-finite-field, V.5/k3-finite-field).
3. The roots of unity of F_q are all of F_q^×, cyclic of order q − 1 (mathlib Nat.card_units and isCyclic_of_injective_ringHom); so µ̃(F_q) has order 2(q − 1) when q is odd and q − 1 when q is even (V.4/enhanced-mu).
4. B(F_q) is a quotient of a cyclic group, hence cyclic, of order (q² − 1)/|µ̃(F_q)|, which gives the two displayed orders.
5. The values for q = 2, 3 are the K-book's (Remark VI.5.1.1) and are not used here.

**Acceptance.**

- q = 4, 5, 7, 8, 9 give cyclic groups of orders 5, 3, 4, 9, 5; these agree with a direct Smith-normal-form computation of the presentation of V.3 (generators [x], x ≠ 0, relations [1] and the five-term elements, kernel of the boundary to the antisymmetric quotient).
- For even q the enhancement is trivial because µ(F_q) has odd order; using 2(q − 1) there would give the non-integer (q + 1)/2.
- For q = 2 and q = 3 Suslin's sequence would force B(F_2) ≅ Z/3 and B(F_3) ≅ Z/2, while B(F_2) = 0 and B(F_3) ≅ Z: the hypothesis q ≥ 4 cannot be dropped.
- In the Calegari-Garoufalidis-Zagier convention (Definition 1.1) the same computation gives groups of the same orders for 4 ≤ q ≤ 27, but B(F_2) ≅ Z/3 and B(F_3) ≅ Z/2; the small-field pathology belongs to Suslin's convention.

**Imports.** [`K3BlochGroups:V.5/k3-finite-field`](#v-5-k3-finite-field), [`K3BlochGroups:V.5/milnor-k3-finite-field`](#v-5-milnor-k3-finite-field), [`K3BlochGroups:V.4/enhanced-mu`](#v-4-enhanced-mu), [`mathlib:Nat.card_units`](#baseline-mathlib-nat-card-units), [`mathlib:isCyclic_of_injective_ringHom`](#baseline-mathlib-iscyclic-of-injective-ringhom), [`K3BlochGroups:V.5/finite-field-bloch-comparison`](#v-5-finite-field-bloch-comparison).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Remark VI.5.1.1 (PDF p. 495); [Kbook.2013](#source-0-kbook-2013) — Remark VI.5.1.1 (PDF p. 495); [CGZ.2018](#source-0-cgz-2018) — §4.2, p. 23; [Hutchinson.1107.0264v2](#source-0-hutchinson-1107-0264v2) — Corollary 7.5, PDF pp.35–36.

<a id="v-5-bloch-finite-field-mod-n"></a>

### V.5.20: The Bloch group of a finite field modulo n

`K3BlochGroups:V.5/bloch-finite-field-mod-n` · lemma

Let F_q be a finite field with q ≥ 4 elements and n an odd positive integer prime to q − 1. Then the Suslin map induces an isomorphism K_3(F_q)/n → B(F_q)/n, and both groups are cyclic of order gcd(n, q + 1). In particular, if q ≡ −1 mod n then K_3(F_q) ⊗ Z/n ≅ B(F_q) ⊗ Z/n ≅ Z/n, and the same holds for CGZ's Bloch group of F_q through the comparison κ of V.3.

**Hypotheses.** F_q is a finite field with q ≥ 4 elements. n is odd and gcd(n, q − 1) = 1.

**Construction and proof.**

1. Apply V.5/finite-field-bloch-comparison (Hutchinson Corollary 7.5), with K₃^ind(F_q)=K₃(F_q). V.4’s Suslin proof is for infinite fields.
2. µ(F_q) = F_q^× is cyclic of order q − 1 (mathlib Nat.card_units, isCyclic_of_injective_ringHom), so µ̃(F_q) has order 2(q − 1) or q − 1 (V.4/enhanced-mu); for n odd and prime to q − 1, µ̃(F_q) ⊗ Z/n = 0.
3. Right exactness of − ⊗ Z/n gives K_3(F_q)/n ≅ B(F_q)/n, and K_3(F_q)/n ≅ Z/gcd(n, q² − 1) = Z/gcd(n, q + 1).
4. If q ≡ −1 mod n then gcd(n, q − 1) = gcd(n, 2) = 1 and gcd(n, q + 1) = n.
5. For CGZ's convention use that κ ⊗ Z/n is an isomorphism for odd n (V.3/cgz-convention-comparison).

**Acceptance.**

- q = 5, n = 3: K_3(F_5)/3 ≅ B(F_5)/3 ≅ Z/3, with B(F_5) ≅ Z/3.
- q = 11, n = 3: both are Z/3, while B(F_11) ≅ Z/6.
- q = 7, n = 3: 3 divides q − 1, the hypothesis fails, and indeed K_3(F_7)/3 ≅ Z/3 while B(F_7) ≅ Z/4 has B(F_7)/3 = 0.

**Imports.** [`K3BlochGroups:V.5/milnor-k3-finite-field`](#v-5-milnor-k3-finite-field), [`K3BlochGroups:V.5/k3-finite-field`](#v-5-k3-finite-field), [`K3BlochGroups:V.4/enhanced-mu`](#v-4-enhanced-mu), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`mathlib:Nat.card_units`](#baseline-mathlib-nat-card-units), [`mathlib:isCyclic_of_injective_ringHom`](#baseline-mathlib-iscyclic-of-injective-ringhom), [`mathlib:ZMod`](#baseline-mathlib-zmod), [`K3BlochGroups:V.5/finite-field-bloch-comparison`](#v-5-finite-field-bloch-comparison).

**Sources.** [CGZ.2018](#source-0-cgz-2018) — Lemma 4.4, proof, p. 25; [Hutchinson.1107.0264v2](#source-0-hutchinson-1107-0264v2) — Corollary 7.5, PDF pp.35–36.

<a id="v-5-odd-coefficient-finite-comparison"></a>

### V.5.21: Odd-coefficient finite Bloch comparison

`K3BlochGroups:V.5/odd-coefficient-finite-comparison` · theorem

Let q≥4 and n>0 be odd with gcd(n,q−1)=1. The actual map bF induces a bijection K₃(Fq)⊗Z/n→Bₛ(Fq)⊗Z/n. Both are cyclic of order gcd(n,q+1), and κ gives the same comparison with BCGZ. If n|q+1 they have order n. Without the gcd hypothesis this is false (q=7,n=3). These are tensor quotients of integral H₃/K₃, not group homology with Z/n coefficients.

**Hypotheses.** F is a finite field with cardinality q≥4 and prime characteristic ℓ. n is a positive odd integer with gcd(n,q−1)=1; modulo n means tensoring the integral groups with Z/n.

**Construction and proof.**

1. Multiplication by n is bijective on the enhanced Tor kernel of order2(q−1) or q−1. The snake lemma for multiplication by n therefore makes the quotient map bijective modulo n, including its injectivity.
2. Compute cyclic quotients from L.1 and finite Bloch orders; κ has 2-primary kernel and cokernel, hence is bijective on odd quotients.
3. Use the finite triangle to give H₃(SL₂,Z)⊗Z/n the same map when n|q+1. Since gcd(n,ℓ)=1, characteristic-primary integral torsion disappears.

**Acceptance.**

- q=5,n=3 gives Z/3; q=17,n=9 gives Z/9; q=8,n=9 gives Z/9.
- q=7,n=3 gives K₃/3=Z/3 but Bₛ/3=0.

**Imports.** [`K3BlochGroups:V.5/finite-enhanced-torsion-sequence`](#v-5-finite-enhanced-torsion-sequence), [`K3BlochGroups:V.5/finite-indecomposable-specialization`](#v-5-finite-indecomposable-specialization), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`mathlib:TensorProduct.map`](#baseline-mathlib-tensorproduct-map), [`mathlib:ZMod`](#baseline-mathlib-zmod).

**Sources.** [CGZ](#source-5-cgz) — §4.2 and Lemma 4.4, pp406–407; [Hutch](#source-5-hutch) — §7 Corollary 7.5, p35.

<a id="v-5-norm-one-cartan-embedding"></a>

### V.5.22: Norm-one nonsplit Cartan embedding

`K3BlochGroups:V.5/norm-one-cartan-embedding` · construction

For a quadratic extension E/F of finite fields and a basis e:Fin2→E, let C¹=ker(N:Eˣ→Fˣ). Construct ιe:C¹→SL₂(F) by the matrix in e of multiplication by u. Its determinant is N(u)=1 and it is injective. A basis change conjugates the matrices by the actual change-of-basis element of GL₂(F). The field norm and matrix carriers are Mathlib’s; no second norm or special-linear group is defined.

**Hypotheses.** E/F is a quadratic extension of finite fields. e is an F-linear basis of E indexed by Fin 2; C¹ is the kernel of the norm homomorphism on units.

**Construction and proof.**

1. Restrict the multiplication representation of Eˣ to the norm-one subgroup.
2. The determinant-norm identity places each multiplication matrix in Mathlib SL₂. Evaluate multiplication at1 to prove injectivity.
3. Express the two representations through their basis equivalences; this yields the actual conjugation equation.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `cartanEmbedding` | constructor | The multiplication-matrix homomorphism C¹→SL₂(F). |
| `cartanEmbedding_toMatrix` | data | Its underlying matrix is LinearMap.toMatrix e e of multiplication by u. |
| `cartanEmbedding_injective` | characterisation | Equality of matrices implies equality of units. |
| `cartanEmbedding_changeBasis` | compatibility | If U=e′⁻¹∘e in coordinates then ιe′(u)=Uιe(u)U⁻¹. |

**Unit tests.**

- `cartanEmbedding_one` (degenerate): The norm-one unit1 maps to the identity matrix.
- `cartanEmbedding_negOne` (computation): The norm-one unit−1 maps to the scalar matrix−I, including characteristic2.
- `cartanEmbedding_trace` (compatibility): For u∈C¹ the matrix trace is u+u⁻¹, viewed in E by algebraMap.

**Uses.**

- Hutchinson Lemma 3.5: Computes the nonsplit Sylow normalizer..
- CGZ §4.2; HabiroNumberFields:HB.2: Defines the actual homology map carrying Cartan classes into finite Bloch groups..

**Acceptance.**

- C¹ has order q+1 from surjectivity of the finite-field norm.

**Imports.** [`mathlib:Algebra.norm`](#baseline-mathlib-algebra-norm), [`mathlib:LinearMap.toMatrix`](#baseline-mathlib-linearmap-tomatrix), [`mathlib:Matrix.SpecialLinearGroup`](#baseline-mathlib-matrix-speciallineargroup).

**Sources.** [Hutch](#source-5-hutch) — §3 before Lemma 3.5, p13; [CGZ](#source-5-cgz) — §4.2 p406.

<a id="v-5-cartan-homology-modulo-n"></a>

### V.5.23: Nonsplit Cartan comparison modulo n

`K3BlochGroups:V.5/cartan-homology-modulo-n` · theorem

Let Fq be finite with q≥4 odd, n>0 odd and n|q+1. The maps H₃(C¹,Z)⊗Z/n→H₃(SL₂(Fq),Z)⊗Z/n→K₃(Fq)⊗Z/n→Bₛ(Fq)⊗Z/n→BCGZ(Fq)⊗Z/n induced by ιe, stabilization, bF and κ are bijective. Their composite is independent of e because GL₂ conjugation acts trivially after inverting the characteristic. The result concerns H₃(C¹), not a claimed canonical identification H₃(C¹)=C¹.

**Hypotheses.** F has odd cardinality q≥4; E/F is its quadratic extension, with an F-basis e indexed by Fin 2. n is positive and odd, and n divides q+1; all quotients mean tensoring integral homology with Z/n.

**Construction and proof.**

1. C¹ is cyclic of order q+1 and its inclusion is injective on integral H₃ by Corollary 3.7. Its index in prime-to-characteristic H₃ is q−1. Since n is odd and n|q+1, this index is invertible modulo n.
2. Use coefficient localization and the already specified stabilization/Bloch maps.
3. Lemma 3.8 and the basis-change equation make the induced map independent of the basis. The generic cyclic-homology functor and stable-elements inputs are in the recorded gap.

**Acceptance.**

- q=11,n=3 has group order3 throughout.
- A subgroup μn⊂C¹ need not generate H₃(C¹)/n if n²|q+1: the cyclic inclusion multiplier is (q+1)/n. A primitive root must not be silently equated with a quotient generator.

**Imports.** [`K3BlochGroups:V.5/norm-one-cartan-embedding`](#v-5-norm-one-cartan-embedding), [`K3BlochGroups:V.5/localized-sl2-homology`](#v-5-localized-sl2-homology), [`K3BlochGroups:V.5/odd-coefficient-finite-comparison`](#v-5-odd-coefficient-finite-comparison), [`mathlib:groupHomology.map`](#baseline-mathlib-grouphomology-map), [`K3BlochGroups:V.5/finite-stabilization-equivalence`](#v-5-finite-stabilization-equivalence), [`K3BlochGroups:V.5/finite-k3-bloch-map`](#v-5-finite-k3-bloch-map), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`mathlib:TensorProduct.map`](#baseline-mathlib-tensorproduct-map).

**Sources.** [CGZ](#source-5-cgz) — §4.2 pp406–407.

<a id="v-5-nonsplit-cartan-mod-n"></a>

### V.5.24: The nonsplit Cartan and the finite Bloch generator

`K3BlochGroups:V.5/nonsplit-cartan-mod-n` · theorem

Let p,q be distinct odd primes, n=p^m with m≥1 and q≡−1 mod n. The norm-one Cartan C¹=ker(F_{q²}×→F_q×) embeds in SL₂(F_q) by its action on the two-dimensional F_q-vector space F_{q²}. The induced H₃(C¹,ℤ)⊗ℤ/n→H₃(SL₂(F_q),ℤ)⊗ℤ/n→K₃(F_q)/n→B(F_q)/n is an isomorphism. Compare the cyclic bar generator and its cross-ratio image, not just their orders.

**Hypotheses.** These are the odd-prime q,p hypotheses used in CGZ §4.2. Choose a cyclic generator compatibly with the matrix embedding and the cross-ratio convention; no canonical generator is asserted.

**Construction and proof.**

1. The Cartan has order q+1. Hutchinson Corollary 3.7 gives injection on its prime-to-q H₃; after tensoring with ℤ/n it is onto since q−1 is prime to n.
2. Use finite-field-bloch-comparison and bloch-finite-field-mod-n for the remaining maps.
3. Use the cyclic bar-cycle formula of Hutchinson §6.4 (PDF p.33) to identify the image in the Bloch convention. CGZ §4.2 applies precisely these maps; conversion to B_CGZ is the V.3 κ comparison.

**Unit tests.**

- `nonsplit_cartan_mod_n_1` (characterisation): q=5,n=3 and q=11,n=3 satisfy the hypotheses; q=7,n=3 does not.
- `nonsplit_cartan_mod_n_2` (characterisation): A different cyclic generator must transform the bar-cycle image accordingly.

**Acceptance.**

- q=5,n=3 and q=11,n=3 satisfy the hypotheses; q=7,n=3 does not.
- A different cyclic generator must transform the bar-cycle image accordingly.

**Imports.** [`K3BlochGroups:V.5/finite-field-bloch-comparison`](#v-5-finite-field-bloch-comparison), [`K3BlochGroups:V.5/bloch-finite-field-mod-n`](#v-5-bloch-finite-field-mod-n), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`K3BlochGroups:V.5/norm-one-cartan-embedding`](#v-5-norm-one-cartan-embedding), [`K3BlochGroups:V.5/cartan-homology-modulo-n`](#v-5-cartan-homology-modulo-n).

**Sources.** [Hutchinson.1107.0264v2](#source-0-hutchinson-1107-0264v2) — Corollary 3.7, p.15; §6.4, p.33.

<a id="v-5-number-field-product-image"></a>

### V.5.25: Number-field decomposable product image

`K3BlochGroups:V.5/number-field-product-image` · application

For a number field F, the image of K₃ᴹ(F)→K₃(F) equals the image of multiplication by [−1]:K₂(F)→K₃(F). Via V.2 injectivity it is (Z/2)^r₁. In particular it vanishes for totally imaginary F. All degree-three Milnor signs are imported from T.2:symbols, not computed in V.5.

**Hypotheses.** F is a number field; multiplication is the Quillen product with the K₁ class of−1, and the Milnor comparison preserves products.

**Construction and proof.**

1. Matsumoto and multiplicativity put every product [−1]·K₂(F) in the degree-three Milnor image.
2. For an arbitrary Milnor3 class choose d∈Fˣ with negative signs precisely at the real places where that class has nonzero signature, using the upstream total-sign surjectivity. The symbol{−1,−1,d} has the same degree3 signs.
3. The imported Bass–Tate sign map is injective at degree3, so these classes are equal. This symbol is [−1] times the degree2 symbol{−1,d}.
4. Use the V.2 injection to identify the common image with the sign group.

**Acceptance.**

- OverQ the image is the nonzero order2 subgroup ofZ/48.
- OverQ(i) the image is zero.

**Imports.** [`K2SymbolsBrauer:T.2:symbols/milnor-number-field`](../packets/K2SymbolsBrauer--T.1.json), [`K2SymbolsBrauer:T.2/matsumoto`](../packets/K2SymbolsBrauer--T.1.json), [`K3BlochGroups:V.2/milnor-to-quillen-degree-three`](#v-2-milnor-to-quillen-degree-three), [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective), [`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`](../../../content/tau-ceti/GlobalNumberFields/README.md#layer-1-weak-approximation-and-multiplicative-congruences).

**Sources.** [KIII](#source-5-kiii) — III.7.2(c)–(d), pp61–62.

<a id="v-5-rational-decomposable-subgroup"></a>

### V.5.26: Decomposable rational classes

`K3BlochGroups:V.5/rational-decomposable-subgroup` · theorem

Import K₃(Z)→K₃(Q) as an isomorphism and K₃(Q)≅Z/48 from ArithmeticKTheory N.5/N.7 (with N.8 responsible for its certified example). Bass–Tate gives K₃ᴹ(Q)=Z/2 and the V.2 degree-three map is injective. Its image is the unique order2 subgroup generated by {−1,−1,−1}; under any cyclic coordinate it is {0,24}. Thus K₃ⁱⁿᵈ(Q)=Z/24. This quotient extension does not split.

**Hypotheses.** F=Q; the Milnor comparison and indecomposable quotient are those of V.2. The ambient K₃(Z)→K₃(Q) and cyclic structure of order48 are imported from ArithmeticKTheory N.5/N.7, not recomputed here.

**Construction and proof.**

1. Set r₁=1,r₂=0,w₂=24 in N.5’s degree3 row and use its ring-of-integers comparison.
2. Use the T.2 Bass–Tate sign isomorphism and V.2 injectivity; the real triple−1 symbol is nonzero.
3. The unique order2 subgroup of Z/48 is generated by24; its quotient is Z/24. A section would split Z/48 as Z/2⊕Z/24, whose exponent is24, contradiction.
4. N.8’s current certified-example node still points back to V.5; the ownership correction is requested and recorded as a gap rather than imported circularly.

**Acceptance.**

- The decomposition is a short exact sequence, not a direct-product splitting.

**Imports.** [`ArithmeticKTheory:N.5/the-real-case-modulo-eight`](../packets/ArithmeticKTheory--N.1.json), [`ArithmeticKTheory:N.5/soule-theorem`](../packets/ArithmeticKTheory--N.1.json), [`ArithmeticKTheory:N.7/w-invariant`](../packets/ArithmeticKTheory--N.7.json), [`K2SymbolsBrauer:T.2:symbols/milnor-number-field`](../packets/K2SymbolsBrauer--T.1.json), [`K3BlochGroups:V.2/milnor-k3-injective`](#v-2-milnor-k3-injective), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`K3BlochGroups:V.5/number-field-product-image`](#v-5-number-field-product-image).

**Sources.** [KVI](#source-5-kvi) — VI.2.1.2 p7; VI.5.3 p24; [KIII](#source-5-kiii) — III.7.2(d) p62.

<a id="v-5-gaussian-decomposable-vanishing"></a>

### V.5.27: Gaussian indecomposable classes

`K3BlochGroups:V.5/gaussian-decomposable-vanishing` · application

For F=Q(i), import K₃(F)≅Z⊕Z/24 from ArithmeticKTheory N.5 and its N.8 example. Bass–Tate gives K₃ᴹ(F)=0 since r₁=0; hence the quotient K₃(F)→K₃ⁱⁿᵈ(F) is an isomorphism. The rank1 free generator exists but is not canonical; choosing a basis is distinct from constructing a Bloch-symbol generator with certified index.

**Hypotheses.** F=Q(i), with no real embeddings and one pair of complex embeddings. The ambient K₃(F) structure is imported from ArithmeticKTheory N.5; the N.8 Gaussian w₂=24 certificate and removal of its reverse dependency remain requested.

**Construction and proof.**

1. Use N.5 with r₁=0,r₂=1 and the value w₂=24 supplied by the N.8 certificate request; the certified w₂ example is a precise gap until its reverse V.5 dependency is removed.
2. Bass–Tate signs vanish, so the indecomposable quotient is canonically an isomorphism.
3. A group decomposition supplies existence of a free generator modulo torsion but no preferred class or regulator normalization.

**Acceptance.**

- Imaginary degree-three Milnor symbols have zero image.
- Both K₃ and K₃ⁱⁿᵈ have torsion order24 and rank1.

**Imports.** [`ArithmeticKTheory:N.5/totally-imaginary-integral-structure`](../packets/ArithmeticKTheory--N.1.json), [`K2SymbolsBrauer:T.2:symbols/milnor-number-field`](../packets/K2SymbolsBrauer--T.1.json), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`K3BlochGroups:V.5/number-field-product-image`](#v-5-number-field-product-image).

**Sources.** [KVI](#source-5-kvi) — VI.2.1.2 p7; VI.5.3 p24.

<a id="v-5-real-rogers-detector"></a>

### V.5.28: Rogers homomorphism on the real pre-Bloch group

`K3BlochGroups:V.5/real-rogers-detector` · construction

Using the interval Rogers function L from Polylogarithms P.1, construct ρ:Pₛ(R)→R/(π²Z). For an admissible real generator x, set ρ([x]) equal modulo π² to L(x)−π²/6 if 0<x<1, π²/6−L(1/x) if x>1, and L(1/(1−x))−π²/3 if x<0. This is the Suslin normalization. Restricting along Bₛ(R)⊂Pₛ(R) gives the Bloch detector. No analytic function is newly defined in V.5.

**Hypotheses.** Pₛ(R) is the V.3 Suslin pre-Bloch group on real symbols x≠0,1. L is the unshifted interval Rogers function with the normalization, reflection and ordered five-term identity specified in the P.1 request.

**Construction and proof.**

1. Suslin’s positive presentation P′(R) has generators0<x<1 and five-term relations restricted to0<y<x<1. The map P′→P is onto with kernel generated by6c′ (Lemma1.6), proved by the three-case inverse ψ on p219. This auxiliary presentation proof is recorded in a gap, rather than smuggling a missing Prop into an interface.
2. The shifted function L(x)−L(1) annihilates the restricted five-term relation since the unshifted relation equals L(1). It sends c′ to−π²/6 and6c′ to−π².
3. Descend moduloπ² and evaluate ψ to obtain the three formulas. Restrict to the V.3 Bloch kernel.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `realRogersHom` | constructor | The homomorphism ρ on the exact Suslin real pre-Bloch presentation. |
| `realRogersHom_pos` | simp | For0<x<1, ρ([x])=[L(x)−π²/6]. |
| `realRogersHom_gt_one` | simp | Forx>1, ρ([x])=[π²/6−L(1/x)]. |
| `realRogersHom_neg` | simp | Forx<0, ρ([x])=[L(1/(1−x))−π²/3]. |
| `realRogersHom_unique` | extensionality | A homomorphism agreeing on every admissible symbol with those three formulas equalsρ. |

**Unit tests.**

- `realRogersHom_half` (computation): ρ([1/2])=[−π²/12].
- `realRogersHom_two` (computation): ρ([2])=[π²/12].
- `realRogersHom_neg_one` (computation): ρ([−1])=[−π²/4].

**Uses.**

- Suslin Proposition1.1: Detects the order6 of the universal real class..
- K3BlochGroups:V.5, rational Bloch torsion: The Q→R map carries cQ to cR, giving the rational lower bound..

**Acceptance.**

- The period isπ², notπ²/2; c is sent to−π²/6.

**Imports.** [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`Polylogarithms:P.1`](../packets/Polylogarithms.json), [`mathlib:AddCircle`](#baseline-mathlib-addcircle), [`K3BlochGroups:V.3/three-c-angle-minus-one`](#v-3-three-c-angle-minus-one).

**Sources.** [Suslin](#source-5-suslin) — §1 Lemma 1.6 and proof, pp219–220; [Zagier](#source-5-zagier) — II.1.A pp23–24.

<a id="v-5-universal-class-order-six"></a>

### V.5.29: Universal real and rational Bloch torsion

`K3BlochGroups:V.5/universal-class-order-six` · theorem

The universal class c has exact order6 in Bₛ(R) and Bₛ(Q). The real detector sends c=[2]+[−1] to−π²/6 moduloπ², an element of order6. Naturality under Q→R proves the rational lower bound; the V.3 relation6c=0 gives the upper bound in both fields. Through the infinite Suslin sequence, K₃ⁱⁿᵈ(Q)=Z/24 and T̃(Q) has order4, so Bₛ(Q)=Z/6 and c is a generator.

**Hypotheses.** The fields are R and Q, with the V.3 Suslin Bloch group and universal class c=[x]+[1−x].

**Construction and proof.**

1. Evaluate the detector at2 and−1 and add. The additive-circle class−π²/6 has exact order6 becauseπ≠0.
2. Use V.3/three-c-angle-minus-one to obtain6c=0 and use naturality Q→R for the rational lower bound.
3. Apply V.4 for the infinite fieldQ: enhanced Tor order4 and indecomposable order24 give Bloch order6.

**Acceptance.**

- 3cQ≠0; the cQ generator maps to the order6 class in Bₛ(R).

**Imports.** [`K3BlochGroups:V.5/real-rogers-detector`](#v-5-real-rogers-detector), [`K3BlochGroups:V.5/rational-decomposable-subgroup`](#v-5-rational-decomposable-subgroup), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism), [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence), [`K3BlochGroups:V.4/enhanced-tor`](#v-4-enhanced-tor), [`K3BlochGroups:V.3/three-c-angle-minus-one`](#v-3-three-c-angle-minus-one).

**Sources.** [Suslin](#source-5-suslin) — §1 Proposition1.1, p220; [KVI](#source-5-kvi) — VI.5.2.1 p24.

<a id="v-5-element-c-order-six"></a>

### V.5.30: The element c has order six over the rationals and the reals

`K3BlochGroups:V.5/element-c-order-six` · theorem

In B(Q) and in B(R) the element c = [2] + [−1] has order exactly six. Consequently c generates B(Q) ≅ Z/6.

**Hypotheses.** The fields are Q and R; B is Suslin's Bloch group of V.3.

**Construction and proof.**

1. Upper bound: 6c = 0 in every field with at least four elements (V.3/angle-bracket-homomorphism).
2. For the lower bound in B(R), use the Rogers homomorphism of V.5/real-rogers-detector with period π²Z. Its three generator formulas send c=[2]+[−1] to −π²/6, of exact order six. The positive-presentation descent is Suslin Lemma 1.6, pp219–220; its refinement and the analytic interval identities are the named P.1/descent requirements. Bloch–Wigner vanishes on real points and cannot give this lower bound.
3. The map B(Q) → B(R) induced by the inclusion (V.4/suslin-functoriality) is a homomorphism, so the order of c in B(Q) is at least its order in B(R); with the upper bound it is six in both.
4. B(Q) is cyclic of order six (V.5/k3-Q-splitting), so an element of order six generates it.

**Acceptance.**

- 2c ≠ 0 and 3c ≠ 0 in B(Q); since 3c = ⟨−1⟩ = 2[−1], the second says 2[−1] ≠ 0 in B(Q).
- The lower bound does not come from the Bloch-Wigner function, which is zero on real arguments.
- In CGZ's convention the image of c has order three (V.6/comparison-integral), so the order six is a statement about Suslin's convention.

**Imports.** [`K3BlochGroups:V.5/k3-Q-splitting`](#v-5-k3-q-splitting), [`K3BlochGroups:V.3/angle-bracket-homomorphism`](#v-3-angle-bracket-homomorphism), [`K3BlochGroups:V.3/element-c`](#v-3-element-c), [`K3BlochGroups:V.4/suslin-functoriality`](#v-4-suslin-functoriality), [`Polylogarithms:P.1`](../packets/Polylogarithms.json), [`K3BlochGroups:V.5/real-rogers-detector`](#v-5-real-rogers-detector), [`K3BlochGroups:V.5/universal-class-order-six`](#v-5-universal-class-order-six).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Remark VI.5.2.1 (PDF p. 496).

### V.5 closure requirements

**Finite-group stable elements and periodic homology supplier.** Hutchinson §3 quotes Brown III.9–10 (homological stable elements via Sylow transfer) and Swan Theorems1–2 (cyclic/quaternion periods) and uses cyclic/elementary-abelian homology. None was found in the pinned libraries or as an exact atlas node. The source explicitly states the needed results, but its cited general proofs have not been read in the cited source decomposition. A foundational owner must provide these results and cyclic subgroup inclusion maps; propose StableHomotopyKTheory PartII below. Do not misuse H.6’s K-spectrum coefficients as this theorem.

Consumers: [`K3BlochGroups:V.5/localized-sl2-homology`](#v-5-localized-sl2-homology), [`K3BlochGroups:V.5/sl2-characteristic-exceptions`](#v-5-sl2-characteristic-exceptions), [`K3BlochGroups:V.5/cartan-homology-modulo-n`](#v-5-cartan-homology-modulo-n).

**Algebraically closed unstable comparison and naturality refinement.** V.2/k3-to-h3-sl-field already supplies the field specialization of the V.1 stable Hurewicz sequence, including E(F)=SL∞(F); its exact node supplies this input. Refine the naturality of its inverse and coefficient-localization comparison used in Hutchinson Cor3.9. That proof invokes Sah’s algebraically closed unstable-to-stable comparison (Homology of classical Lie groups made discrete III). Sah’s result was not read or matched to an exact supplier node and remains an input gap, together with the filtered-colimit passage to the algebraic closure; it is not replaced by equality of cyclic orders.

Consumers: [`K3BlochGroups:V.5/finite-stabilization-map`](#v-5-finite-stabilization-map), [`K3BlochGroups:V.5/finite-stabilization-equivalence`](#v-5-finite-stabilization-equivalence).

**Finite refined configuration complex and torsion-map identification.** Hutchinson §§4,6,7 gives the finite spectral-sequence edge map, square-class refined RB→B and explicit β-cycle formulas. The parent V.4 provides ordinary configurations and infinite acyclicity, not this finite refined chain package. Refine the chain maps, their homotopies, Theorem4.3 finite exactness, and the identification of its kernel arrow with V.4’s monomial enhanced Tor. The full chain-level cyclic API is commented, not represented by a dummy condition, in the suggested file.

Consumers: [`K3BlochGroups:V.5/finite-cross-ratio-map`](#v-5-finite-cross-ratio-map), [`K3BlochGroups:V.5/finite-bloch-orders`](#v-5-finite-bloch-orders), [`K3BlochGroups:V.5/finite-enhanced-torsion-sequence`](#v-5-finite-enhanced-torsion-sequence).

**Rogers supplier and positive-presentation descent.** The analytic interval Rogers package is requested from P.1. Suslin Lemma1.6 proves P′(R)/⟨6c′⟩≅P(R) by a three-case inverse; this presentation argument has been read on pp219–220 and specified here, but its auxiliary carrier and proof must be refined before implementation. The final detector and generator values are stated; the missing theorem is not encoded as a Prop-valued field.

Consumers: [`K3BlochGroups:V.5/real-rogers-detector`](#v-5-real-rogers-detector), [`K3BlochGroups:V.5/universal-class-order-six`](#v-5-universal-class-order-six).

**Arithmetic N.8 reverse ownership and Gaussian w₂ certificate.** The N.8/k-groups-of-the-integers and N.8/gaussian-and-imaginary-quadratic refer to V.5 as supplier. Importing these exact nodes into V.5 would be circular, with the stated ownership. N.5 and N.7 independently supply the rational ambient group. The Gaussian r₂=1,w₂=24 certificate is requested from N.8 together with removal of the reverse dependency; its direct edge is proposed, not falsely claimed already acyclic.

Consumers: [`K3BlochGroups:V.5/rational-decomposable-subgroup`](#v-5-rational-decomposable-subgroup), [`K3BlochGroups:V.5/gaussian-decomposable-vanishing`](#v-5-gaussian-decomposable-vanishing).

<a id="v6"></a>

## V.6: Certificates, root classes and coefficient comparisons

Represent symbol equality by a finite integral combination of admissible
five-term relations, and represent a Bloch element by a free symbol sum with
a vanishing-boundary certificate. Soundness and relative completeness use
the actual quotient/kernel APIs from V.3. Evaluation on a Steinberg bar cycle
is supplied by V.1; existence of a lift through the Suslin map is distinct
from an effective procedure producing its finite chain.

For a primitive m-th root ζ with m≥2, m[ζ] lies in B(F), but [ζ] need not.
Given a coefficient ring R and an invertible image of m, attach
(m[ζ])⊗m⁻¹ in B(F)⊗R. The quotient, localized and p-adic constructors are
specializations of this same class. Keep its coefficient naturality and
denominator independence without assuming R flat. A lift of an integral
Bloch class is a fibre of s_F and a torsor under enhanced Tor; no preferred
lift or additive section is asserted.

For the arithmetic finite-coefficient slice, use the actual Chern isomorphism
and cyclotomic twist to define Φ=R_ζ⁻¹∘c̄. If the comparison scalar is γ, the
left-hand square reads Φ∘j_K=j_B∘γ⁻¹κ∘q. The inverse scalar cannot be dropped.
The right-hand Bockstein normalization is an additional required input.
Real and p-adic regulator agreement belongs to the normalized analytic
suppliers and must retain the distinction between K₃/n, K₃ᶦⁿᵈ/n and
K₃ with finite coefficients.

**Planets.** [Five-term certificate](#v-6-five-term-certificate); [Bloch element constructor](#v-6-bloch-element-constructor); [Root of unity multiples](#v-6-integral-root-multiple); [Root of unity classes](#v-6-root-coefficient-class); [K₃ lifts](#v-6-suslin-lift-fibre); [Bar cycle certificates](#v-6-bar-lift-witness).

<a id="v-6-five-term-certificate"></a>

### V.6.1: A five-term certificate

`K3BlochGroups:V.6/five-term-certificate` · definition

For a field F, a five-term certificate is a pair (a, k) of a finitely supported function a from admissible pairs — (x, y) with x, y in F − {0, 1} and x ≠ y — to Z, and an integer k. Its evaluation is Σ a(x, y) · R(x, y) + k[1] in the free abelian group on F − {0}, where R(x, y) = [x] − [y] + [y/x] − [(1 − x^{−1})/(1 − y^{−1})] + [(1 − x)/(1 − y)] is the five-term element of V.3/five-term-relation. A certificate is valid for ξ when its evaluation equals ξ; this is a decidable equality in the free abelian group when F has decidable equality. Certificates form an abelian group under pointwise addition, and evaluation is a homomorphism. The certificate is Suslin's normalisation (K-book VI.5.1); a certificate in CGZ's normalisation over the projective line is a different object, compared through V.3/cgz-convention-comparison.

**Hypotheses.** F is a field. Each pair in the list is admissible for the five-term relation.

**Construction and proof.**

1. Define the data type as Finsupp from admissible pairs to Z together with an integer coefficient for [1].
2. Define evaluation as the unique additive map sending the indicator of (x, y) to R(x, y) and the unit coefficient to [1] (FreeAbelianGroup.lift).
3. Define validity for ξ as equality of the evaluation with ξ.
4. Prove decidability of validity when F has decidable equality, through FreeAbelianGroup.equivFinsupp and Finsupp.instDecidableEq.
5. Prove that evaluations are exactly the elements of the five-term subgroup of V.3/five-term-relation.
6. Define the image of a certificate under a field embedding (admissible pairs go to admissible pairs because embeddings are injective) and its reduction modulo n.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `FiveTermCertificate` | data | A pair (a, k): a finitely supported function a from admissible pairs to Z, and the coefficient k ∈ Z of [1]. |
| `FiveTermCertificate.eval` | constructor | eval (a, k) = Σ a(x, y) R(x, y) + k[1] in the free abelian group on F − {0}. |
| `FiveTermCertificate.eval_single` | simp | eval of the indicator of (x, y) is R(x, y); eval (0, 1) = [1]. |
| `FiveTermCertificate.eval_zero` | simp | eval 0 = 0. |
| `FiveTermCertificate.eval_add` | simp | eval (c + c') = eval c + eval c'; eval (−c) = −eval c. |
| `FiveTermCertificate.Valid` | characterisation | Valid c ξ ⇔ eval c = ξ. |
| `FiveTermCertificate.Valid.add` | structure | Valid c ξ and Valid c' ξ' imply Valid (c + c') (ξ + ξ'); Valid c ξ implies Valid (−c) (−ξ). |
| `FiveTermCertificate.decidableValid` | instance | Valid c ξ is decidable when F has decidable equality (FreeAbelianGroup.equivFinsupp, Finsupp.instDecidableEq). |
| `FiveTermCertificate.mem_fiveTermSubgroup_iff` | compatibility | ξ lies in the five-term subgroup of V.3/five-term-relation if and only if some certificate is valid for ξ. |
| `FiveTermCertificate.map` | functoriality | For a field embedding σ: F → K, map σ c has eval (map σ c) = FreeAbelianGroup.map σ (eval c); map id = id and map (τ ∘ σ) = map τ ∘ map σ. |
| `FiveTermCertificate.Valid.modN` | relation | Valid c ξ implies that the class of ξ vanishes in P(F)/nP(F) for every n: the transport of a relation through finite-coefficient reduction. |
| `FiveTermCertificate.toCGZ` | compatibility | A valid certificate for ξ gives a certificate for ξ in CGZ's convention, because Suslin's five-term subgroup lies in CGZ's C(F) (CGZ, proof of Lemma 2.2). |

**Unit tests.**

- `empty_certificate` (degenerate): eval (0, 0) = 0 and eval (0, k) = k[1]; the certificate with no pairs is valid exactly for the multiples of [1].
- `five_term_two_three` (computation): Over Q, eval of the indicator of (2, 3) is [2] − [3] + [3/2] − [3/4] + [1/2].
- `c_independence_certificate` (computation): For x ≠ y in F − {0, 1}, the certificate with coefficient 1 on (x, y) and −1 on (1 − y, 1 − x) is valid for ([x] + [1 − x]) − ([y] + [1 − y]); a five-term formula with [x/y] in place of [y/x] fails this.
- `additivity` (characterisation): eval is the unique additive map sending the indicator of (x, y) to R(x, y) and (0, 1) to [1].
- `diagonal_not_admissible` (non-example): (x, x) and (x, 1) are not admissible pairs; the second would require the symbol of a quotient with zero denominator.
- `no_certificate_for_two` (non-example): Over Q no certificate is valid for [2]: the boundary of V.3/bloch-boundary kills every evaluation, but it sends [2] to 2 ∧ (−1) ≠ 0 in the antisymmetric quotient of Q^×.

**Uses.**

- V.6's soundness theorem: a valid certificate is exactly what proves an equality in the pre-Bloch group.
- V.6's constructor: ofData_certificate identifies two inputs that differ by a certified relation.
- K3BlochGroups README, V.6 row of the September 2026 handoff: 'Separate a five-term relation certificate, a vanishing-boundary certificate and a lift to indecomposable K3; prove how each transports through finite coefficient reduction'.
- HabiroNumberFields and PadicHodgeRegulators: a regulator may be applied to a class only once its defining relation is certified.

**Acceptance.**

- The certificate with no pairs is valid exactly for the multiples of [1].
- The K-book's proof of Lemma VI.5.4(a) is a certificate: coefficient 1 on (x, y) and −1 on (1 − y, 1 − x) is valid for c(x) − c(y).
- Validity proves membership in the five-term subgroup; failure to find a certificate proves nothing, and non-membership is shown by the boundary map (test no_certificate_for_two).

**Imports.** [`K3BlochGroups:V.3/five-term-relation`](#v-3-five-term-relation), [`mathlib:Finsupp`](#baseline-mathlib-finsupp), [`mathlib:FreeAbelianGroup`](#baseline-mathlib-freeabeliangroup), [`mathlib:FreeAbelianGroup.equivFinsupp`](#baseline-mathlib-freeabeliangroup-equivfinsupp), [`mathlib:Finsupp.instDecidableEq`](#baseline-mathlib-finsupp-instdecidableeq).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Definition VI.5.1 (PDF p. 495); [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.4(a), proof (PDF p. 497).

<a id="v-6-certificate-soundness"></a>

### V.6.2: Soundness and relative completeness of certificates

`K3BlochGroups:V.6/certificate-soundness` · theorem

A valid five-term certificate for the difference of two finite combinations proves that they have the same class in P(F). Conversely, if two combinations have the same class in P(F), then some valid certificate for their difference exists. Existence is not effective: no bound on the length of the certificate is claimed.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Soundness: the evaluation of a certificate lies in the five-term subgroup by construction, so the classes agree.
2. Completeness: equality of classes means the difference lies in the five-term subgroup, and every element of a subgroup generated by a set is a finite integer combination of its generators, which is exactly a certificate.
3. Record the honest limitation: the completeness statement is pure existence, with no length bound and no search procedure, and this is stated rather than hidden.

**Acceptance.**

- Soundness is checked on the certificate for the independence of c from its parameter.
- Completeness is used only to justify the format, never to produce a certificate.
- No complexity claim is made; a claimed bound would be an unproved addition.

**Imports.** [`K3BlochGroups:V.6/five-term-certificate`](#v-6-five-term-certificate), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — VI.5.1 (PDF p. 495).

<a id="v-6-root-of-unity-symbol"></a>

### V.6.3: When a root-of-unity symbol lies in the Bloch group

`K3BlochGroups:V.6/root-of-unity-symbol` · lemma

Let F be a field and ζ ∈ F a root of unity of exact order m ≥ 2. Then m · ∂[ζ] = 0 in ∧̃²F^×, so m[ζ] ∈ B(F); and [ζ] ∈ B(F) if and only if ζ ∧ (1 − ζ) = 0 in ∧̃²F^×. For a primitive sixth root of unity ω one has 1 − ω = ω^{−1} and ∂[ω] = (−1) ∧ (−1), so [ω] ∈ B(F) if and only if −1 is a square in F. All statements are in Suslin's convention of V.3; in the exterior-square convention ∂[ω] is always zero.

**Hypotheses.** F is a field. ζ ∈ F is a root of unity of exact order m ≥ 2.

**Construction and proof.**

1. ∂[ζ] = ζ ∧ (1 − ζ) by V.3/bloch-boundary, and m(ζ ⊗ (1 − ζ)) = ζ^m ⊗ (1 − ζ) = 0 in F^× ⊗ F^×; so m[ζ] lies in the kernel B(F).
2. [ζ] ∈ B(F) if and only if its boundary vanishes, by the definition of B(F) (V.3/bloch-group).
3. For ω of exact order 6, ω² − ω + 1 = 0 gives 1 − ω = −ω² = ω^{−1}, so ∂[ω] = −(ω ∧ ω); writing ω = (ω²)² · (−1) and using (ab) ∧ (ab) = a ∧ a + b ∧ b and 2(a ∧ a) = 0 gives ω ∧ ω = (−1) ∧ (−1).
4. By V.3/antisym-exterior-comparison, a ↦ a ∧ a is injective on F^×/F^{×2}, so (−1) ∧ (−1) = 0 exactly when −1 is a square.

**Acceptance.**

- Over Q, ∂[−1] = (−1) ∧ 2 ≠ 0, so [−1] ∉ B(Q) while 2[−1] ∈ B(Q).
- Over Q(√−3), [ω] ∉ B(F) but 2[ω] ∈ B(F); over Q(ζ_12), which contains i, [ω] ∈ B(F).
- Over Q(i), ∂[i] = i ∧ (1 − i) has order four, so 4[i] is the least positive multiple in B(Q(i)).
- A regulator is never applied to [ζ] itself unless the criterion holds; otherwise the classes of V.6/root-of-unity-class are used.

**Imports.** [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/antisym-exterior-comparison`](#v-3-antisym-exterior-comparison), [`mathlib:IsPrimitiveRoot`](#baseline-mathlib-isprimitiveroot).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Definition VI.5.1 (PDF p. 495); [Kbook.2013](#source-0-kbook-2013) — §VI.5, before Definition 5.1 (PDF p. 495).

<a id="v-6-comparison-rational"></a>

### V.6.4: The rational comparison

`K3BlochGroups:V.6/comparison-rational` · comparison

For every field F with at least four elements, tensoring Suslin's sequence with Q gives an isomorphism K_3^ind(F) ⊗ Q ≅ B(F) ⊗ Q, natural in F. The comparison κ of V.3/cgz-convention-comparison between Suslin's and CGZ's Bloch groups has kernel and cokernel annihilated by 2, so it becomes an isomorphism after tensoring with Q and both conventions give the same rational answer. For a number field K_3(F) ⊗ Q = K_3^ind(F) ⊗ Q, of dimension r_2.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. Use V.4/suslin-exact-sequence for infinite fields and V.5/finite-field-bloch-comparison for finite fields of order at least four. Use the natural enhanced Tor term for functoriality; identify it abstractly with μ̃ only where an order or non-functorial exact sequence is required.
2. Tensor Suslin's sequence (V.4/suslin-exact-sequence) with Q; µ̃(F) is torsion, so it dies and the remaining map is an isomorphism.
3. Naturality in F is V.4/suslin-functoriality tensored with Q.
4. κ ⊗ Q is an isomorphism because the kernel and cokernel of κ are killed by 2 (V.3/cgz-convention-comparison).
5. For a number field, combine with V.2/rationalisation-loss and V.5/k3-number-field.
6. State the prohibition: an agreement of two models rationally is not evidence for an integral comparison.

**Acceptance.**

- For a finite field both sides vanish rationally, so the comparison is vacuous there.
- For a number field both sides have dimension r_2.
- The comparison cannot see that κ is not surjective over F_11 (image of order three in CGZ's B(F_11) ≅ Z/6) or that κ(c) has order three in CGZ's B(Q) while c has order six in B(Q).

**Imports.** [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence), [`K3BlochGroups:V.4/suslin-functoriality`](#v-4-suslin-functoriality), [`K3BlochGroups:V.2/rationalisation-loss`](#v-2-rationalisation-loss), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`K3BlochGroups:V.5/k3-number-field`](#v-5-k3-number-field), [`K3BlochGroups:V.5/finite-field-bloch-comparison`](#v-5-finite-field-bloch-comparison).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Theorem VI.5.2 (PDF p. 495).

<a id="v-6-comparison-integral"></a>

### V.6.5: The integral comparison, with torsion retained

`K3BlochGroups:V.6/comparison-integral` · comparison

For every field F with at least four elements, export Suslin's sequence 0 → µ̃(F) → K_3^ind(F) → B(F) → 0 integrally, with B(F) in Suslin's convention of V.3 and µ̃(F) the enhanced group of V.4, not Tor_1(µ(F), µ(F)). The sequence need not split (for Q it is 0 → Z/4 → Z/24 → Z/6 → 0), so K_3^ind(F) and B(F) are not interchangeable integrally. The comparison κ of V.3 with CGZ's Bloch group has kernel and cokernel killed by 2 but is in general neither injective nor surjective; the sequence with CGZ's group in place of B(F) is therefore not asserted integrally, and consumers of CGZ's group use κ together with the odd-coefficient comparison of V.6/comparison-finite-coefficients.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. Use V.4/suslin-exact-sequence for infinite fields and V.5/finite-field-bloch-comparison for finite fields of order at least four. Use the natural enhanced Tor term for functoriality; identify it abstractly with μ̃ only where an order or non-functorial exact sequence is required.
2. Export the sequence of V.4/suslin-exact-sequence with its left-hand term named and its enhancement recorded (V.4/enhanced-mu, V.4/tor-form-comparison).
3. Export κ of V.3/cgz-convention-comparison with its 2-torsion kernel and cokernel.
4. Record the worked example for Q from V.5/k3-Q-splitting, where the orders 4, 24 and 6 make the non-split extension visible.
5. Record that κ is not a quotient map: over F_11 its image in CGZ's B(F_11) ≅ Z/6 has order three, and over Q it sends c, of order six, to [0], of order three.
6. State the two prohibitions the roadmap requires: the enhanced term is not the ordinary Tor group, and the Bloch group is not a substitute for K_3^ind integrally.

**Acceptance.**

- For Q the extension of Z/6 by Z/4 is non-split, since the middle group is cyclic of order 24.
- For a field of characteristic two the enhanced term equals µ(F), which has odd order, so the enhancement is invisible there; the export says so.
- Over F_11: B(F_11) ≅ Z/6, CGZ's B(F_11) ≅ Z/6, and κ has image of order three (Smith normal form of both presentations; the same holds for q = 7, 19, 27, and κ is an isomorphism for q = 4, 5, 8, 9, 13, 17, 25).
- Over Q, κ(c) = [0] has order three (CGZ Definition 1.1 and (34) with n = 3), so κ is not injective on B(Q) ≅ Z/6.

**Imports.** [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence), [`K3BlochGroups:V.4/enhanced-mu`](#v-4-enhanced-mu), [`K3BlochGroups:V.4/tor-form-comparison`](#v-4-tor-form-comparison), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`K3BlochGroups:V.5/k3-Q-splitting`](#v-5-k3-q-splitting), [`K3BlochGroups:V.5/finite-field-bloch-comparison`](#v-5-finite-field-bloch-comparison).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Theorem VI.5.2 (PDF p. 495); [Kbook.2013](#source-0-kbook-2013) — Remark VI.5.2.1 (PDF p. 496); [CGZ.2018](#source-0-cgz-2018) — Definition 1.1 and its remarks, p. 2.

<a id="v-6-comparison-finite-coefficients"></a>

### V.6.6: The comparisons modulo n

`K3BlochGroups:V.6/comparison-finite-coefficients` · comparison

Let F be a field with at least four elements and n ≥ 1. Reducing Suslin's sequence modulo n gives the exact sequence 0 → µ̃(F)[n] → K_3^ind(F)[n] → B(F)[n] → µ̃(F)/n → K_3^ind(F)/n → B(F)/n → 0. Hence K_3^ind(F)/n → B(F)/n is onto with kernel the image of µ̃(F)/n. If n is odd and µ(F) ⊗ Z/n = 0, it is an isomorphism. For odd n, κ of V.3 induces B(F)/n ≅ B_CGZ(F)/n. For a number field F and odd n, K_3(F)/n ≅ K_3^ind(F)/n, since K_3^M(F) ≅ (Z/2)^{r_1}; so if F contains no primitive p-th root of unity for any prime p dividing n, then K_3(F)/n ≅ B(F)/n ≅ B_CGZ(F)/n, which is the left-hand column of CGZ Lemma 4.4. Without that hypothesis the identification fails, and for even n no identification is asserted.

**Hypotheses.** F is a field with at least four elements; n is a positive integer. For the isomorphisms: n odd and µ(F) ⊗ Z/n = 0; for a number field, F contains no primitive p-th root of unity for p | n.

**Construction and proof.**

1. Use V.4/suslin-exact-sequence for infinite fields and V.5/finite-field-bloch-comparison for finite fields of order at least four. Use the natural enhanced Tor term for functoriality; identify it abstractly with μ̃ only where an order or non-functorial exact sequence is required.
2. Apply Tor(−, Z/n) and − ⊗ Z/n to V.4/suslin-exact-sequence to obtain the six-term sequence.
3. For odd n, µ̃(F)/n = µ(F)/n, because the enhancement is by Z/2 (V.4/enhanced-mu); so µ(F) ⊗ Z/n = 0 gives the isomorphism.
4. For odd n, κ ⊗ Z/n is an isomorphism because the kernel and cokernel of κ are killed by 2 (V.3/cgz-convention-comparison); this is the reduction CGZ make at the start of the proof of Theorem 2.11.
5. For a number field, K_3^M(F) is 2-torsion (V.2/milnor-k3-number-field), so K_3(F)/n → K_3^ind(F)/n is an isomorphism for odd n (V.2/decomposable-exactness); µ(F) is finite cyclic, and µ(F) ⊗ Z/n = 0 exactly when F contains no primitive p-th root of unity for p | n.
6. Counterexample to dropping the hypothesis, from V.5/k3-number-field: for F = Q(√−3) and n = 3, K_3(F) ≅ Z ⊕ Z/24 and µ̃(F) ≅ Z/12, so B(F) ≅ Z ⊕ Z/2 and B(F)/3 ≅ Z/3, while K_3(F)/3 ≅ (Z/3)².
7. Record the consumers: HabiroNumberFields HB.1 and HB.2 and PadicHodgeRegulators D.2 use these reductions, not the rational comparison.

**Acceptance.**

- For odd n the two conventions give the same group modulo n.
- For Q(√−3) and n = 3 the map K_3(F)/3 → B(F)/3 is not injective.
- For n = 2 and F = Q(i): K_3^ind(F) ≅ Z ⊕ Z/24, µ̃(F) ≅ Z/8 and B(F) ≅ Z ⊕ Z/3, so K_3^ind(F)/2 ≅ (Z/2)² while B(F)/2 ≅ Z/2.
- For a finite field F_q and odd n prime to q − 1 the comparison is V.5/bloch-finite-field-mod-n.

**Imports.** [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence), [`K3BlochGroups:V.4/enhanced-mu`](#v-4-enhanced-mu), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`K3BlochGroups:V.2/milnor-k3-number-field`](#v-2-milnor-k3-number-field), [`K3BlochGroups:V.2/decomposable-exactness`](#v-2-decomposable-exactness), [`K3BlochGroups:V.5/k3-number-field`](#v-5-k3-number-field), [`K3BlochGroups:V.6/comparison-integral`](#v-6-comparison-integral), [`K3BlochGroups:V.5/finite-field-bloch-comparison`](#v-5-finite-field-bloch-comparison).

**Sources.** [CGZ.2018](#source-0-cgz-2018) — §2.5, proof of Theorem 2.11, p. 15; [CGZ.2018](#source-0-cgz-2018) — Lemma 4.4 and its proof, pp. 24-25; [Kbook.2013](#source-0-kbook-2013) — Theorem VI.5.2 (PDF p. 495).

<a id="v-6-regulator-agreement"></a>

### V.6.7: Agreement of the real regulator with the Borel regulator

`K3BlochGroups:V.6/regulator-agreement` · comparison

Let F be a number field. The weight-two regulator of Polylogarithms P.2 (the Bloch-Wigner descent assembled over the complex places, Polylogarithms:P.2/weight-two-regulator), composed with the Suslin map K_3(F) → K_3^ind(F) → B(F), agrees with the Borel regulator on K_3(F) up to a nonzero rational scalar supplied by Polylogarithms:P.2/borel-comparison; an exact scalar and sign require the normalization theorem from BorelRegulators:R.7. Both maps kill K_3(F)_tors, so the statement is equivalent to its rationalisation through V.6/comparison-rational and says nothing about which integral Bloch-group convention is used. The analytic comparison is P.2's; this node only transports it along V.6's rational comparison.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Import Polylogarithms:P.2/borel-comparison, which compares the weight-two regulator with the Borel regulator on K_3^ind(F) under Suslin's sequence.
2. Compose with the quotient K_3(F) → K_3^ind(F) (V.2/k3-indecomposable); the decomposable part is torsion and is killed.
3. Rewrite the statement through V.6/comparison-rational: both sides factor through K_3(F) ⊗ Q ≅ B(F) ⊗ Q.
4. Record that no integral statement follows, as the stage text of Polylogarithms P.2 also says.

**Acceptance.**

- The real regulator kills torsion, so it agrees with the Borel regulator only after the rational comparison.
- For a totally real field both sides vanish.
- No claim is made that the regulator is nonzero on a specific element; that is P.2's certified-numerics node.

**Imports.** [`Polylogarithms:P.2/borel-comparison`](../packets/Polylogarithms.json), [`Polylogarithms:P.2/weight-two-regulator`](../packets/Polylogarithms.json), [`K3BlochGroups:V.6/comparison-rational`](#v-6-comparison-rational), [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable).

**Sources.** [CGZ.2018](#source-0-cgz-2018) — §1.2, p. 4.

<a id="v-6-boundary-certificate"></a>

### V.6.8: A vanishing-boundary certificate

`K3BlochGroups:V.6/boundary-certificate` · definition

Let F be a field and ξ = Σ n_x [x] a finitely supported integer combination of elements x ∈ F − {0, 1}. A vanishing-boundary certificate for ξ consists of a root of unity ζ_0 ∈ F^× with its exact order m_0 ≥ 1, elements g_1, …, g_s ∈ F^×, and for each x in the support exponent vectors e(x), f(x) ∈ Z/m_0 × Z^s with x = ζ_0^{e_0} ∏ g_j^{e_j} and 1 − x = ζ_0^{f_0} ∏ g_j^{f_j} (equalities in F). Its boundary is Σ n_x e(x) ∧ f(x) in ∧̃²(Z/m_0 × Z^s) ≅ Z/gcd(m_0, 2) ⊕ (Z/m_0)^s ⊕ (Z/2)^s ⊕ Z^{s(s−1)/2}, with components Σ n_x e_0 f_0 mod gcd(m_0, 2), Σ n_x (e_0 f_j − e_j f_0) mod m_0, Σ n_x e_j f_j mod 2 and Σ n_x (e_j f_k − e_k f_j) for j < k. The certificate is valid when all components vanish. A valid certificate proves ∂ξ = 0 in ∧̃²F^×; if ζ_0 and the g_j generate a direct summand of F^× on which they are a basis, the converse holds.

**Hypotheses.** F is a field; ξ is supported on F − {0, 1}. ζ_0 has exact order m_0; the displayed factorisations hold in F.

**Construction and proof.**

1. Define the data and the explicit boundary formula; the formula is well defined because e_0 and f_0 are only determined modulo m_0 and each component is taken modulo a divisor of m_0 or does not involve them.
2. Soundness: the homomorphism Z/m_0 × Z^s → F^× sending the basis to ζ_0, g_1, …, g_s induces ∧̃²(Z/m_0 × Z^s) → ∧̃²F^× and sends the boundary to ∂ξ of V.3/bloch-boundary.
3. The computation of ∧̃² of Z/m_0 × Z^s is the definition of the antisymmetric quotient (V.3/antisymmetric-tensor-quotient) applied to a basis: a ∧ b + b ∧ a = 0 on basis elements generates all relations.
4. Completeness on a direct summand: ∧̃² of a direct summand is a direct summand of ∧̃²F^×, so the map is injective there.
5. Validity is decidable: it is finitely many congruences and integer equations.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `BoundaryCertificate` | data | The root of unity ζ_0 with its order m_0, the elements g_1, …, g_s, and the exponent vectors e(x), f(x) with their factorisation proofs. |
| `BoundaryCertificate.boundary` | constructor | Σ n_x e(x) ∧ f(x) in ∧̃²(Z/m_0 × Z^s), by the displayed component formula. |
| `BoundaryCertificate.Valid` | characterisation | All components of the boundary vanish. |
| `BoundaryCertificate.decidableValid` | instance | Validity is decidable. |
| `BoundaryCertificate.boundary_map` | compatibility | The induced map ∧̃²(Z/m_0 × Z^s) → ∧̃²F^× sends boundary to the boundary of V.3/bloch-boundary of the class of ξ. |
| `BoundaryCertificate.sound` | characterisation | Valid implies that the boundary of the class of ξ vanishes, so ξ defines an element of B(F). |
| `BoundaryCertificate.complete_of_summand` | characterisation | If ζ_0, g_1, …, g_s form a basis of a direct summand of F^×, then ∂ξ = 0 implies Valid. |
| `BoundaryCertificate.add` | structure | Certificates over the same generators add, and the boundary is additive in ξ. |
| `BoundaryCertificate.map` | functoriality | A field embedding transports a certificate, with the same exponent vectors. |
| `BoundaryCertificate.reduce` | relation | A valid certificate gives vanishing of the boundary in ∧̃²F^× ⊗ Z/n and of d(ξ) in ∧²(F^×/F^{×n}), CGZ's condition for A(F; Z/nZ): the transport through finite-coefficient reduction. |

**Unit tests.**

- `boundary_cert_c_rat` (computation): Over Q with ζ_0 = −1 (m_0 = 2), g_1 = 2: for ξ = [2] + [−1], e(2) = (0; 1), f(2) = (1; 0), e(−1) = (1; 0), f(−1) = (0; 1); the (0, 1) component is (0 − 1) + (1 − 0) = 0 and the others vanish, so the certificate is valid.
- `boundary_cert_two_rat` (non-example): Over Q with the same data, ξ = [2] has (0, 1) component −1 ≢ 0 mod 2, so it is not valid; since ⟨−1, 2⟩ is a direct summand of Q^×, [2] ∉ B(Q).
- `boundary_cert_omega` (non-example): Over Q(√−3) with ζ_0 = ω of order 6 and s = 0, ξ = [ω] has e = (1), f = (5) and (0, 0) component 5 ≢ 0 mod 2, so it is not valid, although its image in the exterior square vanishes; ξ = 2[ω] is valid.
- `boundary_cert_zero` (degenerate): ξ = 0 with m_0 = 1 and s = 0 has a valid certificate.
- `boundary_cert_sound` (compatibility): For a valid certificate, the boundary of V.3/bloch-boundary of the class of ξ is zero, so ofBoundaryCertificate lands in V.3/bloch-group.

**Uses.**

- K3BlochGroups README, V.6 row of the September 2026 handoff: 'Separate a five-term relation certificate, a vanishing-boundary certificate and a lift to indecomposable K3'.
- V.6/bloch-element-constructor: ofBoundaryCertificate turns a valid certificate into an element of B(F).
- V.6/root-of-unity-symbol: the (0, 0) and (0, j) components decide when a root-of-unity symbol lies in B(F).

**Acceptance.**

- The certificate for c over Q is valid.
- The data for [2] over Q is not valid, and because ⟨−1, 2⟩ is a direct summand of Q^× this proves [2] ∉ B(Q).
- The certificate detects the convention: over Q(√−3) the data for [ω] fails the (0, 0) component, which has no counterpart in the exterior square.

**Imports.** [`K3BlochGroups:V.3/antisymmetric-tensor-quotient`](#v-3-antisymmetric-tensor-quotient), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`mathlib:ZMod`](#baseline-mathlib-zmod), [`mathlib:Finsupp`](#baseline-mathlib-finsupp).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — §VI.5, before Definition 5.1 (PDF p. 495); [Kbook.2013](#source-0-kbook-2013) — Definition VI.5.1 (PDF p. 495).

<a id="v-6-bloch-element-constructor"></a>

### V.6.9: Constructing a Bloch element from field data

`K3BlochGroups:V.6/bloch-element-constructor` · construction

Construct an element of B(F) from a finitely supported integer combination ξ of elements of F − {0} together with a proof that the boundary of the class of ξ vanishes in the antisymmetric tensor quotient ∧̃²F^×, or together with a vanishing-boundary certificate of V.6/boundary-certificate. The construction refuses input whose boundary has not been shown to vanish in ∧̃²F^×; it does not pass to the exterior square or to another quotient where the boundary happens to die. It is Suslin's convention of V.3; inputs using the symbols [0] or [∞] of CGZ's convention are not accepted.

**Hypotheses.** F is a field. The input is a finitely supported integer combination of nonzero elements of F.

**Construction and proof.**

1. Form the class of ξ in P(F).
2. Compute its boundary by the formula of V.3/bloch-boundary.
3. From a proof that this boundary vanishes, produce the element of B(F) (the kernel, V.3/bloch-group); from a boundary certificate, obtain that proof from BoundaryCertificate.sound.
4. Prove extensionality: two inputs with the same class in P(F) give the same element, and a valid five-term certificate for their difference gives this.
5. Prove additivity, surjectivity onto B(F), and naturality along field embeddings.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `ofData` | constructor | From ξ in the free abelian group on F − {0} and a proof that the boundary of the class of this ξ vanishes in ∧̃²F^×, an element of B(F). |
| `ofData_coe` | projection | The image of ofData ξ h in P(F) is the class of ξ. |
| `ofData_ext` | extensionality | Two inputs with equal classes in P(F) give equal elements. |
| `ofData_certificate` | characterisation | A valid five-term certificate for ξ − ξ' proves ofData ξ h = ofData ξ' h'. |
| `ofData_zero` | simp | ofData 0 _ = 0. |
| `ofData_add` | simp | ofData (ξ + ξ') _ = ofData ξ _ + ofData ξ' _, and ofData (−ξ) _ = −ofData ξ _. |
| `ofData_surjective` | characterisation | Every element of B(F) is ofData ξ h for some input. |
| `ofBoundaryCertificate` | constructor | The element of B(F) given by ξ and a valid certificate of V.6/boundary-certificate; it equals ofData ξ (BoundaryCertificate.sound). |
| `ofData_elementC` | example | For x in F − {0, 1}, ofData ([x] + [1 − x]) _ = c when \|F\| ≥ 4 (V.3/element-c). |
| `ofData_map` | functoriality | A field embedding σ: F → K carries ofData ξ h to ofData (σξ) (σh); map id = id and map (τ ∘ σ) = map τ ∘ map σ. |
| `ofData_cgz` | compatibility | The comparison κ of V.3/cgz-convention-comparison sends ofData ξ h to the CGZ class of ξ, regarded in the free abelian group on the projective line. |

**Unit tests.**

- `constructs_c` (computation): Over Q the input [2] + [−1] is accepted, since 2 ∧ (−1) + (−1) ∧ 2 = 0, and the output is c.
- `zero_input` (degenerate): ofData 0 _ = 0.
- `rejects_two_accepts_double` (non-example): Over Q the input [2] is rejected: 2 ∧ (−1) has order two in ∧̃²Q^×. The input 2[2] is accepted.
- `certificate_equality` (characterisation): For x ≠ y in F − {0, 1}, the inputs [x] + [1 − x] and [y] + [1 − y] give the same element, by the certificate c_independence_certificate of V.6/five-term-certificate.
- `not_projected` (non-example): Over F_5 the input [3] is rejected: 3 ∧ (1 − 3) = 3 ∧ 3 is the nonzero element of ∧̃²F_5^× ≅ Z/2, although its image in the exterior square ∧²F_5^× = 0 vanishes. A constructor testing the exterior square would accept it.
- `convention_image_of_c` (compatibility): Over Q, κ(ofData ([2] + [−1])) = [0] in CGZ's B(Q), of order three (CGZ Definition 1.1: [X] + [1 − X] − [0] = 0 and 3[0] = 0; CGZ (34) with n = 3), while c has order six in B(Q).

**Uses.**

- V.5's Bloch group of the rational numbers: the element c is produced by this constructor.
- Polylogarithms P.2/weight-two-regulator: the real regulator is evaluated on elements produced this way.
- PadicHodgeRegulators D.3: 'Do not insert raw symbols into a Bloch kernel without checking their boundary'.
- HabiroNumberFields HB.1: the finite Chern comparison is applied to elements with certified relations.

**Acceptance.**

- Over Q the input [2] + [−1] is and gives c.
- Over Q the input [2] is rejected (its boundary 2 ∧ (−1) is nonzero) while 2[2] is accepted.
- Over F_5 the input [3] is rejected, although its boundary vanishes in the exterior square: this is the test that the constructor does not use the wrong target.

**Imports.** [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/bloch-boundary`](#v-3-bloch-boundary), [`K3BlochGroups:V.6/five-term-certificate`](#v-6-five-term-certificate), [`K3BlochGroups:V.6/boundary-certificate`](#v-6-boundary-certificate), [`mathlib:Finsupp`](#baseline-mathlib-finsupp).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Definition VI.5.1 (PDF p. 495); [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.4(a) (PDF p. 496); [Kbook.2013](#source-0-kbook-2013) — §VI.5, before Definition 5.1 (PDF p. 495).

<a id="v-6-certificate-to-bar-cycle"></a>

### V.6.10: Lifting a certified Bloch element to K_3 and to bar cycles

`K3BlochGroups:V.6/certificate-to-bar-cycle` · comparison

Let F be an infinite field and β an element of B(F) produced by V.6/bloch-element-constructor. Then there is a class z ∈ H_3(GL_3(F), Z) with ψ(z) = β, and a class k ∈ K_3(F) ≅ H_3(St(F), Z), represented by a bar 3-cycle of the stable Steinberg group, whose image under K_3(F) → K_3^ind(F) → B(F) is β. The class z is determined up to the image of H_3(M_2, Z) ⊕ H_3(T_3, Z), and k up to the kernel of K_3(F) → B(F), which contains K_3^M(F) and the image of µ̃(F); a five-term certificate relating two inputs changes the lift only within this ambiguity. The statement is existence: no source read constructs an explicit bar cycle from a certificate (gap).

**Hypotheses.** F is an infinite field, as in V.4/psi-gl3 and V.4/homological-stability.

**Construction and proof.**

1. Existence of z: ψ: H_3(GL_3(F), Z) → B(F) is onto with kernel the image of H_3(M_2) ⊕ H_3(T_3) (V.4/psi-gl3), and H_3(GL_3(F)) ≅ H_3(GL(F)) (V.4/homological-stability).
2. Existence of k: K_3(F) → K_3^ind(F) → B(F) is onto (V.4/suslin-exact-sequence) and agrees with ψ composed with the homological model (V.4/suslin-functoriality).
3. Representation: every class of K_3(F) = H_3(St(F), Z) is the class of a bar 3-cycle (V.1/k3-h3-steinberg, V.1/bar-cycle-model).
4. Ambiguity: the kernel of K_3(F) → B(F) is generated by the decomposable image and µ̃(F) (V.2/decomposable-exactness, V.4/suslin-exact-sequence); inputs related by a valid five-term certificate give the same β (V.6/bloch-element-constructor), hence lifts in the same coset.
5. Record the gap: an explicit chain-level lift of β through the hyperhomology spectral sequence, and from H_3(GL(F)) to H_3(St(F)), is not given by the sources read.

**Acceptance.**

- A certificate for the zero element yields β = 0, whose lifts are exactly the kernel of K_3(F) → B(F).
- For Q, every lift of c to K_3(Q) ≅ Z/48 is a generator, of order 48, and every lift to K_3^ind(Q) ≅ Z/24 has order 24: the lift of an element of order six need not have order dividing six.
- The lift is not canonical, and the comparison states this rather than choosing one.

**Imports.** [`K3BlochGroups:V.6/bloch-element-constructor`](#v-6-bloch-element-constructor), [`K3BlochGroups:V.6/five-term-certificate`](#v-6-five-term-certificate), [`K3BlochGroups:V.4/psi-gl3`](#v-4-psi-gl3), [`K3BlochGroups:V.4/homological-stability`](#v-4-homological-stability), [`K3BlochGroups:V.4/suslin-exact-sequence`](#v-4-suslin-exact-sequence), [`K3BlochGroups:V.4/suslin-functoriality`](#v-4-suslin-functoriality), [`K3BlochGroups:V.1/k3-h3-steinberg`](#v-1-k3-h3-steinberg), [`K3BlochGroups:V.1/bar-cycle-model`](#v-1-bar-cycle-model), [`K3BlochGroups:V.2/decomposable-exactness`](#v-2-decomposable-exactness).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Proposition VI.5.12 (PDF p. 502); [Kbook.2013](#source-0-kbook-2013) — Remark VI.5.12.1 (PDF p. 502); [Kbook.2013](#source-0-kbook-2013) — Lemma VI.5.6, proof (PDF p. 498).

<a id="v-6-root-of-unity-class"></a>

### V.6.11: Valid classes attached to a root of unity

`K3BlochGroups:V.6/root-of-unity-class` · construction

Let ζ ∈ F be a root of unity of exact order m ≥ 2. (i) For n ≥ 1 prime to m, define ⟦ζ⟧_n ∈ B(F)/nB(F) as u · (m[ζ]) with u m ≡ 1 mod n; it does not depend on u and maps to the class of [ζ] in P(F)/nP(F). (ii) Define ⟦ζ⟧[1/m] ∈ B(F) ⊗ Z[1/m] as m^{−1} ⊗ m[ζ]; it maps to [ζ] ⊗ 1 in P(F) ⊗ Z[1/m]. (iii) For a prime p not dividing m, define the class in B(F) ⊗ Z_p in the same way. When [ζ] ∈ B(F) (V.6/root-of-unity-symbol) each class is the image of [ζ]; otherwise none is the image of an element [ζ] of B(F). These are the substitutes the consumers use in place of [ζ].

**Hypotheses.** F is a field; ζ ∈ F has exact order m ≥ 2. n is prime to m, respectively p does not divide m.

**Construction and proof.**

1. m[ζ] ∈ B(F) by V.6/root-of-unity-symbol; produce it with V.6/bloch-element-constructor.
2. Independence of u: changing u by a multiple of n changes the class by a multiple of n · m[ζ] ∈ nB(F).
3. In P(F)/nP(F) the class of u m [ζ] is the class of [ζ], because u m ≡ 1 mod n.
4. Z[1/m] and Z_p (p ∤ m) are flat, so B(F) ⊗ Z[1/m] is the kernel of the boundary on P(F) ⊗ Z[1/m], which contains [ζ] ⊗ 1 because ∂[ζ] is m-torsion; the same for Z_p.
5. Compatibility: the image of ⟦ζ⟧[1/m] in B(F) ⊗ Z/n is ⟦ζ⟧_n.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `rootClassMod` | constructor | ⟦ζ⟧_n = u · ofData (m[ζ]) in B(F)/nB(F), for n prime to m and u m ≡ 1 mod n. |
| `rootClassMod_indep` | characterisation | ⟦ζ⟧_n does not depend on u. |
| `rootClassMod_toPreBloch` | projection | The image of ⟦ζ⟧_n in P(F)/nP(F) is the class of [ζ]. |
| `rootClassMod_of_mem` | compatibility | If [ζ] ∈ B(F), then ⟦ζ⟧_n is the reduction of [ζ]. |
| `rootClassLoc` | constructor | ⟦ζ⟧[1/m] = m^{−1} ⊗ m[ζ] in the localisation of B(F) at the powers of m (LocalizedModule). |
| `rootClassLoc_toPreBloch` | projection | The image of ⟦ζ⟧[1/m] in P(F) ⊗ Z[1/m] is [ζ] ⊗ 1. |
| `rootClassPadic` | constructor | For p ∤ m, the class m^{−1} ⊗ m[ζ] in B(F) ⊗ Z_p. |
| `rootClassLoc_reduce` | relation | The image of ⟦ζ⟧[1/m] in B(F) ⊗ Z/n, for n prime to m, is ⟦ζ⟧_n. |
| `rootClass_map` | functoriality | A field embedding σ sends ⟦ζ⟧ to ⟦σζ⟧ in each of the three versions. |

**Unit tests.**

- `rootClass_neg_one_mod_three` (computation): Over Q, ζ = −1, m = 2, n = 3, u = 2: 2[−1] = ⟨−1⟩ ∈ B(Q) and ⟦−1⟧_3 = 2⟨−1⟩ = 0 in B(Q)/3B(Q).
- `rootClass_of_mem_omega` (degenerate): Over Q(ζ_12), where [ω] ∈ B(F), ⟦ω⟧_5 is the reduction of [ω].
- `rootClass_not_lift_omega` (non-example): Over Q(√−3), ⟦ω⟧_5 is defined but is not the reduction of an element [ω] of B(F), because ∂[ω] = (−1) ∧ (−1) ≠ 0.
- `rootClass_loc_compat` (compatibility): m · ⟦ζ⟧[1/m] equals the image of ofData (m[ζ]) in the localisation of B(F) at the powers of m.
- `rootClass_indep_u` (characterisation): The choices u and u + n give the same ⟦ζ⟧_n.

**Uses.**

- PadicHodgeRegulators D.3: 'The roots-of-unity classes are constructed through V's valid coefficient-localised or integral multiples, with the comparison to the notation [ζ] used in GSWZ proved.'.
- HabiroNumberFields HB.1: finite Chern classes are applied to classes of this kind.
- K3BlochGroups README acceptance: 'a root-of-unity symbol requiring a multiple before it lies in the chosen Bloch kernel'.

**Acceptance.**

- Over Q, ⟦−1⟧_3 = 0 in B(Q)/3B(Q).
- Over Q(√−3), ⟦ω⟧_5 is defined although [ω] ∉ B(F).
- PadicHodgeRegulators D.3's roots-of-unity classes, of order prime to p in an unramified extension of Q_p, are the classes (iii).

**Imports.** [`K3BlochGroups:V.6/root-of-unity-symbol`](#v-6-root-of-unity-symbol), [`K3BlochGroups:V.6/bloch-element-constructor`](#v-6-bloch-element-constructor), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`K3BlochGroups:V.3/pre-bloch-group`](#v-3-pre-bloch-group), [`mathlib:LocalizedModule`](#baseline-mathlib-localizedmodule), [`mathlib:Submonoid.powers`](#baseline-mathlib-submonoid-powers), [`mathlib:PadicInt`](#baseline-mathlib-padicint), [`mathlib:TensorProduct`](#baseline-mathlib-tensorproduct), [`mathlib:ZMod`](#baseline-mathlib-zmod).

**Sources.** [Kbook.2013](#source-0-kbook-2013) — Definition VI.5.1 (PDF p. 495); [CGZ.2018](#source-0-cgz-2018) — §1.2, equation (14), p. 5.

<a id="v-6-regulator-agreement-padic"></a>

### V.6.12: Agreement of the p-adic regulator under the comparison modulo p^m

`K3BlochGroups:V.6/regulator-agreement-padic` · comparison

Let p > 3, let L be a finite unramified extension of Q_p (the setting of PadicHodgeRegulators D.2 and D.3) and n = p^m. The comparison of PadicHodgeRegulators D.2 between the syntomic or étale regulator in degree three and weight two and the p-adic dilogarithm on the Bloch-group model is transported to K_3^ind(L)/n through V.6/comparison-finite-coefficients: since p is odd and ζ_p ∉ L (Q_p(ζ_p) is totally ramified of degree p − 1 > 1), K_3^ind(L)/n ≅ B(L)/n in either convention of V.3. Roots-of-unity inputs are the classes of V.6/root-of-unity-class. The passage from K_3(L)/n to K_3^ind(L)/n needs K_3^M(L)/n = 0 or that the regulator kills decomposables; neither is supplied by a stage read (gap).

**Hypotheses.** p > 3; L is a finite unramified extension of Q_p; n = p^m.

**Construction and proof.**

1. Import the degree-three, weight-two comparison of PadicHodgeRegulators D.2, whose stage text reads 'In degree three and weight two compare the regulator with the explicit p-adic dilogarithm on V's Bloch-group model. Give the actual scalar/Frobenius normalisation.'
2. µ(L) ⊗ Z/p = 0 because ζ_p ∉ L, so V.6/comparison-finite-coefficients gives K_3^ind(L)/n ≅ B(L)/n, and κ ⊗ Z/n identifies the two conventions.
3. Use V.6/root-of-unity-class (iii) for the classes at roots of unity of order prime to p.
4. Record the gap on the decomposable part.

**Acceptance.**

- The hypothesis ζ_p ∉ L holds for every unramified L and odd p, so the identification needs no further condition there.
- The statement is modulo p^m (or after the limit over m); no statement about the uncompleted group K_3(L) is made, as D.3's text forbids.
- The roots-of-unity classes used are valid classes, not raw symbols.

**Imports.** [`PadicHodgeRegulators:D.2`](../packets/PadicHodgeRegulators--D.1.json), [`K3BlochGroups:V.6/comparison-finite-coefficients`](#v-6-comparison-finite-coefficients), [`K3BlochGroups:V.6/root-of-unity-class`](#v-6-root-of-unity-class), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison).

**Sources.** [CGZ.2018](#source-0-cgz-2018) — §2.5, proof of Theorem 2.11, p. 15.

<a id="v-6-integral-root-multiple"></a>

### V.6.13: Integral root-of-unity multiple

`K3BlochGroups:V.6/integral-root-multiple` · construction

Let F be a field, ζ a primitive m-th root with m≥2, P(F) the pre-Bloch group and ∂ its boundary to Suslin’s antisymmetric square. Define rootMultiple(ζ,m)=(m[ζ], h_m) in B(F)=ker ∂, where h_m is the boundary vanishing supplied by V.6/root-of-unity-symbol. The reusable construction takes any abelian groups P,W, homomorphism δ:P→W, x∈P, natural m and proof δ(mx)=0, and returns (mx,h)∈ker δ. The proof is not data on which the resulting element depends. Exact order is needed only for the field specialization, not the generic kernel construction.

**Hypotheses.** F is a field, m≥2 and IsPrimitiveRoot ζ m for the field specialization; hence ζ≠0,1. Use the antisymmetric quotient, retaining diagonal two-torsion, throughout the integral construction.

**Construction and proof.**

1. Import the actual boundary formula and m∂[ζ]=0 from V.6/root-of-unity-symbol; bilinearity turns the first factor ζ^m into 1.
2. Insert m[ζ] into the kernel using V.3/bloch-group. Equality and change of annihilating multiple follow from equality of underlying elements and proof irrelevance.
3. Under a field map transport the symbol and the boundary; kernel functoriality gives the stated compatibility.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `rootMultiple` | constructor | For δ,x,m,h:δ(mx)=0, return the kernel element with underlying value mx. |
| `rootMultiple_coe` | projection | The inclusion of rootMultiple(δ,x,m,h) into P is mx. |
| `rootMultiple_proof_irrel` | extensionality | For two proofs h,h′ of δ(mx)=0, the resulting kernel elements are equal. |
| `rootMultiple_zero` | simp | rootMultiple(δ,0,m,h)=0; rootMultiple(δ,x,0,h)=0. |
| `rootMultiple_of_mem` | compatibility | If b∈ker δ has underlying x, rootMultiple(δ,x,m,h)=mb. |
| `rootMultiple_mul` | relation | If δ(mx)=0 and δ((mk)x)=0, rootMultiple at mk is k times rootMultiple at m. |
| `rootMultiple_map` | functoriality | For f:P→P′ and g:W→W′ with δ′f=gδ, the induced kernel map sends rootMultiple(δ,x,m,h) to rootMultiple(δ′,f(x),m,h′). |

**Unit tests.**

- `rootMultiple_mod_two` (computation): For δ:ℤ→ℤ/2 reduction, x=1 and m=2, the underlying rootMultiple is 2, not 1.
- `rootMultiple_zero_multiplier` (degenerate): For every δ and x, the kernel element built with annihilator 0 is zero.
- `rootMultiple_kernel_compat` (compatibility): For b in the Mathlib additive kernel of δ and m=3, rootMultiple built from the underlying b equals 3b in that kernel.
- `rootMultiple_raw_rejected` (non-example): For δ:ℤ→ℤ/2 reduction, 1 is not in ker δ although 2 is. A constructor returning the raw symbol fails this test.

**Uses.**

- CGZ §6, p33: The K₃ classes corresponding to D[ζ_D] supply circular-unit inputs..
- PadicHodgeRegulators:D.3 and HabiroNumberFields:HB.2: Transport integral input to coefficient rings in which the root order is invertible..
- K3BlochGroups:V.6/root-coefficient-class: Provides the honest integral numerator before division by a unit..

**Acceptance.**

- For a primitive sixth root ω over ℚ(√−3), 6[ω] is although [ω] is rejected by the diagonal obstruction.
- Over a field where −1 is a square, the same construction agrees with six times the integral raw class of ω.

**Imports.** [`K3BlochGroups:V.6/root-of-unity-symbol`](#v-6-root-of-unity-symbol), [`K3BlochGroups:V.3/bloch-group`](#v-3-bloch-group), [`mathlib:MonoidHom.ker`](#baseline-mathlib-monoidhom-ker), [`mathlib:IsPrimitiveRoot`](#baseline-mathlib-isprimitiveroot).

**Sources.** [CGZ](#source-6-cgz) — §6, final circular-unit paragraph, p33.

<a id="v-6-root-coefficient-class"></a>

### V.6.14: Root-of-unity class over a coefficient ring

`K3BlochGroups:V.6/root-coefficient-class` · construction

Let δ:P→W be an additive homomorphism of abelian groups, B=ker δ, x∈P, m∈ℕ, and h:δ(mx)=0. Let R be a commutative ring and u∈R× with underlying value the image of m. Define rootCoefficient(δ,x,m,h,u)=(mx,h)⊗u⁻¹ in B⊗_ℤ R. Its image under B⊗R→P⊗R is x⊗1. This construction, without any flatness assumption, specializes for x=[ζ] to the primary rootClassMod (R=ℤ/n, gcd(m,n)=1), rootClassLoc (R=ℤ[1/m]) and rootClassPadic (R=ℤ_p, p∤m). It does not assert that tensoring the kernel identifies it with the kernel of the reduced boundary.

**Hypotheses.** δ(mx)=0, R commutative and u a unit whose value is m in R. For the field specialization ζ has exact order m≥2. Coprimality or localization supplies the unit; when m is not invertible no raw coefficient class is constructed by this recipe.

**Construction and proof.**

1. Use the integral kernel element from integral-root-multiple and the canonical Mathlib tensor product; take its pure tensor with u⁻¹.
2. Apply the tensor of the kernel inclusion. The ℤ-balancing relation and uu⁻¹=1 give x⊗1.
3. For two annihilators m,l with invertible images, the equality l(mx,h_m)=m(lx,h_l) inside B proves equality of the two divided tensors. No injectivity after tensoring is used.
4. Tensor functoriality gives field maps and change of coefficient ring. Compare the three specializations with the already planned V.6/root-of-unity-class, including the standard B⊗ℤ/n≅B/n identification exported there.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `rootCoefficient` | constructor | The pure tensor rootMultiple(δ,x,m,h)⊗u⁻¹ in B⊗R, for the specified unit u. |
| `rootCoefficient_toPre` | projection | Under the tensor of the kernel inclusion, rootCoefficient maps to x⊗1. |
| `rootCoefficient_zero` | simp | For x=0 and any valid denominator, rootCoefficient=0. |
| `rootCoefficient_of_mem` | compatibility | If b∈B has underlying x, rootCoefficient=b⊗1. |
| `rootCoefficient_denominator_independent` | characterisation | For two annihilating positive or zero natural numbers m,l with invertible images u,v in R, the divided tensor classes coincide. |
| `rootCoefficient_changeRing` | functoriality | For a ring map ρ:R→S, tensoring id_B with ρ sends the class to the class with unit ρ(u). |
| `rootCoefficient_map` | functoriality | For a commuting boundary square f:P→P′,g:W→W′, tensoring its kernel map with id_R sends the class at x to that at f(x). |
| `rootCoefficient_specializations` | compatibility | Under B⊗ℤ/n≅B/n this is rootClassMod; for ℤ[1/m] it is rootClassLoc; for ℤ_p with p∤m it is rootClassPadic, with the primary conventions. |

**Unit tests.**

- `rootCoefficient_mod_five` (computation): For δ:ℤ→ℤ/2 reduction, x=1,m=2,R=ℤ/5 and u=2, the image in ℤ⊗ℤ/5 is 1⊗1 and the defining tensor in B⊗ℤ/5 is (2,h)⊗3.
- `rootCoefficient_zero_test` (degenerate): The class at x=0 equals zero for every unit denominator.
- `rootCoefficient_two_denominators` (compatibility): For δ:ℤ→ℤ/2 reduction, x=1,R=ℤ/5, the classes using annihilators 2 and 4 coincide; they both agree with pure tensor division in Mathlib.
- `rootCoefficient_nonflat` (non-example): For δ:ℤ→ℤ/2 reduction and R=ℤ/2, there is a nonzero tensor in (ker δ)⊗R whose image in ℤ⊗R is zero. Thus projection to the raw tensor does not characterize an arbitrary class and 2 cannot be used as a unit denominator in this R.

**Uses.**

- V.6/root-of-unity-class in the inherited: A single general construction reconciles its three existing specializations without replanning them..
- PadicHodgeRegulators:D.3: Provides the class in B⊗ℤ_p when the root order is prime to p, retaining the integral numerator..
- HabiroNumberFields:HB.2: Provides quotient input for finite Chern maps; this input lies in B/n before entering the étale Bloch group..

**Acceptance.**

- Modulo n requires gcd(m,n)=1; p-adic coefficients require p∤m.
- Over ℚ(√−3) and n=5 the class for a sixth root is defined even though the raw integral symbol is not in B.
- For a nonflat coefficient ring the inclusion of B⊗R into P⊗R can have a kernel; projection to the raw tensor does not imply uniqueness of arbitrary lifts.

**Imports.** [`K3BlochGroups:V.6/integral-root-multiple`](#v-6-integral-root-multiple), [`K3BlochGroups:V.6/root-of-unity-class`](#v-6-root-of-unity-class), [`mathlib:TensorProduct`](#baseline-mathlib-tensorproduct), [`mathlib:TensorProduct.tmul`](#baseline-mathlib-tensorproduct-tmul), [`mathlib:TensorProduct.map`](#baseline-mathlib-tensorproduct-map), [`mathlib:AddMonoidHom.toIntLinearMap`](#baseline-mathlib-addmonoidhom-tointlinearmap).

**Sources.** [CGZ](#source-6-cgz) — §6, final circular-unit paragraph, p33.

<a id="v-6-suslin-lift-fibre"></a>

### V.6.15: Fibre of the integral Suslin comparison

`K3BlochGroups:V.6/suslin-lift-fibre` · definition

For an infinite field F write the imported exact sequence as 0→T(F) --i→ K₃^ind(F) --q→ B(F)→0, with T(F) the enhanced Tor term in the parent. For β∈B(F), define SuslinLift(q,β)={k∈K₃^ind(F) | q(k)=β}. It is a nonempty fibre; T acts freely and transitively by k↦k+i(t). This is a torsor of witnesses, without a distinguished origin. For the generic API, q:K→B and i:T→K are homomorphisms of abelian groups, q surjective, i injective, and im i=ker q. The fibre definition itself needs only q and β.

**Hypotheses.** F infinite for the source cited here; the primary separately justified finite-field comparisons are reused in their own ranges. The torsor statements use exactness, including the enhanced two-primary extension, not ordinary Tor or a chosen direct sum decomposition.

**Construction and proof.**

1. Define the subtype fibre using the actual q of V.6/comparison-integral.
2. Use its surjectivity for nonemptiness. Exactness says the difference of two representatives is i(t); injectivity of i gives the unique t.
3. Translation and its laws use the additive group structure. A field map induces a fibre map by naturality of the parent comparison.
4. The generic finite-group example uses the actual Mathlib reduction ℤ/24→ℤ/6 and detects the nonsplit extension.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `SuslinLift` | data | The fibre subtype of q at β. |
| `SuslinLift.ofRep` | constructor | Given k and q(k)=β, produce a witness. |
| `SuslinLift.over` | projection | Every witness has q(value)=β. |
| `SuslinLift.ext` | extensionality | Two witnesses are equal iff their underlying K-elements are equal. |
| `SuslinLift.choose` | constructor | Surjectivity of q provides a noncomputable witness for each β; no additivity or naturality of choose is asserted. |
| `SuslinLift.translate` | structure | For t∈T and q∘i=0, translate k by i(t) within the same fibre. |
| `SuslinLift.translate_zero_add` | simp | Translation by 0 is the identity and successive translations by t and s equal translation by s+t. |
| `SuslinLift.unique_difference` | characterisation | When i is injective and im i=ker q, for witnesses a,b there is a unique t∈T with b.value=a.value+i(t). |
| `SuslinLift.map` | functoriality | For f:K→K′,g:B→B′ with q′f=gq, map a witness above β to the witness with representative f(k) above g(β). |
| `SuslinLift.map_id_comp` | functoriality | The fibre maps respect identity maps and composition of commuting squares. |

**Unit tests.**

- `SuslinLift_zero_test` (degenerate): For every additive q, 0 with q(0)=0 is an element of SuslinLift(q,0).
- `SuslinLift_Q_fibre` (computation): For q:ℤ/24→ℤ/6 reduction, the fibre over 1 has cardinality 4 and underlying representatives 1,7,13,19.
- `SuslinLift_kernel_compat` (compatibility): For β=0 and q:K→B, the underlying representatives are exactly Mathlib’s additive kernel q.ker.
- `SuslinLift_Q_nonsplit` (non-example): The reduction ℤ/24→ℤ/6 has no additive section. Fibre nonemptiness cannot justify an additive canonical choice of lifts.

**Uses.**

- V.6/certificate-to-bar-cycle in the inherited: Makes the ambiguity of a chosen K₃^ind preimage explicit; passage to Quillen K₃ has the additional Milnor ambiguity..
- CGZ §6, circular-unit paragraph: An explicit Bloch numerator can be paired with a K₃ representative while preserving what is and is not canonical..

**Acceptance.**

- For β=0, zero is a witness but other kernel elements can be witnesses.
- For F=ℚ the primary nonsplit ℤ/4→ℤ/24→ℤ/6 model gives four witnesses over each β. It cannot be replaced with ℤ/6⊕ℤ/4.

**Imports.** [`K3BlochGroups:V.6/comparison-integral`](#v-6-comparison-integral), [`K3BlochGroups:V.2/k3-indecomposable`](#v-2-k3-indecomposable), [`mathlib:MonoidHom.ker`](#baseline-mathlib-monoidhom-ker), [`mathlib:ZMod.castHom`](#baseline-mathlib-zmod-casthom).

**Sources.** [KVI](#source-6-kvi) — Theorem VI.5.2, p23.

<a id="v-6-bar-lift-witness"></a>

### V.6.16: Certified finite bar-cycle lift

`K3BlochGroups:V.6/bar-lift-witness` · definition

Let F be infinite, G=St(F) the imported stable Steinberg group, A the trivial integral representation, and ψ:H₃(G,ℤ)→B(F) the composite H₃(St(F),ℤ)≅K₃(F)→K₃^ind(F)→B(F). For β∈B(F), define BarLiftCertificate(ψ,β)={z∈Z₃(G,ℤ) | ψ(π(z))=β}. Here Z₃ and π are Mathlib’s cycles and their projection to homology. The underlying chain is a finitely supported integral function on triples (equivalently Fin 3→G), with bar boundary [g|h|k]↦[h|k]−[gh|k]+[g|hk]−[g|h]. Its data are a finite chain, proof its boundary vanishes, and proof its homology image is β. This does not include an algorithm producing a chain from a five-term certificate.

**Hypotheses.** The field-specific ψ and its surjectivity come from the primary V.1 and V.6 nodes. The witness type itself is defined for any group G and supplied ψ to any abelian B. Use the unnormalized inhomogeneous bar complex with trivial integral coefficients. A proof that a pre-Bloch symbol combination has boundary zero and a bar cycle are different kinds of certificate.

**Construction and proof.**

1. Import V.1/bar-cycle-model and k3-h3-steinberg, and compose their homology identification with the integral Suslin comparison and K₃→K₃^ind.
2. Use the existing Mathlib cycle type and π; define the subtype imposing ψπ(z)=β. Its chain inclusion is finite support and carries the required cycle equation.
3. Use groupHomology.cyclesMk with predecessor index 2 to construct a degree-three cycle from a supplied finite chain and its zero-boundary proof, then ofCycle with the target proof. Adding a degree-four boundary leaves its homology class, hence its certified Bloch target, unchanged.
4. The parent’s existential certificate-to-bar-cycle theorem and groupHomology_induction_on (surjectivity of cycles→homology) yield a noncomputable chosen witness. They give no bounded or executable synthesis procedure.
5. Map along a group/field homomorphism using the imported bar functor and a commuting ψ square; identity and composition follow from the supplied maps.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `BarLiftCertificate` | data | The subtype of actual degree-three cycles z with ψπ(z)=β. |
| `BarLiftCertificate.chain` | projection | Include the witness cycle into Mathlib’s finite-support chain module. |
| `BarLiftCertificate.cycle_eq` | characterisation | The differential of chain(c) is zero. |
| `BarLiftCertificate.homology` | projection | The homology representative is π(cycle(c)) in the imported H₃. |
| `BarLiftCertificate.over` | projection | ψ(homology(c))=β. |
| `BarLiftCertificate.ofCycle` | constructor | Given z∈Z₃ and ψπ(z)=β, construct the witness; the standard cyclesMk constructor accepts a finite chain and its zero-boundary proof. |
| `BarLiftCertificate.ofChain` | constructor | Given a finite chain z∈C₃, a proof d₃z=0 and a proof ψπ(cyclesMk(z))=β, construct the witness using Mathlib’s cyclesMk with indices 3,2. No chain synthesis is asserted. |
| `BarLiftCertificate.ofChain_chain` | compatibility | The chain projection of ofChain(z,h_cycle,h_target) equals z, including its finite support; the constructor does not quotient chains by boundaries. |
| `BarLiftCertificate.ext` | extensionality | Witnesses are equal iff their underlying cycles are equal, equivalently iff their chains are equal. |
| `BarLiftCertificate.addBoundary` | relation | For w∈C₄, replacing z by z+d₄w is a witness above the same β and has the same homology representative. |
| `BarLiftCertificate.choose` | constructor | If ψ is surjective, classical choice and the surjectivity of π provide a witness over every β. This API has no executable or functorial-choice guarantee. |
| `BarLiftCertificate.map` | functoriality | A map of cycle modules compatible with ψπ maps witnesses over β to witnesses over the image of β; the maps induced by group/field maps are those from V.1. |
| `BarLiftCertificate.map_id_comp` | functoriality | Maps of witness fibres respect identity and composition. |

**Unit tests.**

- `BarLiftCertificate_zero_test` (degenerate): The certificate of the zero cycle above 0 has zero chain and zero homology representative.
- `BarLiftCertificate_boundary_test` (compatibility): For any c and four-chain w, the witness addBoundary(c,w) has the same image under Mathlib’s homology projection π as c.
- `BarLiftCertificate_trivial_group` (non-example): For the trivial group and any ψ:H₃(1,ℤ)→B, no witness exists over β≠0, because H₃(1,ℤ)=0.
- `BarLiftCertificate_one_cube` (computation): For the trivial group, the single chain [1|1|1] with coefficient 1 is a cycle representing zero homology. It is a witness above 0 distinct as a finite chain from the zero witness. Thus equality of homology must not be used as extensionality of witnesses.
- `BarLiftCertificate_reject_noncycle` (non-example): For any group G and g≠1, the single chain [g|1|1] with coefficient 1 is not the chain of any witness, over any β. Its boundary is [1|1]−[g|1]≠0. This catches a constructor that omits the cycle equation.

**Uses.**

- V.6/certificate-to-bar-cycle in the inherited: Turns the existence statement into a reusable witness interface without confusing it with an algorithm..
- V.6/five-term-certificate and certificate-soundness in the inherited: An equality certificate identifies the target β, after which an independently supplied bar lift can be transported across that equality..
- V.1/k3-h3-steinberg: Converts the certified homology class into an actual Quillen K₃ representative, retaining the full ambiguity..

**Acceptance.**

- The zero chain certifies β=0. A noncycle cannot be certified merely because an informal symbolic expression evaluates to a Bloch element.
- Adding a four-boundary changes the chain while preserving its homology image. Two witnesses over β need not have equal homology classes; their Quillen K₃ representatives differ by ker(K₃→B), including Milnor and enhanced-Tor contributions.
- The computational synthesis gap remains explicitly recorded.

**Imports.** [`K3BlochGroups:V.1/bar-cycle-model`](#v-1-bar-cycle-model), [`K3BlochGroups:V.1/k3-h3-steinberg`](#v-1-k3-h3-steinberg), [`K3BlochGroups:V.6/certificate-to-bar-cycle`](#v-6-certificate-to-bar-cycle), [`K3BlochGroups:V.6/comparison-integral`](#v-6-comparison-integral), [`K3BlochGroups:V.6/suslin-lift-fibre`](#v-6-suslin-lift-fibre), [`mathlib:Rep.trivial`](#baseline-mathlib-rep-trivial), [`mathlib:groupHomology.cycles`](#baseline-mathlib-grouphomology-cycles), [`mathlib:groupHomology.iCycles`](#baseline-mathlib-grouphomology-icycles), [`mathlib:groupHomology.π`](#baseline-mathlib-grouphomology--u3c0), [`mathlib:groupHomology.toCycles`](#baseline-mathlib-grouphomology-tocycles), [`mathlib:groupHomology.inhomogeneousChains.d`](#baseline-mathlib-grouphomology-inhomogeneouschains-d), [`mathlib:isZero_groupHomology_succ_of_subsingleton`](#baseline-mathlib-iszero-grouphomology-succ-of-subsingleton), [`mathlib:groupHomology.cyclesMk`](#baseline-mathlib-grouphomology-cyclesmk), [`mathlib:groupHomology_induction_on`](#baseline-mathlib-grouphomology-induction-on).

**Sources.** [KVI](#source-6-kvi) — VI.5.12, p29, together with the primary V.1 homological model; [HutchChern](#source-6-hutchchern) — §2.1, bar resolution and its differential, p2.

<a id="v-6-finite-coefficient-identification"></a>

### V.6.17: Good-prime finite-coefficient K₃ and étale Bloch identification

`K3BlochGroups:V.6/finite-coefficient-identification` · construction

Let F be a number field, p an odd prime, a≥1, n=p^a and p∤w₂(F). Use the imported finite-coefficient Quillen group K₃(F;ℤ/n), whose exact sequence is 0→K₃(F)/n --j_K→ K₃(F;ℤ/n) --∂_K→ K₂(F)[n]→0. Use the Habiro-owned CGZ étale Bloch group B_CGZ(F;ℤ/n), with its exact sequence 0→B_CGZ(F)/n --j_B→ B_CGZ(F;ℤ/n) --δ_B→K₂(F)[n]→0. The finite Chern isomorphism c̄₂,₁:K₃(F;ℤ/n)≅H¹(F,ℤ/n(2)) and the CGZ isomorphism R_ζ:B_CGZ(F;ℤ/n)≅H¹(F,ℤ/n(2)), transported through the same chosen twist/Kummer convention for a primitive n-th root ζ, give Φ_ζ=R_ζ⁻¹∘c̄₂,₁. In the additional range n prime to M_F of Habiro HB.1, write R_ζ∘κq=c_ζ^γ on K₃(F)/n using HB.2/the-comparison-with-the-chern-class. Then Φ_ζ∘j_K=j_B∘(γ⁻¹κq), with multiplicative powers interpreted as scalar multiplication on the additive target. No assertion δ_BΦ_ζ=∂_K is made without checking the right-hand normalization. In particular Φ is not asserted to extend the unscaled Suslin map.

**Hypotheses.** F a number field; n=p^a, p odd, a≥1 and p∤w₂(F). These hypotheses imply F has no primitive p-th root of unity and put the two imported isomorphisms in their stated ranges. c̄ uses the Soulé convention of M.8, and R_ζ uses the HB.2 twist convention. The equality on the modulo subgroup additionally uses n prime to M_F; γ is the unit from the existing HB comparison, without asserting a value here. The finite Chern isomorphism for number fields without adjoining μ_n is requested from M.7: use Hutchinson Theorem 2.10 and K₃^M(F)/n=0, not the narrower corollary requiring μ_n⊂F.

**Construction and proof.**

1. Import finite-coefficient K-theory and its universal coefficient sequence through HB.1/finite-coefficient-K3-and-the-chern-class. Import the finite Chern class and its compatibility with j_K from M.8.
2. Obtain the degree-three finite Chern isomorphism from M.7, with the odd-prime Milnor quotient zero by V.2/milnor-k3-number-field. The source proof input is Hutchinson Theorem 2.10, not an application of Corollary 2.11 over the wrong field.
3. Import both the étale Bloch object and R_ζ isomorphism from HB.2/etale-bloch-group-and-K2. Use only its number-field good-prime statement. It is not rebuilt in V.6.
4. Compose the inverse of R_ζ with the finite Chern isomorphism. For the modulo restriction, HB.1/hutchinson-chern-class-agrees identifies c̄j_K with c_ζ, and HB.2’s γ comparison gives the factor γ⁻¹.
5. Keep the right-end Bockstein normalization as a recorded gap. The exact sequences already show why ordinary quotient comparison does not remove K₂(F)[n].

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `finiteCoefficientBlochEquiv` | constructor | For genuine additive equivalences c:K≃H and r:E≃H, the resulting Φ:K≃E is r⁻¹c. For the field specialization, c is the supplied finite Chern equivalence and r is the supplied R_ζ equivalence. |
| `finiteCoefficientBlochEquiv_spec` | characterisation | r(Φ(x))=c(x), and Φ⁻¹(y)=c⁻¹(r(y)). The first equation uniquely characterizes Φ. |
| `finiteCoefficientBlochEquiv_def` | compatibility | The generic construction is exactly Mathlib’s AddEquiv composition c.trans r.symm. |
| `finiteCoefficientBlochEquiv_on_quotient` | relation | For n-torsion modules L,H, a linear map h₀:L→H, a unit γ∈ℤ/n, and inclusions j_K:L→K,j_B:L→E satisfying c j_K=h₀ and r j_B=γh₀, one has Φ j_K(x)=j_B(γ⁻¹x). This is the field restriction after L=K₃(F)/n is identified with B_CGZ(F)/n. |
| `finiteCoefficientBlochEquiv_natural` | functoriality | Given supplied equivalences c′:K′≃H′,r′:E′≃H′ and homomorphisms f:K→K′,g:E→E′,h:H→H′ with c′f=hc and r′g=hr, one has Φ′f=gΦ. Field-extension naturality uses exactly these supplied commuting comparisons in their common good-prime range. |

**Unit tests.**

- `finiteCoefficientBlochEquiv_mod_five` (computation): In K=E=H=ℤ/5, let c(x)=2x and r(x)=3x. Then Φ(1)=4. Reversing the equivalences gives the wrong answer.
- `finiteCoefficientBlochEquiv_zero` (degenerate): For K=E=H=ℤ/1 and any supplied equivalences, Φ(0)=0.
- `finiteCoefficientBlochEquiv_composition` (compatibility): For actual Mathlib additive equivalences c,r, Φ equals c.trans r.symm, including its inverse map c⁻¹r.
- `finiteCoefficientBlochEquiv_middle_not_left` (non-example): The exact sequence 0→0→ℤ/5→ℤ/5→0 has middle group not isomorphic to its left group: there is no additive equivalence ℤ/1≃ℤ/5. This tests the finite-coefficient K₂-term distinction in a finite model; the arithmetic acceptance instance is F=ℚ,n=5 and [32].

**Uses.**

- V.6’s finite-coefficient target and CGZ §6 equations (37)–(38): Constructs an identification of the actual finite-coefficient middle groups, using the two existing cohomology comparisons..
- HabiroNumberFields:HB.2/the-comparison-with-the-chern-class: Its quotient-subgroup restriction remembers the inverse comparison scalar, rather than silently identifying it with the raw Suslin map..

**Acceptance.**

- The prototype named finiteCoefficientBlochEquiv takes two genuine additive equivalences into the same group H and has R(Φ(x))=c(x), with inverse c⁻¹R. This tests the construction without inventing missing K-theory/cohomology types.
- The prototype named finiteCoefficientBlochEquiv_on_quotient requires the actual commutative equations c j_K=h₀ and R j_B=γh₀ and yields the γ⁻¹ factor.
- For F=ℚ,n=5, K₃(ℚ)/5=0, while HB.2’s class [32] has δ_B([32])={2,−31}≠0 with tame symbol 2 of order 5 at 31. Thus neither finite-coefficient middle group can be replaced by the ordinary quotient.
- No arbitrary-field comparison or good-prime extension at 2 is exported.

**Imports.** [`K3BlochGroups:V.6/comparison-finite-coefficients`](#v-6-comparison-finite-coefficients), [`K3BlochGroups:V.3/cgz-convention-comparison`](#v-3-cgz-convention-comparison), [`K3BlochGroups:V.2/milnor-k3-number-field`](#v-2-milnor-k3-number-field), [`HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class`](../packets/HabiroNumberFields.json), [`HabiroNumberFields:HB.1/hutchinson-chern-class-agrees`](../packets/HabiroNumberFields.json), [`HabiroNumberFields:HB.2/etale-bloch-group-and-K2`](../packets/HabiroNumberFields.json), [`HabiroNumberFields:HB.2/the-comparison-with-the-chern-class`](../packets/HabiroNumberFields.json), [`MotivicEtaleKTheory:M.7`](../packets/MotivicEtaleKTheory--M.5d.json), [`MotivicEtaleKTheory:M.8`](../packets/MotivicEtaleKTheory--M.5d.json), [`mathlib:MulEquiv.trans`](#baseline-mathlib-mulequiv-trans), [`mathlib:MulEquiv.symm`](#baseline-mathlib-mulequiv-symm), [`K3BlochGroups:V.3/cgz-published-comparison-map`](#v-3-cgz-published-comparison-map), [`K3BlochGroups:V.3/cgz-published-lemma-two-two`](#v-3-cgz-published-lemma-two-two).

**Sources.** [HutchChern](#source-6-hutchchern) — §2.3, Theorem 2.10 and the universal coefficient sequence, p4; [CGZ](#source-6-cgz) — §6, equations (37)–(38), pp32–33.

### V.6 closure requirements

**Effective five-term certificate to finite Steinberg bar cycle.** The parent proves existential surjectivity and this layer provides finite-chain witnesses and a classical choose API. Neither the read VI.5.12 proof nor the circular-unit remark gives an executable procedure which takes a finite boundary/equality certificate and outputs z∈C₃(St(F),ℤ), a checked d₃z=0 and ψπz=β. Establish and source the chain-level lifting construction with its auxiliary choices and termination/range hypotheses; do not describe classical choose as the requested algorithm.

Consumers: [`K3BlochGroups:V.6/bar-lift-witness`](#v-6-bar-lift-witness).

**Right-end normalization of the finite-coefficient comparison.** The two good-prime isomorphisms yield Φ=R_ζ⁻¹c̄ and determine its scaled restriction to K₃/n in the M_F range. Identify the map δ_BΦ on K₂(F)[n] against the K-theory Bockstein ∂_K and Tate’s degree-two Chern map in the exact convention. CGZ equation (38) by itself is not a license to set the scalar to 1 after importing the separately normalized Soulé map. The required degree-two compatibility is requested from M.8.

Consumers: [`K3BlochGroups:V.6/finite-coefficient-identification`](#v-6-finite-coefficient-identification).

**Inherited degree-three Hurewicz input for the stable Steinberg model.** The witness API uses V.1/k3-h3-steinberg, its two-connected Hurewicz comparison and the H.1 bar/singular comparison. Their supplier proof boundaries remain those of V.1. The exact upstream Hurewicz and covering citations are identified there; no second topology development belongs to V.6.

Consumers: [`K3BlochGroups:V.6/bar-lift-witness`](#v-6-bar-lift-witness).

**Regulator normalization and local decomposables.** P.2/R.7 must supply the exact real scalar and sign; D.2 must supply the syntomic/étale and p-adic dilogarithm normalization and either local Milnor K₃/pᵐ vanishing or a proof that the regulator kills decomposables. These requirements belong to `V.6/regulator-agreement` and `V.6/regulator-agreement-padic`. The finite Chern isomorphism and reduction/twist compatibilities are the M.7/M.8 requests, rather than consequences of an abstract equivalence.

## Source register

Source IDs are local to their packet; the prefix **primary** or **V.i** disambiguates them. Checksums and the complete record of inspected sections are retained in the linked packets. Repeated chapter IDs use the same public chapter with the locators specified at each target.

### primary sources

<a id="source-0-kbook-2013"></a>

**primary/Kbook.2013.** Charles A. Weibel, [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). Author-hosted combined draft dated 29 August 2013 (the version published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013). Internal numbering (chapter.section.item) is quoted; PDF page numbers are given where they help..

Source coverage: IV.1.12-IV.1.20 with Exercises IV.1.8, IV.1.9 and IV.1.12 (PDF pp. 277-282); VI.1.4-VI.1.5.1 (PDF p. 474); VI.2.1-VI.2.1.3 (PDF p. 478); VI.4.1-VI.4.3.2 (PDF pp. 487-488); VI.5 in full: 5.1-5.20 and the proof of 5.2 (PDF pp. 495-507).

<a id="source-0-cgz-2018"></a>

**primary/CGZ.2018.** Frank Calegari, Stavros Garoufalidis and Don Zagier, [Bloch groups, algebraic K-theory, units, and Nahm's conjecture](https://arxiv.org/abs/1712.04887). arXiv:1712.04887v3.

Source coverage: 1.1 Bloch groups and associated units, with Definition 1.1 and its remarks; 2.5 The 5-term relation, Theorem 2.11; 4.2 The Bloch group of F_q; Lemma 4.4 and Corollary 4.5.

<a id="source-0-kbook-iii-chapter"></a>

**primary/Kbook.III.chapter.** Charles A. Weibel, [Weibel, K-book chapter III, separately hosted author chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf). Separately hosted author chapter downloaded 2026-09-30; checksum and chapter-PDF pagination distinguish it from the earlier combined draft..

Source coverage: PDF pp.61–62: III.7.2–7.3, global Milnor groups.

<a id="source-0-kbook-vi-chapter"></a>

**primary/Kbook.VI.chapter.** Charles A. Weibel, [Weibel, K-book chapter VI, separately hosted author chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf). Separately hosted author chapter downloaded 2026-09-30; checksum and chapter-PDF pagination distinguish it from the earlier combined draft..

Source coverage: PDF p.20: VI.4.7, all three Geisser–Levine conclusions; PDF pp.23–24: VI.5.1–5.3, infinite-field scope of Theorem 5.2; PDF pp.37–39: VI.6.1–6.7, Harder and geometric/descent computation.

<a id="source-0-hutchinson-1107-0264v2"></a>

**primary/Hutchinson.1107.0264v2.** Kevin Hutchinson, [Hutchinson, A Bloch–Wigner complex for SL₂ (v2)](https://arxiv.org/pdf/1107.0264v2). 1107.0264v2; arXiv preprint, not a separately inspected published edition..

Source coverage: PDF pp.14–15: Corollaries 3.6–3.9 and their comparison maps; PDF p.33: cyclic bar-cycle formula; PDF pp.34–36: Lemmas 7.1–7.4, Corollary 7.5 with proof and §7.6.

[Edition, checksum and locator record](../packets/K3BlochGroups.json).

### V.1 sources

<a id="source-1-kbook-iv-author"></a>

**V.1/Kbook-IV-author.** Charles A. Weibel, [The K-book, Chapter IV: Definitions of higher K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf). Author-hosted standalone chapter, fetched 2026-10-05; chapter page numbers IV.1–IV.93.

Source coverage: IV.1, Definition 1.1 and Functoriality 1.1.2; IV.1, Lemma 1.19, Remark 1.19.1, Corollary 1.20, IV.13–14; IV.1, Exercises 1.8–1.12 and 1.25, IV.14–17; IV.4, Example 4.9.2, Theorem 4.9.3 and Example 4.10.1, IV.43–44.

<a id="source-1-hatcher-at-author"></a>

**V.1/Hatcher-AT-author.** Allen Hatcher, [Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf). Author-hosted book PDF, fetched 2026-10-05.

Source coverage: Section 4.2, Examples 4.49–4.52, printed pp.380–381; Section 4.2, Exercise 37, printed p.392.

[Edition, checksum and locator record](../packets/K3BlochGroups--V.1.json).

### V.2 sources

<a id="source-2-bt1973"></a>

**V.2/BT1973.** Hyman Bass and John Tate, [The Milnor ring of a global field](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf). LNM 342 (1973), entire volume scan; only the recorded paper sections were read..

Source coverage: Chapter II §§1–2, printed pp.393–402, especially Theorem (2.1)(3) and its complete proof; finiteness input at Corollary (1.2)..

<a id="source-2-kiii"></a>

**V.2/KIII.** Charles A. Weibel, [The K-book, chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf). Separately hosted author chapter; checksum fixes the inspected version and chapter-PDF pagination..

Source coverage: III.7.1–7.3, chapter PDF pp.61–62; III.7.7–7.8, pp.66–68 including the proof of Izhboldin’s theorem..

<a id="source-2-kv"></a>

**V.2/KV.** Charles A. Weibel, [The K-book, chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf). Separately hosted author chapter; checksum fixes the inspected version and chapter-PDF pagination..

Source coverage: V.11.3 and its proof, pp.81–82; V.11.11, V.11.13 and proof of V.11.11, pp.85–87..

<a id="source-2-kvi"></a>

**V.2/KVI.** Charles A. Weibel, [The K-book, chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf). Separately hosted author chapter; checksum fixes the inspected version and chapter-PDF pagination..

Source coverage: VI.1.1–1.6, pp.1–5, rigidity, comparison and algebraically closed fields; VI.4.1–4.3.2, pp.15–18, including the integral injectivity proof; VI.5 opening and Lemma 5.3, pp.23–24..

[Edition, checksum and locator record](../packets/K3BlochGroups--V.2.json).

### V.3 sources

<a id="source-3-bloch2000"></a>

**V.3/Bloch2000.** Spencer Bloch, [Higher Regulators, Algebraic K-Theory, and Zeta Functions of Elliptic Curves](https://dokumen.pub/higher-regulators-algebraic-k-theory-and-zeta-functions-of-elliptic-curves-0821821148.html). CRM Monograph Series 11, AMS (2000), DOI 10.1090/crmm/011; book text in a public HTML mirror.

Source coverage: Lecture 6 §6.1, p. 43, equation (6.1.2); Lecture 7 §7.2, pp. 51–54; Lecture 7 §7.4, pp. 57–60, especially Lemma 7.4.3.

<a id="source-3-goncharov1995"></a>

**V.3/Goncharov1995.** Alexander B. Goncharov, [Geometry of configurations, polylogarithms, and motivic cohomology](https://sasha-goncharov.github.io/Advances1995.pdf). Advances in Mathematics 114 (1995), 197–318; DOI 10.1006/aima.1995.1045; author-hosted published scan.

Source coverage: Introduction pp. 202–204: reduced generators and generic cross-ratios; §1.8 pp. 217–219: the weight-two boundary and the wedge convention; §1.9 pp. 221–225: smooth-curve specializations and Conjecture 1.20; §2.3 pp. 253–255: generic cross-ratio five-term presentation.

<a id="source-3-goncharov1991"></a>

**V.3/Goncharov1991.** Alexander B. Goncharov, [Geometry of configurations, polylogarithms, and motivic cohomology (preprint)](https://archive.mpim-bonn.mpg.de/916/1/preprint_1991_64.pdf). MPIM preprint 1991-64; search aid, locators verified against the published scan where used.

Source coverage: §§1.8–1.9 and 2.3: searchable counterpart of the published passages.

<a id="source-3-cgz2023"></a>

**V.3/CGZ2023.** Frank Calegari, Stavros Garoufalidis, Don Zagier, [Bloch groups, algebraic K-theory, units, and Nahm’s conjecture](https://www.math.uchicago.edu/~fcale/papers/CGZ.pdf). Annales scientifiques de l’École normale supérieure 56 (2023), 383–426; DOI 10.24033/asens.2537; published author PDF.

Source coverage: Definition 1.1 and equations (1)–(4), pp. 384–385; §2.1 pp. 390–392, Definition 2.1, equation (21), Lemma 2.2 and proof; Acknowledgements: correction of the earlier definition.

[Edition, checksum and locator record](../packets/K3BlochGroups--V.3.json).

### V.4 sources

<a id="source-4-su84"></a>

**V.4/Su84.** А. А. Суслин (A. A. Suslin), [Гомологии GLₙ, характеристические классы и K-теория Милнора](https://www.mathnet.ru/links/f1b6f2237fb5532fea1b7116cb2dacc9/tm2280.pdf). Trudy Mat. Inst. Steklov. 165 (1984), 188–204; Russian version of record. Numbering and printed pages refer to this edition, not the separate Springer stability paper..

Source coverage: §1 pp188–191, especially 1.1–1.9; §2 pp191–196, independent-vector complexes, presentation and products; §3 pp196–198, spectral sequence and Theorem 3.4; formulas visually checked on scan pages6–11.

<a id="source-4-su91"></a>

**V.4/Su91.** A. A. Suslin, [K₃ of a field, and the Bloch group](https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf). Proc. Steklov Inst. Math. 183 (1991), 217–239; public scan of the English translation..

Source coverage: §2 pp221–223, visually read scan pages5–7; Lemma2.4 explicitly omits its computation; §5 pp233–239, OCR then critical formulas visually checked on p236; Lemmas5.5–5.8 and Theorem5.2.

<a id="source-4-kv"></a>

**V.4/KV.** Charles Weibel, [The K-book, Chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf). Author public chapter; printed chapter page numbers..

Source coverage: §11 Definition11.5, Examples11.9–11.10, Lemma11.10.1; Exercise11.5 p89; §11 Finite coefficients11.3.2 p82, finite-coefficient Chern product-rule restriction.

<a id="source-4-kvi"></a>

**V.4/KVI.** Charles Weibel, [The K-book, Chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf). Author public chapter; printed chapter page numbers..

Source coverage: §1 Corollary1.3.1 and Proposition1.4; §2 Definition2.1; §5 Lemma5.19 and Corollary5.20 pp34–35; adjacent configuration and stability discussion; §1 Definition1.7 and Proposition1.7.1, weight-two Tate action and finite Bott proof.

<a id="source-4-kiv"></a>

**V.4/KIV.** Charles Weibel, [The K-book, Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf). Author public chapter; printed chapter page numbers..

Source coverage: §2 pp19–21, finite coefficients, Bott elements, Proposition2.7 and products2.8; used to check the product-scope cross-reference.

[Edition, checksum and locator record](../packets/K3BlochGroups--V.4.json).

### V.5 sources

<a id="source-5-hutch"></a>

**V.5/Hutch.** Kevin Hutchinson, [A Bloch–Wigner complex for SL₂](https://arxiv.org/pdf/1107.0264v2). arXiv:1107.0264v2; published Journal of K-Theory 12(1) (2013), 15–68, DOI 10.1017/IS013003031JKT13222. All mathematical locators here refer to the preprint..

Source coverage: §3, especially Corollaries 3.6–3.9 and Lemma 3.14; §4 Theorem 4.3; §6.3–6.4 chain and cyclic formulas; §7 Lemmas 7.1–7.4 and Corollary 7.5.

<a id="source-5-cgz"></a>

**V.5/CGZ.** Frank Calegari, Stavros Garoufalidis, Don Zagier, [Bloch groups, algebraic K-theory, units, and Nahm’s Conjecture](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf). Ann. Sci. ENS 56 (2023), 383–426; printed author copy.

Source coverage: §4.2 pp406–407; §4.3 Lemma 4.4 p407; compare arXiv v3.

<a id="source-5-kiii"></a>

**V.5/KIII.** Charles Weibel, [The K-book, Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf). Author’s public chapter, Higher K-Theory; Examples III.7.2.

Source coverage: III.7.2(a), (c), (d) pp61–62.

<a id="source-5-kiv"></a>

**V.5/KIV.** Charles Weibel, [The K-book, Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf). Author’s public chapter; Corollary IV.1.13.

Source coverage: IV.1.13 and 1.13.1 p10.

<a id="source-5-kvi"></a>

**V.5/KVI.** Charles Weibel, [The K-book, Chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf). Author’s public chapter; Algebraic K-Theory of Fields.

Source coverage: VI.2.1.2 pp7–8; VI.5.1–5.3 pp23–25.

<a id="source-5-suslin"></a>

**V.5/Suslin.** A. A. Suslin, [K₃ of a field, and the Bloch group](https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf). Proc. Steklov Inst. Math. 183 (1991), 217–239; scanned public copy.

Source coverage: §1 pp219–220, Lemmas 1.4–1.6 and Proposition 1.1; visually read scan pages3–4.

<a id="source-5-zagier"></a>

**V.5/Zagier.** Don Zagier, [The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf). Frontiers in Number Theory, Physics, and Geometry II (2007).

Source coverage: II.1.A pp23–24, Rogers normalization and real extension.

[Edition, checksum and locator record](../packets/K3BlochGroups--V.5.json).

### V.6 sources

<a id="source-6-kvi"></a>

**V.6/KVI.** Charles Weibel, [The K-book, Chapter VI: Algebraic K-Theory of Fields](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf). Public separately hosted chapter; theorem hypotheses follow this copy, not another edition..

Source coverage: VI §5, Definition 5.1 and Theorem 5.2, pp23–24; VI §5, construction of ψ, Lemma 5.10 and Proposition 5.12, pp28–29.

<a id="source-6-cgz"></a>

**V.6/CGZ.** Frank Calegari, Stavros Garoufalidis, Don Zagier, [Bloch groups, algebraic K-theory, units, and Nahm’s Conjecture](https://arxiv.org/pdf/1712.04887v3). arXiv:1712.04887v3 (2021); all page numbers here refer to this version..

Source coverage: §1.2, equations (14)–(15) and Theorems 1.6–1.7; §2.1, the convention comparison; §3.1–3.3, Chern classes and the excluded roots of unity; §6, equations (35)–(38) and the final circular-unit paragraph, pp31–33.

<a id="source-6-hutchchern"></a>

**V.6/HutchChern.** Kevin Hutchinson, [The Chern class for K₃ and the cyclic quantum dilogarithm](https://arxiv.org/pdf/2104.14413v4). arXiv:2104.14413v4, 27 March 2024; standing N odd..

Source coverage: §1, standing hypotheses and the comparison scalar; §2.1, bar convention and Lemma 2.1; §2.2, Theorem 2.8 and Corollary 2.9; §2.3, universal coefficient sequence, Theorem 2.10, Corollary 2.11 and definition of c_ζ.

<a id="source-6-cgzpublished"></a>

**V.6/CGZPublished.** Frank Calegari, Stavros Garoufalidis, Don Zagier, [Bloch groups, algebraic K-theory, units, and Nahm’s Conjecture](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf). Author-hosted printed copy, Annales Scientifiques de l’École Normale Supérieure 56 (2023), 383–426, doi:10.24033/asens.2537..

Source coverage: §6, p415, equation (38) and the following completion of the proof of Theorem 1.7; collated against arXiv v3 p32..

[Edition, checksum and locator record](../packets/K3BlochGroups--V.6.json).

## Source qualifications

The following qualifications distinguish source statements from the theorem forms above. They specify the affected hypotheses, signs or convention; they are not additional theorem targets.

**primary/K3BlochGroups/E1.** ; The K-book, author-hosted draft of 29 August 2013, Theorem VI.5.7 (PDF p. 498). The parenthetical note is the author's own, flagging a typographical error in the published Graduate Studies in Mathematics printing of the same theorem. A reader working from the published book should take the statement in the form given in this draft: the first homology of the group of invertible two by two matrices is the units of the field, the second homology is the direct sum of the exterior square of the units and K_2 of the field, and the displayed sequence from the third homology of the monomial subgroup through the third homology of the general linear group onto the Bloch group is exact. (the corrected form itself holds only for infinite F; for F₄, H₂(GL₂(F₄), ℤ) ≅ ℤ/2 while ∧²F₄× ⊕ K₂(F₄) = 0, recorded separately.)

**primary/K3BlochGroups/E2.** ; Ex. III.5.7, PDF p. 237 (printed p. 229), author-hosted draft of 29 August 2013. Add the hypothesis that X is perfect (as when X is a universal central extension, by Lemma III.5.3.2).

**primary/K3BlochGroups/E3.** ; Proof of Corollary IV.1.20, PDF p. 281 (printed p. 273). X = BGL(R)⁺; likewise 'the map π3(S2) → K1(Z) sends η to [−1]' refers to the stable class η ∈ πs1 of Ex. IV.1.12(a).

**primary/K3BlochGroups/E4.** ; Before Lemma IV.1.19, PDF p. 280 (printed p. 272), and Remark IV.1.19.1, PDF p. 281. The weight-two products run over pairs i < j, and Y′′ is 2-connected.

**primary/K3BlochGroups/E5.** ; Ex. IV.1.9, PDF p. 282 (printed p. 274). Drop πn(BG+) (G is not introduced in the exercise; read it as in Ex. IV.1.8 with P ⊴ G), and read πnBSt(R)+.

**primary/K3BlochGroups/E6.** ; Proof of Proposition VI.4.3.2, PDF p. 490 (printed p. 482). For char k = p > 2 cite Corollary VI.1.3.1(i) (PDF p. 473), which gives the divisibility in positive characteristic.

**primary/K3BlochGroups/E7.** ; Corollary VI.5.3, PDF p. 496 (printed p. 488). r_2 is the number of complex places (pairs of complex-conjugate embeddings), as the preceding sentence ('the number of factors of R and C in the R-algebra F ⊗Q R') fixes.

**primary/K3BlochGroups/E8.** ; III.5.3, PDF p. 226 (printed p. 218). Central extensions of G by A are classified by H²(G; A), as the text states on the next page.

**primary/K3BlochGroups/E9.** ; The K-book, author-hosted draft of 29 August 2013, the sentence before Lemma VI.5.4 and Lemma VI.5.4(c), PDF p. 496. ⟨x⟩ lies in P(F), with ∂⟨x⟩ = x ∧ (−x). The homomorphism is Fˣ → P(F), and its image is 2-torsion. ⟨x⟩ ∈ B(F) if and only if x ∧ (−x) = 0 in ∧̃²Fˣ, e.g. for x = −1.

**primary/K3BlochGroups/E10.** ; The K-book, author-hosted draft of 29 August 2013, Corollary VI.5.4.1, PDF p. 497. Read '∛−1 ∈ F' as 'F contains a root of t² − t + 1' (a primitive sixth root of unity, or −1 in characteristic 3). Then c = ⟨ζ⟩ and 2c = 0.

**primary/K3BlochGroups/E11.** ; The K-book, author-hosted draft of 29 August 2013, proof of Lemma VI.5.4, PDF p. 497. Choose x ∉ {0, 1, z^{-1}}, which exists because |F| ≥ 4; then y = zx is admissible with y ≠ x.

**primary/K3BlochGroups/E12.** ; Calegari–Garoufalidis–Zagier, arXiv:1712.04887v3, Definition 2.1 (p. 8) and the remark after Definition 1.1 (p. 2). The group CGZ call Suslin's uses the exterior square as target, whereas the K-book (VI.5.1, following Suslin) uses the antisymmetric quotient ∧̃²Fˣ. The quotient statement holds for CGZ's B̃(F) but not for the K-book's B(F), which maps to CGZ's group with kernel and cokernel both elementary abelian 2-groups.

**primary/K3BlochGroups/E13.** ; Calegari–Garoufalidis–Zagier, arXiv:1712.04887v3, Definition 1.1 and the remark after it, p. 2. Take C(F) := A(F) ∩ ⟨ξ_{X,Y}⟩, i.e. B(F) = the image of A(F) in Z(F)/⟨ξ⟩. The remark '[X] + [1/X] = 0 in B(F) for all X' is then meaningful only for X with X ∧ (−1) = 0.

**primary/K3BlochGroups/E14.** ; Calegari–Garoufalidis–Zagier, arXiv:1712.04887v3, Lemma 2.2, p. 9. Assume |F| ≥ 4. The kernel is B̃(F) ∩ ⟨Fˣ⟩, where ⟨Fˣ⟩ is the image of x ↦ ⟨x⟩ in P(F); ⟨X⟩ itself lies in B̃(F) only when X ∧ (−1) = 0.

**primary/K3BlochGroups/E15.** ; The K-book, author-hosted draft of 29 August 2013, Exercise VI.5.3, PDF p. 508. For F_7: c = 2[4] = 2[−1] (and [4] = −[−1]).

**primary/K3BlochGroups/E16.** ; The K-book, author-hosted draft of 29 August 2013, Exercise VI.5.4(c), PDF p. 508. (c) char(F_q) > 3 and q ≡ 1 (mod 12).

**primary/K3BlochGroups/E17.** ; The K-book, author-hosted draft of 29 August 2013, Theorem VI.5.7 (PDF p. 498); published GSM 145, p. 540. For all infinite F. The H_2 formula fails for F = F_4 (and H_1 fails for F_2, which Remark 5.1.1 excludes).

**primary/K3BlochGroups/E18.** ; The K-book, draft of 29 August 2013, Theorem VI.5.2 (PDF p. 495) with its proof (PDF p. 507), and Remark VI.5.1.1 (PDF p. 495). The printed proof establishes the sequence for infinite F only. The finite-field case, and with it Remark 5.1.1's orders of B(F_q), needs a separate proof.

**primary/K3BlochGroups/E19.** ; The K-book, draft of 29 August 2013, paragraph after Theorem VI.5.7 (PDF p. 498). the stabilizer of (0, ∞, 1) is the centre ∆ = {(a, a)} of GL2(F)

**primary/K3BlochGroups/E20.** ; The K-book, draft of 29 August 2013, proof of Lemma VI.5.6 (PDF p. 498) and before Lemma VI.5.10 (PDF p. 501). The stabilisers of these tuples are the centre F×·1, so the modules are sums of permutation modules induced from the centre, not free; their coinvariants are free abelian on the listed generators, which is all the computation uses.

**primary/K3BlochGroups/E21.** ; The K-book, draft of 29 August 2013, 'A cyclic homology construction' (PDF p. 499) and Exercise VI.5.6(a) (PDF p. 508). C∗(X) is the subcomplex of injective tuples in the chain complex of eC(X); it is closed under faces and rotations but not under degeneracies (a precyclic abelian group), and it is not the Dold–Kan complex of eC(X). The acyclicity of the complex that omits the last face must be proved by the prepending homotopy for infinite X, not by the extra degeneracy of a cyclic set.

**primary/K3BlochGroups/E22.** ; The K-book, draft of 29 August 2013, Definition VI.5.9 (PDF p. 500). N = Σ_{i=0}^{n} ((−1)^n t_n)^i, with t_n the rotation of Ex. 5.6(b). The two agree for odd n. In the same definition, '∂i tn = tn ∂i−1' should read t_{n−1}.

**primary/K3BlochGroups/E23.** ; The K-book, draft of 29 August 2013, construction of ψ before Lemma VI.5.10 (PDF p. 501). ψ′([a x]) = [a], the cross-ratio of the projection from p3; N(P) = 0, not N([a x]) = 0 (N[a x] is a sum of five generators); and with the displayed cone differential (x, y) ↦ (dax − Ny, −dy), ψ′ vanishes on d(0, [a x]) = (−N[a x], −P) only if ψ′(P) = −2c.

**primary/K3BlochGroups/E24.** ; The K-book, draft of 29 August 2013, proof of Lemma VI.5.11 (PDF p. 501). p2 = (0 : 1 : 0), as defined on p. 500; (0 : 0 : 1) is p3

**primary/K3BlochGroups/E25.** ; The K-book, draft of 29 August 2013, proof of Lemma VI.5.14 (PDF p. 503) and Exercise VI.5.5 (PDF p. 508). f2(1) = (∞, 0, x) + (1, ∞, x) + (0, 1, x). The last two terms are [(x − 1)/(xy)] and [y/((1 − x)(y − 1))]. The choice needs x ≠ 2 as well (otherwise y = w). The expression becomes −[x²] − 2[−x^{−1}] + 2[x − 1] + [(1 − x)^{−2}], and Ex. 5.5's second identity should read [x²] + 2[−x^{−1}] − 2[x − 1] − [(1 − x)^{−2}] = 2c.

**primary/K3BlochGroups/E26.** ; Remark VI.5.6.1 (PDF p. 498), in the author-hosted draft of 29 August 2013. The proof goes through for all finite fields with at least four elements, since then |P¹(F)| ≥ |P¹(F_4)| = 5 > n + 1 for n ≤ 3, which is what Exercise VI.5.1 needs.

**primary/K3BlochGroups/E27.** ; Lemma 4.4 and its proof, pp. 24-25, arXiv:1712.04887v3. The left vertical isomorphism B(F)/nB(F) ≅ K_3(F)/nK_3(F) needs µ(F) ⊗ Z/p = 0, i.e. ζ_p ∉ F; this holds under the hypothesis ζ ∉ F̃(ζ + ζ^{−1}) of Proposition 4.2 and under Theorem 1.2's hypothesis.

**primary/K3BlochGroups/E28.** ; Corollary 4.5 and its proof, p. 25, arXiv:1712.04887v3. The proof applies under the hypothesis of Proposition 4.2, ζ ∉ F̃(ζ + ζ^{−1}); the corollary should carry it.

**primary/K3BlochGroups/E29.** ; §4.2, p. 23, arXiv:1712.04887v3. The part of H_3(SL_2(F_q), Z) prime to q is cyclic of order q² − 1; the whole group has additional q-primary torsion.

**primary/K3BlochGroups/E30.** ; The K-book, author-hosted draft of 29 August 2013, paragraph 5.8.2 in the proof of Theorem VI.5.7, PDF p. 499. Integrally H_n(T₂) ≅ ⊕_{i+j=n} H_i(Fˣ) ⊗ H_j(Fˣ) ⊕ ⊕_{i+j=n−1} Tor₁^ℤ(H_i(Fˣ), H_j(Fˣ)). The Tor summand vanishes for n ≤ 2, the degree the proof computes (H₂(T₂)_σ ≅ ∧²Fˣ ⊕ ∧̃²Fˣ); for n = 3 it contains Tor₁^ℤ(Fˣ, Fˣ) ≅ Tor₁^ℤ(μ(F), μ(F)), which is nonzero whenever F has a nontrivial root of unity.

**V.1/K3BlochGroups/E31.** Kbook-IV-author; Author-hosted standalone Chapter IV, Exercise 1.25, IV.17 (PDF page 17), fetched 2026-10-05. The displayed exact sequence does not follow from X,Y,F simply connected alone. Add H₃(Y;ℤ)=0. Equivalently use the sufficient corrected map formulation: X,Y simply connected CW-type, π₂(f) surjective, H₃(Y)=0. This formulation applies to Y=∨S² in the elementary H-space proof.

**V.2/K3BlochGroups/E31.** KV; Author-hosted Kbook.V.pdf, proof of V.11.11, chapter PDF p.87, localization display in the Whitney-sum argument. This finding concerns the inspected author copy only.. Replace P(F″) in the first term by P(F′). The weight n′ is already correct because n=n′+n″. The last term remains P(F″), identified with the complement by homotopy invariance.

**V.2/K3BlochGroups/E32.** KVI; Author-hosted Kbook.VI.pdf, proof of Corollary VI.5.3, chapter PDF p.24, first paragraph after the integral exact sequence. This finding concerns the inspected author copy only.. The coefficient connecting map has target H¹(F,Z(2))[m], equal here to H¹(F,Z(2))_tors because m is a multiple of its finite torsion order. The consequence is (K₃^ind(F))_tors ≅ Z/w, while the full group retains its free Z^{r₂} summand.

**V.3/K3BlochGroups/E101.** CGZ2023; CGZ published 2023, §2.1, p. 391, Lemma 2.2 (field unrestricted in the statement). Assume |F|≥4 for the stated surjection with 2-torsion kernel. Here B̃ denotes the published modified group, not the older exterior group. Its exact kernel is B(F)∩H.

**V.3/K3BlochGroups/E102.** Goncharov1995; Goncharov 1995 §1.9, p. 222, equation (1.25a), read together with p. 224 Corollary 1.19. When the left side is rationalized, rationalize the quotient on the right as well: ℚ[P¹(F)]/𝓡_p(F)_ℚ.

**V.3/K3BlochGroups/E103.** Goncharov1995; Published Goncharov 1995 §1.8 p. 217 (arbitrary field), §1.9 p. 225 Conjecture 1.20, with the literal reduced five-tuple presentation on p. 218. The equality cannot include F₃ with the literal generic five-tuple relations: G₂^gen(F₃)⊗ℚ≅ℚ but G₂^curv(F₃)=0. A comparison-isomorphism formulation must exclude this field or use an explicitly changed small-field presentation. For fields with at least four elements, injectivity remains unestablished in the cited source decomposition; no correction here asserts that general equality.

**V.3/K3BlochGroups/E104.** Goncharov1995; Goncharov 1995 §1.9, p. 221, sentence after the definition of A_p(F); weight p=2 with the antisymmetric wedge convention on p. 218. At weight two the inversion sum is a rational cycle; integrally its boundary may be nonzero 2-torsion. Twice that sum is an integral cycle. Do not assert that the unmultiplied integral sum belongs to A₂(F).

**V.4/K3BlochGroups/E-V4-1.** KV; Exercise11.5 p89, author public Chapter V copy with the recorded hash; finding scoped to that copy. For ρ=λ⊕λ⁻¹ the formula is c₂(ρ)=−c₁(λ)². The exercise’s isomorphism conclusion is unchanged.

**V.4/K3BlochGroups/E-V4-2.** Su91; Lemma2.4 p222, public English published scan. Supply the bar-chain calculation with the displayed d³ signs and the parent spectral-sequence indexing. No contrary statement or false theorem is alleged.

**V.4/K3BlochGroups/E-V4-3.** KVI; §1 p5, paragraphs immediately preceding Definition1.7; recorded public author Chapter VI and dated full author copy, scoped to those copies. In characteristic p the cyclotomic image is the closed procyclic subgroup generated by p in the prime-to-p root automorphism group. Surjectivity onto Aut(µ) is true in characteristic zero but fails in positive characteristic. The subsequent weight-i action is still defined using actual field automorphisms.

**V.4/K3BlochGroups/E-V4-4.** KVI; Lemma5.19 proof p34, product-rule invocation at m≡0 mod4; recorded public author copies. The cited general finite-coefficient product rule KV11.3.2 p82 covers odd m or 8|m. At m=4 (or m≡4 mod8) the proof needs an additional special Bott argument or compatible coefficient change. For detector injectivity use the sufficient cofinal range of odd moduli and 8-divisible moduli.

**V.4/K3BlochGroups/E-V4-5.** KIV; Proposition2.7 and final line of its proof, p21; recorded public author Chapter IV and dated full author copy. The second coefficient is Z/q₂. The preceding displayed wedge and mapping-group formula already use q₂ correctly.

**V.5/K3BlochGroups/E501.** CGZ; Published 2023 author copy, §4.2 p406, second paragraph; same assertion in arXiv1712.04887v3 §4.2.. The always-valid cyclic computation is H₃(SL₂(Fq),Z[1/ℓ])≅Z/(q²−1), with ℓ=char(Fq). Integral H₃ has an additional Z/ℓ for q=2,3,4,5,8,9,27. In the paper’s odd-prime scope q=3,5 already contradict the integral order. Its tensor comparison for n=pᵐ, p>2 and q≡−1 modn is unchanged, because p≠ℓ.

**V.5/K3BlochGroups/E502.** CGZ; Published 2023 §4.2 p406, displayed C¹=H₃(C¹,Z) and following canonical-identification discussion.. There is an abstract cyclic-group isomorphism after choosing a generator, not an identification natural for all automorphisms of C¹. Use the actual homology of the Cartan inclusion and specify the cyclic bar class separately. Also distinguish n-torsion from the quotient modulo n when labelling primitive-root classes.

**V.5/K3BlochGroups/E503.** Hutch; §3 proof of Corollary3.3, arXiv1107.0264v2 p12 (also institutional repository copy p12).. Replace mod3 by mod4.

**V.5/K3BlochGroups/E504.** Hutch; §3 proof of Corollary3.13, arXiv1107.0264v2 p17 (also institutional repository copy p17).. Delete not: a nonzero fixed vector exists exactly when1 is an eigenvalue.

**V.5/K3BlochGroups/E505.** Hutch; Institutional repository author copy, proof of Lemma3.14 p18; compare arXiv1107.0264v2 p18.. The intended reference is Corollary3.13.

**V.6/K3BlochGroups/E-V6-1.** CGZPublished; §6, printed p415, sentence immediately after equation (38), completing the proof of Theorem 1.7. The same omission occurs in arXiv:1712.04887v3, §6, p32, after equation (36).. Q/nR ≃ K₂(F)[n]. Insert the n-torsion brackets on the right.

**V.6/K3BlochGroups/E-V6-2.** CGZPublished; §6, printed p415, paragraph defining δ after the proof of Theorem 1.7; also arXiv:1712.04887v3, §6 p32, the same paragraph.. image of x. Here x is the lifted symbol class, whose boundary is divisible by n; z is introduced only in the next sentence as the projection of y to K₂(F).

## Pinned declaration register

These declarations supply reusable carriers or stated library facts; they do not supply the new comparisons. Additive names generated by `to_additive` are identified in the packet records.

<a id="baseline-mathlib-grouphomology"></a>

**`mathlib:groupHomology`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). groupHomology A n : ModuleCat k, the n-th homology of inhomogeneousChains A, for a k-linear representation A : Rep k G, in every degree. Integral homology with trivial coefficients, H_n(G, ℤ), is groupHomology (Rep.trivial ℤ G ℤ) n. The file fixes {k G : Type u} and A : Rep.{u} k G, so over ℤ the group must live in Type: St(A), GL(F) and their subgroups are then groups of a ring or field in Type. There is no hyperhomology with coefficients in a complex of representations; V.4/hyperhomology-map constructs it.

<a id="baseline-mathlib-grouphomology-inhomogeneouschains"></a>

**`mathlib:groupHomology.inhomogeneousChains`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). The complex with C_n = (Fin n → G) →₀ A and differential inhomogeneousChains.d (Basic.lean:127): a·(g_0,…,g_n) ↦ ρ(g_0⁻¹)a·(g_1,…,g_n) + Σ_j (−1)^{j+1} a·(contractNth j g). With trivial coefficients this is the bar complex on [g_1|…|g_n]; the carrier of every explicit bar cycle here.

<a id="baseline-mathlib-grouphomology-cycles"></a>

**`mathlib:groupHomology.cycles`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). cycles A n := (inhomogeneousChains A).cycles n, an object of ModuleCat k (a kernel, not a submodule of the chains). Elements are built with groupHomology.cyclesMk (Basic.lean:203) and mapped to homology by groupHomology.π (Basic.lean:235).

<a id="baseline-mathlib-grouphomology-chainsiso-u2083"></a>

**`mathlib:groupHomology.chainsIso₃`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean). (inhomogeneousChains A).X 3 ≅ ModuleCat.of k (G × G × G →₀ A); for A = ℤ with trivial action this is the free ℤ-module on G³.

<a id="baseline-mathlib-grouphomology-d-u2083--u2082"></a>

**`mathlib:groupHomology.d₃₂`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean). The differential out of degree three in the coordinates of chainsIso₃: a·(g₁, g₂, g₃) ↦ ρ(g₁⁻¹)a·(g₂, g₃) − a·(g₁g₂, g₃) + a·(g₁, g₂g₃) − a·(g₁, g₂). Its agreement with (inhomogeneousChains A).d 3 2 is groupHomology.comp_d₃₂_eq (LowDegree.lean:281). Mathlib has no degree-four analogue, so 3-boundaries use inhomogeneousChains.d.

<a id="baseline-mathlib-grouphomology-chainsmap"></a>

**`mathlib:groupHomology.chainsMap`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean). For f : G →* H and φ : A ⟶ res f B, the chain map inhomogeneousChains A ⟶ inhomogeneousChains B sending ∑ aᵢ·gᵢ to ∑ φ(aᵢ)·(f ∘ gᵢ) (k, G and H in one universe). Its degree-three coordinate form is groupHomology.chainsMap₃ (Functoriality.lean:221); the induced map on homology is groupHomology.map (Functoriality.lean:157).

<a id="baseline-mathlib-grouphomology-h1"></a>

**`mathlib:groupHomology.H1`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean). H1 A := groupHomology A 1, an abbreviation only. The identification with the abelianisation is not this declaration but groupHomology.H1AddEquivOfIsTrivial (LowDegree.lean:1023), H1 A ≃+ Additive (Abelianization G) ⊗[ℤ] A for trivial A; with A = ℤ this is Gᵃᵇ after the unit isomorphism of the tensor product.

<a id="baseline-mathlib-grouphomology-h2"></a>

**`mathlib:groupHomology.H2`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean). H2 A := groupHomology A 2 (abbreviation); for A = Rep.trivial ℤ G ℤ it is the Schur multiplier H_2(G, ℤ) that superperfection makes vanish. Mathlib has no Hopf formula and no link between H2 and central extensions; K2SymbolsBrauer:T.1:classical/split-extensions-kill-h2 (formerly V.1/split-extensions-kill-h2) supplies that link, and V.1 imports it.

<a id="baseline-mathlib-freeabeliangroup"></a>

**`mathlib:FreeAbelianGroup`** — [Mathlib/GroupTheory/FreeAbelianGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeAbelianGroup.lean). The free abelian group on a type, with FreeAbelianGroup.of and FreeAbelianGroup.lift (FreeAbelianGroup.lean:108, 112): the carrier of P(F) and of five-term certificates. For the chain modules of the configuration complex the form Mathlib's homology API uses is Finsupp, or Rep.ofMulAction ℤ G X for the G-action.

<a id="baseline-mathlib-finsupp"></a>

**`mathlib:Finsupp`** — [Mathlib/Data/Finsupp/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Finsupp/Defs.lean). Finitely supported functions α →₀ M: the finite formal combinations a certificate or a Bloch-element input is built from, and the chain modules of the bar and configuration complexes.

<a id="baseline-mathlib-tensorproduct"></a>

**`mathlib:TensorProduct`** — [Mathlib/LinearAlgebra/TensorProduct/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean). M ⊗[R] N over a commutative semiring R; with R = ℤ and M = N = Additive Fˣ it is Fˣ ⊗ Fˣ, whose quotient by the range of id + comm is V.3's antisymmetric quotient.

<a id="baseline-mathlib-additive"></a>

**`mathlib:Additive`** — [Mathlib/Algebra/Group/TypeTags/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/TypeTags/Basic.lean). Additive α := α with the additive structure; Additive Fˣ is an additive commutative group, hence a ℤ-module, which is how Fˣ enters TensorProduct ℤ.

<a id="baseline-mathlib-subgroup-closure"></a>

**`mathlib:Subgroup.closure`** — [Mathlib/Algebra/Group/Subgroup/Lattice.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Lattice.lean). The subgroup of a multiplicative group generated by a set. The relation subgroup of P(F) lies in the additive group FreeAbelianGroup, so the declaration actually used is the @[to_additive] twin AddSubgroup.closure generated from this one (attribute at Lattice.lean:328); generated names are absent from the declaration index, which is why the multiplicative name is cited. The antisymmetric quotient does not use it (it divides by LinearMap.range (id + comm)).

<a id="baseline-mathlib-quotientgroup-mk"></a>

**`mathlib:QuotientGroup.mk`** — [Mathlib/GroupTheory/Coset/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean). The canonical map α → α ⧸ s for a multiplicative group. P(F) is a quotient of the additive group FreeAbelianGroup, so the map actually used is the @[to_additive] twin QuotientAddGroup.mk generated from this declaration (attribute at Coset/Defs.lean:159–160; absent from the index).

<a id="baseline-mathlib-rootsofunity"></a>

**`mathlib:rootsOfUnity`** — [Mathlib/RingTheory/RootsOfUnity/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/Basic.lean). rootsOfUnity k M : Subgroup Mˣ, the ζ with ζ^k = 1, for a commutative monoid M. For a field it is finite and cyclic (rootsOfUnity.isCyclic, RootsOfUnity/Basic.lean:249): the finite cyclic pieces μ_n(F) of μ(F).

<a id="baseline-mathlib-commgroup-torsion"></a>

**`mathlib:CommGroup.torsion`** — [Mathlib/GroupTheory/Torsion.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Torsion.lean). The torsion subgroup of a commutative group; μ(F) = CommGroup.torsion Fˣ.

<a id="baseline-mathlib-categorytheory-tor"></a>

**`mathlib:CategoryTheory.Tor`** — [Mathlib/CategoryTheory/Monoidal/Tor.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Tor.lean). Tor C n : C ⥤ C ⥤ C, the left-derived functors of X ⊗ − in the second variable, for a monoidal abelian category with MonoidalPreadditive and projective resolutions. For C = ModuleCat ℤ the instances exist (MonoidalPreadditive at Mathlib/Algebra/Category/ModuleCat/Monoidal/Basic.lean:449; enough projectives at Mathlib/Algebra/Category/ModuleCat/Projective.lean:58; resolutions at Mathlib/CategoryTheory/Abelian/Projective/Resolution.lean:340), so it gives Tor_n^ℤ of abelian groups. It has no computations ('For now we have almost nothing to say about it!'): Tor_1^ℤ(ℤ/n, B) ≅ B[n], the comparison with Tor' and compatibility with filtered colimits, which Tor_1(μ, μ) ≅ μ needs, are proved in V.4/tor-form-comparison.

<a id="baseline-mathlib-zmod"></a>

**`mathlib:ZMod`** — [Mathlib/Data/ZMod/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Defs.lean). The cyclic rings ℤ/n (ZMod 0 = ℤ), used additively as the cyclic groups in which the calculations land.

<a id="baseline-mathlib-matrix-generallineargroup"></a>

**`mathlib:Matrix.GeneralLinearGroup`** — [Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean). GL n R := (Matrix n n R)ˣ for a finite index type: GL_2(F), GL_3(F) and their diagonal, Borel and monomial subgroups in V.4. The stable GL(F), a colimit, is not in Mathlib (KTheoryLowDegrees U.1). Matrix.GeneralLinearGroup.toLin (Defs.lean:121) identifies it with LinearMap.GeneralLinearGroup R (n → R). Not yet cited by any node; V.4/coinvariants-p1-homology, gl2-spectral-sequence, psi-gl2 and psi-gl3 use it.

<a id="baseline-mathlib-matrix-speciallineargroup"></a>

**`mathlib:Matrix.SpecialLinearGroup`** — [Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean). SL_n(R) = {A : det A = 1} for a finite index type and a commutative ring: finite rank only. The stable SL(F) used by V.2/k3-to-h3-sl-field and V.4/pi3-bm-plus is the colimit, equal to E(F) by KTheoryLowDegrees U.3. Not yet cited by any node.

<a id="baseline-mathlib-projectivization-generallineargroup-is-two-pretransitive"></a>

**`mathlib:Projectivization.generalLinearGroup_is_two_pretransitive`** — [Mathlib/LinearAlgebra/Projectivization/Action.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Projectivization/Action.lean). LinearMap.GeneralLinearGroup K V acts 2-pretransitively on ℙ K V, that is transitively on Fin 2 ↪ ℙ K V (ordered pairs of distinct points). It is stated for the linear-automorphism group, not for Matrix GL (Fin 2) K (transport along Matrix.GeneralLinearGroup.toLin), and it covers only the terms of degree at most one of the configuration complex. Transitivity on ordered triples of distinct points of the projective line, the stabilisers and the cross-ratio description of the degree-three orbits, all used by V.4/coinvariants-p1-homology, are not in Mathlib.

<a id="baseline-mathlib-onepoint-equivprojectivization"></a>

**`mathlib:OnePoint.equivProjectivization`** — [Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean). OnePoint K ≃ ℙ K (Fin 2 → K) for a division ring with decidable equality, ∞ ↦ [1 : 0] and t ↦ [t : 1]. For a field the GL (Fin 2) K action on OnePoint K by Möbius transformations is OnePoint.instGLAction (ProjectiveLine.lean:126), equivariant by OnePoint.equivProjectivization_smul (ProjectiveLine.lean:129), with the formulas smul_infty_eq_ite and smul_some_eq_ite (ProjectiveLine.lean:140, 149).

<a id="baseline-mathlib-numberfield-infiniteplace-nrrealplaces"></a>

**`mathlib:NumberField.InfinitePlace.nrRealPlaces`** — [Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean). r₁ = card {w : InfinitePlace K // IsReal w}.

<a id="baseline-mathlib-numberfield-infiniteplace-nrcomplexplaces"></a>

**`mathlib:NumberField.InfinitePlace.nrComplexPlaces`** — [Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean). r₂ = card {w : InfinitePlace K // IsComplex w}, the rank of K_3 of a number field.

<a id="baseline-mathlib-finitefield-card"></a>

**`mathlib:FiniteField.card`** — [Mathlib/FieldTheory/Finite/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finite/Basic.lean). For a finite field K of characteristic p: ∃ n : ℕ+, p is prime and Fintype.card K = p^n; the q of the finite-field calculation.

<a id="baseline-tauceti-tauceti-antisymmetrictensors"></a>

**`tauceti:TauCeti.antisymmetricTensors`** — [TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean). Module.End.eigenspace (TensorProduct.comm R M M) (−1): a submodule of M ⊗[R] M, the kernel of 1 + τ. The K-book's ∧̃²A is the cokernel of 1 + τ, and the two differ over ℤ (for M = ℤ the submodule is ⊥ and the quotient is ℤ/2). It enters only V.3/antisymmetric-tensor-quotient's compatibility test agrees_with_eigenspace_when_two_invertible, whose node does not yet list it as a prerequisite.

<a id="baseline-tauceti-tauceti-mem-antisymmetrictensors"></a>

**`tauceti:TauCeti.mem_antisymmetricTensors`** — [TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean). x ∈ antisymmetricTensors R M ↔ TensorProduct.comm R M M x = −x (simp).

<a id="baseline-tauceti-tauceti-iscompl-symmetrictensors-antisymmetrictensors"></a>

**`tauceti:TauCeti.isCompl_symmetricTensors_antisymmetricTensors`** — [TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean). With [Invertible (2 : R)], symmetricTensors R M and antisymmetricTensors R M are complementary; over ℤ, 2 is not invertible, so this gives the comparison only after inverting 2.

<a id="baseline-mathlib-grouphomology-inhomogeneouschains-d"></a>

**`mathlib:groupHomology.inhomogeneousChains.d`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). The differential of the inhomogeneous chain complex in every degree, needed for bar 3-boundaries from 4-chains.

<a id="baseline-mathlib-grouphomology-inhomogeneouschains-d-single"></a>

**`mathlib:groupHomology.inhomogeneousChains.d_single`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). The value of that differential on a single generator.

<a id="baseline-mathlib-grouphomology-d-u2083--u2082--single"></a>

**`mathlib:groupHomology.d₃₂_single`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean). The explicit value of d₃₂ on a single triple.

<a id="baseline-mathlib-grouphomology-d-u2083--u2082--single-one-snd"></a>

**`mathlib:groupHomology.d₃₂_single_one_snd`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean). d₃₂ (single (g, 1, h) a) = single (1, h) (ρ(g⁻¹) a) − single (g, 1) a: degenerate triples are not cycles in general.

<a id="baseline-mathlib-grouphomology-cyclesmk"></a>

**`mathlib:groupHomology.cyclesMk`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). A cycle made from a chain with vanishing differential.

<a id="baseline-mathlib-grouphomology--u3c0"></a>

**`mathlib:groupHomology.π`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). The map from n-cycles to n-th group homology.

<a id="baseline-mathlib-grouphomology-map"></a>

**`mathlib:groupHomology.map`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean). The map on group homology induced by a group homomorphism and a map of representations.

<a id="baseline-mathlib-rep-trivial"></a>

**`mathlib:Rep.trivial`** — [Mathlib/RepresentationTheory/Rep/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Rep/Basic.lean). The trivial representation on a module, here Z with trivial action.

<a id="baseline-mathlib-categorytheory-ab5"></a>

**`mathlib:CategoryTheory.AB5`** — [Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean). Exactness of filtered colimits; ModuleCat R has an AB5 instance at Mathlib/Algebra/Category/ModuleCat/AB.lean:29.

<a id="baseline-mathlib-rtensor-exact"></a>

**`mathlib:rTensor_exact`** — [Mathlib/LinearAlgebra/TensorProduct/RightExactness.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/RightExactness.lean). Tensoring an exact pair on the right gives an exact pair (right exactness of the tensor product).

<a id="baseline-mathlib-tensorproduct-comm"></a>

**`mathlib:TensorProduct.comm`** — [Mathlib/LinearAlgebra/TensorProduct/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basic.lean). The flip M ⊗ N ≃ N ⊗ M, whose sum with the identity cuts out the antisymmetric quotient.

<a id="baseline-mathlib-tensorproduct-lift"></a>

**`mathlib:TensorProduct.lift`** — [Mathlib/LinearAlgebra/TensorProduct/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basic.lean). Lifting a bilinear map to the tensor product, for the universal property of the antisymmetric quotient.

<a id="baseline-mathlib-linearmap-range"></a>

**`mathlib:LinearMap.range`** — [Mathlib/Algebra/Module/Submodule/Range.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Range.lean). The range of id + comm, the submodule the antisymmetric quotient divides by.

<a id="baseline-mathlib-submodule-mkq"></a>

**`mathlib:Submodule.mkQ`** — [Mathlib/LinearAlgebra/Quotient/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Quotient/Defs.lean). The quotient map M → M ⧸ p.

<a id="baseline-mathlib-submodule-liftq"></a>

**`mathlib:Submodule.liftQ`** — [Mathlib/LinearAlgebra/Quotient/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Quotient/Basic.lean). Descending a linear map through a quotient by a submodule of its kernel.

<a id="baseline-mathlib-exterioralgebra-exteriorpower"></a>

**`mathlib:ExteriorAlgebra.exteriorPower`** — [Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean). The exterior power ⋀[R]^n M as a submodule of the exterior algebra; the exterior square is n = 2.

<a id="baseline-mathlib-exteriorpower--u3b9-multi"></a>

**`mathlib:exteriorPower.ιMulti`** — [Mathlib/LinearAlgebra/ExteriorPower/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean). The alternating map (Fin n → M) → ⋀[R]^n M.

<a id="baseline-mathlib-exteriorpower--u3b9-multi-span"></a>

**`mathlib:exteriorPower.ιMulti_span`** — [Mathlib/LinearAlgebra/ExteriorPower/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean). The ιMulti span the exterior power, for surjectivity of toExterior.

<a id="baseline-mathlib-exteriorpower-alternatingmaplinearequiv"></a>

**`mathlib:exteriorPower.alternatingMapLinearEquiv`** — [Mathlib/LinearAlgebra/ExteriorPower/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean). The universal property of ⋀[R]^n M for alternating maps, used to identify the kernel of toExterior.

<a id="baseline-mathlib-module-basis-ofvectorspace"></a>

**`mathlib:Module.Basis.ofVectorSpace`** — [Mathlib/LinearAlgebra/Basis/VectorSpace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/VectorSpace.lean). A basis of a vector space, used over ZMod 2 for the injectivity of A/2A in the antisymmetric quotient.

<a id="baseline-mathlib-freeabeliangroup-lift"></a>

**`mathlib:FreeAbelianGroup.lift`** — [Mathlib/GroupTheory/FreeAbelianGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeAbelianGroup.lean). The universal property of the free abelian group, for the universal property of P(F).

<a id="baseline-mathlib-galoisfield"></a>

**`mathlib:GaloisField`** — [Mathlib/FieldTheory/Finite/GaloisField.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finite/GaloisField.lean). The finite field with p^n elements, for the F_4 computation.

<a id="baseline-mathlib-homologicalcomplex-u2082--total"></a>

**`mathlib:HomologicalComplex₂.total`** — [Mathlib/Algebra/Homology/TotalComplex.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/TotalComplex.lean). The total complex of a bicomplex (HomologicalComplex₂, HomologicalBicomplex.lean:38), with the sign convention of ComplexShape.π: the construction V.4/hyperhomology-map uses for the hyperhomology of G with coefficients in the configuration complex.

<a id="baseline-mathlib-categorytheory-projectiveresolution"></a>

**`mathlib:CategoryTheory.ProjectiveResolution`** — [Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean). Projective resolutions as ℕ-indexed complexes of projectives with a quasi-isomorphism to the object

<a id="baseline-mathlib-grouphomology-indiso"></a>

**`mathlib:groupHomology.indIso`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean). Shapiro's lemma for group homology: for S ≤ G and A : Rep k S, H_n(G, Ind_S^G A) ≅ H_n(S, A) in every degree. The configuration-complex computations of V.4 (coinvariants-p1-homology, gl2-spectral-sequence, hyperhomology-map's test shapiro_terms) use it without citing it.

<a id="baseline-mathlib-representation-coinvariants"></a>

**`mathlib:Representation.Coinvariants`** — [Mathlib/RepresentationTheory/Coinvariants.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean). The coinvariants V/⟨ρ g x − x⟩ of a representation

<a id="baseline-mathlib-quasiiso"></a>

**`mathlib:QuasiIso`** — [Mathlib/Algebra/Homology/QuasiIso.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/QuasiIso.lean). Quasi-isomorphisms of homological complexes

<a id="baseline-mathlib-rep-finitecyclicgroup-resolution"></a>

**`mathlib:Rep.FiniteCyclicGroup.resolution`** — [Mathlib/RepresentationTheory/Homological/FiniteCyclic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/FiniteCyclic.lean). For a finite cyclic group G generated by g, the periodic projective resolution … → k[G] --N--> k[G] --(ρ(g) − 1)--> k[G] → k of the trivial representation: the 'standard periodic free resolution' that K-book Lemma VI.5.14 compares with the configuration complex (V.4/symmetric-group-image).

<a id="baseline-mathlib-mulaction-ismultiplypretransitive"></a>

**`mathlib:MulAction.IsMultiplyPretransitive`** — [Mathlib/GroupTheory/GroupAction/MultipleTransitivity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/MultipleTransitivity.lean). IsMultiplyPretransitive G α n := IsPretransitive G (Fin n ↪ α): transitivity on ordered n-tuples of distinct points, which are the generators of the configuration complex in degree n − 1 (Fin (n+1) ↪ X in degree n).

<a id="baseline-mathlib-projectivization"></a>

**`mathlib:Projectivization`** — [Mathlib/LinearAlgebra/Projectivization/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Projectivization/Basic.lean). The projectivization of a vector space

<a id="baseline-mathlib-algebraicclosure"></a>

**`mathlib:AlgebraicClosure`** — [Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean). A chosen algebraic closure of a field

<a id="baseline-mathlib-nat-card-units"></a>

**`mathlib:Nat.card_units`** — [Mathlib/Algebra/GroupWithZero/Units/Fintype.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/Units/Fintype.lean). Nat.card αˣ = Nat.card α − 1 for a group with zero, so F_q^× has q − 1 elements

<a id="baseline-mathlib-iscyclic-of-injective-ringhom"></a>

**`mathlib:isCyclic_of_injective_ringHom`** — [Mathlib/RingTheory/IntegralDomain.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/IntegralDomain.lean). A finite group with an injective hom into the units of an integral domain is cyclic; the instance IsCyclic Rˣ for Finite Rˣ (line 144) is derived from it

<a id="baseline-mathlib-freeabeliangroup-equivfinsupp"></a>

**`mathlib:FreeAbelianGroup.equivFinsupp`** — [Mathlib/Algebra/FreeAbelianGroup/Finsupp.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/FreeAbelianGroup/Finsupp.lean). FreeAbelianGroup X ≃+ (X →₀ ℤ), used to decide validity of certificates

<a id="baseline-mathlib-finsupp-instdecidableeq"></a>

**`mathlib:Finsupp.instDecidableEq`** — [Mathlib/Data/Finsupp/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Finsupp/Defs.lean). DecidableEq (α →₀ M) from DecidableEq α and DecidableEq M

<a id="baseline-mathlib-isprimitiveroot"></a>

**`mathlib:IsPrimitiveRoot`** — [Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean). The predicate that ζ is a primitive k-th root of unity, i.e. has exact order k

<a id="baseline-mathlib-localizedmodule"></a>

**`mathlib:LocalizedModule`** — [Mathlib/Algebra/Module/LocalizedModule/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LocalizedModule/Basic.lean). Localisation of a module at a submonoid, used for B(F) ⊗ Z[1/m]

<a id="baseline-mathlib-submonoid-powers"></a>

**`mathlib:Submonoid.powers`** — [Mathlib/Algebra/Group/Submonoid/Membership.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Submonoid/Membership.lean). The submonoid of powers of an element

<a id="baseline-mathlib-padicint"></a>

**`mathlib:PadicInt`** — [Mathlib/NumberTheory/Padics/PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean). The p-adic integers Z_p

<a id="baseline-mathlib-grouphomology-comp-d-u2083--u2082--eq"></a>

**`mathlib:groupHomology.comp_d₃₂_eq`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean). (chainsIso₃ A).hom ≫ d₃₂ A = (inhomogeneousChains A).d 3 2 ≫ (chainsIso₂ A).hom: the coordinate differential d₃₂ is the complex's differential, so a chain in G³ →₀ A killed by d₃₂ is a 3-cycle.

<a id="baseline-mathlib-grouphomology-chainsmap-u2083"></a>

**`mathlib:groupHomology.chainsMap₃`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean). The degree-three chain map in coordinates, ∑ aᵢ·(gᵢ₁, gᵢ₂, gᵢ₃) ↦ ∑ φ(aᵢ)·(f gᵢ₁, f gᵢ₂, f gᵢ₃), matching chainsMap by chainsMap_f_3_comp_chainsIso₃ (Functoriality.lean:246); for V.1/bar-cycle-model's naturality on representatives.

<a id="baseline-mathlib-rep-finitecyclicgroup-grouphomologyisoodd"></a>

**`mathlib:Rep.FiniteCyclicGroup.groupHomologyIsoOdd`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean). For G finite cyclic generated by g and odd i, H_i(G, A) ≅ ker(ρ(g) − 1)/im N; with A = ℤ trivial, H_3(ℤ/n, ℤ) ≅ ℤ/n. Used for H_3(A_3, ℤ) ≅ ℤ/3 (V.4/symmetric-group-image) and μ_n(F) ≅ H_3(μ_n(F), ℤ) (V.4/pi3ind-bm-plus).

<a id="baseline-mathlib-rep-finitecyclicgroup-groupcohomologyisoeven"></a>

**`mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven`** — [Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean). For G finite cyclic generated by g and even i > 0, H^i(G, A) ≅ ker N / im(ρ(g) − 1); with A = ℤ/2 trivial and |G| = m even, H²(G, ℤ/2) ≅ ℤ/2, the uniqueness of the nontrivial central extension that V.4/enhanced-mu asserts.

<a id="baseline-mathlib-rootsofunity-iscyclic"></a>

**`mathlib:rootsOfUnity.isCyclic`** — [Mathlib/RingTheory/RootsOfUnity/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/Basic.lean). IsCyclic (rootsOfUnity k R) for a domain R: each μ_n(F) is cyclic, as the enhancement of V.4/enhanced-mu requires.

<a id="baseline-mathlib-onepoint-instglaction"></a>

**`mathlib:OnePoint.instGLAction`** — [Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean). MulAction (GL (Fin 2) K) (OnePoint K) for a field K, transported from ℙ K (Fin 2 → K) along equivProjectivization: the action of GL_2(F) on F ∪ {∞} by Möbius transformations, which V.4/coinvariants-p1-homology uses.

<a id="baseline-mathlib-onepoint-equivprojectivization-smul"></a>

**`mathlib:OnePoint.equivProjectivization_smul`** — [Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean). equivProjectivization K (g • x) = g • equivProjectivization K x for g : GL (Fin 2) K: the identification of F ∪ {∞} with ℙ¹(F) is GL_2-equivariant.

<a id="baseline-mathlib-rep-ofmulaction"></a>

**`mathlib:Rep.ofMulAction`** — [Mathlib/RepresentationTheory/Rep/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Rep/Basic.lean). For a G-set H, k[H] with the permutation representation, as an object of Rep k G: the degree-n term of the configuration complex as a representation is Rep.ofMulAction ℤ G (Fin (n+1) ↪ X).

<a id="baseline-mathlib-matrix-generallineargroup-tolin"></a>

**`mathlib:Matrix.GeneralLinearGroup.toLin`** — [Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean). GL n R ≃* LinearMap.GeneralLinearGroup R (n → R), which transports Projectivization.generalLinearGroup_is_two_pretransitive to the matrix group GL (Fin 2) K.

<a id="baseline-mathlib-categorytheory-spectralsequence"></a>

**`mathlib:CategoryTheory.SpectralSequence`** — [Mathlib/Algebra/Homology/SpectralSequence/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/SpectralSequence/Basic.lean). Spectral sequences in an abelian category as pages with identifications of the homology of each page with the next. Mathlib does not construct the spectral sequence of a double complex or of hyperhomology, so V.4/gl2-spectral-sequence still builds it, but it should land in this structure.

<a id="baseline-tauceti-tauceti-wreathproduct"></a>

**`tauceti:TauCeti.WreathProduct`** — [TauCeti/GroupTheory/Perm/WreathProduct.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/Perm/WreathProduct.lean). The permutation wreath product (ι → D) ⋊ Equiv.Perm ι; the monomial group M_n ≅ Fˣ ≀ Σ_n of V.4/monomial-sequence and pi3-bm-plus is TauCeti.WreathProduct Fˣ (Fin n). Its embedding into GL_n(F) as monomial matrices is not in the libraries.

<a id="baseline-mathlib-grouphomology-icycles"></a>

**`mathlib:groupHomology.iCycles`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). Inclusion of the cycles object in the chain object.

<a id="baseline-mathlib-grouphomology-tocycles"></a>

**`mathlib:groupHomology.toCycles`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). Differential factored through the target cycles object.

<a id="baseline-mathlib-grouphomology-induction-on"></a>

**`mathlib:groupHomology_induction_on`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). Every group-homology element is represented by a cycle.

<a id="baseline-mathlib-iszero-grouphomology-succ-of-subsingleton"></a>

**`mathlib:isZero_groupHomology_succ_of_subsingleton`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean). Positive-degree group homology of a subsingleton group is a zero object.

<a id="baseline-mathlib-grouphomology-chainsmap-f-single"></a>

**`mathlib:groupHomology.chainsMap_f_single`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean). A single tuple maps to the tuplewise image with the mapped coefficient.

<a id="baseline-mathlib-grouphomology-cyclesmap"></a>

**`mathlib:groupHomology.cyclesMap`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean). Induced map of the existing cycles objects.

<a id="baseline-mathlib-grouphomology--u3c0--map"></a>

**`mathlib:groupHomology.π_map`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean). The cycle-to-homology projections commute with induced maps.

<a id="baseline-mathlib-grouphomology-map-id"></a>

**`mathlib:groupHomology.map_id`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean). Identity group map and coefficient identity induce the homology identity.

<a id="baseline-mathlib-grouphomology-map-comp"></a>

**`mathlib:groupHomology.map_comp`** — [Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean). Composition of group and coefficient maps induces the composite homology map.

<a id="baseline-mathlib-hspace"></a>

**`mathlib:HSpace`** — [Mathlib/Topology/Homotopy/HSpaces.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homotopy/HSpaces.lean). Continuous multiplication, chosen unit, strict unit at (e,e) and two unit homotopies relative to the unit.

<a id="baseline-mathlib-iscoveringmap-existsunique-continuousmap-lifts"></a>

**`mathlib:IsCoveringMap.existsUnique_continuousMap_lifts`** — [Mathlib/Topology/Homotopy/Lifting.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homotopy/Lifting.lean). A map from a simply connected locally path connected space lifts uniquely after selecting one lifted point.

<a id="baseline-mathlib-iscoveringmap-lifthomotopyrel"></a>

**`mathlib:IsCoveringMap.liftHomotopyRel`** — [Mathlib/Topology/Homotopy/Lifting.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homotopy/Lifting.lean). Lift of a homotopy relative to a subset from a preconnected domain with prescribed starting lift.

<a id="baseline-mathlib-quotientgroup-mk-u27"></a>

**`mathlib:QuotientGroup.mk'`** — [Mathlib/GroupTheory/QuotientGroup/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean). Source declaration in multiplicative notation; its displayed to_additive attribute generates QuotientAddGroup.mk'. The additive quotient homomorphism A → A/D for an additive subgroup D.

<a id="baseline-mathlib-quotientgroup-liftequiv"></a>

**`mathlib:QuotientGroup.liftEquiv`** — [Mathlib/GroupTheory/QuotientGroup/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean). Source declaration in multiplicative notation; its displayed to_additive attribute generates QuotientAddGroup.liftEquiv. For a surjective additive homomorphism e:A→B and D=ker(e), construct A/D ≃+ B, evaluating on the class of a as e(a).

<a id="baseline-mathlib-quotientgroup-map"></a>

**`mathlib:QuotientGroup.map`** — [Mathlib/GroupTheory/QuotientGroup/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean). Source declaration in multiplicative notation; its displayed to_additive attribute generates QuotientAddGroup.map. For f:A→B and D≤f⁻¹(E), construct A/D→B/E; its value on a representative is the class of f(a).

<a id="baseline-mathlib-numberfield-infiniteplace-embedding-of-isreal"></a>

**`mathlib:NumberField.InfinitePlace.embedding_of_isReal`** — [Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean). The ring embedding F→ℝ associated to a real infinite place; the norm agrees with its absolute value.

<a id="baseline-mathlib-numberfield-infiniteplace-denserange-algebramap-pi"></a>

**`mathlib:NumberField.InfinitePlace.denseRange_algebraMap_pi`** — [Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean). Weak approximation: the diagonal map into the finite product of infinite-place WithAbs topologies has dense range. Apply to an open box specifying negative value at one real place and positive values at the others.

<a id="baseline-mathlib-function-mulexact"></a>

**`mathlib:Function.MulExact`** — [Mathlib/Algebra/Exact/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Exact/Basic.lean). Source declaration in multiplicative notation; its displayed to_additive attribute generates Function.Exact. Exactness of additive maps f,g is ∀y, g(y)=0 iff y lies in the set-theoretic range of f. Does not include injectivity or surjectivity.

<a id="baseline-mathlib-tensorproduct-map"></a>

**`mathlib:TensorProduct.map`** — [Mathlib/LinearAlgebra/TensorProduct/Map.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Map.lean). The linear tensor map on two linear maps; used for units under embeddings and coefficient changes.

<a id="baseline-mathlib-monoidhom-ker"></a>

**`mathlib:MonoidHom.ker`** — [Mathlib/Algebra/Group/Subgroup/Ker.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean). The subgroup of elements mapped to 1; its to_additive twin AddMonoidHom.ker is the subgroup mapped to 0. The generated additive name is omitted from the text-based index but used by the suggested signatures.

<a id="baseline-mathlib-finsupp-linearcombination"></a>

**`mathlib:Finsupp.linearCombination`** — [Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean). The ℚ-linear extension of a basis assignment on finite-support functions; used for rational symbol boundaries and specialization.

<a id="baseline-mathlib-algebraicgeometry-scheme-functionfield"></a>

**`mathlib:AlgebraicGeometry.Scheme.functionField`** — [Mathlib/AlgebraicGeometry/FunctionField.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/FunctionField.lean). The generic-point stalk of an irreducible scheme, with the Field instance under IsIntegral; this is the function-field carrier, not the missing evaluation-at-a-point API.

<a id="baseline-mathlib-algebraicgeometry-isintegral"></a>

**`mathlib:AlgebraicGeometry.IsIntegral`** — [Mathlib/AlgebraicGeometry/Properties.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Properties.lean). A nonempty scheme whose sections on every nonempty open are domains; this gives the function-field Field instance.

<a id="baseline-mathlib-algebraicgeometry-smoothofrelativedimension"></a>

**`mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`** — [Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean). The actual local standard-smooth relative-dimension predicate on a scheme morphism, used with n=1 over Spec F.

<a id="baseline-mathlib-module-flat-ltensor-exact"></a>

**`mathlib:Module.Flat.lTensor_exact`** — [Mathlib/RingTheory/Flat/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean). Tensoring by a flat module preserves Function.Exact for linear maps of modules over a ring; used for ℚ and localizations, not ℤ/n.

<a id="baseline-mathlib-module-flat-ltensor-preserves-injective-linearmap"></a>

**`mathlib:Module.Flat.lTensor_preserves_injective_linearMap`** — [Mathlib/RingTheory/Flat/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean). Tensoring an injective linear map with a flat module preserves injectivity.

<a id="baseline-mathlib-algebraicgeometry-quasicompact"></a>

**`mathlib:AlgebraicGeometry.QuasiCompact`** — [Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean). The preimages of compact open subsets under a scheme morphism are compact. Together with smoothness (locally of finite presentation), this restricts the curve carrier to finite type.

<a id="baseline-mathlib-algebraicgeometry-isseparated"></a>

**`mathlib:AlgebraicGeometry.IsSeparated`** — [Mathlib/AlgebraicGeometry/Morphisms/Separated.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Separated.lean). A scheme morphism has closed-immersion diagonal. The relative predicate restricts the smooth-curve carrier to separated algebraic curves.

<a id="baseline-mathlib-linearindependent"></a>

**`mathlib:LinearIndependent`** — [Mathlib/LinearAlgebra/LinearIndependent/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Defs.lean). Injectivity of the Finsupp linear-combination map; use this predicate for the projected vector family.

<a id="baseline-mathlib-rep"></a>

**`mathlib:Rep`** — [Mathlib/RepresentationTheory/Rep/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Rep/Basic.lean). Bundled representation with its underlying module and action; the existing abelian category supplies homology representations.

<a id="baseline-mathlib-addcommgrpcat-injective-of-divisible"></a>

**`mathlib:AddCommGrpCat.injective_of_divisible`** — [Mathlib/Algebra/Category/Grp/Injective.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/Grp/Injective.lean). A divisible abelian group, expressed using DivisibleBy A Z, is an injective object in AddCommGrpCat; hence an embedded divisible group splits.

<a id="baseline-mathlib-subfield-closure"></a>

**`mathlib:Subfield.closure`** — [Mathlib/Algebra/Field/Subfield/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Field/Subfield/Basic.lean). The smallest subfield containing a set. Subfield.closure of the empty set is the prime subfield, so closure(empty)=top expresses the prime-field hypothesis in the scalar-homology signature.

<a id="baseline-mathlib-matrix-speciallineargroup-map"></a>

**`mathlib:Matrix.SpecialLinearGroup.map`** — [Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean). Entrywise map along a ring homomorphism.

<a id="baseline-mathlib-algebra-norm"></a>

**`mathlib:Algebra.norm`** — [Mathlib/RingTheory/Norm/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Defs.lean). Determinant of multiplication by an element of a finite free algebra.

<a id="baseline-mathlib-linearmap-tomatrix"></a>

**`mathlib:LinearMap.toMatrix`** — [Mathlib/LinearAlgebra/Matrix/ToLin.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/ToLin.lean). Matrix of an actual linear endomorphism in a chosen basis.

<a id="baseline-mathlib-addcircle"></a>

**`mathlib:AddCircle`** — [Mathlib/Topology/Instances/AddCircle/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Instances/AddCircle/Defs.lean). Additive quotient by integral multiples of a specified period; use the real period π².

<a id="baseline-mathlib-addmonoidhom-tointlinearmap"></a>

**`mathlib:AddMonoidHom.toIntLinearMap`** — [Mathlib/Algebra/Module/LinearMap/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/Defs.lean). Reinterpret an additive homomorphism of abelian groups as a ℤ-linear map.

<a id="baseline-mathlib-tensorproduct-tmul"></a>

**`mathlib:TensorProduct.tmul`** — [Mathlib/LinearAlgebra/TensorProduct/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean). Canonical pure tensors; use B ⊗[ℤ] R with an integer-linear inclusion B→P.

<a id="baseline-mathlib-mulequiv-trans"></a>

**`mathlib:MulEquiv.trans`** — [Mathlib/Algebra/Group/Equiv/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean). Composition of multiplicative equivalences, with its generated additive counterpart AddEquiv.trans; use c.trans r.symm.

<a id="baseline-mathlib-mulequiv-symm"></a>

**`mathlib:MulEquiv.symm`** — [Mathlib/Algebra/Group/Equiv/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean). Inverse of a multiplicative equivalence, with its generated additive counterpart AddEquiv.symm.

<a id="baseline-mathlib-zmod-casthom"></a>

**`mathlib:ZMod.castHom`** — [Mathlib/Data/ZMod/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean). The canonical ring homomorphism ZMod n→R of characteristic m when m divides n; gives the nonsplit ℤ/24→ℤ/6 test.
