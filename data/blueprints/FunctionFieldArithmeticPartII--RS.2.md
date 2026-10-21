# RS.2 — Coherent infinite roots and fpqc Kummer towers

This is the RS.2 geometric refinement of **FunctionFieldArithmeticPartII**. It
builds on the [accepted parent packet](../packets/FunctionFieldArithmeticPartII.json)
and its [reader](FunctionFieldArithmeticPartII.md). The parent already supplies
the finite chart algebra, transition injections, factorial/positive-index algebra
comparisons, Q/Z character coaction, native affine Spec limit and tensor base
change. Those calculations remain prerequisites. This part specifies the
native line-bundle groupoids and geometric comparisons still missing from that
plan. Its new IDs refine the parent targets identified below; they do not
introduce another owner for root stacks or repeat the affine algebra.

The planning pass is complete and RS.2 is **planned**. All 21 targets remain
unchecked. The carrier gap and the seven supplier contracts at the end are
required for mathematical closure. Since 14 October 2026 most of those
contracts are specified by SchemeAndStackFoundations, now a TauCetiRoadmap
roadmap: its §1.21 owns finite root stacks with their transitions, DVR charts
and nonreduced zero fibres, so this layer cites it for the finite stages. The
one generic input that no supplier states, the limit of a tower of finite flat
torsors, is planned here as `RS.2/flat-torsor-tower-limit`. The [suggested file](../suggested/FunctionFieldArithmeticPartII--RS.2.lean)
contains light definitions over existing carriers, statable milestones and a
few examples. The full geometric specifications, APIs and checks live here;
unavailable carriers are recorded in its omission ledger.

## Conventions and native interfaces

Fix a scheme X, an invertible sheaf L and a section s. A positive n-root on
T→X is a native triple (M,t,φ), where M is an invertible sheaf, t is a section,
and φ:M^n≅L_T sends t^n to s_T. An arrow h:M≅M′ preserves both t and φ.
Tau Ceti's `InvertibleSheaf` is a full category of rank-one module sheaves;
its **core** supplies the isomorphisms used here; SchemeAndStackFoundations
§3.4 packages that core as the Picard groupoid of the scheme, with its
symmetric monoidal structure and pullback. Tensor powers and sections must use
the native vector-bundle/module APIs, not abstract vector spaces.

The index category has positive integers as objects and one arrow m→n when
n divides m. Put q=m/n. Its transition is (M,t,φ)↦(M^q,t^q,φ), interpreted
through a specified tensor-power isomorphism. Composition is coherent up to
those isomorphisms. Strict equalities in TV17's monoidal-functor model do not
make native tensor-power functors strictly equal. The factorial subsystem is
1!,2!,3!,… . A two-limit object includes all transition isomorphisms and their
cocycles; a two-limit arrow includes all compatibility squares.

Use the fpqc site for infinite torsors and quotient stacks. Finite μn-torsors
are fppf for every positive n; an étale comparison requires n invertible.
The group scheme G=lim μn is D(Q/Z), with the parent character χ_(1/n).
G is a represented affine fpqc sheaf. It is not a discrete group of field
points, and infinite torsors need not be fppf locally trivial.

On a trivialized target line, a normalized **coframe** is β:M≅O with β^n=φ.
Use LEFT action ζ·β=ζβ. Its coordinate β(t) therefore scales by ζ, agreeing
with the parent LEFT chart coaction z_n↦χ_(1/n)z_n. A root arrow h transports
β to βh^−1. Consequently the coframe presentation inverts the scalar band on
the zero-section root gerbe. The band-preserving Kummer classification uses
`Isom(x_λ,y)` from a chosen origin, which is the inverse coframe torsor.

Choose a coefficient universe u and fixed object/morphism universes large
enough for the native scheme and sheaf categories. The positive index is
small. Each supplier must expose evaluation, pullback strong transformations,
their modifications and the required universe lifts. There is no assertion
that all schemes or all fibres live in a single small universe. Those native
adapters are part of RS2-NATIVE-CARRIERS.

## The native diagram and its two-limit

### Native root transition pseudodiagram

Target `FunctionFieldArithmeticPartII:RS.2/transition-native` (construction).

For a scheme X with invertible sheaf L and section s, form the root-groupoid diagram indexed by positive integers with the arrow m→n when n divides m. At T→X, F(n,m) sends (M,t,φ) to (M^(m/n),t^(m/n),φ), using the specified tensor-power comparison to interpret φ. On arrows it takes tensor powers. Supply unit constraints and composition isomorphisms F(n,m)F(m,l)≅F(n,l), including their coherence and compatibility with arbitrary scheme pullback.

**Hypotheses.** Native finite root groupoids from RS.0–RS.1, using the core of InvertibleSheaf, not its full category. One fixed coefficient universe and explicitly lifted object/morphism universes; no same-universe assertion for all schemes.

**Depends on.** `FunctionFieldArithmeticPartII:RS.0/root-object`, `FunctionFieldArithmeticPartII:RS.0/tensor-power`, `FunctionFieldArithmeticPartII:RS.0/section-power`, `FunctionFieldArithmeticPartII:RS.1/base-change`, `SchemeAndStackFoundations:SF.3`, `mathlib:AlgebraicGeometry.Scheme`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `SchemeAndStackFoundations:SF.1`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/transition`.

**Construction/proof.**

1. Take the tensor-power functor and its section comparison supplied by RS.0 and SF.3. Transport the root equation through the associativity comparison.
2. Construct each compositor from the specified power associativity isomorphism. Its root-section equation and arrow naturality follow from the corresponding RS.0 laws.
3. Use the unit and associativity coherence of those same comparisons to obtain the pseudodiagram laws. Finite pullback comparisons induce a strong transformation of diagrams, including its modification laws.
4. Under the comparison of the RS.0–RS.1 native root groupoids with rootStack n (L,s) of the merged SchemeAndStackFoundations §1.21, each F(n,m) is that roadmap's rootStack.transition. §1.21 states the transition maps only; the unit and compositor constraints, their coherence and their pullback modifications are the RS.2 content of this node.

**Consumers.**

- `FunctionFieldArithmeticPartII:RS.2/coherent-roots-native`: The transitions and compositors define the compatibility equations.
- `FunctionFieldArithmeticPartII:RS.2/coframe-tower`: Power comparisons determine the finite coframe-torsor transitions.

**API.**

- `RootTransition.map` (functoriality): Object and arrow maps are tensor powers, with both root equations preserved.
- `RootTransition.unitIso` (compatibility): The n→n functor is coherently isomorphic to the identity.
- `RootTransition.compIso` (compatibility): For n|m|l, the specified natural isomorphism compares the composite with F(n,l) and satisfies the triple-composition law.
- `RootTransition.pullbackIso` (compatibility): Pullback commutes with each transition, with its unit and composite diagrams.

**Checks.**

- `RootTransitionTests.one` (degenerate): The 1-root diagram evaluation agrees with the groupoid of the given pair; its transition unit is retained.
- `RootTransitionTests.six` (compatibility): For 2|6|30 the two tensor-power routes preserve t^15 and the given power identification under the associativity isomorphism.
- `RootTransitionTests.zeroArrow` (non-example): On a zero-section root of exponent 6, a scalar ζ in μ6 is sent at exponent 2 to ζ^3, not to the identity in general.

**Acceptance.** For n|m|l and a root (M,t,φ), the compositor F(n,m)F(m,l)(M,t,φ) ≅ F(n,l)(M,t,φ) is the tensor-power associativity isomorphism (M^(l/m))^(m/n) ≅ M^(l/n) assembled from InvertibleSheaf.tensorProductAssoc and the unit isomorphisms; for n = m = l it is the unit constraint. On objects and arrows each F(n,m) agrees with rootStack.transition of the merged SchemeAndStackFoundations §1.21. On the zero-section root (O,0,id) of exponent 6 over T, F(2,6) sends the automorphism ζ ∈ μ6(T) to ζ³ ∈ μ2(T).

**Source.** [TV17](#tv17) — Proposition 3.2 and the paragraph preceding it, p.13. Transitions and composition in the monoidal-functor model motivate this native line-bundle specialization. Strict equality in that model is not imposed on tensor powers. [AGV08](#agv08) — Appendix B.2, p.53. The objects and arrows retain the section and the power identification.

### Coherent native root systems

Target `FunctionFieldArithmeticPartII:RS.2/coherent-roots-native` (definition).

Specialize the imported compatible-family carrier to the native root pseudodiagram. A system over T consists of roots x_n and specified isomorphisms α(n,m):F(n,m)(x_m)≅x_n for every n|m. For n|m|l, α(n,m) composed with F(n,m)(α(m,l)) equals α(n,l) after the compositor; the unit equation uses the unit constraint. Arrows h are component root isomorphisms satisfying h_n α(n,m)=α′(n,m)F(n,m)(h_m). Pullback acts on components and comparisons. This groupoid, not a set of root classes, is the infinite-root fibre.

**Hypotheses.** The pseudodiagram and universe policy of transition-native. All components are actual root objects with their sections and power identifications.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/transition-native`, `AlgebraicModuliForArithmeticGeometry:R09.4/compatible-limit-family`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-root-stack`.

**Construction/proof.**

1. Instantiate the generic compatible-family construction with the positive-divisibility root diagram.
2. Use the generic componentwise category structure and invertibility criterion, since every fibre arrow is already an isomorphism.
3. Construct scheme pullback from the strong transformation supplied by transition-native; evaluation and the section/power equations remain componentwise.

**Consumers.**

- `FunctionFieldArithmeticPartII:RS.2/factorial-roots-native`: Restriction must preserve compatible arrows as well as objects.
- `FunctionFieldArithmeticPartII:RS.2/infinite-quotient-native`: This is the target groupoid of the torsor-and-equivariant-map equivalence.

**API.**

- `RootSystem.component` (projection): Evaluation at n returns the entire root triple.
- `RootSystem.transition` (projection): The specified α(n,m) is a root isomorphism, with unit and compositor equations.
- `RootSystem.hom_ext` (extensionality): Two system arrows agree exactly when every component root arrow agrees.
- `RootSystem.pullback` (functoriality): Arbitrary test-scheme pullback acts on both roots and α, with coherent composition.
- `RootSystem.evaluation` (functoriality): Evaluation is a groupoid functor and its transition transformations recover α.
- `RootSystem.ofFrame` (constructor): For s = 0 and a frame λ: O_T ≅ L_T, the system x_λ with components (O_T, 0, e^n ↦ λ) and transitions given by the canonical isomorphisms (O^(⊗q))^(⊗n) ≅ O; its automorphism group over T is G(T) = lim μ_n(T).
- `RootSystem.ofFactorial` (constructor): A coherent system on the factorial indices 1!, 2!, 3!, … extends to all positive indices, with x_n = F(n,r!)(x_(r!)) for any r with n | r!; this is the inverse of restriction in RS.2/factorial-roots-native.

**Checks.**

- `RootSystemTests.nonvanishing` (computation): For an invertible section s, the groupoid of compatible root systems over every T→X is contractible: each t_n trivializes M_n and forces every component arrow to be the identity.
- `RootSystemTests.zeroBand` (characterisation): Over a field with L trivial and s=0, the compatible trivial roots have automorphism sheaf lim μn, including nonreduced μp in characteristic p.
- `RootSystemTests.incoherent` (non-example): A family of root triples and pairwise isomorphisms violating the 1|2|4 cocycle is rejected, even if every component isomorphism class exists.
- `RootSystemTests.realBand` (non-example): Over ℝ with (L,s) = (O,0), the trivial system has trivial automorphism group G(ℝ) = lim μ_n(ℝ), although each component of even degree has automorphism group μ_n(ℝ) = {±1}: every ζ_n is the square of ζ_2n. A definition that takes automorphisms componentwise without the compatibility squares gives a nontrivial group.

**Acceptance.** If s is invertible on X, the groupoid of systems over every T→X is contractible. For X = Spec k and (L,s) = (O,0), the system (O,0,id)_n with identity transitions has automorphism group lim μ_n(T) over T; over T = Spec ℝ this group is trivial. A family of root triples with pairwise isomorphisms that violates the 1|2|4 cocycle is not an object, even when every finite isomorphism class is correct.

**Source.** [TV17](#tv17) — Proposition 3.5 and Remark 3.6, p.14. The infinite root stack is a genuine two-limit. The displayed cocycle presentation specializes that limit to roots of one pair.

### Factorial reindexing of native roots

Target `FunctionFieldArithmeticPartII:RS.2/factorial-roots-native` (theorem).

Restriction of coherent native root systems to the sequence 1!,2!,3!,… is an equivalence of groupoids, pseudonatural in T→X and compatible with all positive-degree evaluations up to specified natural isomorphism. The inverse extends both objects and arrows and supplies all transition cocycles. The same argument applies to coherent finite torsor systems.

**Hypotheses.** The native root pseudodiagram; the factorial sequence starts at 1. Use cofinality of positive divisibility, not a bijection of index sets.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/coherent-roots-native`, `mathlib:Nat.dvd_factorial`, `mathlib:Nat.factorial_dvd_factorial`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/factorial-root-limit`.

**Construction/proof.**

1. For an n-component choose a factorial r! divisible by n (n | r! once r ≥ n, Nat.dvd_factorial) and apply F(n,r!) to the r!-component. For comparing n|m, compare their chosen stages in a common larger factorial (r! | s! for r ≤ s, Nat.factorial_dvd_factorial).
2. Compose the supplied factorial transition isomorphisms and pseudodiagram compositors. Their cocycles show independence of the common comparison stage and give the all-positive cocycle.
3. Extend component arrows in the same way. Build the restriction–extension unit and counit from the original transitions; verify their naturality, triangle identities and pullback modifications. No uniqueness claim discards stabilizer arrows.

**Acceptance.** The inverse is a groupoid equivalence with evaluation comparisons; an inverse limit of sets does not meet this target. The unit of the equivalence at degree 5 is the given isomorphism α(5,5!): F(5,5!)(x_(5!)) ≅ x_5. For (L,s) = (O,0), restriction induces an isomorphism lim_n μ_n(T) ≅ lim_r μ_(r!)(T) on automorphism groups of the trivial system.

**Source.** [TV17](#tv17) — Remark 3.6 after Proposition 3.5, p.14. The source permits cofinal indexing. The extension of native tensor-power objects, arrows and cocycles is the explicit root-specific proof obligation here.

### Effective fpqc descent for native root systems

Target `FunctionFieldArithmeticPartII:RS.2/root-limit-descent-native` (theorem).

The native compatible-root pseudofunctor is an fpqc stack. A descent datum consists of a compatible root system on a cover, with compatible-system arrows on overlaps satisfying their cocycle. Descending all finite roots and all α produces the descended system, and descent on compatible arrows is fully faithful.

**Hypotheses.** Use the fpqc topology on schemes over X and the existing finite-root fpqc descent theorem. No finite-presentation or algebraicity assertion for the infinite stack.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/coherent-roots-native`, `FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent`, `AlgebraicModuliForArithmeticGeometry:R09.4/limit-stack-descent`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-root-stack`.

**Construction/proof.**

1. Apply the imported compatible-limit stack descent theorem to the finite-root stack diagram.
2. Effectiveness descends each x_n. Full faithfulness descends α(n,m) and the system arrows. Equality of their coherence diagrams is detected on the cover.
3. Use the supplied pullback constraints to compare the descended system with the original descent datum. The fppf stack restriction follows because fppf covers are fpqc.

**Acceptance.** Twisting: over X = Spec ℚ with (L,s) = (O,0), descending the trivial system along the fpqc covering P → Spec ℚ of RS.2/roots-two-fpqc-native, with descent datum given by the G-action, yields a system x_P with Isom(x, x_P) ≅ P. It has no ℚ-rational isomorphism to x and is not isomorphic to x over any nonempty fppf ℚ-scheme, so an fppf stack would miss it. Two system arrows that agree after pullback to an fpqc covering are equal.

**Source.** [TV17](#tv17) — Definition 3.8 and Proposition 3.10, pp.15–16. The quotient uses actual fpqc torsors. Native effectivity is supplied by the imported finite and compatible-limit descent contracts.

### Arbitrary base change of native infinite roots

Target `FunctionFieldArithmeticPartII:RS.2/root-limit-base-change-native` (comparison).

For g:Y→X, roots of (g*L,g*s) form a stack equivalent to the two-fibre product of the native infinite root stack of (L,s) with Y over X. The equivalence is compatible with every finite evaluation, all α, factorial restriction, and composites of base changes.

**Hypotheses.** Arbitrary scheme morphisms, including nonflat maps. Use the generic two-fibre products of the merged SchemeAndStackFoundations §1.18 on the fpqc site, and the finite root base-change equivalences.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/transition-native`, `FunctionFieldArithmeticPartII:RS.2/coherent-roots-native`, `FunctionFieldArithmeticPartII:RS.1/base-change`, `SchemeAndStackFoundations:SF.1`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-base-change`.

**Construction/proof.**

1. Apply the finite base-change equivalence to each root triple and to each component arrow.
2. The transition/pullback comparison transports every α and its cocycle. Construct the inverse by the inverse finite comparisons.
3. Check unit/counit and composition as modifications after each evaluation, using componentwise arrow extensionality. This makes no claim that arbitrary coefficient change is faithful.

**Acceptance.** Along the closed point Spec k → Spec R of a DVR, the infinite root stack of (O(D),1) base changes to that of (N,0), N = O(D)|k; on the uniformizer chart this is C_R(π) ⊗_R k ≅ C_k(0) = colim k[z_n]/(z_n^n), with the nonzero nilpotent z_n retained. For composable g: Y → X and h: Z → Y, the equivalence for gh is the composite of those for g and h up to the pullback compositors, checked after every finite evaluation.

**Source.** [TV17](#tv17) — Proposition 3.4, p.13. Finite and infinite roots commute with base change; the target records the native groupoid comparisons and their coherence.

## From line coframes to an fpqc quotient

### Normalized coframes of a finite root

Target `FunctionFieldArithmeticPartII:RS.2/normalized-coframes` (construction).

For a root (M,t,φ:M^n≅O_T) of (O_T,f), let P_n be the sheaf of coframes β:M≅O_T with β^n=φ. This sheaf is represented by a finite locally free μn-torsor of rank n. Use LEFT action ζ·β=ζβ. The coordinate x_n(β)=β(t) satisfies x_n^n=f and x_n(ζ·β)=ζ x_n(β). Root isomorphisms act by β↦β h^−1. This is the normalized coframe torsor; the chart t^n=f itself is a torsor only when f is a unit.

**Hypotheses.** A positive n, arbitrary scheme T, actual invertible sheaf and root section. The target line has been trivialized; gluing for a general L uses root-limit-descent-native.

**Depends on.** `FunctionFieldArithmeticPartII:RS.0/root-object`, `FunctionFieldArithmeticPartII:RS.0/section-power`, `FunctionFieldArithmeticPartII:RS.1/affine-chart`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.3`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

**Construction/proof.**

1. Choose a Zariski local basis of M. If φ of its nth power is the unit a, normalized coframes are given by an invertible coefficient b with b^n=a.
2. Globally P_n is the relative spectrum over T of the O_T-algebra ⊕_(0≤i<n) M^(⊗i), with multiplication M^(⊗i) ⊗ M^(⊗j) → M^(⊗(i+j)) followed by φ in degrees ≥ n (merged SchemeAndStackFoundations §0.1 relative Spec). It is finite locally free of rank n, locally O_T[b]/(b^n − a), and it is the μ_n-torsor attached to the pair (M,φ) in the description of H¹_fppf(T,μ_n) by line bundles with a trivialized nth power (merged SchemeAndStackFoundations §2.11; Stacks Lemma 59.28.5, tag 040Q). No gluing beyond relative Spec is needed, and n need not be invertible.
3. Evaluate t in the normalized coframe. The root equation gives x_n^n=f; scaling the coframe gives the LEFT scaling convention. Transport along a root arrow preserves normalization and the evaluation map.

**Consumers.**

- `FunctionFieldArithmeticPartII:RS.2/coframe-tower`: The normalized power condition makes every finite transition a torsor map.
- `FunctionFieldArithmeticPartII:RS.2/coframe-evaluation`: The coframe coordinates construct the equivariant infinite chart map.

**API.**

- `RootCoframe.torsor` (structure): P_n is a represented μn-torsor with LEFT scalar action, finite locally free of rank n.
- `RootCoframe.evaluation` (projection): Evaluation has equation x_n^n=f and the specified weight-one equivariance.
- `RootCoframe.mapIso` (functoriality): A root isomorphism h sends β to β h^−1 and preserves evaluation.
- `RootCoframe.pullbackIso` (compatibility): Formation of P_n and evaluation commutes with arbitrary pullback.
- `RootCoframe.localEquation` (characterisation): In a basis with φ(e^n)=a, P_n has equation b^n=a, where a is a unit, independently of whether f vanishes.
- `RootCoframe.relativeSpecIso` (characterisation): P_n ≅ Spec_T(⊕_(0≤i<n) M^(⊗i)), multiplied through φ in degrees ≥ n; the μ_n-action is the grading, ζ acting on M^(⊗i) by ζ^i.

**Checks.**

- `RootCoframeTests.zero` (non-example): For M=O, φ=identity, t=0, P_n=μn and evaluation is zero; Spec k[z]/z^n is not this torsor for n>1.
- `RootCoframeTests.unit` (computation): For M=O, t=c, φ(e^n)=a, P_n is b^n=a and evaluation is bc, hence (bc)^n=ac^n=f.
- `RootCoframeTests.wild` (compatibility): For n=p in characteristic p, the μp coframe torsor uses its full finite flat group scheme, even though μp(k) is trivial.
- `RootCoframeTests.nonflat` (compatibility): Reduction modulo a nilpotent ideal pulls back the coframe torsor and evaluation, without asserting injectivity on root arrows.

**Acceptance.** In a local basis e with φ(e^n) = a, P_n is Spec O_T[b]/(b^n − a) with a a unit, whether or not f vanishes, and the coordinate is x_n = b·c where t = c·e. For the zero root (O,0,id), P_n is μ_n itself, while the chart fibre Spec k[z]/(z^n) is not a torsor for n > 1.

**Source.** [AGV08](#agv08) — Appendix B.1–B.2, pp.52–54. Finite line-root and root-with-section presentations yield this normalized coframe specialization; no nonvanishing section is assumed. [TV17](#tv17) — Definition 3.8 and Proposition 3.10, pp.15–16. The quotient requires a torsor and an equivariant chart map as distinct pieces of data. [Stacks](#stacks) — Lemma 59.28.5 (tag 040Q). The fppf H¹ of μ_n is the group of pairs of a line bundle and a trivialization of its nth power; the coframe torsor is the torsor attached to (M,φ).

### Finite transition torsors of a coherent root

Target `FunctionFieldArithmeticPartII:RS.2/coframe-tower` (theorem).

For a coherent root system of (O_T,f) and n|m with q=m/n, the map P_m→P_n sends β_m to β_m^q α(n,m)^−1. It is equivariant for μm→μn, ζ↦ζ^q, and is a torsor under its kernel μq, finite locally free of rank q. These maps satisfy composition exactly after the chosen root coherence and are compatible with arbitrary base change and root-system arrows.

**Hypotheses.** The normalized coframe convention, actual α(n,m), arbitrary characteristic and positive indices.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/coherent-roots-native`, `FunctionFieldArithmeticPartII:RS.2/normalized-coframes`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

**Construction/proof.**

1. Normalization follows from α preserving the nth-power identification. Its section equation gives x_n=x_m^q.
2. Over P_n, choose a coframe of M_m locally and solve the qth-root equation for the required unit coefficient. This gives a finite flat μq-torsor; finite Kummer exactness supplies local surjectivity.
3. Compute compositions using the α cocycle and the tensor-power compositor, including the unit case. The same calculation respects root arrows and pullback.

**Acceptance.** For the trivial system (O,0,id)_n with identity transitions, P_m → P_n is μ_m → μ_n, ζ ↦ ζ^(m/n), a μ_(m/n)-torsor. For the system of roots of 2 over ℚ, P_4 → P_2 is Spec ℚ[z_4]/(z_4^4 − 2) → Spec ℚ[z_2]/(z_2^2 − 2), z_2 ↦ z_4², finite locally free of rank 2. The maps compose exactly: P_l → P_m → P_n equals P_l → P_n, using the α cocycle and the tensor-power compositor.

**Source.** [TV17](#tv17) — Proposition 3.10 and Lemma 3.12, pp.15–16. Compatible trivializations of rational-power data give the transition torsors. The finite coframe formula is the native one-pair specialization.

### Limits of finite flat torsor towers

Target `FunctionFieldArithmeticPartII:RS.2/flat-torsor-tower-limit` (theorem).

Let T be a scheme. Let G_n (n ≥ 1) be commutative group schemes over T, each finite locally free, with homomorphisms π(n,m): G_m → G_n for n|m such that π(n,n) is the identity, π(n,m)π(m,l) = π(n,l), and each π(n,m) is faithfully flat with finite locally free kernel. Put G = lim G_n, an affine flat group scheme over T. Let P_n be fppf G_n-torsors with π(n,m)-equivariant T-morphisms p(n,m): P_m → P_n, p(n,n) = id and p(n,m)p(m,l) = p(n,l). Then: (a) each p(n,m) is a torsor under ker π(n,m), hence finite locally free and surjective; (b) the limit P = lim P_n exists, is affine over T, and over an affine open U ⊆ T its coordinate ring is the directed colimit of those of the P_n|U; (c) P → T is faithfully flat, so {P → T} is an fpqc covering; (d) the action map G ×_T P → P ×_T P, (g,x) ↦ (gx,x), is an isomorphism, so P is an fpqc G-torsor, and for every n the G-map P → P_n induces an isomorphism P ×^G G_n ≅ P_n of G_n-torsors; (e) formation of P commutes with every base change T′ → T; (f) G-equivariant T-morphisms P → Q between two such limits correspond bijectively to compatible families of G_n-equivariant morphisms P_n → Q_n; (g) for every fpqc G-torsor Q the pushforwards Q_n = Q ×^G G_n are fppf G_n-torsors and the canonical map Q → lim Q_n is an isomorphism. Hence fpqc G-torsors and such towers, with equivariant maps, form equivalent groupoids. Neither finite presentation of P nor fppf-local triviality of P is asserted.

**Hypotheses.** T is an arbitrary scheme; the index set is the positive integers ordered by divisibility, which is directed. Each G_n is finite locally free over T and each transition G_m → G_n is faithfully flat with finite locally free kernel. For G_n = μ_n,T and ζ ↦ ζ^(m/n) the transition is the qth-power map, q = m/n: the coordinate ring of μ_m is free of rank q over that of μ_n, and the kernel is μ_q. Each P_n is an fppf G_n-torsor; the tower maps are equivariant and compose exactly.

**Depends on.** `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.Scheme.fpqcTopology`, `mathlib:Module.FaithfullyFlat`, `mathlib:AlgebraicGeometry.Flat.flat_and_surjective_iff_faithfullyFlat_of_isAffine`.

**Construction/proof.**

1. (a) Fppf locally on T choose a section of P_m, so P_m ≅ G_m; then p(n,m) becomes π(n,m) followed by a translation of G_n. π(n,m) is finite, flat and of finite presentation with kernel K = ker π(n,m), and G_m ×_(G_n) G_m ≅ G_m × K, so it is a K-torsor. These properties are fpqc local on the base (Stacks 02KY, 02L2, 02LA).
2. (b) The transition maps are finite, hence affine, and P_1 is finite over T, so the limit exists and is computed affine-locally (merged SchemeAndStackFoundations §0.9 affine_transition_limits; Stacks 01YW, 01YX). Over U = Spec R it is Spec of the directed colimit of the coordinate rings of the P_n|U.
3. (c) Each P_n|U is finite locally free and surjective over U, so its coordinate ring is a faithfully flat R-algebra; a directed colimit of faithfully flat R-algebras is faithfully flat (Stacks 090N). Translate with flat_and_surjective_iff_faithfullyFlat_of_isAffine. P is affine over T, hence quasi-compact, and {P → T} is an fpqc covering.
4. (d) Fibre products commute with limits: G ×_T P = lim(G_n ×_T P_n) and P ×_T P = lim(P_n ×_T P_n), and the action map is the limit of the finite action isomorphisms. The G-map P → P_n factors through P ×^G G_n (pushforward along G → G_n, merged SchemeAndStackFoundations §2.3 NonabelianH1.map and §1.16), a G_n-map of G_n-torsors, hence an isomorphism (§1.15 Torsor.hom_isIso).
5. (e) Pullback of affine schemes is tensor product of coordinate rings, and tensor product commutes with directed colimits. (f) is the universal property of the limit together with equivariance at each finite stage.
6. (g) Q_n is an fpqc G_n-torsor. It is representable by a T-scheme affine over T, by effective fpqc descent of affine morphisms (Stacks 0245; merged SchemeAndStackFoundations §1.1), and it is finite locally free and surjective over T because these properties descend. So Q_n → T is an fppf covering that trivializes Q_n. The map Q → lim Q_n is a G-map of G-torsors by (d), hence an isomorphism; Talpo–Vistoli sketch this direction in Remark 3.9.

**Consumers.**

- `FunctionFieldArithmeticPartII:RS.2/coframe-inverse-limit`: The coframe tower with G_n = μ_n,T is a tower of this kind; its limit is P∞.
- `FunctionFieldArithmeticPartII:RS.2/coframe-fpqc-torsor`: Parts (c) and (d) give faithful flatness, the action square and the finite quotient comparisons.
- `FunctionFieldArithmeticPartII:RS.2/kummer-tower-native`: Parts (d), (f) and (g) with G_n = μ_n,k give the equivalence of fpqc G-torsors with coherent finite towers.
- `FunctionFieldArithmeticPartII:RS.2/roots-two-fpqc-native`: Gives the affine fpqc G-torsor of compatible roots of 2.

**Acceptance.** Roots of 2: for G_n = μ_n over Spec ℚ and P_n = Spec ℚ[z_n]/(z_n^n − 2) with z_n = z_m^(m/n), P = Spec colim ℚ[z_n]/(z_n^n − 2) is an fpqc G-torsor with no ℚ-point (RS.2/roots-two-fpqc-native). Trivial tower: P_n = G_n with p(n,m) = π(n,m) gives P = G with its translation action. Faithful flatness in (c) is proved on coordinate rings from the faithfully flat finite stages; nonemptiness of geometric fibres alone is not used. The comparison of (d) at each n is an isomorphism of G_n-torsors, not only of schemes.

**Source.** [TV17](#tv17) — Remark 3.9, p.15. For a projective system of affine group schemes of finite type with limit G, the remark sketches that a G-torsor is the projective limit of its pushforwards to the finite stages; this is direction (g). The construction (a)–(f) of a torsor from a compatible tower is supplied here. [Stacks](#stacks) — Lemmas 32.2.2 (tag 01YX), 10.39.20 (tag 090N), 35.37.1 (tag 0245), 35.23.13, 35.23.17 and 35.23.25 (tags 02KY, 02L2, 02LA). Limits of schemes along affine transition maps exist and are affine-local; directed colimits of faithfully flat algebras are faithfully flat; descent data for affine morphisms along fpqc coverings are effective; local finite presentation, flatness and finiteness are fpqc local on the base.

### The represented inverse limit of coframes

Target `FunctionFieldArithmeticPartII:RS.2/coframe-inverse-limit` (construction).

The coherent finite coframe tower has an affine inverse limit P∞ over T, with projections to every P_n and a represented action of G_T=lim μn,T=D_T(Q/Z). Formation of P∞ commutes with arbitrary base change, and restriction to factorial indices gives the same limit. On an affine U⊂T, its coordinate algebra is the filtered colimit of the coordinate algebras of P_n|U. The action and projections agree with the parent Q/Z band and Spec-limit conventions.

**Hypotheses.** The finite coframe tower; T need not be affine or Noetherian. The hypotheses of RS.2/flat-torsor-tower-limit, with G_n = μ_n,T.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/coframe-tower`, `FunctionFieldArithmeticPartII:RS.2/factorial-roots-native`, `FunctionFieldArithmeticPartII:RS.2/flat-torsor-tower-limit`, `FunctionFieldArithmeticPartII:RS.2/native-scheme-limit`, `FunctionFieldArithmeticPartII:RS.2/native-base-change-tensor-equivalence`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

**Construction/proof.**

1. A degree-one coframe is β_1 = φ_1, so P_1 = T and every P_n is finite locally free over T. The coframe tower of RS.2/coframe-tower, with G_n = μ_n,T, satisfies the hypotheses of RS.2/flat-torsor-tower-limit.
2. That theorem gives P∞ = lim P_n, affine over T, with affine-local coordinate rings the directed colimits of the finite coordinate algebras, its G_T-action and all finite projections, including indices outside the factorial subsystem.
3. Restriction to factorial indices gives the same limit by cofinality (RS.2/factorial-roots-native). Base change is part (e) of the tower theorem, compared with the parent tensor-colimit equivalence; the action and projections use the parent ℚ/ℤ band and Spec-limit conventions. No new direct-limit, Hopf or Spec theory is developed here.

**Consumers.**

- `FunctionFieldArithmeticPartII:RS.2/coframe-fpqc-torsor`: The affine limit is the candidate fpqc torsor, not merely a set of compatible frames.
- `FunctionFieldArithmeticPartII:RS.2/coframe-evaluation`: Compatible evaluated coordinates define a morphism from this represented limit.

**API.**

- `RootCoframeLimit.projection` (projection): Every P∞→P_n respects the finite tower maps.
- `RootCoframeLimit.action` (structure): The represented G_T action has its given μn-action at each projection.
- `RootCoframeLimit.pullbackIso` (compatibility): Pullback along T′→T is the limit of the pulled-back finite coframe torsors.
- `RootCoframeLimit.factorialIso` (equivalence): The all-positive and factorial relative affine limits are canonically isomorphic with all projections.
- `RootCoframeLimit.hom_ext` (extensionality): Maps into P∞ are determined by their compatible finite projections.
- `RootCoframeLimit.towerLimitIso` (compatibility): P∞ is the limit of RS.2/flat-torsor-tower-limit for the coframe tower with G_n = μ_n,T; its G_T-torsor structure and finite projections are those of that theorem.

**Checks.**

- `RootCoframeLimitTests.trivial` (computation): For compatible trivial roots with identity power identifications, P∞ is G_T with its translation action.
- `RootCoframeLimitTests.nonrational` (non-example): The coherent torsors z_n^n=2 over Q have a represented affine limit; its existence does not supply a Q-point.
- `RootCoframeLimitTests.basechange` (compatibility): For A→A/I, the coframe limit base changes by tensoring its colimit algebra, including nilpotent I.

**Acceptance.** For compatible trivial roots, P∞ = G_T with its translation action; for the roots of 2 over ℚ, P∞ = Spec colim ℚ[z_n]/(z_n^n − 2). The all-positive and factorial limits are isomorphic compatibly with every finite projection.

**Source.** [TV17](#tv17) — Remark 3.9, p.15; Proposition 3.10, pp.15–16. Remark 3.9 sketches that a torsor under a limit of affine finite-type group schemes is the limit of its pushforwards to the finite stages, and the proof of Proposition 3.10 builds the quotient presentation from compatible trivializations. Building a limit torsor from a compatible tower is RS.2/flat-torsor-tower-limit, applied here to coframes.

### The infinite coframe fpqc torsor

Target `FunctionFieldArithmeticPartII:RS.2/coframe-fpqc-torsor` (theorem).

P∞→T is affine and faithfully flat, hence an fpqc cover, and the action map G_T×_T P∞→P∞×_T P∞, (g,p)↦(g·p,p), is an isomorphism. For every n, extension through G_T→μn,T recovers P_n; equivalently the fpqc quotient P∞/ker(G_T→μn,T) is P_n. These statements are natural in root systems and arbitrary base changes. No finite-presentation or fppf local triviality is asserted for P∞.

**Hypotheses.** Positive divisibility or factorial tower with the finite faithfully flat coframe transitions. Use the coordinate-ring argument of RS.2/flat-torsor-tower-limit, not compactness of field-valued torsor points.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/coframe-inverse-limit`, `FunctionFieldArithmeticPartII:RS.2/flat-torsor-tower-limit`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`, `FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit`.

**Construction/proof.**

1. Part (c) of RS.2/flat-torsor-tower-limit: over an affine open, the coordinate ring of P∞ is a directed colimit of faithfully flat finite algebras, hence faithfully flat; P∞ is affine over T, so P∞ → T is an fpqc covering.
2. Part (d) gives the action-square isomorphism and the comparisons P∞ ×^G μ_n ≅ P_n, equivalently P∞/ker(G_T → μ_n,T) ≅ P_n.
3. Naturality in root systems and base change follows from parts (e) and (f), since root-system arrows induce compatible equivariant maps of the finite coframe torsors.

**Acceptance.** Do not infer faithful flatness from nonempty geometric fibres alone. Use the precise TOWER-AFF flatness and faithfulness contract. All finite quotient comparisons are specified; no assertion of a compatible rational frame is made. For the roots of 2 over ℚ, P∞ ×^G μ_2 ≅ Spec ℚ[z]/(z² − 2).

**Source.** [TV17](#tv17) — Definition 3.8, Remark 3.9 and Proposition 3.10, pp.15–16. The infinite presentation uses an actual fpqc torsor. The faithfully flat limit argument is the supplier obligation made explicit in this root-specific target.

### Equivariant evaluation in the infinite root chart

Target `FunctionFieldArithmeticPartII:RS.2/coframe-evaluation` (construction).

For X=Spec A and pair (O_X,f), the normalized coframes of any coherent root system over T define a G_T-equivariant morphism P∞→X∞×_X T, where X∞=Spec C_A(f) and C_A(f)=colim_(n|m) A[z_n]/(z_n^n−f), with z_n↦z_m^(m/n). The pullback of z_n is β_n(t_n), so z_n^n=f and z_n=z_m^(m/n). Use the parent LEFT character-one action z_n↦χ_(1/n)z_n; no invariants are recomputed.

**Hypotheses.** An affine base with the target-line trivialization. A compatible native root system over an arbitrary test scheme T→X.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/coframe-inverse-limit`, `FunctionFieldArithmeticPartII:RS.2/coframe-fpqc-torsor`, `FunctionFieldArithmeticPartII:RS.2/native-scheme-limit`, `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/native-base-change-tensor-equivalence`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

**Construction/proof.**

1. Evaluate the section in each normalized coframe. The transition formula and root-arrow equations give the displayed power relations.
2. Apply the parent native Spec-limit universal property to the resulting compatible finite chart morphisms. This works for every T, not just affine test points.
3. Check equivariance at every finite projection with the LEFT coframe scaling convention, then use limit extensionality. Root-system arrows and pullback preserve those coordinates.

**Consumers.**

- `FunctionFieldArithmeticPartII:RS.2/infinite-quotient-native`: This is the equivariant map attached to a root system in the quotient-stack equivalence.

**API.**

- `RootSystem.chartMap` (data): The morphism P∞→X∞×_X T is characterized by the evaluated finite coordinates.
- `RootSystem.chartMap_coordinate` (characterisation): The nth coordinate pulls back to β_n(t_n), with exponent and transition equations.
- `RootSystem.chartMap_equivariant` (compatibility): LEFT coframe scaling and the parent LEFT chart action have the same weight-one character.
- `RootSystem.chartMap_pullback` (functoriality): The chart morphism commutes with arbitrary pullback under the parent tensor comparison.

**Checks.**

- `RootChartTests.zero` (degenerate): For every zero section, all evaluated z_n are zero; the coframe torsor still retains its G-action.
- `RootChartTests.sign` (compatibility): At degree 3 a coframe scaled by ζ evaluates to ζx, rather than ζ^−1x.
- `RootChartTests.six` (computation): At degrees 2 and 6, x_2=x_6^3 and x_6^6=f, including for nilpotent f.

**Acceptance.** For f = 1 and the trivial system (O,1,id)_n, Spec C_A(1) = Spec A[ℚ/ℤ] = G and the chart map P∞ = G → G is the identity, not the inverse; this fixes the LEFT weight-one convention. At degree 3, scaling a coframe by ζ multiplies x_3 = β_3(t_3) by ζ.

**Source.** [TV17](#tv17) — Proposition 3.10, pp.15–16; Corollary 3.13, p.16. For a Kato chart P → O_X(X) the quotient map comes from compatible trivializations of the rational powers. With P = ℕ and 1 ↦ f the associated log structure is fine and saturated for every f, so the chart Spec C_A(f) is the source's own; the coframe evaluation makes the map explicit on native roots.

### The genuine infinite affine quotient equivalence

Target `FunctionFieldArithmeticPartII:RS.2/infinite-quotient-native` (theorem).

For any commutative ring A and f∈A, the fpqc stack of coherent native roots of (O,f) is equivalent over Spec A to [Spec C_A(f)/D_A(Q/Z)]. A quotient object over T is a represented fpqc G_T-torsor with an equivariant chart map. The equivalence retains arrows, finite projections, all transition comparisons, and arbitrary base change. For a general line bundle with section, these equivalences glue over target-line trivializations. With these LEFT coframe conventions a root-line scalar automorphism ζ acts on coframes by ζ^−1, so the quotient comparison inverts the usual scalar band on the zero-section gerbe. The infinite quotient is not claimed algebraic of finite presentation.

**Hypotheses.** Positive exponents of arbitrary characteristic; no regularity, reducedness or log-chart hypothesis on f. Use LEFT torsors and LEFT chart scaling throughout.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/root-limit-descent-native`, `FunctionFieldArithmeticPartII:RS.2/root-limit-base-change-native`, `FunctionFieldArithmeticPartII:RS.2/normalized-coframes`, `FunctionFieldArithmeticPartII:RS.2/coframe-fpqc-torsor`, `FunctionFieldArithmeticPartII:RS.2/coframe-evaluation`, `SchemeAndStackFoundations:SF.1`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

**Construction/proof.**

1. Send a root system to its normalized coframe-limit torsor and evaluation map. Root arrows induce the corresponding equivariant torsor maps.
2. Conversely extend a G-torsor to each μn. On P_n, the equivariant coordinate x_n gives a root line by descent of P_n×A1 under the diagonal LEFT action (p,a)↦(ζp,ζa), a section represented by (p,x_n(p)), and the nth-power identification represented by a^n. The relation β^−1(a) explains this convention.
3. The finite projection comparisons give the root α and their cocycles. Reconstruct coframes and root lines to obtain the two natural inverse isomorphisms; verify them on the fpqc trivializing torsor and descend.
4. Use the supplied base-change and tensor comparisons to check every finite evaluation and to glue over changes of target-line trivialization. The quotient stack is the generic Stack.quotient of the merged SchemeAndStackFoundations §1.21 on the fpqc site, for the action groupoid of G on Spec C_A(f). Talpo–Vistoli's Corollary 3.13 with the Kato chart ℕ → A, 1 ↦ f already gives this equivalence for every f; the proof here makes both inverse functors explicit on native objects.

**Acceptance.** Prove a pseudonatural equivalence of actual groupoids, including the two inverse transformations and their finite projection diagrams. An affine point-action groupoid or equality of invariant algebras alone does not establish this result. For f a unit both sides are equivalent to Spec A, since Spec C_A(f) is then a G-torsor over Spec A; for A = k a field and f = 0, the closed substack of [Spec C_k(0)/G] where every z_n vanishes is BG_k, the zero-section gerbe of RS.2/dvr-residual-gerbe-native.

**Source.** [TV17](#tv17) — Definition 3.8, Proposition 3.10 and Corollary 3.13, pp.15–16. Definition 3.8 defines the infinite root stack of a monoid as an fpqc quotient by μ∞(P), Proposition 3.10 identifies it with the infinite root stack, and Corollary 3.13 gives the presentation for any fine saturated log scheme with a Kato chart. The chart ℕ → A, 1 ↦ f defines a fine saturated log structure for every f ∈ A, and Lemma 3.12 (with Borne–Vistoli's Proposition 4.18, cited there) identifies its infinite root stack with compatible roots of (O,f). So the equivalence for an arbitrary pair is the source's; the native coframe proof is supplied here. [AGV08](#agv08) — Appendix B.2, pp.53–54. The finite quotient of a line bundle with section supplies the finite associated-line comparison.

## The intrinsic DVR fibre

### Intrinsic DVR roots and uniformizer comparison

Target `FunctionFieldArithmeticPartII:RS.2/dvr-uniformizer-native` (comparison).

For a DVR R with closed Cartier divisor D and uniformizer π, trivializing O(D) by π^−1 identifies the native infinite root stack of (O(D),1) with [Spec colim R[z_n]/(z_n^n−π)/G_R]. If π′=uπ, the equivalence between the two chart presentations is induced by the same intrinsic Cartier pair and its root-groupoid pullback comparisons. It preserves all finite evaluations and their α. It does not require a chosen compatible family of nth roots of u in R.

**Hypotheses.** A DVR R with residue field k, u∈R×; arbitrary residue characteristic. The chart expression depends on the trivialization; the underlying pair and stack do not.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/infinite-quotient-native`, `FunctionFieldArithmeticPartII:RS.2/root-limit-base-change-native`, `FunctionFieldArithmeticPartII:RS.2/dvr-roots`, `SchemeAndStackFoundations:SF.1`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/dvr-roots`.

**Construction/proof.**

1. Use the parent finite DVR chart and the target-line frame π^−1, in which the section 1 has coefficient π.
2. Apply the infinite quotient equivalence to the coherent root diagram. For the new frame π′^−1=u^−1π^−1, compare the two diagrams through the intrinsic pair, rather than by an unsupported scalar map of root charts.
3. Check the resulting equivalence on finite roots and root arrows, then on all α; base change to k gives the residual-gerbe comparison.

**Acceptance.** For R = ℤ_3 with π = 3 and π′ = −3, the two chart presentations are identified through the intrinsic pair although −1 has no square root in ℤ_3; no scalar map z_n ↦ c_n z_n with c_n^n = −1 is used. At each finite degree n the comparison restricts to the equivalence of the finite DVR charts [Spec R[t]/(t^n − π)/μ_n] ≃ [Spec R[t]/(t^n − π′)/μ_n] (merged SchemeAndStackFoundations §1.21, rootStack.test_dvr_chart).

**Source.** [B24](#b24) — Section 3, p.135, DVR finite and infinite root-stack presentations. The source describes the uniformizer chart. Independence of a chosen uniformizer is expressed here through the intrinsic Cartier pair and coherent finite roots. [AGV08](#agv08) — Appendix B.2, pp.53–54. The root-with-section stack depends on the line bundle with section, not on its chosen coordinates.

### The DVR zero-section gerbe and the full fibre

Target `FunctionFieldArithmeticPartII:RS.2/dvr-residual-gerbe-native` (theorem).

Write N=O(D)|Spec k. The closed fibre of the infinite DVR root stack has chart C_k(0)=colim k[z_n]/(z_n^n); its nilradical is the ideal of the z_n and C_k(0)_red=k. The canonical substack obtained by imposing t_n=0 at every degree is the coherent root gerbe of N, banded by G_k. A chosen frame λ:k≅N supplies compatible trivial roots and a band-preserving equivalence with BG_k. Thus the reduced-chart quotient is this gerbe. The full closed fibre includes nonzero nilpotent root sections; the nilradical has no uniform nilpotence exponent. In arbitrary characteristic, this specifies the zero-section gerbe and reduced-chart quotient without assuming an unprovided general reduction functor for infinite fpqc stacks.

**Hypotheses.** A DVR and its residue field, with finite roots of all positive degrees. A chosen frame of N is needed for BG identification; the band retains all wild group-scheme inertia.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/dvr-uniformizer-native`, `FunctionFieldArithmeticPartII:RS.2/infinite-quotient-native`, `FunctionFieldArithmeticPartII:RS.1/closed-fibre`, `FunctionFieldArithmeticPartII:RS.2/divisibility-affine-inclusion-injective`, `AlgebraicModuliForArithmeticGeometry:R09.4/neutralization-equivalence`, `mathlib:AdjoinRoot.root`, `mathlib:AdjoinRoot.eval₂_root`, `mathlib:AdjoinRoot.mk_ne_zero_of_natDegree_lt`, `SchemeAndStackFoundations:SF.1`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe`.

**Construction/proof.**

1. Base change the parent native chart to k. Its transition sends z_n to z_m^(m/n), and the parent divisibility-affine inclusion theorem gives injectivity. Every zero-constant element occurs at a finite level and is nilpotent; quotienting by all z_n gives k.
2. For any r choose n>r: the pinned monic quotient degree theorem makes z_n^r nonzero at degree n, and it remains nonzero in the colimit. Hence the radical ideal is not nilpotent with a fixed exponent; infinite reduction is not a finite nilpotent thickening.
3. Setting every root section to zero leaves exactly roots of N with their compatible power identifications and arrows. Their automorphism sheaf is lim μn=G_k.
4. A frame λ gives the coherent objects (O,0, e^n↦λ) with identity-compatible power maps. Apply the imported neutralization equivalence. For the char-zero source setting this is the reduced fibre of B24; the all-characteristic statement uses the explicit reduced-chart quotient.

**Acceptance.** Retain the full fibre, its zero-section gerbe and the chosen neutralization as three distinct pieces of data. Do not replace G by its rational points, or claim a uniform nilpotent ideal for the infinite fibre. At each finite degree the closed fibre restricts to [Spec k[t]/(t^n)/μ_n], not to Bμ_n (merged SchemeAndStackFoundations §1.21, rootStack.test_fibre_nonreduced).

**Source.** [B24](#b24) — Section 3, p.135, paragraph on the reduced closed fibre. The DVR residual gerbe is noncanonically the infinite Kummer classifying stack. The arbitrary-characteristic and nonuniform-nilpotence qualifications are authored extensions. [AGV08](#agv08) — Appendix B.2, p.53, zero-fibre comparison. The finite full zero fibre also permits nonzero sections whose nth power vanishes; the zero-section gerbe is a proper distinction.

## Torsor towers and Kummer coordinates

### Kummer coordinates for the root gerbe

Target `FunctionFieldArithmeticPartII:RS.2/kummer-coordinate-diagram` (definition).

For a field k and positive n, use the existing quotient group K_n(k)=k×/im(a↦a^n). For n|m, the coordinate transition K_m→K_n is induced by the identity on k×: [a]_m↦[a]_n, not by raising a to m/n. These quotients and transitions form the multiplicative coordinate diagram used after a chosen root-gerbe neutralization. Via the finite Kummer comparison, a represents the torsor z^n=a; extension through μm→μn sends z to z^(m/n) and leaves a unchanged.

**Hypotheses.** A field of arbitrary characteristic and positive exponents. Use existing group quotients and power homomorphisms; finite geometric Kummer identification belongs to SF.2.

**Depends on.** `mathlib:powMonoidHom`, `mathlib:QuotientGroup.mk'`, `mathlib:QuotientGroup.map`, `SchemeAndStackFoundations:SF.2`, `mathlib:QuotientGroup.eq_one_iff`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes`.

**Construction/proof.**

1. Specialize the native quotient-group carrier to k× and the range of the nth-power homomorphism. All group laws and quotient universality come from the baseline.
2. For m=nq, each mth power is an nth power, so QuotientGroup.map applied to the identity defines the coordinate transition. Quotient surjectivity proves uniqueness and composition.
3. Apply the requested finite Kummer exact sequence and Pic(Spec k)=0 to identify this coordinate group with finite torsor classes, including wild n. Verify that the torsor quotient has equation w^n=a.

**Consumers.**

- `FunctionFieldArithmeticPartII:RS.2/kummer-lift-native`: Compatible quotient classes are the input to lifting an actual coherent torsor family.
- `FunctionFieldArithmeticPartII:RS.2/neutralization-change-native`: Multiplication by the compatible unit classes records the change of origin.

**API.**

- `RootKummer.coordinate` (data): K_n(k) is the existing quotient k×/(k×)^n, with its inherited commutative group structure.
- `RootKummer.ofUnit` (constructor): The quotient homomorphism sends a unit to its class.
- `RootKummer.ofUnit_eq_one` (characterisation): The class of a is one iff a=b^n for some b∈k×.
- `RootKummer.transition` (functoriality): For n|m, the unique homomorphism sends [a]_m to [a]_n; unit and composite laws follow on quotient generators.
- `RootKummer.finiteTorsorClass` (equivalence): Finite fppf μn-torsor classes identify with K_n(k), carrying z^n=a to [a].
- `RootKummer.transition_ofUnit` (simp): transition (n∣m) [a]_m = [a]_n for every unit a; this holds by definition.
- `RootKummer.transition_id` (simp): transition (n∣n) is the identity of K_n(k).
- `RootKummer.transition_comp` (functoriality): For n | m | l, transition (n∣m) ∘ transition (m∣l) = transition (n∣l).
- `RootKummer.compatibleFamilies` (data): The subgroup of ∏_(n≥1) K_n(k) of families (c_n) with transition (n∣m)(c_m) = c_n whenever n | m; this is lim K_n(k), the target of the Kummer classification.

**Checks.**

- `RootKummerTests.one` (degenerate): K_1(k) is trivial for every field.
- `RootKummerTests.two` (computation): The class of 2 in K_2(Q) is nontrivial, whereas 4 is trivial.
- `RootKummerTests.transition` (non-example): The transition K_4(Q)→K_2(Q) sends the class of 2 to the class of 2; squaring would incorrectly kill it.
- `RootKummerTests.wild` (compatibility): For k=F_p(t), the class of t in K_p(k) is nontrivial although μp(k) has only the identity; the torsor is finite flat.
- `RootKummerTests.realFamilies` (computation): compatibleFamilies ℝ has exactly two elements, the trivial family and ([−1]_n)_n, which is trivial at odd n; over an algebraically closed field the only compatible family is the trivial one.

**Acceptance.** RootKummer.transition is defined as the map of quotient groups induced by the identity of k×; transition_ofUnit holds by definition. K_4(ℚ) → K_2(ℚ) sends [2] to [2]; the map induced by squaring would send it to [4] = 1.

**Source.** [B24](#b24) — Section 3, p.135, displayed inverse-limit Kummer identification. The coordinate quotients are the finite stages of the source formula. The transition convention is verified by the actual power map on torsors. [AGV08](#agv08) — Appendix B.1, p.52, flat Kummer sequence. Positive-degree finite Kummer uses flat cohomology rather than invertibility of the exponent.

### Actual infinite Kummer torsors and finite towers

Target `FunctionFieldArithmeticPartII:RS.2/kummer-tower-native` (comparison).

For any field k, extension of fpqc G_k-torsors through G_k→μn gives an equivalence with the groupoid of coherent finite μn-torsor towers. Its inverse is the represented affine limit of the torsors; it is fpqc locally trivial and recovers every finite extension. Evaluation and arrows commute with those extensions. The band-preserving comparison with the zero-section root gerbe of a trivial line uses Isom from its chosen origin; it differs by inversion from the LEFT coframe presentation.

**Hypotheses.** A field k, arbitrary characteristic, all positive divisibility indices. Finite torsors are computed fppf; infinite torsors use fpqc.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/factorial-roots-native`, `FunctionFieldArithmeticPartII:RS.2/flat-torsor-tower-limit`, `AlgebraicModuliForArithmeticGeometry:R09.4/compatible-limit-family`, `AlgebraicModuliForArithmeticGeometry:R09.4/classifying-abelian-gerbe`, `AlgebraicModuliForArithmeticGeometry:R09.4/neutralization-equivalence`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit`.

**Construction/proof.**

1. Form the actual coherent finite torsor groupoid; the trivial torsors and their specified quotient maps give an object, not merely a claimed nonempty limit.
2. Apply RS.2/flat-torsor-tower-limit with G_n = μ_n,k: turning the quotient comparisons into equivariant maps P_m → P_n, the limit of a coherent tower is an fpqc G_k-torsor recovering every finite stage, and every fpqc G_k-torsor is the limit of its pushforwards.
3. On equivariant torsor arrows, the inverse limit and finite extensions are inverse functors with their projection comparisons. Alternatively use the supplied neutralization equivalence after checking its band and nonemptiness.

**Acceptance.** Over ℚ the tower z_n^n = 2 gives a G-torsor with no ℚ-point; over an algebraically closed field every tower is isomorphic to the trivial one; over 𝔽_p(t) the degree-p stage z^p = t is finite flat and not étale. The inverse functor is RS.2/flat-torsor-tower-limit applied to G_n = μ_n,k.

**Source.** [TV17](#tv17) — Remark 3.9, p.15. An inverse-limit group torsor is represented by the compatible affine limit of its finite extensions. [B24](#b24) — p.133 fpqc convention; Section 3, p.135. The infinite Kummer classifying stack is interpreted on the fpqc site, before passing to isomorphism classes.

### Isomorphism detection for coherent torsor towers

Target `FunctionFieldArithmeticPartII:RS.2/kummer-iso-native` (theorem).

Two coherent finite μn-torsor towers over k are isomorphic as towers if their torsors have the same class at every degree. Their compatible isomorphism set, when nonempty, is a torsor under G(k)=lim μn(k). For any fpqc G-torsor its automorphism sheaf is G_k, and its k-automorphism group is G(k). Class equality detects existence of a compatible arrow, not uniqueness.

**Hypotheses.** A field k; finite torsors and all specified quotient comparisons. No surjectivity assumption on the maps between finite isomorphism sets.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/kummer-tower-native`, `mathlib:nonempty_sections_of_finite_cofiltered_system`, `mathlib:rootsOfUnity`, `mathlib:card_rootsOfUnity`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection`.

**Construction/proof.**

1. At degree n, the isomorphism set is nonempty by class equality and is a torsor under μn(k), hence finite with at most n elements (card_rootsOfUnity). This uses actual torsor isomorphisms even when neither torsor has a k-point.
2. Conjugate through the two systems’ quotient comparisons to define the transition maps on these finite isomorphism sets; their cocycles make a cofiltered functor.
3. Apply the pinned finite-cofiltered-section theorem, which does not need surjective transition maps, to obtain a compatible arrow. The difference of two compatible arrows is a compatible finite translation. The sheaf version of torsor automorphisms retains the full G.

**Acceptance.** Over ℝ the trivial tower has two automorphisms at degree 2, yet its compatible automorphism group G(ℝ) = lim μ_n(ℝ) is trivial. Two towers over ℚ whose classes agree at every degree are isomorphic, although finite-stage isomorphisms chosen independently need not be compatible.

**Source.** [B24](#b24) — Section 3, p.135, inverse-limit Kummer formula. Injectivity of the class formula is expanded into this finite-isomorphism-set argument; it is an authored justification, not an asserted interchange of H1 with arbitrary limits.

### Lifting compatible classes to a coherent torsor

Target `FunctionFieldArithmeticPartII:RS.2/kummer-lift-native` (construction).

A compatible family c_n∈K_n(k) lifts to an actual coherent μn-torsor tower and hence an fpqc G_k-torsor. Choose representatives at factorial stages, finite torsors with those classes, and isomorphisms between each adjacent pushed-forward torsor and the preceding torsor. Compose these isomorphisms coherently, extend to all positive degrees, and take the affine torsor limit. Different choices yield isomorphic G-torsors; the construction makes no canonical choice of an isomorphism.

**Hypotheses.** A field k and classical choices of finite representatives and adjacent isomorphisms. Coordinate transitions and finite Kummer identification from kummer-coordinate-diagram.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/kummer-coordinate-diagram`, `FunctionFieldArithmeticPartII:RS.2/factorial-roots-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-tower-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-iso-native`, `SchemeAndStackFoundations:SF.2`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift`.

**Construction/proof.**

1. At r!, choose a unit representative and the finite Kummer torsor for c_(r!). Compatibility supplies an isomorphism of its μ_(r−1)! extension with the previous representative.
2. Choose these adjacent isomorphisms. Composites, with extension-of-torsor associativity, give the factorial cocycle; no further independently chosen long transitions are allowed.
3. Extend objects and arrows by factorial reindexing and use the torsor-tower equivalence. Isomorphism detection proves independence of choices at the level of classes, while preserving all automorphisms.

**Consumers.**

- `FunctionFieldArithmeticPartII:RS.2/kummer-classes-native`: This supplies surjectivity of the chosen-neutralization class comparison.

**API.**

- `RootKummer.lift` (constructor): A compatible coordinate family has a G-torsor with the prescribed finite classes.
- `RootKummer.lift_evaluation` (characterisation): The μn-extension of the lifted torsor has class c_n for every positive n.
- `RootKummer.lift_choiceIso` (compatibility): Any two choices in the lift give isomorphic compatible towers and G-torsors.
- `RootKummer.lift_unit` (compatibility): The constant trivial coordinate family lifts to the trivial G-torsor up to isomorphism.

**Checks.**

- `RootKummerLiftTests.two` (computation): The compatible classes [2]_n lift to the tower z_n^n=2 and its fpqc limit, although it has no Q-point.
- `RootKummerLiftTests.closed` (degenerate): Over an algebraically closed field every finite coordinate class is trivial; the lift is isomorphic to the trivial G-torsor and retains its automorphisms.
- `RootKummerLiftTests.wild` (compatibility): Over F_p(t), the compatible family [t]_n lifts and has the nontrivial finite μp-torsor at degree p; no étale replacement is made.

**Acceptance.** Over ℚ the family ([2]_n) lifts to the tower z_n^n = 2; over ℝ the family ([−1]_n) lifts to the tower z_n^n = −1, trivial at odd n and the nontrivial μ_2-torsor at n = 2. Different choices of representatives and adjacent isomorphisms change the lifted G-torsor only by an isomorphism.

**Source.** [B24](#b24) — Section 3, p.135, inverse-limit Kummer formula. Surjectivity is justified here by actual representatives and adjacent quotient isomorphisms; the source formula alone is not used as a proof. [TV17](#tv17) — Remark 3.6, p.14; Remark 3.9, p.15. Cofinal indexing and represented torsor limits supply the two geometric steps.

### Kummer classification after a neutralization

Target `FunctionFieldArithmeticPartII:RS.2/kummer-classes-native` (theorem).

After choosing a frame λ:k≅N, the isomorphism classes of the DVR zero-section root gerbe identify with H1_fpqc(k,G_k) and then with lim_(n|m) K_n(k). The latter comparison is a group isomorphism for G-torsor classes; on gerbe classes the group law is transported from the chosen origin. The maps are given by Isom(x_λ,y), finite torsor extension and finite Kummer coordinates. All automorphism sheaves are G_k and all k-automorphism groups are G(k).

**Hypotheses.** A field k of arbitrary characteristic and a specified neutralization x_λ from a frame of N. Do not take inverse limits of classes before establishing the torsor-groupoid and lifting/detection results.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/dvr-residual-gerbe-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-coordinate-diagram`, `FunctionFieldArithmeticPartII:RS.2/kummer-tower-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-iso-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-lift-native`, `AlgebraicModuliForArithmeticGeometry:R09.4/neutralization-equivalence`, `SchemeAndStackFoundations:SF.2`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes`.

**Construction/proof.**

1. Apply the band-preserving neutralization equivalence y↦Isom(x_λ,y). It gives the actual torsor groupoid, before taking classes.
2. Map a torsor class to its finite Kummer classes. Isomorphism detection gives injectivity and class-family lifting gives surjectivity.
3. Finite torsor tensor product agrees with multiplication of Kummer coordinates, proving the group assertion. Retain the automorphism sheaf and identify its rational translations separately.

**Acceptance.** Over ℝ the zero-section gerbe has exactly two isomorphism classes of real points, with coordinates 1 and ([−1]_n)_n; over an algebraically closed field it has one; over ℚ the class ([2]_n)_n is nontrivial. Contracted product of torsor towers corresponds to multiplication of Kummer coordinates: the towers z^n = a and z^n = b combine to z^n = ab.

**Source.** [B24](#b24) — Section 3, p.135, reduced-fibre and displayed Kummer identification. This expands the source identification into its groupoid, neutralization, injectivity and surjectivity obligations. Wild characteristic is handled through the imported flat Kummer contract.

### Change of root-gerbe origin

Target `FunctionFieldArithmeticPartII:RS.2/neutralization-change-native` (theorem).

Let λ′=vλ be two frames k≅N and set x_λ=(O,0,e^n↦λ) at each degree. Isom(x_λ,x_λ′) has finite Kummer coordinate [v^−1]_n. With b_λ(y) the coordinate of Isom(x_λ,y), one has b_λ′(y)=b_λ(y)·([v]_n)_n. Automorphism-band identifications are unchanged. For π′=uπ, the induced normal-line frames satisfy λ′=u_bar^−1λ, so the coordinate shift is the compatible class of u_bar^−1.

**Hypotheses.** The class/action conventions of kummer-coordinate-diagram and kummer-classes-native. A frame is k→N; changing a coframe N→k would reverse the scalar convention. Classification uses Isom(x_λ,y), whose finite torsor is inverse to the normalized coframe torsor of y.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/dvr-uniformizer-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-classes-native`, `FunctionFieldArithmeticPartII:RS.0/root-object`, `AlgebraicModuliForArithmeticGeometry:R09.4/neutralization-equivalence`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes`.

**Construction/proof.**

1. For an arrow x_λ→x_λ′ given by scalar a, the power condition is v a^n=1. Thus its torsor has equation a^n=v^−1.
2. Composition Isom(x_λ′,x_λ)×Isom(x_λ,y)→Isom(x_λ′,y) adds the origin difference, giving multiplication by [v]_n with this orientation. Check the scalar equation also in an arbitrary basis of y.
3. All comparisons are compatible with divisibility transitions. Since the band is abelian, conjugation changes no automorphism identification. Finally π′^−1=u^−1π^−1 yields the stated residue-unit shift.

**Acceptance.** For λ′=vλ, test y=x_λ: its old coordinate is one and its new coordinate is [v]. Check λ→vλ→wvλ gives the product [wv], and a nth-power scalar gives the trivial nth coordinate.

**Source.** [B24](#b24) — Section 3, p.135, noncanonical reduced-fibre identification. The source flags the dependence on a choice. This signed formula is an authored calculation with the frame and Isom conventions fixed explicitly. [AGV08](#agv08) — Appendix B.1–B.2, pp.52–53. The root power-identification equation determines the scalar and its inverse.

### A Kummer limit torsor without fppf trivialization

Target `FunctionFieldArithmeticPartII:RS.2/roots-two-fpqc-native` (application).

Over Q, the coherent finite torsors P_n=Spec Q[z_n]/(z_n^n−2), with z_n=z_m^(m/n), have an affine fpqc limit P under G_Q. No nonempty fppf Q-scheme U admits a section of P×U→U. Thus P is an actual fpqc torsor that is not fppf locally trivial, even though every P_n is fppf locally trivial.

**Hypotheses.** All positive degrees; finite exponents are invertible over Q. The existing degree bound for roots of 2 in a finite extension is imported.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/kummer-tower-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-lift-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-degree-bound`, `FunctionFieldArithmeticPartII:RS.2/flat-torsor-tower-limit`, `mathlib:finite_of_finite_type_of_isJacobsonRing`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf`.

**Construction/proof.**

1. Each P_n is the finite μn Kummer torsor for the unit 2 and its quotient maps form an actual coherent tower. RS.2/flat-torsor-tower-limit gives the affine fpqc G-torsor P.
2. If a nonempty fppf U trivializes P, choose a nonempty affine open Spec B of U with B a finitely generated ℚ-algebra and a maximal ideal m of B. By Zariski's lemma (finite_of_finite_type_of_isJacobsonRing) K = B/m is finite over ℚ, and the section restricts to compatible nth roots of 2 in K.
3. The imported Eisenstein/minimal-polynomial bound n≤[K:Q] contradicts a degree n>[K:Q]. Local finite presentation of U is essential to this closed-point argument.

**Acceptance.** The obstruction applies to every nonempty fppf test scheme, not only finite field extensions. The example explains why replacing infinite fpqc H1 by fppf H1 changes the target.

**Source.** [TV17](#tv17) — Remark 3.9 and Proposition 3.10, pp.15–16. The fpqc torsor convention and affine tower construction motivate this authored separating example; no claim that the paper states this roots-of-two counterexample is made.

## Worked boundary cases

**Zero root and its coframes.** For M=O, t=0 and φ=identity, the normalized
coframe torsor is μn and its evaluation map is zero. The root chart is
Spec k[z]/z^n. Conflating the torsor and chart would lose precisely the
distinction needed to reconstruct the root line at a vanishing section.

**A nonzero nilpotent root.** At exponent 2 over a field, the class of z in
k[z]/z² is nonzero and has square zero. The accepted transition injections
preserve it in the infinite chart. For every r, choose n>r; z_n^r remains
nonzero. Thus each zero-constant chart element is nilpotent, while the ideal
of all root coordinates has no fixed nilpotence exponent. The zero-section
gerbe is the quotient of the reduced chart, not the full fibre.

**Wild inertia.** In characteristic p, μp(k) contains only one element, but
on k[ε]/ε² the unit 1+ε is a nonidentity pth root of unity. It gives a
nonidentity automorphism of the zero-section p-root over that test scheme.
Every band and torsor statement therefore retains the full group scheme.

**Factorial compatibility.** A root at degree 6! induces a root at degree
5 by the 144th tensor power. Its comparison with a 5!-based extension is
provided by the factorial transition and the tensor-power compositor. The
comparison is an isomorphism of section-bearing roots; equality of their
classes would supply neither this arrow nor its compatibility at larger stages.

**Identity on Kummer representatives.** The quotient of z⁴=2 through
μ4→μ2 has coordinate w=z² and equation w²=2. Hence K_4(Q)→K_2(Q) sends
[2] to [2]. Squaring the representative would give [4]=1 and is the wrong
coordinate transition.

**The sign of the origin change.** In a chosen basis e of a zero-section
root y, write φ(e^n)=aλ. The coframe coefficient satisfies b^n=a. An arrow
x_λ→y instead has scalar c with a c^n=1, so the Isom coordinate is [a^−1].
For λ′=vλ the coefficient becomes a/v and the new Isom coordinate is
[v/a]=[v][a^−1]. In particular y=x_λ has old coordinate one and new
coordinate [v]. This checks both the band inversion of coframes and the
change-of-origin theorem. For π′=uπ, the normal-line frame scales by u^−1,
giving the residue-unit shift [u_bar^−1].

**Compatible classes with no rational frame.** The classes [2]_n over Q
lift to the actual tower z_n^n=2. Its fpqc limit exists, but a rational
point would include a rational square root of 2. An fppf-local point would
restrict to a finite residue field extension containing roots of 2 of
every degree, contradicting the imported degree bound. Finite local
triviality at each stage is insufficient for infinite fppf triviality.

**Real points.** Over ℝ, μ_n(ℝ) = {±1} for even n, but a compatible family
(ζ_n) satisfies ζ_n = ζ_2n² = 1, so G(ℝ) = lim μ_n(ℝ) is trivial: the trivial
root system over ℝ has no nontrivial automorphism, although each finite
component of even degree has two. The Kummer coordinates K_n(ℝ) are {±1} for
even n and trivial for odd n, and the compatible families are the trivial one
and ([−1]_n)_n. So the zero-section gerbe over ℝ has exactly two isomorphism
classes of real points; the nontrivial one comes from the tower z_n^n = −1,
which is trivial at odd degrees.

## Supplier contracts, baseline and closure

Finite root stacks are now owned by SchemeAndStackFoundations §1.21, merged
into TauCetiRoadmap on 14 October 2026. The reserved
`FunctionFieldArithmeticPartII:key/root-stacks` keeps the infinite case, and
the restructure proposal in the packet asks RS.0–RS.1 to import §1.21 rather
than plan finite roots again. The geometric refinement depends on RS.0 native
roots/powers/sections, RS.1 finite charts, base change and fpqc descent, and
the accepted RS.2 affine calculations. Generic theory keeps the following
owners. The seven requests are consumer contracts in the packet; each names
the upstream sections that supply it, and none creates another owner.

- **RS2-TOWER-AFF**, `SchemeAndStackFoundations:SF.1`: Supplied by the merged TauCetiRoadmap roadmap SchemeAndStackFoundations (main at 42d0023, merged on 14 October 2026; its README is authoritative), Layer 1: §1.1 qcoh_fpqc_descent (quasi-coherent modules descend along fpqc coverings, and with them quasi-coherent algebras and affine morphisms; effective descent of affine schemes along one faithfully flat morphism is cited there from ModularCurves 0E), §1.15 torsors (IsTorsor, with the fpqc torsor theory for flat affine G as a standing hypothesis; Torsor.hom_isIso, Torsor.baseChange) and §1.16 contracted products and pushforwardTorsor. RS.2 uses these in part (g) of RS.2/flat-torsor-tower-limit and for the descent of root systems. The limit theorem for towers of finite flat torsors is not in that README and is planned here as RS.2/flat-torsor-tower-limit; the closed point with finite residue field is Mathlib's finite_of_finite_type_of_isJacobsonRing.

- **RS2-SSF-LAYER0**, `SchemeAndStackFoundations:SF.0`: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023), Layer 0: §0.9 affine_transition_limits (a cofiltered diagram of schemes with affine transition maps has a limit, computed affine-locally; Stacks 01YW, 01YX) and §0.1 relative Spec of a quasi-coherent O_T-algebra with its universal property (Tau Ceti RelativeSpec and upstream AlgebraicVectorBundles L1A–L1B; not at the pins). Used for the limit of RS.2/flat-torsor-tower-limit and for the global coframe torsor Spec_T(⊕_(0≤i<n) M^(⊗i)) of RS.2/normalized-coframes.

- **RS2-JAC-A**, `SchemeAndStackFoundations:SF.3`: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023), §3.4: picardGroupoid X := Core(InvertibleSheaf X) with its symmetric monoidal structure (tensor powers with coherent associativity and unit constraints), pullback as a functor of Picard groupoids and isStack. Together with upstream AlgebraicVectorBundles L0A (module pullback as a strong symmetric monoidal functor with coherent identity and composition comparisons; tensorSection in its Suggested.lean) and L0B (FiniteLocallyFreeSheaf, closure under arbitrary pullback, rank one identified with InvertibleSheaf). The pinned Tau Ceti InvertibleSheaf.tensorProduct, tensorProductAssoc and unit isomorphisms are what these structures organize; the pins have no monoidal-category instance and no pullback on InvertibleSheaf. The root-section equations under tensor powers and pullback are routine consequences.

- **RS2-ORDINARY-STACKS**, `SchemeAndStackFoundations:SF.1`: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023): §1.18 (the generic site-level Stack.twoFibreProduct, objectwise categorical pullback with its 2-universal property, and Stack.stackification) and §1.21 (the generic Stack.quotient J (X,R) on any site: objects over T are locally trivial R-torsors, R ≃ X ×_[X/R] X, and the isomorphism classes form the sheafified quotient; actionQuotient.torsorEquiv: objects are G_T-torsors with equivariant maps). RS.2 uses them on the fpqc site of schemes with the action groupoid of G = D(ℚ/ℤ) on Spec C_A(f). That README states that DiamondsAndVStacks D0.26 is the (Perf, v) instance of these constructions, so the scheme-level owner is SchemeAndStackFoundations, not DiamondsAndVStacks:D0. The constructions are stated for small sites; their use on the big fpqc site of schemes needs the universe adapters recorded in RS2-NATIVE-CARRIERS.

- **RS2-LIMIT-TYPING**, `AlgebraicModuliForArithmeticGeometry:R09.4`: Expose compatible-limit-family and limit-stack-descent on the native fpqc stack carrier, with evaluation, strong-transformation pullback and componentwise arrow extensionality in explicit object/morphism universes. Retain neutralization-equivalence and classifying-abelian-gerbe. No extra generic two-limit or gerbe construction is owned by RS.2. These targets are in the AlgebraicModuliForArithmeticGeometry package README (TauCetiRoadmap pull request #853): §4.3 neutralizationEquivalence and classifyingAbelianGerbe, and the compatible-limit sample API (GerbeSampleAPI.compatibleLimit).

- **RS2-KUMMER-FINITE**, `SchemeAndStackFoundations:SF.2`: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023), Layers 1–2: §2.11 fppf_kummer_sequence (exact on the big fppf site for every n ≥ 1) with kummer_test_field (H¹_fppf(Spec K, μ_n) = K×/K×ⁿ for every field and every n, including n = p in characteristic p) and the description of H¹_fppf(μ_n) by pairs (L, α: L^(⊗n) ≅ O) (Stacks 040Q); §2.3 NonabelianH1 J G on any site, with map along homomorphisms (map_id, map_comp) and connecting maps compatible with map, which gives the compatibility of the Kummer identifications with μ_m → μ_n; §1.15 torsorClasses with pushforward. Classes of fpqc G-torsors are NonabelianH1 on fpqcTopology for G = lim μ_n; the comparison of fpqc and fppf torsors for the finite μ_n is part (g) of RS.2/flat-torsor-tower-limit. The étale Kummer sequence alone is not enough.

- **RS2-FINITE-ROOT-STACKS**, `SchemeAndStackFoundations:SF.1`: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023), §1.21: rootStack n (L,s) := X ×_[A¹/G_m] [A¹/G_m] along the nth-power map, with rootStack.baseChange, .one, .isIso_away, .affineChart (Spec A[t]/(t^n − s) modulo μ_n), .transition and the checks test_dvr_chart and test_fibre_nonreduced (Cadman 2005, §§2.1–2.2), and lineBundleSectionStack ([A¹/G_m] classifies pairs (L,s)). RS.2's finite transitions, DVR charts and finite zero fibres are these; RS.2 adds the coherent pseudodiagram, the infinite limit and the Kummer comparisons. The equivalence of the native root triples of RS.0–RS.1 with this fibre-product definition is the comparison named in this packet's restructure proposal.

Current upstream **AlgebraicVectorBundles L0A–L0B** plans tensor sections and
coherent arbitrary pullback of finite locally free sheaves, and the merged
SchemeAndStackFoundations §3.4 organizes the core of `InvertibleSheaf` as a
Picard groupoid; only the rank-one/root-specific integration belongs in this
dependency chain. TauCetiRoadmap main was read at commit
`42d002349d03a9062d7c166afada75d25f5d521d` for SchemeAndStackFoundations
§§0.1, 0.9, 1.1, 1.15, 1.16, 1.18, 1.21, 2.3, 2.11 and 3.4 and for
AlgebraicVectorBundles; the planning pass had read
`0d144d044dacebca17b654695b6f1ad58f159b27`, before SchemeAndStackFoundations
was merged. ProfiniteArithmetic does not supply the fpqc group-scheme or
torsor-stack comparison. Neither an upstream roadmap nor an atlas packet states
the limit theorem for towers of finite flat torsors, which is therefore planned
here. Apart from that theorem, no generic vector-bundle, quotient,
cofiltered-limit or flat-cohomology theory is assigned to RS.2.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Exact-pin declaration statements
were read for these ingredients:

- `mathlib:AlgebraicGeometry.Scheme` in `Mathlib/AlgebraicGeometry/Scheme.lean`: Native locally ringed-space schemes; all geometric test objects use this carrier.

- `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` in `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`: Native full subcategory of rank-one locally free module sheaves. Root arrows require its core; arbitrary module maps are not root arrows.

- `mathlib:powMonoidHom` in `Mathlib/Algebra/Group/Hom/Basic.lean`: The nth-power monoid homomorphism on a commutative monoid; applied to the commutative group k×.

- `mathlib:QuotientGroup.mk'` in `Mathlib/GroupTheory/QuotientGroup/Defs.lean`: The quotient group homomorphism for a normal subgroup, with quotient surjectivity and extensionality APIs in the same file.

- `mathlib:QuotientGroup.map` in `Mathlib/GroupTheory/QuotientGroup/Defs.lean`: A homomorphism G/N→H/M given f:G→H and N≤comap f M; supplies identity-induced coordinate transitions.

- `mathlib:QuotientGroup.eq_one_iff` in `Mathlib/GroupTheory/QuotientGroup/Defs.lean`: A quotient class is one iff its representative belongs to the normal subgroup.

- `mathlib:nonempty_sections_of_finite_cofiltered_system` in `Mathlib/CategoryTheory/CofilteredSystem.lean`: A functor from an IsCofilteredOrEmpty category to types has a section when every object type is finite and nonempty; transition surjectivity is not required. Object and morphism universes may differ.

- `mathlib:rootsOfUnity` in `Mathlib/RingTheory/RootsOfUnity/Basic.lean`: The subgroup of units with nth power one, including nilpotent test rings; finite field-valued roots are not the group-scheme carrier.

- `mathlib:AdjoinRoot.root` in `Mathlib/RingTheory/AdjoinRoot.lean`: The image of X in the native quotient R[X]/(f), used only for statable finite-coordinate checks.

- `mathlib:AdjoinRoot.eval₂_root` in `Mathlib/RingTheory/AdjoinRoot.lean`: The defining polynomial evaluates to zero at its native adjoined root.

- `mathlib:AdjoinRoot.mk_ne_zero_of_natDegree_lt` in `Mathlib/RingTheory/AdjoinRoot.lean`: For monic f and nonzero g of smaller natDegree, the image of g in AdjoinRoot f is nonzero.

- `mathlib:Nat.dvd_factorial` in `Mathlib/Data/Nat/Factorial/Basic.lean`: For 0 < m ≤ n, m divides n!; every positive index divides a factorial.

- `mathlib:Nat.factorial_dvd_factorial` in `Mathlib/Data/Nat/Factorial/Basic.lean`: For m ≤ n, m! divides n!; the factorial indices form a divisibility chain.

- `mathlib:card_rootsOfUnity` in `Mathlib/RingTheory/RootsOfUnity/Basic.lean`: For a domain R and k ≠ 0, Nat.card (rootsOfUnity k R) ≤ k; the finite isomorphism sets of kummer-iso-native have at most n elements.

- `mathlib:finite_of_finite_type_of_isJacobsonRing` in `Mathlib/RingTheory/Jacobson/Ring.lean`: Zariski's lemma: a field that is a finite-type algebra over a Jacobson ring R is a finite R-module; a closed point of a nonempty affine scheme of finite type over Q has a residue field finite over Q.

- `mathlib:AlgebraicGeometry.Scheme.fpqcTopology` in `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean`: The fpqc Grothendieck topology on Scheme, generated by the fpqc precoverage (flat, jointly surjective, quasi-compact covers).

- `mathlib:Module.FaithfullyFlat` in `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`: Faithfully flat modules: flat, and m·M ≠ M for every maximal ideal m.

- `mathlib:AlgebraicGeometry.Flat.flat_and_surjective_iff_faithfullyFlat_of_isAffine` in `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean`: For a morphism of affine schemes, flat and surjective is equivalent to faithful flatness of the ring map on global sections.

The reviewed library coverage has no layer for this new Part II. Its
SF.1/SF.2 entries supply sites and existing stack machinery, but do not
certify the infinite torsor, quotient or flat-Kummer contracts above. The
baseline quotient group is already built and is only specialized here.
The pinned finite-cofiltered-section theorem also already exists; it is
an ingredient, not a new target to implement.

The complete planning pass leaves this precise gap:

- **RS2-NATIVE-CARRIERS — Geometric signatures need supplied carriers.** The root-groupoid, fpqc quotient, compatible-limit stack, torsor-class and group-scheme torsor carriers are not present at the pinned commits. They are specified by the merged SchemeAndStackFoundations README (§§0.1, 0.9, 1.15, 1.18, 1.21, 2.3, 2.11, 3.4), by upstream AlgebraicVectorBundles L0A–L1B and by the AlgebraicModuliForArithmeticGeometry package, but are not implemented at the pins. The pinned InvertibleSheaf is a full subcategory whose morphisms are not all isomorphisms; its tensor product, associator and unitors exist without a monoidal-category instance or a pullback. The generic stackification and quotient constructions of SchemeAndStackFoundations §§1.18 and 1.21 are stated for small sites, and their use on the big fpqc site of schemes needs universe adapters. All heavy signatures, their APIs and tests are definitive reader targets, listed in the suggested-file omission ledger. They are not encoded as arbitrary proposition fields, opaque data or point-groupoid stand-ins.

The accepted parent already marks six RS.2 planets. This continuation
retains that roster and adds no display nodes, so the combined layer remains
within its six-planet limit:

- **Infinite root stacks**: `FunctionFieldArithmeticPartII:RS.2/infinite-root-stack`.

- **Infinite DVR root gerbe**: `FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe`.

- **Finite-free root transitions**: `FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat`.

- **Infinite Kummer torsors**: `FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit`.

- **Infinite affine root charts**: `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

- **Infinite unity-root coordinates**: `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-equivalence`.

Acceptance for RS.2 requires resolving the carrier gap, then proving
the named geometric comparisons on native objects, arrows and cocycles,
including all finite projections and arbitrary base changes. Finite Kummer
must cover wild degrees; the change-of-origin calculation must keep its
fixed Isom orientation; the full-fibre and fpqc/fppf tests must survive.
There is no assertion of algebraicity of finite presentation for the infinite
quotient. In wild characteristic the target is explicitly the zero-section
gerbe/reduced-chart quotient; an abstract reduction functor for arbitrary
infinite stacks is not assumed.

## Source register and source scope

The locators below describe the versions actually read. Every statement and
proof sketch above is in this roadmap's own words. TV17's Corollary 3.13 is
stated for fine saturated log schemes with a Kato chart. The chart ℕ → A,
1 ↦ f gives such a structure for every f ∈ A, and TV17's Lemma 3.12 identifies
its infinite root stack with compatible roots of (O,f), so the quotient
presentation for an arbitrary pair is the source's; the coframe construction
here makes it explicit on native objects. TV17's Remark 3.9 sketches only that
a torsor is the limit of its pushforwards; building a limit torsor from a
tower is `RS.2/flat-torsor-tower-limit`.
B24's arithmetic use is in characteristic zero; the all-characteristic
gerbe/Kummer targets use explicit flat torsor arguments. The sign of an
origin change and the roots-of-two counterexample are authored deductions.

### TV17

[Infinite root stacks and quasi-coherent sheaves on logarithmic schemes](https://arxiv.org/pdf/1410.1164v2), Mattia Talpo and Angelo Vistoli. arXiv:1410.1164v2, 12 December 2017; locators use preprint pages. Read 2026-10-14.

Section 3 and Section 3.1, pp.12–16: definitions, Propositions 3.2, 3.4, 3.5, 3.10, Remark 3.6, Definition 3.8, Remark 3.9, Lemmas 3.7 and 3.12, Corollary 3.13, including their proofs. SHA-256 `92a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2`.

### AGV08

[Gromov–Witten theory of Deligne–Mumford stacks](https://arxiv.org/pdf/math/0603151v2), Dan Abramovich, Tom Graber and Angelo Vistoli. arXiv:math/0603151v2; Appendix B, printed pp.52–54. Read 2026-10-14.

Appendix B.1–B.2, pp.52–54: line roots, roots with section, full zero fibre, and quotient/two-fibre-product presentations. SHA-256 `c2889c567c21aa5473ba0be75221dbb67ca122210fa4e4973f4727c490bdd5eb`.

### B24

[On the birational section conjecture with strong birationality assumptions](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf), Giulio Bresciani. Inventiones Mathematicae 235 (2024), 129–150, version of record. Read 2026-10-14.

p.133: fpqc classifying-stack convention; Section 3, pp.135–136: finite/infinite DVR roots, reduced fibre and Kummer coordinates. SHA-256 `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148`.

The same passages are in the public preprint [arXiv:2108.13397v3](https://arxiv.org/abs/2108.13397v3) (15 September 2023): the fpqc classifying-stack convention in §2, p.4, and the DVR root stacks, the reduced fibre of the infinite root stack and the identification of its isomorphism classes with lim k×/(k×)ⁿ in §3, p.6.

The accepted parent finding **FunctionFieldArithmeticPartII/E12** was
reconfirmed in AGV08 Appendix B.2, p.53: its section-power equation uses an
unbound exponent symbol rather than the exponent of the stated power
identification. Use d in both places. This is an inherited preprint
misprint affecting no intended result. The parent's historical correction
search is retained in the packet; this job makes no claim about a published
correction or a complete published-version collation. No additional source
error was established in the portions read. No unavailable source was needed.

### Stacks

[The Stacks Project](https://stacks.math.columbia.edu), read 2026-10-14: Lemmas 32.2.1–32.2.2 (tags 01YW, 01YX), 10.39.20 (090N), 35.37.1 (0245), 35.23.13, 35.23.17 and 35.23.25 (02KY, 02L2, 02LA) and 59.28.5 (040Q).
