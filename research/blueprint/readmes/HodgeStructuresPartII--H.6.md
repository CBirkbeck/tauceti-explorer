# Hodge structures, Part II — H.6

## Semistable degeneration and logarithmic monodromy

This layer connects two realizations of degeneration. A proper reduced semistable family produces special-fibre logarithmic de Rham cohomology and a geometric residue. A polarized integral variation produces a period lift, commuting monodromy logarithms and a limiting flag. The comparison identifies the geometric residue with the appropriately scaled logarithm, and the nilpotent-orbit analysis gives the mixed Hodge and norm structures used by H.7. Schmid's SL₂-orbit theorem is the input for the limiting mixed Hodge structure and for the one-variable arithmetic containment that the layer also supplies; H.7 owns the multivariable containment, definability and locus results.

This is a target-level plan with 32 nodes. `HodgeStructuresPartII:H.6` has coverage **planned**, and the packet status is **complete** for this planning pass. It is not closed: six precise gaps and seven supplier requests remain. Every node has implementation status unchecked. The [packet](../packets/HodgeStructuresPartII--H.6.json) gives the dependency graph, and the [suggested file](../suggested/HodgeStructuresPartII--H.6.lean) gives typed statements; where an object belongs to another layer the file uses a stand-in type or function, so its elaboration cannot be mistaken for a proof of the source theorems.

### Starting point and ownership

The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The reviewed library audit already covers pure and mixed Hodge structures, polarizations, Deligne splitting and period-domain points. Those carriers are reused. In particular, the limiting mixed Hodge structure is an instance of the native rational mixed object, and its graded pure structures are the existing `MixedHodgeStructure.gradedHodgeStructure`. This layer does not define a substitute with unrelated filtrations.

ShimuraData D3 owns polarized integral variations. H.2 supplies the canonical-extension interfaces, the residue convention and Deligne's logarithmic comparison. H.3 supplies the compact dual, the period manifold, marked holomorphic horizontal period maps with their monodromy equivariance, the filtration of the Lie algebra and the exponential charts at a flag for a specified complement; H.6 cites these nodes. H.3 has no node yet for the invariant distance and the distance-decreasing property of horizontal maps, which are requested. CR.5 owns log structures, universal log differentials and log complexes; its current semistable chart is algebraic over a DVR, so an analytic specialization is requested rather than assumed. C0, C3 and C5 own analytic carriers, proper comparison and the derived/nearby-cycle engine. LPV.1 owns the linear algebra of one nilpotent operator: the finite logarithm, the monodromy filtration centered at an integer, uniqueness of relative filtrations, the tensor formula, primitive decomposition and maximal unipotence are existing nodes that H.6 cites; distributive families of filtrations, exterior powers and naturality of the logarithm are requested from it. AA.3 owns Siegel sets and rational reduction theory. H.7 owns the named sectors, comparison monomials, rough functions, Gram-entry applications, definability and global finite containment. No H.7 declaration occurs in the H.6 prerequisite graph.

The Mathlib finite nilpotent exponential is already available: `IsNilpotent.exp` and its finite-sum and commuting-addition theorems are read at the pin and imported. Analytic corrections use the existing algebra exponential and matrix exponential laws. The finite exponential has nilpotent hypotheses, and negative first-Hodge-degree elements are nilpotent on the finite Hodge grading. The analytic chart and its dependence on parameters still use the analytic exponential interface. Its comparison with the finite exponential belongs to the generic supplier API.

### Conventions and the consumer contract

A coordinate q on a punctured disc has positive-loop covering q=exp(2πiz), z=x+iy. After a coordinate power cover, let L=log T be the finite rational logarithm of the unipotent monodromy. In the logarithmic connection convention ∇=d+A dq/q, the residue is A and **L=−2πiA**. Thus the orbit exponential is exp(zL), whereas geometric residue monodromy is exp(−2πiA). These symbols are kept distinct even where Qian or Schmid uses the letter N with another normalization. Under q=t^e, both the logarithm and unipotent residue multiply by e. A raw ramified pullback can have singular total space; a new semistable geometric comparison requires a model and its comparison theorem.

The variation has pure weight k. The centered monodromy filtration W(L) is indexed about zero; the actual mixed weight is W_lim,m=W(L)_{m−k}. For the ordered initial faces write W^j=W(L_1+⋯+L_j). A simultaneous component is indexed by its Hodge index p and its centered multiweight σ. Bakker–Klingler–Tsimerman index by (p,q_1,…,q_n) and print W(M_j)_s as the sum of the pieces with p+q_j≤s for the filtration centered at zero, so in their labelling as printed σ_j=p+q_j; with Deligne types for the actual weights it would be σ_j=p+q_j−k. The two-sided **squared** norm comparison uses

$$m_σ(y)=(y_1/y_2)^{σ_1}\cdots(y_{n-1}/y_n)^{σ_{n-1}}y_n^{σ_n}.$$

The ordinary norm has half these powers. Kashiwara orders terminal subsets; reversing the coordinate order gives this initial-face convention. There is a complex splitting refining F∞ and all W^j, and a separate rational splitting refining only the W^j. Neither is canonical, and the complex one need not be rational. The estimate must hold for every compatible splitting, with constants depending on that splitting, rather than only for a selected rational one.

The Hodge form is the native conjugate-first form h_N(u,v)=Q(C(conjugate u),v). BKT writes its conjugate h_B(u,v)=Q(Cu,conjugate v). The native equality `Polarization.hodgeForm_eq_conj` identifies these conventions; their diagonal values and Hermitian Gram determinants agree. A squared norm therefore means the positive real diagonal of the native form. All-vector summed inequalities include u=0; homogeneous nonvanishing or roughly-monomial conclusions require u≠0. Exterior-power estimates also exclude zero wedges from nonvanishing statements.

Local analytic claims use two radii: an outer domain on which the maps are holomorphic and an inner compact buffer for restricted-analytic consumers. They also retain finite angular representatives covering the seams of the integer-translation quotient. The depth threshold in the perturbation lower bound is genuine. For n≥2, the region with one logarithmic coordinate bounded and another tending to infinity is not a compact remainder. Positive-height extension of the one-variable containment is instead proved on a bounded-height rectangle inside the outer buffer.

Nondegenerating coordinates w range in a compact subset of an inner chart. Uniform norm constants require a common orbit-entry depth, constant dimensions of the limiting Hodge/face-weight intersections and bounded compatible splitting transitions. Kashiwara's compact-family theorem has the rank hypothesis that dim(F^p∩W(J)_ℓ) is constant on the family for every subset J of the generators. The commuting boundary factor in the fixed negative-Lie chart preserves all face weights and transports the limiting Hodge flag, proving the local constant-rank assertion. The simultaneous-splittings theorem transports the complex splitting and uses a finite cover to make compact-parameter bounds uniform. Gap G4 records the missing native bundle/metric interface for this proved adapter, rather than requesting a second degeneration theorem from H.2.

There are two chart representations of the negative-Lie correction. At a fixed limiting flag F₀ choose the negative first-Hodge-degree complement q₋. Its joint holomorphic coefficient v̂(q,w) can have nonzero boundary value v₀(w). Horizontality forces exp(v₀(w)) to commute with the monodromy logarithms, so it can be factored out. The resulting centered correction is identity at q=0 and acts on the varying F∞(w). This avoids falsely treating the varying native Deligne complement as holomorphic in w, or claiming that the fixed-chart coefficient vanishes along the whole parameter stratum. The prototypes describe a fixed parameter or this centered representation; the packet records the joint-chart factorization explicitly.

### Reading the declaration graph

The namespace of every declaration below is `TauCeti.Hodge.Degeneration`. Names in API and test lists are names of mathematical declarations, not implementation claims. A local dependency is written by its H.6 node suffix. Cross-roadmap dependencies use their precise node id when one exists, otherwise the requested stage. Proof outlines remain at target level: named key ingredients are dependencies, and routine chart calculations stay in the proof outline.

## Geometric logarithmic specialization

### SemistableLogModel — Proper semistable analytic log model

Node `HodgeStructuresPartII:H.6/semistable-log-model` (definition). A proper holomorphic f:X→Δ_ρ with X smooth, reduced simple-normal-crossing fibre X_0, smooth restriction over Δ_ρ* and, at each point of X_0, analytic coordinates in which f=x_1⋯x_r (1≤r≤d). Equip X and Δ_ρ with their divisor log structures, imported from CR.5, and the central fibre with the induced log structure over the log point 1↦0. The radius ρ is chosen so the disc contains no other singular fibres. This is the geometric Hodge adapter, not a new definition of log structures or arbitrary log-smooth morphisms.

Proof outline. Use the analytic chart and divisor-log suppliers to identify the chart map ℕ→ℕ^r as the diagonal generator. Check f is proper over the chosen disc and smooth away from zero before applying any proper comparison.

Direct inputs: `ComplexComparisonPartII:C0`, `CrystallineCohomology:CR.5/semistable-log-forms`, `CrystallineCohomology:CR.5/log-differentials`.

Uses that the interface serves: Qian Lemma4.3 pp.22–23 (provides the proper central-fibre comparison and the wedge triangle); H.6 log-cohomology-basechange (excludes other singular fibres and supplies reduced semistable charts).

| Declaration | Role | Required behavior |
|---|---|---|
| `SemistableLogModel.localMap` | projection | In a chart with r divisor coordinates, the base coordinate is their product. |
| `SemistableLogModel.localMap_equation` | characterisation | The chart identifies f with x_1⋯x_r, including the unused smooth coordinates. |
| `SemistableLogModel.ext` | extensionality | Equality of the family map, radius and chosen chart data identifies marked models; this is not an equality of all presentations of an unmarked family. |
| `SemistableLogModel.restrict` | constructor | Restriction to 0<ρ′≤ρ retains the induced charts and is proper by base change. |
| `SemistableLogModel.restrict_comp` | functoriality | Nested disc restrictions compose and their log structures are the pulled-back divisor structures. |

Unit tests:

- `SemistableLogModel_test_smooth` (computation): For r=1 and d=2 the local map sends (a,b) to a.
- `SemistableLogModel_test_node` (computation): For r=d=2 the local map sends (a,b) to ab.
- `SemistableLogModel_test_not_sum` (non-example): For r=d=2 the local map at (1,1) is 1, not the additive value 2.

Acceptance: The r=1 local chart is a smooth projection; r=2 is xy. A nonreduced x^2 central fibre does not satisfy this reduced semistable definition.

Sources: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23: The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus. Illusie, Exposé I §2.2.1–2.2.4, pp.18–21: The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue.

### relativeLogForms — Analytic relative log-form specialization

Node `HodgeStructuresPartII:H.6/relative-log-forms` (comparison). For a semistable log model, relative log one-forms in the above chart are (⊕_{i≤r}O·dlog x_i ⊕ ⊕_{j>r}O·dx_j)/O·Σ_{i≤r}dlog x_i, with dx_i=x_i dlog x_i. This is locally free of rank d−1. Its exterior powers and differential form DR_log(X/Δ), and derived fibre at 0 identifies with DR_log(X_0/log-point). Absolute log forms have the additional base generator dlog T. Analytic sheafification and pullback compatibility are required extensions of the algebraic CR.5 chart, not inferred from an algebraic-DVR theorem.

Proof outline. Transport the universal log differential relation through the requested analytic chart comparison. Use exterior powers of the locally free quotient to identify each fibre complex and its differential.

Direct inputs: `semistable-log-model`, `CrystallineCohomology:CR.5/semistable-log-forms`, `CrystallineCohomology:CR.5/log-de-rham`, `ComplexComparisonPartII:C0`.

Acceptance: For xy=T the relative relation is dlog x+dlog y=0 even on the singular fibre. Ordinary Kähler differentials cannot replace the log complex at T=0.

Sources: Illusie, Exposé I §2.2.1–2.2.4, pp.18–21: The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue. Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23: The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus.

### wedgeDlogTriangle — Wedge-dlog distinguished triangle

Node `HodgeStructuresPartII:H.6/wedge-triangle` (theorem). For a reduced semistable log model the exact sequence of complexes 0→DR_rel[−1]→DR_abs→DR_rel→0 has first arrow wedge with dlog T, with the shift differential and connecting-map sign fixed accordingly. Its derived pushforward is a distinguished triangle. After fibre specialization at T=0 the corresponding first arrow is wedge with the base log generator dlog 1, which is not zero merely because the underlying base function vanishes.

Proof outline. Split absolute log forms locally into a relative lift and dlog T wedged with a relative lift; verify the shifted differential sign. Glue the exact sequence; apply the derived pushforward and fibre-base-change suppliers.

Direct inputs: `relative-log-forms`, `ComplexComparisonPartII:C5`.

Acceptance: The connecting map has the sign giving positive monodromy exp(−2πiA). Setting dlog 1 to zero would destroy the special-fibre residue and is rejected.

Sources: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23: The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus. Illusie, Exposé I §2.2.1–2.2.4, pp.18–21: The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue.

### logCohomologyBaseChange — Proper log-de Rham cohomology and base change

Node `HodgeStructuresPartII:H.6/log-cohomology-basechange` (theorem). For each degree m of a proper reduced semistable analytic log model, E^m=R^m f_*DR_rel is locally free of finite rank on the disc. Its derived pullback to every point s agrees with log de Rham hypercohomology of the corresponding log fibre; at s≠0 this is ordinary de Rham cohomology, and at 0 it is the special log-point cohomology. Formation and the comparison maps are natural for morphisms of marked families. This is a cohomology theorem, not a claim that every individual log-form pushforward is locally free.

Proof outline. By relative-log-forms the terms of DR_rel are locally free and flat over the disc, so its fibre at 0, taken termwise, is the special log complex DR_log(X_0/log-point). Steenbrink's comparison on the special fibre, in the form of Illusie §2.2.4: after choosing a logarithm of the base coordinate on the universal cover of the punctured disc, the complex of sections of the absolute log complex that are polynomial in that logarithm maps quasi-isomorphically to the nearby-cycle complex of ℂ (by Deligne's logarithmic comparison, H.2/log-comparison) and, by taking the constant term, to the special log complex. Hence H^m(X_0, DR_log(X_0/log-point)) is the cohomology of the nearby cycles. Since f is proper, nearby-cycle cohomology of X_0 is the cohomology of a fibre X_s with s≠0 (requested from C5); so the fibre complexes have hypercohomology of the same dimension at every point of the disc. The differential of DR_rel is linear over functions on the disc, so Grauert's direct-image and base-change theorems for a bounded complex of coherent sheaves flat over the base (requested from C0 and C3 in this analytic relative form) give coherence of E^m; constant fibre dimension then gives local freeness and compatibility with base change.

Direct inputs: `relative-log-forms`, `ComplexComparisonPartII:C5`, `ComplexComparisonPartII:C3`, `HodgeStructuresPartII:H.2/log-comparison`, `ComplexComparisonPartII:C0`.

Acceptance: The central cohomology dimension equals the dimension of a nearby smooth fibre. A proper family with an additional singular fibre inside the disc fails the input hypotheses.

Sources: Illusie, Exposé I, Théorème 2.2.2(a), p.19; §2.2.4, pp.20–21: States local freeness of the direct images of the relative log complex of a proper family with normal-crossing special fibre, with formation compatible with every base change, and derives it from Steenbrink's identification of the special log complex with nearby cycles. Qian, §4, display (4.1), p.22: Uses exactly this local freeness and the fibre identification at 0 for the analytic family.

### logGaussManin — Semistable logarithmic Gauss–Manin connection

Node `HodgeStructuresPartII:H.6/log-gauss-manin` (construction). On E^m from log-cohomology-basechange, the connecting map of the wedge triangle is the logarithmic Gauss–Manin connection ∇:E^m→E^m⊗Ω^1_Δ(log0). In a local logarithmic frame write ∇v=dv+A(T)v dT/T, with A holomorphic. The special residue is A(0). This geometric realization specializes the connection/canonical-extension API of H.2; it does not construct a second general Gauss–Manin or canonical-extension theory.

Proof outline. Take the connecting morphism together with the absolute/relative differential compatibility that gives Leibniz. Use the H.2 connection carrier and verify restriction over the smooth locus is its Gauss–Manin connection. Record the residue by reduction of the logarithmic coefficient at zero.

Direct inputs: `wedge-triangle`, `log-cohomology-basechange`, `HodgeStructuresPartII:H.2/gauss-manin`, `HodgeStructuresPartII:H.2/canonical-extension`.

Uses that the interface serves: Qian Lemma4.3 pp.22–23 (identifies the logarithmic residue with the special log-point boundary); H.2 residue-monodromy (pins the sign and normalization for the geometric canonical extension).

| Declaration | Role | Required behavior |
|---|---|---|
| `logGaussManin.apply` | simp | In one logarithmic frame, the coefficient at q≠0 is dv+q^{-1}Av. |
| `logGaussManin.add` | structure | Connection evaluation is additive in the section and its derivative. |
| `logGaussManin.leibniz` | relation | For scalar f, ∇(fv)=df·v+f∇v; this is not O-linear in sections. |
| `logGaussManin.residue` | projection | At T=0, taking the logarithmic coefficient gives A(0), compatible with the special boundary operator. |
| `logGaussManin.horizontalMap` | functoriality | A family morphism induces a map commuting with ∇ and residues, and identity/composite morphisms give identity/composite maps. |
| `logGaussManin.ramified` | compatibility | For T=t^e, pullback coefficient is eA(t^e); the unipotent canonical extension needs no strip shift. |

Unit tests:

- `logGaussManin_test_zero` (degenerate): For zero residue, evaluation is dv.
- `logGaussManin_test_jordan` (computation): For A=[[0,1],[0,0]], q=2, v=(0,1), dv=0, evaluation is (1/2,0).
- `logGaussManin_test_leibniz` (non-example): For A=0 and v=(1), a nonconstant scalar section f=T has connection coefficient 1, not 0.

Acceptance: In a constant frame with A=0, ∇=d. The sign of a horizontal solution is exp(−A log T), not exp(A log T).

Sources: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23: The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus. Illusie, Exposé I §2.2.1–2.2.4, pp.18–21: The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue.

### specialResidue — Residue equals special log-point boundary

Node `HodgeStructuresPartII:H.6/special-residue` (comparison). Under E^m|_0≃H^m(DR_log(X_0/log-point)), Res_0∇ is conjugate to the connecting endomorphism A_0 from the dlog 1 triangle on the special log fibre. The comparison is a commutative square of marked endomorphisms, not an unmarked equality between distinct cohomology models. A_0 is nilpotent for a reduced semistable family.

Proof outline. Specialize the whole wedge triangle to the fibre at 0 by proper derived base change, keeping the first arrow; this identifies Res_0∇ with the connecting endomorphism A_0 (Qian Lemma 4.3). By Illusie Théorème 2.2.2(b) the eigenvalues of the residue are rational and lie in [0,1). By the local computation of Illusie §2.1.3, reduced multiplicities make the monodromy act trivially on each nearby-cycle cohomology sheaf, and the monodromy-equivariant spectral sequence (2.1.3.1) of the proper map then makes the monodromy on the cohomology of a nearby fibre unipotent. Since that monodromy is conjugate to exp(−2πiA_0) (semistable comparison, Illusie Corollaire 2.2.3), every eigenvalue of A_0 is an integer in [0,1), so A_0 is nilpotent.

Direct inputs: `log-gauss-manin`, `log-cohomology-basechange`, `wedge-triangle`, `HodgeStructuresPartII:H.2/residue-monodromy`, `ComplexComparisonPartII:C5`.

Acceptance: Any finite family action commutes with this square. The special residue is not the unscaled positive-loop logarithm.

Sources: Qian, §4, Lemma 4.3 and proof, pp.22–23: Proves that the fibre identification at 0 carries the residue of the logarithmic Gauss–Manin connection to the connecting map of the special wedge triangle. Illusie, Exposé I, Théorème 2.2.2(b) and Corollaire 2.2.3, p.19: The residue has rational eigenvalues in [0,1) and the monodromy is the exponential of −2πi times it. Illusie, Exposé I §2.1.3, (2.1.3.1)–(2.1.3.2), pp.14–15: Local computation of the monodromy on nearby cycles for a normal-crossing fibre and the spectral sequence giving unipotence on cohomology when all multiplicities are one.

### semistableBetti — Nearby-cycle Betti and log de Rham comparison

Node `HodgeStructuresPartII:H.6/semistable-betti` (comparison). After choosing a positive loop, basepoint s≠0 and compatible de Rham/nearby-cycle identifications, the monodromy T_s on H^m(X_s,ℂ) is conjugate to exp(−2πi A_0) on special log cohomology. Equivalently L_s=log T_s corresponds to −2πi A_0 in the unipotent case. The comparison is natural in families but depends on the marking; no canonical equality of the two unmarked vector spaces is asserted.

Proof outline. Use the special log-complex/nearby-cycle comparison requested from C5; Illusie §2.2.4 models it with a log-coordinate complex on the universal cover. Identify the derivative in that coordinate with the residue; exponentiate for the chosen positive loop using the H.2 sign convention.

Direct inputs: `special-residue`, `HodgeStructuresPartII:H.2/log-comparison`, `HodgeStructuresPartII:H.2/residue-monodromy`, `ComplexComparisonPartII:C5`, `mathlib:IsNilpotent.exp_eq_sum`.

Acceptance: For A_0=0 the loop acts trivially. For A_0²=0, monodromy is 1−2πi A_0, exhibiting the sign and factor.

Sources: Illusie, Exposé I §2.2.1–2.2.4, pp.18–21: The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue. Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23: The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus.

### equivariantLogComparison — Finite actions and character summands

Node `HodgeStructuresPartII:H.6/equivariant-comparison` (comparison). If a finite group H acts on the marked semistable family over the log disc, its induced actions commute with the wedge triangle, log Gauss–Manin connection, fibre comparison, residue and Betti monodromy comparison. Over a characteristic-zero splitting field, each character idempotent e_χ=|H|^{-1}Σ_hχ(h)^{-1}h commutes with these maps; all comparisons restrict to its image. A one-dimensional character summand is not a claim that every irreducible representation of a nonabelian H is a character.

Proof outline. Functoriality of log forms, derived pushforward and connecting morphisms makes every family automorphism equivariant. Each comparison commutes with every group action; take the finite scalar-weighted average defining e_χ. Finite-sum reindexing by the group law gives e_χ²=e_χ, so all comparison squares restrict to its image over the stated coefficient field.

Direct inputs: `semistable-betti`, `special-residue`.

Acceptance: For H={1}, the restricted comparison is the original comparison. Dividing by |H| is unavailable in characteristics dividing |H|.

Sources: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23: The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus.

### ramifiedResidue — Ramified residue and maximal nilpotence

Node `HodgeStructuresPartII:H.6/ramified-residue` (comparison). For T=t^e with e a positive integer, punctured-disc monodromy is T_old^e and the unipotent logarithm is eL_old. On the pulled-back unipotent canonical extension the residue is eA_old. After any required semistable modification, the special geometric residue comparison realizes this same operator. Multiplying a nilpotent by the nonzero characteristic-zero scalar e preserves its nilpotency index and Jordan block sizes; hence maximal unipotence/nilpotence on a character part is preserved. The raw ramified pullback of a smooth total space is not asserted smooth.

Proof outline. The positive generator under an e-fold punctured-disc cover winds e times. Use H.2 pullback and residue normalization, and the finite logarithm of LPV.1; a nonzero rational multiple eN has X^n as minimal polynomial exactly when N has, so the Jordan type and maximal nilpotence (LPV.1/maximal-unipotence) are unchanged. If using geometric special-fibre cohomology again, choose a semistable model and the requested birational comparison instead of applying the chart theorem to a singular raw pullback.

Direct inputs: `equivariant-comparison`, `HodgeStructuresPartII:H.2/residue-monodromy`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `LefschetzPencilsAndVanishingCycles:LPV.1/maximal-unipotence`, `ComplexComparisonPartII:C3`.

Acceptance: For a rank-two Jordan block and e=2 the off-diagonal logarithm doubles and still has index two. For e=0 or coefficients of characteristic dividing e the preservation statement is excluded.

Sources: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23: The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus. Illusie, Exposé I §2.2.1–2.2.4, pp.18–21: The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue.

## Normalized period degeneration

### quasiUnipotentMonodromy — Quasi-unipotence of polarized integral variation

Node `HodgeStructuresPartII:H.6/quasi-unipotence` (theorem). For a finite-rank polarized integral variation of pure Hodge structures on (Δ*)^n×Δ^m, with holomorphic horizontal period lift and the fixed lattice polarization, every coordinate local monodromy T_i is quasi-unipotent. In particular some positive power is unipotent. The integral lattice, polarization and horizontality are genuine hypotheses; arbitrary rational local systems are not covered.

Proof outline. Restrict to each coordinate punctured disc while fixing the other coordinates, and lift the period map to the upper half-plane; the lift Φ satisfies Φ(z+1)=T·Φ(z) with T in the integral isometry group (H.3/monodromy-descent). Borel's argument (Schmid Lemma 4.5): horizontal holomorphic maps do not increase a suitably normalized invariant distance on D (requested from H.3), and i·n and i·n+1 are at Poincaré distance 1/n; so the conjugates g_n^{-1}Tg_n accumulate in the compact isotropy group and every eigenvalue of T has absolute value one. T preserves a lattice, so its eigenvalues are algebraic integers and all their conjugates are again eigenvalues; Kronecker's theorem (Mathlib) makes them roots of unity.

Direct inputs: `ShimuraData:D3/polarized-integral-variation`, `HodgeStructuresPartII:H.3/period-map-holomorphic`, `HodgeStructuresPartII:H.3/monodromy-descent`, `HodgeStructuresPartII:H.3`, `tauceti:TauCeti.Hodge.PeriodDomain.Point`, `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one`.

Acceptance: A constant polarized variation has identity monodromy. An arbitrary rational matrix with a non-root-of-unity eigenvalue is not a valid example of this theorem.

Sources: Schmid, Lemma4.5 and its proof p.230: Borel’s argument uses horizontal contraction and the integral isometry group to force roots of unity. BKT, §4.2 p.928: The local power-cover step invokes quasi-unipotence of the integral polarized variation.

### unipotentNormalization — Coordinate power-cover normalization

Node `HodgeStructuresPartII:H.6/unipotent-normalization` (theorem). Choose positive integers e_i clearing the orders of the semisimple parts of the commuting T_i. The finite coordinate cover q_i=t_i^{e_i} is étale off the SNC boundary; its pulled-back variation has commuting unipotent monodromies T_i^{e_i}. Their finite rational logarithms L_i=log(T_i^{e_i}) commute, are nilpotent and are infinitesimal isometries of Q. They satisfy exp L_i=T_i^{e_i}. Basepoints and markings are fixed throughout. This imports the general finite logarithm and isometry Lie-algebra calculations rather than replanning them.

Proof outline. Choose a common order for each coordinate’s finitely many eigenvalues. Apply the generic supplier’s rational finite logarithm and commuting functional calculus; differentiate the isometry identity to obtain L_i in Lie G.

Direct inputs: `quasi-unipotence`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `mathlib:IsNilpotent.exp`, `mathlib:IsNilpotent.exp_add_of_commute`, `HodgeStructuresPartII:H.3/monodromy-descent`.

Acceptance: A finite-order local monodromy becomes identity on the selected cover. The normalization is not a global finite étale cover across the ramified boundary.

Sources: Schmid, (4.6),(4.7),(4.12), pp.230–233: The finite cover makes the logarithms commuting unipotent operators. BKT, §4.2 p.928: Unipotent coordinate normalization precedes all local estimates.

### NilpotentOrbit — Polarized multivariable nilpotent orbit

Node `HodgeStructuresPartII:H.6/nilpotent-orbit` (definition). Fix a real vector space V_ℝ with a lattice (so a rational structure V_ℚ), a weight k, a polarization form Q, a Hodge type and its compact dual Dcheck from H.3, with D⊂Dcheck the period domain. A polarized n-variable nilpotent orbit consists of commuting nilpotent Q-infinitesimal isometries L_1,…,L_n of V_ℝ and a flag F∞∈Dcheck with L_iF∞^p⊂F∞^{p−1} for all i and p, such that Θ(z)=exp(Σ_i z_iL_i)F∞ belongs to D whenever Im z_i>Y for all i, for some Y. Positivity is eventual, not required of F∞ itself. The orbit is rational when every L_i preserves V_ℚ; monodromy logarithms are rational. The cone and limiting-structure theorems hold for real generators; rationality is used for the rational weight splitting and the arithmetic statements. The orbit is marked, and the bound Y and the period domain are explicit in its membership API.

Proof outline. Use the compact-dual flag carrier and finite nilpotent exponential from the suppliers. Eventual positivity is an additional geometric condition; commuting nilpotence alone does not imply it.

Direct inputs: `unipotent-normalization`, `HodgeStructuresPartII:H.3/polarized-compact-dual`, `tauceti:TauCeti.Hodge.PeriodDomain.Point`, `mathlib:IsNilpotent.exp_add_of_commute`, `HodgeStructuresPartII:H.3/ambient-domain-open`, `tauceti:TauCeti.Hodge.HodgeStructureOn`.

Uses that the interface serves: CK Theorem3.3 pp.113–114 (cone weights and polarized limiting MHS); H.7 sector-lift-definable and curvewise-reducedness (provides the boundary principal term without importing definability into H.6); H.6 limiting-mhs, sl2-orbit-theorem and power-curve-normalization (restrict to a ray of the cone to obtain a one-variable orbit); Cattani–Kaplan, proof of Theorem 3.3, p.113 (every face of the cone underlies a nilpotent orbit).

| Declaration | Role | Required behavior |
|---|---|---|
| `NilpotentOrbit.orbit` | data | The compact-dual-valued map is exp(Σz_iL_i) applied to F∞. |
| `NilpotentOrbit.orbit_zero` | simp | At z=0 the orbit equals F∞, without asserting this value lies in D. |
| `NilpotentOrbit.orbit_shift` | relation | Integer coordinate translation applies exp(Σa_iL_i) to the orbit. |
| `NilpotentOrbit.horizontal` | characterisation | The infinitesimal generators lower the limiting filtration by one, equivalently the exponential orbit is horizontal. |
| `NilpotentOrbit.eventual_mem` | projection | There exists a common positive depth above which the orbit belongs to D. |
| `NilpotentOrbit.reindex` | functoriality | Permuting the generators and the coordinates gives the same marked orbit after reindexing; the identity and composition permutations act accordingly. |
| `NilpotentOrbit.ext` | extensionality | For a fixed ambient domain and polarization, equality of all generators and of the limiting flag identifies orbit data. |
| `NilpotentOrbit.ray` | constructor | For positive real a_1,…,a_n, the single operator Σa_iL_i with the same flag F∞ is a one-variable nilpotent orbit, with entry depth Y/min a_i. |
| `NilpotentOrbit.face` | constructor | For a subset J of the generators and any fixed values c_i with Im c_i>Y for i∉J, the generators L_i (i∈J) with the flag exp(Σ_{i∉J}c_iL_i)F∞ form a nilpotent orbit in the variables indexed by J. |

Unit tests:

- `NilpotentOrbit_test_zero` (degenerate): With zero generators and F∈D, Θ(z)=F for every z.
- `NilpotentOrbit_test_elliptic` (computation): For L=[[0,1],[0,0]] and F^1=span(0,1), Θ(z)^1=span(z,1).
- `NilpotentOrbit_test_no_positivity` (non-example): Zero generators and F outside D cannot meet eventual domain membership.

Acceptance: Zero L_i is an orbit exactly when F∞ is in D. The elliptic orbit F^1(z)=span(z,1) enters the upper-half-plane domain for Im z>0.

Sources: Schmid, Theorem4.12 pp.232–233; proof §8 pp.277–293: The untwisted map extends holomorphically; its boundary value generates a horizontal orbit entering D sufficiently deep. CK, §3 and Theorem3.3 pp.112–114: Cone and limiting structures are attached to a polarized nilpotent orbit with these horizontality and positivity hypotheses. Kashiwara, Definition 2.3.1, p.862: Defines a nilpotent orbit by the horizontality of the generators and entry into the period domain for a translate of the open cone.

### untwistedPeriodMap — Untwisting a unipotent period lift

Node `HodgeStructuresPartII:H.6/untwisted-map` (construction). For an equivariant lifted period map Φ(z,w) with Φ(z+a,w)=exp(Σa_iL_i)Φ(z,w), define its untwisted map on the cover as exp(−Σz_iL_i)Φ(z,w). It is invariant under integer translations and therefore descends to Ψ(q,w) on the punctured polydisc, q_i=exp(2πiz_i). Descent and its marking are canonical for the chosen logarithms; holomorphic extension across the boundary is a separate theorem. The target is Dcheck, since undoing the exponential need not preserve D.

Proof outline. Define the inverse exponential action on the filtration. Use commuting exponential laws and the equivariance equation to prove integer-periodicity. Apply universal-cover descent in the imported analytic atlas, retaining nondegenerating coordinates w.

Direct inputs: `unipotent-normalization`, `HodgeStructuresPartII:H.3/polarized-compact-dual`, `ComplexComparisonPartII:C0`, `mathlib:Matrix.exp_add_of_commute`, `HodgeStructuresPartII:H.3/marked-period-map`, `HodgeStructuresPartII:H.3/monodromy-descent`, `HodgeStructuresPartII:H.3/change-marking`.

Uses that the interface serves: Schmid Theorem4.12 pp.232–233 (the descended map is the object to which removable-singularity extension applies); H.7 local-period-definability (the analytic boundary coefficient is restricted only on a smaller closed buffer).

| Declaration | Role | Required behavior |
|---|---|---|
| `untwistedPeriodMap.apply` | simp | The filtration is mapped by exp(−Σz_iL_i). |
| `untwistedPeriodMap.undo` | relation | Applying exp(Σz_iL_i) recovers Φ(z,w). |
| `untwistedPeriodMap.integer_shift` | characterisation | Under the stated equivariance and commuting hypotheses, every integer translate has the same untwisted value. |
| `untwistedPeriodMap.zero` | simp | With every L_i=0, the untwisted map equals Φ. |
| `untwistedPeriodMap.gauge` | functoriality | Changing the flat marking by a fixed rational isometry conjugates all L_i and transports Ψ by the same isometry. |
| `untwistedPeriodMap.canonicalExtension` | compatibility | The unipotent H.2 canonical-extension frame has residue −L_i/(2πi), and its Hodge flag is the descended Ψ. |

Unit tests:

- `untwistedPeriodMap_test_orbit` (computation): Untwisting exp(zL)F gives F.
- `untwistedPeriodMap_test_zero` (degenerate): With n=0, the map is Φ on the nondegenerating parameter space.
- `untwistedPeriodMap_test_sign` (non-example): For the elliptic orbit at z=i, the negative twist returns span(0,1); the positive twist would give span(2i,1).

Acceptance: For an exact nilpotent orbit the untwisted map is constant F∞. When all L_i vanish, untwisting leaves Φ unchanged.

Sources: Schmid, Theorem4.12 pp.232–233; proof §8 pp.277–293: The untwisted map extends holomorphically; its boundary value generates a horizontal orbit entering D sufficiently deep. BKT, §4.2 pp.928–929: The lifted period map factors through its untwisted holomorphic boundary map.

### untwistedExtension — Holomorphic boundary extension of the untwisted map

Node `HodgeStructuresPartII:H.6/untwisted-extension` (theorem). For the unipotent normalized integral polarized variation, Ψ extends uniquely holomorphically to the full local polydisc with target Dcheck. Its limiting value F∞(w)=Ψ(0,w) has the prescribed filtration ranks and Q-orthogonality. After shrinking in w and the degenerating coordinates, the extended flags are the Hodge subbundles of the unipotent H.2 canonical extension. For restricted-analytic consumers use a still smaller polydisc whose closure is in this holomorphic domain; finite angular charts cover the integer-translation seams.

Proof outline. Use Schmid §8 horizontal metric estimates and removable-singularity argument, with Hartogs for the higher-codimension boundary. Apply the universal subbundle API of Dcheck and identify the logarithmic frame with H.2 by its nilpotent residues and uniqueness. Choose an inner closed buffer; angular seams are handled by overlapping representatives and the already proved integer-periodicity.

Direct inputs: `untwisted-map`, `HodgeStructuresPartII:H.2/filtered-extension`, `HodgeStructuresPartII:H.2/canonical-extension-unique`, `ComplexComparisonPartII:C0`, `HodgeStructuresPartII:H.3`, `HodgeStructuresPartII:H.3/period-map-holomorphic`, `HodgeStructuresPartII:H.2`.

Acceptance: The limit need not be a pure Hodge structure in D. Restricted analyticity is asserted only on a buffered chart, never on an unbuffered open unit polydisc.

Sources: Schmid, Theorem4.12 pp.232–233; proof §8 pp.277–293: The untwisted map extends holomorphically; its boundary value generates a horizontal orbit entering D sufficiently deep.

### nilpotentOrbitTheorem — Multivariable nilpotent orbit theorem

Node `HodgeStructuresPartII:H.6/nilpotent-orbit-theorem` (theorem). The limiting flags F∞(w) of untwistedExtension give nilpotent orbits Θ(z,w)=exp(Σz_iL_i)F∞(w). On each compact nondegenerating parameter set in an inner chart there is a common depth Y with Θ∈D whenever all Im z_i>Y; the orbit is horizontal. The orbit approximates Φ in the invariant period-domain distance by a bound C(∏_i Im z_i)^β Σ_i exp(−2π Im z_i), after unipotent normalization and sufficiently deep coordinates. The bound’s polynomial factor is retained; it alone does not imply uniform closeness in a region with arbitrarily separated heights.

Proof outline. Use the full Schmid §8 extension, horizontal and metric approximation argument with its compact w-buffer. For entry into D with all heights large but arbitrarily separated, either follow Schmid's proof of (4.12), which states it, or Kashiwara §4.1: the error bound gives entry where the bound is small, the set of z with Θ(z)∈D is a tube domain that is pseudoconvex because D is pseudoconvex in horizontal directions, and a connected pseudoconvex tube is convex; its convex hull contains a region Im z_i>Y′.

Direct inputs: `untwisted-extension`, `nilpotent-orbit`, `HodgeStructuresPartII:H.3`, `HodgeStructuresPartII:H.3/ambient-domain-open`.

Acceptance: When n=1 this recovers Schmid Theorem4.9. For L_i=0, the limiting flag lies in D.

Sources: Schmid, Theorem4.12 pp.232–233; proof §8 pp.277–293: The untwisted map extends holomorphically; its boundary value generates a horizontal orbit entering D sufficiently deep. Kashiwara, §4.1 pp.870–872 and §§4.3–4.4 pp.872–875: The horizontal pseudoconvex tube argument supplies the multivariable domain-entry step and the norm comparison proof.

### finiteMonodromyExtension — Extension with finite monodromy

Node `HodgeStructuresPartII:H.6/finite-monodromy-extension` (theorem). If every coordinate monodromy of the local integral polarized variation has finite order, the normalization cover kills all L_i. Then Ψ=Φ on that cover extends into D across the SNC boundary, including partial boundary strata. The original quotient-valued period map descends continuously/holomorphically through the finite group quotient with its supplied analytic quotient structure; local liftability downstairs is not asserted at ramification points.

Proof outline. Kill the finite coordinate monodromies. Apply zero-generator D-entry at each boundary stratum and holomorphicity of the extended map; descend through the supplied finite quotient.

Direct inputs: `unipotent-normalization`, `nilpotent-orbit-theorem`, `HodgeStructuresPartII:H.3/ambient-domain-open`, `HodgeStructuresPartII:H.3/monodromy-descent`, `ComplexComparisonPartII:C0`.

Acceptance: For identity monodromy there is a holomorphic local extension into D without a cover. Finite nonidentity monodromy does not force a locally liftable extension downstairs.

Sources: Schmid, Corollary4.11 p.232 and Theorem4.12 pp.232–233: Killing finite monodromy makes the principal term a domain point; the downstairs map need not be locally liftable.

## Weights, limits and simultaneous decompositions

### sl2OrbitTheorem — One-variable SL₂-orbit theorem

Node `HodgeStructuresPartII:H.6/sl2-orbit-theorem` (theorem). Let (L,F∞) be a one-variable polarized nilpotent orbit with L≠0, with real isometry group G_ℝ of Q, complexification G_ℂ and Lie algebra g. Then there are a homomorphism of complex Lie groups ψ:SL(2,ℂ)→G_ℂ, a holomorphic horizontal embedding ψ̃:ℙ¹→Dcheck equivariant for ψ with ψ̃(g·i)=ψ(g)·o for a base point o∈D, and a holomorphic map g from a neighbourhood of ∞ in ℙ¹ to G_ℂ, such that: (a) exp(zL)F∞=g(−iz)ψ̃(z) near ∞; (b) ψ(SL(2,ℝ))⊂G_ℝ and ψ̃ maps the upper half-plane into D; (c) dψ is a morphism of type (0,0) for the Hodge structures on sl(2,ℂ) at i and on g at o; (d) g(y)∈G_ℝ for real y; (e) Ad g(∞)^{-1}(L) is the image under dψ of the upper triangular nilpotent matrix with entry one; (f) for h(y)=g(y)exp(−½log y·dψ(Y)), with Y the diagonal matrix with entries −1, 1 in the convention fixed by (e), h^{-1}h′ lies in the real points of g^{1,−1}⊕g^{−1,1} at o; (g) dψ(Y) acts semisimply with integral eigenvalues, and the coefficients g_n, f_n of the expansions of g(z) and g(z)^{-1} in powers of z^{-1} map the ℓ-eigenspace of dψ(Y) into the sum of the eigenspaces of eigenvalue at most ℓ+n−1. After a suitable change of the base point, g(∞)=1 and L=dψ of the nilpotent matrix, with (ad L)^{n+1}g_n=(ad L)^{n+1}f_n=0. For a rational orbit the base point can instead be chosen so that ψ is defined over ℚ and g(∞) lies in exp(Im ad L∩Ker ad L), keeping (a)–(g).

Hypotheses: A one-variable polarized nilpotent orbit with nonzero generator: exp(zL)F∞∈D for Im z>Y and L F∞^p⊂F∞^{p−1}. For the rational form: L preserves V_ℚ and Q is rational.

Proof outline. Schmid §9: lift y↦exp(iyL)F∞ to G_ℝ by the unique lift h with h^{-1}h′ in the real points of g^{1,−1}⊕g^{−1,1} at the base point; horizontality and the structure equations give a system of differential equations for the coefficients of its expansion in powers of y^{-1/2}. Solve the recursion in the finite-dimensional representation: the leading coefficients span a copy of sl(2,ℝ), which integrates to ψ, and the convergence and eigenvalue bounds of the higher coefficients are Schmid's Lemmas (9.60)–(9.65). Rational form: Kostant's theorem on sl₂-triples through a given nilpotent element over a field of characteristic zero, and conjugacy under exp(Im ad L∩Ker ad L), give a homomorphism defined over ℚ (Schmid Lemma (5.17), Corollary (5.19)).

Direct inputs: `nilpotent-orbit`, `HodgeStructuresPartII:H.3/lie-hodge-filtration`, `HodgeStructuresPartII:H.3/tangent-horizontal`, `HodgeStructuresPartII:H.3/ambient-domain-open`, `HodgeStructuresPartII:H.3`.

Acceptance: For the upper half-plane, D=G_ℝ/SO(2) with G=SL(2), L the upper triangular nilpotent matrix and F∞ the point at the origin of the affine line, ψ is the identity, ψ̃ the inclusion and g=1. For L=0 there is no such homomorphism with (e); the theorem assumes L≠0.

Sources: Schmid, Theorem (5.13), pp.239–240; Lemma (5.17) and Corollary (5.19), pp.241–242; proof §9, pp.293–314: States the existence of the homomorphism, the equivariant horizontal embedding and the correcting function with properties a)–h), and the rational choice of base point.

### limitingMixedHodgeOneVariable — Limiting mixed Hodge structure of a one-variable nilpotent orbit

Node `HodgeStructuresPartII:H.6/limiting-mhs-one-variable` (theorem). Let (L,F∞) be a one-variable polarized nilpotent orbit of weight k and W=W(L) the monodromy filtration of L centered at zero. Then F∞ induces on gr^W_r a Hodge structure of weight k+r for every r, so that (V, W_lim,m=W_{m−k}, F∞) is a mixed Hodge structure; L is a morphism of type (−1,−1); and for r≥0 the form Q(·,L^r·) polarizes the primitive part ker(L^{r+1}) of gr^W_r. For L=0 this is the statement that F∞ lies in D. H.2/limit-mhs is the formal statement for a variation assumed admissible; the present theorem is what makes a polarized pure variation with unipotent monodromy admissible.

Hypotheses: A one-variable polarized nilpotent orbit of weight k, over ℝ or ℚ.

Proof outline. For L=0 the orbit condition is F∞∈D. For L≠0 take ψ, ψ̃ and g from sl2-orbit-theorem with g(∞)=1 after changing the base point. Decompose V under ψ(SL(2)) into isotypic parts; dψ(Y) grades V and splits W, and because dψ has type (0,0) the Hodge structure at the base point is compatible with this grading, which gives the opposedness of the filtrations induced on gr^W (Schmid pp.256–263). The polarization of the primitive parts follows from the Hodge–Riemann relations at the base point and the sl₂ decomposition; the general case follows since exp(zL)F∞ and ψ̃(z) agree to first order at ∞ and induce the same filtration on gr^W.

Direct inputs: `sl2-orbit-theorem`, `nilpotent-orbit`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`, `tauceti:TauCeti.Hodge.MixedHodgeStructure`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure`, `tauceti:TauCeti.Hodge.HodgeStructureOn.piece`.

Acceptance: For the weight-one rank-two orbit with L the standard nilpotent, gr^W_{−1} and gr^W_{1} are one-dimensional of Hodge types (0,0) and (1,1). Keeping the centered index as the weight would make gr^W_r pure of weight r, which fails already for L=0 and k≠0.

Sources: Schmid, Theorem (6.16), p.255; proof pp.256–263: Proves from the SL₂-orbit theorem that the shifted monodromy weight filtration and the limiting filtration form a mixed Hodge structure with polarized primitive parts. Kashiwara, Theorem 2.3.2, p.862: Restates the theorem for a nilpotent orbit, with the graded piece of centered index r opposed in weight k+r.

### nilpotentConeWeights — Constancy and relative faces of cone weights

Node `HodgeStructuresPartII:H.6/cone-weights` (theorem). For a polarized nilpotent orbit and any nonempty subset J of its generators, the centered monodromy filtration W(L) of L=Σ_{i∈J}a_iL_i with every a_i>0 does not depend on the coefficients; denote it W(J). It is centered at zero, is defined over the field of definition of the generators, and is characterized by L W_ℓ⊂W_{ℓ−2} and L^r:gr^W_r≃gr^W_{−r}. Relative faces: for subsets J⊂J′ and N=Σ_{i∈J′}a_iL_i with a_i>0 for i∈J′∖J and a_i≥0 for i∈J, the filtration W(J′) is the monodromy weight filtration of N relative to W(J), that is, N W(J′)_ℓ⊂W(J′)_{ℓ−2} and N^r induces isomorphisms gr^{W(J′)}_{m+r}gr^{W(J)}_m≃gr^{W(J′)}_{m−r}gr^{W(J)}_m for all m and all r≥0. In particular W(L_1+⋯+L_j) is the weight filtration of L_j relative to W(L_1+⋯+L_{j−1}). For J=∅ put W(∅)_ℓ=0 for ℓ<0 and W(∅)_ℓ=V for ℓ≥0. Existence, uniqueness and scaling of the monodromy filtration of one nilpotent operator and uniqueness of a relative filtration are imported from LPV.1.

Proof outline. For N, N′ in the open cone, w↦exp(wN)exp(zN′)F∞ is a one-variable nilpotent orbit for every z, so (W(N), exp(zN′)F∞) with N is a polarized mixed Hodge structure by limiting-mhs-one-variable. On each N-primitive part of gr^{W(N)}, z↦exp(zN′)F∞ is then a horizontal holomorphic map of ℂ into a classifying space of polarized Hodge structures; such a map is constant (negative curvature in horizontal directions, requested from H.3), so N′ acts as zero on gr^{W(N)}: N′W_ℓ(N)⊂W_{ℓ−1}(N) (Cattani–Kaplan (3.4)). With the real-splitting results of Cattani–Kaplan §2 ((2.16)–(2.21)) this gives an open dense subcone on which W(N) is constant and a real-split flag F_0; for T in the closure, w↦exp(wT)exp(zN)F_0 is a nilpotent orbit, T is a (−1,−1)-morphism of (W, F_0), and the characterization (2.17) gives W(T)=W for every T in the open cone. Apply the same argument to every face, which also underlies a nilpotent orbit (NilpotentOrbit.face). For the relative statement, project to gr^{W(J)}_{k+ℓ}: the projections of W(J′), F_0 and N form a split polarized mixed Hodge structure, and the uniqueness of the relative filtration (LPV.1) identifies it with W(J′). Generators in J act as zero on gr^{W(J)}, which gives the stated range of coefficients.

Direct inputs: `nilpotent-orbit`, `limiting-mhs-one-variable`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness`, `HodgeStructuresPartII:H.3`.

Acceptance: Multiplying a nonzero generator by a positive scalar leaves W unchanged. The vertex L=0 can have a different filtration from the open cone; coefficients equal to zero are treated as faces. For V=V_1⊗V_2 with V_i of dimension two and L_i the standard nilpotent on the i-th factor, W(L_1) and W(L_2) have graded pieces of dimension 2 in degrees −1 and 1, W(L_1+L_2) has dimensions 1, 2, 1 in degrees −2, 0, 2, and W(L_1+L_2) is the weight filtration of L_1 relative to W(L_2); W(L_1) is not.

Sources: CK, Theorem (3.3) and proof, pp.113–114; (3.4)–(3.7); §2, (2.16)–(2.21), pp.109–112: Attaches a filtration to every face of the cone, equal to the weight filtration of each element of the open face, and identifies the filtration of a face as a relative weight filtration with respect to that of a face in its closure. Part (ii) is used in the form its proof establishes; see source issue E-H6-5. Kashiwara, Theorem 2.3.4, p.863: Restates the cone-independence for every subset of the generators and the existence of a commuting element making the limit real-split.

### limitingMixedHodge — Polarized limiting mixed Hodge structure

Node `HodgeStructuresPartII:H.6/limiting-mhs` (theorem). For a weight-k polarized nilpotent orbit and L in the full open cone, set W_lim,m=W(full)_{m−k}. Then (V,W_lim,F∞) is a mixed Hodge structure, over the field of definition of the generators and native rational when the orbit is rational; it does not depend on the positive coefficients. Every L in the closed cone is a (−1,−1)-morphism, and for L in the open cone the L-primitive part of gr^{W_lim}_{k+r} is polarized by Q(·,L^r·), with the sign convention of the weight-k polarization. The graded piece gr^{W_lim}_{k+r} is pure of weight k+r, not of the centered index r. The one-variable case is limiting-mhs-one-variable; this node adds the independence of the ray and the statement for all cone elements.

Proof outline. Restrict the orbit to a ray of the open cone (NilpotentOrbit.ray) and apply limiting-mhs-one-variable; transport the centered filtration by the weight-k shift (the monodromy filtration centered at k of LPV.1). Use cone-weights to identify the filtration for different rays, so the mixed Hodge structure and the primitive polarizations are defined for every L in the open cone. The operators L with L W_ℓ⊂W_{ℓ−2} form a linear subspace containing the open cone, hence every generator; with L F∞^p⊂F∞^{p−1} this makes each element of the closed cone a (−1,−1)-morphism.

Direct inputs: `cone-weights`, `limiting-mhs-one-variable`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`, `tauceti:TauCeti.Hodge.MixedHodgeStructure`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure`.

Acceptance: With all L_i=0 the result is the original pure weight-k structure. A Tate twist shifts the actual graded weights by twice the twist while centered norm indices remain unchanged.

Sources: Schmid, Theorem (6.16), p.255; proof pp.256–263: The monodromy weight filtration, shifted to the weight of the variation, and the limiting filtration form a mixed Hodge structure for which the logarithm has type (−1,−1) and whose primitive graded parts are polarized. CK, §3, (3.2) and Theorem (3.3), pp.112–114: Every element of the open cone gives a polarized mixed Hodge structure with the same limiting filtration, and the weight filtration is the same throughout the cone. Kashiwara, Theorem 2.3.2, p.862: States the one-variable result with the weight shift: the graded piece of centered index r is opposed in weight k+r, and Q(·,N^r·) polarizes the primitive part.

### logarithmsTypeMinusOne — All logarithms lower the limiting MHS by (−1,−1)

Node `HodgeStructuresPartII:H.6/logarithms-type` (theorem). For the full-cone limiting mixed Hodge structure, each individual logarithm L_i maps the Deligne piece I^{p,q} into I^{p−1,q−1} and lowers W_lim by two. Consequently L_i has bidegree (−1,−1) for the bigrading of End(V_ℂ) by shifts of the Deligne bigrading, g^{a,b}={X | X I^{p,q}⊂I^{p+a,q+b} for all p,q}. Every endomorphism commuting with a partial sum L_1+⋯+L_j preserves W({1,…,j}), by uniqueness of the monodromy filtration; this includes the correction coefficients of horizontal-correction.

Proof outline. By limiting-mhs each L_i is a (−1,−1)-morphism: L_iF∞^p⊂F∞^{p−1} and L_iW_lim,m⊂W_lim,m−2. Re-index the target: (V, W′_m=W_lim,m+2, F′^p=F∞^{p+1}) is again a mixed Hodge structure, with Deligne pieces I′^{p,q}=I^{p+1,q+1}, and L_i is a morphism from the limiting structure to it. Functoriality of the Deligne bigrading at the pin (MixedHodgeStructure.Hom.map_deligneSplitting_le) gives L_iI^{p,q}⊂I^{p−1,q−1}. The pin has no Tate twist of a mixed structure, so the re-indexing is part of this node. If X commutes with N, then X·W(N) satisfies the characterization of the monodromy filtration of N when X is invertible, and in general 1+tX is invertible for small t; uniqueness (LPV.1/monodromy-filtration) gives X W(N)_ℓ⊂W(N)_ℓ.

Direct inputs: `limiting-mhs`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.deligneSplitting`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.map_deligneSplitting_le`.

Acceptance: The degree lowers actual weight by two, independent of the pure weight k. Commuting with only an unrelated generator does not imply preserving every face filtration.

Sources: CK, Theorem3.3 pp.113–114 and real-splitting argument §2.20 pp.111–112: Each cone generator is a mixed-Hodge morphism of degree (−1,−1). BKT, §4.4 pp.930–932, Lemma4.10 and proof: A negative-Lie lift and its triangular horizontal correction yield exponential decay on ordered sectors; normalization and lower-bound depth are retained explicitly.

### hodgeWeightDistributive — Distributivity of the limiting Hodge and weight filtrations

Node `HodgeStructuresPartII:H.6/distributive-family` (theorem). Fix an ordering and W^j=W({1,…,j}), each centered at zero. The finite families of filtration subspaces generated by F∞ and W^1_ℂ,…,W^n_ℂ are distributive under sum and intersection. The rational weight family alone is distributive over ℚ. Distributivity is a property of the subspace lattice generated by all steps, not merely pairwise compatibility (any two finite flags can split).

Proof outline. Use CK’s real-splitting transform commuting with all generators, so it preserves every W^j. On the real-split limit use the two grading operators and inductively split the remaining face filtrations in their simultaneous eigenspaces. Transport back the family and use rationality for the weight-only family.

Direct inputs: `cone-weights`, `logarithms-type`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Acceptance: Three distinct lines in a two-dimensional space give a nondistributive family and cannot be substituted for this theorem. Reversing the order recovers Kashiwara’s terminal-subset convention.

Sources: Kashiwara, Lemma2.4.1 pp.863–864, proof; §§1.1–1.8 pp.853–860: A commuting real-splitting transform and eigenspace induction establish distributivity; the general distributive-filtration formalism is reused.

### simultaneousSplittings — Separate complex and rational simultaneous splittings

Node `HodgeStructuresPartII:H.6/simultaneous-splittings` (theorem). There exist finite internal decompositions V_ℂ=⊕_{p,σ}I^{p,σ} and V_ℚ=⊕_σJ^σ, where σ∈ℤ^n, such that F∞^r=⊕_{p≥r,σ}I^{p,σ}, W^j_ℂ,ℓ=⊕_{σ_j≤ℓ,p}I^{p,σ}, and W^j_ℚ,ℓ=⊕_{σ_j≤ℓ}J^σ. These are two distinct choices: I is not claimed rational or equal to J_ℂ, and neither is asserted canonical. Labels: Bakker–Klingler–Tsimerman index their complex splitting by (p,q_1,…,q_n) and print W(M_j)_s as the sum of the pieces with p+q_j≤s for the filtration centered at zero, so in their labelling as printed σ_j=p+q_j; if instead (p,q_j) is the Deligne type for the actual weights of the limiting structure, then σ_j=p+q_j−k. This plan always indexes by the centered σ. Smooth parameter splittings require constant ranks of all relevant intersections. Locally along a nondegenerating parameter stratum, the holomorphic boundary factor g₀(w) from negative-lie-chart commutes with every L_i. It preserves every rational-face weight filtration after complexification and transports F₀ to F∞(w). Therefore all Hodge/face-weight intersection dimensions are locally constant. Transporting a fixed complex splitting by g₀ gives holomorphic compatible splitting subbundles; the rational weight splitting stays fixed. Both g₀ and its inverse are bounded on an inner compact buffer. Finite chart coverage of compact parameters gives uniform constants.

Proof outline. Apply the imported generic splitting theorem over ℂ to the Hodge-weight family and over ℚ to the weight family. Translate actual weights to centered labels before forming monomials. For parameters use negative-lie-chart’s commuting boundary factor g₀. Generic centralizer preservation transports each face weight filtration, so g₀ identifies every F₀/weight intersection with the corresponding F∞(w) intersection. Transport the complex splitting by this holomorphic isomorphism and retain a fixed rational splitting; compact inner buffers bound all transitions and their inverses. A finite subcover handles compact parameter sets.

Direct inputs: `distributive-family`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `mathlib:DirectSum.IsInternal`, `negative-lie-chart`, `HodgeStructuresPartII:H.2`.

Acceptance: In pure weight k with zero monodromy all σ_j=0. A complex Hodge piece in a nontrivial Hodge structure need not be defined over ℚ.

Sources: Kashiwara, Corollary1.8.3 p.860, proof; Definition1.8.4; Lemma2.4.1 pp.863–864: Finite distributive families on semisimple vector spaces admit a simultaneous internal splitting. BKT, §4.4 p.931: Uses a Hodge-adapted complex splitting and a separate rational weight splitting. BKT, §4.4 p.931 and Lemma4.10 proof p.932, together with Schmid Theorem4.12 pp.232–233: The fixed negative-Lie chart and horizontal boundary equation imply a commuting parameter-boundary factor; its transport gives the local constant-rank parameter adapter used here.

## Horizontal correction and Hodge norm estimates

### negativeLieCorrection — Negative-Lie correction chart

Node `HodgeStructuresPartII:H.6/negative-lie-chart` (construction). For a fixed marked limiting flag F₀, bigrade g_ℂ, the complexified Lie algebra of the isometry group of Q, by g^{a,b}={X∈g_ℂ | X I^{p,q}⊂I^{p+a,q+b}} for the Deligne bigrading of the limiting structure at F₀, and let q₋=⊕_{a<0,b}g^{a,b}. It is a nilpotent Lie subalgebra and a complement to the stabilizer F⁰g=⊕_{a≥0,b}g^{a,b} of the flag. The map v↦exp(v)F₀ is a holomorphic compact-dual big-cell chart at zero. After shrinking and choosing an inner closed buffer, the untwisted extension has a unique jointly holomorphic chart lift v̂(q,w)∈q₋ with Ψ(q,w)=exp(v̂(q,w))F₀ and v̂(0,w₀)=0. Its boundary value v₀(w)=v̂(0,w) need not vanish. Horizontality at q=0 forces g₀(w)=exp(v₀(w)) to commute with all L_i. Factoring ĝ(q,w)=g₀(w)b(q,w), one has b(0,w)=1 and Φ=e^{Σz_iL_i}g₀(w)b(q,w)F₀. Equivalently use the centered correction g=g₀bg₀^{-1} on F∞(w)=g₀F₀, so Φ=e^{Σz_iL_i}gF∞(w). For a fixed parameter its logarithm lies in the transported negative complement and vanishes at q=0. A varying native Deligne complement is not asserted holomorphic in w.

Proof outline. The Deligne pieces form an internal direct sum recovering F (pinned theorems), so End(V_ℂ) is the direct sum of its bidegree-shift pieces and the stabilizer of F₀ is the sum of those with a≥0. That g_ℂ is the sum of its intersections with these pieces needs Q to pair I^{p,q} with I^{p′,q′} to zero unless p+p′=q+q′=k; this compatibility of the polarization with the bigrading is gap G6. Then H.3/negative-exponential-map with the complement q₋ gives the chart map, and H.3/negative-chart-local makes it a local biholomorphism at zero. Invert the fixed exponential chart jointly in q,w on a sufficiently small neighborhood, retaining the potentially nonzero boundary coefficient v₀(w). Evaluate horizontality at q=0. Since L_i has degree (−1,−1) and v₀ has negative first degree, the prohibited degrees below −1 force [L_i,v₀]=0. Factor out g₀, then shrink to a compact holomorphic buffer.

Direct inputs: `untwisted-extension`, `limiting-mhs`, `HodgeStructuresPartII:H.3/negative-exponential-map`, `HodgeStructuresPartII:H.3/negative-chart-local`, `HodgeStructuresPartII:H.3/lie-hodge-filtration`, `mathlib:NormedSpace.exp`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.deligneSplitting`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.isInternal_deligneSplittingFamily`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.F_eq_iSup_deligneSplitting`, `HodgeStructuresPartII:H.2`.

Uses that the interface serves: BKT Lemma4.10 p.932 (the horizontal equations force a triangular exponentially small correction); H.7 Gram determinant formulas and sector-lift-definable (requires the genuine analytic coefficient on a compact buffer).

| Declaration | Role | Required behavior |
|---|---|---|
| `negativeLieCorrection.exp_zero` | simp | At v=0 the correction matrix is the identity. |
| `negativeLieCorrection.lift` | data | In the fixed joint chart, Ψ(q,w)=exp(v̂(q,w))F₀; in the centered representation it is g(q,w)F∞(w). |
| `negativeLieCorrection.unique` | characterisation | Within the chosen negative-Lie chart, two corrections representing the same flag are equal; arbitrary stabilizer gauges outside it are excluded. |
| `negativeLieCorrection.boundary` | projection | The centered correction satisfies v(0,w)=0 and g(0,w)=1; the fixed-chart boundary coefficient v̂(0,w)=v₀(w) can be nonzero. |
| `negativeLieCorrection.gamma` | constructor | The centered moving frame is exp(Σz_iL_i)g(q,w) based at F∞(w); the fixed-chart frame is exp(Σz_iL_i)g₀(w)b(q,w) based at F₀. |
| `negativeLieCorrection.buffer` | compatibility | Restriction to an inner compact buffer retains holomorphic extension beyond its closure; no restricted-analytic assertion is made at the original outer boundary. |

Unit tests:

- `negativeLieCorrection_test_zero` (degenerate): At v=0 the matrix is 1.
- `negativeLieCorrection_test_square_zero` (computation): For v²=0, exp(v)=1+v.
- `negativeLieCorrection_test_nonidentity` (non-example): For v=[[0,1],[0,0]], exp(v) is not the identity.
- `negativeLieCorrection_test_elliptic_chart` (computation): In ℂ² with F₀¹=span(0,1) and q₋ spanned by E=[[0,1],[0,0]], exp(aE) maps F₀¹ to span(a,1); so the flag span(a,1) has the unique lift v=aE.
- `negativeLieCorrection_test_stabilizer` (non-example): The diagonal matrix diag(1,−1), of first degree zero, fixes F₀¹=span(0,1) under exponentiation; a complement that contained it would give a chart that is not injective.

Acceptance: For a pure nilpotent orbit v=0 and g=1. The complement uses p<0, not p+q<0. A joint fixed chart can have v₀(w)≠0; it is not confused with the centered correction.

Sources: BKT, §4.4 pp.930–932, Lemma4.10 and proof: A negative-Lie lift and its triangular horizontal correction yield exponential decay on ordered sectors; normalization and lower-bound depth are retained explicitly. BKT, §4.4 p.931, paragraph preceding Lemma4.7: The negative Hodge degrees give a complement to the stabilizer and a holomorphic lift.

### horizontalCorrection — Horizontal triangular correction with the 2πi factor

Node `HodgeStructuresPartII:H.6/horizontal-correction` (theorem). For γ=e^{Σz_iL_i}g(q), q_i=e^{2πiz_i}, the left Maurer–Cartan horizontality condition is g^{-1}L_i g+2πi q_i g^{-1}∂_{q_i}g∈F^{−1}g_C, based at F∞. With v=log g in q_-, its holomorphic expansion admits v(q)=Σ_i q_i v_i(q_i,…,q_n), with [L_j,v_i]=0 for j<i. Hence the corresponding correction pieces preserve W^j for j<i. The equations use the analytic differential of exp at ad v, continued across its apparent removable singularity; they are not evaluated by division by a possibly noninvertible ad v. For a joint fixed chart first separate v₀(w) and the commuting g₀(w); the triangular expansion is for the centered coefficient b, transported by g₀ to the centered frame. It is not asserted that the uncentered fixed-chart coefficient vanishes along the entire parameter stratum.

Proof outline. Differentiate q_i=e^{2πiz_i} before forming γ^{-1}dγ; this gives the missing printed factor. In the fixed joint chart first evaluate at q=0 to show [L_j,v₀(w)]=0, then remove g₀(w). Apply the negative-degree complement argument to the centered coefficient at q₁=⋯=q_{i−1}=0; it forces the earlier commutators to vanish. Apply centralizer preservation of W and the triangular expansion used in BKT Lemma4.10.

Direct inputs: `negative-lie-chart`, `logarithms-type`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `HodgeStructuresPartII:H.3/lie-hodge-filtration`, `HodgeStructuresPartII:H.3/tangent-horizontal`.

Acceptance: At g=1 the equation reduces to L_i∈F^{−1}g. Deleting 2πi gives an incorrect chain-rule equation, even for a scalar exponential correction.

Sources: BKT, §4.4 pp.930–932, Lemma4.10 and proof: A negative-Lie lift and its triangular horizontal correction yield exponential decay on ordered sectors; normalization and lower-bound depth are retained explicitly.

### flatNormEstimate — Splitting-independent flat squared-norm estimate

Node `HodgeStructuresPartII:H.6/flat-norm-estimate` (theorem). Under the stated ordered-sector and compact-family hypotheses, for every compatible simultaneous splitting (complex I or complexified rational J), there are constants 0<c≤C and a depth Y such that cΣ_σ m_σ(y)|u_σ|_0²≤h_Φ(z,w)(u,u)≤CΣ_σ m_σ(y)|u_σ|_0² for every u, where u_σ are the components in that splitting. m_σ(y)=(y_1/y_2)^{σ_1}⋯(y_{n−1}/y_n)^{σ_{n−1}}y_n^{σ_n}, with integer centered weights; when n=0 use m=1. Constants may depend on the chosen splitting, width and compact set, but not on z,w,u. Any nonzero homogeneous u has a two-sided monomial bound. This is a squared norm; the ordinary norm has half these exponents.

Hypotheses: A fixed polarized nilpotent orbit or its associated local variation, unipotent normalization, bounded |Re z_i|≤R. Ordered heights y_1≥⋯≥y_n≥Y>0; fixed finite compatible splitting and fixed positive reference norm. For uniform compact parameters: a common domain-entry buffer, dim(F∞(w)^p∩W(J)_ℓ) independent of the parameter w for all p, ℓ and every subset J of the generators (Kashiwara's condition (2.4.3.3)), and continuous/smooth compatible splitting data bounded on the compact set.

Proof outline. Kashiwara Theorem 2.4.2 for a compact family of limiting flags satisfying (2.4.3.1)–(2.4.3.3), after translating the flag so that the whole open cone enters D: it is stated for the terminal subsets {N_i | i≥j} on the region t_1>ε, t_j/t_{j−1}>ε; reversing the order of the variables gives the initial subsets and the ordered sector used here, and real translations exp(Σx_iL_i) with |x_i|≤R are bounded and preserve every face filtration. Use §§4.1–4.4 to transfer to the actual variation on a deep local chart. Apply Corollary1.9.2 to every compatible splitting: lower-weight components have bounded monomial ratios on the ordered sector; finite sums of ordinary norms and their squared sums are equivalent.

Direct inputs: `nilpotent-orbit-theorem`, `simultaneous-splittings`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm_eq_conj`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm_self_pos`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `tauceti:TauCeti.Hodge.Polarization.hodgeInnerProductCore`, `HodgeStructuresPartII:H.2`.

Acceptance: For a constant pure variation every centered σ is zero, giving uniform comparison with a fixed norm. The zero vector satisfies both summed inequalities; it cannot be used in a nonvanishing roughly-monomial assertion.

Sources: Kashiwara, Corollary1.9.2 p.861; Theorem2.4.2 p.864 and Theorem3.4.1 p.870; proofs §§2.4–2.6 and4 pp.864–875: Induction gives the norm on graded directions and lower-triangular changes make the estimate independent of the splitting.

### movingNormEstimate — Splitting-independent transported squared-norm estimate

Node `HodgeStructuresPartII:H.6/moving-norm-estimate` (theorem). With the same hypotheses, splitting and m_σ(y)=(y_1/y_2)^{σ_1}⋯(y_{n−1}/y_n)^{σ_{n−1}}y_n^{σ_n}, with integer centered weights; when n=0 use m=1. there are positive c,C and a depth Y such that cΣ_σm_σ(y)|u_σ|_0²≤h_Φ(z,w)(e^{Σz_iL_i}u,e^{Σz_iL_i}u)≤CΣ_σm_σ(y)|u_σ|_0² for every u. On the actual canonical-extension bundle the same assertion holds for smooth splitting sections, with their pointwise reference norms. The moving norm is not computed in a fixed limiting degenerate Hermitian form; it uses the positive Hodge metric at Φ(z,w).

Hypotheses: A fixed polarized nilpotent orbit or its associated local variation, unipotent normalization, bounded |Re z_i|≤R. Ordered heights y_1≥⋯≥y_n≥Y>0; fixed finite compatible splitting and fixed positive reference norm. For uniform compact parameters: a common domain-entry buffer, dim(F∞(w)^p∩W(J)_ℓ) independent of the parameter w for all p, ℓ and every subset J of the generators (Kashiwara's condition (2.4.3.3)), and continuous/smooth compatible splitting data bounded on the compact set.

Proof outline. Use Corollary2.4.3 for the nilpotent-orbit moving frame. Identify the unipotent canonical-extension frame via H.2; apply Theorem3.4.2 in smooth splitting coordinates. Transfer between fixed splittings by the same triangular-weight argument; ensure splitting transitions and their inverses are bounded on the compact parameter set.

Direct inputs: `flat-norm-estimate`, `simultaneous-splittings`, `HodgeStructuresPartII:H.2/canonical-extension`, `HodgeStructuresPartII:H.2`.

Acceptance: For an elliptic rank-two orbit the centered weights −1 and +1 give y^{-1} and y. This does not require a rational Hodge-adapted splitting.

Sources: Kashiwara, Corollary2.4.3 p.864, Theorem3.4.2 p.870 and proof §4 pp.870–875: Controls transported vectors and arbitrary smooth splitting sections of the canonical extension, uniformly near the boundary.

### exteriorPowerEstimates — Exterior-power and determinant norm estimates

Node `HodgeStructuresPartII:H.6/exterior-power-estimates` (theorem). For each r≥0 the induced pure polarized variation on Λ^rV satisfies both flat and moving squared-norm estimates in the induced simultaneous splitting. The centered weight of a wedge of components is the coordinatewise sum of their σ labels. Its Hermitian squared norm is det(h(u_i,u_j)), with the native conjugate-first convention; the diagonal determinant agrees with the conjugate-second convention. Constants depend on r and the compact data. Λ^0 has weight zero and unit norm; wedges of more than dim V vanish and are excluded from nonzero homogeneous conclusions.

Proof outline. Reuse the native pure tensor Hodge structure. Import LPV.1’s generic induced monodromy filtrations and H.2’s polarized exterior-variation/Gram-metric compatibility; the actual weight rk stays separate from centered indices. Apply the two norm theorems to the induced variation; identify the induced Hodge metric with the Gram determinant.

Direct inputs: `flat-norm-estimate`, `moving-norm-estimate`, `LefschetzPencilsAndVanishingCycles:LPV.1/tensor-dual-and-symmetric-monodromy`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm_eq_conj`, `tauceti:TauCeti.Hodge.HodgeStructureOn.tensorProduct`, `HodgeStructuresPartII:H.2`.

Acceptance: For r=0 the monomial is 1. A linearly dependent tuple has zero Gram determinant, and is not roughly monomial.

Sources: Kashiwara, §§1.9,2.4 and3.4 pp.860–864,870: The finite-dimensional estimates apply after functorial tensor/exterior construction. BKT, Lemma4.7 proof pp.931–932: Wedge norms give the determinant monomials needed for matrix entries; the stronger arbitrary-splitting estimate is necessary.

### perturbedNormComparison — Deep-height horizontal perturbation comparison

Node `HodgeStructuresPartII:H.6/perturbed-norm-comparison` (theorem). For the horizontal negative-Lie correction and fixed R, compact parameter data and compatible splittings as above, there exist Y,c,C>0 such that for all ordered y_1≥⋯≥y_n≥Y and all u, c h_Φ(e^{Σz_iL_i}u,e^{Σz_iL_i}u)≤h_Φ(γu,γu)≤C h_Φ(e^{Σz_iL_i}u,e^{Σz_iL_i}u). The assertion holds in every induced exterior power. The lower bound requires depth; it is not deduced by declaring the region with one shallow and one unbounded logarithmic coordinate compact.

Hypotheses: A fixed polarized nilpotent orbit or its associated local variation, unipotent normalization, bounded |Re z_i|≤R. Ordered heights y_1≥⋯≥y_n≥Y>0; fixed finite compatible splitting and fixed positive reference norm. For uniform compact parameters: a common domain-entry buffer, dim(F∞(w)^p∩W(J)_ℓ) independent of the parameter w for all p, ℓ and every subset J of the generators (Kashiwara's condition (2.4.3.3)), and continuous/smooth compatible splitting data bounded on the compact set.

Proof outline. Use v=Σq_iv_i and the centralizer relations so each correction piece contributes only polynomial factors in y_i,…,y_n after weighted conjugation. Bound |q_i|=exp(−2πy_i); on the ordered sector, exponential decay dominates all finitely many such tail monomials uniformly once y_n is large. Make the correction’s operator norm smaller than 1/2 in the transported Hodge norm; the triangle inequality yields both bounds. Apply the same argument on each exterior power.

Direct inputs: `horizontal-correction`, `moving-norm-estimate`, `exterior-power-estimates`, `mathlib:Complex.norm_exp`.

Acceptance: When v=0 the two forms agree exactly. The estimate does not assert a lower bound at the original outer radius.

Sources: BKT, §4.4 pp.930–932, Lemma4.10 and proof: A negative-Lie lift and its triangular horizontal correction yield exponential decay on ordered sectors; normalization and lower-bound depth are retained explicitly.

## One-variable arithmetic containment

### oneVariableSL2 — Rational horospherical asymptotics of a one-variable period lift

Node `HodgeStructuresPartII:H.6/one-variable-sl2` (theorem). For a one-variable integral polarized period lift Φ on the upper half-plane with monodromy logarithm L≠0 and limiting flag F∞, choose the base point o∈D as in the rational form of sl2-orbit-theorem, a maximal ℚ-split torus T containing the image under ψ of the diagonal torus, a system of positive roots containing every root that is negative on dψ(Y), the minimal ℚ-parabolic P=R·T·M it defines, and the maximal compact K containing the isotropy group of o (it is unique). Then there are real-analytic functions r(x,y), t(x,y), m(x,y), k(x,y) for y>Y_0 with values in the real points of R, T, M and in K such that Φ(x+iy)=r·t·m·k·o; as y→∞ the limits of r, exp(½log y·dψ(Y))·t, m and k exist uniformly in x, the limits of the last three are 1, and the limit of r is continuous in x. In particular for |x|≤C the factors r, m and k stay in compact sets and every positive root is bounded below on t. For L=0 the lift extends over the puncture with value in D and its image for |x|≤C, y≥η is relatively compact.

Proof outline. For the nilpotent orbit itself, Schmid Lemma (5.25): the factors of exp(iyL)F∞ are real-analytic in y^{-1/2} at infinity with the stated limits; this is read off from the expansion of sl2-orbit-theorem (g) through Lemmas (9.60) and (9.68). The nilpotent orbit theorem bounds the distance between Φ(x+iy) and exp((x+iy)L)F∞ by a constant times exp(−εy) uniformly in x; translating by the factors of the orbit and decomposing a group element exponentially close to 1 gives the factors of Φ (Schmid Theorem (5.26)). For L=0 use finite-monodromy-extension.

Direct inputs: `sl2-orbit-theorem`, `nilpotent-orbit-theorem`, `finite-monodromy-extension`, `HodgeStructuresPartII:H.3`, `AdelicAlgebraicGroups:AA.3/real-siegel-set`, `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`.

Acceptance: A rank-two elliptic orbit has the standard split torus growth. This is the one-variable theorem, not the multivariable finite Siegel theorem owned by H.7.

Sources: Schmid, (5.20)–(5.24), Lemma (5.25) and Theorem (5.26) with proof, pp.242–244; proof of (5.25) in §9, pp.313–316, with Lemmas (9.60) and (9.68): Constructs the parabolic and the four factors and proves their limits, uniformly in the real part.

### oneVariableSiegel — One-variable finite Siegel containment for fixed compact

Node `HodgeStructuresPartII:H.6/one-variable-siegel` (theorem). For a one-variable integral polarized period lift Φ and constants C>0, η>0, the image of {|Re z|≤C, Im z≥η} is contained in one Siegel set of D in Schmid's sense: a set r·t·m·k·o with r and m in fixed compact sets, k∈K and every positive root of T bounded below on t, for the base point o, the torus T, the parabolic P and the maximal compact K of one-variable-sl2. Schmid's K is the unique maximal compact subgroup containing the isotropy group of o, so it is the canonical one at o, and changing the base point of D replaces a Siegel set S by a right translate Sg, which is a Siegel set for g^{-1}Kg. Consumer form, for the definable structure of H.7: the same image lies in finitely many Siegel sets of G/M associated to the canonical maximal compact of the marked reference point in the sense of AA.3/real-siegel-set, whose split component is the one stable under the Cartan involution of K. The consumer form is not a formal consequence of the first statement: Schmid's torus T is defined over ℚ and need not be stable under the Cartan involution of K, and for such a torus a set of Schmid's shape is not in general contained in finitely many Siegel sets for K. This comparison along the period lift is gap G5.

Proof outline. Deep part: by one-variable-sl2, for y≥Y_0 the factors r, m lie in compact sets and the positive roots are bounded below on t, uniformly for |x|≤C. Shallow part: {|x|≤C, η≤y≤Y_0} is compact with image in D; the interiors of Siegel sets exhaust D, so one Siegel set contains it (Schmid Corollary (5.29)). Consumer form: t(x,y) is the image under ψ of a diagonal element times a factor tending to 1, and the image of the diagonal torus is stable under the Cartan involution of K because dψ has type (0,0); the remaining factors have to be moved across this torus using the eigenvalue bounds of sl2-orbit-theorem (g), and the result compared with the Siegel sets of AA.3 through AA.3/siegel-convention-comparison. This step is not in the sources read and is recorded as gap G5.

Direct inputs: `one-variable-sl2`, `HodgeStructuresPartII:H.3`, `AdelicAlgebraicGroups:AA.3/real-siegel-set`, `AdelicAlgebraicGroups:AA.3/siegel-convention-comparison`, `AdelicAlgebraicGroups:AA.3/orbit-map-siegel-preimage`, `AdelicAlgebraicGroups:AA.3/reduction-siegel-dictionary`, `sl2-orbit-theorem`, `AdelicAlgebraicGroups:AA.3`.

Acceptance: For zero monodromy a buffered strip has relatively compact image. For G=SL(2), K=SO(2), P the upper triangular group and the split torus T′=uTu^{-1} with u a nontrivial upper unipotent element of parameter b, the set of points x′+b(1−y)+iy with |x′|≤C, y>c has Schmid's shape for T′ but meets infinitely many integer translates of the strip |x|≤C′; it is not contained in finitely many Siegel sets for SO(2). So stability of the torus under the Cartan involution cannot be dropped. No claim is made that changing the maximal compact preserves the definable quotient structure.

Sources: Schmid, Definition of Siegel sets and Corollary (5.29), pp.244–245; uniqueness of K, p.314: Defines Siegel sets of D from the rational torus, the parabolic, the base point and K, and proves that a strip of bounded width and height bounded below maps into one of them. BKTerr, §§1.1–1.2 with Remark 1.1, pp.1–2; §1.5, p.3; §1.6.1, p.4: Siegel sets and the definable structure depend on the maximal compact; right translation changes the compact by conjugation; Siegel sets for two different maximal compacts of SL(2) are not comparable.

### powerCurveNormalization — Rational slope curves reduce to one-variable degeneration

Node `HodgeStructuresPartII:H.6/power-curve-normalization` (application). For a curve q_i=c_i t^{a_i} with rational a_i≥0, nonzero c_i and remaining analytic parameters confined to an inner compact buffer, choose a positive denominator-clearing cover t=s^d. The positive exponents da_i give commuting combined logarithm L_curve=Σ_i da_iL_i and one-variable weight-k polarized degeneration. Zero exponents remain nondegenerating compact parameters, not boundary directions. Its period lift has finite fixed-K Siegel containment on every buffered bounded-width positive-height strip by oneVariableSiegel. This is the Hodge adapter to the curve test; existence/definability of the curve family and the multivariable uniform containment remain in LD.6/H.7.

Proof outline. Clear the finitely many rational denominators; pull back the variation and record the e-fold winding in each positive coordinate. Use cone weights on the corresponding face and the fixed-K one-variable theorem. Keep nondegenerating coordinates away from the outer boundary and the angular representatives in bounded-width charts.

Direct inputs: `unipotent-normalization`, `cone-weights`, `one-variable-siegel`.

Acceptance: For slopes (1/2,0), a square cover yields one logarithm L_1 while the second coordinate stays fixed. A negative slope leaves the local punctured-disc chart and is excluded.

Sources: Schmid, Corollary5.29 p.245: Applies to the pulled-back one-variable polarized variation. BKT, §4.5 p.933, curve test using Schmid: Rational slopes require a finite power cover before invoking the one-variable theorem.

## Closure and supplier work

Every stage target is a node, and every chain of prerequisites ends in a declaration read at the pinned commits, in a node of another packet, or in one of the gaps below. Packets cited by node are plans; citing them does not make them implementations, and several of them (CrystallineCohomology CR.5, AdelicAlgebraicGroups AA.3, LefschetzPencilsAndVanishingCycles LPV.1, ShimuraData D3) are themselves under revision.

### G1 — Analytic semistable log and derived comparison boundary

H.6 proves the semistable statements from general tools that no packet supplies yet: analytic log forms on a smooth total space with reduced normal-crossing fibre (C0), Grauert coherence and base change for the relative log complex (C0, C3), and nearby cycles with proper base change, their equivariant spectral sequence and local computation (C5). The suggested file represents the semistable normal form, the connection in a local frame and the linear algebra of the residue only; the global family, log sheaves, derived triangles and cohomology identifications are stand-in types there.

Affected nodes: `semistable-log-model`, `relative-log-forms`, `wedge-triangle`, `log-cohomology-basechange`, `log-gauss-manin`, `special-residue`, `semistable-betti`, `equivariant-comparison`, `ramified-residue`.

### G2 — Invariant distance and curvature of period domains; global variation carriers

H.3 has nodes for the compact dual, the period manifold, marked holomorphic horizontal period maps, their monodromy equivariance and the exponential charts, and H.6 cites them. It has no node for the invariant distance, the distance-decreasing property of horizontal holomorphic maps or the constancy of entire horizontal maps, which Borel's lemma, Schmid's §8 and §9 and the cone theorem use; these are requested. The suggested file uses integer-indexed complex submodules, matrices and supplied domain subsets as local representatives, and stand-in types for variations.

Affected nodes: `quasi-unipotence`, `untwisted-extension`, `nilpotent-orbit-theorem`, `sl2-orbit-theorem`, `cone-weights`, `one-variable-sl2`.

### G3 — Generic filtration linear algebra beyond the existing LPV.1 nodes

LPV.1 has nodes for the finite logarithm, the monodromy filtration centered at an integer, uniqueness of relative filtrations, tensor, dual and symmetric powers, primitive decomposition and maximal unipotence; H.6 cites them. Missing there: naturality of the finite logarithm (commuting logarithms, infinitesimal isometries), distributive families of filtrations with their simultaneous splitting, and exterior powers. These are requested from LPV.1 with a rescope proposal; they are not planned in H.6.

Affected nodes: `unipotent-normalization`, `distributive-family`, `simultaneous-splittings`, `exterior-power-estimates`.

### G4 — Native compact-family splitting and metric interface

The mathematical local constant-rank adapter is proved in simultaneous-splittings using negative-lie-chart’s commuting boundary factor g₀(w): it preserves all face weights and transports F₀, hence every relevant intersection. Compact buffers and a finite cover give uniform bounds. What is missing is the native analytic splitting-subbundle/positive-Hodge-metric interface representing this transport and the common-depth compact family in Lean. H.2/H.3 must supply the global carriers. Suggested Lean uses fixed-coordinate projections and omits the actual parameter-family/bundle specifications; elaboration does not supply these interfaces.

Affected nodes: `simultaneous-splittings`, `negative-lie-chart`, `flat-norm-estimate`, `moving-norm-estimate`, `exterior-power-estimates`, `perturbed-norm-comparison`.

### G5 — Schmid's Siegel sets and the Siegel sets of the canonical maximal compact

Schmid's Corollary (5.29) places the image of a strip in one Siegel set of D defined from a maximal ℚ-split torus T containing the image of the diagonal torus of SL(2), a minimal ℚ-parabolic, the base point o and the maximal compact K containing the isotropy group of o. That K is the unique such subgroup (Schmid p.314), hence the canonical one at o, and a change of base point only translates Siegel sets on the right (erratum of Bakker–Klingler–Tsimerman, Remark 1.1(1)). The Siegel sets of AA.3 and of H.7's definable structure use the split component stable under the Cartan involution of K. Schmid's T need not be stable, and for a torus that is not stable a set of Schmid's shape is in general not contained in finitely many Siegel sets for K (the SL(2) example in one-variable-siegel; the erratum's §1.6.1 is the same phenomenon). What has to be proved is the containment along a period lift, where t is asymptotic to the image of the diagonal torus, which is stable, with the eigenvalue bounds of the SL₂-orbit theorem controlling the other factors. Until then the consumer form of one-variable-siegel and the curve test of power-curve-normalization are planned, not closed.

Affected nodes: `one-variable-sl2`, `one-variable-siegel`, `power-curve-normalization`.

### G6 — Compatibility of the polarization with the Deligne bigrading of the limiting structure

negative-lie-chart needs the complexified Lie algebra of the isometry group of Q to be the direct sum of its pieces of given bidegree shift for the Deligne bigrading of the limiting mixed Hodge structure. For all endomorphisms this follows from the pinned direct-sum theorem; for isometries it needs Q(I^{p,q},I^{p′,q′})=0 unless p+p′=q+q′=k. The pin has tensor products, internal Hom and Tate twists for pure structures only, and no mixed Hodge structure on a tensor product, on endomorphisms or on a twist; no planned node states the compatibility. It is requested from H.2, which already uses tensor and internal Hom of mixed variations. Bakker–Klingler–Tsimerman use 'the mixed Hodge structure on g induced by (F,W)' without comment (p.931).

Affected nodes: `negative-lie-chart`, `horizontal-correction`.

### Requests

- **ComplexComparisonPartII:C0**: Analytic divisor-log charts and analytic sheafification of the CR.5 universal log differentials and relative log complex on a smooth analytic total space with reduced simple-normal-crossing central fibre (an algebraic chart over a discrete valuation ring is not enough); coherence of proper direct images of a bounded complex of coherent sheaves with differentials linear over the base (Grauert), in the form used with C3; finite analytic quotients and descent along the universal cover of a punctured polydisc. Consumers: semistable-log-model, relative-log-forms, log-cohomology-basechange, untwisted-map, untwisted-extension, finite-monodromy-extension.
- **ComplexComparisonPartII:C5**: Nearby cycles of the constant sheaf ℂ for a proper holomorphic map to a disc, with the monodromy action, proper base change (cohomology of the special fibre with nearby-cycle coefficients is the cohomology of a nearby fibre), the monodromy-equivariant spectral sequence from the nearby-cycle cohomology sheaves, and their local computation at a point where the map is a product of coordinates. Derived pushforward and fibre base change of the exact sequence of absolute and relative log complexes. H.6 itself proves the semistable statements (local freeness and base change, residue equals the special boundary, monodromy equals exp(−2πi residue)) from these, following Steenbrink as presented by Illusie; the existing proper smooth and modular-curve logarithmic nodes of C5 do not cover them. Consumers: wedge-triangle, log-cohomology-basechange, special-residue, semistable-betti.
- **ComplexComparisonPartII:C3**: Cohomology and base change for a bounded complex of coherent sheaves, flat over the base, on a proper analytic family, with differentials linear over the base; and, for an algebraic proper log smooth family, comparison of the algebraic and analytic relative log de Rham cohomology (the comparison Qian uses between the algebraic special log fibre and its analytification), including invariance of the comparison under a semistable modification of a ramified pullback. Consumers: log-cohomology-basechange, ramified-residue.
- **LefschetzPencilsAndVanishingCycles:LPV.1**: Beyond the existing nodes finite-monodromy-logarithm, monodromy-filtration, relative-monodromy-uniqueness, tensor-dual-and-symmetric-monodromy, primitive-decomposition-and-strictness and maximal-unipotence, which H.6 cites: (1) naturality of the finite logarithm under algebra automorphisms and anti-automorphisms, so that logarithms of commuting unipotent operators commute and the logarithm of a unipotent isometry of a bilinear form is an infinitesimal isometry; (2) distributive families of filtrations of a finite-dimensional vector space and their simultaneous splitting (every finite distributive family has a multigrading inducing each filtration), with the two-filtration case; (3) the exterior-power analogue of the tensor formula for monodromy filtrations, and induced splittings of exterior powers. The finite nilpotent exponential is Mathlib's and is not to be recreated. Consumers: unipotent-normalization, distributive-family, simultaneous-splittings, exterior-power-estimates.
- **HodgeStructuresPartII:H.3**: Beyond the existing nodes cited by H.6 (compact dual, full period manifold, marked holomorphic horizontal period maps and their monodromy equivariance, the Lie-algebra filtration, horizontal tangents and the exponential charts for a specified complement): (1) a G_ℝ-invariant Riemannian distance on D for which holomorphic horizontal maps from the upper half-plane with its Poincaré metric do not increase distances, and the constancy of horizontal holomorphic maps from ℂ (negative curvature in horizontal directions); (2) the canonical Cartan involution at a point of D, given by the Weil operator, its maximal compact subgroup, which is the unique one containing the isotropy group, and the Hodge-metric representation of G into the special linear group of V compatible with these; (3) the comparison along a one-variable period lift between Schmid's Siegel sets and the Siegel sets of AA.3 for the canonical maximal compact (gap G5). Consumers: quasi-unipotence, untwisted-extension, nilpotent-orbit-theorem, sl2-orbit-theorem, cone-weights, one-variable-sl2, one-variable-siegel.
- **AdelicAlgebraicGroups:AA.3**: For the canonical maximal compact K of a point of D and a minimal ℚ-parabolic, containment of a set r·t·m·k with r, m bounded, k∈K and t in the positive chamber of a maximal ℚ-split torus in finitely many Siegel sets associated to K, under the hypotheses available for a period lift: t is the product of an element of a one-dimensional subtorus stable under the Cartan involution of K and a factor tending to 1, and the bounded factors satisfy the eigenvalue bounds of the SL₂-orbit theorem. Without stability of the torus the containment fails (see one-variable-siegel). The existing orbit-map and reduction dictionary nodes are inputs, not this comparison. Consumers: one-variable-siegel.
- **HodgeStructuresPartII:H.2**: (1) Global analytic carriers for polarized variations and their canonical extensions on a polydisc minus coordinate hyperplanes, with filtration subbundles in several variables and logarithmic frames compatible with parameters, in which the transport by the commuting boundary factor of negative-lie-chart expresses holomorphic compatible splittings, constant intersection ranks and bounded transitions on compact parameter sets; the local rank statement itself is proved in H.6. (2) Polarized exterior-power variations and their Gram-determinant Hodge metric, built on the pinned HodgeStructureOn.tensorProduct and Polarization.hodgeInnerProductCore. (3) For a polarized mixed Hodge structure, here the limiting one: the polarization pairs the Deligne pieces I^{p,q} and I^{p′,q′} to zero unless p+p′=q+q′=k, so that the complexified Lie algebra of the isometry group is the direct sum of its bidegree-shift pieces (gap G6). Consumers: untwisted-extension, simultaneous-splittings, flat-norm-estimate, moving-norm-estimate, negative-lie-chart, exterior-power-estimates.

Keep LPV.1 as the owner of the linear algebra of one nilpotent operator in characteristic zero, and extend it by naturality of the finite logarithm, distributive families of filtrations with their simultaneous splitting, and exterior powers. H.6 proposes no copy of these. The monodromy filtration of a nilpotent endomorphism is at present planned both in LPV.1 (monodromy-filtration) and in ArithmeticGaloisRepresentations R01.2 (monodromy-filtration); one of them should own it.

## Mistakes and gaps in the sources

The statements above use the corrected forms. The first four items restate findings already recorded for the two papers; the fifth concerns the cone theorem.

- **HodgeStructuresPartII/E-H6-1** (misprint; affects nothing): Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, Version of record, Lemma4.10 proof p.932, Maurer–Cartan equation. The coefficient of g^{-1}∂g/∂q_i in the lifted horizontality equation is written as q_i. Correction: Replace it by 2πi q_i when q_i=exp(2πiz_i) and L_i=log T_i. The chain rule gives ∂q_i/∂z_i=2πiq_i; the missing scalar does not change the zero-coordinate commutator step.
- **HodgeStructuresPartII/E-H6-2** (gap; affects the proof): Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, Version of record, Theorem4.8 and Lemmas4.7/4.10, pp.931–932. The quoted norm theorem is expressed for a rational weight splitting, while the determinant and correction arguments apply it to a complex Hodge-adapted splitting and induced wedges. Correction: Use Kashiwara’s arbitrary-compatible-splitting squared-sum estimates, including induced exterior powers, with centered labels (σ_j=p+q_j in the labelling the paper prints). Kashiwara Corollary1.9.2 transfers between splittings by lower-triangular weight changes; Theorem3.4.2 supplies smooth moving-section estimates.
- **HodgeStructuresPartII/E-H6-3** (gap; affects the proof): Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, Version of record, Lemma4.10 proof p.932, lower-bound estimate. The lower estimate is justified by making the correction exponentially small for large final height, while its use on a full ordered unit-height sector is not justified. Correction: State the lower comparison only after a common depth threshold and shrink the polydisc; use independent arguments for buffered positive-height extension. When n≥2 a region with one bounded height and an earlier unbounded height is not compact. The tail-monomial estimate tends uniformly to zero only after taking the final height sufficiently large.
- **HodgeStructuresPartII/E-H6-4** (gap; affects the proof): Lie Qian, Companion arXiv:2103.00106v1, analytic disc choice p.21 and monodromy step p.23. The analytic family is taken over the unit disc although the algebraic model excludes (T^{de}u′)^N=1 and u′ is an arbitrary admissible unit lift. Correction: Choose an open disc of radius at most |τ(u′)|^{−1/(de)}; alternatively use a root-of-unity lift whose excluded fibres are on the outer circle. The excluded singular values all have that radius, which can be smaller than one. Restricting the disc restores properness, smooth punctured fibres and the intended loop at infinity.
- **HodgeStructuresPartII/E-H6-5** (misprint; affects nothing): Eduardo Cattani and Aroldo Kaplan, Theorem (3.3)(ii), p.113, in the Inventiones printing (scan read). For two faces τ_1, τ_2 of the cone and an element N of τ_1 not in the closure of τ_2, the filtration W(τ_1) is said to be the monodromy weight filtration of N relative to W(τ_2). Correction: Add the hypothesis that τ_2 lies in the closure of τ_1 (τ_2 is a face of τ_1): then W(τ_1) is the weight filtration of N relative to W(τ_2). Equivalently, for arbitrary faces the filtration that is relative to W(τ_2) is the one of the face spanned by τ_1 and τ_2. Take V=V_1⊗V_2 with V_i two-dimensional and N_i the standard nilpotent on the i-th factor, a nilpotent orbit of weight two (the tensor product of two weight-one orbits). For τ_1 the ray of N_1 and τ_2 the ray of N_2 the printed hypothesis holds, but the weight filtration of N_1 relative to W(N_2) has graded dimensions 1, 2, 1 in degrees −2, 0, 2 and equals W(N_1+N_2), while W(N_1) has dimensions 2, 2 in degrees −1, 1. The proof on pp.113–114 reduces to N in the open cone and τ_2 an arbitrary face of it, which is the corrected statement.

## The suggested file

The suggested file imports Mathlib only, because the build available for elaboration has no compiled Tau Ceti Hodge modules; the native declarations are named in its docstrings. It contains the five definitions and constructions in local coordinates with every API item and unit test under the names above, the theorems of linear algebra and of calculus in a frame with all their hypotheses, and the remaining theorems as relations between stand-ins for the objects other layers own (a polarized datum with its period domain and Siegel sets, the monodromy filtration, integral and unipotent variations with their period lift, limiting flag, correction coefficient and Hodge form, and a semistable family with its residue, special boundary operator and monodromy). Each docstring says what its statement leaves out. No statement is a placeholder proposition.

## Sources read

- **Qian:** Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, arXiv:2103.00106v1 (2021), companion preprint; not Potential Automorphy for GL_n. [Read copy](https://arxiv.org/pdf/2103.00106v1), accessed 8 October 2026. SHA-256: `87c4ee8499f3a615a81307e17d38d6f00ab544da9d22384f213bbc06052722e9`. Read: §4 pp.21–23: full log comparison diagram, Lemma4.3 and proof; inspected Remark2.4 p.13 for the excluded fibres.
- **Illusie:** Luc Illusie, *Autour du théorème de monodromie locale, Exposé I*, Astérisque 223 (1994), pp.9–57. [Read copy](https://www.numdam.org/item/AST_1994__223__9_0.pdf), accessed 8 October 2026. SHA-256: `a81d3e6c63ea0257b1cbd58933bb863c4adad3864cc19968f56beec700670e70`. Read: §2.2.1–2.2.4 pp.18–21: chart, theorem, corollary and supplied comparison proof; §2.1.3 pp.14–15, full local nearby-cycle computation and proper spectral-sequence proof of semistable unipotence.
- **Schmid:** Wilfried Schmid, *Variation of Hodge structure: the singularities of the period mapping*, Inventiones mathematicae 22 (1973), pp.211–319; journal scan. [Read copy](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), accessed 8 October 2026. SHA-256: `26f446e0bb5fbd7635ef5d7962fca30740cc17ee8c3e821a7e3d3fef7c284836`. Read: §4 Lemma4.5 and Theorems4.9/4.12 with Corollary4.11 pp.230–233; §5.19–5.29 pp.242–245, including supplied proofs; §6 Theorem6.16 and proof pp.255–263; Full §8 pp.277–293: nilpotent orbit proof; Full §9 pp.293–319: SL2 orbit proof, rationality, compactness and parabolic analysis; Theorem (5.13), pp.239–240, and p.314 (uniqueness of the maximal compact), read by the independent review.
- **CK:** Eduardo Cattani and Aroldo Kaplan, *Polarized mixed Hodge structures and the local monodromy of a variation of Hodge structure*, Inventiones mathematicae 67 (1982), pp.101–115; institutional journal scan. [Read copy](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0067/LOG_0011.pdf), accessed 8 October 2026. SHA-256: `06ef76491a6a66ac2fdc4bb388c72f0d4dbc453f0edd69b70daf8b3679a66e16`. Read: Full §§1–3 pp.101–115, read on page images; Theorem3.3 and its proof pp.113–114.
- **Kashiwara:** Masaki Kashiwara, *The asymptotic behavior of a variation of polarized Hodge structure*, Publications of RIMS 21 (1985), pp.853–875; journal scan. [Read copy](https://ems.press/content/serial-article-files/42282), accessed 8 October 2026. SHA-256: `6724c820167c7c2122d3d4943c1358ec38bbf89984d512184b7d852bcf6238a6`. Read: Full §§1–4 pp.853–875, including distributivity, arbitrary-splitting comparison, induction, and curvature proof; Formula images pp.860–861,862–864,870–872 checked against text extraction.
- **BKT:** Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*, Journal of the AMS 33 (2020), pp.917–939; publisher-formatted version of record. [Read copy](https://par.nsf.gov/servlets/purl/10200187), accessed 8 October 2026. SHA-256: `b7cf457907c30c9dc1c349637e74027ce4ef038a2e0f646b7685f571d367e058`. Read: §4.2 pp.928–929 and §4.4 pp.930–932, full statements and proofs; H.7 contracts compared.
- **BKTerr:** Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, *Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci*, Author-hosted erratum, four pages. [Read copy](https://benjamin-bakker.github.io/DefArithErr.pdf), accessed 8 October 2026. SHA-256: `86d76a5d2443840ddcaf2c08966cd236759bade659e338e3fcdb3edcd2b61ac7`. Read: Entire erratum pp.1–4, fixed compact and Cartan-compatible representation conditions.

All statements and proof outlines are in our own words. The six planets are Logarithmic Gauss–Manin connection, Nilpotent orbit, Nilpotent orbit theorem, SL₂-orbit theorem, Limiting mixed Hodge structure, Hodge norm estimates.
