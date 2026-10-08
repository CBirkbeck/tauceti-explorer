# Hodge structures, Part II — H.6

## Semistable degeneration and logarithmic monodromy

This layer connects two realizations of degeneration. A proper reduced semistable family produces special-fibre logarithmic de Rham cohomology and a geometric residue. A polarized integral variation produces a period lift, commuting monodromy logarithms and a limiting flag. The comparison identifies the geometric residue with the appropriately scaled logarithm, and the nilpotent-orbit analysis gives the mixed Hodge and norm structures used by H.7. The layer also supplies the one-variable arithmetic containment input; H.7 owns the multivariable containment, definability and locus results.

This is a target-level plan with 30 declaration-sized nodes. `HodgeStructuresPartII:H.6` has coverage **planned**, and the packet status is **complete** for this planning pass. It is not closed: five precise gaps and seven supplier requests remain. Every node has implementation status unchecked. The [packet](../packets/HodgeStructuresPartII--H.6.json) gives the dependency graph, and the [suggested file](../suggested/HodgeStructuresPartII--H.6.lean) gives scoped typed interfaces. The five gaps describe the conditions those prototypes omit, so elaboration cannot be mistaken for a proof of the source theorems.

### Starting point and ownership

The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The reviewed library audit already covers pure and mixed Hodge structures, polarizations, Deligne splitting and period-domain points. Those carriers are reused. In particular, the limiting mixed Hodge structure is an instance of the native rational mixed object, and its graded pure structures are the existing `MixedHodgeStructure.gradedHodgeStructure`. This layer does not define a substitute with unrelated filtrations.

H.2 supplies the general variation/admissibility and canonical-extension interfaces, the residue convention and the one-variable mixed limit. H.3 supplies the compact dual and period geometry. CR.5 owns log structures, universal log differentials and log complexes; its current semistable chart is algebraic over a DVR, so an analytic specialization is requested rather than assumed. C0, C3 and C5 own analytic carriers, proper comparison and the derived/nearby-cycle engine. LPV.1 owns general operator logarithms and monodromy-filtration linear algebra. AA.3 owns Siegel sets and rational reduction theory. H.7 owns the named sectors, comparison monomials, rough functions, Gram-entry applications, definability and global finite containment. No H.7 declaration occurs in the H.6 prerequisite graph.

The Mathlib finite nilpotent exponential is already available: `IsNilpotent.exp` and its finite-sum and commuting-addition theorems are read at the pin and imported. Analytic corrections use the existing algebra exponential and matrix exponential laws. The finite exponential has nilpotent hypotheses, and negative first-Hodge-degree elements are nilpotent on the finite Hodge grading. The analytic chart and its dependence on parameters still use the analytic exponential interface. Its comparison with the finite exponential belongs to the generic supplier API.

### Conventions and the consumer contract

A coordinate q on a punctured disc has positive-loop covering q=exp(2πiz), z=x+iy. After a coordinate power cover, let L=log T be the finite rational logarithm of the unipotent monodromy. In the logarithmic connection convention ∇=d+A dq/q, the residue is A and **L=−2πiA**. Thus the orbit exponential is exp(zL), whereas geometric residue monodromy is exp(−2πiA). These symbols are kept distinct even where Qian or Schmid uses the letter N with another normalization. Under q=t^e, both the logarithm and unipotent residue multiply by e. A raw ramified pullback can have singular total space; a new semistable geometric comparison requires a model and its comparison theorem.

The variation has pure weight k. The centered monodromy filtration W(L) is indexed about zero; the actual mixed weight is W_lim,m=W(L)_{m−k}. For the ordered initial faces write W^j=W(L_1+⋯+L_j). A simultaneous component with centered multiweight σ has σ_j=p+q_j−k in BKT's Hodge/weight labels. The two-sided **squared** norm comparison uses

$$m_σ(y)=(y_1/y_2)^{σ_1}\cdots(y_{n-1}/y_n)^{σ_{n-1}}y_n^{σ_n}.$$

The ordinary norm has half these powers. Kashiwara orders terminal subsets; reversing the coordinate order gives this initial-face convention. There is a complex splitting refining F∞ and all W^j, and a separate rational splitting refining only the W^j. Neither is canonical, and the complex one need not be rational. The estimate must hold for every compatible splitting, with constants depending on that splitting, rather than only for a selected rational one.

The Hodge form is the native conjugate-first form h_N(u,v)=Q(C(conjugate u),v). BKT writes its conjugate h_B(u,v)=Q(Cu,conjugate v). The native equality `Polarization.hodgeForm_eq_conj` identifies these conventions; their diagonal values and Hermitian Gram determinants agree. A squared norm therefore means the positive real diagonal of the native form. All-vector summed inequalities include u=0; homogeneous nonvanishing or roughly-monomial conclusions require u≠0. Exterior-power estimates also exclude zero wedges from nonvanishing statements.

Local analytic claims use two radii: an outer domain on which the maps are holomorphic and an inner compact buffer for restricted-analytic consumers. They also retain finite angular representatives covering the seams of the integer-translation quotient. The depth threshold in the perturbation lower bound is genuine. For n≥2, the region with one logarithmic coordinate bounded and another tending to infinity is not a compact remainder. Positive-height extension of the one-variable containment is instead proved on a bounded-height rectangle inside the outer buffer.

Nondegenerating coordinates w range in a compact subset of an inner chart. Uniform norm constants require a common orbit-entry depth, constant dimensions of the limiting Hodge/face-weight intersections and bounded compatible splitting transitions. Kashiwara's compact-family theorem states the rank hypothesis. The commuting boundary factor in the fixed negative-Lie chart preserves all face weights and transports the limiting Hodge flag, proving the local constant-rank assertion. The simultaneous-splittings theorem transports the complex splitting and uses a finite cover to make compact-parameter bounds uniform. Gap G4 records the missing native bundle/metric interface for this proved adapter, rather than requesting a second degeneration theorem from H.2.

There are two chart representations of the negative-Lie correction. At a fixed limiting flag F₀ choose the negative first-Hodge-degree complement q₋. Its joint holomorphic coefficient v̂(q,w) can have nonzero boundary value v₀(w). Horizontality forces exp(v₀(w)) to commute with the monodromy logarithms, so it can be factored out. The resulting centered correction is identity at q=0 and acts on the varying F∞(w). This avoids falsely treating the varying native Deligne complement as holomorphic in w, or claiming that the fixed-chart coefficient vanishes along the whole parameter stratum. The prototypes describe a fixed parameter or this centered representation; the packet records the joint-chart factorization explicitly.

### Reading the declaration graph

The namespace of every declaration below is `TauCeti.Hodge.Degeneration`. Names in API and test lists are names of mathematical declarations, not implementation claims. A local dependency is written by its H.6 node suffix. Cross-roadmap dependencies use their precise node id when one exists, otherwise the requested stage. Proof outlines remain at target level: named key ingredients are dependencies, and routine chart calculations stay in the proof outline.

## Geometric logarithmic specialization

### SemistableLogModel — Proper semistable analytic log model

Node `HodgeStructuresPartII:H.6/semistable-log-model` (definition). A proper holomorphic f:X→Δ_ρ with X smooth, reduced simple-normal-crossing fibre X_0, smooth restriction over Δ_ρ* and, at each point of X_0, analytic coordinates in which f=x_1⋯x_r (1≤r≤d). Equip X and Δ_ρ with their divisor log structures, imported from CR.5, and the central fibre with the induced log structure over the log point 1↦0. The radius ρ is chosen so the disc contains no other singular fibres. This is the geometric Hodge adapter, not a new definition of log structures or arbitrary log-smooth morphisms.

The proof or construction proceeds as follows. Use the analytic chart and divisor-log suppliers to identify the chart map ℕ→ℕ^r as the diagonal generator. Check f is proper over the chosen disc and smooth away from zero before applying any proper comparison.

Direct inputs: `ComplexComparisonPartII:C0`, `CrystallineCohomology:CR.5/semistable-log-forms`, `CrystallineCohomology:CR.5/log-differentials`.

The reusable interface serves these uses: Qian Lemma4.3 pp.22–23 — provides the proper central-fibre comparison and the wedge triangle; H.6 log-cohomology-basechange — excludes other singular fibres and supplies reduced semistable charts.

| Declaration | Role | Required behavior |
|---|---|---|
| `SemistableLogModel.localMap` | projection | In a chart with r divisor coordinates, the base coordinate is their product. |
| `SemistableLogModel.localMap_equation` | characterisation | The chart identifies f with x_1⋯x_r, including the unused smooth coordinates. |
| `SemistableLogModel.ext` | extensionality | Equality of the family map, radius and chosen chart data identifies marked models; this is not an equality of all presentations of an unmarked family. |
| `SemistableLogModel.restrict` | constructor | Restriction to 0<ρ′≤ρ retains the induced charts and is proper by base change. |
| `SemistableLogModel.restrict_comp` | functoriality | Nested disc restrictions compose and their log structures are the pulled-back divisor structures. |

The definition tests distinguish the intended object from tempting alternatives:

- `SemistableLogModel_test_smooth` (computation): For r=1 and d=2 the local map sends (a,b) to a.
- `SemistableLogModel_test_node` (computation): For r=d=2 the local map sends (a,b) to ab.
- `SemistableLogModel_test_not_sum` (non-example): For r=d=2 the local map at (1,1) is 1, not the additive value 2.

Acceptance: The r=1 local chart is a smooth projection; r=2 is xy. A nonreduced x^2 central fibre does not satisfy this reduced semistable definition.

Source support: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23 — The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus.; Illusie, Exposé I §2.2.1–2.2.4, pp.18–21 — The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue..

### relativeLogForms — Analytic relative log-form specialization

Node `HodgeStructuresPartII:H.6/relative-log-forms` (comparison). For a semistable log model, relative log one-forms in the above chart are (⊕_{i≤r}O·dlog x_i ⊕ ⊕_{j>r}O·dx_j)/O·Σ_{i≤r}dlog x_i, with dx_i=x_i dlog x_i. This is locally free of rank d−1. Its exterior powers and differential form DR_log(X/Δ), and derived fibre at 0 identifies with DR_log(X_0/log-point). Absolute log forms have the additional base generator dlog T. Analytic sheafification and pullback compatibility are required extensions of the algebraic CR.5 chart, not inferred from an algebraic-DVR theorem.

The proof or construction proceeds as follows. Transport the universal log differential relation through the requested analytic chart comparison. Use exterior powers of the locally free quotient to identify each fibre complex and its differential.

Direct inputs: `semistable-log-model`, `CrystallineCohomology:CR.5/semistable-log-forms`, `CrystallineCohomology:CR.5/log-de-rham`, `ComplexComparisonPartII:C0`.

Acceptance: For xy=T the relative relation is dlog x+dlog y=0 even on the singular fibre. Ordinary Kähler differentials cannot replace the log complex at T=0.

Source support: Illusie, Exposé I §2.2.1–2.2.4, pp.18–21 — The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue.; Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23 — The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus..

### wedgeDlogTriangle — Wedge-dlog distinguished triangle

Node `HodgeStructuresPartII:H.6/wedge-triangle` (theorem). For a reduced semistable log model the exact sequence of complexes 0→DR_rel[−1]→DR_abs→DR_rel→0 has first arrow wedge with dlog T, with the shift differential and connecting-map sign fixed accordingly. Its derived pushforward is a distinguished triangle. After fibre specialization at T=0 the corresponding first arrow is wedge with the base log generator dlog 1, which is not zero merely because the underlying base function vanishes.

The proof or construction proceeds as follows. Split absolute log forms locally into a relative lift and dlog T wedged with a relative lift; verify the shifted differential sign. Glue the exact sequence; apply the derived pushforward and fibre-base-change suppliers.

Direct inputs: `relative-log-forms`, `ComplexComparisonPartII:C5`.

Acceptance: The connecting map has the sign giving positive monodromy exp(−2πiA). Setting dlog 1 to zero would destroy the special-fibre residue and is rejected.

Source support: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23 — The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus.; Illusie, Exposé I §2.2.1–2.2.4, pp.18–21 — The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue..

### logCohomologyBaseChange — Proper log-de Rham cohomology and base change

Node `HodgeStructuresPartII:H.6/log-cohomology-basechange` (theorem). For each degree m of a proper reduced semistable analytic log model, E^m=R^m f_*DR_rel is locally free of finite rank on the disc. Its derived pullback to every point s agrees with log de Rham hypercohomology of the corresponding log fibre; at s≠0 this is ordinary de Rham cohomology, and at 0 it is the special log-point cohomology. Formation and the comparison maps are natural for morphisms of marked families. This is a cohomology theorem, not a claim that every individual log-form pushforward is locally free.

The proof or construction proceeds as follows. Apply the requested analytic proper log de Rham local-freeness/base-change theorem in precisely the proper normal-crossing setting. Use relative-form fibre identification to rewrite the derived fibre; degreewise local freeness eliminates unwanted Tor terms.

Direct inputs: `relative-log-forms`, `ComplexComparisonPartII:C5`, `ComplexComparisonPartII:C3`.

Acceptance: The central cohomology dimension equals the dimension of a nearby smooth fibre. A proper family with an additional singular fibre inside the disc fails the input hypotheses.

Source support: Illusie, Exposé I §2.2.1–2.2.4, pp.18–21 — The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue.; Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23 — The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus..

### logGaussManin — Semistable logarithmic Gauss–Manin connection

Node `HodgeStructuresPartII:H.6/log-gauss-manin` (construction). On E^m from log-cohomology-basechange, the connecting map of the wedge triangle is the logarithmic Gauss–Manin connection ∇:E^m→E^m⊗Ω^1_Δ(log0). In a local logarithmic frame write ∇v=dv+A(T)v dT/T, with A holomorphic. The special residue is A(0). This geometric realization specializes the connection/canonical-extension API of H.2; it does not construct a second general Gauss–Manin or canonical-extension theory.

The proof or construction proceeds as follows. Take the connecting morphism together with the absolute/relative differential compatibility that gives Leibniz. Use the H.2 connection carrier and verify restriction over the smooth locus is its Gauss–Manin connection. Record the residue by reduction of the logarithmic coefficient at zero.

Direct inputs: `wedge-triangle`, `log-cohomology-basechange`, `HodgeStructuresPartII:H.2/gauss-manin`, `HodgeStructuresPartII:H.2/canonical-extension`.

The reusable interface serves these uses: Qian Lemma4.3 pp.22–23 — identifies the logarithmic residue with the special log-point boundary; H.2 residue-monodromy — pins the sign and normalization for the geometric canonical extension.

| Declaration | Role | Required behavior |
|---|---|---|
| `logGaussManin.apply` | simp | In one logarithmic frame, the coefficient at q≠0 is dv+q^{-1}Av. |
| `logGaussManin.add` | structure | Connection evaluation is additive in the section and its derivative. |
| `logGaussManin.leibniz` | relation | For scalar f, ∇(fv)=df·v+f∇v; this is not O-linear in sections. |
| `logGaussManin.residue` | projection | At T=0, taking the logarithmic coefficient gives A(0), compatible with the special boundary operator. |
| `logGaussManin.horizontalMap` | functoriality | A family morphism induces a map commuting with ∇ and residues, and identity/composite morphisms give identity/composite maps. |
| `logGaussManin.ramified` | compatibility | For T=t^e, pullback coefficient is eA(t^e); the unipotent canonical extension needs no strip shift. |

The definition tests distinguish the intended object from tempting alternatives:

- `logGaussManin_test_zero` (degenerate): For zero residue, evaluation is dv.
- `logGaussManin_test_jordan` (computation): For A=[[0,1],[0,0]], q=2, v=(0,1), dv=0, evaluation is (1/2,0).
- `logGaussManin_test_leibniz` (non-example): For A=0 and v=(1), a nonconstant scalar section f=T has connection coefficient 1, not 0.

Acceptance: In a constant frame with A=0, ∇=d. The sign of a horizontal solution is exp(−A log T), not exp(A log T).

Source support: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23 — The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus.; Illusie, Exposé I §2.2.1–2.2.4, pp.18–21 — The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue..

### specialResidue — Residue equals special log-point boundary

Node `HodgeStructuresPartII:H.6/special-residue` (comparison). Under E^m|_0≃H^m(DR_log(X_0/log-point)), Res_0∇ is conjugate to the connecting endomorphism A_0 from the dlog 1 triangle on the special log fibre. The comparison is a commutative square of marked endomorphisms, not an unmarked equality between distinct cohomology models. A_0 is nilpotent for a reduced semistable family.

The proof or construction proceeds as follows. Specialize the entire wedge triangle using proper derived base change, retaining the first arrow. Use Illusie §2.1.3’s local torus computation: reduced multiplicities give trivial action on each nearby-cycle cohomology sheaf; the proper nearby-cycle spectral sequence then gives global unipotence. The strip-normalized residue has only eigenvalue zero, hence is nilpotent.

Direct inputs: `log-gauss-manin`, `log-cohomology-basechange`, `wedge-triangle`, `HodgeStructuresPartII:H.2/residue-monodromy`, `ComplexComparisonPartII:C5`.

Acceptance: Any finite family action commutes with this square. The special residue is not the unscaled positive-loop logarithm.

Source support: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23 — The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus.; Illusie, Exposé I §2.2.1–2.2.4, pp.18–21 — The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue.; Illusie, Exposé I §2.1.3, (2.1.3.1)–(2.1.3.2), pp.14–15 — The local torus and finite-component calculation plus the proper spectral sequence give unipotence for reduced semistable monodromy..

### semistableBetti — Nearby-cycle Betti and log de Rham comparison

Node `HodgeStructuresPartII:H.6/semistable-betti` (comparison). After choosing a positive loop, basepoint s≠0 and compatible de Rham/nearby-cycle identifications, the monodromy T_s on H^m(X_s,ℂ) is conjugate to exp(−2πi A_0) on special log cohomology. Equivalently L_s=log T_s corresponds to −2πi A_0 in the unipotent case. The comparison is natural in families but depends on the marking; no canonical equality of the two unmarked vector spaces is asserted.

The proof or construction proceeds as follows. Use the special log-complex/nearby-cycle comparison requested from C5; Illusie §2.2.4 models it with a log-coordinate complex on the universal cover. Identify the derivative in that coordinate with the residue; exponentiate for the chosen positive loop using the H.2 sign convention.

Direct inputs: `special-residue`, `HodgeStructuresPartII:H.2/log-comparison`, `HodgeStructuresPartII:H.2/residue-monodromy`, `ComplexComparisonPartII:C5`, `mathlib:IsNilpotent.exp_eq_sum`.

Acceptance: For A_0=0 the loop acts trivially. For A_0²=0, monodromy is 1−2πi A_0, exhibiting the sign and factor.

Source support: Illusie, Exposé I §2.2.1–2.2.4, pp.18–21 — The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue.; Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23 — The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus..

### equivariantLogComparison — Finite actions and character summands

Node `HodgeStructuresPartII:H.6/equivariant-comparison` (comparison). If a finite group H acts on the marked semistable family over the log disc, its induced actions commute with the wedge triangle, log Gauss–Manin connection, fibre comparison, residue and Betti monodromy comparison. Over a characteristic-zero splitting field, each character idempotent e_χ=|H|^{-1}Σ_hχ(h)^{-1}h commutes with these maps; all comparisons restrict to its image. A one-dimensional character summand is not a claim that every irreducible representation of a nonabelian H is a character.

The proof or construction proceeds as follows. Functoriality of log forms, derived pushforward and connecting morphisms makes every family automorphism equivariant. Each comparison commutes with every group action; take the finite scalar-weighted average defining e_χ. Finite-sum reindexing by the group law gives e_χ²=e_χ, so all comparison squares restrict to its image over the stated coefficient field.

Direct inputs: `semistable-betti`, `special-residue`.

Acceptance: For H={1}, the restricted comparison is the original comparison. Dividing by |H| is unavailable in characteristics dividing |H|.

Source support: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23 — The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus..

### ramifiedResidue — Ramified residue and maximal nilpotence

Node `HodgeStructuresPartII:H.6/ramified-residue` (comparison). For T=t^e with e a positive integer, punctured-disc monodromy is T_old^e and the unipotent logarithm is eL_old. On the pulled-back unipotent canonical extension the residue is eA_old. After any required semistable modification, the special geometric residue comparison realizes this same operator. Multiplying a nilpotent by the nonzero characteristic-zero scalar e preserves its nilpotency index and Jordan block sizes; hence maximal unipotence/nilpotence on a character part is preserved. The raw ramified pullback of a smooth total space is not asserted smooth.

The proof or construction proceeds as follows. The positive generator under an e-fold punctured-disc cover winds e times. Use H.2 pullback and residue normalization; apply the generic finite-log and scalar-nilpotency supplier. If using geometric special-fibre cohomology again, choose a semistable model and the requested birational comparison instead of applying the chart theorem to a singular raw pullback.

Direct inputs: `equivariant-comparison`, `HodgeStructuresPartII:H.2/residue-monodromy`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Acceptance: For a rank-two Jordan block and e=2 the off-diagonal logarithm doubles and still has index two. For e=0 or coefficients of characteristic dividing e the preservation statement is excluded.

Source support: Qian, §4 display(4.1), Lemma4.3 and proof, pp.21–23 — The supplied diagram identifies geometric log cohomology and its residue; the disc is restricted to the actual smooth locus.; Illusie, Exposé I §2.2.1–2.2.4, pp.18–21 — The proper normal-crossing comparison includes local freeness, fibre specialization and the positive-loop exponential of the residue..

## Normalized period degeneration

### quasiUnipotentMonodromy — Quasi-unipotence of polarized integral variation

Node `HodgeStructuresPartII:H.6/quasi-unipotence` (theorem). For a finite-rank polarized integral variation of pure Hodge structures on (Δ*)^n×Δ^m, with holomorphic horizontal period lift and the fixed lattice polarization, every coordinate local monodromy T_i is quasi-unipotent. In particular some positive power is unipotent. The integral lattice, polarization and horizontality are genuine hypotheses; arbitrary rational local systems are not covered.

The proof or construction proceeds as follows. Restrict to each coordinate punctured disc while fixing the other coordinates. Use the horizontal metric argument of Schmid Lemma4.5 and integrality of the polarization representation, then the characteristic polynomial root-of-unity conclusion.

Direct inputs: `HodgeStructuresPartII:H.2/admissible-variation`, `HodgeStructuresPartII:H.3`, `tauceti:TauCeti.Hodge.PeriodDomain.Point`.

Acceptance: A constant polarized variation has identity monodromy. An arbitrary rational matrix with a non-root-of-unity eigenvalue is not a valid example of this theorem.

Source support: Schmid, Lemma4.5 and its proof p.230 — Borel’s argument uses horizontal contraction and the integral isometry group to force roots of unity.; BKT, §4.2 p.928 — The local power-cover step invokes quasi-unipotence of the integral polarized variation..

### unipotentNormalization — Coordinate power-cover normalization

Node `HodgeStructuresPartII:H.6/unipotent-normalization` (theorem). Choose positive integers e_i clearing the orders of the semisimple parts of the commuting T_i. The finite coordinate cover q_i=t_i^{e_i} is étale off the SNC boundary; its pulled-back variation has commuting unipotent monodromies T_i^{e_i}. Their finite rational logarithms L_i=log(T_i^{e_i}) commute, are nilpotent and are infinitesimal isometries of Q. They satisfy exp L_i=T_i^{e_i}. Basepoints and markings are fixed throughout. This imports the general finite logarithm and isometry Lie-algebra calculations rather than replanning them.

The proof or construction proceeds as follows. Choose a common order for each coordinate’s finitely many eigenvalues. Apply the generic supplier’s rational finite logarithm and commuting functional calculus; differentiate the isometry identity to obtain L_i in Lie G.

Direct inputs: `quasi-unipotence`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `mathlib:IsNilpotent.exp`, `mathlib:IsNilpotent.exp_add_of_commute`.

Acceptance: A finite-order local monodromy becomes identity on the selected cover. The normalization is not a global finite étale cover across the ramified boundary.

Source support: Schmid, (4.6),(4.7),(4.12), pp.230–233 — The finite cover makes the logarithms commuting unipotent operators.; BKT, §4.2 p.928 — Unipotent coordinate normalization precedes all local estimates..

### NilpotentOrbit — Polarized multivariable nilpotent orbit

Node `HodgeStructuresPartII:H.6/nilpotent-orbit` (definition). Fix a rational vector space with integral lattice, weight k, polarization Q, prescribed Hodge type and its compact dual Dcheck from H.3. A polarized n-variable nilpotent orbit consists of commuting rational nilpotent Q-infinitesimal isometries L_i and F∞∈Dcheck, with L_iF∞^p⊂F∞^{p−1}, such that Θ(z)=exp(Σ_i z_iL_i)F∞ belongs to the positive period domain D for all Im z_i>Y for some Y. Positivity is eventual, not required of F∞ itself. The orbit is marked, and the bound and the compatible period domain are explicit in its membership API.

The proof or construction proceeds as follows. Use the compact-dual flag carrier and finite nilpotent exponential from the suppliers. Eventual positivity is an additional geometric condition; commuting nilpotence alone does not imply it.

Direct inputs: `unipotent-normalization`, `HodgeStructuresPartII:H.3/polarized-compact-dual`, `tauceti:TauCeti.Hodge.PeriodDomain.Point`, `mathlib:IsNilpotent.exp_add_of_commute`.

The reusable interface serves these uses: CK Theorem3.3 pp.113–114 — cone weights and polarized limiting MHS; H.7 sector-lift-definable and curvewise-reducedness — provides the boundary principal term without importing definability into H.6.

| Declaration | Role | Required behavior |
|---|---|---|
| `NilpotentOrbit.orbit` | data | The compact-dual-valued map is exp(Σz_iL_i) applied to F∞. |
| `NilpotentOrbit.orbit_zero` | simp | At z=0 the orbit equals F∞, without asserting this value lies in D. |
| `NilpotentOrbit.orbit_shift` | relation | Integer coordinate translation applies exp(Σa_iL_i) to the orbit. |
| `NilpotentOrbit.horizontal` | characterisation | The infinitesimal generators lower the limiting filtration by one, equivalently the exponential orbit is horizontal. |
| `NilpotentOrbit.eventual_mem` | projection | There exists a common positive depth above which the orbit belongs to D. |
| `NilpotentOrbit.reindex` | functoriality | Permuting the generators and the coordinates gives the same marked orbit after reindexing; the identity and composition permutations act accordingly. |
| `NilpotentOrbit.ext` | extensionality | For a fixed ambient domain and polarization, equality of all generators and of the limiting flag identifies orbit data. |

The definition tests distinguish the intended object from tempting alternatives:

- `NilpotentOrbit_test_zero` (degenerate): With zero generators and F∈D, Θ(z)=F for every z.
- `NilpotentOrbit_test_elliptic` (computation): For L=[[0,1],[0,0]] and F^1=span(0,1), Θ(z)^1=span(z,1).
- `NilpotentOrbit_test_no_positivity` (non-example): Zero generators and F outside D cannot meet eventual domain membership.

Acceptance: Zero L_i is an orbit exactly when F∞ is in D. The elliptic orbit F^1(z)=span(z,1) enters the upper-half-plane domain for Im z>0.

Source support: Schmid, Theorem4.12 pp.232–233; proof §8 pp.277–293 — The untwisted map extends holomorphically; its boundary value generates a horizontal orbit entering D sufficiently deep.; CK, §3 and Theorem3.3 pp.112–114 — Cone and limiting structures are attached to a polarized nilpotent orbit with these horizontality and positivity hypotheses..

### untwistedPeriodMap — Untwisting a unipotent period lift

Node `HodgeStructuresPartII:H.6/untwisted-map` (construction). For an equivariant lifted period map Φ(z,w) with Φ(z+a,w)=exp(Σa_iL_i)Φ(z,w), define its untwisted map on the cover as exp(−Σz_iL_i)Φ(z,w). It is invariant under integer translations and therefore descends to Ψ(q,w) on the punctured polydisc, q_i=exp(2πiz_i). Descent and its marking are canonical for the chosen logarithms; holomorphic extension across the boundary is a separate theorem. The target is Dcheck, since undoing the exponential need not preserve D.

The proof or construction proceeds as follows. Define the inverse exponential action on the filtration. Use commuting exponential laws and the equivariance equation to prove integer-periodicity. Apply universal-cover descent in the imported analytic atlas, retaining nondegenerating coordinates w.

Direct inputs: `unipotent-normalization`, `HodgeStructuresPartII:H.3/polarized-compact-dual`, `ComplexComparisonPartII:C0`, `mathlib:Matrix.exp_add_of_commute`.

The reusable interface serves these uses: Schmid Theorem4.12 pp.232–233 — the descended map is the object to which removable-singularity extension applies; H.7 local-period-definability — the analytic boundary coefficient is restricted only on a smaller closed buffer.

| Declaration | Role | Required behavior |
|---|---|---|
| `untwistedPeriodMap.apply` | simp | The filtration is mapped by exp(−Σz_iL_i). |
| `untwistedPeriodMap.undo` | relation | Applying exp(Σz_iL_i) recovers Φ(z,w). |
| `untwistedPeriodMap.integer_shift` | characterisation | Under the stated equivariance and commuting hypotheses, every integer translate has the same untwisted value. |
| `untwistedPeriodMap.zero` | simp | With every L_i=0, the untwisted map equals Φ. |
| `untwistedPeriodMap.gauge` | functoriality | Changing the flat marking by a fixed rational isometry conjugates all L_i and transports Ψ by the same isometry. |
| `untwistedPeriodMap.canonicalExtension` | compatibility | The unipotent H.2 canonical-extension frame has residue −L_i/(2πi), and its Hodge flag is the descended Ψ. |

The definition tests distinguish the intended object from tempting alternatives:

- `untwistedPeriodMap_test_orbit` (computation): Untwisting exp(zL)F gives F.
- `untwistedPeriodMap_test_zero` (degenerate): With n=0, the map is Φ on the nondegenerating parameter space.
- `untwistedPeriodMap_test_sign` (non-example): For the elliptic orbit at z=i, the negative twist returns span(0,1); the positive twist would give span(2i,1).

Acceptance: For an exact nilpotent orbit the untwisted map is constant F∞. When all L_i vanish, untwisting leaves Φ unchanged.

Source support: Schmid, Theorem4.12 pp.232–233; proof §8 pp.277–293 — The untwisted map extends holomorphically; its boundary value generates a horizontal orbit entering D sufficiently deep.; BKT, §4.2 pp.928–929 — The lifted period map factors through its untwisted holomorphic boundary map..

### untwistedExtension — Holomorphic boundary extension of the untwisted map

Node `HodgeStructuresPartII:H.6/untwisted-extension` (theorem). For the unipotent normalized integral polarized variation, Ψ extends uniquely holomorphically to the full local polydisc with target Dcheck. Its limiting value F∞(w)=Ψ(0,w) has the prescribed filtration ranks and Q-orthogonality. After shrinking in w and the degenerating coordinates, the extended flags are the Hodge subbundles of the unipotent H.2 canonical extension. For restricted-analytic consumers use a still smaller polydisc whose closure is in this holomorphic domain; finite angular charts cover the integer-translation seams.

The proof or construction proceeds as follows. Use Schmid §8 horizontal metric estimates and removable-singularity argument, with Hartogs for the higher-codimension boundary. Apply the universal subbundle API of Dcheck and identify the logarithmic frame with H.2 by its nilpotent residues and uniqueness. Choose an inner closed buffer; angular seams are handled by overlapping representatives and the already proved integer-periodicity.

Direct inputs: `untwisted-map`, `HodgeStructuresPartII:H.2/filtered-extension`, `HodgeStructuresPartII:H.2/canonical-extension-unique`, `ComplexComparisonPartII:C0`, `HodgeStructuresPartII:H.3`.

Acceptance: The limit need not be a pure Hodge structure in D. Restricted analyticity is asserted only on a buffered chart, never on an unbuffered open unit polydisc.

Source support: Schmid, Theorem4.12 pp.232–233; proof §8 pp.277–293 — The untwisted map extends holomorphically; its boundary value generates a horizontal orbit entering D sufficiently deep..

### nilpotentOrbitTheorem — Multivariable nilpotent orbit theorem

Node `HodgeStructuresPartII:H.6/nilpotent-orbit-theorem` (theorem). The limiting flags F∞(w) of untwistedExtension give nilpotent orbits Θ(z,w)=exp(Σz_iL_i)F∞(w). On each compact nondegenerating parameter set in an inner chart there is a common depth Y with Θ∈D whenever all Im z_i>Y; the orbit is horizontal. The orbit approximates Φ in the invariant period-domain distance by a bound C(∏_i Im z_i)^β Σ_i exp(−2π Im z_i), after unipotent normalization and sufficiently deep coordinates. The bound’s polynomial factor is retained; it alone does not imply uniform closeness in a region with arbitrarily separated heights.

The proof or construction proceeds as follows. Use the full Schmid §8 extension, horizontal and metric approximation argument with its compact w-buffer. For multivariable D-entry use Kashiwara §4.1’s convexity of the horizontal pseudoconvex tube; do not rely solely on the separated-height error bound.

Direct inputs: `untwisted-extension`, `nilpotent-orbit`, `HodgeStructuresPartII:H.3`.

Acceptance: When n=1 this recovers Schmid Theorem4.9. For L_i=0, the limiting flag lies in D.

Source support: Schmid, Theorem4.12 pp.232–233; proof §8 pp.277–293 — The untwisted map extends holomorphically; its boundary value generates a horizontal orbit entering D sufficiently deep.; Kashiwara, §4.1 pp.870–872 and §§4.3–4.4 pp.872–875 — The horizontal pseudoconvex tube argument supplies the multivariable domain-entry step and the norm comparison proof..

### finiteMonodromyExtension — Extension with finite monodromy

Node `HodgeStructuresPartII:H.6/finite-monodromy-extension` (theorem). If every coordinate monodromy of the local integral polarized variation has finite order, the normalization cover kills all L_i. Then Ψ=Φ on that cover extends into D across the SNC boundary, including partial boundary strata. The original quotient-valued period map descends continuously/holomorphically through the finite group quotient with its supplied analytic quotient structure; local liftability downstairs is not asserted at ramification points.

The proof or construction proceeds as follows. Kill the finite coordinate monodromies. Apply zero-generator D-entry at each boundary stratum and holomorphicity of the extended map; descend through the supplied finite quotient.

Direct inputs: `unipotent-normalization`, `nilpotent-orbit-theorem`, `HodgeStructuresPartII:H.3`, `ComplexComparisonPartII:C0`.

Acceptance: For identity monodromy there is a holomorphic local extension into D without a cover. Finite nonidentity monodromy does not force a locally liftable extension downstairs.

Source support: Schmid, Corollary4.11 p.232 and Theorem4.12 pp.232–233 — Killing finite monodromy makes the principal term a domain point; the downstairs map need not be locally liftable..

## Weights, limits and simultaneous decompositions

### nilpotentConeWeights — Constancy and relative faces of cone weights

Node `HodgeStructuresPartII:H.6/cone-weights` (theorem). For a polarized nilpotent orbit and any nonempty subset J of its generators, the centered monodromy filtration W(L) for L=Σ_{i∈J}a_iL_i with every a_i>0 is independent of those coefficients; denote it W(J), centered at zero. It is characterized by L W_ℓ⊂W_{ℓ−2} and L^r:gr^W_r≃gr^W_{−r}. For disjoint cone faces the successive filtration is the relative monodromy filtration of the combined face. Empty J has the filtration concentrated in degree zero. Generic existence, uniqueness, scaling and centralizer preservation of W belong to LPV.1.

The proof or construction proceeds as follows. Use the generic monodromy filtration supplier on one positive combination. Apply CK’s real-splitting/cone proof: regular combinations have constant W; the polarized real-split orbit extends it across the whole open cone. Apply the same argument on every face and the relative-filtration characterization.

Direct inputs: `nilpotent-orbit`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Acceptance: Multiplying a nonzero generator by a positive scalar leaves W unchanged. The vertex L=0 can have a different filtration from the open cone; coefficients equal to zero are treated as faces.

Source support: CK, Theorem3.3 and proof pp.113–114; §§2.16–2.20 pp.109–112 — The real splitting and cone argument extend the generic weight filtration throughout every open face and identify relative faces.; Kashiwara, Theorem2.3.4 p.863 — Records the cone-independence and relative-filtration consequences used in the estimates..

### limitingMixedHodge — Polarized limiting mixed Hodge structure

Node `HodgeStructuresPartII:H.6/limiting-mhs` (theorem). For a weight-k polarized nilpotent orbit and L in the full positive cone, set W_lim,m=W(full)_{m−k}. Then (V_ℚ,W_lim,F∞) is a native rational mixed Hodge structure, independent of the positive coefficients. L is a (−1,−1) morphism and the primitive part of gr^W_lim_{k+r} is polarized by the primitive form obtained from Q and L^r with the inherited weight-k sign convention. Purity has weight k+r, not the centered index r. The one-variable admissible mixed construction belongs to H.2; this node proves the pure multivariable specialization and primitive polarization.

The proof or construction proceeds as follows. Restrict the orbit to a one-variable positive cone ray, with the other parameters fixed by the orbit structure. Apply Schmid’s limiting-MHS and primitive-polarization proof; transport the centered W by the weight-k shift. Use cone constancy to identify the rational filtration for different rays.

Direct inputs: `cone-weights`, `HodgeStructuresPartII:H.2/limit-mhs`, `tauceti:TauCeti.Hodge.MixedHodgeStructure`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure`.

Acceptance: With all L_i=0 the result is the original pure weight-k structure. A Tate twist shifts the actual graded weights by twice the twist while centered norm indices remain unchanged.

Source support: Schmid, Theorem6.16 p.255; proof pp.256–263 — The SL2 representation decomposition gives opposed graded filtrations, weight lowering and primitive polarization.; CK, §3, pp.112–114 — Positive cone constancy permits the same limiting filtration for each positive combination..

### logarithmsTypeMinusOne — All logarithms lower the limiting MHS by (−1,−1)

Node `HodgeStructuresPartII:H.6/logarithms-type` (theorem). For the full-cone limiting MHS, each individual rational logarithm L_i preserves the limiting Deligne bigrading with degree (−1,−1): L_i I^{p,q}⊂I^{p−1,q−1}, and lowers W_lim by two. Therefore the adjoint endomorphism L_i lies in g^{−1,−1} for the induced mixed Hodge structure on Lie G. Every endomorphism commuting with a partial-sum logarithm preserves its centered W by LPV.1 uniqueness/naturality; this includes the horizontal correction coefficients used below.

The proof or construction proceeds as follows. Use the polarized mixed cone structure and linearity in the cone generators, not just the assertion for a single sum. Apply functoriality of the native Deligne splitting to L_i:V→V(−1). Apply generic W uniqueness for the centralizer statement.

Direct inputs: `limiting-mhs`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.deligneSplitting`.

Acceptance: The degree lowers actual weight by two, independent of the pure weight k. Commuting with only an unrelated generator does not imply preserving every face filtration.

Source support: CK, Theorem3.3 pp.113–114 and real-splitting argument §2.20 pp.111–112 — Each cone generator is a mixed-Hodge morphism of degree (−1,−1).; BKT, §4.4 pp.930–932, Lemma4.10 and proof — A negative-Lie lift and its triangular horizontal correction yield exponential decay on ordered sectors; normalization and lower-bound depth are retained explicitly..

### hodgeWeightDistributive — Distributivity of the limiting Hodge and weight filtrations

Node `HodgeStructuresPartII:H.6/distributive-family` (theorem). Fix an ordering and W^j=W({1,…,j}), each centered at zero. The finite families of filtration subspaces generated by F∞ and W^1_ℂ,…,W^n_ℂ are distributive under sum and intersection. The rational weight family alone is distributive over ℚ. Distributivity is a property of the subspace lattice generated by all steps, not merely pairwise compatibility (any two finite flags can split).

The proof or construction proceeds as follows. Use CK’s real-splitting transform commuting with all generators, so it preserves every W^j. On the real-split limit use the two grading operators and inductively split the remaining face filtrations in their simultaneous eigenspaces. Transport back the family and use rationality for the weight-only family.

Direct inputs: `cone-weights`, `logarithms-type`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Acceptance: Three distinct lines in a two-dimensional space give a nondistributive family and cannot be substituted for this theorem. Reversing the order recovers Kashiwara’s terminal-subset convention.

Source support: Kashiwara, Lemma2.4.1 pp.863–864, proof; §§1.1–1.8 pp.853–860 — A commuting real-splitting transform and eigenspace induction establish distributivity; the general distributive-filtration formalism is reused..

### simultaneousSplittings — Separate complex and rational simultaneous splittings

Node `HodgeStructuresPartII:H.6/simultaneous-splittings` (theorem). There exist finite internal decompositions V_ℂ=⊕_{p,σ}I^{p,σ} and V_ℚ=⊕_σJ^σ, where σ∈ℤ^n, such that F∞^r=⊕_{p≥r,σ}I^{p,σ}, W^j_ℂ,ℓ=⊕_{σ_j≤ℓ,p}I^{p,σ}, and W^j_ℚ,ℓ=⊕_{σ_j≤ℓ}J^σ. These are two distinct choices: I is not claimed rational or equal to J_ℂ, and neither is asserted canonical. If using BKT labels (p,q_1,…,q_n), the centered label is σ_j=p+q_j−k. Smooth parameter splittings require constant ranks of all relevant intersections. Locally along a nondegenerating parameter stratum, the holomorphic boundary factor g₀(w) from negative-lie-chart commutes with every L_i. It preserves every rational-face weight filtration after complexification and transports F₀ to F∞(w). Therefore all Hodge/face-weight intersection dimensions are locally constant. Transporting a fixed complex splitting by g₀ gives holomorphic compatible splitting subbundles; the rational weight splitting stays fixed. Both g₀ and its inverse are bounded on an inner compact buffer. Finite chart coverage of compact parameters gives uniform constants.

The proof or construction proceeds as follows. Apply the imported generic splitting theorem over ℂ to the Hodge-weight family and over ℚ to the weight family. Translate actual weights to centered labels before forming monomials. For parameters use negative-lie-chart’s commuting boundary factor g₀. Generic centralizer preservation transports each face weight filtration, so g₀ identifies every F₀/weight intersection with the corresponding F∞(w) intersection. Transport the complex splitting by this holomorphic isomorphism and retain a fixed rational splitting; compact inner buffers bound all transitions and their inverses. A finite subcover handles compact parameter sets.

Direct inputs: `distributive-family`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `mathlib:DirectSum.IsInternal`, `negative-lie-chart`.

Acceptance: In pure weight k with zero monodromy all σ_j=0. A complex Hodge piece in a nontrivial Hodge structure need not be defined over ℚ.

Source support: Kashiwara, Corollary1.8.3 p.860, proof; Definition1.8.4; Lemma2.4.1 pp.863–864 — Finite distributive families on semisimple vector spaces admit a simultaneous internal splitting.; BKT, §4.4 p.931 — Uses a Hodge-adapted complex splitting and a separate rational weight splitting.; BKT, §4.4 p.931 and Lemma4.10 proof p.932, together with Schmid Theorem4.12 pp.232–233 — The fixed negative-Lie chart and horizontal boundary equation imply a commuting parameter-boundary factor; its transport gives the local constant-rank parameter adapter used here..

## Horizontal correction and Hodge norm estimates

### negativeLieCorrection — Negative-Lie correction chart

Node `HodgeStructuresPartII:H.6/negative-lie-chart` (construction). For a fixed marked limiting flag F₀, let q₋=⊕_{p<0,q}g^{p,q}, a complement to the flag stabilizer F⁰g. The map v↦exp(v)F₀ is a holomorphic compact-dual big-cell chart at zero. After shrinking and choosing an inner closed buffer, the untwisted extension has a unique jointly holomorphic chart lift v̂(q,w)∈q₋ with Ψ(q,w)=exp(v̂(q,w))F₀ and v̂(0,w₀)=0. Its boundary value v₀(w)=v̂(0,w) need not vanish. Horizontality at q=0 forces g₀(w)=exp(v₀(w)) to commute with all L_i. Factoring ĝ(q,w)=g₀(w)b(q,w), one has b(0,w)=1 and Φ=e^{Σz_iL_i}g₀(w)b(q,w)F₀. Equivalently use the centered correction g=g₀bg₀^{-1} on F∞(w)=g₀F₀, so Φ=e^{Σz_iL_i}gF∞(w). For a fixed parameter its logarithm lies in the transported negative complement and vanishes at q=0. A varying native Deligne complement is not asserted holomorphic in w.

The proof or construction proceeds as follows. Use the adjoint native Deligne splitting at the single base flag and the H.3 compact-dual tangent/stabilizer chart supplier. Invert the fixed exponential chart jointly in q,w on a sufficiently small neighborhood, retaining the potentially nonzero boundary coefficient v₀(w). Evaluate horizontality at q=0. Since L_i has degree (−1,−1) and v₀ has negative first degree, the prohibited degrees below −1 force [L_i,v₀]=0. Factor out g₀, then shrink to a compact holomorphic buffer.

Direct inputs: `untwisted-extension`, `limiting-mhs`, `HodgeStructuresPartII:H.3`, `mathlib:NormedSpace.exp`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.deligneSplitting`.

The reusable interface serves these uses: BKT Lemma4.10 p.932 — the horizontal equations force a triangular exponentially small correction; H.7 Gram determinant formulas and sector-lift-definable — requires the genuine analytic coefficient on a compact buffer.

| Declaration | Role | Required behavior |
|---|---|---|
| `negativeLieCorrection.exp_zero` | simp | At v=0 the correction matrix is the identity. |
| `negativeLieCorrection.lift` | data | In the fixed joint chart, Ψ(q,w)=exp(v̂(q,w))F₀; in the centered representation it is g(q,w)F∞(w). |
| `negativeLieCorrection.unique` | characterisation | Within the chosen negative-Lie chart, two corrections representing the same flag are equal; arbitrary stabilizer gauges outside it are excluded. |
| `negativeLieCorrection.boundary` | projection | The centered correction satisfies v(0,w)=0 and g(0,w)=1; the fixed-chart boundary coefficient v̂(0,w)=v₀(w) can be nonzero. |
| `negativeLieCorrection.gamma` | constructor | The centered moving frame is exp(Σz_iL_i)g(q,w) based at F∞(w); the fixed-chart frame is exp(Σz_iL_i)g₀(w)b(q,w) based at F₀. |
| `negativeLieCorrection.buffer` | compatibility | Restriction to an inner compact buffer retains holomorphic extension beyond its closure; no restricted-analytic assertion is made at the original outer boundary. |

The definition tests distinguish the intended object from tempting alternatives:

- `negativeLieCorrection_test_zero` (degenerate): At v=0 the matrix is 1.
- `negativeLieCorrection_test_square_zero` (computation): For v²=0, exp(v)=1+v.
- `negativeLieCorrection_test_nonidentity` (non-example): For v=[[0,1],[0,0]], exp(v) is not the identity.

Acceptance: For a pure nilpotent orbit v=0 and g=1. The complement uses p<0, not p+q<0. A joint fixed chart can have v₀(w)≠0; it is not confused with the centered correction.

Source support: BKT, §4.4 pp.930–932, Lemma4.10 and proof — A negative-Lie lift and its triangular horizontal correction yield exponential decay on ordered sectors; normalization and lower-bound depth are retained explicitly.; BKT, §4.4 p.931, paragraph preceding Lemma4.7 — The negative Hodge degrees give a complement to the stabilizer and a holomorphic lift..

### horizontalCorrection — Horizontal triangular correction with the 2πi factor

Node `HodgeStructuresPartII:H.6/horizontal-correction` (theorem). For γ=e^{Σz_iL_i}g(q), q_i=e^{2πiz_i}, the left Maurer–Cartan horizontality condition is g^{-1}L_i g+2πi q_i g^{-1}∂_{q_i}g∈F^{−1}g_C, based at F∞. With v=log g in q_-, its holomorphic expansion admits v(q)=Σ_i q_i v_i(q_i,…,q_n), with [L_j,v_i]=0 for j<i. Hence the corresponding correction pieces preserve W^j for j<i. The equations use the analytic differential of exp at ad v, continued across its apparent removable singularity; they are not evaluated by division by a possibly noninvertible ad v. For a joint fixed chart first separate v₀(w) and the commuting g₀(w); the triangular expansion is for the centered coefficient b, transported by g₀ to the centered frame. It is not asserted that the uncentered fixed-chart coefficient vanishes along the entire parameter stratum.

The proof or construction proceeds as follows. Differentiate q_i=e^{2πiz_i} before forming γ^{-1}dγ; this gives the missing printed factor. In the fixed joint chart first evaluate at q=0 to show [L_j,v₀(w)]=0, then remove g₀(w). Apply the negative-degree complement argument to the centered coefficient at q₁=⋯=q_{i−1}=0; it forces the earlier commutators to vanish. Apply centralizer preservation of W and the triangular expansion used in BKT Lemma4.10.

Direct inputs: `negative-lie-chart`, `logarithms-type`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Acceptance: At g=1 the equation reduces to L_i∈F^{−1}g. Deleting 2πi gives an incorrect chain-rule equation, even for a scalar exponential correction.

Source support: BKT, §4.4 pp.930–932, Lemma4.10 and proof — A negative-Lie lift and its triangular horizontal correction yield exponential decay on ordered sectors; normalization and lower-bound depth are retained explicitly..

### flatNormEstimate — Splitting-independent flat squared-norm estimate

Node `HodgeStructuresPartII:H.6/flat-norm-estimate` (theorem). Under the stated ordered-sector and compact-family hypotheses, for every compatible simultaneous splitting (complex I or complexified rational J), there are constants 0<c≤C and a depth Y such that cΣ_σ m_σ(y)|u_σ|_0²≤h_Φ(z,w)(u,u)≤CΣ_σ m_σ(y)|u_σ|_0² for every u, where u_σ are the components in that splitting. m_σ(y)=(y_1/y_2)^{σ_1}⋯(y_{n−1}/y_n)^{σ_{n−1}}y_n^{σ_n}, with integer centered weights; when n=0 use m=1. Constants may depend on the chosen splitting, width and compact set, but not on z,w,u. Any nonzero homogeneous u has a two-sided monomial bound. This is a squared norm; the ordinary norm has half these exponents.

Hypotheses in addition to the stated carrier data: A fixed polarized nilpotent orbit or its associated local variation, unipotent normalization, bounded |Re z_i|≤R. Ordered heights y_1≥⋯≥y_n≥Y>0; fixed finite compatible splitting and fixed positive reference norm. For uniform compact parameters: a common domain-entry buffer, constant dim(F∞^p∩⋂_{j∈J}W(J)_ℓ) for every relevant subset and indices, and continuous/smooth compatible splitting data bounded on the compact set.

The proof or construction proceeds as follows. Use Kashiwara’s compact-family nilpotent-orbit induction, reversing terminal-subset ordering to our initial-subset ordering. Use §§4.1–4.4 to transfer to the actual variation on a deep local chart. Apply Corollary1.9.2 to every compatible splitting: lower-weight components have bounded monomial ratios on the ordered sector; finite sums of ordinary norms and their squared sums are equivalent.

Direct inputs: `nilpotent-orbit-theorem`, `simultaneous-splittings`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm_eq_conj`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm_self_pos`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `tauceti:TauCeti.Hodge.Polarization.hodgeInnerProductCore`.

Acceptance: For a constant pure variation every centered σ is zero, giving uniform comparison with a fixed norm. The zero vector satisfies both summed inequalities; it cannot be used in a nonvanishing roughly-monomial assertion.

Source support: Kashiwara, Corollary1.9.2 p.861; Theorem2.4.2 p.864 and Theorem3.4.1 p.870; proofs §§2.4–2.6 and4 pp.864–875 — Induction gives the norm on graded directions and lower-triangular changes make the estimate independent of the splitting..

### movingNormEstimate — Splitting-independent transported squared-norm estimate

Node `HodgeStructuresPartII:H.6/moving-norm-estimate` (theorem). With the same hypotheses, splitting and m_σ(y)=(y_1/y_2)^{σ_1}⋯(y_{n−1}/y_n)^{σ_{n−1}}y_n^{σ_n}, with integer centered weights; when n=0 use m=1. there are positive c,C and a depth Y such that cΣ_σm_σ(y)|u_σ|_0²≤h_Φ(z,w)(e^{Σz_iL_i}u,e^{Σz_iL_i}u)≤CΣ_σm_σ(y)|u_σ|_0² for every u. On the actual canonical-extension bundle the same assertion holds for smooth splitting sections, with their pointwise reference norms. The moving norm is not computed in a fixed limiting degenerate Hermitian form; it uses the positive Hodge metric at Φ(z,w).

Hypotheses in addition to the stated carrier data: A fixed polarized nilpotent orbit or its associated local variation, unipotent normalization, bounded |Re z_i|≤R. Ordered heights y_1≥⋯≥y_n≥Y>0; fixed finite compatible splitting and fixed positive reference norm. For uniform compact parameters: a common domain-entry buffer, constant dim(F∞^p∩⋂_{j∈J}W(J)_ℓ) for every relevant subset and indices, and continuous/smooth compatible splitting data bounded on the compact set.

The proof or construction proceeds as follows. Use Corollary2.4.3 for the nilpotent-orbit moving frame. Identify the unipotent canonical-extension frame via H.2; apply Theorem3.4.2 in smooth splitting coordinates. Transfer between fixed splittings by the same triangular-weight argument; ensure splitting transitions and their inverses are bounded on the compact parameter set.

Direct inputs: `flat-norm-estimate`, `simultaneous-splittings`, `HodgeStructuresPartII:H.2/canonical-extension`.

Acceptance: For an elliptic rank-two orbit the centered weights −1 and +1 give y^{-1} and y. This does not require a rational Hodge-adapted splitting.

Source support: Kashiwara, Corollary2.4.3 p.864, Theorem3.4.2 p.870 and proof §4 pp.870–875 — Controls transported vectors and arbitrary smooth splitting sections of the canonical extension, uniformly near the boundary..

### exteriorPowerEstimates — Exterior-power and determinant norm estimates

Node `HodgeStructuresPartII:H.6/exterior-power-estimates` (theorem). For each r≥0 the induced pure polarized variation on Λ^rV satisfies both flat and moving squared-norm estimates in the induced simultaneous splitting. The centered weight of a wedge of components is the coordinatewise sum of their σ labels. Its Hermitian squared norm is det(h(u_i,u_j)), with the native conjugate-first convention; the diagonal determinant agrees with the conjugate-second convention. Constants depend on r and the compact data. Λ^0 has weight zero and unit norm; wedges of more than dim V vanish and are excluded from nonzero homogeneous conclusions.

The proof or construction proceeds as follows. Reuse the native pure tensor Hodge structure. Import LPV.1’s generic induced monodromy filtrations and H.2’s polarized exterior-variation/Gram-metric compatibility; the actual weight rk stays separate from centered indices. Apply the two norm theorems to the induced variation; identify the induced Hodge metric with the Gram determinant.

Direct inputs: `flat-norm-estimate`, `moving-norm-estimate`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm_eq_conj`, `tauceti:TauCeti.Hodge.HodgeStructureOn.tensorProduct`, `HodgeStructuresPartII:H.2`.

Acceptance: For r=0 the monomial is 1. A linearly dependent tuple has zero Gram determinant, and is not roughly monomial.

Source support: Kashiwara, §§1.9,2.4 and3.4 pp.860–864,870 — The finite-dimensional estimates apply after functorial tensor/exterior construction.; BKT, Lemma4.7 proof pp.931–932 — Wedge norms give the determinant monomials needed for matrix entries; the stronger arbitrary-splitting estimate is necessary..

### perturbedNormComparison — Deep-height horizontal perturbation comparison

Node `HodgeStructuresPartII:H.6/perturbed-norm-comparison` (theorem). For the horizontal negative-Lie correction and fixed R, compact parameter data and compatible splittings as above, there exist Y,c,C>0 such that for all ordered y_1≥⋯≥y_n≥Y and all u, c h_Φ(e^{Σz_iL_i}u,e^{Σz_iL_i}u)≤h_Φ(γu,γu)≤C h_Φ(e^{Σz_iL_i}u,e^{Σz_iL_i}u). The assertion holds in every induced exterior power. The lower bound requires depth; it is not deduced by declaring the region with one shallow and one unbounded logarithmic coordinate compact.

Hypotheses in addition to the stated carrier data: A fixed polarized nilpotent orbit or its associated local variation, unipotent normalization, bounded |Re z_i|≤R. Ordered heights y_1≥⋯≥y_n≥Y>0; fixed finite compatible splitting and fixed positive reference norm. For uniform compact parameters: a common domain-entry buffer, constant dim(F∞^p∩⋂_{j∈J}W(J)_ℓ) for every relevant subset and indices, and continuous/smooth compatible splitting data bounded on the compact set.

The proof or construction proceeds as follows. Use v=Σq_iv_i and the centralizer relations so each correction piece contributes only polynomial factors in y_i,…,y_n after weighted conjugation. Bound |q_i|=exp(−2πy_i); on the ordered sector, exponential decay dominates all finitely many such tail monomials uniformly once y_n is large. Make the correction’s operator norm smaller than 1/2 in the transported Hodge norm; the triangle inequality yields both bounds. Apply the same argument on each exterior power.

Direct inputs: `horizontal-correction`, `moving-norm-estimate`, `exterior-power-estimates`, `mathlib:Complex.norm_exp`.

Acceptance: When v=0 the two forms agree exactly. The estimate does not assert a lower bound at the original outer radius.

Source support: BKT, §4.4 pp.930–932, Lemma4.10 and proof — A negative-Lie lift and its triangular horizontal correction yield exponential decay on ordered sectors; normalization and lower-bound depth are retained explicitly..

## One-variable arithmetic containment

### oneVariableSL2 — Rational one-variable SL2 asymptotics

Node `HodgeStructuresPartII:H.6/one-variable-sl2` (theorem). For a polarized rational nilpotent orbit with integral lattice and a one-variable horizontal period lift, Schmid’s rational SL2 construction gives a rational parabolic P, split torus with grading Y, and real-analytic horospherical factors r(x,y),t(x,y),m(x,y),k(x,y) for y>Y_0. On each bounded real interval their unipotent and M·K factors are relatively compact, and t(x,y) is asymptotic to exp(−(log y)Y/2) with positive root coordinates bounded below in the P convention. The period point is rtmk·o for the SL2 reference point o. In the case L=0, the deep image is relatively compact instead of tending along a nonzero grading.

The proof or construction proceeds as follows. Use the rational SL2 embedding from the polarized limiting structure; Schmid §9 constructs its real-analytic correction by the differential equations and convergent expansion. Use §9.60 and §9.68 to control the parabolic factors and the negative grading weights; apply Theorem5.26 uniformly in bounded x. For L=0 use the compact limiting extension.

Direct inputs: `nilpotent-orbit-theorem`, `limiting-mhs`, `HodgeStructuresPartII:H.3`, `AdelicAlgebraicGroups:AA.3/real-siegel-set`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Acceptance: A rank-two elliptic orbit has the standard split torus growth. This is the one-variable theorem, not the multivariable finite Siegel theorem owned by H.7.

Source support: Schmid, Theorem5.19, Lemma5.25, Theorem5.26 pp.242–245; full proof §9 pp.293–319 — Rational graded representation, convergent correction expansions and root-weight bounds give the horospherical asymptotic..

### oneVariableSiegel — One-variable finite Siegel containment for fixed compact

Node `HodgeStructuresPartII:H.6/one-variable-siegel` (theorem). Fix the canonical maximal compact K determined by the Hodge metric at the marked reference point of D, with period stabilizer M⊂K. For a one-variable integral polarized local period lift and R≥0, there is a depth buffer Y such that its image for |Re z|≤R, Im z≥Y lies in finitely many Siegel sets in G/M associated to this same K. For any positive lower height η lying inside a holomorphic outer buffer, the remaining bounded-height rectangle has compact image and can be covered by finitely many additional fixed-K Siegel sets; hence the whole buffered strip has finite containment. The H.3 canonical metric/Cartan and AA.3 fixed-K transport adapters are required, not arbitrary changes of K.

The proof or construction proceeds as follows. Apply Schmid’s compact horospherical bounds and positive root estimate for the SL2 reference compact. Use the requested Hodge-metric representation comparison and fixed-K reduction dictionary to transport to the canonical K; leave this adapter as an explicit gap until proved. Within the outer analytic buffer the bounded-height complement is compact; use local coverage by fixed-K Siegel sets and compactness for a finite cover.

Direct inputs: `one-variable-sl2`, `HodgeStructuresPartII:H.3`, `AdelicAlgebraicGroups:AA.3/real-siegel-set`, `AdelicAlgebraicGroups:AA.3/siegel-convention-comparison`, `AdelicAlgebraicGroups:AA.3/orbit-map-siegel-preimage`, `AdelicAlgebraicGroups:AA.3/reduction-siegel-dictionary`.

Acceptance: For zero monodromy a buffered strip has relatively compact image. No blanket claim is made that changing maximal compact preserves the chosen definable quotient structure.

Source support: Schmid, Corollary5.29 and proof p.245, via Theorem5.26 pp.244–245 — The deep bounded-width image is in a Siegel set for the compatible SL2 reference compact.; BKTerr, pp.1–4, corrected Definition2.5 and representation compatibility — All arithmetic quotient structures and containment maps keep a fixed compatible maximal compact..

### powerCurveNormalization — Rational slope curves reduce to one-variable degeneration

Node `HodgeStructuresPartII:H.6/power-curve-normalization` (application). For a curve q_i=c_i t^{a_i} with rational a_i≥0, nonzero c_i and remaining analytic parameters confined to an inner compact buffer, choose a positive denominator-clearing cover t=s^d. The positive exponents da_i give commuting combined logarithm L_curve=Σ_i da_iL_i and one-variable weight-k polarized degeneration. Zero exponents remain nondegenerating compact parameters, not boundary directions. Its period lift has finite fixed-K Siegel containment on every buffered bounded-width positive-height strip by oneVariableSiegel. This is the Hodge adapter to the curve test; existence/definability of the curve family and the multivariable uniform containment remain in LD.6/H.7.

The proof or construction proceeds as follows. Clear the finitely many rational denominators; pull back the variation and record the e-fold winding in each positive coordinate. Use cone weights on the corresponding face and the fixed-K one-variable theorem. Keep nondegenerating coordinates away from the outer boundary and the angular representatives in bounded-width charts.

Direct inputs: `unipotent-normalization`, `cone-weights`, `one-variable-siegel`.

Acceptance: For slopes (1/2,0), a square cover yields one logarithm L_1 while the second coordinate stays fixed. A negative slope leaves the local punctured-disc chart and is excluded.

Source support: Schmid, Corollary5.29 p.245 — Applies to the pulled-back one-variable polarized variation.; BKT, §4.5 p.933, curve test using Schmid — Rational slopes require a finite power cover before invoking the one-variable theorem..

## Closure and supplier work

The graph plans every stage target and recursively terminates in checked baseline statements, named external nodes or the following recorded gaps. Existing packets are plans; their review or implementation status is not promoted by citing them. The H.6 requests are represented in this packet for assembly and supplier follow-up; no other worker's files are changed.

### G1 — Analytic semistable log and derived comparison boundary

C0/C3/C5 need the precise analytic log/nearby-cycle and proper comparison extensions in the requests. Suggested Lean represents the semistable normal form, connection in a local frame, and marked fibre linear maps only; the global atlas, properness, log sheaves, derived triangles, cohomology identifications, and semistable modification invariance are omitted. None is encoded by an arbitrary proposition field.

Affected nodes: `semistable-log-model`, `relative-log-forms`, `wedge-triangle`, `log-cohomology-basechange`, `log-gauss-manin`, `special-residue`, `semistable-betti`, `equivariant-comparison`, `ramified-residue`.

### G2 — Native variation and period geometry carrier boundary

H.2/H.3 native variation/manifold and compact-dual analytic tangent APIs are not built at the pin. Suggested Lean uses genuine integer-indexed complex submodules, matrices, analytic coordinate functions and supplied domain subsets as local representatives. Rational/integral structures, fixed-polarization domain constraints and global analytic flag maps are omitted where stated in the Lean comments; the packet supplies their exact mathematical hypotheses.

Affected nodes: `quasi-unipotence`, `unipotent-normalization`, `nilpotent-orbit`, `untwisted-map`, `untwisted-extension`, `nilpotent-orbit-theorem`, `finite-monodromy-extension`, `negative-lie-chart`, `horizontal-correction`.

### G3 — Generic monodromy and filtration supplier extensions

LPV.1 has no finer node for all the requested finite-log, relative-weight, distributive-family and exterior-power assertions. Its generic linear-algebra scope needs the extensions listed in restructure. Suggested Lean accepts real typed filtrations and finite decompositions as supplier data; it does not build the native limiting MHS or its primitive polarization.

Affected nodes: `unipotent-normalization`, `ramified-residue`, `cone-weights`, `limiting-mhs`, `logarithms-type`, `distributive-family`, `simultaneous-splittings`, `exterior-power-estimates`.

### G4 — Native compact-family splitting and metric interface

The mathematical local constant-rank adapter is proved in simultaneous-splittings using negative-lie-chart’s commuting boundary factor g₀(w): it preserves all face weights and transports F₀, hence every relevant intersection. Compact buffers and a finite cover give uniform bounds. What is missing is the native analytic splitting-subbundle/positive-Hodge-metric interface representing this transport and the common-depth compact family in Lean. H.2/H.3 must supply the global carriers. Suggested Lean uses fixed-coordinate projections and omits the actual parameter-family/bundle specifications; elaboration does not supply these interfaces.

Affected nodes: `simultaneous-splittings`, `negative-lie-chart`, `flat-norm-estimate`, `moving-norm-estimate`, `exterior-power-estimates`, `perturbed-norm-comparison`.

### G5 — Fixed canonical compact in the one-variable arithmetic adapter

Schmid Corollary5.29 is proved for its compatible SL2 reference compact. H.3/AA.3 must supply the precise canonical Hodge-metric representation and fixed-K transport/compact coverage request. The original erratum forbids assuming arbitrary-K invariance. Until this adapter is proved the canonical-K version and H.7 curvewise-reducedness input are planned, not closed. Suggested Lean uses supplied actual sets of group matrices, omitting their Siegel/Cartan specifications.

Affected nodes: `one-variable-sl2`, `one-variable-siegel`, `power-curve-normalization`.

### Precise requests

- **ComplexComparisonPartII:C0**: Analytic divisor-log charts and sheafification of the CR.5 universal log differentials and relative log complex; finite analytic quotients and universal-cover descent. Supply comparison on a proper smooth total space with reduced SNC central fibre, not an arbitrary algebraic-DVR chart alone. Consumers: semistable-log-model, relative-log-forms, untwisted-map, finite-monodromy-extension.
- **ComplexComparisonPartII:C5**: Proper semistable analytic log de Rham hypercohomology is locally free/base-change compatible, and its central log-point complex compares naturally with nearby cycles, including the wedge-dlog triangle and residue sign. The existing proper smooth/log modular-curve nodes do not cover this general semistable theorem. Include reduced semistable local nearby-cycle unipotence and the equivariant proper nearby-cycle spectral sequence used to deduce nilpotence of the geometric residue. Consumers: wedge-triangle, log-cohomology-basechange, semistable-betti, special-residue.
- **ComplexComparisonPartII:C3**: Proper log de Rham analytification/GAGA and base-change compatibility for the semistable complexes used by Qian, including invariance of the comparison under a semistable modification of a ramified model. Consumers: log-cohomology-basechange, ramified-residue.
- **LefschetzPencilsAndVanishingCycles:LPV.1**: General characteristic-zero finite logarithm of a unipotent operator, commutation/naturality, rational isometry logarithms, centered monodromy filtrations, scalar preservation of Jordan index, relative filtration and centralizer preservation. Also supply distributive-family simultaneous splitting, constant-rank bundle splitting and tensor/exterior-power filtration compatibility. Finite nilpotent exponential itself is already Mathlib and must not be recreated. Consumers: ramified-residue, unipotent-normalization, cone-weights, logarithms-type, distributive-family, simultaneous-splittings, exterior-power-estimates.
- **HodgeStructuresPartII:H.3**: Analytic compact-dual tangent/stabilizer and exponential negative-Hodge-degree chart, invariant distance and horizontal curvature facts, adjoint Hodge-metric canonical Cartan involution, and the compatible faithful rational representation adapter for transporting Schmid one-variable Siegel containment to the fixed canonical K. Existing H.3 point/orbit nodes alone do not provide these. Consumers: quasi-unipotence, untwisted-extension, nilpotent-orbit-theorem, negative-lie-chart, one-variable-sl2, one-variable-siegel.
- **AdelicAlgebraicGroups:AA.3**: For the Hodge-metric representation and its canonical Cartan-compatible fixed K, prove the precise transport from the SL2 reference compact’s one-variable metric estimates to fixed-K finite Siegel containment, including compact-set finite coverage; do not use arbitrary-K invariance. The existing orbit-map and reduction dictionary are inputs, not the full adapter. Consumers: one-variable-siegel.
- **HodgeStructuresPartII:H.2**: Provide global analytic PVHS/canonical-extension carriers with multivariable filtration subbundles and parameter-compatible logarithmic frames. Supply the analytic subbundle, pullback and metric interfaces in which H.6’s commuting-boundary-factor transport can express its holomorphic compatible splittings, constant intersection ranks and compact bounded transitions. The local rank theorem itself is proved in H.6, not requested as a second H.2 degeneration theorem. Also supply polarized exterior-power variations and their induced Gram-determinant metric, building on native HodgeStructureOn.tensorProduct and Polarization.hodgeInnerProductCore; LPV.1 supplies only the generic induced weight filtration. Consumers: untwisted-extension, simultaneous-splittings, flat-norm-estimate, moving-norm-estimate, negative-lie-chart, exterior-power-estimates.

LPV.1 receives a rescope proposal for generic relative filtrations, distributive-family splitting and exterior functoriality. This is generic linear algebra used beyond Hodge degeneration. H.6 retains the polarized-cone/Hodge applications and does not provide competing generic definitions. The existing finite nilpotent exponential stays in Mathlib. No new stage or packet outside this job is edited.

## Source corrections and checks

The source findings are restatements of existing extraction findings with the relevant mathematical corrections applied, not new priority claims. The BKT version of record is the publisher-formatted JAMS PDF; the official four-page erratum was also read. Qian's source here is the separate companion preprint arXiv:2103.00106v1, not the published Potential Automorphy paper.

- **HodgeStructuresPartII/E-H6-1** (misprint, nothing): Version of record, Lemma4.10 proof p.932, Maurer–Cartan equation. The coefficient of g^{-1}∂g/∂q_i in the lifted horizontality equation is written as q_i. Replace it by 2πi q_i when q_i=exp(2πiz_i) and L_i=log T_i. The chain rule gives ∂q_i/∂z_i=2πiq_i; the missing scalar does not change the zero-coordinate commutator step. Previously recorded as PAPER-BAKKER-KLINGLER-TSIMERMAN-20/E52; not asserted new.
- **HodgeStructuresPartII/E-H6-2** (gap, the proof): Version of record, Theorem4.8 and Lemmas4.7/4.10, pp.931–932. The quoted norm theorem is expressed for a rational weight splitting, while the determinant and correction arguments apply it to a complex Hodge-adapted splitting and induced wedges. Use Kashiwara’s arbitrary-compatible-splitting squared-sum estimates, including induced exterior powers, with centered labels σ_j=p+q_j−k. Kashiwara Corollary1.9.2 transfers between splittings by lower-triangular weight changes; Theorem3.4.2 supplies smooth moving-section estimates. Previously recorded as PAPER-BAKKER-KLINGLER-TSIMERMAN-20/E49 and E54; the published Kashiwara results supply the needed stronger input.
- **HodgeStructuresPartII/E-H6-3** (gap, the proof): Version of record, Lemma4.10 proof p.932, lower-bound estimate. The lower estimate is justified by making the correction exponentially small for large final height, while its use on a full ordered unit-height sector is not justified. State the lower comparison only after a common depth threshold and shrink the polydisc; use independent arguments for buffered positive-height extension. When n≥2 a region with one bounded height and an earlier unbounded height is not compact. The tail-monomial estimate tends uniformly to zero only after taking the final height sufficiently large. Previously recorded as PAPER-BAKKER-KLINGLER-TSIMERMAN-20/E53; no additional claim of a new error.
- **HodgeStructuresPartII/E-H6-4** (gap, the proof): Companion arXiv:2103.00106v1, analytic disc choice p.21 and monodromy step p.23. The analytic family is taken over the unit disc although the algebraic model excludes (T^{de}u′)^N=1 and u′ is an arbitrary admissible unit lift. Choose an open disc of radius at most |τ(u′)|^{−1/(de)}; alternatively use a root-of-unity lift whose excluded fibres are on the outer circle. The excluded singular values all have that radius, which can be smaller than one. Restricting the disc restores properness, smooth punctured fibres and the intended loop at infinity. Previously confirmed as PAPER-QIAN-23/E49 by REV-PAPER-QIAN-23; this packet applies that reviewed correction.

The packet validator reports zero errors and zero warnings. The suggested file elaborates through the prescribed `lean-check` wrapper against the pinned Mathlib with only the expected proof-placeholder warnings. It imports Mathlib modules individually. Tau Ceti declarations were read at the recorded pin and cited as native suppliers; the prototypes use local Mathlib representatives because the required global analytic carriers and pinned Tau Ceti compiled imports are not available as a complete H.6 interface. The file has no dummy proposition fields and no proposition defined by a placeholder. Every packet declaration, API item and test has a corresponding named declaration or named example in it.

### Read source versions

- **Qian:** Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, arXiv:2103.00106v1 (2021), companion preprint; not Potential Automorphy for GL_n. [Read copy](https://arxiv.org/pdf/2103.00106v1), accessed 8 October 2026. SHA-256: `87c4ee8499f3a615a81307e17d38d6f00ab544da9d22384f213bbc06052722e9`. Read: §4 pp.21–23: full log comparison diagram, Lemma4.3 and proof; inspected Remark2.4 p.13 for the excluded fibres.
- **Illusie:** Luc Illusie, *Autour du théorème de monodromie locale, Exposé I*, Astérisque 223 (1994), pp.9–57. [Read copy](https://www.numdam.org/item/AST_1994__223__9_0.pdf), accessed 8 October 2026. SHA-256: `a81d3e6c63ea0257b1cbd58933bb863c4adad3864cc19968f56beec700670e70`. Read: §2.2.1–2.2.4 pp.18–21: chart, theorem, corollary and supplied comparison proof; §2.1.3 pp.14–15, full local nearby-cycle computation and proper spectral-sequence proof of semistable unipotence.
- **Schmid:** Wilfried Schmid, *Variation of Hodge structure: the singularities of the period mapping*, Inventiones mathematicae 22 (1973), pp.211–319; journal scan. [Read copy](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), accessed 8 October 2026. SHA-256: `26f446e0bb5fbd7635ef5d7962fca30740cc17ee8c3e821a7e3d3fef7c284836`. Read: §4 Lemma4.5 and Theorems4.9/4.12 with Corollary4.11 pp.230–233; §5.19–5.29 pp.242–245, including supplied proofs; §6 Theorem6.16 and proof pp.255–263; Full §8 pp.277–293: nilpotent orbit proof; Full §9 pp.293–319: SL2 orbit proof, rationality, compactness and parabolic analysis.
- **CK:** Eduardo Cattani and Aroldo Kaplan, *Polarized mixed Hodge structures and the local monodromy of a variation of Hodge structure*, Inventiones mathematicae 67 (1982), pp.101–115; institutional journal scan. [Read copy](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0067/LOG_0011.pdf), accessed 8 October 2026. SHA-256: `06ef76491a6a66ac2fdc4bb388c72f0d4dbc453f0edd69b70daf8b3679a66e16`. Read: Full §§1–3 pp.101–115, read on page images; Theorem3.3 and its proof pp.113–114.
- **Kashiwara:** Masaki Kashiwara, *The asymptotic behavior of a variation of polarized Hodge structure*, Publications of RIMS 21 (1985), pp.853–875; journal scan. [Read copy](https://ems.press/content/serial-article-files/42282), accessed 8 October 2026. SHA-256: `6724c820167c7c2122d3d4943c1358ec38bbf89984d512184b7d852bcf6238a6`. Read: Full §§1–4 pp.853–875, including distributivity, arbitrary-splitting comparison, induction, and curvature proof; Formula images pp.860–861,862–864,870–872 checked against text extraction.
- **BKT:** Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*, Journal of the AMS 33 (2020), pp.917–939; publisher-formatted version of record. [Read copy](https://par.nsf.gov/servlets/purl/10200187), accessed 8 October 2026. SHA-256: `b7cf457907c30c9dc1c349637e74027ce4ef038a2e0f646b7685f571d367e058`. Read: §4.2 pp.928–929 and §4.4 pp.930–932, full statements and proofs; H.7 contracts compared.
- **BKTerr:** Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, *Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci*, Author-hosted erratum, four pages. [Read copy](https://benjamin-bakker.github.io/DefArithErr.pdf), accessed 8 October 2026. SHA-256: `86d76a5d2443840ddcaf2c08966cd236759bade659e338e3fcdb3edcd2b61ac7`. Read: Entire erratum pp.1–4, fixed compact and Cartan-compatible representation conditions.

All statements and proof descriptions are in the worker’s own words. Public source files were read only in scratch; no PDF, scan or extracted text is included in these deliverables. No private reference book was needed. The six planets are Logarithmic Gauss–Manin connection, Nilpotent orbit, Nilpotent orbit theorem, Monodromy cone weight filtrations, Hodge norm estimates and One-variable Siegel containment.
