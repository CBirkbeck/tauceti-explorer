# P-adic differential equations, rigid cohomology and p-adic weights, Part II

## Purpose and endpoints

This roadmap studies how little of a convergent Frobenius object determines its overconvergent origin. A slope filtration can discard most of an object: its maximal quotient, or dually its minimal subobject, may have much smaller rank. Irreducibility and overconvergence nevertheless make this extremal piece rigid enough to recover the original object on a curve. Bounded solutions and pure bounded quotients explain the mechanism; dagger hulls express its consequence for arbitrary convergent subobjects.

The first endpoint is the specified-map theorem on a smooth connected curve over a perfect field. For irreducible overconvergent objects with slope-filtered convergent realisations, every nonzero map between their maximal-slope quotients lifts uniquely to an overconvergent isomorphism in the same direction. Duality gives the corresponding minimal-slope statement. For PBQ saturated objects, the assertion requires an isomorphism of the maximal quotients. Layer MS.4 states these alternatives precisely.

The second endpoint is the finite-field theorem on a smooth connected variety. A nonzero maximal-quotient map between irreducible overconvergent coefficients implies that the objects are isomorphic. To lift the particular map one also uses an endomorphism comparison with a curve after a finite constant extension. Layer MS.6 keeps these two conclusions distinct, and proves the coefficient-projected trace formula needed for the specified map.

The [packet](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json) carries the dependency graph, exhaustive routing, source findings and open proof/supplier contracts. All seven layers are planned with those contracts visible. The [suggested file](../suggested/PadicDifferentialEquationsAndRigidCohomologyPartII.lean) contains compact statements over carriers available at the pins. This reader is the mathematical specification.

## Coefficients and notation

Let K be a complete discretely valued characteristic-zero field with perfect residue field k of characteristic p>0. Fix q=p^s, s>0, and an isometric lift σ of q-Frobenius. The analytic fields E and E†, the bounded-disc ring K[[t]]₀, their derivations and horizontal Frobenius structures are the parent's carriers. E† is the **bounded** Robba field; the full Robba ring has a different convergence condition. Tsuzuki's curve theory also uses the completed generic field E_η of a smooth affine curve lift, a complete discretely valued field with residue field k(C), and the local fields E_α at closed points; MS.0/curve-generic-field constructs them, and the local definitions and theorems of MS.0–MS.1 are stated over E_η and E_α as well. Generic points of an affine line in D'Addezio's §4.2 have residue k(t), and their parent analytic-ring carrier is used explicitly.

A differential Frobenius module is finite, with integrable connection and invertible Frobenius linearisation. A dagger decoration denotes an overconvergent F-isocrystal; removing it means its convergent realisation. Slopes are normalised using q. The increasing slope filtration has a first minimal subobject S_min and a last maximal quotient Top; duality negates slopes and exchanges these two constructions. The Tate object O(1) has slope −1. Global slope-filtration statements either assume its existence or restrict to a dense constant-Newton open; numerical generic slopes alone do not define a global quotient.

Generic solutions are contravariant horizontal Hom spaces. Solη,0 uses a **uniform coefficient bound** on the open Taylor disc. Write Mᵇ for the least differential submodule whose quotient is bounded and B(M)=M/Mᵇ for that quotient. Thus a bounded object has Mᵇ=0 and B(M)=M. The source notation M^0 is a kernel, not a bounded subobject. PBQ means that the bounded quotient is pure, with M≠0. Zero is allowed as the initial filtration term and has B(0)=0.

The PBQ filtration is increasing, but its **grades** G_i=P_i/P_(i−1) have strictly decreasing maximal slopes. Expressions involving the pure top pieces always use G_i, not the nested terms P_i. Saturation over E† means injectivity of the original dagger module into its maximal quotient after completion. That map can have a kernel even though its E-linearisation is a surjection; the definition retains both carriers.

In MS.6, X is smooth connected over F_q and coefficients are Q̄_p, modelled by a finite coefficient field before extension. Normalised ranks and Frobenius fibres use that finite model. The tensor algebra of a constant extension is split only after enlarging the coefficient field to contain every embedding. A chosen primitive coefficient projector is part of the trace construction. Weights in the finite-field inputs are real ι-weights; an integral-weight restriction would lose the constant twists needed for irreducible coefficients.

## Existing foundations and ownership

Mathlib is pinned to 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti to f790474821cf4256814db967cb154e7af3d0c369. The actual declarations in the table below were read at those pins. The reviewed library audit has no exact entry for this continuation or its parent; its related ColemanIntegration:L0 entry is not treated as a verdict on PBQ theory. An open Mathlib PR search and indexed Zulip/community-archive searches for isocrystal, Robba, PBQ and dagger hull found no matching proposed API; their scope and date are recorded in the packet.

The current upstream roadmaps at 0d144d044dacebca17b654695b6f1ad58f159b27 and current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were also searched, including Completed roadmaps. Searches for isocrystals, overconvergence, Robba rings, PBQ, dagger hulls, minimal slopes and logarithmic growth found no corresponding carrier or target. Generic Tannakian and reductive-group theory remain upstream imports. AdicSpaces and ReductiveGroups supplied the roadmap models.

| Baseline declaration | Exact use and limit |
| --- | --- |
| `LinearMap.quotKerEquivRange` | For modules over a ring, quotient by the kernel is linearly equivalent to the range. This supplies algebraic images, not analytic or Frobenius descent. |
| `Representation.averageMap` | Normalised group-algebra average for a finite group whose cardinal is invertible. |
| `Representation.averageMap_invariant` | The average lies in the invariant submodule. |
| `Representation.averageMap_id` | The average fixes every invariant vector. |
| `LinearMap.trace` | The trace linear map on endomorphisms, used to check primitive coefficient projectors. |
| `LinearMap.trace_one` | On a finite free module, the trace of identity is its finrank. |
| `Padic.norm_p_pow` | For prime p, the norm of p^n in Q_p is p^(−n), giving the unbounded logarithm-coefficient subsequence. |
| `WittVector.Isocrystal` | A Witt-fraction-field module with semilinear Frobenius equivalence; finite rank and analytic connections are additional data, not fields supplied by this class. |

The parent owns analytic rings, differential Frobenius modules, slope filtrations, local monodromy, isocrystal categories, rigid cohomology, full faithfulness and weights. Their precise blueprint nodes are cited at each target. Extra statements in those same directions appear as the five supplier requests below; they are not rebuilt here. Lemmas that Part II's own sources prove (Tsuzuki Lemmas 3.1–3.2 and A.1, and Tsuzuki §7 with Appendix B on Q̄_p-coefficient objects) are owned here as targets. In particular the parent's reverse-algebraic-filtration comparison supplies the opposite-filtration carrier and its corrected indexing. General Dieudonné–Manin classification is a parent input, not a theorem inferred from Mathlib's rank-one file.

Arithmetic D-modules, monodromy groups and rigid companions are three separate continuations. This job designs PBQ and minimal slopes under the assigned Part II id and proposes coalescing the MinimalSlope alias into it. The packet and handoff give complete briefs and all routed item ids for the other directions. Their unregistered stages are not used as if they were available suppliers.

## Dependency and proof route

| Layer | Role | Depends on own layers |
| --- | --- | --- |
| MS.0 | Generic bounded quotients | None |
| MS.1 | Local PBQ filtrations | `MS.0` |
| MS.2 | PBQ objects on curves | `MS.0`, `MS.1` |
| MS.3 | Saturation | `MS.0`, `MS.1` |
| MS.4 | Curve reconstruction | `MS.0`, `MS.2`, `MS.3` |
| MS.5 | Dagger hulls and minimal slopes | `MS.0`, `MS.4` |
| MS.6 | Lefschetz and finite fields | `MS.2`, `MS.3`, `MS.4` |

The local route first constructs the universal bounded quotient from the Taylor solution pairing. The splitting theorem for bounded modules uses an analytic extension theorem, including the positive gap-one case; solvability alone does not imply boundedness. Pure bounded quotients are then characterised by preservation of the maximal slope under every nonzero quotient. Finite sums give a largest PBQ subobject at the top slope. Rank induction gives the filtration, and the bounded quotient is the sum of the maximal pure quotients of its **successive grades**.

Descent to E† uses the bounded Robba result, with an explicit induction on the kernel of a lower-slope pure quotient of B(M). The bounded-disc descent uses the specific bounded-disc to bounded-Robba subobject comparison. It does not assert that every submodule of a completed module descends. Logarithmic growth is a separate dependency chain: the logarithmic extension and eigenfunction growth input is requested from RD.0, and Ohkubo's comparison gives the bounded solutions needed in gluing.

On a curve, the generic PBQ filtration lives over the completed generic field E_η; it is compatible with the local filtrations at closed points because bounded solutions commute with the generic-to-local embedding. The local PBQ filtrations glue through the intersection description of dagger sections (Tsuzuki Lemmas 3.1–3.2) and a general-coefficient unit-root correspondence requested from RD.3. The same base-change argument, applied to the finite unramified extension of generic fields of a finite étale cover, gives finite étale transport of PBQ. Saturation removes the kernel of the map to the maximal pure quotient. The curve rank theorem compares a dagger injection into an isoclinic convergent target with its surjective completed linearisation. If the top rank were too large, the local PBQ kernels at boundary points would glue to a nonzero dagger kernel, contradicting injectivity. Applying that rank theorem to a common image in the identified pure quotient reconstructs the saturated PBQ pieces and then the specified map for irreducible objects.

For dagger hulls, dualise an inclusion N⊂M and take the E†-image of M†∨→N∨. Dualising that image realisation recovers the hull by its universal property. The generic opposite-filtration comparison gives MS at the generic field. The independent curve proof instead uses the curve rank theorem: the kernel of the dagger-section map from the dual hull is coherent and stable under connection and Frobenius; the parent's overconvergence criteria make it a dagger subobject, and minimality of the hull kills it. The resulting rank equality identifies N with the first slope term of its hull. Thus the main curve route does not require the problematic affine–generic comparison G1.

Over a finite field, objectwise Lefschetz curves through a closed point give two rank inequalities, one using each irreducible object. The curves may differ. Equal ranks give isomorphic Frobenius fibres; mixed coefficient Chebotarev applied to the pure internal Hom gives an isomorphism of the original objects. To recover a prescribed h, an endomorphism comparison corrects that isomorphism after a constant extension. Cyclic averaging then descends it while preserving h. The primitive coefficient projector is applied before induction and trace, so the composite is multiplication by m and the average divides by m. A raw doubled coefficient trace would give m².

The next seven sections give every target, its direct dependencies, proof route, source and acceptance checks. API and unit tests are mathematical specifications. The elementary quotient, representation-average, logarithm and coefficient-trace tests that can already be stated at the pins also appear in the suggested file.

## MS.0: Generic bounded quotients

Generic Taylor discs, bounded solutions, universal bounded quotients, pure bounded quotients and the opposite-filtration rank bound.

**Stage inputs.** [PadicDifferentialEquationsAndRigidCohomology:RD.0](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Planets.** Generic bounded solutions; Completed generic field of a curve; Opposite slope rank bound; Maximally bounded quotient; Bounded splitting theorem; Pure bounded quotient.

<a id="generic-solutions"></a>

### Generic bounded solutions

**Target `MS.0/generic-solutions` (definition).** For a finite (φ,∇)-module M/E, pull back through τ:E→E[[u]]₀, τ(a)=Σ ∂^i(a)u^i/i!. Define Solη(M)=Hom∇(τ*M,E{u}), with E{u} the analytic functions on the open unit disc, and Solη,0(M)=Hom∇(τ*M,E[[u]]₀). These are E-vector spaces with induced semilinear Frobenius; the bounded space uses a uniform coefficient bound, not pointwise convergence. The same construction applies to B∈{E_η, E_α} of MS.0/curve-generic-field, at the generic point t_* of B^τ.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Import the Taylor map and generic-disc solvability from RD.1. Use the contravariant horizontal Hom and induced Frobenius.
2. Bounded-disc multiplication preserves uniformly bounded coefficients, hence defines the bounded E-subspace.

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.1/dwork-transfer-generic-disc](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/change-of-frobenius-lift-taylor-formula](../packets/PadicDifferentialEquationsAndRigidCohomology.json); `Padic.norm_p_pow` (Mathlib baseline); [MS.0/curve-generic-field](#curve-generic-field).

**Sources.** [TSU, §3.3 and Definition 3.5, p.13; Proposition 3.14, p.15](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Tsuzuki Theorem 3.12 and Definition 3.13: the bounded solutions cut out the maximally bounded quotient.
- Tsuzuki Proposition 3.14 and Corollary 3.15: transports the bounded kernel from E_η to E_α and under coefficient extension.

**API.**

- `Solη.inclusion` (coercion): Solη,0(M) injects into Solη(M), compatibly with Frobenius.
- `Solη.dimension` (characterisation): dim_E Solη(M)=rank_E M, using Frobenius solvability on the open generic disc.
- `Solη.precompose` (functoriality): A horizontal Frobenius map M→N induces Solη,0(N)→Solη,0(M), commuting with inclusion.

**Unit tests.**

- `sol_unit` (computation): For the trivial rank-one connection, both solution spaces have dimension one.
- `sol_zero` (degenerate): Both spaces of the zero module are zero.
- `sol_log` (non-example): The solvable rank-two connection with a horizontal coordinate log(1+u)=Σ_{n≥1}(−1)^{n+1}u^n/n has an unbounded solution: at n=p^r its coefficient norm is p^r.

<a id="curve-generic-field"></a>

### Completed generic and local fields of a curve

**Target `MS.0/curve-generic-field` (construction).** Let C be a smooth connected affine curve over k with smooth completion C̄, a smooth affine lift Spec A_C over O_K whose weak completion carries a q-Frobenius lift φ over σ, and a generically étale coordinate x. The completed generic field E_η is the p-adic completion of the localisation of A_C at the prime πA_C, with π inverted: a complete discretely valued field with the value group of K and residue field k(C), to which φ and d/dx extend uniquely. For a closed point α of C̄, with K_α the unramified extension of K with residue field k(α) and x_α a lifted local coordinate, E_α, E†_α and K_α[[x_α]]₀ are the parent Amice, bounded Robba and bounded-disc carriers in x_α over K_α, and there are injective maps compatible with φ and the derivation: E_η→E_α, Â_{C,K}→K_α[[x_α]]₀ for α∈C, and A†_{C,K}→E†_α for α∈C̄∖C. For a (φ,∇)-module M† over A†_{C,K} put M_η=E_η⊗M†, M_{0,α}=K_α[[x_α]]₀⊗M† and M†_α=E†_α⊗M†. With B∈{E_η, E_α}, the generic disc of B uses the Taylor map f↦Σ_n (d^nf/dx_*^n)(t_*)(X−t_*)^n/n! into B^τ[[X−t_*]]₀.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation. C is a smooth connected affine curve over the perfect field k with a smooth lift admitting a Frobenius lift compatible with σ; such lifts exist by the parent's Monsky–Washnitzer theory.

**Proof or construction.**

1. The special fibre of Spec A_C is integral, so the localisation of A_C at πA_C is a discrete valuation ring with uniformiser π and residue field k(C); complete p-adically and invert π (Tsuzuki §3.1, p.11). This is the parent Cohen-type carrier Γ^ℓ[π^{-1}] for the trivially valued field ℓ=k(C).
2. φ preserves πA_C and extends by continuity; d/dx extends because dx generates Ω¹ at the generic point, x being generically étale.
3. For a closed point α the completion of A_C along α with the coordinate x_α gives K_α[[x_α]]₀; at boundary points the overconvergent sections map to E†_α. Frobenius and derivation extend uniquely and compatibly to all rings of the two diagrams in Tsuzuki §3.1, p.11.
4. Independence of the lift, coordinate and Frobenius lift for solvability and boundedness is Tsuzuki Proposition 3.6, p.14, through the parent Taylor comparison.

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/affine-frame-global-sections-equivalence](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/change-of-frobenius-lift-taylor-formula](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, §3.1, pp.10–11; §3.3 and Proposition 3.6, pp.13–14](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Tsuzuki §3.3, Definition 3.5: defines solvability and boundedness at the generic point.
- Tsuzuki Definition 3.26 and Lemma 3.33: measures curve PBQ and glues generic submodules.
- Tsuzuki Proposition 3.14 and Theorem 3.21: compares the generic field with the local fields E_α.

**API.**

- `CurveGenericField.residueField` (characterisation): E_η is a complete discretely valued field with value group |K^×| and residue field k(C).
- `CurveGenericField.toLocal` (functoriality): For each closed point α the map E_η→E_α is an isometric field embedding commuting with φ and with d/dx_α when x=x_α.
- `CurveGenericField.genericModule` (constructor): M†↦M_η is an exact faithful ⊗-functor from (φ,∇)-modules over A†_{C,K} to (φ,∇)-modules over E_η, compatible with E_α⊗_{E_η}M_η≅E_α⊗M†.
- `CurveGenericField.lift_indep` (compatibility): Changing the lift, coordinate or Frobenius lift gives an isomorphic field, and the Taylor comparison transports generic modules and their solution spaces.

**Unit tests.**

- `CurveGenericField.residue_line` (computation): For C=A¹_k with lift O_K[x], E_η is the p-adic completion of O_K[x]_(π)[1/p]; its residue field is k(x).
- `CurveGenericField.unit` (degenerate): The generic module of the unit (A†_{C,K}, d, φ) is E_η with zero connection; it is unit-root and bounded.
- `CurveGenericField.not_laurent` (non-example): The gap series Σ_{n≥0}x^{n!} lies in the Amice field E_0 at the origin but not in E_η, since its reduction is not a rational function; identifying E_η with a local Laurent field is wrong.

<a id="opposite-rank-bound"></a>

### Opposite slope rank bound

**Target `MS.0/opposite-rank-bound` (theorem).** Let (E†,E) be either the parent bounded Robba and Amice fields (residue field k((t))) or D'Addezio's generic pair of §4.2 (residue field k(t)), with k perfect. Let M† be a φ-module over E†, M=E⊗M†, P an isoclinic φ-module over E, and f:M→P a φ-morphism whose restriction to M† is injective. Then λmax(M)=slope(P) and rank_E Top(M)≤rank_E P; if moreover f is surjective (E·f(M†)=P), equality holds. Connections play no role, and f itself need not be injective.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Extend to the algebraic overconvergent carrier: the multiplication map from the completed tensor product to the algebraic completed field is injective (parent tensor descent), so f|M† stays injective after base change to E†_alg.
2. The first reverse-filtration piece of M†_alg is pure of the maximal slope of M (Laurent case: the parent reverse filtration over Γ^alg_con[π^{-1}]; k(t) case: D'Addezio Theorem 4.2.6 as corrected in the parent comparison node); its image is a nonzero φ-submodule of the pure P⊗E_alg, so the slopes agree.
3. After adjoining p^{1/r}, the Frobenius eigenvectors of slope s/r in that first piece span a space of dimension rank Top(M), and they inject into the corresponding eigenspace of P, of dimension rank P; this gives rank Top(M)≤rank P (D'Addezio Lemma 4.2.7; Tsuzuki Theorem 2.13).
4. If f is surjective it kills the lower slope part of M by Hom vanishing between distinct slopes, so it factors through Top(M) and rank P≤rank Top(M) (Tsuzuki Theorem 2.14).

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.1/reverse-algebraic-filtration-comparison](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/completed-overconvergent-tensor-descent](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-slope-decomposition-and-descent](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Theorems 2.13–2.14, p.10](https://arxiv.org/pdf/1910.03871v3); [DAD, Lemma 4.2.7, p.15](https://arxiv.org/pdf/2012.12879v4).

**Check.** An E†-injection need not stay injective after E-linearisation; the rank conclusion concerns Top(M).

<a id="fixed-field-normalisation"></a>

### Frobenius-fixed coefficient normalisation

**Target `MS.0/fixed-field-normalisation` (lemma).** Let K be a complete discretely valued field of characteristic zero with residue field k of characteristic p and σ a q-Frobenius on K. (1) The fixed field K^σ is complete discretely valued with residue field of at most q elements, hence finite over Q_p. (2) There is a finite unramified extension K′/K to which σ extends such that (K′)^σ has residue field F_q and the same value group as K; if k is perfect, (K′)^σ⊗_{W(F_q)}W(k′)→K′ is an isomorphism with σ=id⊗Frob_q. Consequently every element of |K^×| is |b| for some b∈(K′)^σ, and a rank-one (φ,∇)-module over E, E_η or A†_{C,K} becomes unit-root after the constant twist by b^{-1} over K′.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with residue field k (perfect in the last assertion of (2)) of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. A σ-fixed element a of the valuation ring satisfies a^q≡a modulo the maximal ideal, so the residue field of K^σ embeds in F_q; K^σ is closed in K, hence complete (Tsuzuki Lemma A.1(1), p.37).
2. Let K̂^{perf,ur} be the p-adic completion of the maximal unramified extension of the completed perfection of K along σ; σ extends uniquely, and its fixed field has residue field F_q and the value group of K. Take K′=(K̂^{perf,ur})^σ·K (Tsuzuki proof of Lemma A.1(2), p.38, reading 'valuation group' for 'valuation ring', E23).
3. For perfect k compare ramification to identify K′ with (K′)^σ⊗_{W(F_q)}W(k′). A rank-one φ-module has Frobenius eigenvalue of absolute value in |K^×|, so twisting by the constant object with Frobenius b^{-1}, b∈(K′)^σ, gives slope zero.

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.0/finite-coefficient-extension-interface](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Lemma A.1(1)–(2) and proof, pp.37–38](https://arxiv.org/pdf/1910.03871v3).

**Check.** For K=W(F̄_p)[1/p] with the Witt Frobenius, K^σ=Q_p and K′=K. For K=Q_p(√p) with σ=id (q=p), K^σ=K and the rank-one constant object with Frobenius √p is untwisted by b=√p; the value group, not just |p|^ℤ, is needed.

<a id="bounded-quotient"></a>

### Maximally bounded quotient

**Target `MS.0/bounded-quotient` (definition).** A (φ,∇)-module over E is bounded when its Taylor realisation is trivial over E[[u]]₀. Let Mᵇ be the unique least differential submodule whose quotient is bounded. Equivalently M/Mᵇ is the universal bounded quotient; Mᵇ is the common annihilator of Solη,0(M) under evaluation. Write B(M)=M/Mᵇ; zero has B(0)=0. The same definition applies over the completed generic field E_η of a curve and over E_α (MS.0/curve-generic-field), as in Tsuzuki §§3.3–3.6.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Use the Taylor solution pairing and finite-dimensionality. Intersections of two kernels with bounded quotients again give a bounded quotient by embedding in their direct sum.
2. Choose a kernel of minimal dimension; finite intersection makes it contained in every other such kernel. Frobenius transports the universal property, so Mᵇ is Frobenius stable.

**Direct prerequisites.** [MS.0/generic-solutions](#generic-solutions); [PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-slope-decomposition-and-descent](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [MS.0/curve-generic-field](#curve-generic-field).

**Sources.** [TSU, Theorem 3.12 and Definition 3.13, p.15](https://arxiv.org/pdf/1910.03871v3); [CT11, Theorem 2.2, pp.41–42](https://ems.press/content/serial-article-files/26106?nt=1).

**Uses that determine the API.**

- Definition 3.16, p.16: defines PBQ.
- Proposition 3.29, p.19: provides the convergent quotient on a curve.

**API.**

- `BoundedQuotient.factor` (universal-property): Every differential map M→Q with Q bounded factors uniquely through M→B(M).
- `BoundedQuotient.dualSolutions` (equivalence): Solη,0(M) ≅ B(M)^∨ as Frobenius E-spaces.
- `BoundedQuotient.rank` (compatibility): rank B(M)=dim_E Solη,0(M); B(M)=M iff M is bounded.

**Unit tests.**

- `bq_unit` (computation): B(1)=1 and 1ᵇ=0.
- `bq_zero` (degenerate): 0ᵇ=0 and B(0)=0; no nonzero quotient is asserted for M=0.
- `bq_idempotent` (characterisation): B(B(M))=B(M), whereas the kernel convention gives B(M)ᵇ=0.

<a id="bounded-extension-splitting"></a>

### Bounded extension splitting

**Target `MS.0/bounded-extension-splitting` (theorem).** Let 0→L→M→Q→0 be an exact sequence over E with pure L,Q of slopes a,b. It splits as differential Frobenius modules if b<a, or b−a>1, or M is bounded and 0<b−a≤1. Bounded splitting of arbitrary slope filtrations follows by induction; the two latter cases are the analytic content, not a consequence of solvability.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. For b<a solve the off-diagonal Frobenius equation by a contracting inverse and use slope-Hom vanishing to make the splitting horizontal.
2. After allowed coefficient extension and Taylor change, take σ(t)=t^q and normalise the diagonal blocks. For b−a>1 compare the off-diagonal Frobenius–connection identity and coefficient orders to force both off-diagonal blocks to vanish.
3. For 0<b−a<1, a surviving off-diagonal block yields an unbounded generic Taylor solution; at b−a=1 treat the connection block first and obtain an exact growth-one solution. Boundedness excludes these. Unique distinct-slope splittings descend under the allowed extensions.

**Direct prerequisites.** [MS.0/generic-solutions](#generic-solutions); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-stable-lattices](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/change-of-frobenius-lift-taylor-formula](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/finite-coefficient-extension-interface](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [CT11, Proposition 4.2, p.46; Proposition 4.3, pp.46–47; §4.4, pp.50–54](https://ems.press/content/serial-article-files/26106?nt=1); [OHK, Lemma 8.2, p.40](https://arxiv.org/pdf/1809.04065v1).

**Check.** The small positive-gap case requires bounded M; dropping this condition would rule out the logarithmic nonsplit examples.

<a id="bounded-splitting"></a>

### Bounded splitting theorem

**Target `MS.0/bounded-splitting` (theorem).** Over E (the Amice field over K, or over K_α) with perfect coefficient residue k, and over the completed generic field E_η of a curve, M is bounded iff its increasing slope filtration splits as a direct sum of pure differential Frobenius modules. In particular every pure object is bounded; for nonzero M its maximal pure slope quotient is nonzero and bounded.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. For a pure module use a Frobenius-stable unit-root lattice after an allowed slope twist and the generic Taylor estimates (Ohkubo Proposition 5.9, p.26).
2. For bounded M apply bounded-extension-splitting to successive pure slope grades, normalising the smallest slope first. The off-diagonal analytic cases, including gap one, are essential.
3. Descend the unique distinct-slope splittings and induct through the filtration. This proves differential splitting, rather than just a splitting after forgetting the connection.
4. For B=E_η (Tsuzuki Theorem 3.10, p.14): take the unique upper-triangular solution X over the completed perfection Ê^perf_η of A·φ(X)=X·diag(A_11,…,A_rr) for the Frobenius matrix A in a slope-adapted basis. By the local case at a closed point α, X has entries in E_α; Lemma 3.11 gives E_η=Ê^perf_η∩E_α inside Ẽ_α (from k(C)=k(C)^perf∩k(C)_α, the p-th powers being the kernel of a derivation), so X has entries in E_η.

**Direct prerequisites.** [MS.0/generic-solutions](#generic-solutions); [PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/finite-coefficient-extension-interface](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [MS.0/bounded-extension-splitting](#bounded-extension-splitting); [MS.0/curve-generic-field](#curve-generic-field).

**Sources.** [TSU, Theorem 3.10 and Lemma 3.11, p.14](https://arxiv.org/pdf/1910.03871v3); [CT11, Theorem 4.1, p.46](https://ems.press/content/serial-article-files/26106?nt=1); [OHK, Proposition 5.9, p.26; Theorem 8.3, p.40](https://arxiv.org/pdf/1809.04065v1).

**Check.** A nontrivial extension between distinct slopes need not be bounded merely because it is solvable.

<a id="bounded-base-change"></a>

### Bounded base change

**Target `MS.0/bounded-base-change` (theorem).** Let B⊂B′ be an extension of complete discretely valued fields with compatible Frobenius lifts and derivations sharing a coordinate x, for instance a finite isometric coefficient extension E⊂E_L, the generic-to-local embedding E_η⊂E_α (with x=x_α), or the finite unramified extension E_η⊂E_{η′} induced by a finite étale cover of curves. For a solvable (φ,∇)-module M over B, Sol and Sol₀ of B′⊗M are the B′^τ-spans of those of M; consequently (B′⊗M)ᵇ=B′⊗Mᵇ and B(B′⊗M)=B′⊗B(M).

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Taylor solutions of B′⊗M are B′^τ-combinations of those of M, since the generic solution matrix of M is a fundamental solution over B′^τ as well (Tsuzuki Proposition 3.14, p.15, and its displayed identifications).
2. If a B′^τ-combination Σc_if_i of solutions is bounded, choose a basis d_1,…,d_m of the B^τ-span of the c_i; a finite-dimensional B^τ-subspace of the complete field B′^τ carries the product topology, so boundedness of Σd_jg_j forces every g_j to be bounded. Hence bounded solutions of B′⊗M are spanned by bounded solutions of M.
3. Take annihilators under the evaluation pairing to obtain (B′⊗M)ᵇ=B′⊗Mᵇ (Corollary 3.15). For a finite étale cover the coordinate of C is an étale coordinate of C′ and Frobenius lifts extend uniquely, so the hypotheses hold.

**Direct prerequisites.** [MS.0/generic-solutions](#generic-solutions); [MS.0/bounded-quotient](#bounded-quotient); [MS.0/curve-generic-field](#curve-generic-field); [PadicDifferentialEquationsAndRigidCohomology:RD.0/finite-coefficient-extension-interface](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/finite-etale-lifting-of-mw-algebras](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Proposition 3.14 and Corollary 3.15, pp.15–16](https://arxiv.org/pdf/1910.03871v3); [OHK, Lemma 7.10, p.37](https://arxiv.org/pdf/1809.04065v1).

**Check.** For the generic-to-local embedding E_η⊂E_α this is Corollary 3.15; for E⊂E_L it is the growth-zero case of Ohkubo Lemma 7.10. For the logarithmic rank-two connection over B, the unbounded solution stays unbounded over every B′, while its constant solution stays bounded.

<a id="pbq"></a>

### Pure bounded quotient

**Target `MS.0/pbq` (definition).** A nonzero (φ,∇)-module M/E is PBQ if B(M) is pure of a single Frobenius slope. For a module over K[[t]]₀ or E†, PBQ means PBQ after scalar extension to E. The zero object is excluded from this predicate, following Tsuzuki (Ohkubo Definition 5.10 instead counts zero as PBQ), but is allowed as the initial filtration term. The definition applies verbatim over E_η and E_α.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Form the bounded quotient and use the parent notion of a pure Frobenius module.
2. Nonzero M has a nonzero bounded maximal-slope quotient; bounded splitting identifies the slope of B(M) with λmax(M) when B(M) is pure.

**Direct prerequisites.** [MS.0/bounded-quotient](#bounded-quotient); [MS.0/bounded-splitting](#bounded-splitting); [PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Definitions 3.16 and 3.22, pp.16–17](https://arxiv.org/pdf/1910.03871v3); [OHK, Definition 5.10 and Lemma 5.11, p.27](https://arxiv.org/pdf/1809.04065v1).

**Uses that determine the API.**

- Theorem 3.19: selects successive maximal PBQ subobjects.
- Theorem 4.2: local reconstruction requires PBQ and saturation.

**API.**

- `PBQ.topSlope` (characterisation): If M is PBQ then B(M) is nonzero and pure of slope λmax(M).
- `PBQ.scalar` (compatibility): PBQ of a bounded-disc or E† module is measured by its E-realisation, not by its rank or a selected lattice.
- `PBQ.isPure` (compatibility): Every nonzero pure differential Frobenius module is PBQ, with B(M)=M.

**Unit tests.**

- `pbq_line` (computation): Every rank-one differential Frobenius module is PBQ.
- `pbq_zero` (non-example): Zero is not PBQ.
- `pbq_mixed_split` (non-example): The split sum of two rank-one constant objects of distinct slopes is bounded but not PBQ.

<a id="pbq-quotients"></a>

### PBQ quotient criterion

**Target `MS.0/pbq-quotients` (theorem).** For nonzero M/E the following are equivalent: M is PBQ; every nonzero differential Frobenius quotient Q of M has λmax(Q)=λmax(M). A sum of finitely many PBQ subobjects of the same maximal slope is PBQ; every nonzero quotient of a PBQ object is PBQ of that same maximal slope. The same holds over E_η, using the E_η case of bounded-splitting.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Use bounded splitting to produce a pure lower-slope quotient if B(M) has more than one slope.
2. If a quotient has smaller maximal slope, quotient M by its lower slope terms and split the slope-separated extension to obtain a bounded quotient with two slopes.
3. Apply the criterion to sums and quotients.

**Direct prerequisites.** [MS.0/pbq](#pbq); [MS.0/bounded-splitting](#bounded-splitting); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Lemma 3.17, p.16](https://arxiv.org/pdf/1910.03871v3); [OHK, Proposition 8.1 and Lemma 8.2, pp.39–40](https://arxiv.org/pdf/1809.04065v1).

**Check.** For nonzero M/E the following are equivalent: M is PBQ; every nonzero differential Frobenius quotient Q of M has λmax(Q)=λmax(M). A sum of finitely many PBQ subobjects of the same maximal slope is PBQ; every nonzero quotient of a PBQ object is PBQ of that same maximal slope.

<a id="unit-root-tensor"></a>

### Unit-root tensor criterion

**Target `MS.0/unit-root-tensor` (theorem).** If U/E is nonzero unit-root, then M is PBQ iff M⊗U is PBQ. The nonzero assumption on U is essential. The same holds over E_η (Tsuzuki states it for B∈{E_η, E_α}).

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. For unit-root U choose a Frobenius-stable bounded lattice; Taylor solution bounds show B(M⊗U)=B(M)⊗U.
2. Tensoring a Frobenius module with nonzero slope-zero U preserves and reflects purity and the maximal slope.

**Direct prerequisites.** [MS.0/pbq](#pbq); [MS.0/generic-solutions](#generic-solutions); [PadicDifferentialEquationsAndRigidCohomology:RD.3/unit-root-f-isocrystal](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Proposition 3.18, p.16](https://arxiv.org/pdf/1910.03871v3).

**Check.** U=0 would make the reverse implication false.

**Coverage.** Planned.

## MS.1: Local PBQ filtrations

The canonical PBQ filtration over E, descent to bounded discs and E†, bounded solutions of PBQ disc objects and logarithmic growth.

**Stage inputs.** [PadicDifferentialEquationsAndRigidCohomology:RD.0](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.0](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json).

**Planets.** PBQ filtration; Bounded graded formula; Log-growth slope comparison.

<a id="pbq-filtration"></a>

### PBQ filtration

**Target `MS.1/pbq-filtration` (definition).** There is a unique filtration 0=P₀M⊂P₁M⊂⋯⊂P_rM=M whose successive nonzero grades G_i=P_iM/P_(i−1)M are PBQ with strictly decreasing λ_i=λmax(G_i). P₁M is the largest PBQ subobject of maximal slope λmax(M), and subsequent terms are obtained from that construction on the quotient. For M=0 the length is zero.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. First construct a nonzero PBQ subobject of maximal slope: take the preimage in M of the maximal pure summand of B(M). If this preimage is PBQ use it; otherwise it is proper and induction on rank supplies its maximal PBQ subobject (CT11 Proposition 5.4, p.56).
2. Sum PBQ subobjects of this fixed maximal slope, using the quotient criterion and finite length, to obtain the unique largest one. The next quotient has strictly smaller maximal slope, so induction gives the filtration.
3. Compare the unique first term and apply induction to the quotient to prove uniqueness.

**Direct prerequisites.** [MS.0/pbq-quotients](#pbq-quotients); [MS.0/bounded-splitting](#bounded-splitting).

**Sources.** [TSU, Theorem 3.19(1) and Definition 3.20, p.16](https://arxiv.org/pdf/1910.03871v3); [CT11, Proposition 5.4 and Corollary 5.5, p.56](https://ems.press/content/serial-article-files/26106?nt=1).

**Uses that determine the API.**

- Theorem 3.19(2): identifies the bounded quotient using the grades.
- Theorems 3.23 and 3.27: descend and globalise the filtration.

**API.**

- `PBQFiltration.first` (characterisation): P₁ is the unique largest PBQ subobject of slope λmax(M).
- `PBQFiltration.graded` (data): Each G_i is PBQ with λ_i>λ_(i+1); this is a statement about grades, not nested P_i.
- `PBQFiltration.quotient` (compatibility): The filtration of M/P_jM is the tail P_(j+i)M/P_jM, with its zero and endpoint terms.

**Unit tests.**

- `pbqfil_zero` (degenerate): The zero module has the empty sequence of nonzero grades.
- `pbqfil_pure` (computation): A nonzero pure object has one step.
- `pbqfil_two_slopes` (non-example): For L_1⊕L_0 of slopes 1 and 0, grades have slopes 1 then 0; the nested second term still has maximal slope 1.

<a id="log-growth"></a>

### Logarithmic growth filtration

**Target `MS.1/log-growth` (definition).** For λ≥0, E[[u]]_λ consists of analytic series Σa_nu^n for which there is a real C≥0 with |a_n|≤C(n+1)^λ for all n. For λ<0 set this space to zero. Define Solη,λ(M) by requiring every image of a finite module basis to belong to this space. For bounded-disc solutions use K in place of E. The definition is independent of the finite basis.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Use a uniform coefficient norm and real powers; multiplication by bounded series preserves the bound by the nonarchimedean convolution estimate.
2. Define the solution filtration by target growth and compare bases using bounded transition matrices.

**Direct prerequisites.** [MS.0/generic-solutions](#generic-solutions); [PadicDifferentialEquationsAndRigidCohomology:RD.0/finite-coefficient-extension-interface](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Remark 3.25, p.18](https://arxiv.org/pdf/1910.03871v3); [OHK, Definitions 2.1, 2.4 and 2.9, Lemma 2.6 and Corollary 2.7, pp.11–13](https://arxiv.org/pdf/1809.04065v1).

**Uses that determine the API.**

- Ohkubo Theorems 7.2 and 7.6: compares logarithmic growth with Frobenius slopes.
- Proposition 3.24: identifies bounded solutions at λ=0.

**API.**

- `LogGrowth.zero` (compatibility): Fil₀ is precisely the uniformly bounded power series.
- `LogGrowth.mono` (functoriality): For 0≤λ≤μ, Fil_λ⊆Fil_μ and the associated solution spaces are nested.
- `LogGrowth.coefficient` (characterisation): For λ≥0 membership is equivalent to a single uniform constant C bounding all coefficients by C(n+1)^λ.

**Unit tests.**

- `growth_constant` (computation): A nonzero constant has exact growth zero.
- `growth_log` (non-example): log(1+u) has growth at most one, but is not in Fil₀; the subsequence n=p^r witnesses this.
- `growth_negative` (degenerate): Fil_λ=0 for λ<0, even though a nonzero polynomial has a formal coefficient bound with negative powers after enlarging C.

<a id="growth-eigenvector"></a>

### Growth eigenvector bound

**Target `MS.1/growth-eigenvector` (theorem).** For a PBQ (φ,∇)-module M/Rbd solvable in Rlog, with algebraically closed k after an isometric coefficient extension, a Frobenius d-eigenvector f∈Sol_λ(M) of slope μ satisfies μ≤λ−λmax(M_E).

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation. M is solvable in Rlog. The extended logarithmic embedding, multiplication injectivity and exact eigenfunction growth of Ohkubo Lemmas 1.15 and 2.14 are required; no unconditional solvability claim is made.

**Proof or construction.**

1. Quotient by ker f; PBQ quotient criterion keeps the maximal slope.
2. After twisting and replacing Frobenius by its d-th power, reduce to a Frobenius-fixed solution.
3. Embed Rlog in the parent extended logarithmic Robba carrier with injective multiplication; a maximal-slope eigenvector from the reverse filtration maps to a nonzero eigenfunction. Its exact growth equals its slope, giving the bound. These logarithmic embedding and exact-growth inputs are recorded as a supplier request.

**Direct prerequisites.** [MS.0/pbq-quotients](#pbq-quotients); [PadicDifferentialEquationsAndRigidCohomology:RD.1/reverse-algebraic-filtration-comparison](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-equivariant-embedding](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [OHK, Proposition 10.1 and proof, pp.41–42](https://arxiv.org/pdf/1809.04065v1).

**Check.** For a PBQ (φ,∇)-module M/Rbd solvable in Rlog, with algebraically closed k after an isometric coefficient extension, a Frobenius d-eigenvector f∈Sol_λ(M) of slope μ satisfies μ≤λ−λmax(M_E).

<a id="bounded-graded-formula"></a>

### Bounded graded formula

**Target `MS.1/bounded-graded-formula` (theorem).** There is a canonical Frobenius decomposition B(M)≅⊕_i Top(G_i) for the graded PBQ pieces G_i of M. It is not a sum of Top(P_iM).

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Apply bounded splitting to B(M).
2. Induct through the PBQ filtration and identify each pure bounded quotient with the corresponding maximal slope summand; distinct slopes make the identification unique.

**Direct prerequisites.** [MS.1/pbq-filtration](#pbq-filtration); [MS.0/bounded-splitting](#bounded-splitting); [MS.0/pbq-quotients](#pbq-quotients).

**Sources.** [TSU, Theorem 3.19(2), pp.16–17](https://arxiv.org/pdf/1910.03871v3).

**Check.** There is a canonical Frobenius decomposition B(M)≅⊕_i Top(G_i) for the graded PBQ pieces G_i of M. It is not a sum of Top(P_iM).

<a id="pbq-filtration-base-change"></a>

### PBQ filtration base change

**Target `MS.1/pbq-filtration-base-change` (theorem).** For an extension B⊂B′ as in bounded-base-change (in particular E_η⊂E_α, finite coefficient extension, or the finite unramified extension of generic fields of a finite étale cover), M is PBQ iff B′⊗M is PBQ, with the same maximal slope, and B′⊗P_•(M) is the PBQ filtration of B′⊗M. In particular maximal PBQ subobjects and their graded slopes are preserved.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Bounded-base-change gives B(B′⊗M)=B′⊗B(M); Frobenius slopes of a φ-module are unchanged by field extension, so purity of the bounded quotient is preserved and reflected (Tsuzuki Theorem 3.21(1)).
2. The base change of the PBQ filtration of M has PBQ grades with strictly decreasing maximal slopes, so by uniqueness of the PBQ filtration over B′ it is the PBQ filtration of B′⊗M (Theorem 3.21(2)).

**Direct prerequisites.** [MS.1/pbq-filtration](#pbq-filtration); [MS.0/bounded-base-change](#bounded-base-change); [MS.0/pbq-quotients](#pbq-quotients).

**Sources.** [TSU, Theorem 3.21, p.17](https://arxiv.org/pdf/1910.03871v3); [OHK, Lemma 7.10, p.37](https://arxiv.org/pdf/1809.04065v1).

**Check.** For a split sum of rank-one constant objects of slopes 1 and 0 over E_η, the PBQ filtration and its grades are the same after passing to any E_α.

<a id="dagger-pbq-descent"></a>

### Bounded Robba PBQ descent

**Target `MS.1/dagger-pbq-descent` (theorem).** For M†/E†, its PBQ filtration over E descends uniquely to E†; equivalently its maximally PBQ subobject descends, and the construction iterates on the quotient. Here k is perfect and the source Frobenius hypotheses of Ohkubo §12.3 are retained.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. If M† is already PBQ there is nothing to descend. Otherwise choose a pure quotient Q of B(M) of slope strictly below λmax(M), using bounded splitting.
2. Let N†=ker(M†→Q). The image is nonzero and injects into pure Q; opposite-rank-bound identifies its maximal slope with slope Q, so N† is proper and its completion retains the full top quotient of M.
3. The uniqueness characterisation of the maximal PBQ subobject identifies P₁(N)=P₁(M). Induct on the smaller rank N†, then on the quotient to obtain the full filtration. No arbitrary completed-subobject descent is assumed.

**Direct prerequisites.** [MS.1/pbq-filtration](#pbq-filtration); [MS.0/bounded-splitting](#bounded-splitting); [MS.0/opposite-rank-bound](#opposite-rank-bound).

**Sources.** [TSU, Theorem 3.23(2), p.17](https://arxiv.org/pdf/1910.03871v3); [OHK, Assumption 12.3, Proposition 12.4, Definition 12.5 and Theorem 12.7, pp.45–46](https://arxiv.org/pdf/1809.04065v1).

**Check.** For M†/E†, its PBQ filtration over E descends uniquely to E†; equivalently its maximally PBQ subobject descends, and the construction iterates on the quotient. Here k is perfect and the source Frobenius hypotheses of Ohkubo §12.3 are retained.

<a id="log-growth-comparison"></a>

### Log-growth slope comparison

**Target `MS.1/log-growth-comparison` (theorem).** For a PBQ bounded-disc module M, Sol_λ(M)=S_(λ−λmax(M_E))(Sol(M)) for every real λ. The bounded Robba version holds for M solvable in Rlog. S is the increasing Frobenius slope filtration on the contravariant solution space; the shift is negative at λ=0.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. The Frobenius contraction estimate gives the slope-filtration inclusion into growth.
2. After isometric coefficient extension choose a Frobenius eigenbasis; growth-eigenvector gives the reverse inclusion.
3. Descend by coefficient norm equivalence. The bounded-disc version follows by the Taylor embedding (Ohkubo Proposition 7.7).

**Direct prerequisites.** [MS.1/growth-eigenvector](#growth-eigenvector); [MS.1/log-growth](#log-growth); [MS.0/bounded-base-change](#bounded-base-change); [PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Remark 3.25, p.18](https://arxiv.org/pdf/1910.03871v3); [OHK, Theorem 7.6(ii), Proposition 7.7 and Conjecture 7.2(ii), pp.35–37](https://arxiv.org/pdf/1809.04065v1).

**Check.** For a PBQ bounded-disc module M, Sol_λ(M)=S_(λ−λmax(M_E))(Sol(M)) for every real λ. The bounded Robba version holds for M solvable in Rlog. S is the increasing Frobenius slope filtration on the contravariant solution space; the shift is negative at λ=0.

<a id="disc-pbq-descent"></a>

### Bounded-disc PBQ descent

**Target `MS.1/disc-pbq-descent` (theorem).** For a finite free (φ,∇)-module over K[[t]]₀ the PBQ filtration of its E-realisation descends uniquely to saturated differential Frobenius submodules over K[[t]]₀, whose quotient modules are finite free.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. For a bounded-disc M, extend to E†. The de Jong Proposition 6.4 subobject comparison between this module and its bounded Robba extension is the exact RD.1 supplier requested here.
2. Apply dagger-pbq-descent to get the maximal PBQ submodule over E†, and bring it back through that comparison. Equivalently use CT11 Lemma 5.7 pure-target slope detection in the kernel induction of Theorem 5.6.
3. Induct on the quotient and use full faithfulness for uniqueness.

**Direct prerequisites.** [MS.1/dagger-pbq-descent](#dagger-pbq-descent); [PadicDifferentialEquationsAndRigidCohomology:RD.3/local-full-faithfulness](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Theorem 3.23(1), p.17](https://arxiv.org/pdf/1910.03871v3); [CT11, Theorem 5.6, Lemma 5.7 and Corollary 5.10, pp.56–59](https://ems.press/content/serial-article-files/26106?nt=1).

**Check.** For a finite free (φ,∇)-module over K[[t]]₀ the PBQ filtration of its E-realisation descends uniquely to saturated differential Frobenius submodules over K[[t]]₀, whose quotient modules are finite free.

<a id="bounded-disc-solutions"></a>

### Bounded solutions of PBQ discs

**Target `MS.1/bounded-disc-solutions` (theorem).** For PBQ M₀/K[[t]]₀, Sol₀(M₀)=S_(−λmax(M₀,E))(Sol(M₀)) is pure of slope −λmax(M₀,E). Evaluation gives the pure quotient L₀=K[[t]]₀⊗_K Sol₀(M₀)∨, of slope λmax(M₀,E), and rank L₀=dim_K Sol₀(M₀).

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Apply the bounded-disc growth comparison at λ=0 and the dual solution pairing.
2. Identify the resulting pure slope piece with the bounded horizontal module using evaluation; compare dimensions.

**Direct prerequisites.** [MS.1/log-growth-comparison](#log-growth-comparison); [MS.0/generic-solutions](#generic-solutions); [MS.1/disc-pbq-descent](#disc-pbq-descent).

**Sources.** [TSU, Proposition 3.24, pp.17–18](https://arxiv.org/pdf/1910.03871v3).

**Check.** For a rank-one constant Frobenius-a object the solution eigenvalue is a⁻¹ while the evaluation quotient has eigenvalue a; the dual cannot be omitted.

**Coverage.** Planned. Discharge the RD.0 request for Ohkubo's extended logarithmic Robba carrier (growth-eigenvector) and the RD.1 request for de Jong's bounded-disc/bounded-Robba submodule comparison (disc-pbq-descent).

## MS.2: PBQ objects on curves

Generic PBQ and its canonical filtration on a smooth curve, gluing and functoriality, finite étale transport and a nonsplit geometric example.

**Stage inputs.** [PadicDifferentialEquationsAndRigidCohomology:RD.0](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.4](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.5](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.6](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.0](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.1](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json).

**Planets.** PBQ objects on curves; Interior and boundary gluing; Curve PBQ filtration.

<a id="curve-pbq"></a>

### PBQ objects on curves

**Target `MS.2/curve-pbq` (definition).** M† on C is PBQ when the differential Frobenius module at the completed generic point is PBQ. This definition is independent of the affine formal lift, generic coordinate and compatible Frobenius lift; it is not pointwise purity of M†.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Pass between lifts using the parent Taylor comparison and between generic coefficient carriers by bounded-base-change.
2. Preserve the universal bounded quotient and its pure slope under each comparison.

**Direct prerequisites.** [MS.0/pbq](#pbq); [MS.0/bounded-base-change](#bounded-base-change); [PadicDifferentialEquationsAndRigidCohomology:RD.3/affine-frame-global-sections-equivalence](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/change-of-frobenius-lift-taylor-formula](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [MS.0/curve-generic-field](#curve-generic-field).

**Sources.** [TSU, Definition 3.26, p.18](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Theorem 3.27: globalises the filtration.
- Corollary 6.5: is part of the curve reconstruction hypothesis.

**API.**

- `CurvePBQ.generic` (characterisation): PBQ can be checked on the generic module of any nonempty affine open.
- `CurvePBQ.restrict` (compatibility): Restriction to a nonempty open preserves and reflects PBQ.
- `CurvePBQ.coordinate` (compatibility): The predicate is invariant under the Taylor change of local coordinate and Frobenius lift.

**Unit tests.**

- `curve_pbq_line` (computation): A rank-one dagger object is PBQ.
- `curve_pbq_zero` (non-example): Zero is excluded just as in the generic definition.
- `curve_pbq_twoslopes` (non-example): A split pair of constant rank-one objects with different slopes is not PBQ, even though each fibre is split.

<a id="dagger-section-intersection"></a>

### Dagger sections as generic and local intersections

**Target `MS.2/dagger-section-intersection` (theorem).** In the setting of MS.0/curve-generic-field: (1) Â_{C,K}=⋂_{α∈C}(E_η∩K_α[[x_α]]₀); (2) A†_{C,K}=⋂_{α∈C̄∖C}(E†_α∩Â_{C,K})=⋂_{α∈C}(E_η∩K_α[[x_α]]₀)∩⋂_{α∈C̄∖C}(E_η∩E†_α), the intersections taken in the fields E_α; (3) for a finite projective A†_{C,K}-module M†, M†=⋂_{α∈C}(M_η∩M_{0,α})∩⋂_{α∈C̄∖C}(M_η∩M†_α) inside M_η.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1. C is affine with a smooth lift and Frobenius lift as in MS.0/curve-generic-field; C̄ is its smooth completion.

**Proof or construction.**

1. All rings in (1) are p-adically complete with the value group of K, so (1) reduces modulo the maximal ideal to k[C]=⋂_{α∈C}(k(C)∩k(α)[[x_α]]), which holds because k[C] is a normal one-dimensional domain (Tsuzuki Lemma 3.2(1), p.12).
2. For a boundary point α choose an affine open V⊂C̄ containing α in which α is cut out by one function. Lemma 3.1(3) gives the overconvergence-along-α ring as E†_α∩(sections over V∖{α}), by splitting a Laurent series into its negative and nonnegative parts and using Â_V=R[[x_α]]∩Â_C; glue over the finitely many boundary points (Tate acyclicity) to get the first equality of (2); the second follows from (1).
3. A finite projective module is a direct summand of a finite free module, and the intersections in (2) commute with finite direct sums and summands; this gives (3) (Tsuzuki proof of Lemma 3.33, p.20).

**Direct prerequisites.** [MS.0/curve-generic-field](#curve-generic-field); [PadicDifferentialEquationsAndRigidCohomology:RD.3/affine-frame-global-sections-equivalence](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/zariski-stack-of-overconvergent-isocrystals](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/completion-versus-overconvergence](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Lemma 3.1, p.11; Lemma 3.2, p.12; proof of Lemma 3.33, p.20](https://arxiv.org/pdf/1910.03871v3).

**Check.** On C=G_m with C̄=P¹, the series Σ_{n≥0}p^nx^{p^n} lies in Â_{C,K} and in E_η, but not in E†_∞, so it is not in A†_{C,K}; the boundary condition at ∞ is essential.

<a id="curve-gluing"></a>

### Interior and boundary gluing

**Target `MS.2/curve-gluing` (theorem).** For affine C with smooth completion C̄, a generic differential Frobenius submodule Lη⊂Mη comes from a unique dagger subobject of M† if it has compatible saturated bounded-disc submodules at every point of C and compatible E† boundary submodules at every point of C̄∖C. The subobject realises all the specified local data.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. For unit-root Lη apply the K^σ-representation correspondence, with no interior ramification and finite boundary inertia. The general-coefficient form is a request to RD.3.
2. For rank one first pass to the finite unramified extension of MS.0/fixed-field-normalisation, so the fixed field has the value group of K, twist by a fixed scalar of the rank-one slope to reach unit-root, glue, untwist, and descend by uniqueness. This supplies the omitted normalisation in Lemma 3.33 (E25).
3. For rank r glue the determinant line in ∧^rM†; recover L as the determinant-line dual tensor the kernel of the wedge map to ∧^(r+1)M†. A generic vector that is a section at every interior and boundary point is a dagger section by MS.2/dagger-section-intersection; local full faithfulness gives uniqueness.

**Direct prerequisites.** [MS.2/curve-pbq](#curve-pbq); [MS.1/disc-pbq-descent](#disc-pbq-descent); [MS.1/dagger-pbq-descent](#dagger-pbq-descent); [PadicDifferentialEquationsAndRigidCohomology:RD.1/saturated-subobject-descent-via-exterior-power](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/isocrystals-glued-from-local-frames](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/etale-descent-of-overconvergent-f-isocrystals](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [MS.2/dagger-section-intersection](#dagger-section-intersection); [MS.0/fixed-field-normalisation](#fixed-field-normalisation).

**Sources.** [TSU, Lemmas 3.32–3.33, pp.19–20](https://arxiv.org/pdf/1910.03871v3); [TSU, Lemma A.1(2), pp.37–38](https://arxiv.org/pdf/1910.03871v3).

**Check.** Rank-one slope-one data must be twisted before applying a unit-root correspondence. No claim that every rank-one object is unit-root is used.

<a id="curve-pbq-functoriality"></a>

### PBQ sums and quotients on curves

**Target `MS.2/curve-pbq-functoriality` (theorem).** A finite sum of PBQ dagger subobjects on C with the same generic maximal slope is PBQ. Every nonzero dagger quotient of a PBQ object is PBQ with unchanged generic maximal slope.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Apply the generic PBQ quotient criterion and identify sum and quotient realisations using exact scalar extension.

**Direct prerequisites.** [MS.2/curve-pbq](#curve-pbq); [MS.0/pbq-quotients](#pbq-quotients); [PadicDifferentialEquationsAndRigidCohomology:RD.3/restriction-to-convergent](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Lemma 3.30, p.19](https://arxiv.org/pdf/1910.03871v3).

**Check.** A finite sum of PBQ dagger subobjects on C with the same generic maximal slope is PBQ. Every nonzero dagger quotient of a PBQ object is PBQ with unchanged generic maximal slope.

<a id="curve-pbq-filtration"></a>

### Curve PBQ filtration

**Target `MS.2/curve-pbq-filtration` (theorem).** Every M† on C has a unique PBQ filtration whose generic filtration is pbq-filtration; its interior bounded-disc and boundary bounded Robba realisations are the corresponding local PBQ filtrations. Its graded maximal slopes strictly decrease. Every irreducible M† is PBQ.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Use local PBQ descent and its base-change compatibility to give the gluing data for the generic maximal PBQ term.
2. Apply curve-gluing, then induct on rank. Generic uniqueness and dense-open full faithfulness identify choices and transitions.
3. An irreducible object has no proper nonzero maximal PBQ subobject, so its filtration has one term.

**Direct prerequisites.** [MS.2/curve-gluing](#curve-gluing); [MS.1/pbq-filtration-base-change](#pbq-filtration-base-change); [MS.2/curve-pbq](#curve-pbq); [PadicDifferentialEquationsAndRigidCohomology:RD.5/dense-open-restriction-fully-faithful](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Theorem 3.27 and Corollary 3.28, p.18; proof of Theorem 3.27, pp.20–21](https://arxiv.org/pdf/1910.03871v3).

**Check.** Every M† on C has a unique PBQ filtration whose generic filtration is pbq-filtration; its interior bounded-disc and boundary bounded Robba realisations are the corresponding local PBQ filtrations. Its graded maximal slopes strictly decrease. Every irreducible M† is PBQ.

<a id="finite-etale-pbq"></a>

### Finite étale PBQ transport

**Target `MS.2/finite-etale-pbq` (theorem).** For a finite étale surjective map f:C′→C of smooth connected curves, f* preserves PBQ, and f_* reflects PBQ: if f_*M† is PBQ then M† is PBQ. The source proof is circular (E12); this node proves the pullback assertion directly from the field-extension case of bounded-base-change.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Lift f over a dense affine open to a finite étale map of weak completions with compatible Frobenius (parent lifting lemma); the generic fields form a finite unramified extension E_η⊂E_{η′}, and a coordinate of C is an étale coordinate of C′.
2. The generic module of f*N† is E_{η′}⊗N_η. Bounded-base-change gives B(E_{η′}⊗N_η)=E_{η′}⊗B(N_η), whose Frobenius slopes are those of B(N_η); hence f*N† is PBQ when N† is (and conversely).
3. For the direct image, apply the pullback assertion to f_*M† to get f*f_*M† PBQ, and use the surjective counit f*f_*M†→M† with curve-pbq-functoriality.

**Direct prerequisites.** [MS.2/curve-pbq-functoriality](#curve-pbq-functoriality); [MS.0/bounded-base-change](#bounded-base-change); [PadicDifferentialEquationsAndRigidCohomology:RD.3/finite-etale-pushforward-of-isocrystals](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/finite-etale-lifting-of-mw-algebras](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [MS.0/curve-generic-field](#curve-generic-field).

**Sources.** [TSU, Lemma 3.31, p.19](https://arxiv.org/pdf/1910.03871v3).

**Check.** For the Artin–Schreier cover of A¹ and N† the unit object, f*N† is the unit object of the cover and is PBQ; the direct image f_*O is unit-root and PBQ.

<a id="curve-bounded-quotient"></a>

### Curve bounded quotient

**Target `MS.2/curve-bounded-quotient` (theorem).** If the convergent realisation M on C has a slope filtration, it has a canonical maximally bounded convergent quotient B_C(M), and B_C(M)≅⊕_i Top(G_i), where G_i are the convergent realisations of the graded PBQ pieces of M†. This is a convergent quotient, with a convergent morphism, not a dagger structure on its individual pure factors.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Use bounded-graded-formula locally and the unique pure slope summands to glue the quotient maps.
2. Identify kernels on overlapping affine opens by the universal property; the assumed global slope filtration identifies the pure quotient terms.

**Direct prerequisites.** [MS.2/curve-pbq-filtration](#curve-pbq-filtration); [MS.1/bounded-graded-formula](#bounded-graded-formula); [PadicDifferentialEquationsAndRigidCohomology:RD.1/dense-open-global-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Proposition 3.29, p.19](https://arxiv.org/pdf/1910.03871v3).

**Check.** If the convergent realisation M on C has a slope filtration, it has a canonical maximally bounded convergent quotient B_C(M), and B_C(M)≅⊕_i Top(G_i), where G_i are the convergent realisations of the graded PBQ pieces of M†. This is a convergent quotient, with a convergent morphism, not a dagger structure on its individual pure factors.

<a id="legendre-kummer-example"></a>

### Legendre–Kummer PBQ example

**Target `MS.2/legendre-kummer-example` (theorem).** For odd p≡1 mod4, on C=P¹_Fp∖{0,1,∞}, let L† be H¹ of the Legendre family, χ the quadratic character w²=z(z−1), and π_p the p-adic unit root for y²=x³−x. There exists a nonsplit extension 0→L†(χ)→M†→1(π_p²)→0; its PBQ filtration has the two displayed nonzero graded pieces with maximal slopes 1 then 0. It is not a self-extension.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Use the stated K3 cohomological calculation: H¹_rig(C,L†(χ)) has slopes 0 and 2 when p≡1 mod4, and the slope-zero part yields an invariant extension after the constant π_p² twist.
2. Use irreducibility of the Legendre coefficient and PBQ sums/quotients to identify the two grades. The K3 calculation and extension-class comparison are a precise request to RD.4–RD.6, not reproduced here.

**Direct prerequisites.** [MS.2/curve-pbq-filtration](#curve-pbq-filtration); [PadicDifferentialEquationsAndRigidCohomology:RD.6/kummer-isocrystal](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.4](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.6](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, §3.9, p.21](https://arxiv.org/pdf/1910.03871v3).

**Check.** For odd p≡1 mod4, on C=P¹_Fp∖{0,1,∞}, let L† be H¹ of the Legendre family, χ the quadratic character w²=z(z−1), and π_p the p-adic unit root for y²=x³−x. There exists a nonsplit extension 0→L†(χ)→M†→1(π_p²)→0; its PBQ filtration has the two displayed nonzero graded pieces with maximal slopes 1 then 0. It is not a self-extension.

**Coverage.** Planned. Discharge the RD.3 request for the general-coefficient unit-root correspondence (curve-gluing) and the RD.4 and RD.6 requests for the Legendre–Kummer example.

## MS.3: Saturation

Local and global saturation, quasi-saturation, canonical saturated quotients and recovery from saturated graded PBQ pieces.

**Stage inputs.** [PadicDifferentialEquationsAndRigidCohomology:RD.0](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.5](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.0](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.1](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json).

**Planets.** Local saturation; Quasi-saturation; Saturation on varieties; Saturated quotient; Quasi-saturated rank theorem; Local reconstruction.

<a id="local-saturation"></a>

### Local saturation

**Target `MS.3/local-saturation` (definition).** For M†/E† with M=E⊗M† and maximal slope quotient Top(M), M† is saturated when M†→M→Top(M) is injective as an E†-linear map. This is a property of the canonical map; saturation will be a quotient, not enlargement of M† in M.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Form the parent slope quotient and the restriction of scalars map.
2. Take its kernel in differential Frobenius E†-modules.

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-differential-module](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/generic-slope-decomposition-and-descent](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Definition 4.1, p.22](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Proposition 4.7: constructs the saturated quotient.
- Theorem 4.2: gives uniqueness of reconstruction.

**API.**

- `Saturated.ker` (characterisation): M† is saturated iff the E†-kernel of M†→Top(M) vanishes.
- `Saturated.pure` (compatibility): If M is pure, M† is saturated.
- `Saturated.hom_ext` (extensionality): For saturated target N†, two dagger maps M†→N† agreeing after N†→Top(N) are equal.

**Unit tests.**

- `sat_pure` (computation): A pure rank-one module is saturated.
- `sat_zero` (degenerate): The zero map from the zero object is injective; zero is saturated though not PBQ.
- `sat_split` (non-example): L_1⊕L_0 with distinct slopes is not saturated: the lower-slope line is in the kernel.

<a id="quasi-saturation"></a>

### Quasi-saturation

**Target `MS.3/quasi-saturation` (definition).** For a pure E-module P, an injective E†-linear horizontal Frobenius map f:N†→P is quasi-saturated if E·f(N†)=P. Thus E⊗N†→P is surjective. Its kernel can be nonzero even though f is injective.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Specify the injection and pure target as data, then use the span condition.
2. Retain the source map rather than equating N† with an E-lattice of the same dimension.

**Direct prerequisites.** [MS.3/local-saturation](#local-saturation); `LinearMap.quotKerEquivRange` (Mathlib baseline).

**Sources.** [TSU, Definition 4.3, p.22](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Proposition 4.9: derives saturation and rank equality.
- Proposition 6.1: has a global analogue on curves.

**API.**

- `QuasiSaturated.span` (characterisation): Quasi-saturation is equivalent to surjectivity of E⊗N†→P.
- `QuasiSaturated.image` (constructor): For any nonzero dagger map to P, its E† image is quasi-saturated in its E-span, which remains pure.
- `QuasiSaturated.top` (compatibility): The canonical map Top(E⊗N†)→P is an isomorphism by opposite-rank-bound.

**Unit tests.**

- `quasisat_identity` (computation): The rank-one inclusion E†→E is quasi-saturated in E.
- `quasisat_target` (non-example): E†→E² into the first coordinate is not quasi-saturated in E².
- `quasisat_scalar_extension` (non-example): For α∈E∖E†, the injection (E†)²→E, (a,b)↦a+αb, spans E but its E-linearisation has a one-dimensional kernel; this tests the carrier distinction, without asserting arbitrary α gives a Frobenius module.

<a id="pbq-submodule-slope"></a>

### Pure target slope detection

**Target `MS.3/pbq-submodule-slope` (theorem).** If θ†:N†→P is injective as an E†-linear horizontal Frobenius map and P is pure, then λmax(E⊗N†)=slope(P). For any map with surjective E-linearisation, its E† image L† is quasi-saturated, rank Top(E⊗L†)≥rank P, and equality identifies the top quotient with P and makes L† saturated.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Restrict θ† to the nonzero maximal PBQ subobject of N†. Its nonzero image is a PBQ quotient of the same maximal slope, whereas its E-span is pure of slope(P); hence the slopes agree.
2. Surjectivity after E-linearisation factors through the top quotient, giving the rank inequality. Equality makes this pure quotient map an isomorphism; injection of L† into P then gives saturation.

**Direct prerequisites.** [MS.0/pbq-quotients](#pbq-quotients); [MS.1/dagger-pbq-descent](#dagger-pbq-descent); [MS.3/local-saturation](#local-saturation).

**Sources.** [TSU, Propositions 4.4–4.6, p.22](https://arxiv.org/pdf/1910.03871v3).

**Check.** The injective map into the pure target is essential; PBQ alone does not imply every subobject has the same maximal slope.

<a id="global-saturation"></a>

### Saturation on varieties

**Target `MS.3/global-saturation` (definition).** For a smooth connected variety X and M†, choose a dense affine open U where M has a slope filtration. M† is saturated if Γ(U,M†)→Γ(U,Top(M|U)) is injective for every such U. The condition can be tested on a single such U and is invariant under restriction to dense opens.

**Hypotheses.** X is a smooth connected separated scheme of finite type over a perfect field k of characteristic p; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Use the parent affine global-sections realisation, slope filtration and exact faithful restriction.
2. The v3 proof of Proposition 5.2 transports the kernel through the canonical image object; localise a finite projective module and use full faithfulness to show vanishing on one U forces global vanishing.

**Direct prerequisites.** [MS.3/local-saturation](#local-saturation); [PadicDifferentialEquationsAndRigidCohomology:RD.3/affine-frame-global-sections-equivalence](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/dense-open-global-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.5/dense-open-restriction-fully-faithful](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Definition 5.1, Proposition 5.2, Lemma 5.3, Corollary 5.4 and Remark 5.7, pp.24–25](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Proposition 5.8: constructs canonical quotient without assuming a global slope filtration.
- Corollary 6.5: provides uniqueness of a given-map lift.

**API.**

- `GlobalSaturated.oneAffine` (characterisation): Injectivity on one dense affine slope-filtered U is equivalent to saturation.
- `GlobalSaturated.restrict` (compatibility): Saturation is preserved and reflected by restriction to a dense open.
- `GlobalSaturated.genericCurve` (compatibility): On a curve, saturation is equivalent to injection of dagger sections into the generic maximal slope quotient.

**Unit tests.**

- `globalsat_unit` (computation): The constant rank-one object is saturated on every smooth connected X.
- `globalsat_zero` (degenerate): Zero is saturated.
- `globalsat_split` (non-example): A split sum of constant slopes 1 and 0 is not saturated, on every nonempty affine open.

<a id="saturated-quotient"></a>

### Saturated quotient

**Target `MS.3/saturated-quotient` (definition).** Set Sat(M†)=im_E†(M†→Top(M)), equivalently M†/ker(M†→Top(M)). It is a differential Frobenius E†-module with canonical surjection from M†. Its E-realisation can have rank larger than Top(M); nevertheless its maximal-slope quotient is canonically Top(M) and it is saturated.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Apply the image/quotient construction at the existing E† carrier (compatible with LinearMap.quotKerEquivRange).
2. Use opposite-rank-bound to identify the top quotient of the image’s E-realisation with Top(M), proving saturation.

**Direct prerequisites.** [MS.3/quasi-saturation](#quasi-saturation); [MS.0/opposite-rank-bound](#opposite-rank-bound); `LinearMap.quotKerEquivRange` (Mathlib baseline).

**Sources.** [TSU, Proposition 4.7 and Definition 4.8, p.22](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Theorem 4.11: recovers saturated PBQ grades.
- Proposition 5.8: globalises the quotient.

**API.**

- `Sat.quotient` (constructor): The map M†→Sat(M†) is surjective and its kernel is exactly ker(M†→Top(M)).
- `Sat.topIso` (compatibility): Top(M)→Top(E⊗Sat(M†)) is the canonical isomorphism induced by the quotient map.
- `Sat.idempotent` (characterisation): Sat(M†) is saturated and Sat(Sat(M†))≅Sat(M†), compatibly with both quotient maps.

**Unit tests.**

- `satq_pure` (computation): For pure M, Sat(M†)=M†.
- `satq_zero` (degenerate): Sat(0)=0.
- `satq_split` (non-example): Sat(L_1⊕L_0)=L_1 for slopes 1>0; an enlargement retaining both summands is the wrong construction.

<a id="saturation-transport"></a>

### Saturation transport

**Target `MS.3/saturation-transport` (theorem).** Every irreducible dagger object on a smooth connected variety is saturated. Saturation is preserved by finite étale pullback and pushforward, finite coefficient extension with compatible Frobenius, and positive Frobenius iteration; on a curve PBQ and saturation are still distinct properties.

**Hypotheses.** X is a smooth connected separated scheme of finite type over a perfect field k of characteristic p; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. On a dense affine open the kernel of the top map is a dagger subobject; irreducibility excludes a nonzero proper kernel.
2. For finite étale maps use affine lifts and the finite-projective direct-image decomposition, not the PBQ transport lemma.
3. Use faithful flat finite coefficients, and note Frobenius iteration scales all slopes by the same positive factor if normalisation is not changed.

**Direct prerequisites.** [MS.3/global-saturation](#global-saturation); [PadicDifferentialEquationsAndRigidCohomology:RD.3/finite-etale-pushforward-of-isocrystals](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/finite-coefficient-extension-interface](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/finite-etale-lifting-of-mw-algebras](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Corollary 5.5 and Proposition 5.6, pp.25–26](https://arxiv.org/pdf/1910.03871v3).

**Check.** Every irreducible dagger object on a smooth connected variety is saturated. Saturation is preserved by finite étale pullback and pushforward, finite coefficient extension with compatible Frobenius, and positive Frobenius iteration; on a curve PBQ and saturation are still distinct properties.

<a id="quasi-saturated-rank"></a>

### Quasi-saturated rank theorem

**Target `MS.3/quasi-saturated-rank` (theorem).** A quasi-saturated N†⊂P with P pure is saturated and Top(E⊗N†)→P is an isomorphism. A local dagger object is irreducible iff it is PBQ and saturated and its top quotient is irreducible.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Apply opposite-rank-bound to get equality of top ranks and the canonical top isomorphism.
2. For an irreducible object the first PBQ term and the saturated kernel are either zero or everything, yielding PBQ and saturation.
3. Conversely a nonzero subobject detects the maximal slope by pbq-submodule-slope; top irreducibility and PBQ exclude a proper quotient.

**Direct prerequisites.** [MS.0/opposite-rank-bound](#opposite-rank-bound); [MS.3/quasi-saturation](#quasi-saturation); [MS.3/saturated-quotient](#saturated-quotient); [MS.3/pbq-submodule-slope](#pbq-submodule-slope).

**Sources.** [TSU, Proposition 4.9 and Corollary 4.10, p.23](https://arxiv.org/pdf/1910.03871v3).

**Check.** A quasi-saturated N†⊂P with P pure is saturated and Top(E⊗N†)→P is an isomorphism. A local dagger object is irreducible iff it is PBQ and saturated and its top quotient is irreducible.

<a id="global-saturated-quotient"></a>

### Canonical saturated quotient

**Target `MS.3/global-saturated-quotient` (definition).** For any M† on smooth connected X, construct a saturated dagger quotient M†→Sat_X(M†) whose restriction on a dense affine slope locus is the image in Top(M). If the realisation has a global slope filtration, it preserves Top(M) globally. It is unique up to the unique isomorphism commuting with the quotient maps, and needs no global slope filtration for its construction.

**Hypotheses.** X is a smooth connected separated scheme of finite type over a perfect field k of characteristic p; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Take the affine image quotient using saturated-quotient and the v3 one-affine kernel argument.
2. Use dense-open subquotient extension and uniqueness of the image kernel to extend and glue the quotient.
3. The kernel characterisation gives uniqueness relative to the quotient map, and saturation gives idempotence.

**Direct prerequisites.** [MS.3/global-saturation](#global-saturation); [MS.3/saturated-quotient](#saturated-quotient); [PadicDifferentialEquationsAndRigidCohomology:RD.5/dense-open-restriction-fully-faithful](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/zariski-stack-of-overconvergent-isocrystals](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Proposition 5.8 and Definition 5.9, pp.25–26](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Theorem 6.4: saturates graded pieces before reconstruction.
- MonodromyGroups split, PBS filtration: imports the curve construction without duplicating it.

**API.**

- `GlobalSat.quotient` (constructor): There is a canonical surjection M†→Sat_X(M†).
- `GlobalSat.top` (compatibility): On every dense slope locus the induced top quotient map is an isomorphism.
- `GlobalSat.unique` (universal-property): Two image quotients with this kernel have a unique comparison isomorphism commuting with the maps from M†.

**Unit tests.**

- `globalSat_line` (computation): Sat_X of a rank-one object is itself.
- `globalSat_zero` (degenerate): Sat_X(0)=0.
- `globalSat_split` (non-example): For the constant sum of slopes 1 and 0 the quotient has rank one; its quotient map is not an inclusion.

<a id="local-graded-recovery"></a>

### Local graded recovery

**Target `MS.3/local-graded-recovery` (theorem).** An isomorphism B(N)→B(M) induces a unique isomorphism ⊕_i Sat(G_i(N†))→⊕_i Sat(G_i(M†)) compatible with the top quotient of each PBQ grade. The strictly decreasing slopes canonically match the grades.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. Match pure slope factors using bounded-graded-formula.
2. For one grade take the dagger image of the graph of its given top isomorphism; the rank theorem and PBQ quotient criterion force both projections to be isomorphisms after saturation.
3. Saturation makes the inducing maps unique, then take their direct sum.

**Direct prerequisites.** [MS.1/bounded-graded-formula](#bounded-graded-formula); [MS.1/dagger-pbq-descent](#dagger-pbq-descent); [MS.3/quasi-saturated-rank](#quasi-saturated-rank); [MS.0/pbq-quotients](#pbq-quotients).

**Sources.** [TSU, Theorem 4.11, p.23](https://arxiv.org/pdf/1910.03871v3).

**Check.** An isomorphism B(N)→B(M) induces a unique isomorphism ⊕_i Sat(G_i(N†))→⊕_i Sat(G_i(M†)) compatible with the top quotient of each PBQ grade. The strictly decreasing slopes canonically match the grades.

<a id="local-reconstruction"></a>

### Local reconstruction

**Target `MS.3/local-reconstruction` (theorem).** Let h:Top(N)→Top(M). If M†,N† are irreducible and h≠0, or if they are PBQ and saturated and h is invertible, then there is a unique dagger isomorphism N†→M† inducing exactly h.

**Hypotheses.** K is a complete discretely valued field of characteristic zero, with perfect residue field k of characteristic p>0, q=p^s (s>0), and an isometric lift σ of q-Frobenius. E, E† and K[[t]]₀ are the parent Amice, bounded Robba and bounded-disc carriers. Frobenius is horizontal and invertible after linearisation.

**Proof or construction.**

1. In the irreducible case the top objects are irreducible by quasi-saturated-rank, so h is invertible.
2. Apply local-graded-recovery to the one PBQ grade and use saturation.

**Direct prerequisites.** [MS.3/local-graded-recovery](#local-graded-recovery); [MS.3/quasi-saturated-rank](#quasi-saturated-rank).

**Sources.** [TSU, Theorem 4.2, p.22; proof, p.23](https://arxiv.org/pdf/1910.03871v3).

**Check.** Let h:Top(N)→Top(M). If M†,N† are irreducible and h≠0, or if they are PBQ and saturated and h is invertible, then there is a unique dagger isomorphism N†→M† inducing exactly h.

**Coverage.** Planned.

## MS.4: Curve reconstruction

The curve rank theorem, extension tests, reconstruction of a specified maximal-slope map and the dual minimal-slope theorem.

**Stage inputs.** [PadicDifferentialEquationsAndRigidCohomology:RD.1](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.5](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.0](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.2](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.3](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json).

**Planets.** Curve quasi-saturated rank; Curve graded recovery; Specified curve lift; Minimal slope reconstruction.

<a id="boundary-pbq-kernel"></a>

### Boundary PBQ kernel gluing

**Target `MS.4/boundary-pbq-kernel` (theorem).** In the situation of curve-rank below, if rank Top(N)>rank P, set H=ker(N→P) and let L be its maximal PBQ convergent subobject of the same top slope. At each boundary point α, take the E†-kernel of N†_α→P_α and its maximal PBQ subobject L†_α. Then E_α⊗L†_α≅L_α and these local terms glue to a nonzero dagger subobject of N† whose convergent realisation lies in H.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Use quasi-saturated-rank on the boundary image to compute the equality of maximal-slope kernel ranks (v3 Claim (1)).
2. Flatness gives an injection of the local PBQ kernel into the convergent PBQ kernel (Claim (2)).
3. Their top quotients agree; a nonzero cokernel would be a PBQ quotient of the same maximal slope, contradicting strictness of the top rank (Claim (3)). Apply curve-gluing. No saturation of these kernels is assumed.

**Direct prerequisites.** [MS.3/quasi-saturated-rank](#quasi-saturated-rank); [MS.2/curve-pbq-filtration](#curve-pbq-filtration); [MS.0/pbq-quotients](#pbq-quotients); [MS.2/curve-gluing](#curve-gluing); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Proof of Proposition 6.1, Claims (1)–(3), pp.26–27](https://arxiv.org/pdf/1910.03871v3).

**Check.** In the situation of curve-rank below, if rank Top(N)>rank P, set H=ker(N→P) and let L be its maximal PBQ convergent subobject of the same top slope. At each boundary point α, take the E†-kernel of N†_α→P_α and its maximal PBQ subobject L†_α. Then E_α⊗L†_α≅L_α and these local terms glue to a nonzero dagger subobject of N† whose convergent realisation lies in H.

<a id="curve-rank"></a>

### Curve quasi-saturated rank

**Target `MS.4/curve-rank` (theorem).** Let P be an isoclinic convergent F-isocrystal on C, N† a dagger object with slope-filtered realisation N, and N→P a surjection. If the induced dagger-section map Γ(U,N†)→Γ(U,P) is injective on one dense affine U, then λmax(N)=slope(P) and rank Top(N)=rank P.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. The first PBQ term of N† injects nontrivially into P, so the PBQ quotient criterion fixes its maximal slope.
2. Surjectivity gives rank Top(N)≥rank P. If strict, boundary-pbq-kernel glues a nonzero dagger subobject killed in P, contrary to the assumed injection.
3. For proper C the dagger and convergent categories coincide and slope strictness makes the assertion immediate.

**Direct prerequisites.** [MS.4/boundary-pbq-kernel](#boundary-pbq-kernel); [MS.2/curve-pbq-functoriality](#curve-pbq-functoriality); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Proposition 6.1, pp.26–27](https://arxiv.org/pdf/1910.03871v3).

**Check.** Let P be an isoclinic convergent F-isocrystal on C, N† a dagger object with slope-filtered realisation N, and N→P a surjection. If the induced dagger-section map Γ(U,N†)→Γ(U,P) is injective on one dense affine U, then λmax(N)=slope(P) and rank Top(N)=rank P.

<a id="curve-irreducibility"></a>

### Curve irreducibility criterion

**Target `MS.4/curve-irreducibility` (theorem).** A dagger object on C is irreducible iff it is PBQ and saturated and Top(M|U) is irreducible for every dense slope-filtered U. If a global slope filtration exists, the top condition may be checked globally.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. For an irreducible object take any nonzero quotient of its top; its restricted dagger map is injective and curve-rank makes the quotient equal to the top.
2. Conversely inject a nonzero dagger subobject into the irreducible top via saturation. The quotient would have smaller maximal slope, contradicting PBQ unless zero.

**Direct prerequisites.** [MS.4/curve-rank](#curve-rank); [MS.2/curve-pbq-filtration](#curve-pbq-filtration); [MS.3/global-saturation](#global-saturation); [MS.2/curve-pbq-functoriality](#curve-pbq-functoriality).

**Sources.** [TSU, Proposition 6.2, p.27](https://arxiv.org/pdf/1910.03871v3).

**Check.** A dagger object on C is irreducible iff it is PBQ and saturated and Top(M|U) is irreducible for every dense slope-filtered U. If a global slope filtration exists, the top condition may be checked globally.

<a id="curve-graded-recovery"></a>

### Curve graded recovery

**Target `MS.4/curve-graded-recovery` (theorem).** For slope-filtered realisations, a convergent isomorphism B_C(N)→B_C(M) induces a unique dagger isomorphism between the direct sums of the saturated graded PBQ pieces, compatible with the given map on each maximal pure quotient. The PBQ grades are matched by strictly decreasing maximal slopes.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Identify the bounded quotients by curve-bounded-quotient.
2. For each same-slope pair take the dagger image of the sum map into the identified pure quotient, apply curve-rank, and use PBQ quotient stability to force equality of both saturated images.
3. Use global-saturation for uniqueness. The map here is global and convergent; its target is not a generic-point carrier.

**Direct prerequisites.** [MS.2/curve-bounded-quotient](#curve-bounded-quotient); [MS.4/curve-rank](#curve-rank); [MS.3/global-saturated-quotient](#global-saturated-quotient); [MS.2/curve-pbq-functoriality](#curve-pbq-functoriality).

**Sources.** [TSU, Theorem 6.4, p.27](https://arxiv.org/pdf/1910.03871v3).

**Check.** For slope-filtered realisations, a convergent isomorphism B_C(N)→B_C(M) induces a unique dagger isomorphism between the direct sums of the saturated graded PBQ pieces, compatible with the given map on each maximal pure quotient. The PBQ grades are matched by strictly decreasing maximal slopes.

<a id="curve-extension-tests"></a>

### Curve extension trichotomy

**Target `MS.4/curve-extension-tests` (theorem).** For an extension 0→L†→M†→N†→0 with L†,N† irreducible of maximal slopes a,b: if a<b, M† is not saturated and is PBQ exactly when nonsplit; if a=b, M† is PBQ and saturated with reducible top, and the extension is nonsplit exactly when its top extension is; if a>b, its PBQ filtration is the displayed two-step filtration and it is saturated exactly when nonsplit. In the last case, total rank two forces splitting.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Use curve-irreducibility to identify saturated PBQ factors.
2. Apply the PBQ quotient criterion and top-map kernels in each slope order; full faithfulness detects splitting.
3. For total rank two in the last case both factors have rank one, the convergent extension splits by slope separation, and full faithfulness returns the splitting.

**Direct prerequisites.** [MS.4/curve-irreducibility](#curve-irreducibility); [MS.2/curve-pbq-functoriality](#curve-pbq-functoriality); [MS.2/curve-pbq-filtration](#curve-pbq-filtration); [PadicDifferentialEquationsAndRigidCohomology:RD.3/full-faithfulness-overconvergent-to-convergent](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Example 6.3, p.27](https://arxiv.org/pdf/1910.03871v3).

**Check.** No general assertion that all higher-slope extensions split: the final splitting assertion uses total rank two.

<a id="specified-curve-lift"></a>

### Specified curve lift

**Target `MS.4/specified-curve-lift` (theorem).** Let h:Top(N)→Top(M) be a convergent morphism on C and assume both realisations have slope filtrations. If either (i) M† and N† are irreducible and h≠0, or (ii) both are PBQ and saturated and h is an isomorphism, then there exists a unique dagger isomorphism g†:N†→M† inducing h.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. In case (i), curve-irreducibility makes h an isomorphism.
2. Each object has one PBQ grade and equals its saturation; apply curve-graded-recovery.
3. The injection into the pure quotient proves uniqueness.

**Direct prerequisites.** [MS.4/curve-graded-recovery](#curve-graded-recovery); [MS.4/curve-irreducibility](#curve-irreducibility).

**Sources.** [TSU, Corollary 6.5, p.28; Theorem 1.3, p.2](https://arxiv.org/pdf/1910.03871v3).

**Check.** Let h:Top(N)→Top(M) be a convergent morphism on C and assume both realisations have slope filtrations. If either (i) M† and N† are irreducible and h≠0, or (ii) both are PBQ and saturated and h is an isomorphism, then there exists a unique dagger isomorphism g†:N†→M† inducing h.

<a id="weak-quotient-hypothesis"></a>

### Isoclinic quotient formulation

**Target `MS.4/weak-quotient-hypothesis` (theorem).** The specified-curve-lift assertion remains valid if the slope-filtration hypothesis is replaced by convergent quotients N→Q_N and M→Q_M which are isoclinic, with every slope of each kernel strictly smaller than its quotient slope at every point of C. Use h:Q_N→Q_M and the same alternatives (i) or (ii).

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Choose a dense open where both slope filtrations exist; the prescribed quotients there are the maximal-slope quotients by slope strictness.
2. Apply specified-curve-lift on that open and use dense-open full faithfulness and subquotient closure to extend the isomorphism.
3. Faithfulness of restriction identifies its quotient map with h on all C and proves uniqueness.

**Direct prerequisites.** [MS.4/specified-curve-lift](#specified-curve-lift); [PadicDifferentialEquationsAndRigidCohomology:RD.1/dense-open-global-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.5/dense-open-restriction-fully-faithful](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Remark 6.6(2), p.28](https://arxiv.org/pdf/1910.03871v3).

**Check.** The specified-curve-lift assertion remains valid if the slope-filtration hypothesis is replaced by convergent quotients N→Q_N and M→Q_M which are isoclinic, with every slope of each kernel strictly smaller than its quotient slope at every point of C. Use h:Q_N→Q_M and the same alternatives (i) or (ii).

<a id="minimal-slope-dual"></a>

### Minimal slope reconstruction

**Target `MS.4/minimal-slope-dual` (theorem).** For irreducible dagger objects M†,N† on C with slope-filtered realisations, every nonzero convergent map a:S_min(M)→S_min(N) lifts to a unique dagger isomorphism M†→N†. Equivalently a nonzero map S_min(N)→S_min(M) lifts in that direction. Top(M∨)=S_min(M)∨ and the slopes change sign.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Dualise a to S_min(N)∨→S_min(M)∨, hence Top(N∨)→Top(M∨).
2. Apply specified-curve-lift to obtain N†∨→M†∨; dualise to M†→N† and identify double duals.
3. Use functoriality of duality to check the given map and uniqueness.

**Direct prerequisites.** [MS.4/specified-curve-lift](#specified-curve-lift); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/restriction-to-convergent](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Conjectures 1.1–1.2, pp.1–2; Corollary 6.5, p.28](https://arxiv.org/pdf/1910.03871v3).

**Check.** For irreducible dagger objects M†,N† on C with slope-filtered realisations, every nonzero convergent map a:S_min(M)→S_min(N) lifts to a unique dagger isomorphism M†→N†. Equivalently a nonzero map S_min(N)→S_min(M) lifts in that direction. Top(M∨)=S_min(M)∨ and the slopes change sign.

**Coverage.** Planned.

## MS.5: Dagger hulls and minimal slopes

Dagger hulls, reductions of MS, the generic reverse-filtration proof, integral-model comparison, curve MS and docile Lefschetz full faithfulness.

**Stage inputs.** [PadicDifferentialEquationsAndRigidCohomology:RD.0](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.5](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.0](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.4](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json).

**Planets.** Dagger hull; Docile Lefschetz full faithfulness; Minimal slope property; Generic minimal slopes; Minimal slopes on curves.

<a id="dagger-hull"></a>

### Dagger hull

**Target `MS.5/dagger-hull` (definition).** For a convergent sub-F^n-isocrystal N⊂M where M comes from M†, Hull†_M(N) is the smallest convergent subobject of M containing N which extends overconvergently as a subobject of M†. It is obtained by the finite intersection of all such subobjects; finite length and full faithfulness make this well-defined. The ambient object is part of the data.

**Hypotheses.** X is a smooth connected separated scheme of finite type over a perfect field k of characteristic p; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. The family is nonempty since it contains M. Choose a member of minimal rank; intersections stay dagger-extendable by exact full faithfulness and cannot lower rank.
2. Thus it is contained in every member and contains N, independently of the chosen minimal-rank member.

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.3/full-faithfulness-overconvergent-to-convergent](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/restriction-to-convergent](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [DAD, Definition 4.1.1 and footnote 6, p.11](https://arxiv.org/pdf/2012.12879v4).

**Uses that determine the API.**

- Proposition 4.2.2: compares minimal slopes with the hull.
- MonodromyGroups Theorem 4.4.12: identifies the slope-filtration stabiliser.

**API.**

- `DaggerHull.contains` (structure): N⊂Hull†_M(N)⊂M and the hull is dagger-extendable as a subobject of M†.
- `DaggerHull.minimal` (universal-property): If N⊂L⊂M and L is dagger-extendable, then Hull†_M(N)⊂L.
- `DaggerHull.idempotent` (characterisation): The hull of the hull is itself, and the hull equals N exactly when N is dagger-extendable in M.

**Unit tests.**

- `hull_zero` (degenerate): Hull†_M(0)=0.
- `hull_extendable` (compatibility): A dagger subobject of M† is unchanged by the hull.
- `hull_ordinary` (non-example): For an irreducible rank-two ordinary dagger object on a curve, its convergent unit-root line has hull the entire rank-two object; dagger hull is not the identity on arbitrary convergent subobjects.

<a id="integral-models"></a>

### Affine integral models

**Target `MS.5/integral-models` (definition).** For n≥1 let A_n be the image of W(k)⟨u₁,…,u_n⟩→W(k)⟨u⟩, u_i↦pu^i; write ū_i=pu^i. Let B_n be the image in O_E of (A_n[t])_(p,t,ū₁,…,ū_n), where u=1/t. Let B′_n=A_n[t]/(ū₁t−p), and B̃_n its localisation at that ideal. B̃_n→B_n has kernel killed by p^(n−1); colim A_n[1/p]=K⟨u⟩† and colim B̂_n[1/p]=colim B̃̂_n[1/p]=E†.

**Hypotheses.** k is perfect of characteristic p; W=W(k), K=W[1/p], with Witt Frobenius and t↦t^p. The complete generic field E of k(t) and its dagger subfield are those of DAD §4.2; the local Laurent-series field is not silently substituted.

**Proof or construction.**

1. Use restricted-series generators, ordinary ring images and localisation, then p-adic completion.
2. The relations ū_it^i=p hold in B_n, while p^(i−1)(ū_it^i−p) follows from ū₁t=p; this gives the stated bounded kernel.
3. Compare radii of convergence of finitely many generators to identify both filtered colimits.

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/completion-versus-overconvergence](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [DAD, §4.2.9, pp.15–16](https://arxiv.org/pdf/2012.12879v4).

**Uses that determine the API.**

- Lemma 4.2.10: controls tensor injection.
- Proposition 4.2.12: compares affine and generic dagger images.

**API.**

- `IntegralModel.generators` (data): The map A_n→W(k)⟨u⟩ sends ū_i to pu^i and preserves all their multiplicative relations.
- `IntegralModel.kernel` (relation): The kernel of B̃_n→B_n is annihilated by p^(n−1), with n=1 giving an isomorphism.
- `IntegralModel.colimit` (compatibility): After inverting p and the stated completions the colimits recover the parent dagger fields, not the full completion.

**Unit tests.**

- `model_n1` (computation): For n=1, the single relation is ū₁t=p and B̃₁=B₁.
- `model_denominators` (non-example): u is not an integral generator of A₁, while pu is; replacing A_n by W⟨u⟩ changes the induced topology.
- `model_bounded_kernel` (characterisation): At n=2, p(ū₂t²−p)=0 in B′₂, without imposing ū₂t²=p as a defining relation.

<a id="docile-lefschetz"></a>

### Docile Lefschetz full faithfulness

**Target `MS.5/docile-lefschetz` (theorem).** Let (X̄,Z) be a smooth connected projective variety over a perfect field k (any base tuple, Abe–Esnault Remark 2.5), dim X̄≥2, with Z a simple normal crossings divisor. Let C̄ be a smooth curve that is a complete intersection of ample divisors in good position with respect to Z (transverse to every stratum of Z); put X=X̄∖Z and C=C̄∩X. Restriction from docile overconvergent isocrystals on X to docile overconvergent isocrystals on C is fully faithful, and so is its Frobenius version. Essential surjectivity is not claimed.

**Hypotheses.** X̄ is smooth connected projective over a perfect field of characteristic p and Z⊂X̄ a simple normal crossings divisor; docile means unipotent monodromy along Z (parent RD.5). The curve C̄ is a complete intersection of ample divisors in good position with respect to Z.

**Proof or construction.**

1. For any two docile objects, internal Hom is docile. Their nilpotent log extensions give the H⁰ restriction isomorphism of AE Corollary 2.4.
2. Identify horizontal H⁰ with Hom and take the Frobenius-fixed part for F-morphisms.
3. The supporting localisation/vanishing theorem of AE Theorems 2.2–2.3 belongs to the shared arithmetic D-module continuation and is recorded as gap G3 until that supplier exists.

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.5/unipotent-monodromy-along-boundary](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.5/log-extension-of-unipotent-isocrystal](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/full-faithfulness-overconvergent-to-convergent](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [DAD, Theorem 4.4.2, p.19](https://arxiv.org/pdf/2012.12879v4); [AE, Corollary 2.4 and Remark 2.5, p.12](https://page.mi.fu-berlin.de/esnault/preprints/helene/123_abe_esn.pdf).

**Check.** Let (X̄,Z) be as stated, with C̄ a complete intersection of ample divisors in good position with respect to Z. For docile E,F on X, Hom(E,F)→Hom(E|C,F|C) is bijective.

<a id="minimal-slope-property"></a>

### Minimal slope property

**Target `MS.5/minimal-slope-property` (definition).** For dagger-extendable M with constant Newton polygon, MS(M) says that for every convergent sub-F^n-object N⊂M, S_min(N)=S_min(Hull†_M(N)) as subobjects of M. MS(X) quantifies over n>0 and all such M on X. Constant-slope loci, rather than arbitrary jumping families, supply these subobjects.

**Hypotheses.** X is a smooth connected separated scheme of finite type over a perfect field k of characteristic p; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Use the existing increasing slope filtration and dagger-hull.
2. Interpret equality inside the common ambient M so the claim contains the identification map, not only equality of ranks or numerical slopes.

**Direct prerequisites.** [MS.5/dagger-hull](#dagger-hull); [PadicDifferentialEquationsAndRigidCohomology:RD.1/dense-open-global-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [DAD, Notation 4.1.2, p.11; Theorem 4.1.3, p.12](https://arxiv.org/pdf/2012.12879v4).

**Uses that determine the API.**

- Theorem 4.2.13: proves MS on curves.
- MonodromyGroups Theorem 4.1.3: imports curve MS for the higher-dimensional proof.

**API.**

- `MS.isoclinic` (characterisation): For isoclinic N, MS identifies N with the first slope piece of its hull.
- `MS.extendable` (compatibility): An already dagger-extendable N satisfies the equality tautologically.
- `MS.ambient` (structure): The equality is an equality of subobjects of M, hence includes the original inclusion N→M.

**Unit tests.**

- `ms_zero` (degenerate): N=0 gives equality of two zero subobjects.
- `ms_pure` (computation): If the ambient object is pure, every convergent subobject and its hull have that slope; MS still demands equality of objects, not only equality of slopes.
- `ms_ordinary` (non-example): For an irreducible ordinary rank-two dagger object, MS identifies the unit-root line with the minimal piece of the rank-two hull; it does not make the hull rank one.

<a id="dual-hull"></a>

### Dual image model of the hull

**Target `MS.5/dual-hull` (definition).** For N⊂M=E⊗M†, put Q†=im((M†)∨→M∨→N∨) as an E†-module. Its E-linearised map to N∨ is surjective and need not be injective. Dualising gives N⊂(E⊗Q†)∨⊂M; this middle subobject is the dagger hull of N.

**Hypotheses.** k is perfect of characteristic p; W=W(k), K=W[1/p], with Witt Frobenius and t↦t^p. The complete generic field E of k(t) and its dagger subfield are those of DAD §4.2; the local Laurent-series field is not silently substituted.

**Proof or construction.**

1. Form the image over E† and use the quotient–image equivalence at that field.
2. Every dagger-extendable subobject containing N gives a dual quotient through which the image factors. Dualise to prove the universal minimality of the middle subobject.

**Direct prerequisites.** [MS.5/dagger-hull](#dagger-hull); `LinearMap.quotKerEquivRange` (Mathlib baseline); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [DAD, Construction 4.2.3 and Lemma 4.2.4, p.14](https://arxiv.org/pdf/2012.12879v4).

**Uses that determine the API.**

- Proposition 4.2.2: reduces generic MS to the opposite-rank-bound.
- Proposition 4.2.12: is also the model used for the affine-line comparison.

**API.**

- `DualHull.image` (constructor): Q† is the E†-image of the restriction map on duals.
- `DualHull.linearisation` (structure): E⊗Q†→N∨ is surjective, with its kernel retained.
- `DualHull.hullIso` (equivalence): (E⊗Q†)∨ identifies with Hull†_M(N), respecting both inclusions.

**Unit tests.**

- `dualhull_zero` (degenerate): N=0 gives Q†=0 and zero hull.
- `dualhull_full` (computation): N=M gives Q†=(M†)∨ and hull M.
- `dualhull_kernel` (non-example): An E†-injection into N∨ may acquire a kernel after E-linearisation; the model must not replace E⊗Q† by N∨.

<a id="bounded-torsion-tor"></a>

### Bounded torsion and generic tensor injection

**Target `MS.5/bounded-torsion-tor` (theorem).** If an A_n-module T has p-primary torsion killed by p^s, then Tor₁^{A_n}(B′_n,T) is killed by p^s. The canonical map (W⟨u⟩⊗̂_{A_n}B̃_n)^∧[1/p]→E is injective. Neither assertion implies arbitrary finite free injections remain injective after this completed tensor operation without a torsion bound on their cokernel.

**Hypotheses.** k is perfect of characteristic p; W=W(k), K=W[1/p], with Witt Frobenius and t↦t^p. The complete generic field E of k(t) and its dagger subfield are those of DAD §4.2; the local Laurent-series field is not silently substituted.

**Proof or construction.**

1. Use the free two-term resolution with multiplication by ū₁t−p. After inverting p, B′_n is a localisation, so its Tor kernel is p-primary; the given bound kills it.
2. Modulo p^e the tensor-map kernel is generated by ut−1 and killed by p; take compatible p-adic limits and invert p. Localisation is exact.

**Direct prerequisites.** [MS.5/integral-models](#integral-models).

**Sources.** [DAD, Lemmas 4.2.10–4.2.11, p.16](https://arxiv.org/pdf/2012.12879v4).

**Check.** If an A_n-module T has p-primary torsion killed by p^s, then Tor₁^{A_n}(B′_n,T) is killed by p^s. The canonical map (W⟨u⟩⊗̂_{A_n}B̃_n)^∧[1/p]→E is injective. Neither assertion implies arbitrary finite free injections remain injective after this completed tensor operation without a torsion bound on their cokernel.

<a id="ms-reductions"></a>

### Minimal slope reductions

**Target `MS.5/ms-reductions` (theorem).** MS reduces to n=1, then isoclinic subobjects, and can be checked on a dense open. For finite étale Galois f:Y→X, MS(f*M) implies MS(M), and MS(f_*M) implies MS(M) for M on Y. These are implications under the stated Galois hypotheses.

**Hypotheses.** X is a smooth connected separated scheme of finite type over a perfect field k of characteristic p; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Induce an F^n-object to ⊕_{i=0}^{n−1}F^{i*}M with cyclic F; the first slope term is ⊕F^{i*}S_min(N), not the entire induced N.
2. Induct through the slope grades of N and pass to the quotient of the hull by the hull of the penultimate term.
3. Dense-open full faithfulness with subquotient closure identifies hulls under restriction. Under a Galois cover intersect translates of a dagger hull to descend it; use f*f_*M=⊕_g g*M for the direct-image implication.

**Direct prerequisites.** [MS.5/minimal-slope-property](#minimal-slope-property); [MS.5/dagger-hull](#dagger-hull); [PadicDifferentialEquationsAndRigidCohomology:RD.5/dense-open-restriction-fully-faithful](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/etale-descent-of-overconvergent-f-isocrystals](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/finite-etale-pushforward-of-isocrystals](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [DAD, Lemmas 4.1.4–4.1.8, pp.12–13](https://arxiv.org/pdf/2012.12879v4).

**Check.** MS reduces to n=1, then isoclinic subobjects, and can be checked on a dense open. For finite étale Galois f:Y→X, MS(f*M) implies MS(M), and MS(f_*M) implies MS(M) for M on Y. These are implications under the stated Galois hypotheses.

<a id="affine-generic-hull"></a>

### Affine–generic hull comparison

**Target `MS.5/affine-generic-hull` (theorem).** For N⊂M over K⟨u⟩ with M dagger-extendable and constant slopes, the scalar extension of Hull†_M(N) to E equals Hull†_(M_E)(N_E), where u↦1/t. This is an alternate-route target with gap G1: the v4 compactness argument does not establish the needed uniform p-torsion bound.

**Hypotheses.** k is perfect of characteristic p; W=W(k), K=W[1/p], with Witt Frobenius and t↦t^p. The complete generic field E of k(t) and its dagger subfield are those of DAD §4.2; the local Laurent-series field is not silently substituted.

**Proof or construction.**

1. Use the affine version of dual-hull to reduce to injectivity Q†⊗E†→P⊗E for a dagger image Q†↪P.
2. The integral models and bounded-torsion-tor would suffice if one proved the required boundedness for the particular Frobenius-compatible image.
3. The source’s arbitrary finite-free compactness claim fails; a repaired Frobenius-specific argument or a different generic comparison is required. The independent curve theorem below does not invoke this node.

**Direct prerequisites.** [MS.5/dual-hull](#dual-hull); [MS.5/bounded-torsion-tor](#bounded-torsion-tor).

**Sources.** [DAD, Proposition 4.2.12, pp.16–17](https://arxiv.org/pdf/2012.12879v4).

**Check.** For N⊂M over K⟨u⟩ with M dagger-extendable and constant slopes, the scalar extension of Hull†_M(N) to E equals Hull†_(M_E)(N_E), where u↦1/t. This is an alternate-route target with gap G1: the v4 compactness argument does not establish the needed uniform p-torsion bound.

<a id="generic-ms"></a>

### Generic minimal slopes

**Target `MS.5/generic-ms` (theorem).** For N⊂M over the complete generic field of A¹_k, with M dagger-extendable, S_min(N)=S_min(Hull†_M(N)). The generic field has residue k(t), not k((t)); use the parent analytic-ring/reverse-filtration carrier specified for this field.

**Hypotheses.** k is perfect of characteristic p; W=W(k), K=W[1/p], with Witt Frobenius and t↦t^p. The complete generic field E of k(t) and its dagger subfield are those of DAD §4.2; the local Laurent-series field is not silently substituted.

**Proof or construction.**

1. By ms-reductions take N isoclinic and replace M by its hull.
2. Apply dual-hull to inject the dagger dual into N∨. The reverse-filtration bound identifies its maximal slope and bounds its top rank by rank N.
3. Duality reverses slopes; N⊂S_min(M) gives the reverse rank inequality, so both subobjects coincide.

**Direct prerequisites.** [MS.5/ms-reductions](#ms-reductions); [MS.5/dual-hull](#dual-hull); [MS.0/opposite-rank-bound](#opposite-rank-bound); [PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.1/reverse-algebraic-filtration-comparison](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [DAD, Proposition 4.2.2, p.14; Lemma 4.2.7 and §4.2.8, p.15](https://arxiv.org/pdf/2012.12879v4).

**Check.** For N⊂M over the complete generic field of A¹_k, with M dagger-extendable, S_min(N)=S_min(Hull†_M(N)). The generic field has residue k(t), not k((t)); use the parent analytic-ring/reverse-filtration carrier specified for this field.

<a id="etale-affine-line"></a>

### Étale affine-line reduction

**Target `MS.5/etale-affine-line` (theorem).** For a smooth connected curve C over a perfect field k there is a dense open U⊂C with a finite étale morphism U→A¹_k (Kedlaya). Together with the dense-open and finite étale Galois MS reductions, MS for objects over A¹_k implies MS(C). This is the dimension-one case of Kedlaya's étale covers of affine space.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Apply Kedlaya's Theorem 1 to the smooth completion C̄ (geometrically reduced since k is perfect) with D=C̄∖C: a finite morphism C̄→P¹ étale over A¹ sending D to ∞; then U=f^{-1}(A¹)⊂C and U→A¹ is finite étale.
2. Pass to a finite étale Galois closure of U→A¹ and use ms-reductions: MS on A¹ gives MS for the pushforward from the closure, hence on the closure, hence on U, hence on C by the dense-open reduction. The higher-dimensional affine-space case is outside this node.

**Direct prerequisites.** [MS.5/ms-reductions](#ms-reductions).

**Sources.** [DAD, Proof of Theorem 4.2.13, p.17](https://arxiv.org/pdf/2012.12879v4); [KED05, Theorem 1, p.1](https://arxiv.org/pdf/math/0303382v3).

**Check.** Over k=F_p the finite morphism need not be defined by a separating function with simple poles: wild ramification at ∞ is allowed, as for the Artin–Schreier map y↦y^p−y from A¹ to A¹.

<a id="curve-ms"></a>

### Minimal slopes on curves

**Target `MS.5/curve-ms` (theorem).** Every smooth curve over a perfect field satisfies MS(C), for every positive Frobenius power and every constant-Newton dagger-extendable ambient object. This target is proved by the independent Tsuzuki curve rank theorem, without affine-generic-hull.

**Hypotheses.** C is a smooth connected curve over perfect k; the coefficient datum is as above. Dagger objects are overconvergent F-isocrystals and their undecorated realisations are convergent. Slopes are normalised by q, so duality negates them and O(1) has slope −1.

**Proof or construction.**

1. Use ms-reductions to take an isoclinic N with dagger hull H. On a dense affine curve, the kernel of the section map H†∨→N∨ is a finite dagger module stable under the connection and Frobenius. Parent overconvergence-is-a-property and frobenius-structure-forces-overconvergence turn it into a dagger subobject; dual minimality of the hull forces this kernel to vanish. Its convergent linearisation is surjective by duality.
2. Apply curve-rank to this injection with surjective convergent linearisation, obtaining equality of the top rank with rank N∨ and equality of slopes.
3. Dualise: N is the first slope term of its hull. Apply the isoclinic and Frobenius-power reductions.

**Direct prerequisites.** [MS.5/ms-reductions](#ms-reductions); [MS.5/dual-hull](#dual-hull); [MS.4/curve-rank](#curve-rank); [PadicDifferentialEquationsAndRigidCohomology:RD.1/calculus-of-slopes](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/frobenius-structure-forces-overconvergence](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergence-is-a-property](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [DAD, Theorem 4.2.13, p.17; §4.2 introduction, p.13](https://arxiv.org/pdf/2012.12879v4); [TSU, Proposition 6.1 and proof, pp.26–27](https://arxiv.org/pdf/1910.03871v3).

**Check.** Every smooth curve over a perfect field satisfies MS(C), for every positive Frobenius power and every constant-Newton dagger-extendable ambient object. This target is proved by the independent Tsuzuki curve rank theorem, without affine-generic-hull.

**Coverage.** Planned. Repair G1 for the alternate affine–generic proof; give Kedlaya's étale-cover theorem (G4) an owner for the alternate affine-line reduction; register G3 for docile Lefschetz.

## MS.6: Lefschetz and finite fields

Objectwise Lefschetz curves, fibre reconstruction, finite-field isomorphism existence and the additional condition for lifting the specified map by projected trace averaging.

**Stage inputs.** [PadicDifferentialEquationsAndRigidCohomology:RD.3](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.6](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.2](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.3](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json); [PadicDifferentialEquationsAndRigidCohomologyPartII:MS.4](../packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json).

**Planets.** Lefschetz condition; Overconvergent Q̄_p-F_q-isocrystals; Projected trace average; Lefschetz fibre reconstruction; Finite field minimal slopes; Finite field specified lift.

<a id="lefschetz-condition"></a>

### Lefschetz condition

**Target `MS.6/lefschetz-condition` (definition).** For a closed point α of smooth connected X and irreducible M†, LC(X,α,M†) means there is a smooth connected k-curve C→X with a k(α)-rational point mapping to α, such that M†|C is irreducible. Define LC_Q̄p using irreducibility in the coefficient-extended category. Different objects may require different curves through α.

**Hypotheses.** X is smooth connected over perfect k, α a closed point. Coefficients are fixed K or Q̄_p as explicitly indicated.

**Proof or construction.**

1. Specify the curve, its morphism, the rational lift of α and the irreducible restricted coefficient as the witnessing data.
2. The condition does not require a closed immersion or a common curve for two objects.

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-f-isocrystal](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [MS.4/specified-curve-lift](#specified-curve-lift); [MS.6/padic-coefficient-objects](#padic-coefficient-objects).

**Sources.** [TSU, §6.3, condition (LC), p.28; Corollary 7.16, condition (LC_Q̄p), p.36](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Proposition 6.7: produces the two rank inequalities.
- Theorem 7.19: supplies LC_Q̄p on a dense open over finite fields.

**API.**

- `LC.witness` (data): A witness records C→X and a k(α)-point over α, not just the nonempty image of C.
- `LC.pullbackIrreducible` (projection): The chosen pullback M†|C is irreducible in the chosen coefficient category.
- `LC.finiteCoefficients` (compatibility): LC_Q̄p is checked after a sufficiently large finite coefficient model; it is not irreducibility after forgetting coefficient actions.

**Unit tests.**

- `lc_curve` (computation): If X is already a smooth connected curve, the identity curve witnesses LC for every irreducible M† and closed α.
- `lc_rankone` (computation): For a rank-one coefficient, every smooth connected curve through α with nonzero pullback witnesses irreducibility.
- `lc_twoobjects` (non-example): Separate witnesses for M† and N† do not by definition supply a single curve preserving both; proofs must allow two curves.

<a id="padic-coefficient-objects"></a>

### Overconvergent Q̄_p-F_q-isocrystals

**Target `MS.6/padic-coefficient-objects` (definition).** Let X be of finite type over k=F_q with K=W(k)[1/p] and σ=id. For a finite extension L of K in Q̄_p, an overconvergent L-F_q-isocrystal is an overconvergent F-isocrystal M† on X/K with a K-algebra map L→End(M†); morphisms commute with L. Scalar extension θ_{L₁,L₂}(M†)=M†⊗_{L₁}L₂ satisfies θ_{L₂,L₃}∘θ_{L₁,L₂}≅θ_{L₁,L₃}. The category F_q-Isoc†(X)⊗Q̄_p is the 2-colimit over finite L⊂Q̄_p, with Q̄_p-rank(M†)=rank(M†)/[L:K] on each component; tensor products and duals are taken over L. For k_n/k of degree n with projection π_n:X_n→X there are a pullback π*_{n,Q̄_p}, which identifies the q^n-Frobenius K_n-structure with the coefficient K_n-structure through the chosen embedding K_n⊂L, and a pushforward π_{n,Q̄_p*} right adjoint to it, with Q̄_p-rank(π*_{n,Q̄_p}N†)=Q̄_p-rank(N†) and Q̄_p-rank(π_{n,Q̄_p*}M†)=n·Q̄_p-rank(M†). The Frobenius fibre at a closed point α of degree n is the L-space i*_αM† with the L-linear endomorphism F^n.

**Hypotheses.** X is a separated scheme of finite type over F_q; K=W(F_q)[1/p], σ=id, and an algebraic closure Q̄_p of K is fixed. Coefficients are modelled by a finite L before passing to the 2-colimit; traces and determinants are computed on finite L-models.

**Proof or construction.**

1. Define L-structures and θ_{L₁,L₂} (Tsuzuki Definition 7.1, Example 7.2, Proposition 7.5 with the transitivity index corrected, E16) and take the 2-colimit (Definition 7.6).
2. Tensor products and duals over L: Propositions 7.3–7.4; the perfect pairing is the K-dual identified with the L-dual through the trace of L/K and the multiplication projector (E17). Irreducible objects are direct sums of copies of an irreducible F-isocrystal over K (Lemma 7.7).
3. Constant-field pullback and pushforward: §7.2, built from the Appendix B functors π*_{(L,σ^n)/(K,σ)}, π_{(L,σ^n)/(K,σ)*}, their adjunction and trace, with the rank formulas; the overconvergent descent along X_n→X is the parent's étale descent.
4. Frobenius fibres and their traces at closed points: §7.3, Lemma 7.11, computed on the finite L-model and only then extended to Q̄_p (E18, E26).

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-f-isocrystal](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/restriction-to-convergent](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/etale-descent-of-overconvergent-f-isocrystals](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.6/frobenius-at-closed-point](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.0/finite-coefficient-extension-interface](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, §§7.1–7.3, pp.29–34; Appendix B, pp.39–40](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Tsuzuki Proposition 7.15 and Corollary 7.16: states the Chebotarev and Lefschetz arguments for Q̄_p-coefficients.
- Tsuzuki Proposition 7.15(2) and Appendix B: descends a lift after constant extension by adjunction and trace.
- Tsuzuki Theorem 7.20: is the category in which the finite-field theorem is stated.

**API.**

- `QbarCoeff.scalarExt` (functoriality): θ_{L₁,L₂} is an exact L₂-linear ⊗-functor, transitive up to canonical isomorphism, and preserves Q̄_p-rank.
- `QbarCoeff.tensorDual` (structure): F_q-Isoc†(X)⊗L is an L-linear rigid abelian ⊗-category with unit j†O⊗_K L; the dual pairing is the trace-identified L-dual.
- `QbarCoeff.pullPushAdjunction` (universal-property): π*_{n,Q̄_p} is left adjoint to π_{n,Q̄_p*}, with the stated rank formulas and compatibility with pullback along morphisms X′→X.
- `QbarCoeff.changeOfFrobeniusPower` (equivalence): For k₀⊂k of degree n with q₀^n=q, restriction of Frobenius gives an equivalence F_q-Isoc†(X)⊗Q̄_p≃F_{q₀}-Isoc†(X)⊗Q̄_p preserving Q̄_p-rank (Tsuzuki Proposition 7.9, after Abe Corollary 1.4.11).
- `QbarCoeff.fibre` (projection): At a closed point α of degree n with K_α⊂L, the fibre is an L-space of dimension Q̄_p-rank(M†) with the L-linear endomorphism F^n, and its characteristic polynomial does not depend on L.

**Unit tests.**

- `QbarCoeff.rank_base` (degenerate): For L=K, Q̄_p-rank(M†)=rank(M†).
- `QbarCoeff.theta_id` (characterisation): θ_{L,L}≅id and Q̄_p-rank(θ_{L₁,L₂}M†)=Q̄_p-rank(M†).
- `QbarCoeff.restrict_scalars` (non-example): For M† with an L-structure, the object M†⊗_K L (L acting on the second factor) has Q̄_p-rank rank_K(M†), which differs from Q̄_p-rank(M†)=rank(M†)/[L:K] when L≠K; forgetting the original L-action is the wrong rank.
- `QbarCoeff.push_rank` (computation): Q̄_p-rank(π_{n,Q̄_p*}M†)=n·Q̄_p-rank(M†) and Q̄_p-rank(π*_{n,Q̄_p}N†)=Q̄_p-rank(N†).

<a id="projected-trace"></a>

### Projected trace average

**Target `MS.6/projected-trace` (construction).** Let k_m/k have degree m>0. On Hom between finite coefficient models of N† and M† after constant extension, let T be conjugation by their q-Frobenius, so T^m=1 on q^m-Frobenius morphisms. Define Av(f)=m⁻¹Σ_{i=0}^{m−1}T^i(f). It is q-Frobenius invariant and descends. In the induction/trace presentation first project K_m⊗_K L≅∏_{j=0}^{m−1}L to the component fixed by the chosen embedding, then the coefficient-projected unit–trace composite is m·id, not m²·id.

**Hypotheses.** X is smooth connected over F_q; coefficients are Q̄_p and q-Frobenius. M† and N† are irreducible and their convergent realisations have slope filtrations. Top denotes the last, maximal-slope quotient.

**Proof or construction.**

1. Choose a finite L containing K_m and all matrix coefficients; split the finite étale coefficient algebra and apply its primitive idempotent before taking the cyclic Frobenius summands.
2. The projected induction is ⊕_{i=0}^{m−1}F^{i*}N. Its unit sends v to (F^(−i)v)_i and its trace sends (v_i) to ΣF^i(v_i), so the composite has exactly m copies of v.
3. Use the existing Representation.averageMap for the finite cyclic conjugation representation. Its invariant image and identity-on-invariants laws give descent and preservation of the prescribed quotient map.

**Direct prerequisites.** `Representation.averageMap` (Mathlib baseline); `Representation.averageMap_invariant` (Mathlib baseline); `Representation.averageMap_id` (Mathlib baseline); [PadicDifferentialEquationsAndRigidCohomology:RD.3/etale-descent-of-overconvergent-f-isocrystals](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [MS.6/padic-coefficient-objects](#padic-coefficient-objects); `LinearMap.trace` (Mathlib baseline); `LinearMap.trace_one` (Mathlib baseline).

**Sources.** [TSU, Proposition 7.15(2), pp.35–36; Appendix B and Lemma B.1, pp.39–40](https://arxiv.org/pdf/1910.03871v3).

**Uses that determine the API.**

- Proposition 7.15(2): descends an endomorphism-corrected lift.
- Theorem 7.20(2): preserves the particular quotient map, not just isomorphism existence.

**API.**

- `ProjectedTrace.invariant` (structure): T(Av(f))=Av(f), since T^m(f)=f.
- `ProjectedTrace.quotient` (compatibility): If every T^i(f) induces the same q-Frobenius quotient map h, Av(f) induces h.
- `ProjectedTrace.normalisation` (compatibility): On a split degree-m coefficient algebra trace(e_j)=1 and trace(1)=m; after the primitive projection the cyclic unit–trace is m·id. Omitting that projector gives m²·id in the raw doubled presentation.

**Unit tests.**

- `average_degree_one` (degenerate): m=1 gives Av(f)=f.
- `average_degree_two` (computation): For m=2 and T²=1, Av(f)=(f+T(f))/2 is invariant and fixes any T-invariant f.
- `trace_projection` (non-example): For L², multiplication by e₁=(1,0) has L-linear trace 1, while multiplication by 1=(1,1) has trace 2; using the latter in each of two induction slots gives 4 rather than 2.

<a id="endomorphism-curve"></a>

### Endomorphism curve criterion

**Target `MS.6/endomorphism-curve` (theorem).** Suppose after a finite constant extension there is a smooth connected curve i:C→X such that i*M† is irreducible and End(M†)→End(i*M†) is bijective. Then End(M†)→End(Top(M)) is bijective. Restriction of horizontal endomorphisms to a nonempty scheme over connected X is injective.

**Hypotheses.** X is smooth connected over F_q; coefficients are Q̄_p and q-Frobenius. M† and N† are irreducible and their convergent realisations have slope filtrations. Top denotes the last, maximal-slope quotient.

**Proof or construction.**

1. Inject horizontal sections into any nonempty fibre, for both M† and Top(M).
2. For an endomorphism of Top(M), restrict to C and use specified-curve-lift (and its zero case) to lift uniquely to End(i*M†).
3. Use the assumed endomorphism bijection to return to X; injectivity on the top after restriction identifies the original endomorphism.

**Direct prerequisites.** [MS.4/specified-curve-lift](#specified-curve-lift); [PadicDifferentialEquationsAndRigidCohomology:RD.3/full-faithfulness-overconvergent-to-convergent](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Lemma 7.17, p.36](https://arxiv.org/pdf/1910.03871v3).

**Check.** Suppose after a finite constant extension there is a smooth connected curve i:C→X such that i*M† is irreducible and End(M†)→End(i*M†) is bijective. Then End(M†)→End(Top(M)) is bijective. Restriction of horizontal endomorphisms to a nonempty scheme over connected X is injective.

<a id="lefschetz-rank-maps"></a>

### Lefschetz rank maps

**Target `MS.6/lefschetz-rank-maps` (theorem).** Let h:Top(N)→Top(M) be nonzero on smooth connected X over perfect k. If M† is irreducible and LC for M† holds at α, then on its witness curve the maximal PBQ subobject Q† of N†|C surjects uniquely to M†|C inducing h|C. If N† is irreducible and LC for N† holds, the analogous map injects N†|C into the maximal PBQ subobject of M†|C.

**Hypotheses.** X smooth connected over perfect k; both realisations are slope-filtered and h≠0. The irreducibility and LC hypotheses are imposed on the indicated side.

**Proof or construction.**

1. The irreducible restricted coefficient has irreducible top by curve-irreducibility, so the nonzero restricted map is surjective or injective respectively.
2. Take the appropriate maximal PBQ subobject, its saturation, and the image of the sum map into the pure quotient. Curve-rank and PBQ quotient stability identify the necessary saturated images and give the stated map.
3. Saturation of the irreducible side and the PBQ quotient criterion give uniqueness.

**Direct prerequisites.** [MS.6/lefschetz-condition](#lefschetz-condition); [MS.4/curve-rank](#curve-rank); [MS.4/curve-graded-recovery](#curve-graded-recovery); [MS.4/curve-irreducibility](#curve-irreducibility); [MS.2/curve-pbq-filtration](#curve-pbq-filtration).

**Sources.** [TSU, Proposition 6.7, p.28](https://arxiv.org/pdf/1910.03871v3).

**Check.** Let h:Top(N)→Top(M) be nonzero on smooth connected X over perfect k. If M† is irreducible and LC for M† holds at α, then on its witness curve the maximal PBQ subobject Q† of N†|C surjects uniquely to M†|C inducing h|C. If N† is irreducible and LC for N† holds, the analogous map injects N†|C into the maximal PBQ subobject of M†|C.

<a id="finite-field-inputs"></a>

### Finite field Lefschetz inputs

**Target `MS.6/finite-field-inputs` (theorem).** Import the following finite-field contracts: every overconvergent Q̄_p coefficient is ι-mixed and irreducibles are ι-pure of a real weight; for each irreducible coefficient a dense open has LC_Q̄p at all closed points. The latter follows from the stronger finite-set curve theorem. These are supplier contracts, not proofs of generic companions or arithmetic D-modules in this roadmap.

**Hypotheses.** X is smooth connected over F_q; coefficients are Q̄_p and q-Frobenius. M† and N† are irreducible and their convergent realisations have slope filtrations. Top denotes the last, maximal-slope quotient.

**Proof or construction.**

1. AE Theorem 2.7 gives mixedness using the finite-determinant curve theorem after a constant twist, followed by untwisting; the resulting weight need not be integral.
2. AE Theorem 3.10 supplies irreducibility-preserving curves, using companions and tame Lefschetz. Import these foundations from the separate arithmetic-D-module and crystalline-companion owners; gap G3 records the unregistered supplier.

**Direct prerequisites.** [MS.6/lefschetz-condition](#lefschetz-condition); [PadicDifferentialEquationsAndRigidCohomology:RD.6/pointwise-iota-weights](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.6/weight-normalising-constant-line](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.6](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Theorems 7.18–7.19, p.37](https://arxiv.org/pdf/1910.03871v3); [AE, Theorem 2.7, p.13; Theorem 3.10, pp.17–18](https://page.mi.fu-berlin.de/esnault/preprints/helene/123_abe_esn.pdf).

**Check.** On Spec F₃, the rank-one coefficient with Frobenius 2 has weight 2 log₃2; forcing integral weights rejects a valid coefficient.

<a id="lefschetz-fibres"></a>

### Lefschetz fibre reconstruction

**Target `MS.6/lefschetz-fibres` (theorem).** If M†,N† are irreducible, have slope-filtered realisations and a nonzero h between their tops, and both LC conditions hold at α (possibly using different curves), then rank M†=rank N† and their Frobenius fibres at α are isomorphic. The coefficient-extended version uses normalised Q̄_p-rank and finite coefficient fibre spaces.

**Hypotheses.** X smooth connected over perfect k; LC holds separately for M† and N† at α; all other hypotheses are as stated.

**Proof or construction.**

1. Use the M-curve to get rank M†≤rank Q†≤rank N†.
2. Use the N-curve to get rank N†≤rank P†≤rank M†; hence both inequalities are equalities.
3. The surjection on the first curve is then an isomorphism, whose fibre gives the required isomorphism N†_α→M†_α. The target is M†, correcting the source’s repeated N†.

**Direct prerequisites.** [MS.6/lefschetz-rank-maps](#lefschetz-rank-maps); [PadicDifferentialEquationsAndRigidCohomology:RD.6/frobenius-at-closed-point](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [MS.6/padic-coefficient-objects](#padic-coefficient-objects).

**Sources.** [TSU, Corollary 6.8, p.29; proof of Corollary 7.16, p.36](https://arxiv.org/pdf/1910.03871v3).

**Check.** If M†,N† are irreducible, have slope-filtered realisations and a nonzero h between their tops, and both LC conditions hold at α (possibly using different curves), then rank M†=rank N† and their Frobenius fibres at α are isomorphic. The coefficient-extended version uses normalised Q̄_p-rank and finite coefficient fibre spaces.

<a id="unit-root-source"></a>

### Unit-root source reconstruction

**Target `MS.6/unit-root-source` (theorem).** Under the surjective side of lefschetz-rank-maps, if N† is unit-root then M† is unit-root and h lifts uniquely to a global surjection N†→M†.

**Hypotheses.** X smooth connected over perfect k; M† irreducible with LC at one closed point; N† unit-root; the realisations are slope-filtered and h≠0.

**Proof or construction.**

1. The witness curve forces M†|C to be unit-root. Constant Newton polygon and the slope filtration make M† unit-root on X.
2. Thus Top(M)=M and Top(N)=N; the given h is a global convergent morphism. Use parent full faithfulness to lift it and faithful exact realisation to detect surjectivity.

**Direct prerequisites.** [MS.6/lefschetz-rank-maps](#lefschetz-rank-maps); [PadicDifferentialEquationsAndRigidCohomology:RD.3/unit-root-f-isocrystal](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.3/full-faithfulness-overconvergent-to-convergent](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Corollary 6.9, p.29](https://arxiv.org/pdf/1910.03871v3).

**Check.** Under the surjective side of lefschetz-rank-maps, if N† is unit-root then M† is unit-root and h lifts uniquely to a global surjection N†→M†.

<a id="pure-hom-chebotarev"></a>

### Fibrewise isomorphism criterion

**Target `MS.6/pure-hom-chebotarev` (theorem).** If irreducible overconvergent Q̄_p coefficients M†,N† have isomorphic Frobenius fibres at every closed point of a dense open and (N†)∨⊗M† is ι-pure, then there exists an isomorphism N†≅M†. This is an application of the shared mixed coefficient Chebotarev contract ABE-18/51; no second generic theorem is owned here.

**Hypotheses.** X is smooth connected over F_q; coefficients are Q̄_p and q-Frobenius. M† and N† are irreducible and their convergent realisations have slope filtrations. Top denotes the last, maximal-slope quotient.

**Proof or construction.**

1. Use fibre equality to identify all characteristic polynomials. The imported mixed Chebotarev theorem identifies semisimplifications.
2. Irreducibility promotes that identification to an isomorphism. Tsuzuki’s alternative pole proof uses pure Hom of weight zero, duality and the top compactly supported cohomology pole; it belongs at the same generic supplier, not a new node here.

**Direct prerequisites.** [PadicDifferentialEquationsAndRigidCohomology:RD.6/frobenius-at-closed-point](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [PadicDifferentialEquationsAndRigidCohomology:RD.6/pointwise-iota-weights](../packets/PadicDifferentialEquationsAndRigidCohomology.json); [MS.6/finite-field-inputs](#finite-field-inputs).

**Sources.** [TSU, Proposition 7.15(1), pp.35–36](https://arxiv.org/pdf/1910.03871v3).

**Check.** If irreducible overconvergent Q̄_p coefficients M†,N† have isomorphic Frobenius fibres at every closed point of a dense open and (N†)∨⊗M† is ι-pure, then there exists an isomorphism N†≅M†. This is an application of the shared mixed coefficient Chebotarev contract ABE-18/51; no second generic theorem is owned here.

<a id="given-map-endomorphisms"></a>

### Specified map from endomorphisms

**Target `MS.6/given-map-endomorphisms` (theorem).** Under fibrewise isomorphism and pure-Hom hypotheses, let h:Top(N)→Top(M) be invertible. If after some finite constant extension the endomorphism map of either M† or N† to its top is surjective, then there is a unique dagger isomorphism N†→M† inducing exactly h.

**Hypotheses.** X is smooth connected over F_q; coefficients are Q̄_p and q-Frobenius. M† and N† are irreducible and their convergent realisations have slope filtrations. Top denotes the last, maximal-slope quotient.

**Proof or construction.**

1. Choose g′:N†≅M† by pure-hom-chebotarev and transport the endomorphism hypothesis to N†.
2. Lift the top endomorphism Top(g′)⁻¹∘h to τ∈End(N†) after extension; g′∘τ induces h there. This corrects the source’s mismatched domain and composition.
3. Apply projected-trace. The averaged map still induces nonzero h; irreducibility over the original X makes it an isomorphism. For uniqueness a nonzero map of irreducibles is an isomorphism, so no nonzero difference can induce zero on the top.

**Direct prerequisites.** [MS.6/pure-hom-chebotarev](#pure-hom-chebotarev); [MS.6/projected-trace](#projected-trace); [MS.3/global-saturation](#global-saturation).

**Sources.** [TSU, Proposition 7.15(2) and proof, pp.35–36](https://arxiv.org/pdf/1910.03871v3).

**Check.** Under fibrewise isomorphism and pure-Hom hypotheses, let h:Top(N)→Top(M) be invertible. If after some finite constant extension the endomorphism map of either M† or N† to its top is surjective, then there is a unique dagger isomorphism N†→M† inducing exactly h.

<a id="lc-global-existence"></a>

### Lefschetz global existence

**Target `MS.6/lc-global-existence` (theorem).** Under F, if LC_Q̄p for M† and N† holds at every closed point of a dense open, and (N†)∨⊗M† is ι-pure, then N†≅M†. A nonzero top map need not be specified as the induced map by this assertion.

**Hypotheses.** X is smooth connected over F_q; coefficients are Q̄_p and q-Frobenius. M† and N† are irreducible and their convergent realisations have slope filtrations. Top denotes the last, maximal-slope quotient.

**Proof or construction.**

1. Use lefschetz-fibres at every point, allowing different curves for the two coefficients.
2. Apply pure-hom-chebotarev. The existence assertion itself does not need the endomorphism-surjectivity condition.

**Direct prerequisites.** [MS.6/lefschetz-fibres](#lefschetz-fibres); [MS.6/pure-hom-chebotarev](#pure-hom-chebotarev).

**Sources.** [TSU, Corollary 7.16(1), p.36](https://arxiv.org/pdf/1910.03871v3).

**Check.** Under F, if LC_Q̄p for M† and N† holds at every closed point of a dense open, and (N†)∨⊗M† is ι-pure, then N†≅M†. A nonzero top map need not be specified as the induced map by this assertion.

<a id="finite-field-existence"></a>

### Finite field minimal slopes

**Target `MS.6/finite-field-existence` (theorem).** Under F, any nonzero convergent h:Top(N)→Top(M) implies the existence of an overconvergent isomorphism N†≅M†. This theorem does not assert that the isomorphism induces the given h.

**Hypotheses.** X is smooth connected over F_q; coefficients are Q̄_p and q-Frobenius. M† and N† are irreducible and their convergent realisations have slope filtrations. Top denotes the last, maximal-slope quotient.

**Proof or construction.**

1. Use finite-field-inputs to obtain objectwise LC on a common dense open and real-weight purity of M† and N†.
2. Lefschetz fibre reconstruction identifies their Frobenius fibres. In particular they have the same pure weight, so their tensor Hom is pure of weight zero.
3. Apply lc-global-existence.

**Direct prerequisites.** [MS.6/finite-field-inputs](#finite-field-inputs); [MS.6/lefschetz-fibres](#lefschetz-fibres); [MS.6/lc-global-existence](#lc-global-existence); [PadicDifferentialEquationsAndRigidCohomology:RD.6/pointwise-iota-weights](../packets/PadicDifferentialEquationsAndRigidCohomology.json).

**Sources.** [TSU, Theorem 7.20(1), p.37](https://arxiv.org/pdf/1910.03871v3).

**Check.** Under F, any nonzero convergent h:Top(N)→Top(M) implies the existence of an overconvergent isomorphism N†≅M†. This theorem does not assert that the isomorphism induces the given h.

<a id="finite-field-specified"></a>

### Finite field specified lift

**Target `MS.6/finite-field-specified` (theorem).** Under F and nonzero h, suppose additionally that after a finite extension of F_q there is a smooth connected curve through a closed point on which M† restricts irreducibly and whose endomorphism restriction is bijective. Then h is induced by a unique overconvergent isomorphism N†→M†.

**Hypotheses.** X is smooth connected over F_q; coefficients are Q̄_p and q-Frobenius. M† and N† are irreducible and their convergent realisations have slope filtrations. Top denotes the last, maximal-slope quotient.

**Proof or construction.**

1. First obtain some isomorphism by finite-field-existence; consequently h is an isomorphism (compare it on an irreducibility-preserving curve and use faithful restriction).
2. Endomorphism-curve gives surjectivity onto endomorphisms of the top after the constant extension.
3. Apply given-map-endomorphisms and its projected normalised trace. This added hypothesis is not removed by the LC existence theorem alone.

**Direct prerequisites.** [MS.6/finite-field-existence](#finite-field-existence); [MS.6/endomorphism-curve](#endomorphism-curve); [MS.6/given-map-endomorphisms](#given-map-endomorphisms).

**Sources.** [TSU, Theorem 7.20(2), p.37](https://arxiv.org/pdf/1910.03871v3).

**Check.** Under F and nonzero h, suppose additionally that after a finite extension of F_q there is a smooth connected curve through a closed point on which M† restricts irreducibly and whose endomorphism restriction is bijective. Then h is induced by a unique overconvergent isomorphism N†→M†.

**Coverage.** Planned. Register G3 and instantiate its shared mixedness, Chebotarev and curve inputs; discharge the RD.6 real-weight request used by finite-field-inputs.

## Worked consistency checks

For a split constant sum L₁⊕L₀ with slopes 1 and 0, every solution is bounded, so B(M)=M and Mᵇ=0. The object is not PBQ. Its filtration has P₁=L₁, P₂=M, but grades L₁ and L₀. Their maximal quotients sum to M. Using Top(P₂) in place of Top(G₂) would give two slope-one lines. Projection onto L₁ has a nonzero dagger kernel, so the split sum is not saturated. These checks jointly detect the kernel/quotient, grade/term and saturation conventions.

For the logarithmic connection, the horizontal coordinate log(1+u) has coefficient 1/n up to sign. At n=p^r, the p-adic coefficient norm is p^r. The series converges on every strict subdisc and is unbounded in the coefficient norm. This distinguishes generic solvability from boundedness and supplies a concrete growth-one boundary case for the extension theorem. The suggested file states both the unbounded subsequence and the linear upper bound on logarithm coefficients.

The Legendre/Kummer example in MS.2 uses the p≡1 mod4 unit-root line in a twisted cohomology calculation to construct a nonsplit rank-three extension with two PBQ grades. Its rank-two Legendre constituent has maximal slope 1; the constant quotient has slope 0. The K3 slopes and extension/cohomology comparison are explicit supplier requests. This example does not assert that all rank-two extensions split: the total-rank-two splitting test in MS.4 belongs to the opposite slope-order case a>b.

For a degree-two constant extension, an involution T on Hom gives Av(f)=(f+T(f))/2. If both summands induce h on the quotient, the average induces h. On the split coefficient algebra L², multiplication by (1,0) has trace 1 and multiplication by (1,1) has trace 2. Applying the primitive projector before the two cyclic slots gives total trace 2; taking the unit in both slots gives 4. The elementary projector and trace statements in the suggested file pin down this normalisation.

## Open proof contracts

### G1: affine–generic dagger hull comparison

DAD v4 Proposition 4.2.12, p.17, invokes compactness and a uniform p-primary torsion bound for an arbitrary injection into W⟨u⟩. In A_n, (pu^n)^j is not in pA_n but its image has norm p^(−j), so the asserted positive lower bound fails. The quotient W⟨u⟩/A_n has elements of unbounded p-power torsion. A Frobenius-specific strictness argument is needed. This is not a counterexample to the proposition. Curve MS uses Tsuzuki Proposition 6.1 and does not depend on this alternate node.

Affected targets: [MS.5/affine-generic-hull](#affine-generic-hull).

### G3: register the common arithmetic D-module and companion supplier contracts

The proposed ArithmeticDModules continuation has no registered stage. Its early common prefix must export generic mixed coefficient Chebotarev (PAPER-ABE-18/51), finite coefficient conventions and the AE localisation/vanishing argument proving Corollary 2.4 for arbitrary base tuples. Its weight and crystalline-companion inputs at AM.7 must export AE Theorem 2.7 and the irreducibility-preserving finite-set curves of Theorem 3.10 (after rank-one twist/untwist). Use the split briefs below to give these contracts one owner and stage ids. Do not import the entire DAD monodromy continuation or prove generic companion existence here.

Affected targets: [MS.5/docile-lefschetz](#docile-lefschetz); [MS.6/finite-field-inputs](#finite-field-inputs); [MS.6/pure-hom-chebotarev](#pure-hom-chebotarev).

### G4: finite étale maps from curves onto the affine line

Kedlaya 2005, Theorem 1 (arXiv:math/0303382v3, p.1), cited in the proof of D'Addezio Theorem 4.2.13, gives for a geometrically reduced projective variety over any field of characteristic p a finite morphism to P^n, étale over A^n, sending a chosen lower-dimensional closed subscheme into the hyperplane at infinity. No atlas roadmap and neither library owns it; the review read its statement, not its proof. The node lies on the alternate D'Addezio route only: MS.5/curve-ms does not use it.

Affected targets: [MS.5/etale-affine-line](#etale-affine-line).

## Supplier requests

1. **PadicDifferentialEquationsAndRigidCohomology:RD.0.** Supply the extended logarithmic Robba carrier R̃_log=R̃[log u] over the extended Robba ring, its Frobenius-equivariant extension of the embedding R_log→R̃_log, injectivity of R̃^bd⊗_{R^bd}R_log→R̃_log, the log-growth filtrations compatible with that embedding, and the exact growth of nonzero Frobenius eigenfunctions (Ohkubo §1.3 and §2.3, Lemmas 1.12–1.15, 2.10–2.14, pp.10–14). The existing extended Robba carrier alone does not include its logarithmic growth API. Needed by [MS.1/growth-eigenvector](#growth-eigenvector).

2. **PadicDifferentialEquationsAndRigidCohomology:RD.1.** For a finite free differential Frobenius module over K[[t]]₀, extension to E† identifies its saturated differential Frobenius submodules with the submodules of the bounded Robba realisation (de Jong Proposition 6.4, used in Ohkubo Theorem 12.7, p.46). Export this bounded-disc to bounded-Robba comparison, with the specific Frobenius hypotheses. It is not a claim that every E-completed submodule descends, and fixed-slope Hom full faithfulness alone does not supply it. Needed by [MS.1/disc-pbq-descent](#disc-pbq-descent).

3. **PadicDifferentialEquationsAndRigidCohomology:RD.3.** After MS.0/fixed-field-normalisation reduces to K=K^σ⊗_{W(F_q)}W(k) with K^σ finite over Q_q, supply the unit-root correspondence used in Tsuzuki Lemma 3.32, p.19, over an arbitrary perfect field k: unit-root convergent F-isocrystals on a smooth curve with K^σ-linear coefficients ⇔ continuous K^σ-representations of π_1 (extending RD.3/crew-unit-root-correspondence beyond Q_q coefficients), and overconvergence ⇔ finite local monodromy at the boundary (Tsuzuki 1998, Theorem 7.2.3, cited there), beyond the finite-field case of RD.6/unit-root-isocrystals-and-p-adic-representations. Needed by [MS.2/curve-gluing](#curve-gluing).

4. **PadicDifferentialEquationsAndRigidCohomology:RD.4.** Give the rigid H¹ classification of extensions by a constant line and the relative Legendre/Kummer cohomology input of Tsuzuki §3.9, pp.21–22, including the K3 calculation’s comparison with the coefficient H¹. This numerical example is conditional on that supplier, not an assumed K3 implementation. Needed by [MS.2/legendre-kummer-example](#legendre-kummer-example).

5. **PadicDifferentialEquationsAndRigidCohomology:RD.6.** Export the CM K3 Frobenius calculation in Tsuzuki §3.9, pp.21–22: the twisted H¹ slopes are 0,2 for p≡1 mod4 and 1,1 for p≡3 mod4; the unit-root twist produces the stated invariant extension. For AE Theorem 2.7 use arbitrary real weights and the constant-twist/untwist compatibility, rather than restricting to integer weights. Needed by [MS.2/legendre-kummer-example](#legendre-kummer-example); [MS.6/finite-field-inputs](#finite-field-inputs).

## Route disposition and split ownership

The eight input records contain 198 item references. Every reference has a disposition in the packet; 80 belong to this continuation (79 mapped to targets and one imported from the parent), 53 to ArithmeticDModules, 39 to MonodromyGroups and 26 to RigidCompanions. Several input items can feed one target. The three other directions have complete design briefs in the packet and handoff, with targets, proposed layer order, imports, exports, tests and gates. They are not marked as registered roadmaps by this job.

| Input record | Direction | Items |
| --- | --- | --- |
| [PAPER-ABE-18](../papers/PAPER-ABE-18.result.json) | ArithmeticDModules | 34 |
| [PAPER-DADDEZIO-23](../papers/PAPER-DADDEZIO-23.result.json) | ArithmeticDModules | 1 |
| [PAPER-DADDEZIO-23](../papers/PAPER-DADDEZIO-23.result.json) | MinimalSlope | 13 |
| [PAPER-DADDEZIO-23](../papers/PAPER-DADDEZIO-23.result.json) | MonodromyGroups | 39 |
| [PAPER-ESNAULT-GROECHENIG-20](../papers/PAPER-ESNAULT-GROECHENIG-20.result.json) | RigidCompanions | 26 |
| [PAPER-TSUZUKI-23](../papers/PAPER-TSUZUKI-23.result.json) | MinimalSlope | 66 |
| [PAPER-XU-ZHU-22](../papers/PAPER-XU-ZHU-22.result.json) | ArithmeticDModules | 18 |
| [PAPER-XU-ZHU-22](../papers/PAPER-XU-ZHU-22.result.json) | MinimalSlope | 1 |

The essential ordering is early arithmetic D-modules/Crew → crystalline correspondence → late mixedness, finite-set curves and companion applications. Basic overconvergent monodromy needed for Bessel coefficients belongs to the early common arithmetic prefix, while higher-dimensional MS and parabolicity belong to MonodromyGroups and import the present curve theorem. This prevents a whole-roadmap cycle. Arithmetic D-modules also owns generic mixed Chebotarev and admissible-stack covers, so the other continuations import them rather than reproducing them.

## Sources and version limits

Everything below and in the targets is stated in this roadmap's own words. Locators refer to the version linked here; hashes and reading scopes are recorded in the packet. Tsuzuki's and D’Addezio's journal texts are not collated in this design. The Cambridge Ohkubo PDF request returned an abstract/login page, so the notation finding E31 is confined to arXiv v1. The public source texts needed for the designed proof route were available. No protected library source was used.

- **TSU**: Nobuo Tsuzuki, [Minimal slope conjecture of F-isocrystals](https://arxiv.org/pdf/1910.03871v3). arXiv:1910.03871v3, October 2021; 41 PDF pages. Read 2026-10-19: §§1–7, pp.1–37; Appendices A–B, pp.37–40; equations and proofs collated against the routed items; independent review: read in full, including §3.1, §3.3 and Lemmas 3.1–3.2, 3.11, pp.10–14.
- **DAD**: Marco D’Addezio, [Parabolicity conjecture of F-isocrystals](https://arxiv.org/pdf/2012.12879v4). arXiv:2012.12879v4, 8 February 2023; Annals version not collated. Read 2026-10-19: §§4.1–4.2, pp.11–17; §4.4.2, pp.19–20; source routing and reviewed corrections read for the other directions; independent review: §§4.1–4.2 and §4.4.2, pp.11–20, with overlined formulas checked in the arXiv v4 TeX source.
- **CT11**: Bruno Chiarellotto and Nobuo Tsuzuki, [Log-growth filtration and Frobenius slope filtration of F-isocrystals at generic and special points](https://ems.press/content/serial-article-files/26106?nt=1). Documenta Mathematica 16 (2011), 33–69; publisher PDF. Read 2026-10-19: Theorem 2.2, pp.41–42; Theorem 4.1 and splitting setup, pp.46–55; Proposition 5.4, Corollary 5.5, Theorem 5.6 and Corollary 5.10, pp.56–59; independent review: Theorem 2.2, pp.41–42; Theorem 4.1 and Propositions 4.2–4.3, pp.46–47; §5, pp.55–59.
- **OHK**: Shun Ohkubo, [Logarithmic growth filtrations for (φ,∇)-modules over the bounded Robba ring](https://arxiv.org/pdf/1809.04065v1). arXiv:1809.04065v1, September 2018; numbering of this version. Read 2026-10-19: Introduction; §§7–10, pp.35–42; §12, pp.44–47; precise logarithmic embedding/eigenfunction inputs remain a parent request; Definitions 5.3–5.5 and Proposition 5.9, pp.25–26; preprint-only correction E31, publisher PDF unavailable for collation; independent review: §§1.2–2.3, pp.7–14; §§5.3–5.4, pp.26–27; §§7–8, pp.35–40; §§9–10, pp.41–42; §12, pp.44–48.
- **AE**: Tomoyuki Abe and Hélène Esnault, [A Lefschetz theorem for overconvergent isocrystals with Frobenius structure](https://page.mi.fu-berlin.de/esnault/preprints/helene/123_abe_esn.pdf). Author PDF of Annales scientifiques de l’ÉNS 52 (2019), 1243–1264; PDF page numbering. Read 2026-10-19: Corollary 2.4, Remark 2.5, Theorems 2.6–2.7, pp.11–13; Theorem 3.10 and proof, pp.17–18; independent review: Corollary 2.4 and Remark 2.5, p.12; Theorems 2.6–2.7, p.13; Lemma 3.9 and Theorem 3.10, pp.17–18.
- **KED05**: Kiran S. Kedlaya, [More étale covers of affine spaces in positive characteristic](https://arxiv.org/pdf/math/0303382v3). arXiv:math/0303382v3 (2004); J. Algebraic Geom. 14 (2005), 187–192. Read 2026-10-19: Theorem 1 and the remarks after it, pp.1–2 (added by the independent review for the alternate affine-line reduction).

## Source correction register

E1–E26 apply the Tsuzuki extraction findings; E27–E30 apply the D’Addezio extraction findings. E31 records the boundedness-kernel notation error in Ohkubo's preprint. E32–E35 are further Tsuzuki misprints found by the independent review. The review checked every entry at its locator and confirmed all of them; its reason follows each entry. Each entry is version-scoped in the packet and retains the extraction provenance. No claim is made about uncollated journal wording. The mathematical targets above use the corrected conventions.

- **E1 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, §1.1 p.1; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The introductory coefficient R is described with the field terminology. **Correction:** R is the discrete valuation ring; K is its fraction field. **Check:** The quotient R/m and subsequent lattice notation require the ring. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E1; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. At §1.1, p.1 of the v3 PDF the list calls R a complete discrete valuation field while writing k=R/m and K for its fraction field; the ring is meant.
- **E2 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, §2.1 p.4; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The full Robba ring is included in a finite coefficient-supremum norm convention. **Correction:** Use that Gauss norm on bounded carriers only; the full Robba ring uses annular seminorms. **Check:** Coefficients p^(−floor(sqrt(n))) have unbounded supremum although the series converges at every radius below one. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E2; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. §2.1, p.4 lists the full Robba ring among the rings carrying the coefficient-supremum Gauss norm; for coefficients p^(−⌊√n⌋) that supremum is infinite although the series lies in the Robba ring.
- **E3 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Definition 2.2(2) p.5; journal version not collated](https://arxiv.org/pdf/1910.03871v3): A bounded-disc definition uses a point-indexed carrier before introducing the point. **Correction:** Use the local K[[t]]₀ carrier in this definition. **Check:** The scalar extension is from K[[t]]₀ and no point α has been chosen. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E3; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Definition 2.2(2), p.5 defines a K[[t]]₀-lattice as a module over K_α[[x_α]]₀ before any point α is introduced.
- **E4 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, §2.2 p.6; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The rational exponent group is called well ordered. **Correction:** The group Q is ordered; particular supports must be well ordered. **Check:** The negative integers form a subset of Q with no least member. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E4; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. §2.2, p.6 regards Q as a well-ordered group under the usual order; Q is not well ordered, only the supports in the definitions are.
- **E5 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Proposition 2.9 proof p.8; Proposition 2.11 p.9; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The growth proof points to a nonexistent fourth part of Lemma 2.5; another formula has an undefined length. **Correction:** Use Lemma 2.6(4), and consistently use the defined filtration length. **Check:** The numbered parts and lengths in the text do not match those symbols. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E5; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. The proof of Proposition 2.9, p.8, cites Lemma 2.5(4), which does not exist (Lemma 2.6(4) is meant); Proposition 2.11, p.9, concludes s=r with s undefined.
- **E6 (error; the proof)**, [TSU, arXiv:1910.03871v3, Proposition 3.7 proof p.14; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The category-closure proof passes from solvability to boundedness. **Correction:** Prove bounded closure using bounded trivialisations, independently of analytic solvability. **Check:** The logarithmic unipotent equation has coefficients 1/n; at n=p^r these have norm p^r. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E6; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. The proof of Proposition 3.7, p.14, says the duality claim follows from a solvable module being bounded; read literally this is false (logarithmic example, coefficients 1/n of norm p^r at n=p^r), and the boundedness of duals needs its own argument.
- **E7 (error; a stated result)**, [TSU, arXiv:1910.03871v3, Theorem 3.12 and Definition 3.13 p.15; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The bounded-quotient result asserts a nonzero quotient without excluding M=0. **Correction:** The nonzero conclusion requires M≠0; B(0)=0. **Check:** A zero module has no nonzero quotient. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E7; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Theorem 3.12, p.15, asserts a nonzero bounded quotient for every solvable M, which fails for M=0; Definition 3.13 inherits it.
- **E8 (error; a stated result)**, [TSU, arXiv:1910.03871v3, Proposition 3.18 p.16; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The tensor detection statement permits the zero unit-root factor. **Correction:** Require the unit-root tensor factor to be nonzero. **Check:** Tensoring by zero cannot distinguish a PBQ module from a non-PBQ one. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E8; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Proposition 3.18, p.16, allows N=0, for which M⊗N=0 is never PBQ in Tsuzuki's sense, so the equivalence fails for PBQ M.
- **E9 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Theorem 3.19(1–2) pp.16–17; propagated in 3.29, 4.11 and 6.4; journal version not collated](https://arxiv.org/pdf/1910.03871v3): Decreasing slopes and the bounded-quotient sum are written with nested PBQ terms. **Correction:** Use G_i=P_i/P_(i−1) throughout the slope, sum and saturated-recovery formulas. **Check:** For a split pair of slopes 1 and 0, both nonzero nested terms have maximum 1, while the grades have maxima 1 and 0. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E9; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Theorem 3.19(1)(ii), p.16, orders the maximal slopes of the nested P_i, which all equal λmax(M); (2) sums P_i/P_i¹. Both must use the grades P_i/P_(i−1); the same nested form appears in Proposition 3.29, Theorem 4.11 and Theorem 6.4.
- **E10 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Proposition 3.24 and Remark 3.25 p.18; journal version not collated](https://arxiv.org/pdf/1910.03871v3): A rank is compared to a solution vector space and the growth differential has the wrong coordinate. **Correction:** Compare rank with dim_K of the solution space and differentiate in the selected x coordinate. **Check:** A numerical rank is not a vector space, and y is not the chosen variable. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E10; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Proposition 3.24, p.18, equates a rank with the space Sol(M₀)(−λmax), and the solution spaces of §3.7 and Remark 3.25 differentiate with ∇(d/dy) although the coordinate is x.
- **E11 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Lemma 3.31 p.19; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The finite étale lemma assigns a coefficient to the wrong source curve. **Correction:** Put the direct-image coefficient on C′ and the pullback coefficient on C for f:C′→C. **Check:** The functors otherwise have mismatched domains. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E11; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Lemma 3.31, p.19, takes M† on C and forms its direct image on C, and N† on C′ and forms its pullback to C′; the domains are swapped for f:C′→C.
- **E12 (gap; the proof)**, [TSU, arXiv:1910.03871v3, Lemma 3.31 proof p.19; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The PBQ pullback proof uses the property it should establish. **Correction:** Prove the pullback assertion directly: bounded solutions commute with the finite unramified extension of generic fields (MS.0/bounded-base-change), so purity of the bounded quotient is preserved. **Check:** The displayed argument returns to PBQ of N, which was already assumed, without proving PBQ of f*N. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E12; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. In the proof of Lemma 3.31, p.19, part (1) ends by concluding PBQ of N† (the hypothesis) instead of f*N†, and part (2) invokes Lemma 3.31 itself; the two parts depend on each other. The review repairs (1) directly through the field-extension case of bounded-base-change, which is the argument of Proposition 3.14.
- **E13 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, §3.9 p.21; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The cohomological support-forgetting display has the same supports on both ends. **Correction:** The source group is compactly supported H¹_rig,c. **Check:** The following dimension statement and the support-forgetting construction identify the missing support. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E13; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. §3.9, p.21, writes the support-forgetting map from H¹_rig to H¹_rig; the source must be H¹_rig,c, as the next sentence about H¹_rig,c shows.
- **E14 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Theorem 6.4 p.27; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The graded lifting diagram mixes a generic target and a dagger morphism label. **Correction:** Use the global convergent quotient M/Mᵇ and a convergent h. **Check:** The bounded quotient was constructed in the convergent category, and a generic fibre is not this global target. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E14; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Theorem 6.4, p.27, takes h:N/N^b→M_η/M^b as a map of overconvergent F-isocrystals; the bounded quotients of Proposition 3.29 are convergent and global.
- **E15 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Corollary 6.8 proof p.29; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The rank-equality proof repeats N† as the target of an intermediate isomorphism. **Correction:** The intermediate target is M† restricted to the chosen curve. **Check:** The two arrows in its factorisation end at M†. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E15; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. In the proof of Corollary 6.8, p.29, the isomorphism g†_{C_α,M} is written from i*N† to i*N†; its displayed factorisation ends at i*M†.
- **E16 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Proposition 7.5 p.30; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The coefficient-extension transitivity formula names the wrong endpoint on the left. **Correction:** Use θ_(L₁,L₃), with the canonical associativity identification. **Check:** The composite on the right is valued in the L₃ category. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E16; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Proposition 7.5, p.30, states θ_{L₁,L₂}=θ_{L₂,L₃}∘θ_{L₁,L₂}; the left side must be θ_{L₁,L₃}.
- **E17 (gap; the proof)**, [TSU, arXiv:1910.03871v3, Proposition 7.4 p.30; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The coefficient-dual pairing does not explicitly type the trace and component projection. **Correction:** Use the finite trace to compare K-dual and L-dual, then the multiplication-component projector. **Check:** The unprojected scalar tensor factors have the wrong rank for an L-valued perfect pairing. MS.6/padic-coefficient-objects records the corrected pairing. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E17; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Proposition 7.4, p.30, pairs M†⊗_K L with (M†)^∨⊗_K L into j†O⊗_K L without saying how the two L-actions are matched; an L-valued perfect pairing in the L-linear category needs the trace of L/K and the multiplication projector.
- **E18 (error; the proof)**, [TSU, arXiv:1910.03871v3, Lemma 7.11(3) proof p.33; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The trace proof splits L⊗_K L without assuming L/K normal. **Correction:** Split L⊗_K Q̄_p over the coefficient algebraic closure, or use restriction-of-scalars trace directly. **Check:** A non-Galois separable cubic extension can have a quadratic factor in its self tensor product. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E18; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. The proof of Lemma 7.11(3), p.33, uses L⊗_K L≅∏_{τ}τ(L); for non-normal L/K the left side has factors of larger degree. Splitting L⊗_K Q̄_p is the correct step.
- **E19 (error; the proof)**, [TSU, arXiv:1910.03871v3, Proposition 7.12 proof p.34; journal version not collated](https://arxiv.org/pdf/1910.03871v3): A scalar twist contributes λ to a trace of the nth Frobenius iterate. **Correction:** Its contribution is λ^n; use characteristic-zero finite differences to show nth powers span the coefficient field. **Check:** The nth iterate of λF, for linear F here, is λ^nF^n. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E19; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. In the proof of Proposition 7.12, p.34, the twist by L(λ) multiplies the trace of F^n by λ, but F^n of λF is λ^nF^n; the conclusion survives because nth powers span L over K in characteristic zero.
- **E20 (error; a stated result)**, [TSU, arXiv:1910.03871v3, Definition 7.14 p.34 and Theorem 7.18 p.37; journal version not collated](https://arxiv.org/pdf/1910.03871v3): Integral weights are imposed before the unrestricted mixedness assertion. **Correction:** Allow real weights and restore the weight after a constant twist. **Check:** Frobenius 2 on a rank-one object over F₃ has weight 2 log₃2, which is not integral. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E20; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Definition 7.14, p.34, restricts weights to integers, while Theorem 7.18, p.37, asserts every irreducible Q̄_p-coefficient is ι-pure; the rank-one object on Spec F₃ with Frobenius 2 has weight 2log₃2.
- **E21 (misprint; the proof)**, [TSU, arXiv:1910.03871v3, Proposition 7.15(2) proof p.35; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The endomorphism lift and its composition have inconsistent domains. **Correction:** Lift Top(g′)⁻¹h to τ∈End(N†) and use g′τ:N†→M†. **Check:** Surjectivity onto top endomorphisms supplies an endomorphism of N†, not a map with target M† followed by the inverse of g′. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E21; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. In the proof of Proposition 7.15(2), p.35, surjectivity onto End of the top quotient is used to produce a map π*N†→π*M† lifting (g′)^{-1}∘h, an endomorphism of N/N¹, and then composes with (g′)^{-1} in the wrong direction; the lift is an endomorphism τ of N† and the map is g′∘τ.
- **E22 (gap; the proof)**, [TSU, arXiv:1910.03871v3, Proposition 7.15(2) pp.35–36 versus Lemma B.1 p.40; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The descent average uses the appendix trace without the coefficient projector comparison. **Correction:** First take the primitive coefficient component. The projected cyclic trace composite is m·id, so divide by m. **Check:** The raw unprojected coefficient trace contributes another m, giving m². MS.6 gives the explicit split-component computation; the categorical projector model is MS.6/padic-coefficient-objects. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E22; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Proposition 7.15(2), pp.35–36, divides by m, while Lemma B.1, p.40, gives Tr∘ad=n·[L:K]·id for the unprojected functors, which is m² here; the factor m is justified only after projecting K_m⊗_K L to one factor, as in the MS.6 node.
- **E23 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Appendix A.1 proof p.38; A.2 p.39; also confirmed at the same Appendix A locators in the publisher’s accessible journal HTML](https://arxiv.org/pdf/1910.03871v3): The appendix conflates equality of value groups with equality of valuation rings and reverses a tube image. **Correction:** Use equality of value groups, and define the tube by the inverse image under specialisation. **Check:** The residue fields of the two valuation rings differ, and specialisation has source the analytic space. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E23; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. The proof of Lemma A.1(2), p.38, says the valuation rings of (K̂^{perf,ur})^σ and K̂^{perf,ur} coincide (their residue fields differ; the value groups are meant), and §A.2, p.39, writes the tube as sp(Z) rather than sp^{-1}(Z).
- **E24 (gap; the proof)**, [TSU, arXiv:1910.03871v3, Lemma A.1(3) proof p.38; also confirmed at the same Appendix A locators in the publisher’s accessible journal HTML](https://arxiv.org/pdf/1910.03871v3): The proposed identity action on L is tensored with σ over a field where their restrictions can differ. **Correction:** Prove compatible extension of the coefficient action after enlargement, or use a separate construction. **Check:** σ may act nontrivially on K^(σ^n), so id_L and σ need not define an action on the stated tensor product. This proof is not used for the rank-one normalisation, which uses only A.1(2). **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E24; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. The proof of Lemma A.1(3), p.38, puts σ=id_L⊗σ on L⊗_{K^{σ^n}}K, which is well defined only if σ is the identity on K^{σ^n}; this need not hold.
- **E25 (gap; the proof)**, [TSU, arXiv:1910.03871v3, Lemma 3.33 proof p.20, first rank-one step; compare Lemma 3.32 p.19; journal main text not collated](https://arxiv.org/pdf/1910.03871v3): The general rank-one gluing step invokes a unit-root lemma directly. **Correction:** Twist after a compatible fixed-field value-group normalisation, glue in slope zero, then untwist and descend. **Check:** The constant rank-one object with Frobenius q has nonzero slope. The reduction and its inputs (MS.0/fixed-field-normalisation and the RD.3 unit-root request) are explicit in curve-gluing. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E25; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. The rank-one step of the proof of Lemma 3.33, p.20, applies Lemma 3.32, whose hypothesis is a unit-root L_η; a rank-one generic submodule need not be unit-root, so a constant twist is required first.
- **E26 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, Lemma 7.11(1),(3) p.33; journal main text not collated](https://arxiv.org/pdf/1910.03871v3): A finite coefficient fibre and its algebraically closed extension are interchanged in a finite trace computation. **Correction:** Take the finite L-model for the L-isomorphism and K-linear trace, then extend scalars. **Check:** The Q̄_p fibre is not finite dimensional over K or a fixed finite L, so the indicated finite-dimensional trace is not defined there. **Prior status:** Previously recorded in PAPER-TSUZUKI-23/E26; this run reads and applies that correction, and does not claim a new journal erratum. **Review:** confirmed. Lemma 7.11(1), p.33, calls the comparison with the Q̄_p-fibre an isomorphism of L-spaces, and (3) takes a K-linear trace on the Q̄_p-fibre, which is infinite dimensional over K; the finite L-model is meant.
- **E27 (misprint; the proof)**, [DAD, Theorem 4.2.6(i), p.14, arXiv v4](https://arxiv.org/pdf/2012.12879v4): The reverse-filtration grade uses shifted indices. **Correction:** Its i-th completed grade is S_(m+1−i)/S_(m−i). **Check:** For i=m the last grade must be S₁/S₀, not a quotient with negative index; the parent reverse-filtration node already carries the correction. **Prior status:** Previously recorded in PAPER-DADDEZIO-23/E3; no assertion about the uncollated journal wording. **Review:** confirmed. Checked in the arXiv v4 TeX source: Theorem 4.2.6(i), p.14, identifies the i-th reverse grade with S_{m−i}/S_{m−i−1}; with S_m the whole module, the i-th grade must be S_{m+1−i}/S_{m−i}, as used in Lemma 4.2.7's S_m/S_{m−1}.
- **E28 (misprint; the proof)**, [DAD, Theorem 4.2.6(ii), p.14, arXiv v4](https://arxiv.org/pdf/2012.12879v4): The isoclinic object in the eigenbasis assertion is not the algebraically extended object just introduced. **Correction:** Apply the assertion to M†_alg and its finite eigenvalue extension. **Check:** The proof and its chosen eigenbasis use the extended residue coefficient carrier. **Prior status:** Previously recorded in PAPER-DADDEZIO-23/E4; no assertion about the uncollated journal wording. **Review:** confirmed. Checked in the TeX source: Theorem 4.2.6 concerns a φ-module M†_alg over E†_alg, but (ii) begins 'If M† is isoclinic', an object not introduced in the theorem; the extended module is meant.
- **E29 (gap; the proof)**, [DAD, Proposition 4.2.12 proof, p.17, arXiv v4](https://arxiv.org/pdf/2012.12879v4): Compactness is asserted for the embedded integral module and used for a positive lower bound outside pQ. **Correction:** Supply a Frobenius-specific strictness argument; G1 keeps the alternate comparison unclosed. **Check:** In A_n, (pu^n)^j is outside pA_n but its image tends to zero, contradicting the asserted lower bound; the general quotient has unbounded p-torsion. **Prior status:** Previously recorded in PAPER-DADDEZIO-23/E5; no assertion about the uncollated journal wording. **Review:** confirmed. In the proof of Proposition 4.2.12, p.17, the claimed positive infimum of ‖f_n(m)‖ over m∉pQ_{W,n} fails already for the inclusion A_n⊂W⟨u⟩: ū_n^j=p^ju^{nj} is not in pA_n (an element of A_n of total u-degree nj needs at least j factors ū_i) yet has norm p^{−j}. The proposition itself is not refuted.
- **E30 (misprint; the proof)**, [DAD, Lemma 4.1.4 proof, p.12, arXiv v4](https://arxiv.org/pdf/2012.12879v4): The induced direct sum appears with all of N in place of its first slope term. **Correction:** The direct-sum term is ⊕F^{i*}S_min(N). **Check:** The reduction concerns the first slope piece; induction does not make a multi-slope N pure. **Prior status:** Previously recorded in PAPER-DADDEZIO-23/E12; no assertion about the uncollated journal wording. **Review:** confirmed. Checked in the TeX source: the proof of Lemma 4.1.4, p.12, writes ⊕(F^i)*N=S₁(N′); the left side must be ⊕(F^i)*S₁(N), since S₁ commutes with the induction.
- **E31 (misprint; nothing)**, [OHK, Proposition 5.9, p.26, arXiv:1809.04065v1](https://arxiv.org/pdf/1809.04065v1): The explanatory equality identifies the zero-th log-growth kernel with all of a pure module. **Correction:** For a pure module the boundedness conclusion means M^0=0, so its bounded quotient M/M^0 is M. **Check:** Definition 5.5 defines the bounded quotient by this kernel; Theorem 5.4 identifies its rank with the bounded solution dimension. A trivial rank-one module has a one-dimensional bounded solution space and kernel zero, contradicting the printed equality for that nonzero pure module. **Prior status:** new against the preprint version read; no claim about the journal wording **Review:** confirmed. Proposition 5.9, p.26, glosses 'M is bounded' as M⁰=M; by Definitions 5.3 and 5.5 boundedness means M⁰=0 and the bounded quotient M/M⁰ is M.
- **E32 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, proof of Theorem 3.19(1), p.16; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The construction of the first PBQ step cites a Proposition 3.10. **Correction:** The splitting result cited is Theorem 3.10. **Check:** There is no Proposition 3.10; Theorem 3.10 is the bounded splitting theorem that the step uses. **Prior status:** new **Review:** confirmed. Found and checked at the locator by the independent review.
- **E33 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, proofs of Proposition 2.10(2) and Lemma 2.12, p.9; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The proof of Proposition 2.10(2) applies Proposition 2.9 to z_{i,s}, and the proof of Lemma 2.12 cites a Lemma 2.9. **Correction:** The Frobenius equation was derived for z_{i,1}, and the result cited in Lemma 2.12 is Proposition 2.9. **Check:** The displayed equation just before is for z_{i,1}; there is no Lemma 2.9. **Prior status:** new **Review:** confirmed. Found and checked at the locator by the independent review.
- **E34 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, proof of Theorem 2.14, p.10; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The trivialised module is written as a tensor power of Ẽ. **Correction:** It is a direct sum of dim_E M copies of Ẽ. **Check:** Proposition 2.10(1), which is invoked, gives a trivial φ-module, i.e. a direct sum of copies of the unit object. **Prior status:** new **Review:** confirmed. Found and checked at the locator by the independent review.
- **E35 (misprint; nothing)**, [TSU, arXiv:1910.03871v3, proof of Corollary 6.8, p.29; journal version not collated](https://arxiv.org/pdf/1910.03871v3): The same-curve case is said to follow from Corollary 6.5 (1). **Correction:** It follows from case (i) of Corollary 6.5. **Check:** Corollary 6.5 has alternatives (i) and (ii), not numbered parts; the irreducible case is (i). **Prior status:** new **Review:** confirmed. Found and checked at the locator by the independent review.
