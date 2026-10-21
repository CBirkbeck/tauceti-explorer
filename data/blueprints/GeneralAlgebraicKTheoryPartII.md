# General algebraic K-theory, Part II: telescopic purity and redshift

**Independent review (2026-10-19).** Accepted as a target-level planning pass after correcting finiteness, regularity, nonconnective enlargement, relative-plus, Witt-action and source-locator details. All 73 targets and seven pinned baseline declarations were checked. The 16 supplier extensions and proof-audit gap G1 remain explicit; no stage is certified closed. The report is [REV-DESIGN-GeneralAlgebraicKTheoryPartII](../reviews/REV-DESIGN-GeneralAlgebraicKTheoryPartII.md).

For an associative ring spectrum A, the T(n)-local algebraic K-theory of A depends only on its two adjacent chromatic heights n−1 and n. This roadmap constructs the enhanced K-theory interfaces needed to state that theorem, proves its two logically separate halves, and follows the result through redshift, descent, examples and cyclic assembly. Its classical exact and Waldhausen inputs are imported from GeneralAlgebraicKTheory.

This is a **complete target-level planning pass**. All eleven layers KII.0–KII.10 are **planned**. The 73 targets have exact statements, hypotheses, direct prerequisites, proof outlines and acceptance checks. Seventeen definitions/constructions carry 68 API items and 51 discriminating tests. There are 45 selected planets, at most six in each layer. One proof-audit gap, sixteen supplier extensions and one source issue remain; no layer or declaration is claimed implemented or mathematically closed. The packet and this reader have the same targets.

## Conventions and endpoints

Fix a prime p. All tensor products, mapping objects, (co)limits, fibers and quotients are derived. E1-rings are associative and unital, including the zero ring. E∞-rings are commutative ring spectra. Perf(A) means **right** perfect modules, whereas the existing Tau Ceti module exact structure uses left modules; the comparison passes to the opposite ring. Universes are fixed and smallness is relative to them. An equivalence is natural in the variables in its statement; comparisons of models must include that naturality.

Use homological grading for spectrum homotopy groups. A spectrum is d-connective when its groups below d vanish, and a map is d-connective when its fiber is d-connective. Additive mapping spectra hom_C(X,Y) are connective. For stable C distinguish them from the full mapping spectra Hom_C(X,Y): hom=τ≥0Hom. Ring-spectrum K is nonconnective unless marked Kconn. Kadd is the group-completion connective theory. Ω∞τ≥1K is its connected positive K-space; a K0 component is not discarded without saying so.

Write T(0)=S[1/p] on **all** spectra and K(0)=HQ. For n≥1 use the telescope T(n) and Morava K(n) supplied by CH. Define L_n^(p,f)=L_(S[1/p]∨T(1)∨⋯∨T(n)); the ordinary finite chromatic localization L_n^f has HQ in place of S[1/p]. They agree on p-local inputs, by CH.4/p-local-comparison. A K(n)-statement is transferred from a T(n)-statement only where CH supplies the precise ring comparison. No general telescope conjecture is used. The graded-piece comparison at n=0 is explicitly restricted to p-local input. The redshift lower bound in height zero uses a rational field map: it requires nonzero rationalization, which follows for p-local height-zero input. The distinction is substantive; source issue E1 below records the global convention mismatch.

The principal statements, with their full hypotheses expanded in the layers, are:

- **Theorem A.** A→L_n^(p,f)A induces T(i)-equivalences on K for 1≤i≤n. For n≥2, removing T(0) still gives a T(n)-equivalence.
- **CMNN vanishing.** For n≥2, L_T(n)K(L_(n−2)^(p,f)S)=0. Its proof uses Theorem A, the cyclotomic trace, a genuine Cp-transfer and Tate blueshift.
- **Purity.** For n≥1, K(A)→K(L_(T(n−1)∨T(n))A) is a T(n)-equivalence, for arbitrary E1 A.
- **Redshift.** For p-local E∞ R of nonnegative chromatic height, ht(K(R))=ht(R)+1, including infinite height. On global inputs the positive-height statement holds, and height zero additionally requires nonzero rationalization. The upper bound and the positive and zero-height lower inputs are distinct targets.
- **Height one.** On connective K(1)-acyclic rings, K(1)-local K-theory is truncating and polynomially homotopy invariant. On discrete rings it is nilinvariant and excisive and agrees with K(1)-local KH; the scheme extension satisfies cdh descent.
- **Heights at least two.** K(A), K(τ≥0A) and TC(τ≥0A) agree after T(n)-localization, the localized K functor preserves sifted colimits, and assembly over every cyclic subgroup is a T(n)-equivalence.

These assertions use the published LMMT statements: Theorem A and Purity, p.1013; Theorem 3.8 and Remark 3.9, pp.1024–1026; Theorem B and Redshift, pp.1013–1014; Corollaries 4.23–4.34, pp.1033–1036. The named proof inputs have their own locators below.

## Library and ownership boundary

The audited pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library coverage for the parent K.1–K.7, stable homotopy H.5 and EDS was read before planning. The actual types of the seven declarations below were read at the pins. Ordinary quasicategories, idempotent completions, triangulated t-structures and exact structures exist. Stable enhanced K spectra and chromatic localizations are imported roadmap interfaces or new README targets.

The current TauCetiRoadmap main and current Tau Ceti library were also searched, including the nine roadmaps newer than the atlas snapshot. The current AlgebraicTopology and GrothendieckEulerForms reader/suggested files were read for scope and density. Their ordinary topology, exactness and K0 constructions retain their owners. No higher-K/chromatic target below is replanned from those roadmaps.

| Pinned declaration | Interface used |
| --- | --- |
| `mathlib:SSet.Quasicategory` | Inner-horn filling for a simplicial set; a carrier interface only, with no stable ∞-category or K-theory spectrum supplied. |
| `mathlib:CategoryTheory.Idempotents.Karoubi` | Ordinary categorical idempotent completion by an object and an idempotent endomorphism; compare hC with this construction. |
| `mathlib:CategoryTheory.Triangulated.TStructure` | Ordinary triangulated t-structures with le/ge, orthogonality and truncation triangles; enhanced lifts remain this roadmap’s target. |
| `mathlib:CategoryTheory.Triangulated.TStructure.bounded` | The intersection of the plus and minus object properties, with object-dependent lower and upper bounds. |
| `tauceti:TauCeti.ExactStructure` | Exact structures on preadditive categories, with composition, pullback and pushout axioms; use for the classical comparison only. |
| `tauceti:TauCeti.finiteProjectiveModulesExactStructure` | The exact structure induced on finitely generated projective left modules over a ring R; right R-modules use Rop. |
| `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split` | The induced exact structure on finite projectives equals the split exact structure. |

The ownership contracts are as follows.

| Owner | Imported material and boundary |
| --- | --- |
| GeneralAlgebraicKTheory K.1–K.6 | Classical Q/plus/Waldhausen K, devissage, relative/fibration machinery, Bass–Schlichting extension and the fundamental theorem with Nil terms. KII.0–KII.3 add enhanced interfaces and comparisons. |
| GeneralAlgebraicKTheory K.7 | Classical products from biexact functors. KII.4 extends their multiplicative compatibility to the enhanced setting. |
| EnhancedDerivedSheaves E0, E5:abstract, E5:presentability | Stable ∞-categories, stable quotients, idempotent completion, modules, monoidal structure, Ind and compact generation. This roadmap owns Cat∞perf and K-theory on those carriers. |
| StableHomotopyKTheory H.3/H.5:spectra/H.5:S-delooping | Plus/group completion, spectrum assembly and coherent Waldhausen delooping. |
| ChromaticHomotopyTheory CH.0–CH.13 | Finite spectra, telescopes, localization, periodic detection, Hahn, Tate blueshift, Lubin–Tate spectra/actions, ko/tmf and James–Thom spectra. K-theoretic purity and its descent consequences are here. |
| RefinedTraceMethods RT.2/RT.3 | THH, cyclotomic TC, genuine spectra, Tate quotient, trace, DGM, stable K versus THH and Hesselholt–Nikolaus assembly. |
| RefinedTraceMethods RT.5 | Accessible localizing-invariant refinements and motives. Its precise A-linear weakly additive motive interface is a supplier extension. |
| KTheoryLowDegrees Z.1 | K0 nilpotent invariance; this roadmap performs the Bass induction in negative degrees. |
| KTheoryFiniteLocalFields L.1 | Quillen finite-field groups and the Brauer-lifting/Adams fibration. |
| SchemeKTheoryOperations S.1/S.4/S.5 | Perf schemes, scheme descent geometry, ordinary homotopy invariance, KH and the requested Karoubi–Villamayor comparison. |
| MotivicEtaleKTheory M.7 | Algebraically closed field comparison and requested spectral étale/strict-Henselian extension. |
| HabiroRings HR.4 | Big Witt vectors with all truncation sets. KII.4 constructs their action on NK, without another Witt carrier. |

**Ownership reconciliation.** The binding brief assigns the shared stable K-theory foundation here. The packet proposes that the generic part of RT.3/localizing-invariants import KII.0/perfect-categories, and that the generic part of RT.3/truncating-excision import KII.2/amalgam, KII.2/truncating and KII.2/truncating-excision. Trace examples remain RT.3. RT.5/localizing-invariant keeps accessibility and κ-filtered continuity as an extra refinement. This explicit rescope proposal must be applied and consumers repointed by the maintainer; it edits none of those packets. Generic stable categories remain EDS-owned.

## Proof order and layer checks

KII.0–KII.3 have no trace or chromatic prerequisite, even transitively through this packet. Their external mathematical inputs are the EDS, H and parent K layers named in the brief. KII.4 proves acyclic truncation, categorical vanishing and Theorem A. KII.5 first derives the connective-cover and high-trace comparisons from Theorem A, DGM and Mitchell. It then proves CMNN vanishing and only then purity. The CMNN induction never cites purity. In its m=0 case Mitchell is the base; its high-trace argument is used only for m≥1, where m+1≥2.

The lower redshift input is used after purity: Yuan's argument itself invokes purity. This does not enter Theorem A or the CMNN induction. The rational-transfer proof of Galois descent uses a uniform ε-nilpotent totalization tower; it does not assume a localization commutes with arbitrary homotopy fixed points. Both fixed-point comparison maps are targets. At p=2 the supersingular group is GL₂(F₃) of order 48. At p=3 use the full order-24 group, including the residue-field action, rather than only its geometric order-12 subgroup.

Within a layer, follow the direct node inputs. Node order on the page is thematic. An imported node is a contract from its owner and retains that packet's own gaps; a checked link is not a proof of the supplier theorem.

The suggested Lean file follows WORKERS' 2026-10-12 shape. It contains four examples over existing carriers: Kan implies quasicategory, the Karoubi idempotent equation, split exactness for finite projectives, and the objectwise bounded t-structure predicate. It compiled at the pins with exit code 0 and no diagnostics. The absent enhanced carriers, all target definitions, proposed APIs, tests and main theorems are fully specified here. No replacement carrier or assumed purity predicate is introduced into Lean.

| Layer | Targets | Planets | Coverage |
| --- | ---: | ---: | --- |
| [KII.0 — Stable categories and nonconnective K-theory](#kii-0) | 5 | 5 | planned |
| [KII.1 — Connective and additive comparisons](#kii-1) | 4 | 4 | planned |
| [KII.2 — Pullbacks, truncation and excision](#kii-2) | 5 | 4 | planned |
| [KII.3 — Stable envelopes and bounded hearts](#kii-3) | 6 | 5 | planned |
| [KII.4 — Theorem A without trace methods](#kii-4) | 13 | 6 | planned |
| [KII.5 — Trace comparison, CMNN vanishing and purity](#kii-5) | 6 | 3 | planned |
| [KII.6 — Height bounds, redshift and optimality](#kii-6) | 6 | 4 | planned |
| [KII.7 — Examples and iterated K-theory](#kii-7) | 8 | 2 | planned |
| [KII.8 — Galois descent and modular examples](#kii-8) | 8 | 4 | planned |
| [KII.9 — Height-one structure and its limits](#kii-9) | 7 | 4 | planned |
| [KII.10 — Additive comparison, sifted colimits and cyclic assembly](#kii-10) | 5 | 4 | planned |

<a id="kii-0"></a>
## KII.0. Stable categories and nonconnective K-theory

Construct Cat∞perf, exact sequences, K(Perf(A)), the enhanced S-construction and nonconnective K. Establish localization and comparison with classical exact/Waldhausen models. This foundational layer has no chromatic or trace prerequisites.

**Stage inputs.** `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `GeneralAlgebraicKTheory:K.4`, `GeneralAlgebraicKTheory:K.4:construction`, `GeneralAlgebraicKTheory:K.6`, `StableHomotopyKTheory:H.5:S-delooping`, `StableHomotopyKTheory:H.5:spectra`.

<a id="kii-0-perfect-categories"></a>
### Perfect stable categories and localizing invariants

**Target** `GeneralAlgebraicKTheoryPartII:KII.0/perfect-categories` (definition · planet: Localizing invariants). Cat∞perf has small idempotent-complete stable ∞-categories as objects and exact functors as morphisms. A sequence C→D→E is exact when its composite is zero, C→D is fully faithful, and Idem(D/C)→E is an equivalence. A weakly localizing invariant with values in a stable ∞-category V is a functor F:Cat∞perf→V with F(0)=0 carrying these sequences to fiber/cofiber sequences. No continuity is included in this definition; accessible/finitary refinements remain RT.5’s responsibility.

**Hypotheses.** C,D,E are small stable idempotent-complete ∞-categories; V is stable. Exact sequences include a specified zero composite. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E5:abstract/verdier-quotient`, `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:presentability/spectra`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:SSet.Quasicategory`.

**Construction/proof outline.**

1. Use the existing stable ∞-category, Verdier quotient and idempotent-completion interfaces from EDS.
2. Define exact sequences by the quotient universal property and formulate localizing invariants as a full subcategory of functors.
3. Compare exactness with the induced compactly generated presentable localization after Ind; split sequences give biproducts.

**Uses.** Land–Tamme, Theorem 1.3: The enhanced localization sequence supplies the invariant pullback formula. RT.3 and RT.5: They import this shared definition, then add trace examples and accessibility.

**API.**

- `TauCeti.KTheory.PerfectCategories.exact_iff_quotient` (characterisation): Exactness is equivalent to full faithfulness, a zero composite, and E≃Idem(D/C).
- `TauCeti.KTheory.PerfectCategories.map_fiber` (structure): A localizing invariant carries every exact sequence to a natural cofiber sequence.
- `TauCeti.KTheory.PerfectCategories.split_exact` (compatibility): For a split exact sequence C→D→E, F(D)≃F(C)⊕F(E).
- `TauCeti.KTheory.PerfectCategories.equivalence_invariance` (functoriality): Equivalences of perfect stable categories induce equivalences under F, coherently with composition.

**Discriminating tests.**

- `TauCeti.KTheory.PerfectCategories.test_identity` (degenerate): C→C→0 with identity first arrow is exact.
- `TauCeti.KTheory.PerfectCategories.test_nonthick_kernel` (non-example): A Verdier quotient by a stable subcategory need not have precisely that subcategory as its kernel before taking its retract closure.
- `TauCeti.KTheory.PerfectCategories.test_classical_karoubi` (compatibility): For a discrete additive category, the homotopy-category idempotent completion agrees with CategoryTheory.Idempotents.Karoubi.

**Check.**

- The sequence C→C→0 is exact and F(C)→F(C)→0 is a fiber sequence.

**Sources.** [bgt](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf), §5.1–5.2, Definitions 5.8 and 5.12, pp.775–779; §9.1, pp.806–808. Supplies exact sequences of enhanced stable categories and their nonconnective localization context. [lt](https://arxiv.org/pdf/1808.05559), Notation 1.1 and Definition 1.2, manuscript p.5. Fixes the weak convention that does not require filtered colimits.

<a id="kii-0-ring-k-theory"></a>
### Perfect modules and K-theory of ring spectra

**Target** `GeneralAlgebraicKTheoryPartII:KII.0/ring-k-theory` (construction · planet: K-theory of ring spectra). For an associative unital ring spectrum A, Perf(A) is the full stable idempotent-complete subcategory of right A-modules consisting of retracts of finite cell modules, equivalently the compact objects of Mod_A. Define K(A)=Knc(Perf(A)). A→B induces extension of scalars Perf(A)→Perf(B), without assuming that B is perfect over A. If B is perfect as an A-module there is also restriction/transfer. For a discrete ring R, compare τ≥0K(HR) with classical projective-module K(R), and all degrees with the parent’s nonconnective spectrum.

**Hypotheses.** A is an associative unital ring spectrum, with right modules. Restriction along A→B is used as a transfer only if B is perfect over A. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`, `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, [Perfect stable categories and localizing invariants](#kii-0-perfect-categories), [Nonconnective K-theory of stable categories](#kii-0-nonconnective-k), `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`.

**Construction/proof outline.**

1. Obtain right modules by applying EDS’s left-module construction to Aop; show A compactly generates Mod_A.
2. Identify compacts with the thick closure of A and prove that extension of scalars preserves them.
3. Use the enhanced S-construction and the parent’s Gillet–Waldhausen/derived-invariance comparison on HR; compare right R-modules to the existing left Rop-module exact structure.

**Uses.** Theorem 3.8 and Purity: The input ring is evaluated through perfect modules, including nonconnective rings. CMNN20, Theorem 5.6: Finite perfect extensions supply the transfer entering the rational unit condition.

**API.**

- `TauCeti.KTheory.RingKTheory.perfect_iff_thick` (characterisation): M is perfect exactly when it belongs to the stable retract closure of A.
- `TauCeti.KTheory.RingKTheory.base_change` (functoriality): A→B yields K(A)→K(B), with identity/composition equivalences from tensor associativity.
- `TauCeti.KTheory.RingKTheory.transfer` (constructor): If B is perfect over A, restriction gives K(B)→K(A).
- `TauCeti.KTheory.RingKTheory.discrete_comparison` (compatibility): K(HR) agrees with the parent’s nonconnective K-theory of R, naturally in ring maps.

**Discriminating tests.**

- `TauCeti.KTheory.RingKTheory.test_sphere` (computation): Perf(S) is the category of finite spectra; K(S) is its K-theory.
- `TauCeti.KTheory.RingKTheory.test_zero` (degenerate): Perf(0) and K(0) are zero.
- `TauCeti.KTheory.RingKTheory.test_free_module` (compatibility): For an ordinary ring R, HR⊕HR corresponds to the rank-two projective module under the comparison.

**Check.**

- For an ordinary ring R, π0K(HR) is the existing projective K0(R), with the right/left-opposite convention explicit.

**Sources.** [bgt](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf), §4.3, Theorems 4.22–4.23, pp.770–771; §9.1, pp.806–808. Perfect modules provide the stable Morita model on which nonconnective K-theory is evaluated. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Notation, p.1015; proof of Proposition 3.6, pp.1023–1024. Fixes right-module conventions and uses the perfect-module comparison. [lt](https://arxiv.org/pdf/1808.05559), Lemma 1.10 and proof, manuscript p.9. Identifies a perfect stable category with a chosen thick generator as perfect right modules over its endomorphism ring.

<a id="kii-0-enhanced-s-construction"></a>
### The stable S-construction

**Target** `GeneralAlgebraicKTheoryPartII:KII.0/enhanced-s-construction` (construction · planet: Stable S-construction). For a small stable ∞-category C, let S_r(C) be its ∞-category of gap diagrams on Ar([r]): diagonal entries are zero and every subinterval square is a pushout. For r≥1 restriction identifies S_r(C)≃Fun([r−1],C), but its simplicial faces are the gap-diagram faces, including quotient faces. Iterated core realization and looping define Kconn(C); additivity gives Kconn(C)≃Ω|Kconn(S•C)|. Construct the comparison with the parent’s Waldhausen S-construction on a presenting Waldhausen category.

**Hypotheses.** C is small stable; its presenting Waldhausen model admits the required homotopy pushouts and weak-equivalence comparison. r≥1 is required for the chain equivalence. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E5:presentability/spectra`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `StableHomotopyKTheory:H.5:S-delooping`, `StableHomotopyKTheory:H.5:spectra`.

**Construction/proof outline.**

1. Construct interval diagrams with their quotient objects by finite colimits.
2. Use restriction to increasing chains to identify each positive simplicial degree; derive the faces from restriction of interval diagrams.
3. Transport Waldhausen additivity and delooping through the enhancement comparison, using the spectrum assembly supplied by H.5:S-delooping.

**Uses.** Proposition 3.6: Each simplicial stage has acyclic mapping spectra when C does. BGT nonconnective extension: The initial connective K-theory functor is assembled from this model.

**API.**

- `TauCeti.KTheory.EnhancedSConstruction.gap_diagram` (constructor): A filtration determines its compatible subquotients and hence an S_r object.
- `TauCeti.KTheory.EnhancedSConstruction.chain_equivalence` (equivalence): S_r(C)≃Fun([r−1],C) for r≥1, naturally in exact functors.
- `TauCeti.KTheory.EnhancedSConstruction.faces` (simp): The three faces of a cofiber sequence X→Y→Z select Z,Y,X in the usual S2 order.
- `TauCeti.KTheory.EnhancedSConstruction.deloop` (compatibility): The S-construction assembles the same connective spectrum as the parent’s Waldhausen model.

**Discriminating tests.**

- `TauCeti.KTheory.EnhancedSConstruction.test_degree_zero` (degenerate): S0(C) is terminal and stable, hence zero.
- `TauCeti.KTheory.EnhancedSConstruction.test_degree_two` (characterisation): An S2 object includes a specified cofiber identification, rather than just an arbitrary composable pair.
- `TauCeti.KTheory.EnhancedSConstruction.test_split_relation` (compatibility): The split sequence X→X⊕Y→Y gives [X⊕Y]=[X]+[Y] in π0Kconn(C).

**Check.**

- S0(C)=0, S1(C)=C and S2(C) is the category of cofiber sequences.

**Sources.** [bgt](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf), §7.1, pp.788–794. Constructs enhanced Waldhausen K-theory using its simplicial S-construction. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proof of Proposition 3.6, p.1024. Uses S_r(C)≃Fun([r−1],C) to pass vanishing through a delooping.

<a id="kii-0-nonconnective-k"></a>
### Nonconnective K-theory of stable categories

**Target** `GeneralAlgebraicKTheoryPartII:KII.0/nonconnective-k` (construction · planet: Nonconnective K-theory). Construct Knc:Cat∞perf→Sp by flasque enlargement and suspension: for a sufficiently large uncountable regular κ set FκC=(Ind_ω C)^κ, the κ-compact objects in the ordinary filtered Ind-completion, and set ΣκC=Idem(FκC/C). Define Knc(C) as the colimit of Ω^rKconn(Σκ^rC). Prove independence of the permitted κ, τ≥0Knc(C)≃Kconn(C), equivalence invariance and filtered-colimit preservation. For ordinary exact/Frobenius models compare with Bass–Schlichting K-theory. Knc is weakly localizing; connective K need not send every exact sequence to a fiber sequence.

**Hypotheses.** C is small stable idempotent-complete; κ is sufficiently large uncountable regular for the chosen universe. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The stable S-construction](#kii-0-enhanced-s-construction), [Perfect stable categories and localizing invariants](#kii-0-perfect-categories), `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:abstract/verdier-quotient`, `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`.

**Construction/proof outline.**

1. The κ-compact subcategory FκC contains countable coproducts because κ is uncountable regular; use their exact countable-sum swindle to make its connective K-theory zero.
2. Form the stable quotient FκC/C and its idempotent completion in Cat∞perf, then iterate the suspension comparison maps.
3. Check change of universe/κ using cofinal enlargement comparisons; prove localization by the quotient diagram and the parent’s fibration theorem.
4. Compare the enhancement of Frobenius pairs at each suspension stage, not just homotopy groups in nonnegative degrees.

**Uses.** Purity: The theorem applies to nonconnective rings and uses localization fiber sequences. Levy’s alternative proof: Its bounded t-structure fiber is evaluated with this functor.

**API.**

- `TauCeti.KTheory.NonconnectiveK.connective_cover` (compatibility): τ≥0Knc(C)≃Kconn(C), naturally in exact functors.
- `TauCeti.KTheory.NonconnectiveK.suspension` (equivalence): Knc(ΣκC)≃ΣKnc(C).
- `TauCeti.KTheory.NonconnectiveK.filtered_colimit` (functoriality): Filtered colimits in Cat∞perf are carried to colimits in Sp.
- `TauCeti.KTheory.NonconnectiveK.exact_fiber` (structure): An exact sequence C→D→E gives Knc(C)→Knc(D)→Knc(E) in all degrees.

**Discriminating tests.**

- `TauCeti.KTheory.NonconnectiveK.test_swindle` (degenerate): If C admits an exact endofunctor T with id⊕T≃T, then Knc(C)=0.
- `TauCeti.KTheory.NonconnectiveK.test_field` (compatibility): For a field k, π0Knc(Perf(Hk))=Z and the negative groups vanish by comparison with the parent.
- `TauCeti.KTheory.NonconnectiveK.test_quotient_completion` (non-example): Localization uses Idem(D/C); replacing it by an arbitrary underived categorical quotient does not give the comparison theorem.

**Check.**

- A flasque stable category has zero Knc, and the suspension quotient deloops it in all integer degrees.

**Sources.** [bgt](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf), Definitions 9.1 and 9.6, pp.806–808; Theorems 9.8 and 9.10 with proofs, §§9.2–9.3, pp.808–816. Builds nonconnective K-theory and establishes its localization properties.

<a id="kii-0-thomason-neeman"></a>
### Thomason–Neeman localization

**Target** `GeneralAlgebraicKTheoryPartII:KII.0/thomason-neeman` (theorem · planet: Thomason–Neeman localization). Let q:D→E be an exact colimit-preserving localization of compactly generated presentable stable ∞-categories. Suppose its kernel is generated as a localizing subcategory by a set of compact objects of D. Then q preserves compacts and ker(q)^ω→D^ω→E^ω is exact after idempotent completion of the quotient. Consequently K(ker(q)^ω)→K(D^ω)→K(E^ω) is a fiber sequence.

**Hypotheses.** q is an exact colimit-preserving localization between compactly generated presentable stable categories. Its kernel is generated by objects compact in the source. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Nonconnective K-theory of stable categories](#kii-0-nonconnective-k), `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:abstract/verdier-quotient`, `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`.

**Construction/proof outline.**

1. Use the right-adjoint characterization of a localization and the compact kernel generators to show the quotient remains compactly generated.
2. Identify its compact objects as retracts of images of compacts of D.
3. Apply the enhanced quotient universal property, then the localizing-invariant axiom for Knc.

**Check.**

- Localization of Mod_A at a smashing spectral localization gives a K-theory fiber sequence once its finite compact kernel generators have been supplied.

**Sources.** [bgt](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf), §5.2, Propositions 5.14–5.15, pp.777–779. Relates exact sequences and compactly generated stable quotients. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Lemma 3.7 and its proof, pp.1024–1025. Uses this localization theorem with finite chromatic kernel generators.

<a id="kii-1"></a>
## KII.1. Connective and additive comparisons

Extend the classical plus and group-completion comparisons to connective ring spectra and additive ∞-categories. Establish additive Morita theory and A-theory without trace imports.

**Stage inputs.** `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `GeneralAlgebraicKTheory:K.2:plus`, `GeneralAlgebraicKTheoryPartII:KII.0`, `StableHomotopyKTheory:H.3`, `StableHomotopyKTheory:H.5:spectra`.

<a id="kii-1-connective-plus"></a>
### General linear groups of connective ring spectra

**Target** `GeneralAlgebraicKTheoryPartII:KII.1/connective-plus` (construction · planet: Connective plus comparison). For connective E1-ring A, GL_r(A) is the union of the invertible components of Ω∞Mat_r(A), and GL(A)=colim_r GL_r(A) under block sum with 1. The connected positive K-space is BGL(A)+: Ω∞τ≥1K(A)≃BGL(A)+, with plus taken for the elementary subgroup in π0GL(A). The comparison BGL(A)→BGL(π0A) induces the positive K-theory truncation comparison after plus; no fiber-sequence or splitting assertion about these three spaces is included.

**Hypotheses.** A is connective E1; stabilization is under block sum with 1. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), [The stable S-construction](#kii-0-enhanced-s-construction), `StableHomotopyKTheory:H.3`, `GeneralAlgebraicKTheory:K.2:plus`.

**Construction/proof outline.**

1. Define invertibility on π0 and use matrix multiplication on ring spectra.
2. Compare finite free module automorphisms with their core, stabilize, then apply the parent’s plus/group-completion theorem to the connective enrichment.
3. Identify the rank-zero positive component and prove naturality under A→π0A; use the acyclic-map characterization of plus in relative comparisons.

**Uses.** Proposition 3.1: Highly connective chromatic equivalences are detected on GL and then passed through plus. Waldhausen truncation: Relative homology of GL controls p-adic/rational K-theory.

**API.**

- `TauCeti.KTheory.ConnectivePlus.components` (characterisation): π0GL_r(A)=GL_r(π0A).
- `TauCeti.KTheory.ConnectivePlus.stabilize` (functoriality): Block sum with 1 gives compatible GL_r(A)→GL_{r+1}(A).
- `TauCeti.KTheory.ConnectivePlus.positive_k` (equivalence): BGL(A)+≃Ω∞τ≥1K(A), naturally in connective A.
- `TauCeti.KTheory.ConnectivePlus.relative_plus` (compatibility): For a π0-isomorphism A→B, the natural square of BGL spaces and their positive K-space plus comparisons transports relative homology estimates through the acyclic plus maps; no identification of the relative K-space with plus applied to an arbitrary fiber is assumed.

**Discriminating tests.**

- `TauCeti.KTheory.ConnectivePlus.test_discrete` (compatibility): GL_r(HR) is the ordinary discrete general linear group GL_r(R).
- `TauCeti.KTheory.ConnectivePlus.test_higher_homotopy` (non-example): For square-zero S⊕ΣM, positive homotopy in Mat_r(ΣM) appears in the identity component of GL_r; taking only GL_r(π0A) loses it.
- `TauCeti.KTheory.ConnectivePlus.test_rank_one` (computation): π0GL_1(HZ) consists of 1 and −1.

**Check.**

- For HA the construction recovers the classical GL_r(A) and plus map; higher homotopy of A survives before plus.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proof of Proposition 3.1, pp.1021–1022. Uses the connective-ring plus description and relative general linear groups. [lt](https://arxiv.org/pdf/1808.05559), Lemma 2.4 and proof, manuscript pp.16–17. Uses the general-linear/plus comparison to control relative K-connectivity. [bgt](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf), Lemma 9.39 and Proposition 9.40, pp.819–820. Identifies the positive K-space of a connective ring spectrum with its stable general linear plus construction.

<a id="kii-1-additive-k"></a>
### Additive ∞-categories and group-completion K-theory

**Target** `GeneralAlgebraicKTheoryPartII:KII.1/additive-k` (definition · planet: Additive K-theory). An additive ∞-category C has finite biproducts and grouplike E∞ mapping spaces compatible with composition. Its connective mapping spectrum hom_C(X,Y) has Ω∞ equal to its mapping space. Define Kadd(C) as the connective spectrum corresponding to the group completion of the E∞ space C≃ under ⊕. If C is stable, hom_C(X,Y)=τ≥0Hom_C(X,Y); the full mapping spectrum Hom may have negative homotopy. For connective A, Kadd(Projω(A))≃τ≥0K(A), where Projω(A) consists of retracts of finite sums of A.

**Hypotheses.** C is small additive; A is connective for the projective comparison. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), [General linear groups of connective ring spectra](#kii-1-connective-plus), `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E5:presentability/spectra`, `StableHomotopyKTheory:H.5:spectra`.

**Construction/proof outline.**

1. Extract additive enrichment from biproducts and group complete the symmetric-monoidal core.
2. Compare finite free/retract module presentations with the plus construction, retaining the K0 component.
3. For stable C use the mapping-spectrum lifting from EDS and take its connective cover; do not confuse hom and Hom.

**Uses.** Proposition 3.6: Reduces categories with acyclic endomorphism spectra to connective rings. Corollary 4.31: Compares a generating additive subcategory with stable K-theory.

**API.**

- `TauCeti.KTheory.AdditiveK.map` (functoriality): Additive functors induce Kadd maps preserving identities and composition.
- `TauCeti.KTheory.AdditiveK.group_completion` (universal-property): Maps from Ω∞Kadd(C) into a grouplike E∞ space are additive maps from C≃.
- `TauCeti.KTheory.AdditiveK.mapping_cover` (compatibility): For stable C, hom_C(X,Y)≃τ≥0Hom_C(X,Y).
- `TauCeti.KTheory.AdditiveK.projectives` (equivalence): Kadd(Projω(A))≃τ≥0K(A) for connective A.

**Discriminating tests.**

- `TauCeti.KTheory.AdditiveK.test_zero` (degenerate): The zero additive category has Kadd=0.
- `TauCeti.KTheory.AdditiveK.test_rank` (computation): π0Kadd(finite-dimensional k-vector spaces)≃Z, not N.
- `TauCeti.KTheory.AdditiveK.test_negative_mapping` (non-example): For stable C and X,Y with negative full Hom groups, hom_C(X,Y) has no negative groups and cannot equal Hom_C(X,Y).

**Check.**

- For a split additive category of finite-dimensional vector spaces, Kadd has π0=Z, with its generator the one-dimensional space.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Definition and discussion preceding Proposition 3.6, p.1023. Defines additive K and distinguishes connective from full mapping spectra. [hs](https://arxiv.org/pdf/2103.13911), Corollary 8.1.3, manuscript pp.70–71. Compares additive group completion with the stable envelope.

<a id="kii-1-additive-morita"></a>
### Additive and stable Schwede–Shipley comparison

**Target** `GeneralAlgebraicKTheoryPartII:KII.1/additive-morita` (theorem · planet: Additive Morita theory). If C is small additive idempotent-complete and generated under finite sums and retracts by X, then C≃Projω(hom_C(X,X)). If C is stable idempotent-complete and thickly generated by X, then C≃Perf(Hom_C(X,X)). The ring acts on Hom(X,−) by precomposition as a right action. Every small additive category is a filtered colimit of its full finite-generator additive/retract closures, after the required idempotent completion.

**Hypotheses.** C is idempotent-complete. Additive generation is by sums/retracts; stable generation is by shifts/cofibers/retracts. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Additive ∞-categories and group-completion K-theory](#kii-1-additive-k), [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, `EnhancedDerivedSheaves:E5:presentability/ind-completion`.

**Construction/proof outline.**

1. Apply enriched Yoneda and identify finite sums/retracts of the representable generator with finite projectives.
2. For the stable statement extend Yoneda across finite cofibers and retracts.
3. Index finitely many objects by their direct sum and use filtered unions; Kadd and Knc commute with these filtered colimits.

**Check.**

- The one-object generator A recovers Projω(A) and Perf(A), with End(A) rather than its opposite because right modules were chosen.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proofs of Proposition 3.6, p.1023, and Corollary 4.31, p.1035. Uses the two forms of Morita theory and the finite-generator reduction. [bgt](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf), §4.3, Theorems 4.22–4.23, pp.770–771. Provides the stable Morita comparison.

<a id="kii-1-a-theory"></a>
### Waldhausen A-theory

**Target** `GeneralAlgebraicKTheoryPartII:KII.1/a-theory` (definition · planet: Waldhausen A-theory). For a pointed connected space X define A(X)=K(S[ΩX]) with S[ΩX]=Σ∞_+ΩX, multiplication induced by loop concatenation. Compare τ≥0A(X) with the classical connective K-theory of homotopy-finitely dominated retractive spaces over X (retracts of finite relative cell objects) through the stabilization model. A based map X→Y yields A(X)→A(Y); the unit and augmentation give A(*)→A(X)→A(*) with composite identity. The homotopy-finite variant agrees in positive K-groups, but its K0 need not agree before retract completion.

**Hypotheses.** X is pointed connected; the retractive-space comparison uses finitely dominated objects and the connective cover. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), [The stable S-construction](#kii-0-enhanced-s-construction), `EnhancedDerivedSheaves:E5:presentability/spectra`.

**Construction/proof outline.**

1. Construct the associative suspension-spectrum loop algebra and identify its perfect modules with compact parametrized spectra over X.
2. Stabilize finitely dominated retractive objects, retaining all retracts of finite relative cells; apply the Waldhausen stabilization and enhanced-model comparisons. Restricting to finite relative cells alone does not justify the K0 comparison.
3. Identify the two maps from unit/augmentation and check naturality.

**Uses.** Corollary 4.14: The James splitting controls A(ΣW) by the reduced suspension spectrum of W.

**API.**

- `TauCeti.KTheory.ATheory.map` (functoriality): Based maps of connected spaces give maps of A-theory spectra with coherent identity/composition.
- `TauCeti.KTheory.ATheory.unit_augmentation` (relation): A(*)→A(X)→A(*) is the identity.
- `TauCeti.KTheory.ATheory.loop_ring` (compatibility): A(X) agrees with K(Σ∞_+ΩX).
- `TauCeti.KTheory.ATheory.retractive_comparison` (equivalence): The finitely dominated retractive-space Waldhausen model has connective K-theory τ≥0A(X), including its K0 component.

**Discriminating tests.**

- `TauCeti.KTheory.ATheory.test_point` (degenerate): A(*)≃K(S).
- `TauCeti.KTheory.ATheory.test_circle` (compatibility): A(S1)≃K(S[Z]), where ΩS1 is the discrete group Z up to equivalence.
- `TauCeti.KTheory.ATheory.test_finiteness_boundary` (non-example): For X with a nontrivial reduced projective class group of Z[π1X], the finite-cell model has K0=Z whereas the finitely dominated model detects K0(Z[π1X]); a comparison omitting retracts must fail this test.

**Check.**

- A(*)=K(S), and the augmentation splits the constant-space unit map.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.14 and preceding definition, p.1030. Defines A-theory in the ring-spectrum model and uses the splitting. [cdh](https://bcalmes.perso.math.cnrs.fr/pro/recherche/publis/hermpoinc-one/HermKstableI.pdf), §4.4 opening, manuscript p.84; discussion preceding Lemma 4.4.11, pp.89–90. Identifies compact parametrized spectra with perfect S[ΩX]-modules for pointed connected X, and with the stabilization of finitely dominated retractive spaces.

<a id="kii-2"></a>
## KII.2. Pullbacks, truncation and excision

Construct the Land–Tamme replacement ring and prove its invariant pullback formula, truncating excision, Waldhausen truncation and nonpositive K comparisons. These remain independent of THH and TC.

**Stage inputs.** `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `GeneralAlgebraicKTheory:K.6`, `GeneralAlgebraicKTheoryPartII:KII.0`, `GeneralAlgebraicKTheoryPartII:KII.1`.

<a id="kii-2-amalgam"></a>
### The Land–Tamme replacement algebra

**Target** `GeneralAlgebraicKTheoryPartII:KII.2/amalgam` (construction · planet: Land–Tamme pullback theorem). For a homotopy pullback square of E1-rings A→B, A→A′, B→B′, A′→B′, construct C=A′⊙_A^{B′}B together with the canonical square A′→C, B→C. Its underlying spectrum is A′⊗_A B with the multiplication determined by the square, and C→B′ is the canonical multiplication map on that spectrum. Every weakly localizing invariant sends the square A→B, A′→C to a pullback square. No ordinary tensor-product E1-algebra structure on A′⊗_A B is assumed.

**Hypotheses.** The input square is a homotopy pullback of E1-rings; connectivity is not required for the general formula. The invariant is weakly localizing. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Perfect stable categories and localizing invariants](#kii-0-perfect-categories), [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), [Thomason–Neeman localization](#kii-0-thomason-neeman), `EnhancedDerivedSheaves:E5:abstract/verdier-quotient`.

**Construction/proof outline.**

1. Form the lax pullback of perfect module categories and its full subcategory of glued objects.
2. Take the stable quotient, identify a compact generator, and define C by its endomorphism E1-algebra.
3. Compute its underlying bimodule as A′⊗_A B; the exact sequences and additivity identify the invariant square.

**Uses.** Lemma 3.2: The explicit underlying bimodule gives the connectivity estimate. Truncating excision: Comparison of π0C with π0B′ gives a pullback after truncation.

**API.**

- `TauCeti.KTheory.Amalgam.to_corner` (projection): C→B′ has underlying map A′⊗_A B→B′.
- `TauCeti.KTheory.Amalgam.underlying_bimodule` (compatibility): The underlying (A′,B)-bimodule of C is A′⊗_A B.
- `TauCeti.KTheory.Amalgam.invariant_square` (universal-property): The constructed replacement square is cartesian after any weakly localizing invariant.
- `TauCeti.KTheory.Amalgam.natural_square` (functoriality): Maps of pullback squares induce the replacement algebra maps coherently.

**Discriminating tests.**

- `TauCeti.KTheory.Amalgam.test_identity` (degenerate): For the identity pullback square on A, C≃A.
- `TauCeti.KTheory.Amalgam.test_tor_unital` (characterisation): If A′⊗_A B≃B′, the original invariant square is cartesian.
- `TauCeti.KTheory.Amalgam.test_noncommutative` (non-example): The construction applies to E1-rings without an E2 structure on A; an ordinary commutative tensor product cannot be used as its definition.

**Check.**

- If A′⊗_A B→B′ is an equivalence, every such invariant carries the original square to a pullback.

**Sources.** [lt](https://arxiv.org/pdf/1808.05559), Theorem 1.3 and proof, manuscript pp.6–14. Constructs the replacement E1-algebra through the lax pullback and identifies its underlying spectrum.

<a id="kii-2-truncating"></a>
### Truncating invariants on acyclic rings

**Target** `GeneralAlgebraicKTheoryPartII:KII.2/truncating` (definition · planet: Truncating invariants). For a spectrum M and weakly localizing F:Cat∞perf→V, say F is truncating on M-acyclic connective rings if F(R)→F(Hπ0R) is an equivalence for every connective E1-ring R with M⊗R=0. Globally truncating means this for all connective R. Use the induced module action of R to check that its ring Postnikov truncations remain M-acyclic. The definition includes no hypothesis that F commutes with limits or filtered colimits.

**Hypotheses.** F is weakly localizing; M is a spectrum; the rings in the predicate are connective and unital. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Perfect stable categories and localizing invariants](#kii-0-perfect-categories), [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), `EnhancedDerivedSheaves:E5:presentability/spectra`.

**Construction/proof outline.**

1. Define the restricted predicate using the concrete truncation ring map.
2. Prove that M-acyclicity of a unital R forces acyclicity of every R-module, in particular Hπ0R and τ≤kR.
3. Separate the restricted and global predicates so that global excision is applied only after checking its ring inputs.

**Uses.** Proposition 3.4: Telescopic K is truncating on finite-localization-acyclic rings. Height-one consequences: The restricted statement plus excision proves nilinvariance and homotopy invariance.

**API.**

- `TauCeti.KTheory.Truncating.apply` (projection): Restricted truncation gives the specified natural equivalence F(R)→F(Hπ0R).
- `TauCeti.KTheory.Truncating.postnikov_acyclic` (compatibility): Every τ≤kR is M-acyclic when R is a unital M-acyclic connective ring.
- `TauCeti.KTheory.Truncating.restrict` (functoriality): If every N-acyclic ring is M-acyclic, M-restricted truncation implies N-restricted truncation.
- `TauCeti.KTheory.Truncating.global` (characterisation): Global truncation is restricted truncation for M=0.

**Discriminating tests.**

- `TauCeti.KTheory.Truncating.test_zero` (degenerate): The zero invariant is truncating for every M.
- `TauCeti.KTheory.Truncating.test_discrete` (compatibility): For discrete R the truncation comparison is the identity.
- `TauCeti.KTheory.Truncating.test_no_continuity` (non-example): The definition imposes no interchange of F with a Postnikov inverse limit; the finite-stage reduction must be proved separately.

**Check.**

- A constant zero invariant is globally truncating; K itself is not globally truncating.

**Sources.** [lt](https://arxiv.org/pdf/1808.05559), Definition 3.1, manuscript p.28. Defines truncating invariants. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Definition before Lemma 3.3, p.1022. Introduces truncation restricted to acyclic rings.

<a id="kii-2-truncating-excision"></a>
### Excision and nilinvariance for truncating invariants

**Target** `GeneralAlgebraicKTheoryPartII:KII.2/truncating-excision` (theorem · planet: Truncating excision). A globally truncating weakly localizing invariant is invariant under quotienting a discrete ring by a nilpotent ideal, and sends every Milnor square of discrete rings with a surjective side to a cartesian square. More generally apply the replacement-algebra theorem to connective ring pullbacks for which π0(A′)⊗_{π0A}π0(B)→π0(B′) is an isomorphism. The same proof applies to restricted truncation when every auxiliary connective replacement ring lies in the acyclic domain.

**Hypotheses.** F is globally truncating, or all auxiliary rings have been proved to belong to its restricted acyclic domain. The Milnor square is discrete with a surjective side. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The Land–Tamme replacement algebra](#kii-2-amalgam), [Truncating invariants on acyclic rings](#kii-2-truncating).

**Construction/proof outline.**

1. Use the replacement-algebra theorem and compare π0C with π0B′ under the displayed tensor condition.
2. Replace C and B′ by their discrete π0 rings under F.
3. Deduce nilinvariance via the cone-ring pullback associated to a nilpotent ideal, as in Land–Tamme Corollary 3.5; verify closure of each restricted domain separately.

**Check.**

- An ordinary Milnor square with a surjective map is an instance, while an arbitrary square of connective rings is not.

**Sources.** [lt](https://arxiv.org/pdf/1808.05559), Theorem 3.3 and Corollary 3.5 with proofs, manuscript pp.29–30. Proves truncating excision and nilinvariance without a continuity assumption.

<a id="kii-2-waldhausen-truncation"></a>
### Rational and p-adic truncation

**Target** `GeneralAlgebraicKTheoryPartII:KII.2/waldhausen-truncation` (theorem · planet: Waldhausen truncation). Let Λ be a localization of Z or Z/m for an integer m≥2. If f:A→B is a map of connective E1-rings inducing an isomorphism on π0, and Λ⊗f is n-connective for n≥1, then Λ⊗K(f) is (n+1)-connective. Here tensor with Z/m means Moore coefficients, and Λ-connectivity is measured on the coefficient fiber. In particular a Q- or Z/p-homology equivalence f with π0f an isomorphism induces the same equivalence on K. Thus K(R)→K(Hπ0R) is a rational equivalence for rationally discrete R, and a p-adic equivalence whenever R→Hπ0R is one; this includes every connective Z[1/p]-algebra ring spectrum.

**Hypotheses.** A→B is connective E1 and induces a π0-isomorphism. Λ is any localization of Z or Z/m for m≥2; the quantitative version requires n≥1. The rational and mod-p equivalence consequences take Λ=Q and Z/p respectively. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [General linear groups of connective ring spectra](#kii-1-connective-plus), [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), `EnhancedDerivedSheaves:E5:presentability/spectra`.

**Construction/proof outline.**

1. Control matrix ring and general-linear relative homology by the map A→B.
2. Use plus invariance of homology and the Serre-class relative Hurewicz/Whitehead argument.
3. Apply the quantitative statement to all finite connectivity levels to obtain rational and mod-p equivalences; retain π0-isomorphism throughout.

**Check.**

- For S[1/p]→HZ[1/p], K(S[1/p])→K(Z[1/p]) is a p-adic equivalence.

**Sources.** [lt](https://arxiv.org/pdf/1808.05559), Lemma 2.4 and proof, manuscript pp.16–17. Provides the homology-connectivity form of Waldhausen truncation. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proof of Theorem 3.8(ii), p.1025. Applies p-adic truncation after inverting p.

<a id="kii-2-nonpositive"></a>
### Nonpositive K-theory of connective rings

**Target** `GeneralAlgebraicKTheoryPartII:KII.2/nonpositive` (comparison). For every connective E1-ring R, the map K_j(R)→K_j(π0R) is an isomorphism for all j≤0, naturally in ring maps. The parent’s Bass–Schlichting comparison identifies the target with its ordinary nonconnective ring K-theory. No nilpotent K0 theorem is assumed in this foundational comparison.

**Hypotheses.** R is connective E1 and j≤0. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Nonconnective K-theory of stable categories](#kii-0-nonconnective-k), [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`.

**Construction/proof outline.**

1. Identify K0 of perfect modules using connective projective retract presentations.
2. Compare the flasque enlargement and suspension used to construct negative K, as in BGT Theorem 9.53.
3. Use the parent’s comparison on ordinary rings to retain its existing Bass–Schlichting normalization.

**Check.**

- For connective R with π0R=Z, K0(R)=Z and all negative K groups vanish.

**Sources.** [bgt](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf), Theorem 9.53 and proof, pp.825–826. Proves that nonpositive K of connective rings depends only on π0.

<a id="kii-3"></a>
## KII.3. Stable envelopes and bounded hearts

Construct the idempotent-complete stable envelope of an additive ∞-category, enhance the existing triangulated t-structure interface, prove the connective theorem of the heart and the noetherian nonconnective version, and establish the bounded-heart fiber used by Levy’s proof.

**Stage inputs.** `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `GeneralAlgebraicKTheory:K.3`, `GeneralAlgebraicKTheoryPartII:KII.0`, `GeneralAlgebraicKTheoryPartII:KII.1`.

<a id="kii-3-bounded-t-structure"></a>
### Bounded t-structures on stable ∞-categories

**Target** `GeneralAlgebraicKTheoryPartII:KII.3/bounded-t-structure` (definition · planet: Bounded t-structures). A t-structure on a small stable ∞-category C is a t-structure on hC with full subcategories C≥0,C≤0 lifted to C; orthogonality and truncation triangles enhance to the truncation adjunctions. It is bounded if every object lies in C≥a∩C≤b for some integers a≤b depending on the object. The heart C♥=C≥0∩C≤0 is an ordinary abelian category. Reuse CategoryTheory.Triangulated.TStructure and its bounded object predicate on hC, with an explicit conversion from Mathlib’s cohomological shift to the homological spectral convention.

**Hypotheses.** C is small stable with the imported triangulated structure on hC. Bounds are allowed to depend on the object. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E5:presentability/spectra`, `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:CategoryTheory.Triangulated.TStructure.bounded`.

**Construction/proof outline.**

1. Lift the two full subcategories along C→hC and recover the enhanced truncation adjoints from mapping-space orthogonality.
2. Use the stable/triangulated shift comparison from E0 to fix the index signs.
3. Identify the heart’s mapping spaces as discrete and compare its kernels/cokernels with truncations of fibers/cofibers.

**Uses.** Theorem of the heart: Boundedness permits finite Postnikov devissage. Proposition 3.12: The kernel stable category has a bounded t-structure, giving its K-theory chromatic bound.

**API.**

- `TauCeti.KTheory.BoundedTStructure.truncation_adjoints` (universal-property): The truncation maps realize the appropriate reflection/coreflection onto C≤b and C≥a.
- `TauCeti.KTheory.BoundedTStructure.bounded_iff` (compatibility): An object is bounded exactly when its image satisfies the existing bounded predicate on hC, after changing the shift convention.
- `TauCeti.KTheory.BoundedTStructure.heart_abelian` (structure): The heart is an abelian category with short exact sequences induced by cofiber sequences.
- `TauCeti.KTheory.BoundedTStructure.amplitude_shift` (relation): Σ sends homological amplitude [a,b] to [a+1,b+1].

**Discriminating tests.**

- `TauCeti.KTheory.BoundedTStructure.test_field_heart` (computation): The standard heart of Perf(Hk) for a field k is finite-dimensional k-vector spaces.
- `TauCeti.KTheory.BoundedTStructure.test_objectwise_bound` (characterisation): The shifts Σ^rHk are all bounded, although no single interval contains them all.
- `TauCeti.KTheory.BoundedTStructure.test_not_all_finite_spectra` (non-example): The Postnikov t-structure of Sp does not restrict to finite spectra: τ≤0S=HZ is not finite.

**Check.**

- Perf(Hk), for a field k, has the bounded standard t-structure with heart finite-dimensional k-vector spaces.

**Sources.** [barwick](https://arxiv.org/pdf/1212.5232), Theorem 6.1 and preceding conventions, manuscript pp.19–21. Uses bounded t-structures and their hearts in connective K-theory. [agh](https://arxiv.org/pdf/1610.07207), §§2.1–2.2, Definitions 2.1, 2.4 and 2.7, manuscript pp.5–7. Fixes the enhanced t-structure and boundedness setting.

<a id="kii-3-stable-envelope"></a>
### Stable envelopes and additive nonconnective K-theory

**Target** `GeneralAlgebraicKTheoryPartII:KII.3/stable-envelope` (construction · planet: Stable envelope). For a small idempotent-complete additive ∞-category C, put Stab(C)=Funadd(Cop,Sp)^ω, the thick closure of the additive spectral Yoneda objects. This is the idempotent-complete stable envelope. An additive functor from C into a stable idempotent-complete category extends uniquely to an exact functor from Stab(C). Define Kadd,nc(C)=Knc(Stab(C)); prove τ≥0Kadd,nc(C)≃Kadd(C). For stable C, Yoneda uses the connective hom spectrum before stable extension; Stab(C) is not identified with C merely because C is already stable.

**Hypotheses.** C is small idempotent-complete additive; the extension target is stable and idempotent-complete. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Additive ∞-categories and group-completion K-theory](#kii-1-additive-k), [Nonconnective K-theory of stable categories](#kii-0-nonconnective-k), `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, `EnhancedDerivedSheaves:E5:presentability/spectra`.

**Construction/proof outline.**

1. Use additive spectrum-valued presheaves and enriched Yoneda; the representables are compact generators.
2. Take their finite stable retract closure and prove the extension universal property.
3. Apply Hebestreit–Steimle’s group-completion theorem to the finite stable envelope. The assumed idempotent completeness of C makes its bounded weight heart idempotent-complete and hence its stable envelope idempotent-complete; justify this before identifying the thick envelope. Do not invoke invariance of connective K0 under arbitrary idempotent completion.

**Uses.** Proposition 3.12: Its localization Stab(C)→C produces the bounded-heart kernel. Corollary 4.31: It relates group completion of additive generators to stable K-theory.

**API.**

- `TauCeti.KTheory.StableEnvelope.yoneda` (constructor): y:C→Stab(C) is additive and fully faithful with connective mapping spectra.
- `TauCeti.KTheory.StableEnvelope.extend` (universal-property): Restriction along y is an equivalence from exact functors Stab(C)→D to additive functors C→D for stable idempotent-complete D.
- `TauCeti.KTheory.StableEnvelope.additive_cover` (equivalence): τ≥0Knc(Stab(C))≃Kadd(C).
- `TauCeti.KTheory.StableEnvelope.map` (functoriality): Additive C→D induces exact Stab(C)→Stab(D), compatibly with the Yoneda maps.

**Discriminating tests.**

- `TauCeti.KTheory.StableEnvelope.test_projectives` (compatibility): Stab(Projω(A))≃Perf(A) for connective A.
- `TauCeti.KTheory.StableEnvelope.test_zero` (degenerate): Stab(0)=0 and Kadd,nc(0)=0.
- `TauCeti.KTheory.StableEnvelope.test_stable_input` (non-example): For stable C, y need not preserve C’s cofiber sequences; the comparison Stab(C)→C is a separate exact localization.

**Check.**

- For C=Projω(A) with A connective, Stab(C)≃Perf(A), so Kadd,nc(C)≃K(A).

**Sources.** [hs](https://arxiv.org/pdf/2103.13911), §3.1, manuscript pp.17–19; Corollary 8.1.3, pp.70–71. Provides stable-envelope and group-completion comparisons; the idempotent-complete hull is specified here. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Discussion before Proposition 3.12, pp.1026–1027. Defines nonconnective additive K through the stable envelope.

<a id="kii-3-theorem-heart"></a>
### The theorem of the heart and noetherian extension

**Target** `GeneralAlgebraicKTheoryPartII:KII.3/theorem-heart` (theorem · planet: Theorem of the heart). If C is small stable with a bounded t-structure, inclusion of the heart gives Kconn(C♥)≃Kconn(C), naturally for t-exact functors. If the heart is additionally noetherian, the same inclusion gives Knc(C♥)≃Knc(C). The latter extra hypothesis is retained; a general bounded heart is not used to assert a full nonconnective equivalence.

**Hypotheses.** The t-structure is bounded. The full nonconnective comparison additionally requires a noetherian heart. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Bounded t-structures on stable ∞-categories](#kii-3-bounded-t-structure), [The stable S-construction](#kii-0-enhanced-s-construction), [Nonconnective K-theory of stable categories](#kii-0-nonconnective-k), `GeneralAlgebraicKTheory:K.3/devissage-theorem`.

**Construction/proof outline.**

1. Give the connective aisle its maximal Waldhausen structure and use truncation to compare its K-theory to C.
2. Apply the fibration/additivity argument to the acyclic truncation subcategory, then use the opposite category to isolate the heart.
3. For noetherian hearts apply AGH’s negative-K induction and vanishing argument before promoting the connective comparison to all degrees.

**Check.**

- For k a field, K(Perf(Hk))≃K(finite-dimensional k-vector spaces); boundedness alone gives only the connective comparison used later.

**Sources.** [barwick](https://arxiv.org/pdf/1212.5232), Theorem 6.1 and proof, manuscript pp.19–23. Proves the connective theorem of the heart. [agh](https://arxiv.org/pdf/1610.07207), Theorem 3.18 and proof, manuscript pp.27–29. Supplies the nonconnective theorem with noetherian heart.

<a id="kii-3-regular-localization"></a>
### Regular ring-spectrum devissage

**Target** `GeneralAlgebraicKTheoryPartII:KII.3/regular-localization` (theorem · planet: Regular localization). Let R be connective, with π0R right regular noetherian and each πnR finitely generated as a right π0R-module. Here right regular for π0R means that every finitely generated right module has finite projective dimension. Assume every R-module M with ⊕nπnM finitely presented over π0R is perfect. Let R→S induce a localization Mod_R→Mod_S whose kernel is generated by a compact object (equivalently a finite set of compact objects). Suppose a perfect M is killed by extension to S exactly when ⊕nπnM is finitely presented over π0R. Then K(π0R)→K(R)→K(S) is a fiber sequence. The first map uses restriction from discrete π0R-modules, resolution and devissage; it is not generally extension along a ring map π0R→R.

**Hypotheses.** π0R is right regular noetherian; every πnR is finitely generated over π0R; R is connective. Every bounded R-module whose homotopy groups are finitely presented over π0R is perfect. Extension Mod_R→Mod_S is a localization with kernel generated by finitely many compact objects. A perfect module is in that kernel if and only if its total graded homotopy is finitely presented over π0R. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Thomason–Neeman localization](#kii-0-thomason-neeman), [The theorem of the heart and noetherian extension](#kii-3-theorem-heart), [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory).

**Construction/proof outline.**

1. Use compact generation of the localization kernel to identify its compact objects with the bounded coherent R-modules. The finiteness of πnR and right noetherian π0R ensure that the standard truncations stay coherent.
2. Its standard t-structure is bounded with noetherian heart the finitely presented π0R-modules. Right regularity of π0R identifies the heart’s G-theory with projective K(π0R); apply the noetherian theorem of the heart.
3. Apply the nonconnective localization fiber sequence.

**Check.**

- If π*R=π0R[u] with u positive even and π0R regular noetherian, inverting u gives this fiber sequence; verify these conditions before using the example.

**Sources.** [agh](https://arxiv.org/pdf/1610.07207), §4.2 definitions and Proposition 4.4, manuscript p.34; Example 4.6, p.35. States the regular-localization criterion and the polynomial periodicity example.

<a id="kii-3-freyd-truncation"></a>
### Finite-limit control of the stable envelope

**Target** `GeneralAlgebraicKTheoryPartII:KII.3/freyd-truncation` (lemma). For a small additive ∞-category C with finite limits, its perfect prestable additive-presheaf envelope A∞ω(C) is closed under finite limits inside additive presheaves of spaces. In the bounded-heart kernel of Stab(C)→C for C stable, the standard presheaf t-structure restricts to the kernel and every object has finite amplitude. This is the finite-limit input; closure under finite colimits alone would not establish restriction of truncations.

**Hypotheses.** C is small additive with finite limits; the kernel application uses stable C. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Stable envelopes and additive nonconnective K-theory](#kii-3-stable-envelope), [Bounded t-structures on stable ∞-categories](#kii-3-bounded-t-structure).

**Construction/proof outline.**

1. Use the finite-presentation description of discrete additive presheaves as cokernels of maps of representables.
2. Apply the finite-limit argument to iterated loops and perfect presheaf presentations; use the representability criterion after sufficiently many loops.
3. Apply this prestable finite-limit closure to the stable finite-cell envelope and to the kernel generators coming from cofiber relations.

**Check.**

- The claim is used only for stable C, which has all finite limits; no claim is made for an arbitrary additive C lacking them.

**Sources.** [pp](https://arxiv.org/pdf/2110.03669v1), Lemmas 4.24–4.25 and Theorem 4.26 with proof, manuscript pp.35–36. Proves the perfect prestable Freyd-envelope finite-limit statement. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proof of Proposition 3.12, p.1027. Uses that theorem to restrict the t-structure to the relation kernel.

<a id="kii-3-bounded-heart-fiber"></a>
### Levy’s bounded-heart fiber

**Target** `GeneralAlgebraicKTheoryPartII:KII.3/bounded-heart-fiber` (theorem · planet: Levy’s bounded-heart fiber). For every small idempotent-complete stable C, the exact extension Stab(C)→C is a localization with kernel D, and K(D)→Kadd,nc(C)→K(C) is a fiber sequence. The kernel D has a bounded t-structure, with no noetherian-heart assumption. This is the categorical construction underlying Levy’s alternative proof; its chromatic corollaries are separate targets in KII.10.

**Hypotheses.** C is small stable idempotent-complete. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Stable envelopes and additive nonconnective K-theory](#kii-3-stable-envelope), [Finite-limit control of the stable envelope](#kii-3-freyd-truncation), [The theorem of the heart and noetherian extension](#kii-3-theorem-heart), [Thomason–Neeman localization](#kii-0-thomason-neeman), `GeneralAlgebraicKTheory:K.3/devissage-theorem`.

**Construction/proof outline.**

1. Extend id_C additively from the stable envelope and identify Funex(Cop,Sp)≃Ind(C) as its localization.
2. Generate its kernel by cofibers of the maps cofib(yA→yB)→yC for cofiber sequences A→B→C in C; these relation objects lie in the heart.
3. Use finite-limit control to restrict the presheaf t-structure, then finite generation by heart objects to obtain boundedness.
4. Apply nonconnective localization to the kernel; use the connective theorem of the heart only when the later chromatic corollary is proved.

**Check.**

- The kernel is generated by the specified cofiber-relation objects, not by arbitrary objects of Stab(C). A bounded heart does not by itself imply a full nonconnective heart comparison.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proposition 3.12 and proof, p.1027. Constructs the fiber and proves both chromatic conclusions using bounded t-structures.

<a id="kii-4"></a>
## KII.4. Theorem A without trace methods

Prove highly connective invariance, the replacement-ring connectivity estimate, finite-stage truncation and acyclic-category vanishing. Combine compact chromatic kernels with localization to prove both halves of Theorem A. Import all chromatic objects from their existing owner.

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.3`, `ChromaticHomotopyTheory:CH.4`, `ChromaticHomotopyTheory:CH.5`, `ChromaticHomotopyTheory:CH.6`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `GeneralAlgebraicKTheory:K.6`, `GeneralAlgebraicKTheory:K.7`, `GeneralAlgebraicKTheoryPartII:KII.0`, `GeneralAlgebraicKTheoryPartII:KII.1`, `GeneralAlgebraicKTheoryPartII:KII.2`, `HabiroRings:HR.4`, `KTheoryFiniteLocalFields:L.1`, `KTheoryLowDegrees:Z.1`, `SchemeKTheoryOperations:S.5`.

<a id="kii-4-highly-connective"></a>
### Highly connective chromatic invariance

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/highly-connective` (theorem · planet: Highly connective K-invariance). For each n≥1 there is a bound N(n) such that an N(n)-connective map A→B of connective E1-rings that is an L_n^{p,f}-equivalence induces an L_n^{p,f}-equivalence K(A)→K(B). One may choose N=m−1 from the chromatic fiberwise-detection bound used in LMMT Proposition 3.1. Connectivity is a property of the underlying fiber spectrum.

**Hypotheses.** n≥1; the ring map is connective E1, N(n)-connective and an L_n^{p,f}-equivalence. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [General linear groups of connective ring spectra](#kii-1-connective-plus), [Rational and p-adic truncation](#kii-2-waldhausen-truncation), `ChromaticHomotopyTheory:CH.5/suspension-loop-detection`, `ChromaticHomotopyTheory:CH.6/fiberwise-equivalence`, `ChromaticHomotopyTheory:CH.6/connective-loop-preservation`.

**Construction/proof outline.**

1. Pass from A→B to the matrix and stabilized general-linear comparison, retaining the connectivity bound.
2. Use generalized fiberwise Serre detection to preserve the finite-localization equivalence on classifying spaces.
3. Use Bousfield–Kuhn to detect positive telescopic equivalences through plus; treat the T0 part by rational truncation.

**Check.**

- The bound is uniform over ring maps at fixed n; the theorem does not claim every connective equivalence on telescopes already has this property.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proposition 3.1 and proof, pp.1021–1022. Proves highly connective invariance using the §2 chromatic bounds.

<a id="kii-4-amalgam-connectivity"></a>
### Connectivity of the replacement algebra

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/amalgam-connectivity` (lemma). In a homotopy pullback square of E1-rings A→B, A→A′, B→B′, A′→B′ with A connective, suppose both vertical maps are n-connective and both horizontal maps are m-connective, with m,n≥0. Then A′⊙_A^{B′}B→B′ is (m+n+2)-connective. The estimate concerns this comparison map, not a purported ordinary algebra tensor product.

**Hypotheses.** The square is a homotopy pullback; A is connective and m,n≥0. Both parallel vertical maps are n-connective and both horizontal maps m-connective. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The Land–Tamme replacement algebra](#kii-2-amalgam).

**Construction/proof outline.**

1. Write I=fib(A→A′) and J=fib(A→B), which are connective A-bimodules in the indicated degrees.
2. Identify the comparison fiber as Σfib(I⊗_A B→I), using the pullback square and its canonical splitting.
3. Use the cofiber sequence for A→B and the connective tensor-product estimate to obtain the sum of the connectivity bounds.

**Check.**

- If one side is an equivalence, the comparison is an equivalence; the finite estimate specializes accordingly.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Lemma 3.2 and proof, p.1022. Computes the comparison fiber and the connectivity estimate.

<a id="kii-4-finite-postnikov"></a>
### One finite Postnikov stage suffices

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/finite-postnikov` (lemma). Let F be weakly localizing and M a spectrum. If there is a fixed k≥0 such that F(R)→F(τ≤kR) is an equivalence for every connective M-acyclic E1-ring R, then F is truncating on all such rings: F(R)→F(Hπ0R) is an equivalence. This uses a uniform finite k; it is not an interchange of F with an infinite Postnikov limit.

**Hypotheses.** F is weakly localizing; k≥0 is uniform over all connective M-acyclic E1-rings. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Truncating invariants on acyclic rings](#kii-2-truncating), [Connectivity of the replacement algebra](#kii-4-amalgam-connectivity), `EnhancedDerivedSheaves:E5:abstract`.

**Construction/proof outline.**

1. For k>0 use the square-zero extension description of the kth Postnikov step as a pullback.
2. Apply the replacement-algebra invariant pullback square and its connectivity estimate to reduce the required cutoff.
3. Iterate the finite reduction to k=0, checking M-acyclicity of the auxiliary unital rings through their module structures.

**Check.**

- For k=0 the conclusion is precisely the assumption; the induction never assumes continuity of F.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Lemma 3.3 and proof, pp.1022–1023. Reduces a uniform finite Postnikov comparison to truncation.

<a id="kii-4-acyclic-truncation"></a>
### Telescopic K is truncating on finite-acyclic rings

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/acyclic-truncation` (theorem · planet: Acyclic truncation). For n≥1 the invariant L_T(n)K is truncating on connective L_n^{p,f}-acyclic E1-rings. In particular, if R is such a ring, L_T(n)K(R)≃L_T(n)K(π0R).

**Hypotheses.** n≥1; R is connective E1 and L_n^{p,f}-acyclic. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Highly connective chromatic invariance](#kii-4-highly-connective), [One finite Postnikov stage suffices](#kii-4-finite-postnikov), [Truncating invariants on acyclic rings](#kii-2-truncating), `ChromaticHomotopyTheory:CH.4/finite-localizations`.

**Construction/proof outline.**

1. Choose the uniform bound in highly connective invariance.
2. For L_n^{p,f}-acyclic R, the map to that Postnikov stage has acyclic source and target and meets the connectivity bound.
3. Apply the finite-stage-to-truncating lemma to F=L_T(n)K.

**Check.**

- For n=1 this is only restricted truncation; the eventual statement for all K(1)-acyclic rings requires the height-one comparison and purity.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proposition 3.4 and proof, p.1023. Combines Proposition 3.1 with the Postnikov reduction.

<a id="kii-4-finite-p-rings"></a>
### Finite p-power coefficient vanishing

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/finite-p-rings` (application). For every r≥1 and i≥1, L_T(i)K(Z/p^r)=0. More generally L_T(i)K(A)=0 for a discrete Z/p^r-algebra A whenever i≤n and the acyclic-truncation/nilinvariance argument is applied in the L_n^{p,f}-acyclic setting used by Proposition 3.6. In the application to endomorphism rings, first reduce π0R to an Fp-algebra using the nilpotent ideal generated by p.

**Hypotheses.** r≥1, i≥1; the algebra variant uses the stated restricted acyclic domain. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Telescopic K is truncating on finite-acyclic rings](#kii-4-acyclic-truncation), [Excision and nilinvariance for truncating invariants](#kii-2-truncating-excision), `KTheoryFiniteLocalFields:L.1/quillen-k-groups`, `ChromaticHomotopyTheory:CH.6/connective-periodic-vanishing`, [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k).

**Construction/proof outline.**

1. Apply restricted truncating nilinvariance to Z/p^r→Fp.
2. The finite-field calculation gives K(Fp)^∧p≃HZp; positive telescopes annihilate it.
3. For an Fp-algebra use the K(Fp)-module structure of its K-theory; for a Z/p^r-algebra use the same nilpotent reduction. The multiplicative interface is supplied explicitly before this consequence is used.

**Check.**

- Every positive-height telescope kills K(Fp); no vanishing is asserted at T0.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 3.5 and proof; proof of Proposition 3.6, p.1023. Uses finite-field K and nilinvariance to eliminate p-power coefficient rings.

<a id="kii-4-multiplicative-k"></a>
### Products and coefficient actions on enhanced K-theory

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/multiplicative-k` (comparison). A biexact pairing C×D→E of small stable categories induces K(C)⊗K(D)→K(E), coherently with composition and units. In particular K of an E∞-ring is an E∞-ring, and K of an associative R-algebra is a module over K(R) when R is E∞. Compare with the parent’s classical products; the enhanced extension uses the stable S-construction and its nonconnective suspension compatibility. This target asserts no construction of localizing motives.

**Hypotheses.** Pairings are separately exact; the coefficient ring R is E∞ for the module assertion. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Nonconnective K-theory of stable categories](#kii-0-nonconnective-k), [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`.

**Construction/proof outline.**

1. Apply the multivariable S-construction to a separately exact pairing and check shuffle/interchange coherence.
2. Extend across nonconnective suspension using the compatible exact tensor pairings.
3. For modules over a commutative ring use relative tensor product; track the unit and the projection formula for transfer.

**Check.**

- For finite projective modules over a discrete commutative ring, the product on K0 is the existing tensor-product multiplication.

**Sources.** [bgt-mult](https://arxiv.org/pdf/1103.3923), Theorem 5.8, Proposition 5.9 and Corollaries 5.10–5.11, manuscript p.23. Establishes coherent lax symmetric monoidal structures on connective and nonconnective K, giving ring and module structures from separately exact tensor pairings. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proof of Proposition 3.6, p.1023; Theorem B discussion, p.1014. Uses K(Fp)-module actions and K(R)’s E∞ structure.

<a id="kii-4-acyclic-categories"></a>
### Acyclic additive and stable categories

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/acyclic-categories` (theorem · planet: Acyclic-category vanishing). Let n≥1 and C be small idempotent-complete additive. If every hom_C(X,X) is L_n^{p,f}-acyclic, then Kadd(C) is T(i)-acyclic for 1≤i≤n. If C is stable and every full End_C(X) is L_n^{p,f}-acyclic, then K(C) is T(i)-acyclic in the same range. The stable conclusion follows by the S-construction and does not import Levy’s later chromatic corollary.

**Hypotheses.** n≥1; C is small idempotent-complete additive or stable as stated. Use connective hom endomorphisms in the additive case and full End spectra in the stable case. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Additive and stable Schwede–Shipley comparison](#kii-1-additive-morita), [Telescopic K is truncating on finite-acyclic rings](#kii-4-acyclic-truncation), [Finite p-power coefficient vanishing](#kii-4-finite-p-rings), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), [The stable S-construction](#kii-0-enhanced-s-construction), `ChromaticHomotopyTheory:CH.6/connective-periodic-vanishing`.

**Construction/proof outline.**

1. Reduce additive C to one generator using filtered finite-generator subcategories.
2. Apply additive Morita; the endomorphism ring R is connective and acyclic. Its π0 has p-power characteristic because T0=S[1/p] is included.
3. Apply truncation, nilinvariance and finite-field module vanishing to K(R).
4. For stable C, finite-diagram mapping spectra are finite limits of cross Hom spectra, hence remain acyclic; delooping through S• and positive-height acyclicity of coconnective differences gives the full K statement.

**Check.**

- The stable part tests all full End spectra; checking only π0End or only mapping spaces is insufficient.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proposition 3.6 and proof, pp.1023–1024. Proves the additive and stable vanishing statements by Morita reduction and S-delooping.

<a id="kii-4-finite-kernel"></a>
### Compact chromatic kernel for ring modules

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/finite-kernel` (lemma). For any E1-ring A and n≥0, the localization Perf(A)→Perf(L_n^{p,f}A) has compact kernel thickly generated by A⊗F, where F ranges over finite p-primary spectra of type greater than n. Thus K(C>n⊗Perf(A))→K(A)→K(L_n^{p,f}A) is a fiber sequence. The finite p-primary condition retains the correct global T0=S[1/p] convention.

**Hypotheses.** A is any E1-ring; n≥0; finite kernel generators are p-primary of type >n. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Thomason–Neeman localization](#kii-0-thomason-neeman), [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), `ChromaticHomotopyTheory:CH.4/finite-kernel-smashing`, `ChromaticHomotopyTheory:CH.0/finite-duality`.

**Construction/proof outline.**

1. Smashing localization commutes with A-modules and its kernel is generated by these finite tensors.
2. Apply compact localization and identify End_A(A⊗F)≃DF⊗F⊗A.
3. Use duality, thick closure and chromatic acyclicity to show all full mapping spectra in the kernel have the needed finite-localization acyclicity.

**Check.**

- For n=0 the finite p-torsion generators yield p-inversion; replacing T0 globally by HQ changes the kernel.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Lemma 3.7 and proof, pp.1024–1025. Identifies the compact kernel and its endomorphism spectra.

<a id="kii-4-mitchell"></a>
### Mitchell vanishing and the p-inverted sphere

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/mitchell` (theorem · planet: Mitchell vanishing). For every i≥2, L_T(i)K(Z)=0 and L_T(i)K(S[1/p])=0. The first follows from Mitchell’s stronger periodic vanishing, not from identifying T(i) with K(i) on all spectra. For the second use the localization K(Fp)→K(Z)→K(Z[1/p]), then Waldhausen’s p-adic comparison K(S[1/p])→K(Z[1/p]).

**Hypotheses.** p is any prime and i≥2. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Rational and p-adic truncation](#kii-2-waldhausen-truncation), `KTheoryFiniteLocalFields:L.1/quillen-fibration`, [Nonconnective K-theory of stable categories](#kii-0-nonconnective-k), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), `ChromaticHomotopyTheory:CH.3/periodic-homotopy`, `ChromaticHomotopyTheory:CH.6/connective-periodic-vanishing`.

**Construction/proof outline.**

1. Use Mitchell’s factorization of the unit into K(Z) through the image-of-J space and its vanishing vn-periodic homotopy above height one.
2. Apply the finite type-i ring-spectrum test: the image of a vn-element is nilpotent, so the corresponding telescope smash with K(Z) vanishes.
3. Use Quillen localization and K(Fp) positive-height vanishing, then apply the p-inverted sphere comparison.

**Check.**

- This is a height≥2 theorem: K(Z) need not be T1-acyclic.

**Sources.** [mitchell](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Mitchell-KK.pdf), Theorems A–B, pp.607–609; Theorem 3.8 and proof, pp.621–622. The proof establishes vanishing of periodic telescope tests in addition to Morava K-homology. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proof of Theorem 3.8(ii), p.1025. Uses Mitchell and Waldhausen to kill the p-inverted bottom corner.

<a id="kii-4-theorem-a"></a>
### Theorem A in both forms

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/theorem-a` (theorem · planet: Theorem A). For any E1-ring A and n≥1, A→L_n^{p,f}A induces an equivalence on L_T(i)K for every 1≤i≤n. For n≥2, A→L_(T(1)∨⋯∨T(n))A also induces a T(n)-equivalence on K. The latter removes the T0 part only after Mitchell vanishing; neither assertion is yet the two-adjacent-height Purity Theorem.

**Hypotheses.** A is any E1-ring. Part (i) has n≥1 and 1≤i≤n; part (ii) has n≥2. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Acyclic additive and stable categories](#kii-4-acyclic-categories), [Compact chromatic kernel for ring modules](#kii-4-finite-kernel), [The Land–Tamme replacement algebra](#kii-2-amalgam), [Mitchell vanishing and the p-inverted sphere](#kii-4-mitchell), `ChromaticHomotopyTheory:CH.4/fracture-square`.

**Construction/proof outline.**

1. Apply localization at the finite chromatic kernel and the acyclic-category theorem to prove the first part.
2. Use the fracture square separating T0 from T1∨⋯∨Tn and the replacement-algebra pullback theorem.
3. Kill the bottom p-inverted terms by their K(S[1/p])-module structures and Mitchell’s theorem.

**Check.**

- The comparison is natural for arbitrary nonconnective E1-rings. The second assertion is used only for n≥2.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Theorem A, p.1013; Theorem 3.8 and proof, pp.1024–1025. States and proves the finite-localization and T0-removed variants.

<a id="kii-4-nil-witt-action"></a>
### Continuous Witt operations on NK

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/nil-witt-action` (construction). Let R be commutative and A a unital R-algebra. The groups NK_j(A)=ker(K_j(A[x])→K_j(A)), j∈Z, carry a natural continuous module action of the existing big Witt ring W_N>0(R), imported from HabiroRings HR.4. Each individual element is killed by the kernel of a sufficiently long initial-segment Witt truncation. Construct the action through the reduced endomorphism ring End0(R) and nilpotent endomorphism categories; negative degrees use the parent’s Bass contraction, not an invented connective-only NK.

**Hypotheses.** R is commutative and A is a unital R-algebra; j is any integer. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `HabiroRings:HR.4/truncated-big-witt-vectors`.

**Construction/proof outline.**

1. Use tensor product of a finite projective R-endomorphism with a nilpotent A-endomorphism to define the reduced End0(R) action on Nil groups.
2. Identify NK_j with Nil_(j−1) and transport the action, checking the shift and signs.
3. The characteristic-series map identifies the Witt completion of End0(R); an element represented by a nilpotent endomorphism of exponent e is annihilated by a sufficiently high filtration ideal.
4. Extend the action continuously and descend the same operations through Bass’s contraction to all integer degrees.

**Uses.** Weibel Corollary 3.3: The unit p in the big Witt ring acts invertibly on NK over Z[1/p]. Height-one homotopy invariance: This action proves vanishing of the p-completed polynomial fiber.

**API.**

- `TauCeti.KTheory.NilWittAction.action` (structure): NK_j(A) is a continuous W_N>0(R)-module for every integer j.
- `TauCeti.KTheory.NilWittAction.finite_annihilator` (characterisation): For every ξ∈NK_j(A), some initial-segment restriction kernel of W(R) annihilates ξ.
- `TauCeti.KTheory.NilWittAction.base_change` (functoriality): Maps of R-algebras commute with the NK action and the induced Witt-ring map.
- `TauCeti.KTheory.NilWittAction.nil_symbol` (simp): Use the characteristic-series convention det(1−tf). For nilpotent ν the Witt action of a(t) on [1−νx] is the class [a(νx)] in NK1(A); the finite evaluation retains x. In particular the series 1−rt sends this class to [1−rνx].

**Discriminating tests.**

- `TauCeti.KTheory.NilWittAction.test_regular` (compatibility): For a regular noetherian A, NK_j(A)=0 and the action is the unique module structure on zero.
- `TauCeti.KTheory.NilWittAction.test_dual_numbers` (computation): For A=R[ε]/ε², the series 1−rt sends [1−εx] to [1−rεx], and every series congruent to 1 modulo t² acts as zero on this symbol. Evaluating at ε alone gives a constant unit and must fail the NK1 formula.
- `TauCeti.KTheory.NilWittAction.test_negative_index` (characterisation): The operation on NK_(−1) agrees with contraction of the operation on NK0 under the Bass fundamental sequence.

**Check.**

- For an NK1 symbol [1−νx] and a Witt characteristic series a(t), substitute νx into the series, so evaluation at x=0 is the identity automorphism.

**Sources.** [weibel](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/MV-NK-854.pdf), Theorem 2.3, p.473; Theorem 3.1 and Exercise 3.2, pp.474–475. Constructs the continuous big-Witt action through nilpotent endomorphisms and describes a test formula.

<a id="kii-4-nk-localization"></a>
### Weibel localization and p-power nilpotent invariance

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/nk-localization` (theorem · planet: Weibel NK localization). For a unital Z[1/p]-algebra A, multiplication by p is an isomorphism on NK_j(A) for every j∈Z; hence the spectrum NK(A)=fib(K(A[x])→K(A)) is uniquely p-divisible and NK(A)^∧p=0. If p^r=0 in A, each NK_j(A) is p-primary torsion. If I⊂A is nilpotent and p^r=0 in A, every relative K_j(A,I) is p-primary torsion, so K(A)→K(A/I) is a rational equivalence.

**Hypotheses.** The unique p-divisibility claim requires p invertible in A. The torsion and relative nilpotent claims instead require p^r=0 in A. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Continuous Witt operations on NK](#kii-4-nil-witt-action), `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, [Nonpositive K-theory of connective rings](#kii-2-nonpositive), `SchemeKTheoryOperations:S.5`.

**Construction/proof outline.**

1. For R=Z[1/p], multiplication by p on big Witt vectors is invertible: in the characteristic power-series model it is the pth power map, whose inverse is solved recursively because p is a unit in R.
2. Apply the continuous action to each NK group; multiplication by p on a spectrum is an equivalence exactly when it is so on every homotopy group.
3. When p is nilpotent in A, use the finite Witt-filtration annihilator of each element to obtain a p-power annihilator.
4. For nilpotent I, use the simplicial polynomial/Karoubi–Villamayor comparison: the higher Nil terms are p-primary torsion, and the polynomial-homotopy invariant quotient is nilinvariant. Its relative comparison spectral sequence then makes all relative K groups p-primary; use Bass for nonpositive degrees.

**Check.**

- For a singular Z[1/p]-algebra NK may be nonzero integrally even though its p-completion is zero.

**Sources.** [weibel](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/MV-NK-854.pdf), Corollary 3.3(a),(d), p.475; Corollary 5.4, p.485 and its preceding comparison argument, pp.482–485. Proves p-invertibility of NK and p-primary relative K for nilpotent ideals.

<a id="kii-4-nil-nonpositive"></a>
### Nonpositive nilpotent invariance

**Target** `GeneralAlgebraicKTheoryPartII:KII.4/nil-nonpositive` (lemma). For a discrete unital ring A and nilpotent two-sided ideal I, K_j(A)→K_j(A/I) is an isomorphism for every j≤0. This is the Bass induction extending K0 nilinvariance, whose owner remains KTheoryLowDegrees Z.1; no positive-degree integral nilinvariance is asserted.

**Hypotheses.** A is discrete unital; I is a nilpotent two-sided ideal; j≤0. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** `KTheoryLowDegrees:Z.1`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`.

**Construction/proof outline.**

1. Use the imported lifting of idempotents/projectives modulo nilpotent ideals to compare K0.
2. Apply Bass’s polynomial/Laurent fundamental sequence to A and A/I; their extended ideals remain nilpotent.
3. Induct down all negative degrees and compare the actual quotient-induced maps.

**Check.**

- For Z/p^r→Fp all negative groups vanish and K0 identifies with Z.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Example 4.8, p.1029. Uses the standard extension of K0 nilinvariance to all nonpositive degrees.

<a id="kii-5"></a>
## KII.5. Trace comparison, CMNN vanishing and purity

Deduce high-height connective-cover invariance and the cyclotomic-trace equivalence using Theorem A and Mitchell. Use these to prove CMNN’s finite-sphere vanishing without purity, then derive purity. Trace inputs appear for the first time here.

**Stage inputs.** `ChromaticHomotopyTheory:CH.10`, `ChromaticHomotopyTheory:CH.4`, `ChromaticHomotopyTheory:CH.6`, `ChromaticHomotopyTheory:CH.9`, `GeneralAlgebraicKTheoryPartII:KII.0`, `GeneralAlgebraicKTheoryPartII:KII.2`, `GeneralAlgebraicKTheoryPartII:KII.4`, `RefinedTraceMethods:RT.2`, `RefinedTraceMethods:RT.3`.

<a id="kii-5-connective-cover"></a>
### High-height connective-cover invariance

**Target** `GeneralAlgebraicKTheoryPartII:KII.5/connective-cover` (comparison). For every E1-ring A and n≥2, K(τ≥0A)→K(A) is a T(n)-equivalence. This follows from the T0-removed half of Theorem A and positive-height invariance of connective covers of spectra; it does not use CMNN vanishing or purity.

**Hypotheses.** A is any E1-ring and n≥2. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Theorem A in both forms](#kii-4-theorem-a), `ChromaticHomotopyTheory:CH.6/connective-periodic-vanishing`.

**Construction/proof outline.**

1. The ring map τ≥0A→A is a T(i)-equivalence for every i≥1.
2. Apply Theorem A(ii), so both sides have equivalent T(n)-local K-theory after localization at T1∨⋯∨Tn.

**Check.**

- The height bound n≥2 is essential; no connective-cover invariance for T1 is asserted.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.2 and proof, p.1028. Uses Theorem 3.8, before invoking purity.

<a id="kii-5-high-trace"></a>
### The high-height cyclotomic trace

**Target** `GeneralAlgebraicKTheoryPartII:KII.5/high-trace` (comparison). For any E1-ring A and n≥2 the natural zigzag K(A)←K(τ≥0A)→TC(τ≥0A) consists of T(n)-equivalences. TC here is the integral theory with its natural trace; the conclusion is telescopic. Its proof uses Theorem A, DGM and Mitchell, and is independent of CMNN vanishing and purity.

**Hypotheses.** A is any E1-ring and n≥2; TC is applied to τ≥0A. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [High-height connective-cover invariance](#kii-5-connective-cover), `RefinedTraceMethods:RT.3/dgm-theorem`, `RefinedTraceMethods:RT.3/cyclotomic-trace`, [Mitchell vanishing and the p-inverted sphere](#kii-4-mitchell), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k).

**Construction/proof outline.**

1. Reduce to connective A by the preceding comparison.
2. Apply DGM to A→Hπ0A; the fiber of K→TC is unchanged by the connective truncation map because it is a π0-isomorphism.
3. For the discrete ring π0A, both K(π0A) and TC(π0A) are modules over K(Z), the latter through the cyclotomic trace and multiplicative TC. Mitchell annihilates both at T(n), n≥2. Thus DGM gives the required K→TC equivalence without a separate TC(Z) calculation.

**Check.**

- For A=S or a periodic E1-ring, the comparison still uses TC of the connective cover, rather than TC(A).

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.30 and first proof paragraph, p.1035. Derives the zigzag from Theorem 3.8, DGM and Mitchell alone.

<a id="kii-5-genuine-k-transfer"></a>
### The finite-group K-theory transfer comparison

**Target** `GeneralAlgebraicKTheoryPartII:KII.5/genuine-k-transfer` (construction · planet: K-theory transfer). For a stable category C with coherent Cp-action, form the genuine Cp-spectrum of algebraic K-theory of its finite-group action categories using restriction and induction. For C=Perf(R) with trivial action, its underlying spectrum is K(R), its genuine fixed points are K(Fun(BCp,Perf(R))), and the transfer factors as K(R)hCp→K(R[Cp])→K(Fun(BCp,Perf(R))). Its geometric fixed-point cofiber maps to K(R)^tCp through the genuine-to-Borel comparison.

**Hypotheses.** C is stable with coherent Cp-action; the displayed factorization uses trivial action on Perf(R). Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Nonconnective K-theory of stable categories](#kii-0-nonconnective-k), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), `RefinedTraceMethods:RT.2/genuine-g-spectra`, `RefinedTraceMethods:RT.2/geometric-fixed-points-localisation`, `ChromaticHomotopyTheory:CH.9/norm-tate`.

**Construction/proof outline.**

1. Construct induction/restriction on equivariant perfect categories and verify double-coset/additivity identities, giving a spectral Mackey functor.
2. For Cp identify the proper-orbit term in isotropy separation with K(R)hCp.
3. Identify induction from the free action with the group-ring module functor and compare the genuine fixed-point cofiber to the Tate cofiber.

**Uses.** CMNN vanishing proof: The two transfer factors are shown equivalent at the relevant telescope, annihilating the Tate target.

**API.**

- `TauCeti.KTheory.GenuineKTransfer.restriction_induction` (constructor): Subgroup inclusions give exact restriction and induction functors, with the double-coset identity.
- `TauCeti.KTheory.GenuineKTransfer.underlying` (compatibility): The underlying nonequivariant spectrum of genuine K(Perf(R)) is K(R).
- `TauCeti.KTheory.GenuineKTransfer.fixed_points` (equivalence): The genuine Cp-fixed spectrum is K(Fun(BCp,Perf(R))).
- `TauCeti.KTheory.GenuineKTransfer.transfer_factorization` (relation): The transfer factors through K(R[Cp]) in the stated order and compares to the norm.

**Discriminating tests.**

- `TauCeti.KTheory.GenuineKTransfer.test_trivial_group` (degenerate): For G=1 the genuine construction reduces to ordinary K(C).
- `TauCeti.KTheory.GenuineKTransfer.test_free_orbit` (characterisation): Induction on the free Cp-orbit gives extension to R[Cp], not the trivial-action embedding alone.
- `TauCeti.KTheory.GenuineKTransfer.test_borel_distinction` (non-example): Genuine fixed points K(Fun(BCp,Perf(R))) are not by definition K(R)^hCp; the comparison is a separate map.

**Check.**

- For trivial Cp-action, the first assembly map has source K(R)⊗Σ∞_+BCp, and its composite with the quotient comparison is the norm.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Remark 3.9, pp.1025–1026. Describes the genuine K-spectrum, transfer factorization and map to Tate fixed points.

<a id="kii-5-cmnn-vanishing"></a>
### CMNN finite-sphere vanishing

**Target** `GeneralAlgebraicKTheoryPartII:KII.5/cmnn-vanishing` (theorem · planet: CMNN vanishing). For n≥2, L_T(n)K(L_(n−2)^{p,f}S)=0. The inductive proof is carried out using only Theorem A and the high-height trace comparison, not purity. Write m=n−2. The Tate-height converse reduces the step to T(m+1)-acyclicity of K(L_m^{p,f}S)^tCp.

**Hypotheses.** n≥2; the coefficient sphere has finite localization index n−2. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The high-height cyclotomic trace](#kii-5-high-trace), [The finite-group K-theory transfer comparison](#kii-5-genuine-k-transfer), [Mitchell vanishing and the p-inverted sphere](#kii-4-mitchell), `RefinedTraceMethods:RT.2/tate-verdier-quotient`, `RefinedTraceMethods:RT.3/hesselholt-nikolaus-assembly`, `ChromaticHomotopyTheory:CH.9/finite-blueshift`, `ChromaticHomotopyTheory:CH.10/tate-height-converse`, [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k).

**Construction/proof outline.**

1. Start the induction at the p-inverted sphere, using Mitchell vanishing.
2. Put R=L_m^{p,f}S. In the transfer factorization, the cofiber of K(R[Cp])→K(Fun(BCp,Perf(R))) is K of the Tate Verdier quotient, a module over K(R^tCp).
3. Kuhn’s finite blueshift gives R^tCp an L_(m−1)^{p,f}S-algebra structure; the induction hypothesis annihilates this cofiber at T(m+1).
4. For the first transfer factor use the high-height trace comparison on connective covers. Hesselholt–Nikolaus identifies the TC assembly cofiber in the localizing subcategory generated by τ≥0R, hence it is T(m+1)-acyclic. Handle the m=0 boundary by the base case.
5. The transfer is now a T(m+1)-equivalence. Geometric-fixed-point comparison annihilates K(R)^tCp at T(m+1), and the commutative-ring Tate-height converse yields the desired T(m+2) vanishing.

**Check.**

- No path from this node to purity is allowed in its prerequisite graph.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Theorem 1.1, p.1013; Remark 3.9 and proof, pp.1025–1026. Reproduces the CMNN argument in the order needed to avoid circularity. [cmnn24](https://arxiv.org/pdf/2011.08233), Theorem 4.6 and proof, manuscript pp.19–20; Theorem 4.10 with proof, §4.2, p.21. Separately proves the Tate-height converse and the finite-localization vanishing theorem; these are different numbered results in this version.

<a id="kii-5-purity"></a>
### The chromatic purity theorem

**Target** `GeneralAlgebraicKTheoryPartII:KII.5/purity` (theorem · planet: Chromatic purity). For every E1-ring A, prime p and n≥1, the localization A→L_(T(n−1)∨T(n))A induces an equivalence L_T(n)K(A)≃L_T(n)K(L_(T(n−1)∨T(n))A). Equivalently, any map of E1-rings which is a T(n−1)∨T(n)-equivalence induces a T(n)-equivalence on K. At n=1 use T0=S[1/p], not HQ on arbitrary unlocalized spectra.

**Hypotheses.** A is any E1-ring and n≥1; the bottom convention is T0=S[1/p]. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Theorem A in both forms](#kii-4-theorem-a), [CMNN finite-sphere vanishing](#kii-5-cmnn-vanishing), [The Land–Tamme replacement algebra](#kii-2-amalgam), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), `ChromaticHomotopyTheory:CH.4/fracture-square`.

**Construction/proof outline.**

1. For n=1 the adjacent pair is the first finite localization, so Theorem A suffices.
2. For n≥2 use the chromatic fracture square separating the top adjacent pair from L_(n−2)^{p,f}.
3. Apply the replacement-algebra invariant pullback comparison; all lower corners have K-theory modules over K(L_(n−2)^{p,f}S), annihilated by CMNN.
4. Use Theorem A to compare the finite-localized input with A and check functoriality for maps.

**Check.**

- If A is both T(n−1)- and T(n)-acyclic, L_T(n)K(A)=0.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Purity Theorem and proof, pp.1013 and 1025. Combines Theorem A with CMNN to retain only the adjacent pair.

<a id="kii-5-connective-variants"></a>
### Connective nilpotent comparisons for K and TC

**Target** `GeneralAlgebraicKTheoryPartII:KII.5/connective-variants` (theorem). If f:A→B is a map of connective E1-rings, π0f is surjective with nilpotent kernel, and f is a T1∨⋯∨Tn-equivalence for n≥1, then K(f) and TC(f) are T1∨⋯∨Tn-equivalences. If instead f is a T0-equivalence with the same π0 condition, both K(f) and TC(f) are T0-equivalences. Keep these variants separate from the arbitrary-ring purity statement.

**Hypotheses.** The rings are connective and π0f is surjective with nilpotent kernel. The positive-height hypothesis has n≥1; the T0 variant is a separate comparison. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The chromatic purity theorem](#kii-5-purity), [Rational and p-adic truncation](#kii-2-waldhausen-truncation), [Nonpositive K-theory of connective rings](#kii-2-nonpositive), `RefinedTraceMethods:RT.3/dgm-theorem`, `RefinedTraceMethods:RT.3/cyclotomic-trace`, [Excision and nilinvariance for truncating invariants](#kii-2-truncating-excision).

**Construction/proof outline.**

1. Use purity height by height and the bottom fracture square to isolate the p-inverted comparison.
2. Apply Waldhausen truncation there and nilpotent invariance after the relevant rational/p-adic passage.
3. Apply the DGM cartesian square to transfer the K equivalence to TC; prove the rational/T0 variant by the corresponding truncation argument.

**Check.**

- A π0-isomorphism is allowed; a general ring map with no nilpotent π0 condition is not covered by this connective variant.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollaries 4.4–4.5 and Remark 4.6, pp.1028–1029. States the positive-height and bottom-height versions with their nilpotence hypothesis.

<a id="kii-6"></a>
## KII.6. Height bounds, redshift and optimality

Prove the upper height bound and its algebra-valued version. Import Yuan’s nonvanishing and the chromatic Nullstellensatz with precise supplier requests, then deduce redshift at nonnegative height. Prove that neither adjacent height can be discarded.

**Stage inputs.** `ChromaticHomotopyTheory:CH.10`, `ChromaticHomotopyTheory:CH.4`, `ChromaticHomotopyTheory:CH.7`, `ChromaticHomotopyTheory:CH.8`, `GeneralAlgebraicKTheoryPartII:KII.2`, `GeneralAlgebraicKTheoryPartII:KII.3`, `GeneralAlgebraicKTheoryPartII:KII.4`, `GeneralAlgebraicKTheoryPartII:KII.5`, `MotivicEtaleKTheory:M.7`, `RefinedTraceMethods:RT.2`, `RefinedTraceMethods:RT.3`.

<a id="kii-6-height-upper"></a>
### Theorem B and vanishing for algebras

**Target** `GeneralAlgebraicKTheoryPartII:KII.6/height-upper` (theorem · planet: Redshift upper bound). For an E∞-ring R, ht(K(R))≤ht(R)+1 in the chromatic height convention ht(R)=inf{h≥−1:T(h+1)⊗R=0}, with infinity allowed. More precisely, if R is T(n)-acyclic for n≥0 and B is any E1 R-algebra, then K(B) is T(n+i)-acyclic for every i≥1. At n=0 the acyclicity hypothesis is R[1/p]=0.

**Hypotheses.** R is E∞; B is an E1 R-algebra in the refined version; n≥0. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The chromatic purity theorem](#kii-5-purity), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), `ChromaticHomotopyTheory:CH.10/hahn-acyclicity`, `ChromaticHomotopyTheory:CH.10/ring-chromatic-height`.

**Construction/proof outline.**

1. Use Hahn to propagate T(n)-acyclicity of the commutative coefficient ring to every higher height.
2. Every B-module spectrum is R-linear, so B is acyclic at each such height.
3. Apply purity to each pair of adjacent heights of B to annihilate its K-theory; translate the vanishing into the extended-integer height inequality.

**Check.**

- For an E∞-ring of height n≥0, the conclusion is ht(KR)≤n+1; it does not yet assert nonvanishing at n+1.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Theorem B, p.1014; Corollary 4.3, p.1028. Derives the height bound and the stronger algebra-valued vanishing statement.

<a id="kii-6-yuan-lower"></a>
### Yuan’s Lubin–Tate nonvanishing input

**Target** `GeneralAlgebraicKTheoryPartII:KII.6/yuan-lower` (theorem · planet: Lubin–Tate redshift). For Lubin–Tate E_n associated to a height-n formal group over a perfect characteristic-p field, n≥1, L_T(n+1)K(E_n)≠0. This is an imported converse input with its proof dependencies recorded: purity is already proved before it is used. The intermediary result says that T(j)⊗E≠0 for E∞ E implies T(j)⊗K(E^tCp)≠0, j≥1.

**Hypotheses.** n≥1; E_n comes from a finite-height formal group over a perfect characteristic-p field. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The chromatic purity theorem](#kii-5-purity), `RefinedTraceMethods:RT.2/thh-spectral-categories`, `RefinedTraceMethods:RT.3/dennis-trace`, `ChromaticHomotopyTheory:CH.7/morava-e-theory`, `ChromaticHomotopyTheory:CH.7`, `RefinedTraceMethods:RT.2`, `MotivicEtaleKTheory:M.7`.

**Construction/proof outline.**

1. Use the residual circle action on E^tCp and the circle-equivariant THH universal property to map its K-theory into (e^tCp)^h(S1/Cp), where e is the connective cover.
2. Invoke the Tate-orbit comparison and the circle-Tate calculation to preserve T(j)-nonzero targets; use purity to replace E by e at the Cp-Tate step.
3. For E_(n+1)^tCp use telescopic K étale descent to choose a strict henselization with nonzero T(n+1)-local K.
4. Use the Lubin–Tate mapping property over its K(n)-local strict henselian height-n localization to obtain an E_n-algebra with nonzero K; nonvanishing pulls back along the unital K map.

**Check.**

- The source’s Theorem 3.1 is the two-height purity statement despite its attribution to “Theorem A”; the actual dependency here is purity.

**Sources.** [yuan](https://arxiv.org/pdf/2111.10837), Theorems A and C, manuscript pp.2–3; §3 proof pp.6–7; §4, Theorem 4.2 and Lemma 4.5, pp.7–9. Proves the nonvanishing through Tate actions, strict henselizations and the Lubin–Tate universal property.

<a id="kii-6-height-zero"></a>
### The height-zero lower bound

**Target** `GeneralAlgebraicKTheoryPartII:KII.6/height-zero` (application). For an algebraically closed characteristic-zero field L, let E0(L)=HL[u±1] with |u|=2. Then K(E0(L))^∧p≃ku^∧p⊕Σku^∧p, and in particular L_T1K(E0(L))≠0. This is the height-zero periodic field input needed to include n=0 in redshift; it is not Yuan’s positive-height theorem.

**Hypotheses.** L is algebraically closed of characteristic zero; u has degree 2. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Regular ring-spectrum devissage](#kii-3-regular-localization), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), [Rational and p-adic truncation](#kii-2-waldhausen-truncation), `MotivicEtaleKTheory:M.7`, `ChromaticHomotopyTheory:CH.8/ravenel-bousfield-class`.

**Construction/proof outline.**

1. Use Suslin rigidity/comparison to identify K(L)^∧p with ku^∧p.
2. Apply regular localization to HL[u]→HL[u±1]. The first K(L)→K(HL[u]) map is induced by restriction through the u-torsion quotient.
3. By additivity its composite with the connective truncation comparison is id plus an odd suspension, hence zero; split the resulting cofiber sequence after p-completion.

**Check.**

- E0(L) has height zero and K(E0(L)) has nonzero height-one part.

**Sources.** [bsy](https://arxiv.org/pdf/2207.09929v1), Proposition 9.12 and proof, manuscript p.89. Gives the split calculation using Suslin and regular devissage.

<a id="kii-6-redshift"></a>
### Redshift at nonnegative height

**Target** `GeneralAlgebraicKTheoryPartII:KII.6/redshift` (theorem · planet: Redshift theorem). For every p-local E∞-ring R with ht(R)≥0, ht(K(R))=ht(R)+1, allowing infinity+1=infinity. More generally this holds for any E∞ R of positive height, and for a global height-zero R provided R⊗HQ≠0. At finite positive height n, the Nullstellensatz gives a map from the nonzero T(n)-localization to E_n(L), L algebraically closed of characteristic p; at height zero it is applied to the nonzero rationalization and L has characteristic zero. The global bottom convention T0=S[1/p] alone does not imply that rationalization is nonzero; source issue E1 records this restriction. No equality is asserted at ht(R)=−1.

**Hypotheses.** R is E∞ with ht(R)≥0. At height zero additionally R⊗HQ≠0; this follows automatically if R is p-local. Universes and the global T0 convention are fixed.

**Direct inputs.** [Theorem B and vanishing for algebras](#kii-6-height-upper), [Yuan’s Lubin–Tate nonvanishing input](#kii-6-yuan-lower), [The height-zero lower bound](#kii-6-height-zero), [The chromatic purity theorem](#kii-5-purity), `ChromaticHomotopyTheory:CH.10`.

**Construction/proof outline.**

1. At finite positive height use the Nullstellensatz on the nonzero T(n)-local E∞-ring. At height zero apply its n=0 case only to R⊗HQ, assumed nonzero, to obtain the characteristic-zero field map.
2. Purity and the lower-bound input give T(n+1)-nonvanishing of K(R); combine with the upper bound.
3. If ht(R)=infinity, apply the same detection to each finite height and use the lower-bound maps to obtain arbitrarily high nonvanishing.
4. Record the negative-height counterexample separately: at p=2, F2^tC2 is 1-periodic, so its K-theory vanishes after inverting 2 by additivity and has height −1 rather than 0.

**Check.**

- For every n≥0 the periodic field E_n has K-theory of height n+1. The excluded negative-height example prevents an incorrect universal equality.

**Sources.** [bsy](https://arxiv.org/pdf/2207.09929v1), Corollary 5.2 (Theorem D), pp.3 and 55; Theorem 9.11 and Remark 9.13, manuscript pp.88–90. Uses chromatic field detection to combine the upper and lower redshift bounds. [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Redshift Theorem and following discussion, p.1014. States the nonnegative-height restriction and attributes the converse.

<a id="kii-6-optimality"></a>
### Both heights in purity are necessary

**Target** `GeneralAlgebraicKTheoryPartII:KII.6/optimality` (theorem · planet: Optimality of purity). For each n≥1 the functor A↦L_T(n)K(A) on E1-rings does not factor through A↦L_T(n)A and does not factor through A↦L_T(n−1)A. These are assertions that each putative universal factorization fails, rather than that every individual map to a single-height localization fails.

**Hypotheses.** n≥1; factorization means one valid for every E1-ring. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Yuan’s Lubin–Tate nonvanishing input](#kii-6-yuan-lower), [The height-zero lower bound](#kii-6-height-zero), `RefinedTraceMethods:RT.3/stable-k-theory-thh`, `ChromaticHomotopyTheory:CH.8/telescope-separation`.

**Construction/proof outline.**

1. To rule out factorization through T(n), choose a height-(n−1) commutative ring with nonzero T(n)-local K: use E_(n−1) for n≥2 and the height-zero input for n=1.
2. For factorization through T(n−1), choose a connective spectrum M that is T(n−1)-acyclic but T(n)-nonzero, and use split square-zero extensions S⊕Σ^rM→S.
3. If all these K comparisons were T(n)-equivalences, their stabilized relative K colimit would vanish. Stable K with coefficients in M is a fixed suspension of M by the imported derivative theorem, a contradiction. Verify the coefficient/shift convention at the import boundary; any fixed shift gives the contradiction.

**Check.**

- The n=1 case uses a height-zero ring rather than an undefined E_(−1); the square-zero argument requires an actual separated telescope input.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Remark 3.11, p.1026. Gives the height-(n−1) and square-zero counterexamples to the two universal factorizations.

<a id="kii-6-graded-redshift"></a>
### Redshift in chromatic graded pieces

**Target** `GeneralAlgebraicKTheoryPartII:KII.6/graded-redshift` (comparison). For an E∞-ring R of nonnegative chromatic height and every n≥1, vanishing of the nth graded piece of its p-primary finite chromatic tower is equivalent to vanishing of the (n+1)st graded piece for K(R). The same vanishing equivalence holds for the corresponding ordinary chromatic tower. On p-local R one may also include n=0, with L0=HQ and M0=L0. Globally T0=S[1/p] is not replaced by HQ in this translation.

**Hypotheses.** R is E∞ of nonnegative height and n≥1. For the n=0 extension, R is p-local. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Redshift at nonnegative height](#kii-6-redshift), `ChromaticHomotopyTheory:CH.10/ring-chromatic-height`, `ChromaticHomotopyTheory:CH.4/p-local-comparison`, `ChromaticHomotopyTheory:CH.8/local-telescope-comparison`.

**Construction/proof outline.**

1. Use the commutative-ring initial-interval height theorem and the ring-spectrum comparison of vanishing at T(n) and K(n) for n≥1.
2. For n≥1 the graded-piece question concerns positive height cutoffs. If ht(R)≥1 use positive-height redshift. If global ht(R)=0, the upper bound makes the (n+1)st piece of K(R) vanish and the nth piece of R already vanishes; no height-zero lower bound is needed.
3. For n=0 restrict to p-local input to compare S[1/p] with HQ; record the extra restriction rather than changing the global bottom convention.

**Check.**

- This is a comparison of vanishing, not an equivalence of the two towers or the telescope conjecture.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Interpretation after the Redshift Theorem, p.1014; Lemma 2.3, p.1016. Translates the height equality into vanishing of graded chromatic pieces.

<a id="kii-7"></a>
## KII.7. Examples and iterated K-theory

Apply purity to finite p-power rings, Morava K-theory, truncated spheres, truncated Brown–Peterson spectra, A-theory and James-filtered Thom spectra. Keep rational splittings distinct from telescopic equivalences.

**Stage inputs.** `ChromaticHomotopyTheory:CH.1`, `ChromaticHomotopyTheory:CH.13`, `ChromaticHomotopyTheory:CH.3`, `ChromaticHomotopyTheory:CH.6`, `ChromaticHomotopyTheory:CH.8`, `GeneralAlgebraicKTheoryPartII:KII.1`, `GeneralAlgebraicKTheoryPartII:KII.2`, `GeneralAlgebraicKTheoryPartII:KII.3`, `GeneralAlgebraicKTheoryPartII:KII.4`, `GeneralAlgebraicKTheoryPartII:KII.5`, `GeneralAlgebraicKTheoryPartII:KII.6`, `KTheoryLowDegrees:Z.1`.

<a id="kii-7-nice-maps"></a>
### Nice maps of connective E∞-rings

**Target** `GeneralAlgebraicKTheoryPartII:KII.7/nice-maps` (definition · planet: Nice maps). A map f:R→S of connective E∞-rings is n-nice, n≥0, if π0R→π0S is an isomorphism identified with the identity of Z and f is an HQ∨T1∨⋯∨Tn-equivalence. It is nice if it is n-nice for every n≥0. The rational summand is HQ here by definition; it is not a global replacement of T0. Record both the chosen identifications with Z and the compatibility of π0f.

**Hypotheses.** R,S are connective E∞ with compatible fixed π0 identifications with Z; n≥0. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Connective nilpotent comparisons for K and TC](#kii-5-connective-variants), `ChromaticHomotopyTheory:CH.3/telescope`.

**Construction/proof outline.**

1. Define the predicate with actual connective E∞ input rings and fixed π0 identifications.
2. Separate its rational comparison from the finite list of positive telescopes.
3. Check preservation under identity/composition and under equivalence of the chosen π0 models.

**Uses.** Corollary 4.7: The π0 and negative-K conditions make iteration by K meaningful. Example 4.8: It controls iterated K of finite p-power rings.

**API.**

- `TauCeti.KTheory.NiceMaps.pi_zero` (projection): An n-nice map induces the specified identity on π0=Z.
- `TauCeti.KTheory.NiceMaps.rational` (projection): An n-nice map is an HQ-equivalence.
- `TauCeti.KTheory.NiceMaps.telescopic` (projection): For 1≤i≤n an n-nice map is a T(i)-equivalence.
- `TauCeti.KTheory.NiceMaps.composition` (functoriality): Composites of n-nice maps are n-nice; nice maps are closed under composition.

**Discriminating tests.**

- `TauCeti.KTheory.NiceMaps.test_identity` (degenerate): The identity on any connective E∞-ring with π0=Z is nice.
- `TauCeti.KTheory.NiceMaps.test_height_zero` (characterisation): Being 0-nice imposes the rational equivalence and π0=Z, without any positive-height condition.
- `TauCeti.KTheory.NiceMaps.test_wrong_pi_zero` (non-example): An equivalence on H Fp is not n-nice, because π0 is Fp rather than Z.

**Check.**

- K preserves n-nice maps and nice maps by the following theorem, not by definition.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Definition before Corollary 4.7, p.1029. Introduces n-nice and nice with π0=Z.

<a id="kii-7-k-nice"></a>
### K preserves nice maps

**Target** `GeneralAlgebraicKTheoryPartII:KII.7/k-nice` (theorem · planet: Iteration of K-theory). If f:R→S is n-nice, then K(f):K(R)→K(S) is n-nice; therefore K preserves nice maps. Here K(R) and K(S) are connective E∞-rings with π0=Z: nonpositive comparison and K_i(Z)=0 for i<0, K0(Z)=Z establish those claims before iterating.

**Hypotheses.** f is n-nice, with the output ring structure on K supplied by multiplicativity. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Nice maps of connective E∞-rings](#kii-7-nice-maps), [Nonpositive K-theory of connective rings](#kii-2-nonpositive), [Connective nilpotent comparisons for K and TC](#kii-5-connective-variants), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k).

**Construction/proof outline.**

1. Use nonpositive comparison to prove the output connectivity and π0 identifications.
2. Apply the positive-height connective nilpotent comparison, where π0f is an isomorphism.
3. Use rational Waldhausen truncation for the rational piece; assemble the n-nice predicate.

**Check.**

- The output is a map of rings, not merely a map of spectra; its π0 identifications are required for a second application of K.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.7 and proof, p.1029. Proves preservation of n-nice maps, including connectivity and π0.

<a id="kii-7-iterated-finite-p"></a>
### Iterated finite p-power K-theory

**Target** `GeneralAlgebraicKTheoryPartII:KII.7/iterated-finite-p` (application). For r≥1 the rank map K(Z/p^r)→HZ is nice. Consequently for j≥1 the natural iterated map K^j(Z/p^r)→K^(j−1)(Z) is an HQ∨T1∨⋯∨Tn-equivalence for every n≥0. The initial map is induced by rank on the connective E∞ K-spectrum; it is not a ring map Z/p^r→Z.

**Hypotheses.** r≥1, j≥1 and n≥0. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [K preserves nice maps](#kii-7-k-nice), [Finite p-power coefficient vanishing](#kii-4-finite-p-rings), [Nonpositive K-theory of connective rings](#kii-2-nonpositive), `KTheoryLowDegrees:Z.1`, [Weibel localization and p-power nilpotent invariance](#kii-4-nk-localization), [Nonpositive nilpotent invariance](#kii-4-nil-nonpositive).

**Construction/proof outline.**

1. Use negative-K nilinvariance and the finite-field computation to identify π≤0K(Z/p^r).
2. Use positive telescope vanishing and the rational nilinvariance/p-power relative-K input to show the rank map is nice.
3. Iterate preservation of nice maps, maintaining all connective ring structures and π0=Z.

**Check.**

- At r=1, K(Fp)→HZ is rationally equivalent and is an equivalence at every positive telescope, although it is not an integral equivalence.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Example 4.8, p.1029. Derives the rank comparison and its iteration. [weibel](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/MV-NK-854.pdf), Corollary 5.4, p.485. Supplies rational nilpotent invariance when p is nilpotent.

<a id="kii-7-morava-k"></a>
### K-theory of Morava K-theory

**Target** `GeneralAlgebraicKTheoryPartII:KII.7/morava-k` (application). Let m≥1 and K(m) be the standard E1 Morava K-theory at p, with connective cover k(m) and π*k(m)=Fp[v_m], |v_m|=2p^m−2. Then L_T(i)K(K(m))=0 for i∉{0,m,m+1}. Separately, after inverting p, K(K(m))[1/p]≃K(Fp)[1/p]⊕ΣK(Fp)[1/p]. The vanishing statement does not assert that each of the three exceptional heights is nonzero.

**Hypotheses.** m≥1; use the standard E1 coefficient Morava K-theory and connective k(m). Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The chromatic purity theorem](#kii-5-purity), [Regular ring-spectrum devissage](#kii-3-regular-localization), [Rational and p-adic truncation](#kii-2-waldhausen-truncation), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), `ChromaticHomotopyTheory:CH.1/morava-coefficient-spectra`, `ChromaticHomotopyTheory:CH.3/ring-acyclicity`.

**Construction/proof outline.**

1. Use the known chromatic support of the E1 Morava coefficient ring and purity at all disjoint adjacent pairs.
2. Apply regular devissage to k(m)→K(m); the fiber is K(Fp).
3. Compare K(k(m))[1/p] with K(Fp)[1/p] by the p-power truncation argument. The devissage map composes with this comparison as id plus the odd shift 2p^m−1, hence is zero by additivity; split its cofiber.

**Check.**

- At m=1 only heights 0,1,2 can remain; the [1/p] splitting is a different assertion from T0-local comparison.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.9 and Remark 4.10, pp.1029–1030. Gives the support bound and the rational-away-from-p split calculation.

<a id="kii-7-truncated-spheres"></a>
### K-theory of truncated spheres

**Target** `GeneralAlgebraicKTheoryPartII:KII.7/truncated-spheres` (application). For every r≥0 and i≥2, L_T(i)K(τ≤rS)=0. The input is a connective finite Postnikov truncation of the sphere; this gives no such vanishing claim for K(S) itself.

**Hypotheses.** r≥0 and i≥2. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The chromatic purity theorem](#kii-5-purity), [High-height connective-cover invariance](#kii-5-connective-cover), `ChromaticHomotopyTheory:CH.6/space-postnikov`.

**Construction/proof outline.**

1. The finite Postnikov ring is acyclic at every positive telescope.
2. For i≥2 both T(i−1) and T(i) annihilate it, so purity applies.

**Check.**

- At r=0 this recovers the high-height vanishing of K(Z).

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.11, p.1030. Applies purity to sphere Postnikov truncations.

<a id="kii-7-bp-localization"></a>
### Truncated Brown–Peterson localization

**Target** `GeneralAlgebraicKTheoryPartII:KII.7/bp-localization` (application). For n≥0, K(BP⟨n⟩)→K(E(n)) is a T(i)-equivalence for i≥n+1 and these spectra are T(i)-acyclic for i≥n+2. For n≥1 the usual sequence K(BP⟨n−1⟩)→K(BP⟨n⟩)→K(E(n)) is a fiber sequence after L_(⊕i≥n+1 T(i)); the first arrow is the restriction/devissage map through the quotient. It is not asserted to be an unlocalized fiber sequence.

**Hypotheses.** n≥0; the displayed three-term sequence has n≥1 and is localized. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The chromatic purity theorem](#kii-5-purity), `ChromaticHomotopyTheory:CH.1/vn-cofiber-sequences`, `ChromaticHomotopyTheory:CH.8/truncation-support`, [Theorem B and vanishing for algebras](#kii-6-height-upper).

**Construction/proof outline.**

1. Use the chromatic localization behavior of BP⟨n⟩→E(n) and apply the adjacent-pair test.
2. Use support above height n to deduce the higher vanishing.
3. For the localized sequence the low-height term vanishes as required and localization identifies the last two terms; retain the restriction map and do not assert an integral localization theorem without regularity.

**Check.**

- For n≥2 the corresponding rational/unlocalized fiber sequence can fail; the localized statement must survive that negative control.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.12 and Remark 4.13, p.1030. States the localized equivalences and warns against the unlocalized sequence.

<a id="kii-7-a-suspension"></a>
### Purity for suspension A-theory

**Target** `GeneralAlgebraicKTheoryPartII:KII.7/a-suspension` (application). Let W be pointed connected and n≥1. If the reduced suspension spectrum Σ∞W is T(n−1)∨T(n)-acyclic, then A(*)→A(ΣW)→A(*) are T(n)-equivalences. The suspension is reduced and the coefficient ring is Σ∞_+ΩΣW.

**Hypotheses.** W is pointed connected and reduced Σ∞W is T(n−1)∨T(n)-acyclic; n≥1. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Waldhausen A-theory](#kii-1-a-theory), [The chromatic purity theorem](#kii-5-purity), `ChromaticHomotopyTheory:CH.13/james-filtration`.

**Construction/proof outline.**

1. Use the James splitting of Σ∞_+ΩΣW as the tensor algebra on the reduced Σ∞W.
2. Its augmentation to S has fiber built from positive tensor powers of Σ∞W, still acyclic at the adjacent pair.
3. Apply purity to the augmentation and use its unit splitting.

**Check.**

- W contractible gives the identity equivalence A(*)≃A(ΣW).

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.14 and proof, p.1030. Combines the James splitting with purity.

<a id="kii-7-james-thom"></a>
### K-theory of James-filtered Thom spectra

**Target** `GeneralAlgebraicKTheoryPartII:KII.7/james-thom` (application). For m≥1, the map y(m)→Fp induces an L_(m−1)^{p,f}-equivalence on K, so K(y(m)) is T(i)-acyclic for 0<i<m. At p=2 the integral analogue z(m)→HZ_(2) induces a T(i)-equivalence on K for 0<i<m. The z(m) statement does not include the bottom T0 summand.

**Hypotheses.** m≥1; z(m) is the prime-two integral analogue and its range is 0<i<m. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Connective nilpotent comparisons for K and TC](#kii-5-connective-variants), [Finite p-power coefficient vanishing](#kii-4-finite-p-rings), `ChromaticHomotopyTheory:CH.13/james-thom-family`, `ChromaticHomotopyTheory:CH.13/james-acyclicity`.

**Construction/proof outline.**

1. Import the precise connectivity, π0 and chromatic acyclicity properties of the Thom spectra.
2. Apply the connective nilpotent comparison and its rational part to y(m).
3. Apply only the positive-height comparison to z(m), and use finite-field K vanishing for the y(m) conclusion.

**Check.**

- For m=1 the displayed positive-height range is empty; the finite-localization assertion for y(1) still has its bottom-height meaning.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollaries 4.16 and 4.18, p.1031. States the y(m) and prime-two z(m) consequences with different ranges.

<a id="kii-8"></a>
## KII.8. Galois descent and modular examples

Prove the CMNN rational-transfer descent criterion, the Lubin–Tate finite-subgroup transfer condition, and ko/tmf applications. Import the spectra, modular localizations, group actions and supersingular comparisons from chromatic homotopy theory.

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.10`, `ChromaticHomotopyTheory:CH.11`, `ChromaticHomotopyTheory:CH.12`, `ChromaticHomotopyTheory:CH.4`, `ChromaticHomotopyTheory:CH.7`, `ChromaticHomotopyTheory:CH.9`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `GeneralAlgebraicKTheoryPartII:KII.0`, `GeneralAlgebraicKTheoryPartII:KII.3`, `GeneralAlgebraicKTheoryPartII:KII.4`, `GeneralAlgebraicKTheoryPartII:KII.5`, `GeneralAlgebraicKTheoryPartII:KII.6`, `RefinedTraceMethods:RT.5`.

<a id="kii-8-galois-descent"></a>
### Telescopic K-theory Galois descent

**Target** `GeneralAlgebraicKTheoryPartII:KII.8/galois-descent` (theorem · planet: Telescopic Galois descent). Let A→B be a finite-group G-Galois extension of E∞-rings. Suppose B is perfect over A and the transfer K0(B)⊗Q→K0(A)⊗Q has 1 in its image. For every prime and finite chromatic localization L_n^f, n≥0, both canonical maps L_n^fK(A)→L_n^f(K(B)^hG)→(L_n^fK(B))^hG are equivalences. Consequently the analogous maps after any positive T(i)-localization are equivalences. The commutation with homotopy fixed points is a conclusion under these hypotheses, not a formal property of localization.

**Hypotheses.** A→B is finite G-Galois E∞, B is perfect over A, and rational K0 transfer hits 1. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), [Thomason–Neeman localization](#kii-0-thomason-neeman), `ChromaticHomotopyTheory:CH.4/p-local-comparison`, `ChromaticHomotopyTheory:CH.9/kuhn-tate-vanishing`, `RefinedTraceMethods:RT.5/localizing-motives`, [Rational transfer forces periodic descent](#kii-8-rational-transfer-cobar).

**Construction/proof outline.**

1. Use the transfer projection formula to obtain the rational unit-generation condition in the additive motive category of A-linear perfect categories.
2. Apply CMNN’s ε-nilpotent descent argument to the Amitsur augmented cosimplicial object; record the needed weakly additive motive interface as an RT.5 supplier request.
3. Its totalization tower becomes rapidly convergent after finite periodic localization, so localization can be moved through this particular totalization.
4. Identify the Galois Amitsur diagram with the G-cobar diagram. Apply the same ε-nilpotent tower argument directly for each T(i), using CMNN Remark 2.9 and Proposition 2.19, to justify both T(i)-localized comparison maps; this is not inferred by commuting a further localization with arbitrary homotopy fixed points.

**Check.**

- For G=1 all maps are identities. For nontrivial G, a Galois label alone does not discharge the rational-transfer hypothesis.

**Sources.** [cmnn20](https://www.nullplug.org/publications/GeneralLemma.pdf), Theorem 5.6 and proof, manuscript p.22; Theorem 5.1 pp.20–21; Proposition 2.19 pp.12–13; Remark 2.9, p.9. Derives Galois descent and the two localization/totalization maps from rational transfer.

<a id="kii-8-lubin-tate-transfer"></a>
### Rational transfer for higher real K-theories

**Target** `GeneralAlgebraicKTheoryPartII:KII.8/lubin-tate-transfer` (theorem · planet: Lubin–Tate transfer). Let E be Lubin–Tate theory of a finite-height formal group over a perfect characteristic-p field k, and H a finite subgroup of the automorphism group of the pair (formal group,k), allowing semilinear field automorphisms. Then K0(E)⊗Q→K0(E^hH)⊗Q is surjective. In particular the transfer condition for telescopic K-descent holds for E^hH→E.

**Hypotheses.** H is finite in the semilinear automorphism group of the formal-group/field pair. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), [Telescopic K-theory Galois descent](#kii-8-galois-descent), `ChromaticHomotopyTheory:CH.7/stabilizer-action`, `ChromaticHomotopyTheory:CH.7`.

**Construction/proof outline.**

1. Use CMNN Appendix B’s finite even H-complex X with nonzero finite-free twisted Morava K-cohomology; this representation-theoretic chromatic construction is requested from CH.7.
2. Lift the free basis to obtain E⊗DX≃coind_H(E)^r as semilinear modules and descend to E^hH⊗DX≃E^r.
3. The transferred class is M times the unit, where M>0 is the number of even cells of X. The transfer image is an ideal by the projection formula, so rationalizing makes it the whole K0.

**Check.**

- The argument retains the field-automorphism factor; at p=3 it applies to the full order-24 supersingular group.

**Sources.** [cmnn20](https://www.nullplug.org/publications/GeneralLemma.pdf), Theorem B.2 and Corollaries B.3–B.4, manuscript pp.37–39. Constructs an even free-detecting complex and proves rational-transfer surjectivity.

<a id="kii-8-ko-algebras"></a>
### Purity for ko-algebras

**Target** `GeneralAlgebraicKTheoryPartII:KII.8/ko-algebras` (application). For any E1 ko-algebra A at the chosen prime, inverting the central Bott class β induces a T(i)-equivalence K(A)→K(A[β−1]) for every i≥2. For i≥3, L_T(i)K(A)=0. No regularity or connectivity assumption on the ko-algebra A is required.

**Hypotheses.** A is an E1 ko-algebra; the class β is central Bott. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The chromatic purity theorem](#kii-5-purity), [Theorem B and vanishing for algebras](#kii-6-height-upper), `ChromaticHomotopyTheory:CH.11/real-k-theory`, `ChromaticHomotopyTheory:CH.11/real-coefficients`.

**Construction/proof outline.**

1. The ko→KO Bott localization is an equivalence on the adjacent heights relevant for i≥2.
2. Base change to A preserves this equivalence; apply purity.
3. Use the commutative ko coefficient ring’s height-one bound and the algebra-valued vanishing theorem.

**Check.**

- For A=ko this compares K(ko) with K(KO) at every T(i), i≥2.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.19 and Remark 4.20, pp.1031–1032. Proves Bott-localization purity and the height-three-and-above vanishing.

<a id="kii-8-tmf-algebras"></a>
### Purity for tmf-algebras

**Target** `GeneralAlgebraicKTheoryPartII:KII.8/tmf-algebras` (application). For any E1 tmf-algebra A, K(A) is T(i)-acyclic for i≥4. The map K(A)→K(A⊗tmf Tmf) is a T(i)-equivalence for i≥2, and K(A)→K(A⊗tmf TMF) is a T(3)-equivalence. Here Tmf is the nonconnective compactified global-sections spectrum and TMF the periodic open-moduli spectrum; the two are not identified.

**Hypotheses.** A is an E1 tmf-algebra; the indicated height ranges differ for Tmf and TMF. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The chromatic purity theorem](#kii-5-purity), [Theorem B and vanishing for algebras](#kii-6-height-upper), `ChromaticHomotopyTheory:CH.12/modular-form-spectra`, `ChromaticHomotopyTheory:CH.12/modular-chromatic-comparison`, `ChromaticHomotopyTheory:CH.12/discriminant-localization`.

**Construction/proof outline.**

1. Import the distinct chromatic comparisons tmf→Tmf and tmf→TMF from the modular homotopy owner.
2. Base change those E∞ coefficient maps to A and apply purity at each stated adjacent pair.
3. Apply the algebra-valued upper bound from the height-two coefficient ring.

**Check.**

- With A=tmf the T(2) comparison is with Tmf; the displayed periodic TMF comparison is asserted at T(3).

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.21(i)–(iii), pp.1032–1033. Gives the algebra-valued modular applications.

<a id="kii-8-supersingular-descent"></a>
### Supersingular fixed-point description

**Target** `GeneralAlgebraicKTheoryPartII:KII.8/supersingular-descent` (application). At p=2, L_T3K(tmf)≃L_T3(K(E2)^hGL2(F3))≃(L_T3K(E2))^hGL2(F3). At p=3 replace GL2(F3) by the full order-24 supersingular stabilizer G24, including the residue-field Galois action. The intermediate T(3)-localized K(TMF) is equivalent to the same spectra. The raw K(tmf)≃K(E2)^hG equivalence is not claimed.

**Hypotheses.** p=2 or 3, with the full group specified for each prime. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Purity for tmf-algebras](#kii-8-tmf-algebras), [Telescopic K-theory Galois descent](#kii-8-galois-descent), [Rational transfer for higher real K-theories](#kii-8-lubin-tate-transfer), `ChromaticHomotopyTheory:CH.12/supersingular-galois`, `ChromaticHomotopyTheory:CH.12/modular-level-galois`.

**Construction/proof outline.**

1. Use the modular chromatic comparison to replace tmf by periodic TMF at T3.
2. Identify its relevant completed height-two coefficient ring with E2^hG, retaining the full semilinear stabilizer.
3. Apply the rational-transfer descent theorem, now justified by Lubin–Tate transfer; use its separate fixed-point commutation assertion for the final equivalence.

**Check.**

- At p=2 the group has order 48; at p=3 the full group has order 24 rather than the order-12 geometric automorphism group.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.21(iv) and proof, pp.1032–1033. Combines modular comparison and CMNN Galois descent; the prime-three analogue is specified after the proof.

<a id="kii-8-regular-examples"></a>
### Classical regular localization checks

**Target** `GeneralAlgebraicKTheoryPartII:KII.8/regular-examples` (application). Recover the known connective localization sequences Kconn(Z)→Kconn(ko)→Kconn(KO) and Kconn(Z)→Kconn(tmf)→Kconn(Tmf) with the coefficient localization and any necessary prime localization matched to the chosen model. Their fiber identifications require the regular/coherent module devissage hypotheses, unlike the general algebra-valued purity comparisons. Record the K(Z)-fiber as the source of high-height equivalence, not as a proof of those sequences for all coefficient algebras.

**Hypotheses.** Use the regularity/coherent-support hypotheses for ko and tmf; coefficient prime localization follows the chosen models. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Regular ring-spectrum devissage](#kii-3-regular-localization), `ChromaticHomotopyTheory:CH.11/real-coefficients`, `ChromaticHomotopyTheory:CH.12/spectral-affineness`, [Mitchell vanishing and the p-inverted sphere](#kii-4-mitchell), `ChromaticHomotopyTheory:CH.12`.

**Construction/proof outline.**

1. For ko invoke the regular devissage model and identify the Bott-torsion category with the indicated Z-linear heart.
2. For tmf use the regularity and support description of coherent modules on the compactified moduli stack; request the exact supplier statement in CH.12.
3. Compare these classical fibers with the purity conclusions after telescopic localization.

**Check.**

- The general tmf-algebra case is supplied by purity and does not inherit a K(Z) fiber without regularity.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Remark 4.22, p.1033. Explains regular-localization instances and distinguishes them from the algebra-valued conclusions.

<a id="kii-8-epsilon-enlargement"></a>
### ε-enlargement and descent towers

**Target** `GeneralAlgebraicKTheoryPartII:KII.8/epsilon-enlargement` (definition · planet: ε-nilpotent descent). Let T be a thick subcategory of small stable idempotent-complete C. For finite spectrum F let T_F be the thick closure of T and every F⊗X. For a finite set Σ of primes put T_(ε,Σ)=intersection_F T_F, where F_(q)≠0 for every q∈Σ; put T_ε=union_Σ T_(ε,Σ). An ε-object belongs to 0_ε. A tower is nilpotent if a fixed-length composite of its transition maps is null; it is rapidly convergent if it is in the thick closure of nilpotent and constant towers. An augmented cosimplicial diagram is an ε-nilpotent limit if its cofiber totalization tower lies in the ε-enlargement of the nilpotent towers.

**Hypotheses.** C is small stable idempotent-complete and T is thick. Σ is finite and F ranges over finite spectra nonzero at each q∈Σ. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Perfect stable categories and localizing invariants](#kii-0-perfect-categories), `EnhancedDerivedSheaves:E5:abstract/verdier-quotient`, `EnhancedDerivedSheaves:E5:presentability/spectra`, `ChromaticHomotopyTheory:CH.0/finite-p-local-spectra`.

**Construction/proof outline.**

1. Define thick closures inside C and inside its tower category, using finite-spectrum tensoring.
2. Prove invariance under exact functors and the Verdier-quotient criterion for ε-enlargement.
3. Compare finite partial totalizations and their cofiber tower with the augmentation.

**Uses.** CMNN20 Theorem 4.4: The rational-transfer condition produces an ε-nilpotent Amitsur diagram. Galois descent: Periodic localization turns its totalization tower into a genuine limit.

**API.**

- `TauCeti.KTheory.EpsilonEnlargement.inclusion` (constructor): T is contained in T_ε, with T_(ε,∅)=T.
- `TauCeti.KTheory.EpsilonEnlargement.exact_map` (functoriality): An exact functor carrying T into U carries T_ε into U_ε.
- `TauCeti.KTheory.EpsilonEnlargement.quotient_test` (characterisation): X∈T_ε exactly when its image in Idem(C/T) is an ε-object.
- `TauCeti.KTheory.EpsilonEnlargement.augmentation_tower` (projection): An augmented cosimplicial object gives the tower cofib(X_(−1)→Tot_rX), which tests ε-nilpotent descent.

**Discriminating tests.**

- `TauCeti.KTheory.EpsilonEnlargement.test_empty_primes` (degenerate): T_(ε,∅)=T because the zero finite spectrum is among the intersection tests.
- `TauCeti.KTheory.EpsilonEnlargement.test_zero_tower` (degenerate): A tower of zero objects is nilpotent with transition-length bound 1.
- `TauCeti.KTheory.EpsilonEnlargement.test_pointwise_not_uniform` (non-example): HQ/Z is annihilated by every finite periodic localization but is not an ε-spectrum; pointwise invisibility cannot replace the uniform ε definition.

**Check.**

- The ε condition has a uniform finite set of primes; arbitrary pointwise periodic acyclicity is not its definition.

**Sources.** [cmnn20](https://www.nullplug.org/publications/GeneralLemma.pdf), Definitions 2.1–2.3, pp.7–8; Definitions 2.14–2.16, pp.11–12. Defines ε-enlargements and the towers needed for periodic descent.

<a id="kii-8-rational-transfer-cobar"></a>
### Rational transfer forces periodic descent

**Target** `GeneralAlgebraicKTheoryPartII:KII.8/rational-transfer-cobar` (theorem · planet: Rational-transfer descent). In a symmetric monoidal stable idempotent-complete ∞-category C, let R be commutative, A associative, and M an A-module with a map M→R for which π0 Map_C(1,M)⊗Q→π0 Map_C(1,R)⊗Q has the unit of R in its image. Then R lies in the ε-enlargement of the thick tensor ideal generated by A, and CB•aug(A)⊗R is an ε-nilpotent limit. In a presentable stable target, any such diagram satisfies L_n^fX_(−1)≃L_n^fTot(X•)≃Tot(L_n^fX•), and its localized totalization tower is rapidly convergent. The tower conclusion also holds with L_T(i), i≥1, by the same ε argument.

**Hypotheses.** C is stable symmetric monoidal, R commutative, A associative, and M an A-module mapping to R rationally onto its unit. The totalization conclusion uses a presentable stable target. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [ε-enlargement and descent towers](#kii-8-epsilon-enlargement), [Products and coefficient actions on enhanced K-theory](#kii-4-multiplicative-k), `ChromaticHomotopyTheory:CH.10`, `ChromaticHomotopyTheory:CH.4/finite-localizations`.

**Construction/proof outline.**

1. Clear finitely many rational denominators and fix their finite prime set Σ.
2. In the Verdier quotient by the tensor ideal generated by M and a Σ-nonzero finite spectrum, the image of R has a nilpotent integer unit annihilator. Its rational and mod-q homology vanish at every q; apply May nilpotence to its commutative endomorphism algebra and conclude R=0.
3. Thus R belongs to the indicated ε-tensor ideal; the thick-ideal cobar argument yields the ε-nilpotent totalization tower.
4. Finite chromatic localization identifies each ε-enlargement with its original thick subcategory; apply this to towers. Both localization-before-limit and limit-before-localization annihilate the cofiber tower, giving the two separate equivalences.

**Check.**

- Localization commutes with this totalization by the proven uniform tower property; no general commutation with inverse limits is asserted.

**Sources.** [cmnn20](https://www.nullplug.org/publications/GeneralLemma.pdf), Theorems 4.2–4.4 with proofs, p.19; Proposition 2.23, pp.13–14; Propositions 2.13 and 2.19, pp.11–13. Proves rational-unit tensor generation, cobar descent and periodic convergence.

<a id="kii-9"></a>
## KII.9. Height-one structure and its limits

Prove truncation, nilinvariance, excision, cdh-descent and both affine-line homotopy invariances for K(1)-local K. Compare with KH and record why the high-height TC and category-colimit statements fail at height one.

**Stage inputs.** `ChromaticHomotopyTheory:CH.8`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `GeneralAlgebraicKTheoryPartII:KII.0`, `GeneralAlgebraicKTheoryPartII:KII.2`, `GeneralAlgebraicKTheoryPartII:KII.4`, `GeneralAlgebraicKTheoryPartII:KII.5`, `RefinedTraceMethods:RT.3`, `SchemeKTheoryOperations:S.1`, `SchemeKTheoryOperations:S.4`, `SchemeKTheoryOperations:S.5`.

<a id="kii-9-height-one-truncation"></a>
### Height-one truncation and p-inversion

**Target** `GeneralAlgebraicKTheoryPartII:KII.9/height-one-truncation` (theorem · planet: Height-one truncation). If A is a K(1)-acyclic E1-ring, then K(A)→K(A[1/p]) is a K(1)-equivalence, without a connectivity restriction. If A is additionally connective, K(A)→K(π0A) is a K(1)-equivalence. The equality of T(1)- and K(1)-localization is the known height-one comparison, not the telescope conjecture at arbitrary height.

**Hypotheses.** A is K1-acyclic E1. Only the comparison with π0A requires A connective. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The chromatic purity theorem](#kii-5-purity), [Rational and p-adic truncation](#kii-2-waldhausen-truncation), `ChromaticHomotopyTheory:CH.8/local-telescope-comparison`.

**Construction/proof outline.**

1. Apply purity to A→A[1/p], since the T0 comparison is automatic and both T1 terms vanish.
2. For connective A use Waldhausen’s p-adic truncation on A[1/p].
3. Compare with the discrete π0 ring, keeping the connective assumption exactly at the truncation step.

**Check.**

- Every discrete ring is K(1)-acyclic, so its K(1)-local K-theory is unchanged by inverting p.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.23 and proof, p.1033. Separates arbitrary-ring p-inversion from connective truncation.

<a id="kii-9-height-one-excision"></a>
### Nilinvariance, Milnor excision and cdh-descent

**Target** `GeneralAlgebraicKTheoryPartII:KII.9/height-one-excision` (theorem · planet: Height-one descent). On discrete rings, L_K1K is nilinvariant and carries Milnor squares with a surjective side to pullback squares. For a qcqs scheme X, the invariant X↦L_K1K(Perf(X)) satisfies cdh-descent, using Nisnevich descent and abstract blowup squares with proper finitely presented modification and finitely presented closed immersion, as in LT Appendix A. Arbitrary closed immersions require the filtered-continuity extension in Remark A.3. The scheme statement is the extension through perfect complexes, not a topology on arbitrary noncommutative rings.

**Hypotheses.** Ring inputs are discrete; scheme inputs are qcqs and evaluated on Perf. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Height-one truncation and p-inversion](#kii-9-height-one-truncation), [Excision and nilinvariance for truncating invariants](#kii-2-truncating-excision), `SchemeKTheoryOperations:S.1`, `SchemeKTheoryOperations:S.4`.

**Construction/proof outline.**

1. Discrete rings are K1-acyclic, so height-one truncation gives a globally truncating invariant on ring inputs.
2. Apply truncating excision and nilinvariance.
3. Use the perfect-complex extension and Nisnevich descent, then Land–Tamme’s truncating-invariant blowup argument with the noetherian approximation/pro-descent input supplied by scheme K-theory.

**Check.**

- A nilpotent thickening has the same K1-local K-theory; a Milnor square without a surjective side requires additional hypotheses.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.24, p.1033. Deduces the three descent consequences. [lt](https://arxiv.org/pdf/1808.05559), Theorem 3.3, p.29; Theorem A.2 and proof, manuscript pp.35–37. Extends a truncating invariant to cdh descent on schemes.

<a id="kii-9-affine-lines"></a>
### Flat and smooth spectral affine lines

**Target** `GeneralAlgebraicKTheoryPartII:KII.9/affine-lines` (construction · planet: Spectral affine lines). For an E1-ring A define the flat polynomial algebra A[x]=A⊗Σ∞_+N. For connective A and a central E∞ sphere algebra, define A{x}=A⊗Sym_S(S), with Sym_S(S) the free E∞ sphere algebra on one degree-zero generator. The canonical A{x}→A[x] is a π0-isomorphism for connective A, but the two algebras need not be equivalent. Both retain an augmentation at x=0.

**Hypotheses.** A is E1; the π0 comparison requires A connective. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E5:presentability/spectra`.

**Construction/proof outline.**

1. Construct the monoid algebra and the free commutative sphere algebra, keeping their different symmetric-power constructions.
2. Define the comparison by the generator and compute π0 for connective A.
3. Compare augmentations and extension of scalars; identify the flat construction on HA with H(A[x]) for an ordinary ring A.

**Uses.** Corollary 4.25: Polynomial homotopy invariance concerns the flat affine line. Remark 4.26: The π0 comparison extends homotopy invariance to the smooth line.

**API.**

- `TauCeti.KTheory.AffineLines.generator` (constructor): The chosen degree-zero generator induces Sym_S(S)→Σ∞_+N and hence A{x}→A[x].
- `TauCeti.KTheory.AffineLines.pi_zero` (compatibility): For connective A, both π0 affine lines identify with π0(A)[x] and their comparison is the identity.
- `TauCeti.KTheory.AffineLines.augmentation` (relation): The inclusion A→A[x] followed by x=0 is id, and likewise for A{x}.
- `TauCeti.KTheory.AffineLines.map` (functoriality): A→B induces the two base-change maps compatibly with the generator and augmentation.

**Discriminating tests.**

- `TauCeti.KTheory.AffineLines.test_discrete_flat` (compatibility): For an ordinary ring R, HR[x]≃H(R[x]).
- `TauCeti.KTheory.AffineLines.test_zero` (degenerate): Both affine-line constructions on the zero ring are zero.
- `TauCeti.KTheory.AffineLines.test_symmetric_power` (non-example): For A=S, the smooth algebra’s degree-d symmetric piece is Σ∞_+BΣd rather than a single sphere; thus the comparison is not generally an equivalence.

**Check.**

- The distinction is visible on the sphere: the degree-d piece of the smooth free algebra contains Σ∞_+BΣd.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Definition in Corollary 4.25 and Remark 4.26, pp.1033–1034. Distinguishes the flat and free-E∞ affine lines.

<a id="kii-9-homotopy-invariance"></a>
### Height-one homotopy invariance

**Target** `GeneralAlgebraicKTheoryPartII:KII.9/homotopy-invariance` (theorem · planet: Height-one homotopy invariance). For connective K(1)-acyclic E1-ring A, the maps K(A)→K(A[x]), K(A)→K(A{x}), and K(A{x})→K(A[x]) are K(1)-equivalences. The result includes all discrete rings, with no regularity assumption. Flatness or the π0-isomorphism alone does not assert integral K-equivalence.

**Hypotheses.** A is connective K1-acyclic E1. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Flat and smooth spectral affine lines](#kii-9-affine-lines), [Height-one truncation and p-inversion](#kii-9-height-one-truncation), [Weibel localization and p-power nilpotent invariance](#kii-4-nk-localization).

**Construction/proof outline.**

1. The two affine lines are connective and K1-acyclic as A-modules.
2. First use height-one truncation to replace the flat input by its ordinary π0 polynomial ring, then use p-inversion to reduce to a Z[1/p]-algebra.
3. Weibel’s NK result makes multiplication by p invertible on every homotopy group of fib(K(A[x])→K(A)), so its p-completion, hence K1-localization, vanishes.
4. Apply height-one truncation to the smooth-to-flat π0-isomorphism and use composition to obtain the other comparisons.

**Check.**

- For a singular ring such as Fp[ε]/ε², this holds after K1-localization although integral polynomial invariance fails.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.25 with proof and Remark 4.26, pp.1033–1034. Gives the complete reduction to Weibel NK and the free-E∞ extension.

<a id="kii-9-kh-comparison"></a>
### Comparison with homotopy K-theory

**Target** `GeneralAlgebraicKTheoryPartII:KII.9/kh-comparison` (comparison). For every discrete ring A, K(A)→KH(A) induces L_K1K(A)≃L_K1KH(A). Import KH(A)=|K(A[Δ•])| and its simplicial structure from SchemeKTheoryOperations:S.5, with A[Δr]=A[x0,…,xr]/(Σxi−1).

**Hypotheses.** A is a discrete ring; KH is the supplier’s simplicial polynomial model. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Height-one homotopy invariance](#kii-9-homotopy-invariance), `SchemeKTheoryOperations:S.5`.

**Construction/proof outline.**

1. Each simplex algebra is a polynomial algebra in r variables, so its K1-local K agrees with that of A by repeated homotopy invariance.
2. Use the coherent augmented simplicial map, then the fact that localization is a left adjoint and preserves this realization.
3. Compare with the supplier’s specified KH model and its normalization maps.

**Check.**

- For regular noetherian A this agrees with the imported integral K≃KH comparison; singular A is allowed only in the localized assertion here.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Remark 4.27, p.1034. Obtains the KH comparison from polynomial homotopy invariance.

<a id="kii-9-tc-height-one-counterexample"></a>
### The height-one TC obstruction

**Target** `GeneralAlgebraicKTheoryPartII:KII.9/tc-height-one-counterexample` (application). The p-completion of TC(Z[1/p]) is zero, whereas L_K1TC(Z) is nonzero. Thus the map TC(Z)→TC(Z[1/p]) is not a K(1)-equivalence, and the arbitrary-ring high-height comparison K(A)←K(τ≥0A)→TC(τ≥0A) cannot be extended to height one. The nonzero height-one TC(Z) calculation is imported from RT.3 with its prime-two variant kept separate.

**Hypotheses.** p is fixed; the odd-prime decomposition and the prime-two calculation are separate supplier inputs. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Height-one truncation and p-inversion](#kii-9-height-one-truncation), `RefinedTraceMethods:RT.3`.

**Construction/proof outline.**

1. Use the p-inverted discrete input to compute TC(Z[1/p])^∧p=0.
2. At odd p the known K1-local TC(Z) decomposition includes L_K1S and a suspended p-complete KU summand; at p=2 use its separately computed filtered analogue.
3. Compare with height-one p-inversion invariance for K and deduce failure of a height-one version of the high trace comparison.

**Check.**

- A nonzero direct summand at odd p, and the separately proved nonzero prime-two calculation, detect the obstruction.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Remark 4.28, p.1034. Exhibits the precise height-one failure.

<a id="kii-9-tc-category-colimits"></a>
### TC does not preserve filtered category colimits

**Target** `GeneralAlgebraicKTheoryPartII:KII.9/tc-category-colimits` (application). Although L_K1TC commutes with filtered colimits of discrete rings, it does not commute with filtered colimits of small stable categories. The filtered colimit of Mod_(Z/p^r)(Perf(Z)) identifies with the p-power-torsion perfect Z-modules and sits in an exact sequence with Perf(Z) and Perf(Z[1/p]). Each stage has zero L_K1TC, while the colimit has nonzero L_K1TC.

**Hypotheses.** The diagram is a filtered system of enhanced perfect categories, not a filtered system of rings. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The height-one TC obstruction](#kii-9-tc-height-one-counterexample), [Finite p-power coefficient vanishing](#kii-4-finite-p-rings), [Perfect stable categories and localizing invariants](#kii-0-perfect-categories), `RefinedTraceMethods:RT.3`.

**Construction/proof outline.**

1. Construct the filtered system of module categories with their compatible forgetful functors; every compact p-power-torsion perfect Z-complex belongs to a stage.
2. Each stage’s TC is a module over TC(Z/p^r), whose K1-localization vanishes by the finite p-power K comparison.
3. Use localizing TC on the p-inversion exact sequence: its fiber identifies with TC(Z) at K1 because TC(Z[1/p]) vanishes.
4. This gives nonzero TC of the colimit and contradicts preservation of this category colimit, without contradicting the separate ring-colimit theorem.

**Check.**

- The counterexample’s objects are enhanced perfect categories; replacing its colimit by a colimit of the coefficient rings changes the assertion.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Remark 4.29, pp.1034–1035. Gives this filtered category counterexample while retaining the ring-colimit theorem.

<a id="kii-10"></a>
## KII.10. Additive comparison, sifted colimits and cyclic assembly

Conclude the additive-to-stable comparison and Levy’s chromatic corollary. Prove sifted-colimit preservation for high-height K and its localized ring subcategory, then TC and K assembly for all cyclic subgroups of an arbitrary group.

**Stage inputs.** `ChromaticHomotopyTheory:CH.6`, `GeneralAlgebraicKTheoryPartII:KII.0`, `GeneralAlgebraicKTheoryPartII:KII.1`, `GeneralAlgebraicKTheoryPartII:KII.3`, `GeneralAlgebraicKTheoryPartII:KII.4`, `GeneralAlgebraicKTheoryPartII:KII.5`, `RefinedTraceMethods:RT.2`.

<a id="kii-10-levy-chromatic"></a>
### Chromatic consequences of the bounded-heart fiber

**Target** `GeneralAlgebraicKTheoryPartII:KII.10/levy-chromatic` (comparison). For small stable idempotent-complete C, Kadd(C)→K(C) is a T(i)-equivalence for i≥2. If End_C(X)[1/p]=0 for every X, it is also a T1-equivalence. More generally, for a full additive subcategory A⊂C which thickly generates C, Kadd(A)→K(C) is a T(i)-equivalence for every i≥2. A need not itself be closed under every retract; the positive comparison is enough.

**Hypotheses.** C is small stable idempotent-complete; A is full additive and thickly generates C. The height-one conclusion requires End_C(X)[1/p]=0 for every X. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Levy’s bounded-heart fiber](#kii-3-bounded-heart-fiber), [Mitchell vanishing and the p-inverted sphere](#kii-4-mitchell), [Finite p-power coefficient vanishing](#kii-4-finite-p-rings), [High-height connective-cover invariance](#kii-5-connective-cover), [Additive and stable Schwede–Shipley comparison](#kii-1-additive-morita), `ChromaticHomotopyTheory:CH.6/connective-periodic-vanishing`.

**Construction/proof outline.**

1. For A=C use the bounded-heart fiber; connective K(D♥) is K(Z)-linear and Mitchell kills its heights≥2. Coconnective discrepancies are also acyclic there.
2. Under p-inverted endomorphism vanishing, devissage of the torsion heart reduces its connective K to K(Fp) at height one.
3. For a general additive generator subcategory pass to finite sets of generators and their direct sum X. Compare the positive Kadd-space with K(τ≥0End_C(X)) and use stable Morita plus high-height connective-cover invariance.

**Check.**

- No integral equivalence Kadd(C)≃K(C) is asserted, since cofiber relations are absent from additive group completion.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proposition 3.12, p.1027; Corollary 4.31 and proof, p.1035. Gives the two proofs and the general additive-generator variant.

<a id="kii-10-sifted-colimits"></a>
### Sifted colimits of high-height K-theory

**Target** `GeneralAlgebraicKTheoryPartII:KII.10/sifted-colimits` (theorem · planet: Sifted-colimit preservation). For n≥2, A↦L_T(n)K(A) from all E1-rings to T(n)-local spectra preserves sifted colimits. The same is true on the full subcategory of T(n−1)-local E1-rings, whose colimits are formed by localizing ambient ring colimits. No analogous statement for arbitrary filtered colimits of stable categories under L_K1TC is inferred.

**Hypotheses.** n≥2; the diagram is sifted in E1-rings or in the specified localized full subcategory. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [The high-height cyclotomic trace](#kii-5-high-trace), [The chromatic purity theorem](#kii-5-purity), [Theorem A in both forms](#kii-4-theorem-a), `RefinedTraceMethods:RT.2`, `ChromaticHomotopyTheory:CH.6/connective-periodic-vanishing`.

**Construction/proof outline.**

1. Import TC/p preservation of sifted colimits on connective E1-rings.
2. For a sifted diagram Ai compare colim τ≥0Ai→τ≥0(colim Ai); its positive telescope localizations agree, so Theorem A compares their K-theories.
3. Use the high trace equivalence and mod-p detection of telescopic equivalences to move K through the colimit.
4. On the T(n−1)-local ring subcategory, its ambient colimit→localized colimit is an adjacent-height equivalence because T(n−1)-local spectra are T(n)-acyclic; apply purity.

**Check.**

- Both a filtered diagram and a geometric realization are covered. The subcategory’s colimit is not silently identified with the ambient colimit.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.32 and proof, pp.1035–1036. Proves both sifted-colimit assertions and specifies the localized-subcategory argument.

<a id="kii-10-cyclic-orbit-assembly"></a>
### Cyclic orbit diagrams and assembly

**Target** `GeneralAlgebraicKTheoryPartII:KII.10/cyclic-orbit-assembly` (definition · planet: Cyclic assembly). For a discrete group G, let Or_Cyc(G) be the full subcategory of the G-orbit category on G/H for all cyclic H≤G, including infinite cyclic H. For an E1-ring R put R[H]=R⊗Σ∞_+H. Use the action-groupoid construction and induction of perfect modules to give a coherent functor G/H↦K(R[H]) and the analogous TC diagram. The collapse G/H→G/G gives assembly colim_OrCyc K(R[H])→K(R[G]).

**Hypotheses.** G is any discrete group; the family contains every cyclic subgroup, finite or infinite. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), `RefinedTraceMethods:RT.2/cyclotomic-spectrum`, [Waldhausen A-theory](#kii-1-a-theory).

**Construction/proof outline.**

1. Construct the transport groupoid of a G-set, then its R-linear perfect-module category; this avoids noncanonical choices of conjugating elements in orbit morphisms.
2. Apply the invariant and identify transitive orbits with the group-ring value.
3. Use the terminal orbit in Or(G) to define the natural cocone and its assembly map.

**Uses.** Proposition 4.33: The same coherent orbit category indexes the THH and TC assembly maps. Corollary 4.34: The natural high-height trace comparison transfers TC assembly to K.

**API.**

- `TauCeti.KTheory.CyclicOrbitAssembly.group_algebra` (constructor): R[H] is the associative monoid algebra with group multiplication.
- `TauCeti.KTheory.CyclicOrbitAssembly.orbit_functor` (functoriality): Orbit morphisms induce the transport/induction maps, coherently with composition and conjugation.
- `TauCeti.KTheory.CyclicOrbitAssembly.assembly` (projection): The collapse cocone gives the canonical map from the orbit colimit to the value at R[G].
- `TauCeti.KTheory.CyclicOrbitAssembly.cyclic_terminal` (simp): If G is cyclic, the colimit over Or_Cyc(G) evaluates at G/G.

**Discriminating tests.**

- `TauCeti.KTheory.CyclicOrbitAssembly.test_trivial_group` (degenerate): For G=1, assembly is the identity on K(R).
- `TauCeti.KTheory.CyclicOrbitAssembly.test_infinite_cyclic` (characterisation): For G=Z, the family includes G itself and assembly has a terminal indexing orbit.
- `TauCeti.KTheory.CyclicOrbitAssembly.test_finite_family_wrong` (non-example): For G=Z the family of finite cyclic subgroups contains only 1 and has no orbit G/G; it cannot replace the stated indexing family.

**Check.**

- For cyclic G, G/G belongs to Or_Cyc(G) and is terminal, so assembly is an equivalence before localization.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Definition preceding Proposition 4.33, p.1036. Specifies the orbit family and group-ring assembly maps.

<a id="kii-10-tc-cyclic-assembly"></a>
### p-adic TC assembly for cyclic subgroups

**Target** `GeneralAlgebraicKTheoryPartII:KII.10/tc-cyclic-assembly` (theorem · planet: p-adic TC assembly). For a connective E1-ring R and any discrete group G, colim_(G/H∈Or_Cyc(G))TC(R[H])→TC(R[G]) is a p-adic equivalence. The colimit is formed before p-completion. This does not assert that uncompleted p-typical TC assembly is always an equivalence.

**Hypotheses.** R is connective E1; G is any discrete group; completion is after the orbit colimit. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [Cyclic orbit diagrams and assembly](#kii-10-cyclic-orbit-assembly), `RefinedTraceMethods:RT.2`.

**Construction/proof outline.**

1. Import the all-cyclic THH assembly equivalence for arbitrary G, with its compatible cyclotomic structure.
2. Import TC/p preservation of all small colimits of connective cyclotomic spectra; all group-ring THH inputs satisfy connectivity.
3. Apply TC/p to the THH assembly equivalence and use mod-p detection of p-complete equivalences.

**Check.**

- If G is cyclic the assertion is the terminal-orbit identity; arbitrary noncyclic and infinite groups are allowed.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Proposition 4.33 and proof, p.1036. Combines THH assembly and TC/p colimit preservation, with completion on the final assembly map.

<a id="kii-10-k-cyclic-assembly"></a>
### Telescopic Farrell–Jones assembly

**Target** `GeneralAlgebraicKTheoryPartII:KII.10/k-cyclic-assembly` (theorem · planet: Telescopic Farrell–Jones theorem). For every E1-ring R, every discrete group G and every n≥2, the assembly map colim_(G/H∈Or_Cyc(G))K(R[H])→K(R[G]) is a T(n)-equivalence. There is no connectivity requirement on R and the family includes infinite cyclic subgroups.

**Hypotheses.** R is any E1-ring, G any discrete group and n≥2. Universe bounds are fixed explicitly; changing universe uses the specified enlargement comparisons.

**Direct inputs.** [p-adic TC assembly for cyclic subgroups](#kii-10-tc-cyclic-assembly), [The high-height cyclotomic trace](#kii-5-high-trace), [Cyclic orbit diagrams and assembly](#kii-10-cyclic-orbit-assembly), `ChromaticHomotopyTheory:CH.6/connective-periodic-vanishing`.

**Construction/proof outline.**

1. Use the natural high-height comparison on every group ring to replace K(R[H]) by TC(τ≥0R[H]).
2. Identify τ≥0(R[H])≃(τ≥0R)[H], since the group ring is a direct sum of copies of R as a spectrum.
3. Apply connective p-adic TC assembly, then positive telescopic localization; naturality identifies its map with the K assembly map.

**Check.**

- The proof covers periodic coefficient rings and infinite G; it does not claim the integral Farrell–Jones conjecture.

**Sources.** [lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), Corollary 4.34 and proof, p.1036. Transfers the p-adic TC theorem through the high-height trace equivalence.

## Supplier extensions and proof-audit work

Each supplier extension has exact consumers in the packet. None is treated as an already proved declaration. All eleven layers remain planned after independent review: closure still requires resolution of each applicable contract, including inherited foundation contracts and G1.

### R1. StableHomotopyKTheory:H.3

The coherent plus/group-completion interface with elementary perfect subgroup, acyclic map and relative homology comparison used for connective matrix-unit spaces. Classical plus is imported, not defined again.

**Consumers.** [General linear groups of connective ring spectra](#kii-1-connective-plus).

### R2. GeneralAlgebraicKTheory:K.2:plus

The discrete plus model and its natural comparison with projective-module K-theory, including the positive component and stabilization. Extend only its enrichment in KII.1.

**Consumers.** [General linear groups of connective ring spectra](#kii-1-connective-plus).

### R3. StableHomotopyKTheory:H.5:spectra

Spectrum assembly, connective spectra versus grouplike E∞ spaces, spectrification and Ω-realization comparison for the enhanced S-construction; no new spectrum carrier is planned here.

**Consumers.** [The stable S-construction](#kii-0-enhanced-s-construction), [Additive ∞-categories and group-completion K-theory](#kii-1-additive-k).

### R4. StableHomotopyKTheory:H.5:S-delooping

Iterated Waldhausen delooping as a coherently assembled connective spectrum, with enhancement and realization comparisons.

**Consumers.** [The stable S-construction](#kii-0-enhanced-s-construction).

### R5. EnhancedDerivedSheaves:E5:abstract

For connective E1 rings, construct coherent Postnikov truncations and identify τ≤r A→τ≤r−1 A as the pullback of a square-zero extension classified by the derivation into Σ^(r+1)HπrA (Lurie, Higher Algebra, 7.4.1.29, as used and explained in LMMT Lemma 3.3, pp.1022–1023). Supply multiplicative truncations, bimodules and connective tensor bounds. This is a supplier extension, not an assertion that a triangulated t-structure proves it.

**Consumers.** [One finite Postnikov stage suffices](#kii-4-finite-postnikov).

### R6. KTheoryLowDegrees:Z.1

Nilpotent invariance of projective K0 with the actual quotient-induced comparison: lifting idempotents and isomorphisms modulo any nilpotent two-sided ideal.

**Consumers.** [Nonpositive nilpotent invariance](#kii-4-nil-nonpositive), [Iterated finite p-power K-theory](#kii-7-iterated-finite-p).

### R7. ChromaticHomotopyTheory:CH.10

Chromatic Nullstellensatz field maps: for n≥1 a nonzero T(n)-local E∞ R admits a unital map to E_n(L), L algebraically closed of characteristic p. At n=0 the input is a nonzero rational E∞-ring and E0(L)=HL[u±1] for L algebraically closed of characteristic zero; T0=S[1/p] is not enough for this input. Also the May-nilpotence unit criterion for rational and all mod-q Hurewicz images used by CMNN Theorem 4.2. These are additions to the existing height and power-operation layer, sourced by BSY Corollary 5.2 and CMNN20 p.19.

**Consumers.** [Redshift at nonnegative height](#kii-6-redshift), [Rational transfer forces periodic descent](#kii-8-rational-transfer-cobar).

### R8. ChromaticHomotopyTheory:CH.7

Extend the existing Lubin–Tate realization with (i) the universal height-n formal-group map used after strict-Henselian residue reduction in Yuan §4, and (ii) an even finite-rank free H-complex detecting the equivariant Morava-E coinduced module of CMNN20 Theorem B.2, pp.37–38. Keep the full semilinear field action; the rational K0 transfer consequence is proved in KII.8.

**Consumers.** [Yuan’s Lubin–Tate nonvanishing input](#kii-6-yuan-lower), [Rational transfer for higher real K-theories](#kii-8-lubin-tate-transfer).

### R9. ChromaticHomotopyTheory:CH.12

Regular connective ko/tmf coefficient models and their coherent-support localization hypotheses: identify the compact localization kernel by finite presentation over π0 for the Bott and modular-form localizations. The generic regular localization theorem is KII.3; no integral unlocalized sequence for arbitrary tmf-algebras is requested.

**Consumers.** [Classical regular localization checks](#kii-8-regular-examples).

### R10. MotivicEtaleKTheory:M.7

Supply Suslin comparison for algebraically closed characteristic-zero L, K(L)^∧p≃ku^∧p, and extend telescopically localized étale K descent to the spectral even-periodic rings and strict-Henselian residue detection in Yuan §4. Ordinary-scheme descent alone does not meet this input.

**Consumers.** [The height-zero lower bound](#kii-6-height-zero), [Yuan’s Lubin–Tate nonvanishing input](#kii-6-yuan-lower).

### R11. RefinedTraceMethods:RT.2

TC/p preserves all small colimits of connective cyclotomic spectra, and the resulting TC/p functor on connective E1-rings preserves sifted colimits (CMM Theorem 2.7 and Corollary 2.15, used in LMMT pp.1035–1036). Supply coherent THH assembly for all cyclic subgroups, including infinite ones, via transport groupoids (LRRV Theorem 1.19, used in LMMT Proposition 4.33). Also supply the Tate-orbit/circle-Tate comparison and coconnective Tate-vanishing calculation with residual S1/Cp action in Yuan §§3–4; no trivial-action substitution.

**Consumers.** [Yuan’s Lubin–Tate nonvanishing input](#kii-6-yuan-lower), [Sifted colimits of high-height K-theory](#kii-10-sifted-colimits), [p-adic TC assembly for cyclic subgroups](#kii-10-tc-cyclic-assembly).

### R12. RefinedTraceMethods:RT.3

The explicit K(1)-local TC(Z) nonvanishing calculation at odd primes and at 2, vanishing for TC(Z[1/p]) after p-completion, and Theorem G filtered-colimit preservation of K(1)-local TC on discrete rings. LMMT Remarks 4.28–4.29, pp.1034–1035, supply the reduction; these calculation proofs are supplier obligations. Verify the suspension convention in stable-K=THH before reusing it in the optimality argument; only vanishing/nonvanishing independent of fixed shifts is used here.

**Consumers.** [The height-one TC obstruction](#kii-9-tc-height-one-counterexample), [TC does not preserve filtered category colimits](#kii-9-tc-category-colimits).

### R13. RefinedTraceMethods:RT.5/localizing-motives

An A-linear weakly additive motive interface Motκ(A), monoidal functor on perfect A-linear categories, transfer/projective formula, and canonical K0-to-π0-unit map, as in CMNN20 §3 and proof of Theorem 5.1, pp.20–21. Current RT.5 supplies generic localizing motives; this precise weakly additive linear refinement is a requested extension. ε-generation and the rational-transfer cobar argument are KII.8 targets.

**Consumers.** [Telescopic K-theory Galois descent](#kii-8-galois-descent).

### R14. SchemeKTheoryOperations:S.1

Coherent Perf(X) enhancement and pullback for qcqs schemes, including descent and compatibility with the parent’s ordinary K spectrum; the scheme carriers and geometry remain S.1.

**Consumers.** [Nilinvariance, Milnor excision and cdh-descent](#kii-9-height-one-excision).

### R15. SchemeKTheoryOperations:S.4

Nisnevich descent for Perf-valued localizing invariants, derived blow-up descent, noetherian approximation of finitely presented abstract blow-up squares, and blow-up domination via platification as used in LT Appendix A.2 Steps 1–4, pp.35–37. Keep the finite presentation requirement unless filtered continuity is proved.

**Consumers.** [Nilinvariance, Milnor excision and cdh-descent](#kii-9-height-one-excision).

### R16. SchemeKTheoryOperations:S.5

KH(A)=|K(A[Δ•])| with its natural polynomial homotopy, regular-ring comparison, and the Karoubi–Villamayor comparison spectral sequence and nilpotent invariance from Weibel Theorems 5.1–5.2, p.484. Supply the relative comparison, convergence and the link to nonpositive Bass groups. KH is imported here, not redefined.

**Consumers.** [Weibel localization and p-power nilpotent invariance](#kii-4-nk-localization), [Comparison with homotopy K-theory](#kii-9-kh-comparison).

### G1 — Continuous Witt action: finite-annihilator proof audit

Weibel Theorem 3.1, p.474, gives the needed continuous action and finite annihilator but sends its construction proof to Stienstra. This run read the public Weibel scan and the NK consequences, not that cited original proof. Before marking KII.4 closed, read an authorized public construction, verify the nilpotent-endomorphism filtration argument, and check that Bass contraction extends the action and continuity to every negative degree. The target, API and test cases are specified; the proof is not claimed audited.

**Consumers.** [Continuous Witt operations on NK](#kii-4-nil-witt-action), [Weibel localization and p-power nilpotent invariance](#kii-4-nk-localization).

## Extraction coverage and theorem boundary

The extraction's first route assigns 73 items to this Part II. Seventy-two are covered by target nodes and one is recorded as a question boundary. The table indexes the job's coverage; it is not a source synopsis. Parent and supplier material outside this route remains with its existing owner. The negative-degree induction, an additional local target from item /68, is included as KII.4/nil-nonpositive and imports Z.1 and Bass rather than taking over their definitions.

Question 3.10, p.1026, asks for a general K(n)-purity analogue. This source does not establish that statement, and this roadmap does not assert it. This boundary records what is proved by the source, without making a claim about the current research status of the question.

| Extraction item | Target or boundary |
| --- | --- |
| /3 | [Theorem A in both forms](#kii-4-theorem-a) |
| /4 | [CMNN finite-sphere vanishing](#kii-5-cmnn-vanishing) |
| /5 | [The chromatic purity theorem](#kii-5-purity) |
| /7 | [Theorem B and vanishing for algebras](#kii-6-height-upper) |
| /8 | [Redshift at nonnegative height](#kii-6-redshift), [Yuan’s Lubin–Tate nonvanishing input](#kii-6-yuan-lower), [The height-zero lower bound](#kii-6-height-zero) |
| /9 | [Redshift in chromatic graded pieces](#kii-6-graded-redshift) |
| /10 | [Height-one truncation and p-inversion](#kii-9-height-one-truncation) |
| /11 | [K-theory of Morava K-theory](#kii-7-morava-k), [Truncated Brown–Peterson localization](#kii-7-bp-localization) |
| /12 | [The high-height cyclotomic trace](#kii-5-high-trace) |
| /13 | [Telescopic Farrell–Jones assembly](#kii-10-k-cyclic-assembly) |
| /28 | [Perfect stable categories and localizing invariants](#kii-0-perfect-categories), [Perfect modules and K-theory of ring spectra](#kii-0-ring-k-theory), [Nonconnective K-theory of stable categories](#kii-0-nonconnective-k) |
| /29 | [General linear groups of connective ring spectra](#kii-1-connective-plus) |
| /30 | [The stable S-construction](#kii-0-enhanced-s-construction) |
| /31 | [Highly connective chromatic invariance](#kii-4-highly-connective) |
| /32 | [The Land–Tamme replacement algebra](#kii-2-amalgam) |
| /33 | [Connectivity of the replacement algebra](#kii-4-amalgam-connectivity) |
| /34 | [Truncating invariants on acyclic rings](#kii-2-truncating), [Excision and nilinvariance for truncating invariants](#kii-2-truncating-excision) |
| /35 | [One finite Postnikov stage suffices](#kii-4-finite-postnikov) |
| /36 | [One finite Postnikov stage suffices](#kii-4-finite-postnikov) |
| /37 | [Telescopic K is truncating on finite-acyclic rings](#kii-4-acyclic-truncation) |
| /38 | [Finite p-power coefficient vanishing](#kii-4-finite-p-rings) |
| /40 | [Additive ∞-categories and group-completion K-theory](#kii-1-additive-k) |
| /41 | [Additive and stable Schwede–Shipley comparison](#kii-1-additive-morita) |
| /42 | [Acyclic additive and stable categories](#kii-4-acyclic-categories) |
| /43 | [Thomason–Neeman localization](#kii-0-thomason-neeman) |
| /44 | [Compact chromatic kernel for ring modules](#kii-4-finite-kernel) |
| /45 | [Mitchell vanishing and the p-inverted sphere](#kii-4-mitchell) |
| /46 | [Theorem A in both forms](#kii-4-theorem-a) |
| /51 | [CMNN finite-sphere vanishing](#kii-5-cmnn-vanishing), [The finite-group K-theory transfer comparison](#kii-5-genuine-k-transfer) |
| /52 | Question boundary: no general K(n)-purity assertion |
| /54 | [Both heights in purity are necessary](#kii-6-optimality) |
| /55 | [Stable envelopes and additive nonconnective K-theory](#kii-3-stable-envelope) |
| /56 | [The theorem of the heart and noetherian extension](#kii-3-theorem-heart) |
| /57 | [Levy’s bounded-heart fiber](#kii-3-bounded-heart-fiber), [Chromatic consequences of the bounded-heart fiber](#kii-10-levy-chromatic) |
| /58 | [The chromatic purity theorem](#kii-5-purity) |
| /59 | [High-height connective-cover invariance](#kii-5-connective-cover) |
| /60 | [Theorem B and vanishing for algebras](#kii-6-height-upper) |
| /61 | [Connective nilpotent comparisons for K and TC](#kii-5-connective-variants) |
| /62 | [Connective nilpotent comparisons for K and TC](#kii-5-connective-variants) |
| /64 | [Connective nilpotent comparisons for K and TC](#kii-5-connective-variants) |
| /65 | [Nice maps of connective E∞-rings](#kii-7-nice-maps) |
| /66 | [K preserves nice maps](#kii-7-k-nice) |
| /67 | [Iterated finite p-power K-theory](#kii-7-iterated-finite-p) |
| /69 | [K-theory of Morava K-theory](#kii-7-morava-k) |
| /70 | [Regular ring-spectrum devissage](#kii-3-regular-localization) |
| /71 | [K-theory of Morava K-theory](#kii-7-morava-k) |
| /72 | [K-theory of truncated spheres](#kii-7-truncated-spheres) |
| /73 | [Truncated Brown–Peterson localization](#kii-7-bp-localization) |
| /74 | [Truncated Brown–Peterson localization](#kii-7-bp-localization) |
| /76 | [Waldhausen A-theory](#kii-1-a-theory) |
| /77 | [Purity for suspension A-theory](#kii-7-a-suspension) |
| /80 | [K-theory of James-filtered Thom spectra](#kii-7-james-thom) |
| /81 | [K-theory of James-filtered Thom spectra](#kii-7-james-thom) |
| /83 | [Purity for ko-algebras](#kii-8-ko-algebras) |
| /84 | [Classical regular localization checks](#kii-8-regular-examples) |
| /87 | [Purity for tmf-algebras](#kii-8-tmf-algebras), [Supersingular fixed-point description](#kii-8-supersingular-descent) |
| /88 | [Classical regular localization checks](#kii-8-regular-examples) |
| /89 | [Height-one truncation and p-inversion](#kii-9-height-one-truncation) |
| /90 | [Nilinvariance, Milnor excision and cdh-descent](#kii-9-height-one-excision) |
| /91 | [Height-one homotopy invariance](#kii-9-homotopy-invariance), [Flat and smooth spectral affine lines](#kii-9-affine-lines) |
| /92 | [Comparison with homotopy K-theory](#kii-9-kh-comparison) |
| /94 | [The height-one TC obstruction](#kii-9-tc-height-one-counterexample) |
| /95 | [TC does not preserve filtered category colimits](#kii-9-tc-category-colimits) |
| /96 | [The high-height cyclotomic trace](#kii-5-high-trace) |
| /97 | [Chromatic consequences of the bounded-heart fiber](#kii-10-levy-chromatic) |
| /98 | [Sifted colimits of high-height K-theory](#kii-10-sifted-colimits) |
| /99 | [Cyclic orbit diagrams and assembly](#kii-10-cyclic-orbit-assembly) |
| /100 | [p-adic TC assembly for cyclic subgroups](#kii-10-tc-cyclic-assembly) |
| /101 | [Telescopic Farrell–Jones assembly](#kii-10-k-cyclic-assembly) |
| /104 | [Rational and p-adic truncation](#kii-2-waldhausen-truncation) |
| /111 | [Nonpositive K-theory of connective rings](#kii-2-nonpositive) |
| /112 | [Continuous Witt operations on NK](#kii-4-nil-witt-action), [Weibel localization and p-power nilpotent invariance](#kii-4-nk-localization) |
| /116 | [Telescopic K-theory Galois descent](#kii-8-galois-descent), [Rational transfer for higher real K-theories](#kii-8-lubin-tate-transfer), [ε-enlargement and descent towers](#kii-8-epsilon-enlargement), [Rational transfer forces periodic descent](#kii-8-rational-transfer-cobar) |

## Independently reviewed source issue

### GeneralAlgebraicKTheoryPartII/E1

LMMT published introduction, p.1014, Redshift Theorem and its Nullstellensatz discussion; compare Definition 2.1, p.1016, with BSY §9 opening, p.86, Corollary 5.2, p.55, and Theorem 9.11, p.89.

In our words: the introduction states redshift for every E∞ ring of nonnegative height and describes a characteristic-zero periodic field map in height zero, while its global convention is T0=S[1/p].

**Correction used.** At height zero require R⊗HQ≠0, or state the theorem for p-local input as in BSY §9. Positive-height redshift and the arbitrary-ring T(n)-purity theorem keep their stated scope. KII.6/redshift uses this corrected domain.

**Reason.** For an odd coefficient prime p, take R=(HF2)^tC2. It is a nonzero E∞ ring of characteristic 2 with an invertible degree-one class, so R[1/p]=R and every positive telescope at p annihilates R: its global height is 0, but it has no unital map to any characteristic-zero field. On perfect R-modules suspension is equivalent to the identity; additivity makes multiplication by 2 zero on K(R). Since 2 is invertible at odd p, all positive p-telescopes annihilate K(R), so its height is at most 0, contradicting the unrestricted global formula 0+1. This is the BSY Remark 9.13 example evaluated at a different prime. BSY explicitly begins §9 with p-local rings.

**Correction search.** No published correction was located in the recorded searches on 2026-10-19. BSY §9 already has the p-local convention. The independent review confirms the source-scope error under LMMT’s stated global T0 convention. The independent review also checked Land’s and Mathew’s publication lists and the arXiv version history; none linked a correction to this statement.

**Independent verdict.** Confirmed by `REV-DESIGN-GeneralAlgebraicKTheoryPartII` on 2026-10-19. Independently checked LMMT pp.1014 and 1016 against BSY §9 pp.86–90 and Corollary 5.2 p.55. BSY assumes p-local rings. At an odd coefficient prime the characteristic-two one-periodic E∞ ring of Remark 9.13 survives p-inversion, has no rational part, and has 2-torsion K-theory by additivity; its positive odd-primary telescopes vanish. This disproves the unrestricted global height-zero conclusion and confirms the rational-part correction used by the nodes.

## Sources and editions

Every mathematical statement above is written in this roadmap’s own words. Locators refer to the edition in this list. Read dates and SHA-256 hashes are in the packet. The published LMMT pagination resolves the extraction’s stale cross-reference in Corollary 4.31 to Proposition 3.12; no erratum to that published statement is asserted. No restricted book was needed.

- **[lmmt](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf)** — Markus Land, Akhil Mathew, Lennart Meier and Georg Tamme. *Purity in chromatically localized algebraic K-theory*. Journal of the American Mathematical Society 37 (2024), 1011–1040; DOI 10.1090/jams/1043; published author-hosted PDF. Read 2026-10-19. Entire article, §§1–4.5, pp.1011–1040, including all proofs and references. Locators below use printed journal pages.
- **[bgt](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf)** — Andrew J. Blumberg, David Gepner and Gonçalo Tabuada. *A universal characterization of higher algebraic K-theory*. Geometry & Topology 17 (2013), 733–838; author-hosted published PDF. Read 2026-10-19. §4.3, Theorems 4.22–4.23, pp.770–771; §5.1–5.2, pp.775–779. §7.1–7.2, pp.788–795; §§9.1–9.5, pp.806–820; Theorem 9.53 and proof, pp.825–826.
- **[lt](https://arxiv.org/pdf/1808.05559)** — Markus Land and Georg Tamme. *On the K-theory of pullbacks*. Author manuscript arXiv:1808.05559, downloaded 2026-10-19; manuscript page numbering; published Annals of Mathematics 190 (2019), 877–930. Read 2026-10-19. Notation 1.1, Definition 1.2 and Theorem 1.3 with its construction, pp.5–14. Lemma 2.4 and proof, pp.16–17; Definition 3.1, Theorem 3.3 and Corollary 3.5, pp.28–30. Appendix A, especially Theorem A.2 and its four-step proof, pp.35–37.
- **[cmnn20](https://www.nullplug.org/publications/GeneralLemma.pdf)** — Dustin Clausen, Akhil Mathew, Niko Naumann and Justin Noel. *Descent in algebraic K-theory and a conjecture of Ausoni–Rognes*. Author manuscript, manuscript pages 1–43; published Journal of the European Mathematical Society 22 (2020), 1149–1200. Read 2026-10-19. §2, Definitions 2.1–2.3, ε-enlargements, towers, Propositions 2.13, 2.19 and 2.23, pp.7–14. Theorems 4.2–4.4 and proofs, p.19; Theorems 5.1 and 5.6 with proofs, pp.20–22. Appendix B, Theorem B.2, transfer construction and Corollary B.4, pp.37–39. The underlying equivariant Morava-E realization remains a CH.7 request.
- **[cmnn24](https://arxiv.org/pdf/2011.08233)** — Dustin Clausen, Akhil Mathew, Niko Naumann and Justin Noel. *Descent and vanishing in chromatic algebraic K-theory via group actions*. arXiv:2011.08233 as downloaded 2026-10-19; manuscript numbering; published Annales scientifiques de l’École normale supérieure 57 (2024), 1135–1190. Read 2026-10-19. Theorem 4.6, Lemma 4.7 and proof, pp.19–20, for the Tate-height converse; Lemma 4.9 and Theorem 4.10 with proofs, pp.20–21, for the vanishing induction. Numbering follows this downloaded version.
- **[barwick](https://arxiv.org/pdf/1212.5232)** — Clark Barwick. *On exact infinity-categories and the theorem of the heart*. arXiv:1212.5232, downloaded 2026-10-19; manuscript numbering. Read 2026-10-19. Theorem 6.1 and its proof, pp.19–23; its conclusion is connective K-theory.
- **[agh](https://arxiv.org/pdf/1610.07207)** — Benjamin Antieau, David Gepner and Jeremiah Heller. *K-theoretic obstructions to bounded t-structures*. arXiv:1610.07207, downloaded 2026-10-19; manuscript numbering. Read 2026-10-19. §§2.1–2.2, Definitions 2.1, 2.4 and 2.7, pp.5–7, for enhanced t-structures, hearts and boundedness. Theorem 3.18 and proof, pp.27–29, including the noetherian-heart hypothesis. Proposition 4.4 and Example 4.6, pp.34–35, for regular localization and coherent support.
- **[hs](https://arxiv.org/pdf/2103.13911)** — Fabian Hebestreit and Wolfgang Steimle. *Stable moduli spaces of hermitian forms*. arXiv:2103.13911, downloaded 2026-10-19; manuscript numbering. Read 2026-10-19. §3.1, pp.17–19, for the additive stable envelope; Corollary 8.1.3, pp.70–71, for group completion.
- **[pp](https://arxiv.org/pdf/2110.03669v1)** — Irakli Patchkoria and Piotr Pstrągowski. *Adams spectral sequences and Franke’s algebraicity conjecture*. arXiv:2110.03669v1; manuscript numbering. Read 2026-10-19. Lemmas 4.24–4.25 and Theorem 4.26 with their proofs, pp.35–36.
- **[mitchell](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Mitchell-KK.pdf)** — Stephen A. Mitchell. *The Morava K-theory of algebraic K-theory spectra*. K-Theory 3 (1990), 607–626; author-hosted journal scan. Read 2026-10-19. Introduction, Theorems A–B, pp.607–609; §3, pp.619–622, including the finite v_n unit-factorization argument.
- **[yuan](https://arxiv.org/pdf/2111.10837)** — Allen Yuan. *Examples of chromatic redshift in algebraic K-theory*. arXiv:2111.10837 as downloaded 2026-10-19; manuscript numbering. Read 2026-10-19. Theorems A and C, pp.2–3; §3, pp.6–7, and §4, pp.7–9, including the residual circle action and étale detection.
- **[bsy](https://arxiv.org/pdf/2207.09929v1)** — Robert Burklund, Tomer M. Schlank and Allen Yuan. *The Chromatic Nullstellensatz*. arXiv:2207.09929v1; manuscript numbering. Read 2026-10-19. Theorem D/Corollary 5.2, pp.3 and 55, for the chromatic field map. Theorem 9.11, Proposition 9.12 and Remark 9.13, pp.88–90, including height zero and the negative-height counterexample.
- **[weibel](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/MV-NK-854.pdf)** — Charles A. Weibel. *Mayer–Vietoris sequences and module structures on NK_**. Lecture Notes in Mathematics 854 (1981), 466–493; author-hosted journal scan; printed pages. Read 2026-10-19. Theorem 2.3, p.473; Theorem 3.1, Exercise 3.2 and Corollary 3.3, pp.474–477. §5, Theorems 5.1–5.2 and Corollary 5.4, pp.483–485. The finite-annihilator construction cited there to Stienstra is the explicit proof-audit gap G1.
- **[bgt-mult](https://arxiv.org/pdf/1103.3923)** — Andrew J. Blumberg, David Gepner and Gonçalo Tabuada. *Uniqueness of the multiplicative cyclotomic trace*. arXiv:1103.3923, downloaded 2026-10-19; manuscript numbering; published Advances in Mathematics 260 (2014), 191–232. Read 2026-10-19. Theorem 5.8, Proposition 5.9 and Corollaries 5.10–5.11 with proof, p.23; multiplicative structure and ring-spectrum consequences.
- **[cdh](https://bcalmes.perso.math.cnrs.fr/pro/recherche/publis/hermpoinc-one/HermKstableI.pdf)** — Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle. *Hermitian K-theory for stable infinity-categories I: Foundations*. Author-hosted manuscript, downloaded 2026-10-19; manuscript numbering. Read 2026-10-19. §4.4 opening, p.84, and the model comparison preceding Lemma 4.4.11, pp.89–90; compact parametrized spectra and finitely dominated retractive spaces.
