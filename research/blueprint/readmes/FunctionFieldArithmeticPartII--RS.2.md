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

The planning pass is complete and RS.2 is **planned**. All 20 targets remain
unchecked. The three gaps and five supplier contracts at the end are required
for mathematical closure. The [suggested file](../suggested/FunctionFieldArithmeticPartII--RS.2.lean)
contains light definitions over existing carriers, statable milestones and a
few examples. The full geometric specifications, APIs and checks live here;
unavailable carriers are recorded in its omission ledger.

## Conventions and native interfaces

Fix a scheme X, an invertible sheaf L and a section s. A positive n-root on
T→X is a native triple (M,t,φ), where M is an invertible sheaf, t is a section,
and φ:M^n≅L_T sends t^n to s_T. An arrow h:M≅M′ preserves both t and φ.
Tau Ceti's `InvertibleSheaf` is a full category of rank-one module sheaves;
its **core** supplies the isomorphisms used here. Tensor powers and sections
must use the native vector-bundle/module APIs, not abstract vector spaces.

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

**Depends on.** `FunctionFieldArithmeticPartII:RS.0/root-object`, `FunctionFieldArithmeticPartII:RS.0/tensor-power`, `FunctionFieldArithmeticPartII:RS.0/section-power`, `FunctionFieldArithmeticPartII:RS.1/base-change`, `SchemeAndStackFoundations:SF.3`, `mathlib:AlgebraicGeometry.Scheme`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/transition`.

**Construction/proof.**

1. Take the tensor-power functor and its section comparison supplied by RS.0 and SF.3. Transport the root equation through the associativity comparison.
2. Construct each compositor from the specified power associativity isomorphism. Its root-section equation and arrow naturality follow from the corresponding RS.0 laws.
3. Use the unit and associativity coherence of those same comparisons to obtain the pseudodiagram laws. Finite pullback comparisons induce a strong transformation of diagrams, including its modification laws.

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

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

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

**Checks.**

- `RootSystemTests.nonvanishing` (computation): For an invertible section s, the compatible root system is equivalent to the unique unramified object and has trivial automorphism sheaf.
- `RootSystemTests.zeroBand` (characterisation): Over a field with L trivial and s=0, the compatible trivial roots have automorphism sheaf lim μn, including nonreduced μp in characteristic p.
- `RootSystemTests.incoherent` (non-example): A family of root triples and pairwise isomorphisms violating the 1|2|4 cocycle is rejected, even if every component isomorphism class exists.

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [TV17](#tv17) — Proposition 3.5 and Remark 3.6, p.14. The infinite root stack is a genuine two-limit. The displayed cocycle presentation specializes that limit to roots of one pair.

### Factorial reindexing of native roots

Target `FunctionFieldArithmeticPartII:RS.2/factorial-roots-native` (theorem).

Restriction of coherent native root systems to the sequence 1!,2!,3!,… is an equivalence of groupoids, pseudonatural in T→X and compatible with all positive-degree evaluations up to specified natural isomorphism. The inverse extends both objects and arrows and supplies all transition cocycles. The same argument applies to coherent finite torsor systems.

**Hypotheses.** The native root pseudodiagram; the factorial sequence starts at 1. Use cofinality of positive divisibility, not a bijection of index sets.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/coherent-roots-native`, `FunctionFieldArithmeticPartII:RS.2/divisibility-factorial-equivalence`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/factorial-root-limit`.

**Construction/proof.**

1. For an n-component choose a factorial r! divisible by n and apply F(n,r!) to the r!-component. For comparing n|m, compare their chosen stages in a common larger factorial.
2. Compose the supplied factorial transition isomorphisms and pseudodiagram compositors. Their cocycles show independence of the common comparison stage and give the all-positive cocycle.
3. Extend component arrows in the same way. Build the restriction–extension unit and counit from the original transitions; verify their naturality, triangle identities and pullback modifications. No uniqueness claim discards stabilizer arrows.

**Acceptance.** The inverse is a groupoid equivalence with evaluation comparisons; an inverse limit of sets does not meet this target.

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

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [TV17](#tv17) — Definition 3.8 and Proposition 3.10, pp.15–16. The quotient uses actual fpqc torsors. Native effectivity is supplied by the imported finite and compatible-limit descent contracts.

### Arbitrary base change of native infinite roots

Target `FunctionFieldArithmeticPartII:RS.2/root-limit-base-change-native` (comparison).

For g:Y→X, roots of (g*L,g*s) form a stack equivalent to the two-fibre product of the native infinite root stack of (L,s) with Y over X. The equivalence is compatible with every finite evaluation, all α, factorial restriction, and composites of base changes.

**Hypotheses.** Arbitrary scheme morphisms, including nonflat maps. Use actual two-fibre products and finite root base-change equivalences.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/transition-native`, `FunctionFieldArithmeticPartII:RS.2/coherent-roots-native`, `FunctionFieldArithmeticPartII:RS.1/base-change`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-base-change`.

**Construction/proof.**

1. Apply the finite base-change equivalence to each root triple and to each component arrow.
2. The transition/pullback comparison transports every α and its cocycle. Construct the inverse by the inverse finite comparisons.
3. Check unit/counit and composition as modifications after each evaluation, using componentwise arrow extensionality. This makes no claim that arbitrary coefficient change is faithful.

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [TV17](#tv17) — Proposition 3.4, p.13. Finite and infinite roots commute with base change; the target records the native groupoid comparisons and their coherence.

## From line coframes to an fpqc quotient

### Normalized coframes of a finite root

Target `FunctionFieldArithmeticPartII:RS.2/normalized-coframes` (construction).

For a root (M,t,φ:M^n≅O_T) of (O_T,f), let P_n be the sheaf of coframes β:M≅O_T with β^n=φ. This sheaf is represented by a finite locally free μn-torsor of rank n. Use LEFT action ζ·β=ζβ. The coordinate x_n(β)=β(t) satisfies x_n^n=f and x_n(ζ·β)=ζ x_n(β). Root isomorphisms act by β↦β h^−1. This is the normalized coframe torsor; the chart t^n=f itself is a torsor only when f is a unit.

**Hypotheses.** A positive n, arbitrary scheme T, actual invertible sheaf and root section. The target line has been trivialized; gluing for a general L uses root-limit-descent-native.

**Depends on.** `FunctionFieldArithmeticPartII:RS.0/root-object`, `FunctionFieldArithmeticPartII:RS.0/section-power`, `FunctionFieldArithmeticPartII:RS.1/affine-chart`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

**Construction/proof.**

1. Choose a Zariski local basis of M. If φ of its nth power is the unit a, normalized coframes are given by an invertible coefficient b with b^n=a.
2. The algebra O_T[b]/(b^n−a) is finite free of rank n, faithfully flat and a μn-torsor, including when n is not invertible. Changes of basis give the specified equivariant gluing maps. Use effective affine descent.
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

**Checks.**

- `RootCoframeTests.zero` (non-example): For M=O, φ=identity, t=0, P_n=μn and evaluation is zero; Spec k[z]/z^n is not this torsor for n>1.
- `RootCoframeTests.unit` (computation): For M=O, t=c, φ(e^n)=a, P_n is b^n=a and evaluation is bc, hence (bc)^n=ac^n=f.
- `RootCoframeTests.wild` (compatibility): For n=p in characteristic p, the μp coframe torsor uses its full finite flat group scheme, even though μp(k) is trivial.
- `RootCoframeTests.nonflat` (compatibility): Reduction modulo a nilpotent ideal pulls back the coframe torsor and evaluation, without asserting injectivity on root arrows.

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [AGV08](#agv08) — Appendix B.1–B.2, pp.52–54. Finite line-root and root-with-section presentations yield this normalized coframe specialization; no nonvanishing section is assumed. [TV17](#tv17) — Definition 3.8 and Proposition 3.10, pp.15–16. The quotient requires a torsor and an equivariant chart map as distinct pieces of data.

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

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [TV17](#tv17) — Proposition 3.10 and Lemma 3.12, pp.15–16. Compatible trivializations of rational-power data give the transition torsors. The finite coframe formula is the native one-pair specialization.

### The represented inverse limit of coframes

Target `FunctionFieldArithmeticPartII:RS.2/coframe-inverse-limit` (construction).

The coherent finite coframe tower has an affine inverse limit P∞ over T, with projections to every P_n and a represented action of G_T=lim μn,T=D_T(Q/Z). Formation of P∞ commutes with arbitrary base change, and restriction to factorial indices gives the same limit. On an affine U⊂T, its coordinate algebra is the filtered colimit of the coordinate algebras of P_n|U. The action and projections agree with the parent Q/Z band and Spec-limit conventions.

**Hypotheses.** The finite coframe tower; T need not be affine or Noetherian. Effective descent of relative affine schemes and the TOWER-AFF supplier contract.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/coframe-tower`, `FunctionFieldArithmeticPartII:RS.2/factorial-roots-native`, `SchemeAndStackFoundations:SF.1`, `FunctionFieldArithmeticPartII:RS.2/native-scheme-limit`, `FunctionFieldArithmeticPartII:RS.2/native-base-change-tensor-equivalence`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

**Construction/proof.**

1. Over affine U, take Spec of the filtered colimit of finite torsor algebras. Its universal property gives all finite projections, including indices outside the factorial subsystem.
2. Use effective affine descent to glue these limits on T, and the same universal property to glue the action and root-system arrow maps.
3. Use the supplier base-change/tensor-colimit theorem to compare pullbacks. Invoke the parent band identification; no new direct-limit, Hopf or Spec theory is developed here.

**Consumers.**

- `FunctionFieldArithmeticPartII:RS.2/coframe-fpqc-torsor`: The affine limit is the candidate fpqc torsor, not merely a set of compatible frames.
- `FunctionFieldArithmeticPartII:RS.2/coframe-evaluation`: Compatible evaluated coordinates define a morphism from this represented limit.

**API.**

- `RootCoframeLimit.projection` (projection): Every P∞→P_n respects the finite tower maps.
- `RootCoframeLimit.action` (structure): The represented G_T action has its given μn-action at each projection.
- `RootCoframeLimit.pullbackIso` (compatibility): Pullback along T′→T is the limit of the pulled-back finite coframe torsors.
- `RootCoframeLimit.factorialIso` (equivalence): The all-positive and factorial relative affine limits are canonically isomorphic with all projections.
- `RootCoframeLimit.hom_ext` (extensionality): Maps into P∞ are determined by their compatible finite projections.

**Checks.**

- `RootCoframeLimitTests.trivial` (computation): For compatible trivial roots with identity power identifications, P∞ is G_T with its translation action.
- `RootCoframeLimitTests.nonrational` (non-example): The coherent torsors z_n^n=2 over Q have a represented affine limit; its existence does not supply a Q-point.
- `RootCoframeLimitTests.basechange` (compatibility): For A→A/I, the coframe limit base changes by tensoring its colimit algebra, including nilpotent I.

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [TV17](#tv17) — Remark 3.9, p.15; Proposition 3.10, pp.15–16. An affine inverse-limit group torsor is built from compatible finite torsors. This target supplies the root-coframe application of the generic affine supplier.

### The infinite coframe fpqc torsor

Target `FunctionFieldArithmeticPartII:RS.2/coframe-fpqc-torsor` (theorem).

P∞→T is affine and faithfully flat, hence an fpqc cover, and the action map G_T×_T P∞→P∞×_T P∞, (g,p)↦(g·p,p), is an isomorphism. For every n, extension through G_T→μn,T recovers P_n; equivalently the fpqc quotient P∞/ker(G_T→μn,T) is P_n. These statements are natural in root systems and arbitrary base changes. No finite-presentation or fppf local triviality is asserted for P∞.

**Hypotheses.** Positive divisibility or factorial tower with the finite faithfully flat coframe transitions. Use affine fpqc limits from SF.1, not compactness of field-valued torsor points.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/coframe-inverse-limit`, `SchemeAndStackFoundations:SF.1`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`, `FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit`.

**Construction/proof.**

1. On an affine open, a filtered colimit of flat torsor algebras is flat; faithful flatness is supplied by the faithfully flat finite-stage transitions and the TOWER-AFF limit theorem. Affineness gives quasi-compactness.
2. Take inverse limits of the finite torsor action-square isomorphisms. The finite projections identify both sides, using commutation of affine limits with the relevant finite products.
3. Apply the same faithful-flat limit argument over P_n to the tail of degrees divisible by n. Its group is the kernel of G→μn, giving the finite quotient/extension comparison. Glue and check projection compatibility.

**Acceptance.** Do not infer faithful flatness from nonempty geometric fibres alone. Use the precise TOWER-AFF flatness and faithfulness contract. All finite quotient comparisons are specified; no assertion of a compatible rational frame is made.

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

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [TV17](#tv17) — Proposition 3.10, pp.15–16; Corollary 3.13, p.16. For a rank-one logarithmic chart the quotient map comes from coherent trivializations. Extension to an arbitrary pair (O,f) is derived here from native coframes and descent, without imposing the fine-saturated log hypothesis automatically.

### The genuine infinite affine quotient equivalence

Target `FunctionFieldArithmeticPartII:RS.2/infinite-quotient-native` (theorem).

For any commutative ring A and f∈A, the fpqc stack of coherent native roots of (O,f) is equivalent over Spec A to [Spec C_A(f)/D_A(Q/Z)]. A quotient object over T is a represented fpqc G_T-torsor with an equivariant chart map. The equivalence retains arrows, finite projections, all transition comparisons, and arbitrary base change. For a general line bundle with section, these equivalences glue over target-line trivializations. With these LEFT coframe conventions a root-line scalar automorphism ζ acts on coframes by ζ^−1, so the quotient comparison inverts the usual scalar band on the zero-section gerbe. The infinite quotient is not claimed algebraic of finite presentation.

**Hypotheses.** Positive exponents of arbitrary characteristic; no regularity, reducedness or log-chart hypothesis on f. Use LEFT torsors and LEFT chart scaling throughout.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/root-limit-descent-native`, `FunctionFieldArithmeticPartII:RS.2/root-limit-base-change-native`, `FunctionFieldArithmeticPartII:RS.2/normalized-coframes`, `FunctionFieldArithmeticPartII:RS.2/coframe-fpqc-torsor`, `FunctionFieldArithmeticPartII:RS.2/coframe-evaluation`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

**Construction/proof.**

1. Send a root system to its normalized coframe-limit torsor and evaluation map. Root arrows induce the corresponding equivariant torsor maps.
2. Conversely extend a G-torsor to each μn. On P_n, the equivariant coordinate x_n gives a root line by descent of P_n×A1 under the diagonal LEFT action (p,a)↦(ζp,ζa), a section represented by (p,x_n(p)), and the nth-power identification represented by a^n. The relation β^−1(a) explains this convention.
3. The finite projection comparisons give the root α and their cocycles. Reconstruct coframes and root lines to obtain the two natural inverse isomorphisms; verify them on the fpqc trivializing torsor and descend.
4. Use the supplied base-change and tensor comparisons to check every finite evaluation and to glue over changes of target-line trivialization. The extension beyond a fine-saturated logarithmic chart is this proof, not an unqualified citation of TV17.

**Acceptance.** Prove a pseudonatural equivalence of actual groupoids, including the two inverse transformations and their finite projection diagrams. An affine point-action groupoid or equality of invariant algebras alone does not establish this result.

**Source.** [TV17](#tv17) — Definition 3.8, Proposition 3.10 and Corollary 3.13, pp.15–16. The source proves the fpqc quotient presentation in the fine-saturated logarithmic setting. The arbitrary single-pair version is an authored extension using the finite AGV presentation, coframe torsor limit and effective descent. [AGV08](#agv08) — Appendix B.2, pp.53–54. The finite quotient of a line bundle with section supplies the finite associated-line comparison.

## The intrinsic DVR fibre

### Intrinsic DVR roots and uniformizer comparison

Target `FunctionFieldArithmeticPartII:RS.2/dvr-uniformizer-native` (comparison).

For a DVR R with closed Cartier divisor D and uniformizer π, trivializing O(D) by π^−1 identifies the native infinite root stack of (O(D),1) with [Spec colim R[z_n]/(z_n^n−π)/G_R]. If π′=uπ, the equivalence between the two chart presentations is induced by the same intrinsic Cartier pair and its root-groupoid pullback comparisons. It preserves all finite evaluations and their α. It does not require a chosen compatible family of nth roots of u in R.

**Hypotheses.** A DVR R with residue field k, u∈R×; arbitrary residue characteristic. The chart expression depends on the trivialization; the underlying pair and stack do not.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/infinite-quotient-native`, `FunctionFieldArithmeticPartII:RS.2/root-limit-base-change-native`, `FunctionFieldArithmeticPartII:RS.2/dvr-roots`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/dvr-roots`.

**Construction/proof.**

1. Use the parent finite DVR chart and the target-line frame π^−1, in which the section 1 has coefficient π.
2. Apply the infinite quotient equivalence to the coherent root diagram. For the new frame π′^−1=u^−1π^−1, compare the two diagrams through the intrinsic pair, rather than by an unsupported scalar map of root charts.
3. Check the resulting equivalence on finite roots and root arrows, then on all α; base change to k gives the residual-gerbe comparison.

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [B24](#b24) — Section 3, p.135, DVR finite and infinite root-stack presentations. The source describes the uniformizer chart. Independence of a chosen uniformizer is expressed here through the intrinsic Cartier pair and coherent finite roots. [AGV08](#agv08) — Appendix B.2, pp.53–54. The root-with-section stack depends on the line bundle with section, not on its chosen coordinates.

### The DVR zero-section gerbe and the full fibre

Target `FunctionFieldArithmeticPartII:RS.2/dvr-residual-gerbe-native` (theorem).

Write N=O(D)|Spec k. The closed fibre of the infinite DVR root stack has chart C_k(0)=colim k[z_n]/(z_n^n); its nilradical is the ideal of the z_n and C_k(0)_red=k. The canonical substack obtained by imposing t_n=0 at every degree is the coherent root gerbe of N, banded by G_k. A chosen frame λ:k≅N supplies compatible trivial roots and a band-preserving equivalence with BG_k. Thus the reduced-chart quotient is this gerbe. The full closed fibre includes nonzero nilpotent root sections; the nilradical has no uniform nilpotence exponent. In arbitrary characteristic, this specifies the zero-section gerbe and reduced-chart quotient without assuming an unprovided general reduction functor for infinite fpqc stacks.

**Hypotheses.** A DVR and its residue field, with finite roots of all positive degrees. A chosen frame of N is needed for BG identification; the band retains all wild group-scheme inertia.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/dvr-uniformizer-native`, `FunctionFieldArithmeticPartII:RS.2/infinite-quotient-native`, `FunctionFieldArithmeticPartII:RS.1/closed-fibre`, `FunctionFieldArithmeticPartII:RS.2/divisibility-affine-inclusion-injective`, `AlgebraicModuliForArithmeticGeometry:R09.4/neutralization-equivalence`, `mathlib:AdjoinRoot.root`, `mathlib:AdjoinRoot.eval₂_root`, `mathlib:AdjoinRoot.mk_ne_zero_of_natDegree_lt`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe`.

**Construction/proof.**

1. Base change the parent native chart to k. Its transition sends z_n to z_m^(m/n), and the parent divisibility-affine inclusion theorem gives injectivity. Every zero-constant element occurs at a finite level and is nilpotent; quotienting by all z_n gives k.
2. For any r choose n>r: the pinned monic quotient degree theorem makes z_n^r nonzero at degree n, and it remains nonzero in the colimit. Hence the radical ideal is not nilpotent with a fixed exponent; infinite reduction is not a finite nilpotent thickening.
3. Setting every root section to zero leaves exactly roots of N with their compatible power identifications and arrows. Their automorphism sheaf is lim μn=G_k.
4. A frame λ gives the coherent objects (O,0, e^n↦λ) with identity-compatible power maps. Apply the imported neutralization equivalence. For the char-zero source setting this is the reduced fibre of B24; the all-characteristic statement uses the explicit reduced-chart quotient.

**Acceptance.** Retain the full fibre, its zero-section gerbe and the chosen neutralization as three distinct pieces of data. Do not replace G by its rational points, or claim a uniform nilpotent ideal for the infinite fibre.

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

**Checks.**

- `RootKummerTests.one` (degenerate): K_1(k) is trivial for every field.
- `RootKummerTests.two` (computation): The class of 2 in K_2(Q) is nontrivial, whereas 4 is trivial.
- `RootKummerTests.transition` (non-example): The transition K_4(Q)→K_2(Q) sends the class of 2 to the class of 2; squaring would incorrectly kill it.
- `RootKummerTests.wild` (compatibility): For k=F_p(t), the class of t in K_p(k) is nontrivial although μp(k) has only the identity; the torsor is finite flat.

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [B24](#b24) — Section 3, p.135, displayed inverse-limit Kummer identification. The coordinate quotients are the finite stages of the source formula. The transition convention is verified by the actual power map on torsors. [AGV08](#agv08) — Appendix B.1, p.52, flat Kummer sequence. Positive-degree finite Kummer uses flat cohomology rather than invertibility of the exponent.

### Actual infinite Kummer torsors and finite towers

Target `FunctionFieldArithmeticPartII:RS.2/kummer-tower-native` (comparison).

For any field k, extension of fpqc G_k-torsors through G_k→μn gives an equivalence with the groupoid of coherent finite μn-torsor towers. Its inverse is the represented affine limit of the torsors; it is fpqc locally trivial and recovers every finite extension. Evaluation and arrows commute with those extensions. The band-preserving comparison with the zero-section root gerbe of a trivial line uses Isom from its chosen origin; it differs by inversion from the LEFT coframe presentation.

**Hypotheses.** A field k, arbitrary characteristic, all positive divisibility indices. Finite torsors are computed fppf; infinite torsors use fpqc.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/factorial-roots-native`, `FunctionFieldArithmeticPartII:RS.2/coframe-fpqc-torsor`, `AlgebraicModuliForArithmeticGeometry:R09.4/compatible-limit-family`, `AlgebraicModuliForArithmeticGeometry:R09.4/classifying-abelian-gerbe`, `AlgebraicModuliForArithmeticGeometry:R09.4/neutralization-equivalence`, `SchemeAndStackFoundations:SF.1`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit`.

**Construction/proof.**

1. Form the actual coherent finite torsor groupoid; the trivial torsors and their specified quotient maps give an object, not merely a claimed nonempty limit.
2. Apply the same TOWER-AFF theorem as for coframes to the affine finite torsors and their finite flat quotient transitions. The action square and finite quotient comparisons give the inverse fpqc G-torsor.
3. On equivariant torsor arrows, the inverse limit and finite extensions are inverse functors with their projection comparisons. Alternatively use the supplied neutralization equivalence after checking its band and nonemptiness.

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

**Source.** [TV17](#tv17) — Remark 3.9, p.15. An inverse-limit group torsor is represented by the compatible affine limit of its finite extensions. [B24](#b24) — p.133 fpqc convention; Section 3, p.135. The infinite Kummer classifying stack is interpreted on the fpqc site, before passing to isomorphism classes.

### Isomorphism detection for coherent torsor towers

Target `FunctionFieldArithmeticPartII:RS.2/kummer-iso-native` (theorem).

Two coherent finite μn-torsor towers over k are isomorphic as towers if their torsors have the same class at every degree. Their compatible isomorphism set, when nonempty, is a torsor under G(k)=lim μn(k). For any fpqc G-torsor its automorphism sheaf is G_k, and its k-automorphism group is G(k). Class equality detects existence of a compatible arrow, not uniqueness.

**Hypotheses.** A field k; finite torsors and all specified quotient comparisons. No surjectivity assumption on the maps between finite isomorphism sets.

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/kummer-tower-native`, `mathlib:nonempty_sections_of_finite_cofiltered_system`, `mathlib:rootsOfUnity`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection`.

**Construction/proof.**

1. At degree n, the isomorphism set is nonempty by class equality and is a torsor under μn(k), hence finite, of size at most n. This uses actual torsor isomorphisms even when neither torsor has a k-point.
2. Conjugate through the two systems’ quotient comparisons to define the transition maps on these finite isomorphism sets; their cocycles make a cofiltered functor.
3. Apply the pinned finite-cofiltered-section theorem, which does not need surjective transition maps, to obtain a compatible arrow. The difference of two compatible arrows is a compatible finite translation. The sheaf version of torsor automorphisms retains the full G.

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

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

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

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

**Acceptance.** Retain the stated topology, all positive exponents, component arrows and comparison coherences.

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

**Depends on.** `FunctionFieldArithmeticPartII:RS.2/kummer-tower-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-lift-native`, `FunctionFieldArithmeticPartII:RS.2/kummer-degree-bound`, `SchemeAndStackFoundations:SF.1`.

**Refines.** `FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf`.

**Construction/proof.**

1. Each P_n is the finite μn Kummer torsor for the unit 2 and its quotient maps form an actual coherent tower. TOWER-AFF gives the affine fpqc G-torsor P.
2. If a nonempty fppf U trivializes P, choose a nonempty affine finite-type open of U and a closed point with finite residue extension K/Q. This point restricts the section to compatible nth roots of 2 in K.
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

## Supplier contracts, baseline and closure

The canonical finite-root owner remains
`FunctionFieldArithmeticPartII:key/root-stacks`. The geometric refinement
depends on RS.0 native roots/powers/sections, RS.1 finite charts, base change
and fpqc descent, and the accepted RS.2 affine calculations. Generic theory
keeps the following owners. The five requests are consumer contracts in the
packet; they do not create new implementation tickets or another owner.

- **RS2-TOWER-AFF**, `SchemeAndStackFoundations:SF.1`: Retain the parent TOWER-AFF ownership. Supply effective fpqc descent for relative affine schemes and maps; for a positive-divisibility/factorial tower of finite flat torsors with finite faithfully flat transitions, prove the affine inverse limit is faithfully flat, its action square is the inverse limit of finite torsor squares, its quotient by each projection kernel is the finite torsor, and tensor/base change commutes with its coordinate colimit. The faithful-flatness contract must work over arbitrary base schemes, not just fields. Also supply a finite residue closed point on a nonempty finite-type scheme over Q. These are generic suppliers; this packet plans only their root-coframe and roots-of-two applications.

- **RS2-JAC-A**, `SchemeAndStackFoundations:SF.3`: Integrate the existing InvertibleSheaf core with tensor powers, tensorSection, tensor unit and coherent arbitrary scheme pullback. Import current upstream AlgebraicVectorBundles L0A/L0B, rather than replan their section/pullback infrastructure. Supply the rank-one native adapters and root-section preservation equations needed for the root pseudodiagram.

- **RS2-ORDINARY-STACKS**, `DiamondsAndVStacks:D0`: Expose the planned ordinary fpqc quotient and two-fibre-product API as actual scheme-based groupoid fibres, with torsor-plus-equivariant-map objects, equivariant isomorphism arrows, action conventions, descent, universe lifts and native pullback coherence. Use D0/groupoid-quotients-and-two-fibre-products; this is integration of the existing owner, not new quotient theory here.

- **RS2-LIMIT-TYPING**, `AlgebraicModuliForArithmeticGeometry:R09.4`: Expose compatible-limit-family and limit-stack-descent on the native fpqc stack carrier, with evaluation, strong-transformation pullback and componentwise arrow extensionality in explicit object/morphism universes. Retain neutralization-equivalence and classifying-abelian-gerbe. No extra generic two-limit or gerbe construction is owned by RS.2.

- **RS2-KUMMER-FINITE**, `SchemeAndStackFoundations:SF.2`: Retain the parent KUMMER-FINITE ownership. Supply the fppf Kummer exact sequence for every positive n over every field, Pic(Spec k)=0, the comparison of μn-torsor classes with k×/(k×)^n and its compatibility with μm→μn power maps. Supply fpqc G-torsor classes as H1, with commutative torsor product and the isomorphism between finite fpqc and finite fppf torsor groupoids. Do not use only the étale Kummer sequence.

Current upstream **AlgebraicVectorBundles L0A/L0B** already plans tensor
sections and coherent arbitrary pullback of finite locally free sheaves.
Import those targets through SF.3; only the rank-one/root-specific integration
belongs in this dependency chain. Current upstream main was read at commit
`0d144d044dacebca17b654695b6f1ad58f159b27`. The nine post-snapshot roadmaps
and the current Tau Ceti library were checked for this scope. ProfiniteArithmetic
does not supply the fpqc group-scheme or torsor-stack comparison. No new generic
vector-bundle, quotient, cofiltered-limit or flat-cohomology theory is assigned
to RS.2.

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

The reviewed library coverage has no layer for this new Part II. Its
SF.1/SF.2 entries supply sites and existing stack machinery, but do not
certify the infinite torsor, quotient or flat-Kummer contracts above. The
baseline quotient group is already built and is only specialized here.
The pinned finite-cofiltered-section theorem also already exists; it is
an ingredient, not a new target to implement.

The complete planning pass leaves these precise gaps:

- **RS2-NATIVE-CARRIERS — Geometric signatures need supplied carriers.** The actual root-groupoid, fpqc quotient and compatible-limit stack interfaces are not present at the pinned commits. The native InvertibleSheaf carrier exists but its full category is not a groupoid, and current upstream vector-bundle section/pullback targets remain roadmap imports. All heavy signatures, their APIs and tests are definitive reader targets, listed in the suggested-file omission ledger. They are not encoded as arbitrary proposition fields, opaque data or point-groupoid stand-ins. Resolve RS2-JAC-A, RS2-ORDINARY-STACKS and RS2-LIMIT-TYPING before these targets can be typed in Lean.

- **RS2-AFFINE-LIMIT-PROOF — Effective affine limit and torsor descent remain supplier leaves.** The parent chart/Spec algebra is retained and the root-specific application is fully specified. Generic faithfully flat affine inverse limits, finite projection quotients, and effective descent are requested from SF.1; no exact-pin declaration implementing all of TOWER-AFF was found. Resolving this supplier and verifying its hypotheses is necessary for the infinite quotient and infinite Kummer torsor equivalence.

- **RS2-FLAT-COHOMOLOGY — Flat Kummer and H1 typing remain supplier leaves.** The all-positive flat Kummer theorem and native fpqc torsor-class interpretation of H1 are not at the pin. Their exact consumer contracts are RS2-KUMMER-FINITE. The finite-isomorphism compactness and factorial lifting arguments are specified here, but the class theorem remains unchecked until this supplier and the geometric carriers are available.

The accepted parent already marks six RS.2 planets. This continuation
retains that roster and adds no display nodes, so the combined layer remains
within its six-planet limit:

- **Infinite root stacks**: `FunctionFieldArithmeticPartII:RS.2/infinite-root-stack`.

- **Infinite DVR root gerbe**: `FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe`.

- **Finite-free root transitions**: `FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat`.

- **Infinite Kummer torsors**: `FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit`.

- **Infinite affine root charts**: `FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient`.

- **Infinite unity-root coordinates**: `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-equivalence`.

Acceptance for RS.2 requires resolving those supplier leaves, then proving
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
proof sketch above is in this roadmap's own words. A fine-saturated log
chart theorem is not cited as an arbitrary-section theorem: its extension
uses the AGV single-pair presentation, coframe limits and effective descent.
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

The accepted parent finding **FunctionFieldArithmeticPartII/E12** was
reconfirmed in AGV08 Appendix B.2, p.53: its section-power equation uses an
unbound exponent symbol rather than the exponent of the stated power
identification. Use d in both places. This is an inherited preprint
misprint affecting no intended result. The parent's historical correction
search is retained in the packet; this job makes no claim about a published
correction or a complete published-version collation. No additional source
error was established in the portions read. No unavailable source was needed.
