# Class field theory, Part II: higher local fields and higher reciprocity

This roadmap extends Tau Ceti’s **ClassFieldTheory**. It starts with a compatible tower of complete discrete valuations and ends with higher local reciprocity, arithmetic-scheme class groups and coefficient-qualified cohomological Hasse principles. Its local source is *Invitation to higher local fields*; Morrow, Kerz, Kerz–Saito, Jannsen and Milne supply the precise adelic, global and duality statements. Dittmann–Pop §2 supplies a concrete downstream test of the coefficients, model assumptions and local–global maps.

This is a complete target-level planning pass across HL.0–HL.7. Every target has a statement, hypotheses, source locator and dependency route. Every definition or construction has an API and at least three tests designed to reject a wrong definition. All nodes remain unchecked. Fifteen named gaps identify primary proofs or supplier interfaces that have not been established; no stage is closed and no formalisation is claimed. The packet is the machine-readable inventory; this reader states the complete mathematical contract.

## Conventions and ownership

Write F_n=F, F_{n−1}, …, F_0 for the tower, with F_0 finite unless a different end-field hypothesis is stated. The **first residue** is F_{n−1}; F_1 is the **one-local bottom field**. Parameters (t_1,…,t_n) are inner first and outer last. The rank value group Z^n is ordered by the last differing coordinate. The outer DVR and the rank-n valuation ring are different objects. The native outer Laurent-series topology remains available alongside the named higher topology.

Milnor symbols use additive notation in their groups, while K_1 is identified with the multiplicative field group. The DVR boundary removes a **last** uniformizer: ∂{u_1,…,u_{r−1},π}={ū_1,…,ū_{r−1}}. Consequently δ{t_1,…,t_n}=1, while interchanging two entries negates a symbol. A repeated entry is not declared zero without its appropriate torsion relation. Artin maps use **arithmetic Frobenius**. In a tame arithmetic Hilbert formula the Kummer entry is prepended to the Milnor symbol; this order is checked by evaluation on a residue unit and uniformizer.

For i≥0, characteristic-p coefficients Z/p^s(i) mean the logarithmic Witt sheaf W_sΩ^i_log shifted by −i. Thus H^q is the étale group H^{q−i} of that sheaf. These coefficients retain wild classes that ordinary μ_p would lose. H_Kato^q means the torsion colimit with twist q−1 for q≥1. Ordinary cd_p in characteristic p and the largest nonzero degree of Kato cohomology are different invariants. Milne’s finite-group duality assumes ℓ≠char F_1, at the bottom of the tower; for n>2 testing only the outer first residue would be insufficient.

The multiplicative topology is characteristic-qualified: for positive first-residue characteristic use the saturated graph/product description; for characteristic-zero first residue use the Zhukov/Fesenko recursive pullback, which can be non-Hausdorff. In Q_p((t)), 1+t is indistinguishable from 1 for the latter convention and maps to 1 in K_1^top. It is distinct from 1 in the Hausdorff graph convention.

Three openness interfaces remain distinct: the raw higher additive topology, sequentially saturated λ_* and λ_m, and Kato’s categorical finite-index openness. K_m^top is a Hausdorff quotient by the intersection of zero-neighborhoods. It is not a profinite completion. Every completion below names its finite quotients. Likewise, henselian Parshin factors, completed adelic factors and higher Milnor ideles have separate constructions and comparison maps.

| Existing owner | Imported mathematics | Added here |
| --- | --- | --- |
| LocalFieldsRamification | One-local fields, finite extensions and ordinary ramification | Residue towers, rank coordinates and scoped higher ramification |
| K2SymbolsBrauer T.2–T.4 | All graded Milnor symbols, DVR residues, transfers, projection formula and Weil reciprocity | Iteration, higher topology, branchwise local/global comparisons |
| ProfiniteCohomology | Canonical continuous cohomology, transfers, cups and ordinary cd | Shifted Kato assembly and higher-local trace/duality |
| ClassFieldTheory 5–8 | Ordinary invariant, local Artin maps and arithmetic existence | Higher-degree evaluation and equality-of-map comparisons |
| FunctionFieldArithmetic FA.3–FA.4 | AS–Witt characters and the full one-local characteristic-p p-primary existence/completion | Higher-dimensional Witt residues and Parshin comparison |
| CR.4; L.5; M.5d | de Rham–Witt carriers; the existing logarithmic DVR scope; prime-power/colimit/field reductions | Explicit unowned BGK/imperfect-residue request G04; no reassignment of BGK to M.5d |
| GNF.6, CFT.10–12; FA.2/FA.4 | Number-field ideles/global reciprocity; finite-field curve counterparts | Higher class groups and their distinct dimension-one reductions |
| Scheme foundations; étale duality | Scheme, Nisnevich, resolution and purity/localization interfaces in their actual scopes | All-branch higher factors, adelic recursion and specified Kato row |
| Current ProfiniteArithmetic and LocalGaloisGroups | Profinite completion/procyclic arithmetic and ordinary local Galois structure | Only higher-field applications; those existing directions are not replanned |

Accepted RS-28 fixes this ownership and retains mathematical comparisons in HL.7. Generic BGK remains an explicit request for an expanded L.5 or a separately assigned supplier. The prime-to-degree alteration direction routed by Dittmann–Pop is a supplier lead, not a new alteration theorem planned in this roadmap. All imported stage contracts and direct consumers are listed after the targets.

## Worked acceptance examples

**One oriented two-local field.** For F=F_q((u))((t)), the first residue is F_q((u)), the last F_q, and the parameters are (u,t). The two Milnor residues give {u,t}↦{u}↦1. Hence the parameter symbol acts by Frob_q on every final-constant unramified extension; {t,u} acts by its inverse. A lifted a∈F_q× satisfies δ{a,u,t}=a. For a finite extension the norm gives δ_F N=fδ_L with final residue degree f; the ramification product occurs on restriction instead.

**Wild classes and inseparable residues.** Over F_p((u))((t)), β^p−β=u/t^p has γ=tβ satisfying γ^p−t^{p−1}γ=u. The outer ramification index is one, but the residue extension adjoins u^{1/p} and has degree p. A separability-only residue interface therefore fails. At Witt length one, the additive pairing of w=t^{−1} with {u,1+t} is the residue of t^{−1}(du/u)∧dt/(1+t), equal to one over F_p. Treating the coefficient as ordinary μ_p erases this nonzero test.

**Two topologies and two mixed fields.** Constants u^j tend to zero in the higher topology of F_q((u))((t)) but have outer t-valuation zero. Their convergence detects the coefficient topology. E((t)) has parameters (π_E,t) and first residue E; E{{t}} has parameters (t,π_E) and first residue κ(E)((t)). The horizontal and vertical flags at (p,t) on P^1_Z give Q_p((t)) and Q_p{{t}}, respectively. A surface adele family needs both a uniform divisor pole bound and the per-curve congruence restrictions in HL.5; a single cofinite condition on all flags does not suffice.

**Three distinct Hasse tests.** Dittmann–Pop Fact 2.1 detects a mod-two class over a characteristic-not-two field by all constant places of a global constant subfield, including real places. Fact 2.2 instead uses codimension-one henselian fields of a proper regular flat model over a finite field or henselian valuation ring with two invertible. Fact 2.3 uses logarithmic coefficients in characteristic two and explicit Res(F₂) input for dimension greater than three. These statements have different place families and assumptions; none replaces another.

## Layers and target statements

Each target below gives its stable packet identifier. Sources are linked by document, with theorem/section and printed page locators. A proof route specifies the planned argument and points to named gaps where the source or imported interface does not yet close it. An acceptance check is a mathematical test specification, not an assertion that the theorem has been proved.

## HL.0

Residue towers, classification, parameters, all characteristic patterns, rank valuations, additive/multiplicative/sequential and categorical topologies, finite extensions and concrete two-local examples. Every target has a node; source proofs not fully extracted terminate in the listed gaps.

**Planets:** Higher local fields, Classification of higher local fields, Higher topology, Categorical finite-index openness, Higher topology on Laurent series.

<a id="HL-0-n-dimensional-local-field"></a>
### Residue towers of higher local fields

`HL.0/n-dimensional-local-field` · definition · unchecked

An n-local field is a tower F_n=F,F_{n-1},…,F_0, with each F_i (i>0) a complete discrete valuation field, a specified residue-field isomorphism κ(F_i)≃F_{i-1}, and F_0 finite. Store the valuations, completeness witnesses and residue identifications as coherent data. The one-local comparison identifies this with the ordinary nonarchimedean local-field interface once the chosen valuation and topology agree.

**Hypotheses and conventions.** n≥0. A finite field is zero-local. The first residue field is F_{n-1}, the last F_0. Specifying a tower does not assert the existence of several inequivalent complete discrete valuations on the same field. Coordinates depend on parameters; the successive residue-field description is intrinsic up to its canonical comparisons.

**Proof route.**

1. Import the complete DVR and one-local interface from LFR.0. Define the finite indexed tower and its truncation maps; transport along field isomorphisms compatible with valuations.
2. Prove the one-step residue recursion and the one-local comparison. Separate parameter choices and rank valuation into their own targets.

**Prerequisites.** `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `mathlib:IsNonarchimedeanLocalField`, `mathlib:IsLocalRing.ResidueField`, `mathlib:IsDiscreteValuationRing`.

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §2, Definition 2.12, printed pp. 10–11: Recursive local-field definition with finite last residue field; uniqueness discussion in §2.1.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.1, definition, p. 5: Residue-tower presentation.

**API.**

- `HigherLocalField.tower` (projection): F_i and the residue equivalences are projections.
- `HigherLocalField.residueTower` (constructor): Truncation at F_j gives a j-local field.
- `HigherLocalField.transport` (functoriality): A valuation-compatible field isomorphism transports the tower.
- `HigherLocalField.oneLocal_iff` (characterisation): The one-step tower agrees with the ordinary local-field interface under the chosen topology.

**Uses.** HL.1 iterated residues: Supplies the recursion order. HL.5 local factors: Identifies completed flag factors.

**Tests a wrong definition must fail.**

- `check_1`: F_q is zero-local, whereas an infinite perfect field does not satisfy the finite-end condition.
- `check_2`: F_q((u))((t)) has residues F_q((u)),F_q in that order; Q_p((t)) has Q_p,F_p.
- `check_3`: Q_p{{t}} has first residue F_p((t)); it must not be identified with Q_p((t)) as a valued tower.

**Acceptance.** The field F_q((u))((t)) has dimension two with first residue F_q((u)).


<a id="HL-0-local-parameters"></a>
### Systems of local parameters

`HL.0/local-parameters` · definition · unchecked

A parameter system (t_1,…,t_n) is ordered from the innermost to the outermost valuation: t_n is an outer uniformizer; for j<n, t_j is an outer unit whose residue is the corresponding parameter of F_{n-1}.

**Hypotheses and conventions.** A specified n-local tower; parameters are choices of lifts, not canonical field sections.

**Proof route.**

1. Inductively lift nonzero residue parameters to units and choose an outer uniformizer. Compare two systems by a triangular integral coordinate change.

**Prerequisites.** [HL.0/n-dimensional-local-field](#HL-0-n-dimensional-local-field).

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §2, Definition 2.20, p. 14: Parameter convention and recursive lift.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.1, p. 5: Parameters inner first.

**API.**

- `LocalParameters.outer` (projection): t_n has outer valuation one.
- `LocalParameters.residue` (compatibility): The first n−1 entries reduce to residue parameters.
- `LocalParameters.exists` (constructor): Every finite tower admits parameters.

**Uses.** HL.1 orientation: Fixes δ{t_1,…,t_n}=1. HL.4 explicit symbols: Specifies differential and symbol order.

**Tests a wrong definition must fail.**

- `check_1`: (u,t) is a system on F_q((u))((t)); (t,u) fails the outer-uniformizer test.
- `check_2`: (p,t) and (t,p) describe the two distinct Q_p two-local examples in the stated order.
- `check_3`: Multiplying an outer uniformizer by a unit gives another system, without making their rank-coordinate maps equal.

**Acceptance.** For Q_p((t)) use (p,t), and for Q_p{{t}} use (t,p).


<a id="HL-0-rank-valuation-ring"></a>
### Rank valuation ring and parameter coordinates

`HL.0/rank-valuation-ring` · construction · unchecked

Define the canonical rank-n valuation ring recursively by O_rank(F)={x∈O_outer(F): x̄∈O_rank(κ(F))}, with O_rank(F_0)=F_0. Parameter division gives v_t:F×→Z^n ordered by the last differing coordinate. Its nonnegative cone is O_rank∖{0}; coordinate changes preserve that cone. This ring is distinct from O_outer for n>1.

**Hypotheses and conventions.** Finite n-local tower and a parameter system; O_outer is always the rank-one DVR.

**Proof route.**

1. Use the residue recursion to show either x or x⁻¹ belongs to O_rank. Identify the ordered value quotient by successive unit exact sequences.
2. Construct the nested prime chain and its localizations. In dimension two the ideals with threshold (−j,1) increase strictly; hence O_rank is not Noetherian.

**Prerequisites.** [HL.0/local-parameters](#HL-0-local-parameters), `mathlib:ValuationSubring`, `mathlib:Valuation`.

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §3, Definition 3.3 and Propositions 3.5, 3.7, pp. 18–20: Recursive rank ring, prime chain and ordered value quotient.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.1, lemma, p. 7: Parameter description of rank ideals.

**API.**

- `HigherLocalField.rankRing` (constructor): Recursive valuation subring.
- `HigherLocalField.rankValuation` (data): Parameter coordinates in reverse lexicographic Z^n.
- `HigherLocalField.rankRing_mem` (characterisation): Membership is equivalent to the recursive residue test.
- `HigherLocalField.rankPrimes` (compatibility): The canonical chain of primes recovers the successive outer valuation rings by localization.

**Uses.** HL.0 extensions: Provides ramification coordinates. HL.5 flags: Distinguishes rank rings from completed DVR factors.

**Tests a wrong definition must fail.**

- `check_1`: At n=1, O_rank=O_outer; at n=0 it is the entire finite field.
- `check_2`: For F_q((u))((t)), v(u)=(1,0), v(t)=(0,1), and (−100,1)>0.
- `check_3`: The elements t/u^{j+1} separate the consecutive threshold ideals (−j,1) and (−j−1,1); the rank ring is not a DVR.

**Acceptance.** In F_q((u))((t)), t/u^j lies in O_rank for every j≥0, while u⁻¹ does not.


<a id="HL-0-standard-mixed-series"></a>
### Mixed series fields

`HL.0/standard-mixed-series` · construction · unchecked

For a complete discrete valuation field E define E{{T}} to consist of doubly infinite coefficient families (a_i) with inf_i v_E(a_i)>−∞ and v_E(a_i)→+∞ as i→−∞. Addition is coefficientwise; multiplication uses convergent convolution. The valuation is min_i v_E(a_i), and κ(E{{T}})≃κ(E)((T)).

**Hypotheses and conventions.** E carries its specified complete discrete valuation; convergence in the negative exponent direction is essential.

**Proof route.**

1. Show convolution converges using the boundedness and negative-tail conditions; use leading reduction modulo a uniformizer to prove multiplicativity of the minimum valuation.
2. Lift Laurent residue series coefficientwise and establish completeness coefficientwise modulo each valuation level.

**Prerequisites.** `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `mathlib:Valued`, `mathlib:PowerSeries`, [HL.0/n-dimensional-local-field](#HL-0-n-dimensional-local-field).

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §2, Examples 2.6 and 2.8, pp. 9–10: The mixed-series construction, its coefficient conditions and its iterated standard examples.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.1, pp. 6–7: Standard mixed fields.

**API.**

- `MixedSeries.coeff` (projection): Integer-indexed coefficients with both convergence constraints.
- `MixedSeries.valuation` (data): The minimum coefficient valuation.
- `MixedSeries.residue` (equivalence): Reduction is κ(E)((T)).
- `MixedSeries.complete` (instance): The minimum-valuation topology is complete.

**Uses.** HL.0 classification: Provides the standard mixed models. HL.4 mixed formulas: Gives the coefficient lifts and completed differential residue.

**Tests a wrong definition must fail.**

- `check_1`: Σ_{i≥0}T^i is allowed, but Σ_{i<0}T^i is not.
- `check_2`: Σ_{j≥1}p^jT^{−j} is allowed in Q_p{{T}}; a family with unbounded negative coefficient valuations is excluded.
- `check_3`: The residue of p is zero while T is a unit, with nonzero residue the Laurent variable.

**Acceptance.** Q_p{{T}} has uniformizer p and residue F_p((T)).


<a id="HL-0-classification-and-standard-fields"></a>
### Classification of higher local fields

`HL.0/classification-and-standard-fields` · theorem · unchecked

For an n-local F with last residue F_q: if char F=p, F is isomorphic to F_q((t_1))⋯((t_n)); if char F_1=0, F≃E((t_2))⋯((t_n)) with E/Q_p finite. In a characteristic transition at F_r/F_{r−1}, F is a finite extension of a standard field E{{t_1}}⋯{{t_{r−1}}}((t_{r+1}))⋯((t_n)); after a finite extension it is standard.

**Hypotheses and conventions.** n≥1; isomorphisms respect the residue-tower valuations. The transition index r is the lowest positive index with characteristic zero.

**Proof route.**

1. Apply equal-characteristic complete-DVR structure successively. In the transition case lift residue parameters over the Cohen/Witt coefficient field to obtain a finite standard subextension.
2. The final standardization uses elimination of wild ramification by Epp; its exact primary proof input remains G01.
3. In the intermediate characteristic pattern let r be the depth of the remaining mixed tower and use K=F^(n−r), in Morrow’s successive-residue notation. The standard field K′ embeds in K with finite degree. These are the two index/name corrections recorded in E8.

**Prerequisites.** [HL.0/standard-mixed-series](#HL-0-standard-mixed-series), [HL.0/local-parameters](#HL-0-local-parameters), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `mathlib:WittVector`.

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §2.1, Theorem 2.18, p. 13, and Remark 2.19, p. 14: The classification in each characteristic pattern; use the corrected residue-depth index in source issue E8.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.1, classification, pp. 6–7: Finite standard subfield and finite standardization.

**Acceptance.** The three two-local types are F_q((u))((t)), E((t)), and finite extensions of E{{t}}.

**Direct open inputs.** [G01](#g01). Other gaps propagate through the prerequisites.

<a id="HL-0-higher-topology"></a>
### Higher additive topologies

`HL.0/higher-topology` · construction · unchecked

Construct higher additive topologies recursively. On E((T)), neighborhoods of zero are boxes Σ_i U_iT^i with each U_i an open zero-neighborhood of E and U_i=E for all sufficiently large i. On E{{T}}, use boxes with U_i open zero-neighborhoods satisfying two different conditions: some outer valuation ideal m_E^c is contained in every U_i; for every integer r, m_E^r is contained in U_i for all sufficiently large i. Eventual equality U_i=E is not required in this mixed-series case. Transport to finite extensions through a coefficient-vector basis. Addition and multiplication by a fixed nonzero scalar are continuous; for n>1 multiplication need not be jointly continuous.

**Hypotheses and conventions.** Finite last residue field. Equal characteristic uses the canonical coefficient lifts. When the first residue has characteristic zero, the topology may depend on a coefficient-field section; keep that choice explicit. Mixed fields with first residue of positive characteristic have the canonical topology of Morrow Theorem 4.8. Do not give a global topological-field instance.

**Proof route.**

1. Use the coefficient boxes specified in the fine HL.0 component for equal-series steps; prove invariance in the positive-characteristic case by parameter substitutions.
2. For mixed series use the common contained valuation ideal and the eventual containment of every valuation ideal to control multiplication by a fixed scalar. Compare two finite-extension bases by linear changes of coordinates.
3. Separate raw higher topology from sequential saturation and the categorical finite-index openness in HL.3. Source-level invariance inputs are G01 and G02.

**Prerequisites.** [HL.0/n-dimensional-local-field](#HL-0-n-dimensional-local-field), [HL.0/standard-mixed-series](#HL-0-standard-mixed-series), [HL.0/equal-characteristic-higher-topology](#HL-0-equal-characteristic-higher-topology).

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §4.1–4.2, Theorems 4.4, 4.8, 4.10 and Remark 4.6, pp. 23–27: Coefficient neighborhoods, dependence in characteristic zero, and additive/scalar continuity.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.3.1–1.3.2, pp. 9–12: Recursive additive topology.

**API.**

- `HigherTopology.additive` (constructor): The explicitly specified additive topology.
- `HigherTopology.coefficientBasis` (characterisation): The precise equal/mixed neighborhood conditions.
- `HigherTopology.scalarContinuous` (compatibility): Each nonzero scalar acts by a homeomorphism.
- `HigherTopology.residueOpen` (compatibility): Outer reduction on O_outer is continuous and open.
- `HigherTopology.finiteExtension` (compatibility): Finite extension topology is the coefficient-vector topology.

**Uses.** HL.1 λ_m: Supplies the sequential symbol topology. HL.5 local factors: Controls the topology on completed flag fields.

**Tests a wrong definition must fail.**

- `check_1`: For n=1 with finite discrete coefficients the construction is the ordinary local-field topology.
- `check_2`: The family u^j in F_q((u))((t)) converges to zero, while its outer t-valuation is constantly zero.
- `check_3`: For Q_p{{T}}, U_i=p^{−max(i,0)}Z_p is an admissible mixed-series neighborhood family although no U_i equals Q_p. The constant family U_i=Z_p fails eventual containment of p^{−1}Z_p. Reversing the common-ideal inclusion would also reject the admissible growing family.
- `check_4`: For n>1 the source counterexample to joint multiplication continuity must remain a non-example to any topological-field instance.

**Acceptance.** For F_q((u))((t)), u^j→0 among constant t-series; this fails for the outer t-adic topology.

**Direct open inputs.** [G01](#g01), [G02](#g02). Other gaps propagate through the prerequisites.

<a id="HL-0-extensions-and-ramification-matrix"></a>
### Finite extensions of residue towers

`HL.0/extensions-and-ramification-matrix` · theorem · unchecked

A tower-continuous finite embedding F→L induces finite extensions at every residue level. For compatible parameter systems the restriction of rank-coordinate valuation is triangular integral with diagonal positive ramification indices e_1,…,e_n. If f=[L_0:F_0], then [L:F]=f∏_j e_j. The residue extensions need not be separable.

**Hypotheses and conventions.** F,L are n-local; continuity here means compatibility with every discrete valuation, not only the higher additive topology.

**Proof route.**

1. Apply completeness and the discrete-valuation degree formula at each level, retaining residue degree even when inseparable.
2. Compare parameters successively to obtain triangularity and multiply the one-step formulas. The ramification matrix is coordinate dependent but its diagonal product is intrinsic.

**Prerequisites.** [HL.0/rank-valuation-ring](#HL-0-rank-valuation-ring), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §2.3, Definition 2.23, p. 15, and Proposition 2.28, p. 16: Tower-continuous embeddings and product of residue ramification indices.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.2, p. 8: Triangular ramification matrix.

**Acceptance.** For F=F_p((u))((t)), β^p−β=u/t^p yields e_outer=1 and residue extension F_p((u^{1/p}))/F_p((u)) of degree p. The total degree is p.


<a id="HL-0-teichmueller-representatives-and-expansions"></a>
### Admissible parameter expansions

`HL.0/teichmueller-representatives-and-expansions` · theorem · unchecked

Choose multiplicative Teichmüller representatives of F_q and local parameters. Every element has a unique iterated admissible expansion Σ_{I∈Z^n}a_I t_1^{i_1}⋯t_n^{i_n}; outer exponents have a lower bound, and at each fixed outer tuple the next inner exponent has a lower bound. For mixed series the coefficient convergence is the one in the mixed-series construction. In characteristic zero the representatives form a multiplicative set, not a coefficient subfield.

**Hypotheses and conventions.** Parameter and representative choices are explicit. A support need not lie in one globally lower bounded rectangular orthant.

**Proof route.**

1. Apply successive complete-DVR expansions with fixed representatives. Prove uniqueness by successive reduction and division; translate the recursion into the admissible-support bounds.
2. Use source issue E1 to distinguish multiplicative representatives from additive coefficient fields.

**Prerequisites.** [HL.0/local-parameters](#HL-0-local-parameters), [HL.0/standard-mixed-series](#HL-0-standard-mixed-series), `mathlib:WittVector`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.3.3, pp. 12–15: Admissible supports and expansion theorem; coefficient rings in both characteristics.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §4.3, Theorem 4.10(v), pp. 25–26: Higher series and admissibility.

**Acceptance.** In Q_3 the representatives {0,1,−1} are not closed under addition; they still give digit expansions.


<a id="HL-0-two-dimensional-examples"></a>
### Two-dimensional fields and a ferocious extension

`HL.0/two-dimensional-examples` · application · unchecked

Compute the complete towers, parameters, rank coordinates and higher neighborhoods for F_q((u))((t)), E((t)) and E{{t}}. Exhibit an extension with e=1 and inseparable residue extension: β^p−β=u/t^p over F_p((u))((t)); γ=tβ satisfies γ^p−t^{p−1}γ=u, so its residue adjoins u^{1/p}.

**Hypotheses and conventions.** E/Q_p finite. The third example is mixed at the outer valuation; the second is mixed only at the last one-local field.

**Proof route.**

1. Use the Laurent and mixed-series constructions for the towers. Apply the Eisenstein/reduction degree test to γ and the degree formula to the extension.

**Prerequisites.** [HL.0/extensions-and-ramification-matrix](#HL-0-extensions-and-ramification-matrix), [HL.0/higher-topology](#HL-0-higher-topology).

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), Examples 2.13–2.17, pp. 11–13: Three models and the inseparable residue example.

**Acceptance.** Verify (u,t), (π_E,t), (t,π_E), respectively. An API that assumes all residue extensions separable fails this computation.


<a id="HL-0-topology-on-the-multiplicative-group"></a>
### Sequential multiplicative topology

`HL.0/topology-on-the-multiplicative-group` · construction · unchecked

Use the Zhukov/Fesenko multiplicative topology τ and let λ_* be its sequential saturation. If char F_{n−1}=p, τ comes from the parameter splitting F×≃O_rank××Z^n, with the induced higher topology on the unit factor and discrete parameter factors; its saturated graph description x↦(x,x⁻¹) agrees. If char F_{n−1}=0, pull the rank-unit topology back from the first lower mixed-characteristic field in the residue tower, keeping the parameter factors discrete. This latter topology need not be Hausdorff and is not identified with the graph topology. In both cases λ_* has continuous inversion, sequentially continuous multiplication and closed rank principal units.

**Hypotheses and conventions.** Finite residue tower, with a fixed compatible higher coefficient structure where the additive topology requires one. Distinguish the outer first residue F_{n−1} from the one-local bottom F_1. In the characteristic-zero first-residue case the recursive pullback kills a uniquely divisible principal-unit subgroup; in particular 1+m_F lies in the intersection of the neighborhoods of 1. The graph topology remains a separate Hausdorff convention.

**Proof route.**

1. For positive first-residue characteristic compare parameter-product and graph convergent sequences, then sequentially saturate. Check compatible parameter changes within the specified higher structure.
2. For characteristic-zero first residue, follow the residue projection on rank units down to the first mixed-characteristic field and pull back its multiplicative topology. Combine it with the discrete parameter lattice, then saturate; do not replace the pullback by an induced topology from F.
3. Use Zhukov §1.4.2 and Fesenko §6.2 for inversion and sequential multiplication. Fesenko §6.3 identifies λ_1=λ_* and records the nontrivial principal-unit kernel when char F_{n−1}=0.

**Prerequisites.** [HL.0/higher-topology](#HL-0-higher-topology), [HL.0/local-parameters](#HL-0-local-parameters).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.4.1–1.4.2, pp. 14–16; I §6.2–6.3, pp. 63–64: The multiplicative topology, its recursive characteristic-zero pullback, sequential saturation and the nontrivial K_1 quotient in that case.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §4.4.1, p. 27; §4.4.3, p. 29: Graph and parameter-product descriptions are used here in positive first-residue characteristic. Their Hausdorff construction is kept distinct from the characteristic-zero pullback in Zhukov/Fesenko.

**API.**

- `HigherMultiplicativeTopology.lambda` (constructor): Sequentially saturate the characteristic-qualified Zhukov/Fesenko multiplicative topology τ.
- `HigherMultiplicativeTopology.graphSequences` (characterisation): When char F_{n−1}=p, convergence agrees with the graph embedding into the product of the higher additive spaces. This assertion is not made for the characteristic-zero pullback.
- `HigherMultiplicativeTopology.parameterIndependent` (compatibility): Compatible parameter changes preserve the saturated topology within the specified higher coefficient structure; the characteristic-zero branch uses the recursive pullback.
- `HigherMultiplicativeTopology.inversion` (compatibility): Inversion is continuous.
- `HigherMultiplicativeTopology.principalUnits_indistinguishable` (characterisation): If char F_{n−1}=0, each element of 1+m_F lies in every λ_* neighborhood of 1; its image in K_1^top(F) is the neutral class.

**Uses.** HL.1 symbols: Defines the input topology to λ_m. HL.3 finite characters: Identifies the topology relevant for finite-order characters.

**Tests a wrong definition must fail.**

- `check_1`: At n=1, π^j does not converge in F× as j→∞, even though it tends to zero in F.
- `check_2`: A convergent sequence in F× has eventually constant rank-valuation coordinates.
- `check_3`: For F=Q_p((t)), the constant sequence with value 1+t converges to 1 in the Zhukov/Fesenko pullback topology and hence in λ_*. It does not converge to 1 in the Hausdorff graph topology. Thus 1+t has trivial image in K_1^top(F).

**Acceptance.** At n=1 recover the ordinary topology on F×. For Q_p((t)), retain the non-Hausdorff principal-unit direction; for positive first-residue characteristic retain the graph comparison. These conventions feed different topological K_1 quotients.

**Direct open inputs.** [G02](#g02). Other gaps propagate through the prerequisites.


<a id="HL-0-perfect-and-quasi-finite-variants"></a>
### Perfect and quasi-finite end fields

`HL.0/perfect-and-quasi-finite-variants` · comparison · unchecked

The residue-tower definition and rank/topology constructions have versions with an arbitrary perfect end field. The class-field-theory version with a quasi-finite end field includes its chosen arithmetic Frobenius generator. Neither variant is silently identified with the finite-end n-local predicate; finiteness-dependent trace and compactness conclusions retain their hypotheses.

**Hypotheses and conventions.** A quasi-finite field is perfect with absolute Galois group procyclic; fix the generator required by the normalization.

**Proof route.**

1. Inspect each use of finiteness: residue expansion and perfect coefficient lifts extend, while finite cardinality, finite trace and counting arguments do not transfer verbatim.
2. Carry an end-field mode and prove comparison maps only on the common finite-field specialization.

**Prerequisites.** [HL.0/n-dimensional-local-field](#HL-0-n-dimensional-local-field), [HL.0/higher-topology](#HL-0-higher-topology), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §1.1, remark, p. 5; I §10.2, pp. 97–98; I §17.4, p. 148: Perfect/quasi-finite variants with separate class-field normalizations.

**Acceptance.** An infinite algebraically closed end field is perfect but has trivial absolute Galois group; it does not satisfy the quasi-finite Frobenius datum or the finite-end predicate.


<a id="HL-0-pro-ind-finite-objects"></a>
### Categorical higher fields and finite-index openness

`HL.0/pro-ind-finite-objects` · construction · unchecked

Let F_0 be the category of finite sets and F_{r+1}=Ind(Pro(F_r)). Present a complete DVR by O_F=pro_s O_F/m^s and F=ind_a π^{−a}O_F, recursively over its residue field. Define a finite-index subgroup N≤K_n^M(F) to be categorically open when the symbol map (F×)^n→K_n^M(F)/N, with the finite quotient discrete, is a morphism of these higher objects.

**Hypotheses and conventions.** Use Kato’s formal-étale/Witt lift construction for the truncated rings, rather than choosing arbitrary residue sections. Only the independence of finite-index openness and finite-order characters is asserted.

**Proof route.**

1. Construct the recursive ind/pro presentation and finite products as in Kato §1, Proposition 2.
2. Prove Lemma 2’s independence of the chosen presentation at the level of finite quotients. Compare this criterion with λ_n only through a separately stated comparison gap G02.

**Prerequisites.** [HL.0/n-dimensional-local-field](#HL-0-n-dimensional-local-field), `K2SymbolsBrauer:T.2/milnor-k-theory`, `mathlib:WittVector`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Kato, Existence theorem, §1, pp. 165–171, Proposition 2 and Lemma 2: Categorical presentation and its finite-quotient invariance.

**API.**

- `HigherFiniteObject.field` (constructor): The recursive ind/pro field object.
- `CategoricallyOpen.symbolCriterion` (characterisation): A finite quotient is discrete exactly when its symbol map is a higher-object morphism.
- `CategoricallyOpen.independent` (compatibility): Finite-index openness is independent of auxiliary presentation.
- `CategoricallyOpen.characterCriterion` (characterisation): A finite-order character is continuous exactly when its kernel satisfies the criterion.

**Uses.** HL.3 existence: Gives the precise open-subgroup side of Kato’s theorem. HL.2 wild duality: Supplies the finite-order character notion.

**Tests a wrong definition must fail.**

- `check_1`: At n=0 all finite quotient maps of the finite set are morphisms.
- `check_2`: For a one-local field, norm groups of finite extensions satisfy the ordinary finite-index open criterion.
- `check_3`: Changing Witt lifts must preserve the class of finite-order continuous characters, without asserting equality of raw presentation objects.

**Acceptance.** For n=1 the criterion is ordinary openness of finite-index subgroups of F×.

**Direct open inputs.** [G02](#g02). Other gaps propagate through the prerequisites.

<a id="HL-0-coefficient-box"></a>
### Coefficient boxes

`HL.0/coefficient-box` · construction · unchecked

For U assigning an open additive subgroup U_i of K to every integer i, coefficientBox(U) is the additive subgroup of K((T)) consisting of f with f_i ∈ U_i for every i. No eventual-tail restriction is imposed on this subgroup construction.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Use the existing LaurentSeries carrier and its HahnSeries coefficients. Define the carrier by the stated universal condition.
2. The zero, sum and negative coefficients lie in each U_i because U_i is an additive subgroup. Use the native coefficient identities and AddSubgroup constructor.

**Prerequisites.** `mathlib:LaurentSeries`, `mathlib:OpenAddSubgroup`, `mathlib:HahnSeries.coeff_add`, `mathlib:HahnSeries.coeff_neg`, `mathlib:HahnSeries.coeff_zero`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**API.**

- `HigherLaurent.coefficientBox` (constructor): The additive subgroup with the stated coefficient carrier.
- `HigherLaurent.mem_coefficientBox` (characterisation): Membership is equivalent to all coefficient conditions; this is the separate membership lemma.
- `HigherLaurent.single_mem_coefficientBox` (simp): The monomial cT^j belongs exactly when c ∈ U_j; see the separate lemma.
- `HigherLaurent.coefficientBox_inf` (compatibility): Pointwise intersections of coefficient subgroups give intersections of boxes; see the separate lemma.

**Uses.** HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis: Makes the source neighborhood condition explicit on native coefficients. HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-equals-outer-iff-discrete: Separates the original coefficient topology from the outer T-adic topology without replacing the latter globally.

**Tests a wrong definition must fail.**

- `coefficientBox_top_test`: If U_i=K for every i, the box is all of K((T)).
- `coefficientBox_single_test`: If c ∉ U_j then cT^j is outside the box, for every integer j, including negative j.
- `coefficientBox_intersection_test`: Membership in the box of U_i∩V_i is equivalent to membership in both boxes.

**Acceptance.** Imposing a condition at a negative exponent is meaningful; Laurent series have finite negative support individually, with no common lower bound built into the carrier.


<a id="HL-0-coefficient-box-membership"></a>
### Membership in a coefficient box

`HL.0/coefficient-box-membership` · lemma · unchecked

For every Laurent series f and family U, f ∈ coefficientBox(U) if and only if f_i ∈ U_i for every integer i.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Unfold the carrier of the coefficient box.

**Prerequisites.** [HL.0/coefficient-box](#HL-0-coefficient-box).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** The zero series belongs because each subgroup contains zero.


<a id="HL-0-coefficient-box-single"></a>
### Monomials in coefficient boxes

`HL.0/coefficient-box-single` · lemma · unchecked

For j ∈ ℤ and c ∈ K, cT^j ∈ coefficientBox(U) if and only if c ∈ U_j.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Apply the membership lemma. At j the native single coefficient is c; at every other index it is zero, which every U_i contains.

**Prerequisites.** [HL.0/coefficient-box-membership](#HL-0-coefficient-box-membership), `mathlib:HahnSeries.single`, `mathlib:HahnSeries.coeff_single`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** A condition at any one exponent can be recovered from the box, so different families cannot define the same box.


<a id="HL-0-coefficient-box-intersection"></a>
### Intersection of coefficient boxes

`HL.0/coefficient-box-intersection` · lemma · unchecked

coefficientBox(i ↦ U_i ∩ V_i) = coefficientBox(U) ∩ coefficientBox(V).

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Use additive-subgroup extensionality and the membership lemma. Distribute the universal quantifier over the conjunction.

**Prerequisites.** [HL.0/coefficient-box-membership](#HL-0-coefficient-box-membership).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** The intersection of an unconstrained box with any box is that box.


<a id="HL-0-coefficient-box-tail"></a>
### Outer valuation tails inside boxes

`HL.0/coefficient-box-tail` · lemma · unchecked

If U_i=K for every i≥N, then the set of Laurent series with f_i=0 for every i<N is contained in coefficientBox(U).

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Split each integer index at N. Below N, the coefficient is zero and lies in U_i; at or above N, the constraint is the full field.

**Prerequisites.** [HL.0/coefficient-box-membership](#HL-0-coefficient-box-membership).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** N may be negative, zero or positive; the direction is i≥N, never i≤N.


<a id="HL-0-coefficient-filter-basis"></a>
### The coefficient-box filter basis

`HL.0/coefficient-filter-basis` · construction · unchecked

coefficientBasis(K) is the native AddGroupFilterBasis on the additive group K((T)). Its sets are exactly coefficientBox(U), viewed as sets, for families of open additive subgroups satisfying ∃N∈ℤ, ∀i≥N, U_i=K.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. The constant full-field family supplies a basis set.
2. For two families take their pointwise intersection. Beyond the maximum of their cutoffs the intersection is full. The coefficient-box intersection lemma gives directedness.
3. Every basis set is a subgroup: it contains zero, is closed under addition and negation, and translation-conjugation in this commutative group fixes it. Supply these facts to the native additive filter-basis constructor. No ring-filter-basis axiom is asserted.

**Prerequisites.** [HL.0/coefficient-box](#HL-0-coefficient-box), [HL.0/coefficient-box-intersection](#HL-0-coefficient-box-intersection), `mathlib:AddGroupFilterBasis`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**API.**

- `HigherLaurent.coefficientBasis` (constructor): The native additive filter basis of the admissible coefficient boxes.
- `HigherLaurent.mem_coefficientBasis` (characterisation): A set belongs to the basis exactly when it is a box for a family eventually equal to K toward positive infinity; see the separate lemma.
- `HigherLaurent.coefficientBox_mem_basis` (compatibility): Every coefficient box whose family is equal to K for all sufficiently large positive exponents belongs to coefficientBasis(K). This is the usable introduction form of the basis-set membership lemma.

**Uses.** HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis: Makes the source neighborhood condition explicit on native coefficients. HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-equals-outer-iff-discrete: Separates the original coefficient topology from the outer T-adic topology without replacing the latter globally.

**Tests a wrong definition must fail.**

- `coefficientBasis_top_test`: The entire Laurent-series field belongs to the basis.
- `coefficientBasis_tail_direction_test`: Every family equal to K for i≥0 supplies a basis set, with arbitrarily small neighborhoods allowed at negative i.
- `coefficientBasis_uniform_constraint_test`: For a proper open additive subgroup V of K, the box with U_i=V for all i is not a basis set. The monomial membership lemma rules out an alternative admissible family defining that same box.

**Acceptance.** An arbitrary family is not a basis family: a proper fixed subgroup repeated at all exponents fails the positive-tail condition.


<a id="HL-0-coefficient-filter-basis-membership"></a>
### Basis-set membership

`HL.0/coefficient-filter-basis-membership` · lemma · unchecked

A subset S of K((T)) belongs to coefficientBasis(K) exactly when there is a family U of open additive subgroups with ∃N, ∀i≥N, U_i=K and S=coefficientBox(U).

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Unfold the sets field of the constructed filter basis.

**Prerequisites.** [HL.0/coefficient-filter-basis](#HL-0-coefficient-filter-basis).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** The equality describes basis sets, not arbitrary supersets that merely are neighborhoods.


<a id="HL-0-equal-characteristic-higher-topology"></a>
### Higher topology on Laurent series

`HL.0/equal-characteristic-higher-topology` · construction · unchecked

higherTopology(K) is the topology supplied by coefficientBasis(K) through the native AddGroupFilterBasis topology construction. It is a named second topology on the existing LaurentSeries K type. For a nonarchimedean topological additive group K it agrees with the coefficient-neighborhood topology of Zhukov §1.3.1(a).

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Apply the native group-filter-basis topology constructor to coefficientBasis(K).
2. The construction itself is meaningful for any topology on K. Agreement with the source uses the separate cofinality theorem under NonarchimedeanAddGroup K. Keep the higher topology explicit in continuity, neighborhood and separation statements.

**Prerequisites.** [HL.0/coefficient-filter-basis](#HL-0-coefficient-filter-basis), `mathlib:GroupFilterBasis.topology`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**API.**

- `HigherLaurent.higherTopology` (constructor): The explicitly named topology on native Laurent series.
- `HigherLaurent.higherTopology_eq_basis` (characterisation): Equality with the native additive-basis topology; see the separate specification lemma.
- `HigherLaurent.mem_nhds_zero_iff` (characterisation): A zero-neighborhood contains an admissible box; see the separate lemma.
- `HigherLaurent.higher_isTopologicalAddGroup` (structure): The addition and negation maps are continuous in the named higher topology; see the separate theorem.
- `HigherLaurent.continuous_coeff` (compatibility): For nonarchimedean K, each coefficient map from the higher topology to K is continuous; see the separate theorem.
- `HigherLaurent.induced_single` (compatibility): For nonarchimedean K, the topology induced by c ↦ cT^j is exactly the given topology of K; see the separate theorem.

**Uses.** HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis: Makes the source neighborhood condition explicit on native coefficients. HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-equals-outer-iff-discrete: Separates the original coefficient topology from the outer T-adic topology without replacing the latter globally.

**Tests a wrong definition must fail.**

- `higherTopology_discrete_test`: For discrete nonarchimedean K the higher topology equals the native T-adic topology.
- `higherTopology_constant_sequence_test`: For a sequence s_n in a nonarchimedean K with s_n→0 and all s_n≠0, the constant Laurent series s_n converge to zero in the higher topology and do not converge to zero in the native outer topology.
- `higherTopology_outer_ball_test`: If the nonarchimedean coefficient topology is not discrete, T K[[T]], the set with f_i=0 for i<1, is not open for the higher topology, although it is open for the outer valuation topology.

**Acceptance.** The equality with the native outer topology holds exactly for discrete coefficient topology, under the nonarchimedean hypothesis. No field-topology, completeness, local compactness or joint-multiplication-continuity instance is inferred.


<a id="HL-0-higher-topology-basis-specification"></a>
### Topology specified by its additive basis

`HL.0/higher-topology-basis-specification` · lemma · unchecked

higherTopology(K) equals the topology produced by coefficientBasis(K).

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Unfold the named topology construction.

**Prerequisites.** [HL.0/equal-characteristic-higher-topology](#HL-0-equal-characteristic-higher-topology).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** The statement identifies the precise topology used in every subsequent signature.


<a id="HL-0-higher-topological-add-group"></a>
### Continuity of addition in the higher topology

`HL.0/higher-topological-add-group` · theorem · unchecked

The additive group K((T)), equipped with higherTopology(K), is a topological additive group.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Transport the native AddGroupFilterBasis topological-additive-group instance along the specification equality.

**Prerequisites.** [HL.0/higher-topology-basis-specification](#HL-0-higher-topology-basis-specification), `mathlib:GroupFilterBasis.topology`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** This supplies continuous addition and negation without asserting continuous multiplication.


<a id="HL-0-higher-neighborhood-basis"></a>
### Neighborhoods in the higher topology

`HL.0/higher-neighborhood-basis` · lemma · unchecked

A subset S of K((T)) is a neighborhood of zero in higherTopology(K) if and only if it contains a coefficientBox(U) for an open-subgroup family U eventually equal to K at positive exponents.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Use the native group-filter-basis neighborhood theorem at zero, transported by the specification equality.
2. Rewrite basis-set membership using its exact characterization. The result is containment in S, not equality with S.

**Prerequisites.** [HL.0/higher-topology-basis-specification](#HL-0-higher-topology-basis-specification), [HL.0/coefficient-filter-basis-membership](#HL-0-coefficient-filter-basis-membership), `mathlib:GroupFilterBasis.nhds_one_hasBasis`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** Any superset of a box is a neighborhood; it need not itself be a box.


<a id="HL-0-open-subgroup-boxes-cofinal"></a>
### Open subgroup boxes recover the source topology

`HL.0/open-subgroup-boxes-cofinal` · lemma · unchecked

Assume NonarchimedeanAddGroup K. For every family of zero-neighborhoods U_i in K with U_i=K for all i≥N, there exists a family of open additive subgroups V_i⊆U_i with V_i=K for all i≥N. Thus these subgroup boxes are cofinal among the source neighborhood boxes.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Below N apply the native nonarchimedean property separately at each integer to choose an open additive subgroup inside U_i.
2. At and above N choose K itself. The same cutoff remains valid; coordinatewise inclusion gives inclusion of boxes.
3. Conversely every open additive subgroup contains zero and is a zero-neighborhood. The two neighborhood systems therefore agree.

**Prerequisites.** `mathlib:NonarchimedeanAddGroup`, `mathlib:OpenSubgroup.mem_nhds_one`, [HL.0/higher-neighborhood-basis](#HL-0-higher-neighborhood-basis).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** The eventual equality is preserved exactly, rather than replaced by a uniform bound on all coefficient neighborhoods.


<a id="HL-0-higher-coefficient-continuity"></a>
### Continuous coefficient projections

`HL.0/higher-coefficient-continuity` · theorem · unchecked

Assume NonarchimedeanAddGroup K. For every integer j the coefficient projection f ↦ f_j from higherTopology(K) to the specified topology on K is continuous.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. For a zero-neighborhood in K choose an open additive subgroup V inside it.
2. Choose the box family equal to V at j and K elsewhere. It is admissible with cutoff j+1, and its image under the coefficient map lies in V.
3. The coefficient map is additive by the native coefficient identity. Continuity at zero extends to all points using the two topological additive groups.

**Prerequisites.** [HL.0/open-subgroup-boxes-cofinal](#HL-0-open-subgroup-boxes-cofinal), [HL.0/higher-neighborhood-basis](#HL-0-higher-neighborhood-basis), [HL.0/higher-topological-add-group](#HL-0-higher-topological-add-group), [HL.0/coefficient-box-membership](#HL-0-coefficient-box-membership), `mathlib:HahnSeries.coeff_add`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** Every integer projection, including negative indices, is continuous.


<a id="HL-0-higher-single-induced-topology"></a>
### The coefficient field inside the higher topology

`HL.0/higher-single-induced-topology` · theorem · unchecked

Assume NonarchimedeanAddGroup K. For each integer j, the topology induced on K by c ↦ cT^j into higherTopology(K) equals the given topology on K.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. The inverse image of any admissible box under c ↦ cT^j is U_j by monomial membership. This proves continuity at zero; additivity gives continuity everywhere.
2. The coefficient projection at j is continuous and is a left inverse of this map. Pulling back its neighborhood preimages proves the reverse inclusion of topologies.

**Prerequisites.** [HL.0/coefficient-box-single](#HL-0-coefficient-box-single), [HL.0/higher-neighborhood-basis](#HL-0-higher-neighborhood-basis), [HL.0/higher-coefficient-continuity](#HL-0-higher-coefficient-continuity), [HL.0/higher-topological-add-group](#HL-0-higher-topological-add-group), `mathlib:HahnSeries.coeff_single`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** For j=0 this is the original coefficient field, whose topology is discrete inside the outer T-adic topology but need not be discrete here.


<a id="HL-0-higher-hausdorff"></a>
### Hausdorffness of the higher topology

`HL.0/higher-hausdorff` · theorem · unchecked

If K is a Hausdorff nonarchimedean topological additive group and a field, higherTopology(K) on K((T)) is Hausdorff.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Distinct Laurent series have different coefficients at some integer, by the native coefficient extensionality theorem.
2. Separate those coefficients by disjoint open sets in K. Their inverse images under the continuous coefficient projection separate the Laurent series.

**Prerequisites.** [HL.0/higher-coefficient-continuity](#HL-0-higher-coefficient-continuity), `mathlib:HahnSeries.coeff_injective`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** No completeness of K is required for separation.


<a id="HL-0-higher-versus-outer-topology"></a>
### The higher topology is coarser than the outer topology

`HL.0/higher-versus-outer-topology` · theorem · unchecked

Assume NonarchimedeanAddGroup K. The identity map from K((T)) with its native outer T-adic topology to higherTopology(K) is continuous. In Mathlib topology order this says outerTopology ≤ higherTopology.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. It suffices to compare neighborhoods of zero in the two additive groups. Any higher neighborhood contains an admissible box with cutoff N.
2. The tail lemma puts T^N K[[T]] inside that box. The native Laurent-series valuation inequality identifies the tail with v(f)≤exp(−N).
3. A strictly smaller native valuation ball lies inside this tail, so the box is an outer zero-neighborhood. Translate to all points.

**Prerequisites.** [HL.0/higher-neighborhood-basis](#HL-0-higher-neighborhood-basis), [HL.0/higher-topological-add-group](#HL-0-higher-topological-add-group), [HL.0/coefficient-box-tail](#HL-0-coefficient-box-tail), `mathlib:LaurentSeries.valued`, `mathlib:LaurentSeries.valuation_le_iff_coeff_lt_eq_zero`, `mathlib:Valued.hasBasis_nhds_zero`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** The direction reverses the inherited packet assertion. A sequence converging in the outer topology converges in the higher topology.


<a id="HL-0-higher-equals-outer-iff-discrete"></a>
### Equality of the two topologies detects discrete coefficients

`HL.0/higher-equals-outer-iff-discrete` · theorem · unchecked

Assume NonarchimedeanAddGroup K. The higher topology on K((T)) equals the native outer T-adic topology if and only if the topology of K is discrete.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. If K is discrete, the coefficient family {0} for i<N and K for i≥N is admissible and its box is T^N K[[T]]. Thus each native valuation neighborhood contains a higher neighborhood. Combine with the comparison theorem.
2. Conversely, the topology that the outer valuation induces on constants is discrete: the outer open ball T K[[T]] meets constants only in zero.
3. The induced-single theorem identifies the topology on constants in the higher topology with the original topology of K. Equality therefore forces zero to be open, hence all singletons to be open by translation.

**Prerequisites.** [HL.0/higher-versus-outer-topology](#HL-0-higher-versus-outer-topology), [HL.0/higher-single-induced-topology](#HL-0-higher-single-induced-topology), [HL.0/higher-neighborhood-basis](#HL-0-higher-neighborhood-basis), [HL.0/coefficient-box-membership](#HL-0-coefficient-box-membership), `mathlib:discreteTopology_iff_isOpen_singleton_one`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** A finite discrete residue field gives the ordinary one-dimensional Laurent-series topology. An inner Laurent-series field with its valuation topology gives strict inequality.


<a id="HL-0-higher-strictly-coarser"></a>
### Strict comparison for nondiscrete coefficients

`HL.0/higher-strictly-coarser` · theorem · unchecked

If K is a nonarchimedean topological additive group and a field whose topology is not discrete, the native outer T-adic topology is strictly finer than higherTopology(K). In Mathlib order: outerTopology < higherTopology.

**Hypotheses and conventions.** K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof route.**

1. Combine the comparison inequality with the equality-if-and-only-if-discrete theorem and the hypothesis that K is not discrete.

**Prerequisites.** [HL.0/higher-versus-outer-topology](#HL-0-higher-versus-outer-topology), [HL.0/higher-equals-outer-iff-discrete](#HL-0-higher-equals-outer-iff-discrete).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11: The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

**Acceptance.** In F_q((u))((t)), the sequence of constant-in-t elements u^n converges to zero in the higher topology, but its outer t-valuation is always zero.


## HL.1

Imported all-graded Milnor symbols, residues and transfers; iterated orientation, sequential topological quotient, principal-unit filtration, Parshin expansion and norm descent. Every target has a node; source proofs not fully extracted terminate in the listed gaps.

**Planets:** Iterated Milnor residue, Topological Milnor K-groups, Parshin structure theorem.

<a id="HL-1-iterated-residue-with-signs"></a>
### Iterated Milnor residue

`HL.1/iterated-residue-with-signs` · construction · unchecked

For an n-local tower define δ_F:K_m^M(F)→K_{m−n}^M(F_0) by composing the n imported DVR boundaries, for m≥n. Use the convention ∂{u_1,…,u_{r−1},π}={ū_1,…,ū_{r−1}}. Thus δ_F{t_1,…,t_n}=1 in K_0^M(F_0)=Z and δ_F{a,t_1,…,t_n}=a for a lifted last-residue unit.

**Hypotheses and conventions.** All units in a single boundary formula are units for that step. Negative K-degrees are zero only after explicitly extending the graded convention.

**Proof route.**

1. Import the full graded Milnor group and DVR symbol from K2 T.2/T.3; compose along the tower.
2. At each step remove the last uniformizer. Moving it across r−1 slots introduces (−1)^{r−1}, using the imported alternating law; do not impose that a repeated entry always vanishes.

**Prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.3/higher-milnor-residues`, `K2SymbolsBrauer:T.2/milnor-alternating`, [HL.0/local-parameters](#HL-0-local-parameters).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §6.4.1, p. 65: Iterated valuation normalization.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §5.1, pp. 32–34: Milnor boundaries and higher valuation.

**API.**

- `HigherMilnor.iteratedResidue` (constructor): Composition of the imported boundaries.
- `HigherMilnor.iteratedResidue_parameters` (simp): δ{t_1,…,t_n}=1.
- `HigherMilnor.iteratedResidue_unitParameters` (simp): δ{a,t_1,…,t_n}=ā.
- `HigherMilnor.iteratedResidue_permute` (compatibility): Permutation of symbol entries acts by its sign.

**Uses.** HL.3 Frobenius: Gives the unramified exponent. HL.4 tame symbol: Gives the final residue unit.

**Tests a wrong definition must fail.**

- `check_1`: In dimension zero δ is the identity, including K_0=Z.
- `check_2`: On F_q((u))((t)), δ{u,t}=1 and δ{t,u}=−1.
- `check_3`: The outer boundary of a symbol all of whose entries are outer units is zero; taking residues in the opposite tower order fails this check.

**Acceptance.** δ{u,t}=1 and δ{t,u}=−1 on F_q((u))((t)).


<a id="HL-1-norms-and-projection-formulas"></a>
### Tower norms and topological descent

`HL.1/norms-and-projection-formulas` · theorem · unchecked

Use the K2 T.4 Milnor transfer for every finite tower extension, including inseparable residue extensions. Iterated residues satisfy δ_F N_{L/F}=N_{L_0/F_0}δ_L. In degree n this is δ_F N=fδ_L, f=[L_0:F_0]; restriction instead multiplies δ by ∏e_i. Norms descend continuously to topological Milnor groups. For cyclic L/F, the sequence K_n^top(L) --(1−σ)→K_n^top(L) --N→K_n^top(F) is exact at the middle term.

**Hypotheses and conventions.** Finite tower-continuous extensions. Exactness does not assert injectivity of restriction to L, or surjectivity of N.

**Proof route.**

1. Compose the imported complete-DVR norm/residue square. On K_0 the residue-field transfer is its degree; on restriction apply the e-factor boundary law.
2. Use symbol projection formulas to construct the descended norm; prove it kills the closure kernel. Fesenko §6.8 reduces closedness and cyclic Hilbert 90 to prime-degree extensions and the tame/wild pairings; proof extraction is G05.

**Prerequisites.** `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/complete-norm-residue`, [HL.1/iterated-residue-with-signs](#HL-1-iterated-residue-with-signs), [HL.1/topological-milnor-k-groups](#HL-1-topological-milnor-k-groups).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §6.8, pp. 72–73: Norm descent, norm subgroup closedness and cyclic Hilbert 90.

**Acceptance.** A purely unramified degree d tower extension has norm valuation multiplier d, whereas a totally ramified extension with f=1 does not acquire an e-factor in δN.

**Direct open inputs.** [G05](#g05). Other gaps propagate through the prerequisites.

<a id="HL-1-topological-milnor-k-groups"></a>
### Topological Milnor K-groups

`HL.1/topological-milnor-k-groups` · construction · unchecked

Give K_m^M(F) the finest sequential topology λ_m for which subtraction and the symbol map from (F×)^m with λ_* are sequentially continuous. Let Λ_m(F) be the intersection of all zero-neighborhoods, and define K_m^top(F)=K_m^M(F)/Λ_m(F), with the quotient topology. Record the factorization criterion for Hausdorff sequential symbol targets.

**Hypotheses and conventions.** m≥1 and finite last residue field. The quotient is not a profinite completion. λ_m is specified using sequences and subtraction, not assumed to be the quotient topology from one finite tensor power.

**Proof route.**

1. Construct λ_m via the sequential-final universal property, then identify the non-Hausdorff kernel. Descend symbols and continuous finite-order characters.
2. Fesenko §6.6 identifies Λ_m with the intersection of all positive integer multiples, in characteristic p by BGK and divisibility; the mixed-characteristic proof has a separate all-prime input G05.

**Prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, [HL.0/topology-on-the-multiplicative-group](#HL-0-topology-on-the-multiplicative-group).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §6.2–6.3, pp. 63–64; §6.6, Theorems 2–3, pp. 68–70: Sequential symbol topology, quotient and divisible kernel.

**API.**

- `TopMilnorK.ofMilnor` (constructor): The canonical quotient map.
- `TopMilnorK.symbol` (constructor): The descended multilinear Steinberg symbol.
- `TopMilnorK.lift` (universal-property): A Hausdorff sequentially continuous symbol homomorphism factors uniquely.
- `TopMilnorK.kernel` (characterisation): The kernel is Λ_m, with its intersection/divisibility characterization.

**Uses.** HL.3 finite norm quotients: Provides the topological source after comparison of open-subgroup conventions. HL.4 filtrations: Supplies closure and principal-unit subgroups.

**Tests a wrong definition must fail.**

- `check_1`: For F_q((t)), K_1^top=F_q((t))×, which contains an infinite Z valuation factor.
- `check_2`: The class {t_1,…,t_n} survives: its iterated valuation is 1.
- `check_3`: For n=1 the unramified part of the profinite completion replaces Z by Ẑ, while K_1^top itself retains Z.

**Acceptance.** For m=1 over an ordinary local field, Λ_1=0 and K_1^top=F×.


<a id="HL-1-parshin-structure-of-the-topological-k-group"></a>
### Parshin expansion of topological K-groups

`HL.1/parshin-structure-of-the-topological-k-group` · theorem · unchecked

For F=F_q((t_1))⋯((t_n)) of characteristic p, K_n^top(F) decomposes as Z⊕(Z/(q−1))^n⊕VK_n^top(F). Its principal-unit part has a unique convergent Z_p expansion in symbols {1+θt^I,t_1,…,t̂_l,…,t_n}, with I>0 in the outer-first order, p not dividing gcd(I), l the first index with p∤i_l, and θ ranging over a fixed F_p basis of F_q. In particular K_n^top(F) has no p-torsion.

**Hypotheses and conventions.** An equal-characteristic finite-end field with fixed parameters and residue basis. “First index” means the smallest inner-to-outer label l; convergence uses the admissible support topology.

**Proof route.**

1. Separate parameter valuation, residue-root symbols and principal units using the imported Milnor relations.
2. Reduce principal-unit symbols by successive p-divisibility of multi-indices and Steinberg relations; use Artin–Schreier–Witt residue characters for uniqueness. Parshin’s reverse parameter generator differs by (−1)^{n(n−1)/2}.

**Prerequisites.** [HL.1/topological-milnor-k-groups](#HL-1-topological-milnor-k-groups), [HL.0/teichmueller-representatives-and-expansions](#HL-0-teichmueller-representatives-and-expansions), [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), `K2SymbolsBrauer:T.2/milnor-alternating`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §7.1–7.3, pp. 75–77, especially Theorem 1 in §7.2: Characteristic-p structure, convergent generators and torsion.

**Acceptance.** For n=2 the tame torsion has two Z/(q−1) factors, not one; p-torsion is zero.


<a id="HL-1-filtration-on-milnor-k-groups"></a>
### Principal-unit Milnor filtrations

`HL.1/filtration-on-milnor-k-groups` · construction · unchecked

For the outer DVR let U^rK_m^M(F) be generated by {1+a,b_2,…,b_m}, a∈m_outer^r, b_j∈F×, for integral r≥1; define U^0 using outer units, and VK_m using principal units. Let U^rK_m^top be the closure of the image. A multi-index filtration is separately specified by rank-valuation bounds and sequential closure; it does not automatically coincide with a higher ramification filtration.

**Hypotheses and conventions.** For m=1 import the ordinary unit filtration; m≥2 uses the imported Milnor symbols. Distinguish integral outer r from rank multi-indices and from Zhukov’s ramification labels.

**Proof route.**

1. Use generated subgroups and the symbol universal property. Prove monotonicity and change of parameters; show restriction and norm respect the stated valuation bounds.
2. Leave graded differential descriptions to the requested log comparison in HL.2 and the explicitly scoped ramification theorem in HL.4.

**Prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, [HL.0/rank-valuation-ring](#HL-0-rank-valuation-ring), [HL.1/topological-milnor-k-groups](#HL-1-topological-milnor-k-groups), `tauceti:TauCeti.unitFiltration`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §6.3, p. 64; §6.5–6.6, pp. 66–70: Principal-unit subgroups and their topology.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §5.2, pp. 35–36: Outer unit filtration.

**API.**

- `MilnorUnitFiltration.subgroup` (constructor): Generated symbol subgroup for r≥1.
- `MilnorUnitFiltration.antitone` (relation): Increasing r decreases U^r.
- `MilnorUnitFiltration.topImage` (compatibility): Closure of the quotient image defines the topological filtration.
- `MilnorUnitFiltration.one` (characterisation): At m=1 this is the ordinary unit subgroup.

**Uses.** HL.2 wild pairings: Conductor and differential graded pieces. HL.4 ramification: Provides the input whose precise reindexing must be proved.

**Tests a wrong definition must fail.**

- `check_1`: In F_q((u))((t)), {1+t^r,u} belongs to U^rK_2 and hence to U^s for 1≤s≤r.
- `check_2`: The parameter symbol {u,t} has δ=1, so is not a principal-unit symbol.
- `check_3`: At m=1, 1+t^r is in U^r but 1+t^{r−1} is not, for r>1.

**Acceptance.** For m=1, U^r consists of 1+m_outer^r.


<a id="HL-1-acceptance-computation-of-an-iterated-residue"></a>
### Residue and norm acceptance computation

`HL.1/acceptance-computation-of-an-iterated-residue` · application · unchecked

On F_q((u))((t)), compute ∂_t{u,t}={u}, ∂_u{u}=1, δ{t,u}=−1, and δ{a,u,t}=a for a∈F_q×. For finite extension L/F verify δ_F N=fδ_L, including a residue-inseparable extension.

**Hypotheses and conventions.** Uniformizer-last convention. For the last expression the result lies in K_1^M(F_q)=F_q×.

**Proof route.**

1. Evaluate the imported boundary formulas in order. Compute f at the final finite field and compare with the triangular valuation formula.

**Prerequisites.** [HL.1/iterated-residue-with-signs](#HL-1-iterated-residue-with-signs), [HL.1/norms-and-projection-formulas](#HL-1-norms-and-projection-formulas).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §6.4.1–6.4.2, p. 65: Valuation and tame-pairing normalization.

**Acceptance.** Reversing the two parameters negates the degree-two valuation and inverts the degree-three tame value.


<a id="HL-1-topological-versus-algebraic-k-groups"></a>
### Divisible kernel and finite quotients

`HL.1/topological-versus-algebraic-k-groups` · comparison · unchecked

The algebraic-to-topological quotient has kernel Λ_m=∩_{a≥1}aK_m^M(F), a divisible subgroup under the source hypotheses. It induces K_m^M(F)/a≃K_m^top(F)/a for positive a. For ordinary local F and m=1 the map is an isomorphism; for higher fields do not infer injectivity before dividing by Λ_m. Finite quotients still differ from a profinite completion.

**Hypotheses and conventions.** Finite-end n-local fields. The source’s mixed-characteristic torsion proof uses an additional wild-symbol input, recorded in G05.

**Proof route.**

1. Use divisibility of Λ_m to identify the kernel modulo a; surjectivity follows from the quotient.
2. In degree one and n=1, the principal units and valuation detect every nonidentity element in some finite quotient. Import ordinary K_2 symbol results from L.3 rather than reprove them.

**Prerequisites.** [HL.1/topological-milnor-k-groups](#HL-1-topological-milnor-k-groups), `KTheoryFiniteLocalFields:L.3`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §6.6, Theorems 2–3, pp. 68–70; §6.1, pp. 61–62: Divisible kernel and ordinary-field comparison.

**Acceptance.** The valuation class 1 survives every quotient by a>1, but its compatible finite images do not make the original Z factor profinite.

**Direct open inputs.** [G05](#g05). Other gaps propagate through the prerequisites.

## HL.2

Finite shifted Kato coefficients, positive-degree torsion cohomology, transfers, low degrees, admissible residues, top invariant, dimension and exact tame/wild duality scope. Every target has a node; source proofs not fully extracted terminate in the listed gaps.

**Planets:** Kato coefficient complexes, Kato cohomology, Higher local invariant, Higher local duality.

<a id="HL-2-finite-kato-coefficient-complex"></a>
### Finite Kato coefficient complexes

`HL.2/finite-kato-coefficient-complex` · definition · unchecked

For a field E and i≥0, use the imported continuous/étale coefficient carrier to define Z/n(i). If n is invertible in E this is μ_n^{⊗i} in degree zero. If char E=p and n=mp^s, (m,p)=1, it is μ_m^{⊗i}⊕W_sΩ^i_{E,log}[−i]. Consequently H^q(E,Z/p^s(i))=H^{q−i}_et(E,W_sΩ^i_log), and is zero for q<i.

**Hypotheses and conventions.** n≥1; s=0 means the p-primary summand is zero. Twists i<0 in positive characteristic are not supplied by this definition. Ordinary and logarithmic Witt complexes are imported, not constructed in HL.2.

**Proof route.**

1. Assemble the coprime primary summands of the coefficient complex, respecting the cohomological shift. Compare the prime-to-p branch with the canonical continuous-cohomology carrier via the imported étale/Galois equivalence.

**Prerequisites.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `CrystallineCohomology:CR.4`, `SchemeAndStackFoundations:SF.2/etale-galois-comparison`.

**Sources.** [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, coefficient definitions, pp. 3–4: Finite étale and logarithmic Witt coefficients with the shift.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §5.1, pp. 53–55: Kato finite-coefficient convention.

**API.**

- `KatoCoefficients.complex` (constructor): Coprime decomposition of the coefficient complex.
- `KatoCoefficients.primeToChar` (compatibility): Agreement with the usual finite Tate twist.
- `KatoCoefficients.wildShift` (characterisation): The p-primary cohomology has degree shift q−i.
- `KatoCoefficients.coprimeSplit` (equivalence): The m and p^s components form a canonical direct sum.

**Uses.** Dittmann–Pop §2 kato-coefficients: Fixes finite-coefficient degree conventions. HL.6 Kato complex: Supplies H^{a+1}(κ,Z/n(a)).

**Tests a wrong definition must fail.**

- `check_1`: For char E=p and i=1, H^2(Z/p^s(1)) is H^1(W_sΩ^1_log), not H^2 of the logarithmic sheaf.
- `check_2`: For i=0, H^1(Z/p^s(0)) is Artin–Schreier–Witt character cohomology.
- `check_3`: For n=1 all groups vanish; for p∤n the Witt summand vanishes.

**Acceptance.** At i=0 the characteristic-p summand is Z/p^s in degree zero.


<a id="HL-2-kato-cohomology-groups"></a>
### Kato cohomology groups

`HL.2/kato-cohomology-groups` · definition · unchecked

For q≥1 define H_Kato^q(E)=colim_n H^q(E,Z/n(q−1)), using the standard coefficient transition maps. In characteristic p the p-primary part is colim_s H^1_et(E,W_sΩ^{q−1}_log); the prime-to-p part is ordinary continuous Galois cohomology. This is a torsion group with compatible primary decompositions.

**Hypotheses and conventions.** No H_Kato^0 is defined by a negative logarithmic twist. Coefficient changes must be compatible with Frobenius/Verschiebung conventions.

**Proof route.**

1. Use finite coefficient complexes and their transition maps; identify the log-Witt cokernel description via the Cartier sequence supplied by CR.4/BGK.
2. Keep this local arithmetic assembly separate from the generic cohomology and derived colimit interfaces imported from PC and M.5d.

**Prerequisites.** [HL.2/finite-kato-coefficient-complex](#HL-2-finite-kato-coefficient-complex), `MotivicEtaleKTheory:M.5d`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §5.1, pp. 53–55; Kato existence, introduction, p. 166: Positive-degree Kato groups.; [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, p. 3: The cohomology convention used by the routed paper.

**API.**

- `KatoCohomology.finiteToTorsion` (constructor): The canonical coefficient-length maps.
- `KatoCohomology.primary` (equivalence): Primary decomposition compatible with finite coefficients.
- `KatoCohomology.wild` (characterisation): In characteristic p the wild part is the colimit of H^1 of log-Witt forms.
- `KatoCohomology.torsion` (instance): Every class has finite order.

**Uses.** HL.3 reciprocity: Character/Milnor cup products land in top Kato cohomology. Dittmann–Pop §2 kato-cohomology: Supplies the finite and torsion groups with matching indices.

**Tests a wrong definition must fail.**

- `check_1`: For q=1 in characteristic p the p^s part uses W_s(E)/(F−1), not E×/(E×)^{p^s}.
- `check_2`: For q=2 the group must retain the p-primary Brauer classes in characteristic p.
- `check_3`: For a finite field F_q, H_Kato^1=Q/Z and H_Kato^q=0 for q>1.

**Acceptance.** H_Kato^1 is the finite-order continuous character group, and H_Kato^2 is Br(E).


<a id="HL-2-restriction-corestriction"></a>
### Restriction, corestriction and odd-degree injectivity

`HL.2/restriction-corestriction` · theorem · unchecked

For finite separable L/E, finite-coefficient Kato cohomology has res and cor, with cor∘res=[L:E], transitivity and the projection formula for cup products. Thus restriction on 2-primary groups is injective for odd [L:E]. Purely inseparable base change is treated through étale invariance and the chosen norm normalization, not by applying the finite-separable transfer definition verbatim.

**Hypotheses and conventions.** Degrees, twists and coefficient lengths agree in each formula; cup products use the imported graded cohomology carrier.

**Proof route.**

1. Import generic res/cor and cup products in the invertible branch. In characteristic p compare the finite étale trace on logarithmic Witt coefficients and its norm dlog compatibility.
2. For the injectivity consequence, multiplication by an odd integer is an automorphism of a group of exponent 2^s; apply cor to a class whose restriction is zero. Transfer comparison beyond the invertible branch is G04.

**Prerequisites.** [HL.2/finite-kato-coefficient-complex](#HL-2-finite-kato-coefficient-complex), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `MotivicEtaleKTheory:M.5d`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`.

**Sources.** [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, restriction/corestriction discussion, p. 4: Transfer identities and odd-degree injectivity.; [Hasse principles for higher-dimensional fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf), Theorem 2.10 proof, pp. 24–25: Prime-to-ℓ transfer descent, separating inseparable invariance.

**Acceptance.** A quadratic extension has even degree and does not meet the odd-degree injectivity test.

**Direct open inputs.** [G04](#g04). Other gaps propagate through the prerequisites.

<a id="HL-2-low-degree-identifications"></a>
### Characters and Brauer classes in low degrees

`HL.2/low-degree-identifications` · comparison · unchecked

Identify H^1(E,Z/n(0)) with continuous G_E characters to Z/n and H^2(E,Z/n(1)) with Br(E)[n], including n divisible by char E through logarithmic Witt coefficients. The torsion-colimit identifications are H_Kato^1(E)=Hom_cont(G_E,Q/Z) and H_Kato^2(E)=Br(E).

**Hypotheses and conventions.** Continuous cohomology is used; finite discrete coefficients have their canonical action.

**Proof route.**

1. Degree one follows from the cocycle description and Artin–Schreier–Witt in characteristic p. Prime-to-characteristic degree two is Kummer/Hilbert 90.
2. For p-power degree two use BGK in degree one over E^sep and the exact p^s-power sequence on its multiplicative group, as in Kurihara p. 55.

**Prerequisites.** [HL.2/kato-cohomology-groups](#HL-2-kato-cohomology-groups), `FunctionFieldArithmetic:FA.3/artin-schreier-witt-quotient`, `SchemeAndStackFoundations:SF.2/etale-galois-comparison`, `KTheoryFiniteLocalFields:L.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §5.1, p. 55: Low degrees and the wild Brauer identification.; [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, p. 4: Degree-one and degree-two reductions.

**Acceptance.** For a one-local field, the degree-two invariant is the ordinary Brauer invariant, rather than a degree-one character invariant.

**Direct open inputs.** [G04](#g04). Other gaps propagate through the prerequisites.

<a id="HL-2-kato-residue-theorem-and-the-invariant-map"></a>
### Higher invariant and admissible residues

`HL.2/kato-residue-theorem-and-the-invariant-map` · theorem · unchecked

For a henselian DVR E with residue k, define the prime-to-residue-characteristic boundary H^q(E,Z/m(i))→H^{q−1}(k,Z/m(i−1)) by the tame inertia sequence, normalized by ∂(inf a∪(π))=a. For Kato torsion groups the unramified splitting i_k^E⊕(i_k^E∪π) is an isomorphism on the prime-to-p part and identifies the unramified-kernel subgroup on the p-part. For an n-local F its top-degree specialization gives inv_F:H_Kato^{n+1}(F)≃Q/Z, with inv_F cor=inv_L and inv_F res=[L:F]inv_F on finite extensions.

**Hypotheses and conventions.** Do not assert a surjective full wild residue sequence for every henselian DVR and degree. The top-degree induction uses the finite p-rank of successive residues and Kato’s mixed-characteristic calculation. Use arithmetic Frobenius on the final finite field and uniformizer-last cup convention.

**Proof route.**

1. Iterate tame inertia residues to the final H^1(F_q,Q/Z), evaluated at arithmetic Frobenius.
2. For the wild top degree, use the injective unramified splitting and the p-rank vanishing theorem to prove it exhausts top cohomology; then descend along the tower. The exact Kato II proof remains G03.
3. Derive the corestriction normalization from one-step residue/transfer compatibility.

**Prerequisites.** [HL.2/kato-cohomology-groups](#HL-2-kato-cohomology-groups), [HL.2/restriction-corestriction](#HL-2-restriction-corestriction), [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §5.1, theorem and corollary, pp. 55–56; §5.2, p. 56: Admissible wild splitting and top invariant.; [Arithmetic Duality Theorems](https://math.stanford.edu/~conrad/BSDseminar/refs/MilneADT.pdf), I §2, Theorem 2.17 and Lemma 2.18, pp. 37–39: Tame-residue induction for higher traces.

**Acceptance.** At n=1 this is Br(F)≃Q/Z. At n=2 the invariant is on H_Kato^3, not H_Kato^2.

**Direct open inputs.** [G03](#g03). Other gaps propagate through the prerequisites.

<a id="HL-2-cohomological-dimension-and-tate-twists"></a>
### Cohomological dimensions with coefficient scope

`HL.2/cohomological-dimension-and-tate-twists` · theorem · unchecked

For an n-local tower F and a prime ℓ≠char F_1, the ordinary ℓ-cohomological dimension is n+1 and the top twisted trace is H^{n+1}(F,Q_ℓ/Z_ℓ(n))≃Q_ℓ/Z_ℓ. If char F=p then ordinary cd_p(F)≤1, whereas H_Kato^{n+1} can be nonzero and H_Kato^q=0 for q>n+1. Do not equate these two dimension notions.

**Hypotheses and conventions.** If char F_1=0 every prime is allowed in the first assertion. If char F_1=p, the prime p is excluded even when char F=0.

**Proof route.**

1. Induct over all residue steps above F_1 using tame inertia and Hochschild–Serre; start with ordinary local duality at F_1. The nonzero trace proves the lower bound.
2. The characteristic-p ordinary bound is Artin–Schreier cohomology. Kato vanishing uses his finite-order character theorem, with negative Milnor degrees absent; its proof input is G03.

**Prerequisites.** [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

**Sources.** [Arithmetic Duality Theorems](https://math.stanford.edu/~conrad/BSDseminar/refs/MilneADT.pdf), I §2, Theorem 2.17, Lemma 2.18 and Corollary 2.19, pp. 37–40: Higher trace and the exact allowed prime range.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Kato existence, Theorem 2, p. 166: Kato-group vanishing above n+1.

**Acceptance.** For Q_p((t)), the p-primary ordinary duality is allowed since F_1=Q_p has characteristic zero; for Q_p{{t}} it is not covered by this tame induction.

**Direct open inputs.** [G03](#g03). Other gaps propagate through the prerequisites.

<a id="HL-2-norm-residue-and-the-symbol-identification"></a>
### Imported norm-residue and differential symbols

`HL.2/norm-residue-and-the-symbol-identification` · comparison · unchecked

For m invertible in E, import the norm-residue isomorphism K_i^M(E)/m≃H^i(E,μ_m^{⊗i}). In characteristic p import the separate Bloch–Gabber–Kato differential symbol K_i^M(E)/p^s≃W_sΩ^i_{E,log}, {a_1,…,a_i}↦dlog[a_1]∧⋯∧dlog[a_i]. Compare products, finite transfers and admissible residues. This node adds the higher-local compatibility diagrams, not either generic theorem.

**Hypotheses and conventions.** s≥1, i≥0. The p-primary target is the log-Witt sheaf in degree zero; it becomes H^i(E,Z/p^s(i)) after the shift. Accepted RS-28 assigns only prime-power passage, colimits and characteristic/inseparable reductions to M.5d. BGK itself is an unowned prerequisite requested from an expanded L.5 or a separately assigned supplier.

**Proof route.**

1. Use the full invertible norm-residue supplier M.5/KU-normresidue with its proof dependencies. Use M.5d only for the named coefficient/field reductions.
2. For the wild symbol use the requested BGK theorem and compare its tame residue normalization with the imported uniformizer-last Milnor boundary; the mismatch in supplier scope is G04.

**Prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.3/higher-milnor-residues`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `MotivicEtaleKTheory:KU-normresidue`, `MotivicEtaleKTheory:M.5d`, `KTheoryFiniteLocalFields:L.5`, `CrystallineCohomology:CR.4`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §2.4, Theorem 5 and following finite-length generalization, p. 25; I §5.1, p. 55: Differential symbol and its use for wild cohomology.

**Acceptance.** At i=1 in characteristic p, dlog has kernel (E×)^{p^s}; replacing it by an ordinary μ_{p^s} Galois module loses the wild groups.

**Direct open inputs.** [G04](#g04). Other gaps propagate through the prerequisites.

<a id="HL-2-logarithmic-de-rham-witt-coefficients"></a>
### Log-Witt coefficient interface

`HL.2/logarithmic-de-rham-witt-coefficients` · comparison · unchecked

Import CR.4’s ordinary/relative de Rham–Witt complexes, restriction, Frobenius, Verschiebung and logarithmic dlog subgroups. Request the finite-length Cartier exact sequence, field trace and residue compatibilities needed for Kato coefficients. For mixed-characteristic DVRs request the L.5 logarithmic differential comparison in the imperfect-residue scope of higher fields; its existing perfect-residue odd-p calculations do not supply that scope.

**Hypotheses and conventions.** Finite Witt length is retained. A field-level logarithmic subgroup is not the full de Rham–Witt complex or the log structure of a mixed-characteristic DVR.

**Proof route.**

1. Use imported W_sΩ, express the logarithmic subgroup through dlog/Cartier, and identify the quotient by F−1 that computes wild H^1.
2. Compare restriction and Verschiebung with coefficient transitions; test residues on dlog of the outer parameter. BGK and imperfect mixed-residue suppliers remain G04.

**Prerequisites.** `CrystallineCohomology:CR.4`, `KTheoryFiniteLocalFields:L.5`, `MotivicEtaleKTheory:M.5d`, [HL.0/standard-mixed-series](#HL-0-standard-mixed-series).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §5.1, pp. 53–55; I §6.4.3, p. 66; Kato existence §5, pp. 191–194: Logarithmic coefficients and finite-length pairings.

**Acceptance.** The p-primary groups over F_p((u))((t)) use imperfect field coefficients; perfect-residue DVR formulas cannot be applied to its outer residue without an additional theorem.

**Direct open inputs.** [G04](#g04). Other gaps propagate through the prerequisites.

<a id="HL-2-finite-coefficient-duality"></a>
### Higher local duality with precise topology

`HL.2/finite-coefficient-duality` · theorem · unchecked

For n≥1, a prime ℓ≠char F_1 and a finite ℓ-primary continuous G_F-module M, with F_1 the one-local field at the bottom of the tower, cup product and the higher trace give a perfect pairing of finite groups H^r(F,M^∨(n))×H^{n+1−r}(F,M)→Q_ℓ/Z_ℓ, where M^∨=Hom(M,Q_ℓ/Z_ℓ). In all characteristics, Kato’s separate theorem identifies H_Kato^r(F), 1≤r≤n+1, with finite-order categorically continuous characters of K_{n+1−r}^M(F). The latter is a character duality, not a claim that all wild finite-exponent groups are finite.

**Hypotheses and conventions.** The prime condition is exactly ℓ≠char F_1. Do not infer a locally compact Pontryagin category for n≥2. Wild finite-exponent duals use the categorical topology and finite-order characters; a symmetric all-module wild duality needs its own statement and source.

**Proof route.**

1. For the finite-group theorem induct using Milne Lemma 2.18’s tame-inertia exact sequence and ordinary local Tate duality, then apply the five lemma to paired exact sequences.
2. For Kato’s character theorem use additive ind/pro duality (§2), finite conductor unit filtrations, nondegenerate graded Cartier pairings, and the prime-power lifting argument (§5, Proposition 7). The remaining exact proof extraction is G03.

**Prerequisites.** [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), [HL.0/pro-ind-finite-objects](#HL-0-pro-ind-finite-objects), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `KTheoryFiniteLocalFields:L.5`.

**Sources.** [Arithmetic Duality Theorems](https://math.stanford.edu/~conrad/BSDseminar/refs/MilneADT.pdf), I §2, Theorem 2.17 and its proof, pp. 37–39: Finite-group higher local duality in the tame-inductive prime range.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Kato existence, Theorem 2 p. 166; §2 pp. 172–173; §5 pp. 191–194: Finite-order character duality in the higher categorical sense.

**Acceptance.** For F_p((u))((t)), H^1(F,Z/p) is infinite; an unconditional assertion of a perfect pairing of finite groups at the wild prime fails.

**Direct open inputs.** [G03](#g03). Other gaps propagate through the prerequisites.

<a id="HL-2-two-dimensional-residue-pairing-acceptance"></a>
### Two-dimensional trace and residue pairing

`HL.2/two-dimensional-residue-pairing-acceptance` · application · unchecked

For F=F_q((u))((t)), m prime to p and χ an unramified character with χ(Frob_q)=1/m, inv_F(χ∪(u)∪(t))=1/m. In characteristic p, the order-p additive pairing on (w,{u,t}) is Tr_{F_q/F_p}(res_u res_t(w du/u∧dt/t)); for w∈F_q this equals Tr(w).

**Hypotheses and conventions.** The character precedes the parameter cup factors; residue removes dt/t first.

**Proof route.**

1. Apply the invariant normalization twice; for the wild formula use the finite-length Artin–Schreier residue pairing specialized to length one.

**Prerequisites.** [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), [HL.4/artin-schreier-witt-acceptance-computation](#HL-4-artin-schreier-witt-acceptance-computation), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §6.4.3, p. 66; I §5.2, p. 56: Residue/trace computation.

**Acceptance.** Swapping u and t negates the additive value, or inverts a multiplicative symbol value.


<a id="HL-2-nonreal-local-cd-bound"></a>
### Cohomological dimension over local constants

`HL.2/nonreal-local-cd-bound` · theorem · unchecked

Let k be a number field and v a nonarchimedean or complex place. Let k_v be the henselian algebraic constant field at a finite place, or the algebraically closed complex constant field. For any finitely generated L/k_v of transcendence degree r, cd₂(L)≤r+2; in the complex case cd₂(L)≤r. Consequently for a finitely generated E/k of Kronecker dimension d, the compositum E k_v has cd₂≤d+1. This estimate does not replace cd₂(E) when E is formally real.

**Hypotheses and conventions.** No real place is included. A finite-place field is the chosen henselization, not an arbitrary subfield of a completion. Use the generic extension inequality and the local cd₂ bound with their separability and henselian-comparison hypotheses.

**Proof route.**

1. Import the cohomological-dimension definition and the transcendence-degree inequality from PC.11. Establish the finite-place henselian bound by comparison with local Galois cohomology; algebraically closed constants have cd₂=0.
2. Use td(Ek_v/k_v)≤td(E/k)=d−1 and add the base bound two. The corrected estimate avoids any unjustified bound for a formally real E itself.

**Prerequisites.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, [HL.6/constant-place-fields](#HL-6-constant-place-fields), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

**Sources.** [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, pp. 3–5; §3, Proposition 3.2, local cohomological-dimension step, p. 7: Local constants and the dimension bound required by the routed consumer; proof input remains G13.

**Acceptance.** For E=Q(t), d=2, the finite-place compositum has cd₂≤3 even though E is formally real. A real-place field is excluded.

**Direct open inputs.** [G13](#g13). Other gaps propagate through the prerequisites.

## HL.3

Cohomological reciprocity, finite norm isomorphism, Parshin/AS-tree comparisons, categorical existence, absolute kernel and precisely indexed completion. Every target has a node; source proofs not fully extracted terminate in the listed gaps.

**Planets:** Higher local reciprocity, Higher reciprocity isomorphism, Higher local existence theorem, Reciprocity and profinite completion.

<a id="HL-3-reciprocity-map"></a>
### Higher local reciprocity map

`HL.3/reciprocity-map` · construction · unchecked

Define Art_F:K_n^M(F)→G_F^ab by χ(Art_F(x))=inv_F(χ∪h_n(x)) for every finite-order continuous character χ of G_F. Here h_n is the imported cohomological/differential symbol. Norm on K-groups corresponds to restriction on Galois groups, restriction of symbols to Galois transfer. At n=0, Art_{F_q}(a)=Frob_q^a; at n=1 compare with the imported ordinary arithmetic Artin map.

**Hypotheses and conventions.** Finite-end n-local fields. Characters are finite-order; the target is the profinite abelian Galois group. There is no assumed locally compact topology on F.

**Proof route.**

1. For each coefficient exponent the invariant pairing gives an evaluation functional on the finite-order character group. The canonical evaluation dual of the discrete torsion character group is G_F^ab.
2. Check coefficient compatibility and the norm/projection formula, then prove the residue recursion using the normalized top invariant. Ordinary n=1 reciprocity is imported from CFT.6–7; equal-characteristic p-primary existence comes from FA.4.

**Prerequisites.** [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), [HL.2/restriction-corestriction](#HL-2-restriction-corestriction), [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `FunctionFieldArithmetic:FA.4/local-abelian-existence`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/milnor-projection-formula`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §5.2, pp. 56–57: Cohomological reciprocity and transfer squares.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §5.2, Theorem 5.8, pp. 34–35: Residue recursion and finite-field normalization.

**API.**

- `HigherReciprocity.artin` (constructor): Canonical homomorphism on K_n^M.
- `HigherReciprocity.evaluate` (characterisation): Evaluation by χ is the invariant cup product.
- `HigherReciprocity.norm` (functoriality): Art_F∘N=restriction∘Art_L.
- `HigherReciprocity.residue` (compatibility): Reduction to the first residue field commutes with ∂.

**Uses.** HL.4 Hilbert pairing: Defines its arithmetic normalization. HL.6 local-to-global: Supplies the flagwise local maps.

**Tests a wrong definition must fail.**

- `check_1`: For F_q the source is Z and 1 maps to Frob_q.
- `check_2`: For F_q((u))((t)), {u,t} acts by arithmetic Frobenius on the extension of the final constants.
- `check_3`: A principal-unit symbol has zero iterated valuation, hence acts trivially on the purely unramified constant extension.

**Acceptance.** For n=1, uniformizers act as arithmetic Frobenius on unramified extensions.


<a id="HL-3-isomorphism-theorem"></a>
### Finite higher reciprocity isomorphism

`HL.3/isomorphism-theorem` · theorem · unchecked

For a finite abelian extension L/F of n-local fields, Art induces K_n^M(F)/N_{L/F}K_n^M(L)≃Gal(L/F). After norm/topology descent the same quotient statement holds for K_n^top. The index equals [L:F].

**Hypotheses and conventions.** Finite abelian L/F inside a fixed separable closure; arbitrary finite extensions are not replaced by their Galois group without an abelianization theorem.

**Proof route.**

1. Reduce by towers and prime-degree cyclic extensions. The tame and constant parts use the iterated residue and finite-field norm. The wild part uses nondegenerate character/Milnor pairings and cyclic norm exactness.
2. Prove the two norm/evaluation inclusions, then surjectivity and exact kernel at each finite character quotient. The all-prime wild proof dependencies are G03/G05.

**Prerequisites.** [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.2/finite-coefficient-duality](#HL-2-finite-coefficient-duality), [HL.1/norms-and-projection-formulas](#HL-1-norms-and-projection-formulas), [HL.1/topological-versus-algebraic-k-groups](#HL-1-topological-versus-algebraic-k-groups), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `FunctionFieldArithmetic:FA.4/local-abelian-existence`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §5.2, isomorphism theorem, p. 57; I §10.3, pp. 98–99: Finite norm quotient.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), Theorem 5.8(i), p. 34: Algebraic Milnor statement.

**Acceptance.** For a constant extension of final degree d the quotient on the valuation factor is Z/d.

**Direct open inputs.** [G05](#g05). Other gaps propagate through the prerequisites.

<a id="HL-3-parshin-reciprocity-in-characteristic-p"></a>
### Parshin reciprocity and Witt characters

`HL.3/parshin-reciprocity-in-characteristic-p` · comparison · unchecked

For characteristic-p n-local F, construct the wild finite-exponent component from the pairing K_n^top(F)/p^s×W_s(F)/(F−1)→Z/p^s. Combine it with the prime-to-p tame and Z valuation components, and prove equality with the cohomological Art_F by evaluation on all characters.

**Hypotheses and conventions.** Finite last residue F_q. The ordinary n=1 Schmid–Witt/Artin comparison is FA.4’s result; HL.3 adds the n-fold residue comparison.

**Proof route.**

1. Use the Parshin expansion to reduce evaluation to its principal-unit generators. Identify Witt characters through the imported Artin–Schreier–Witt quotient.
2. Compare each residue evaluation with the invariant cup product, then glue compatible finite-exponent maps.

**Prerequisites.** [HL.1/parshin-structure-of-the-topological-k-group](#HL-1-parshin-structure-of-the-topological-k-group), [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.4/artin-schreier-witt-acceptance-computation](#HL-4-artin-schreier-witt-acceptance-computation), `FunctionFieldArithmetic:FA.3/artin-schreier-witt-quotient`, `FunctionFieldArithmetic:FA.4/schmid-witt-artin-comparison`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §7.3–7.5, pp. 77–79: Witt pairing and gluing of reciprocity components.

**Acceptance.** The n=1 specialization agrees with FA.4’s arithmetic Artin map, including its p-primary component.


<a id="HL-3-artin-schreier-trees-and-the-explicit-construction"></a>
### Artin–Schreier trees and explicit reciprocity

`HL.3/artin-schreier-trees-and-the-explicit-construction` · construction · unchecked

A finite Galois p-extension L/F is an Artin–Schreier tree if it admits a tower F=F₀⊂⋯⊂F_r=L in which each F_i/F_{i−1} is cyclic of degree p and F_i=F_{i−1}(α_i) with α_i^p−α_i∈F_{i−1}. It is strong if every cyclic degree-p M/E inside L/F admits M=E(α), α^p−α∈E. This definition also applies in characteristic zero and imposes no extra valuation bounds. For finite abelian L/F the inverse reciprocity class of σ is N_{Σ/F}{t_1,…,t_n} modulo N_{L/F}, where Σ is the finite fixed field of an admissible Frobenius lift in L^pur.

**Hypotheses and conventions.** The polynomial shape in characteristic zero is not the characteristic-p Artin–Schreier exact sequence. The reversal in the source’s strong-tree sentence is recorded as E6. Choose a lift of σ acting on F^pur by a positive power of arithmetic Frobenius; its fixed field Σ in L^pur is finite over F.

**Proof route.**

1. Reduce a totally ramified finite Galois p-extension using a totally ramified finite p-extension Q/F with LQ/Q a strong tree and L^pur∩Q^pur=F^pur. This is stronger than merely extending the constant field.
2. Construct the norm class from parameters of Σ. Prove independence of the Frobenius lift and parameters by norm exactness, then compare with Art through explicit character evaluation. The strong-tree existence and descent proofs are G06.

**Prerequisites.** [HL.0/classification-and-standard-fields](#HL-0-classification-and-standard-fields), [HL.1/norms-and-projection-formulas](#HL-1-norms-and-projection-formulas), [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.4/vostokov-pairing-and-the-wild-existence-case](#HL-4-vostokov-pairing-and-the-wild-existence-case).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §10.1, p. 96; §10.3–10.4, pp. 98–99: Fixed-field norm construction and exact tree definitions and reduction properties.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), Remark 5.11, pp. 36–37: Fixed-field norm formula.

**API.**

- `ASTree.tower` (projection): The cyclic degree-p tower and its polynomial generators.
- `ASTree.strong` (characterisation): Every degree-p subextension has the stated presentation.
- `ASReciprocity.frobeniusLift` (data): Admissible lifts and the associated finite fixed-field data.
- `ASReciprocity.normClass` (constructor): The norm of the parameter symbol modulo the norm subgroup.
- `ASReciprocity.independent` (characterisation): Changing parameters or admissible lift leaves the class unchanged.
- `ASReciprocity.inverse` (compatibility): The constructed class is inverse to the finite arithmetic Artin isomorphism.

**Uses.** HL.3 explicit construction target: Provides the second construction to compare with Kato’s map. HL.4 explicit formulas: Uses the wild pairings to prove independence.

**Tests a wrong definition must fail.**

- `check_1`: For a trivial extension the norm class is zero in the quotient.
- `check_2`: For an unramified degree d extension the Frobenius generator corresponds to the class of {t_1,…,t_n}.
- `check_3`: Changing one parameter by a principal unit must leave the class modulo the norm subgroup unchanged; equality before taking that quotient is not required.

**Acceptance.** In a purely unramified extension, the construction reduces to the parameter valuation exponent.

**Direct open inputs.** [G06](#g06). Other gaps propagate through the prerequisites.

<a id="HL-3-existence-theorem"></a>
### Higher local existence theorem

`HL.3/existence-theorem` · theorem · unchecked

Finite abelian subextensions L/F of a fixed separable closure correspond bijectively to finite-index categorically open subgroups N≤K_n^M(F), by L↦N_{L/F}K_n^M(L). Inclusion of extensions reverses inclusion of norm groups, [L:F]=[K_n^M(F):N], and intersections of norm groups correspond to composita. A version using open subgroups of K_n^top requires the stated topology comparison.

**Hypotheses and conventions.** Use the exact categorical openness of HL.0. The n=1 full equal-characteristic p-primary branch is imported from FA.4/local-abelian-existence; CFT.8 supplies its stated ordinary arithmetic scope.

**Proof route.**

1. The finite isomorphism theorem proves injectivity and the index formula. Kato’s finite-order character theorem shows each open finite quotient is represented by a finite subgroup of Galois characters; intersect their kernels to construct L.
2. Use finite conductor and prime-power lifting for the wild existence direction. The all-prime proof and the comparison with λ_n are G03 and G02, respectively.

**Prerequisites.** [HL.3/isomorphism-theorem](#HL-3-isomorphism-theorem), [HL.2/finite-coefficient-duality](#HL-2-finite-coefficient-duality), [HL.0/pro-ind-finite-objects](#HL-0-pro-ind-finite-objects), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `FunctionFieldArithmetic:FA.4/local-abelian-existence`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Kato existence, Theorem 1, p. 165, and proof §§3–5, pp. 174–194: Existence for categorical finite-index open subgroups.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §10.5, unnumbered Existence Theorem, p. 100: The norm-subgroup existence statement; the nearby Theorem 3 concerns residue compatibility instead.

**Acceptance.** At n=1 this recovers the existing local correspondence, including p-primary characteristic-p norm groups.

**Direct open inputs.** [G02](#g02), [G03](#g03). Other gaps propagate through the prerequisites.

<a id="HL-3-kernel-and-completion-statements"></a>
### Reciprocity kernel and completion

`HL.3/kernel-and-completion-statements` · construction · unchecked

The algebraic Art_F has dense image. Its kernel is the intersection of finite abelian norm subgroups. The inverse limit of the corresponding finite quotients, equivalently of the categorically open finite-index quotients by existence, is canonically G_F^ab. When the categorical/λ_n comparison and divisible-kernel theorem apply, Art factors through an injective dense map K_n^top(F)→G_F^ab with algebraic kernel Λ_n; its topological source is not generally the whole Galois group.

**Hypotheses and conventions.** The completion is explicitly taken over the qualifying open finite-index quotients. Do not silently complete over arbitrary abstract finite-index subgroups.

**Proof route.**

1. Each finite Galois projection is onto by the isomorphism theorem, giving density. Its kernel is the corresponding norm group.
2. Take the inverse limit over finite abelian subextensions; use existence to replace this index by open finite-index subgroups. Identify Λ_n only with G02/G05’s topological comparison.

**Prerequisites.** [HL.3/existence-theorem](#HL-3-existence-theorem), [HL.1/topological-versus-algebraic-k-groups](#HL-1-topological-versus-algebraic-k-groups), [HL.0/pro-ind-finite-objects](#HL-0-pro-ind-finite-objects).

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §10.5, Corollary 1 and the unnumbered Existence Theorem, p. 100, with source issue E4: Absolute target, density, injectivity after the topological quotient.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §5.2, Theorem 5.8 and Remarks 5.10–5.11, pp. 34–37: Finite quotient and existence passage.

**API.**

- `HigherReciprocity.completion` (constructor): Inverse limit over categorical open finite-index quotients.
- `HigherReciprocity.completionEquiv` (equivalence): The completed map is an isomorphism to G_F^ab.
- `HigherReciprocity.kernel` (characterisation): Kernel equals the intersection of finite norm groups.
- `HigherReciprocity.dense` (characterisation): Every finite Galois projection of the image is onto.

**Uses.** HL.7 completed comparisons: Specifies exactly which source is completed. HL.6 global reciprocity: Prevents an analogous dense/global map from being declared onto without its own topology theorem.

**Tests a wrong definition must fail.**

- `check_1`: On the purely unramified direction the map is Z→Ẑ, so density must not be replaced by surjectivity.
- `check_2`: The kernel of the finite projection to Gal(L/F) is the norm subgroup, which contains more than the absolute kernel unless L is the full abelian closure.
- `check_3`: A parameter symbol with δ=1 has nontrivial image in every constant quotient of degree>1, so it is outside the absolute kernel.

**Acceptance.** Already for n=0, Z→Ẑ has dense image and is not onto.


<a id="HL-3-unramified-acceptance-case"></a>
### Unramified higher reciprocity

`HL.3/unramified-acceptance-case` · application · unchecked

For an unramified constant extension L/F of final residue degree d, Art_F(x)|_L=Frob_q^{δ_F(x)} and K_n^M(F)/NK_n^M(L)≃Z/d. In F_q((u))((t)), {u,t} maps to Frob_q and {t,u} to its inverse.

**Hypotheses and conventions.** “Constant unramified” means unramified through the whole residue tower; a single outer-unramified extension can have nontrivial lower ramification.

**Proof route.**

1. Iterate the residue compatibility of Art to F_q, then use the finite-field normalization and δN=fδ.

**Prerequisites.** [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.3/isomorphism-theorem](#HL-3-isomorphism-theorem), [HL.1/iterated-residue-with-signs](#HL-1-iterated-residue-with-signs).

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), Theorem 5.8(ii)–(iii), pp. 34–35: Residue recursion to the finite field.

**Acceptance.** A symbol of principal outer units acts trivially on this constant extension, but need not act trivially on every outer-unramified extension.


## HL.4

Arithmetic tame/Hilbert normalization, odd-p Vostokov formula, scoped higher ramification, completed exponential and Witt residue pairing. Every target has a node; source proofs not fully extracted terminate in the listed gaps.

**Planets:** Higher tame symbol, Vostokov pairing, Higher ramification filtrations, Kurihara exponential map.

<a id="HL-4-higher-tame-symbol"></a>
### Higher tame and arithmetic norm-residue symbols

`HL.4/higher-tame-symbol` · construction · unchecked

For m|(q−1), define the arithmetic tame pairing K_n^M(F)/m×F×/(F×)^m→μ_m(F) by the invariant cup-product convention Art_F(x)(a^{1/m})/a^{1/m}. Its residue formula is Teich(δ_F{a,x})^{(q−1)/m}; the entry a is prepended to x. The unreduced higher tame symbol is δ_F:K_{n+1}^M(F)→F_q×.

**Hypotheses and conventions.** Finite last residue F_q and m prime to p with μ_m⊂F. The unreduced tame symbol itself has no division by m. For n=1 the arithmetic pairing with x=π and a a unit equals ā^{(q−1)/m}; using {x,a} reverses this value.

**Proof route.**

1. Import the ordinary DVR tame symbol and iterate. Compute the exponent from arithmetic Frobenius acting on an m-th root of the residue unit.
2. Prove the Steinberg relation and norm adjunction through imported Milnor transfer; compare with the ordinary Hilbert symbol from L.3 at n=1.

**Prerequisites.** [HL.1/iterated-residue-with-signs](#HL-1-iterated-residue-with-signs), [HL.3/reciprocity-map](#HL-3-reciprocity-map), `K2SymbolsBrauer:T.3/higher-milnor-residues`, `KTheoryFiniteLocalFields:L.3`, `K2SymbolsBrauer:T.4/complete-norm-residue`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §6.4.2, p. 65: Higher tame pairing and final residue exponent; argument order calibrated here.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §8.2.1, p. 83; §8.4, p. 87: The higher Hilbert-symbol definition and its reciprocity interpretation; §8.1, p. 81, treats ordinary local fields only.

**API.**

- `HigherTame.symbol` (constructor): The degree n+1 iterated tame map.
- `HigherTame.arithmeticPairing` (constructor): The reduced norm-residue pairing with a prepended.
- `HigherTame.parameters` (simp): Evaluation on a residue unit and parameter symbol.
- `HigherTame.normAdjunction` (compatibility): Pairing N(x) with a equals pairing x with res(a).

**Uses.** HL.3 tame component: Calibrates arithmetic reciprocity. HL.5 flags: Gives the local boundary convention used in reciprocity relations.

**Tests a wrong definition must fail.**

- `check_1`: For n=1, x=π and a a unit, the value is ā^{(q−1)/m}; swapping the two symbol entries inverts it.
- `check_2`: On F_q((u))((t)), δ{a,u,t}=a and δ{a,t,u}=a⁻¹.
- `check_3`: A Steinberg symbol {b,1−b,…} has trivial tame value wherever the entries are defined.

**Acceptance.** For a∈F_q× and x={u,t}, the value is a^{(q−1)/m}.


<a id="HL-4-explicit-formulas-for-the-hilbert-symbol"></a>
### Higher Hilbert symbols and normalization

`HL.4/explicit-formulas-for-the-hilbert-symbol` · construction · unchecked

For m invertible in F and μ_m⊂F, define (x,a)_m=Art_F(x)(α)/α, α^m=a, on K_n^M(F)/m×F×/(F×)^m. It is independent of α, bilinear, compatible with norms/restrictions and coefficient changes. Specify the tame formula separately from the wild mixed-characteristic expression; the latter requires the sign comparison in G07.

**Hypotheses and conventions.** Fix arithmetic Artin and an identification of the cyclic roots when an exponent-valued formula is used. In characteristic p, p-power symbols use the additive Witt pairing instead.

**Proof route.**

1. Use Kummer theory and the finite Artin map. Show independence from α and functoriality by evaluating characters.
2. Import the entire one-local Hilbert symbol API from L.3/CFT and state only the higher-degree comparison here.

**Prerequisites.** [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.4/higher-tame-symbol](#HL-4-higher-tame-symbol), `KTheoryFiniteLocalFields:L.3`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §8.2.1, p. 83; §8.4, p. 87: Higher-dimensional Hilbert pairing and its identification with reciprocity.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §9.2, pp. 92–93: Relation to exponential formulas in dimension one.

**API.**

- `HigherHilbert.pairing` (constructor): The Kummer evaluation pairing.
- `HigherHilbert.rootIndependent` (characterisation): All m-th root choices give the same μ_m value.
- `HigherHilbert.norm` (compatibility): Norm in the Milnor entry is adjoint to restriction in the Kummer entry.
- `HigherHilbert.tameFormula` (compatibility): When m|(q−1), the formula is the prepended iterated tame symbol.

**Uses.** HL.4 Vostokov comparison: Fixes the target normalization. HL.7 ordinary symbols: Tests the n=1 specialization.

**Tests a wrong definition must fail.**

- `check_1`: If a=b^m, the value is 1 for every x.
- `check_2`: If x is m times another class, the value is 1 for every a.
- `check_3`: On an unramified constant extension, the parameter symbol acts by arithmetic Frobenius, fixing the inverse/sign ambiguity in any explicit formula.

**Acceptance.** For n=1 recover the existing local Hilbert symbol with exactly the selected arithmetic convention.

**Direct open inputs.** [G07](#g07). Other gaps propagate through the prerequisites.

<a id="HL-4-vostokov-pairing-and-the-wild-existence-case"></a>
### Vostokov explicit pairing

`HL.4/vostokov-pairing-and-the-wild-existence-case` · theorem · unchecked

Let F be mixed-characteristic n-local with first residue characteristic p>2 and μ_{p^s}⊂F. In the standard parameter presentation lift entries a_j to multiseries over Frac W(F_q), let Δ act by Witt Frobenius and T_i↦T_i^p, set l(a)=p⁻¹log(a^p/a^Δ), and S=ζ̃_{p^s}^{p^s}−1. Define Φ=Σ_{i=1}^{n+1}(−1)^{n−i+1}p^{−(n−i+1)}l(a_i) dlog a_1∧⋯∧dlog a_{i−1}∧dlog a_{i+1}^Δ∧⋯∧dlog a_{n+1}^Δ. Then ζ_{p^s}^{Tr res(Φ/S)} is a well-defined nondegenerate sequentially continuous pairing K_n^top(F)/p^s×F×/(F×)^{p^s}→μ_{p^s}, independent of the permitted lifts.

**Hypotheses and conventions.** The source proves the symbol theorem for odd p; it does not furnish a p=2 formula. Keep the lift, residue order, root of unity and the source’s convention fixed. The source compares this pairing to the Hilbert symbol only up to sign in the cited remark. Exact equality with our arithmetic Hilbert pairing is a separate comparison target G07.

**Proof route.**

1. Check convergence and integrality of Tr res(Φ/S) modulo p^s. Use changes of lifts and exact differentials to prove independence and the Steinberg relation.
2. Prove nondegeneracy on the explicit principal-unit generators. The annihilator theorem in §8.4 identifies finite Kummer subgroups with open finite-index norm conditions; using it for arithmetic existence requires the normalization comparison.

**Prerequisites.** [HL.0/teichmueller-representatives-and-expansions](#HL-0-teichmueller-representatives-and-expansions), [HL.1/filtration-on-milnor-k-groups](#HL-1-filtration-on-milnor-k-groups), [HL.4/explicit-formulas-for-the-hilbert-symbol](#HL-4-explicit-formulas-for-the-hilbert-symbol), `KTheoryFiniteLocalFields:L.5`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §8.3, Theorems 1–2, pp. 85–86; §8.4, p. 87: Explicit Φ formula, well-definedness and finite annihilator theorem.

**Acceptance.** When any a_j is a p^s-th power the pairing is trivial; tame/unramified calibration determines whether the formula or its inverse agrees with arithmetic Artin.

**Direct open inputs.** [G07](#g07). Other gaps propagate through the prerequisites.

<a id="HL-4-ramification-filtrations-and-their-indexing"></a>
### Higher ramification and its Milnor image

`HL.4/ramification-filtrations-and-their-indexing` · construction · unchecked

For a complete DVR with residue p-rank one and a chosen constant subfield, use Zhukov’s ordered labels −1,0,(c,s),(i,r), and in the two-local refinement add rational pairs (a,b), b>0, ordered by the outer coordinate. In the standard ferocious case set G_(i,r)={σ:v(σt−t)>r}; for the rank-two refinement use v(t⁻¹σt−1)>(a,b). Define upper groups through the inverse generalized Herbrand function. For characteristic-p two-local fields over a quasi-finite end field, build the Milnor filtration from Q_α generated by {π_k,u} with v(u−1)>α and S_α=Cl⋃_{r≥0}{x:p^r x∈Q_{p^rα}}. Art maps its α-th term onto G^α in each finite abelian quotient.

**Hypotheses and conventions.** This is a scoped two-dimensional theorem, not an all-dimensional numerical ramification theory. Constant-field choices matter in characteristic p. Use strict > in the defining tests. The source prints integral constant labels but later integrates and uses rational ones; a consistent rational interpolation is required in G08.

**Proof route.**

1. Separate unramified, almost constant and ferocious parts using Epp. Define the lower groups in standard form and prove independence of the chosen standardizing constant extension.
2. The constant Herbrand branch divides its integral by e(L/F); the ferocious branch integrates |G_(i,t)| without that factor. Prove lower subgroup and upper quotient compatibility.
3. Use the norm theorem for S_α and cyclic prime-degree computation to prove Art(fil_α)=G^α. Source’s Theorem 1 gives norm-image index |G_α| in fil_{Φ(α)}.

**Prerequisites.** [HL.0/rank-valuation-ring](#HL-0-rank-valuation-ring), [HL.1/filtration-on-milnor-k-groups](#HL-1-filtration-on-milnor-k-groups), [HL.3/isomorphism-theorem](#HL-3-isomorphism-theorem), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `tauceti:TauCeti.Place.ramificationGroup`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §17.1–17.4, pp. 143–150, especially pp. 145–149 and Theorems 1–2: Constant/ferocious labels, strict inequalities and Milnor ramification image.

**API.**

- `HigherRamification.lower` (constructor): Lower groups with explicit constant and ferocious branches.
- `HigherRamification.herbrand` (data): Increasing piecewise integral reindexing with the stated normalization.
- `HigherRamification.upperQuotient` (compatibility): Upper numbering passes to Galois quotients.
- `HigherRamification.milnorImage` (compatibility): Art(fil_α) is the α-th upper ramification group.

**Uses.** HL.4 ramification target: Relates unit symbols to actual upper Galois subgroups. HL.6 wild modulus: Records the conductor information needed for ramification bounds.

**Tests a wrong definition must fail.**

- `check_1`: For AS t^{−i} the break is a constant label, whereas AS t^{−pi}u has a ferocious label; a single integer list fails to distinguish them.
- `check_2`: Replacing u by u^p in AS t^{−i}u changes the refined break from (i,i/p) to (i,i/p²).
- `check_3`: In the standard ferocious case, if v(σt−t)=r₀>0, then σ is excluded from G_(i,r₀) and belongs to G_(i,r) for 0<r<r₀. Replacing the defining strict inequality by ≥ fails this boundary test.

**Acceptance.** Over F_p((u))((t)) with constant field F_p((t)), AS equations b^p−b=t^{−i}, t^{−pi}u, t^{−i}u, t^{−i}u^p (p∤i) have respective breaks (c,i), (i,i), (i,i/p), (i,i/p²).

**Direct open inputs.** [G08](#g08). Other gaps propagate through the prerequisites.

<a id="HL-4-kurihara-exponential-and-differential-forms"></a>
### Kurihara exponential maps

`HL.4/kurihara-exponential-and-differential-forms` · construction · unchecked

For a mixed-characteristic complete DVR field E, η∈E with ord_pη>2/(p−1), and q≥1, construct exp_η^q:Ω̂_{O_E}^{q−1}→K̂_q^M(E), where hats denote p-adic completion. On logarithmic generators it sends a dlog b_1∧⋯∧dlog b_{q−1} to {exp(ηa),b_1,…,b_{q−1}}. This works for imperfect residue fields. For E{{T}} the completed differential residue and Kato’s completed Milnor residue commute with exp, with ∂{a,T}=a.

**Hypotheses and conventions.** The domain has degree q−1; the source’s displayed Ω̂^q on p. 92 is the misprint recorded in E5. Multiplicative symbol entries are units for the displayed formula; the extended formula for nonunits is separately justified. The strict η bound is the theorem’s sufficient bound. A general kernel formula is not claimed.

**Proof route.**

1. Use the p-adic exponential on its convergence ball. Multilinearity and differential relations yield the map on completed forms, with the stronger η bound controlling symbol congruences.
2. For the residue square evaluate logarithmic generators and use continuity/completion. The original [Ku3] construction proof and complete residue interface remain G09.

**Prerequisites.** [HL.0/standard-mixed-series](#HL-0-standard-mixed-series), `K2SymbolsBrauer:T.2/milnor-k-theory`, `KTheoryFiniteLocalFields:L.5`, `mathlib:UniformSpace.Completion`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §9.1, theorem, pp. 91–92; §9.2, p. 93: Exponential symbol formula and residue square, with corrected degree.

**API.**

- `KuriharaExponential.map` (constructor): Completed differential-to-Milnor homomorphism.
- `KuriharaExponential.logGenerator` (simp): Value on a dlog wedge.
- `KuriharaExponential.residue` (compatibility): The E{{T}} residue square commutes.
- `KuriharaExponential.continuous` (compatibility): The map respects the p-adic completions.

**Uses.** HL.4 explicit formulas: Converts deep unit symbols into differential residues. HL.2 differential comparison: Tests compatibility of completed residues.

**Tests a wrong definition must fail.**

- `check_1`: For q=1, a=0 maps to the neutral unit; a nonzero small a need not map to the neutral unit.
- `check_2`: For q=2 on E{{T}} with a∈O_E and η∈E, exp_η^2(a dlog T)={exp(ηa),T}; its completed T-residue is exp(ηa). This is Kato’s completed residue, not the outer uniformizer boundary, since T is an outer unit.
- `check_3`: A differential map starting in Ω̂^q would give the wrong degree already at q=1; the strict η convergence bound cannot be omitted.

**Acceptance.** At q=1 the map starts on Ω̂^0=Ô_E and sends a to exp(ηa); at q=2 it starts on one-forms.

**Direct open inputs.** [G09](#g09). Other gaps propagate through the prerequisites.

<a id="HL-4-artin-schreier-witt-acceptance-computation"></a>
### Artin–Schreier–Witt residue pairing

`HL.4/artin-schreier-witt-acceptance-computation` · construction · unchecked

For characteristic-p n-local F with finite last residue F_q, define [x,w]_s=Tr_{W_s(F_q)/W_s(F_p)} res(dlog x_1∧⋯∧dlog x_n multiplied by w) in Z/p^s for x={x_1,…,x_n}. Interpret the residue in the lifted de Rham–Witt complex, not by naïve coefficientwise Witt-vector multiplication. It descends to K_n^top(F)/p^s×W_s(F)/(F−1) and is compatible with restriction/Verschiebung and norm/trace.

**Hypotheses and conventions.** s≥1. At s=1 this is the ordinary iterated differential residue of w dlog x_1∧⋯∧dlog x_n. Higher length uses the source’s Witt lift/residue construction.

**Proof route.**

1. Use the log-Witt residue and trace, show Steinberg relations and Frobenius-minus-one annihilation, then descend through the topological kernel.
2. Reduce the n=1 comparison to FA.4’s Schmid–Witt theorem. Test the n=2 orientation on constants and on one nontrivial Laurent AS class.

**Prerequisites.** [HL.2/logarithmic-de-rham-witt-coefficients](#HL-2-logarithmic-de-rham-witt-coefficients), [HL.1/topological-milnor-k-groups](#HL-1-topological-milnor-k-groups), `FunctionFieldArithmetic:FA.3/artin-schreier-witt-quotient`, `FunctionFieldArithmetic:FA.4/schmid-witt-artin-comparison`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §6.4.3, p. 66; I §7.3, p. 77: Finite-length Witt pairing, trace, residue and compatibility.

**API.**

- `HigherWittPairing.pair` (constructor): The finite-length symbol/Witt pairing.
- `HigherWittPairing.frobeniusQuotient` (characterisation): A Witt vector in (F−1)W_s(F) pairs to zero.
- `HigherWittPairing.coefficientChange` (compatibility): Restriction and Verschiebung give the prescribed coefficient transitions.
- `HigherWittPairing.normTrace` (compatibility): Milnor norm is adjoint to the Witt restriction; the corresponding trace identity holds.

**Uses.** HL.3 Parshin comparison: Provides the wild character evaluations. Dittmann–Pop wild coefficients: Tests that the characteristic-p coefficient shift retains wild classes.

**Tests a wrong definition must fail.**

- `check_1`: For w=b^p−b at length one the residue trace is zero for every symbol.
- `check_2`: For F_q((u))((t)), [{u,t},c]_1=Tr(c), and swapping u,t negates the value.
- `check_3`: For w=t^{−1}, the symbol {u,1+t} gives residue of t^{−1}(du/u)∧dt/(1+t), namely 1 over F_p; the class is detected rather than erased as an ordinary μ_p class.

**Acceptance.** At length one, [ {u,t},c ]=Tr_{F_q/F_p}(c); if Tr(c)=1 the value is 1.


## HL.5

All-branch Parshin factors, recursive adeles and resolution, local/global residue and Q relations, modulus class groups, Nisnevich comparison, finite pushforward and surface/dimension-one computations. Every target has a node; source proofs not fully extracted terminate in the listed gaps.

**Planets:** Parshin chains, Higher adeles, Higher idelic class groups.

<a id="HL-5-parshin-chains"></a>
### Parshin chains and all local branches

`HL.5/parshin-chains` · definition · unchecked

On an excellent integral scheme X with dimension function d and d_min=min_x d(x), a Parshin chain P=(p_0,…,p_s) has p_i∈closure{p_{i+1}} and d(p_i)=d_min+i. Relative to U=X∖D require p_i∈D for i<s and p_s∈U. Recursively henselize the local ring at p_0 and localize at every prime above p_1, then henselize each resulting local ring, continuing along P. The residue product k_h(P) retains every branch. The completed construction instead alternates completions and semilocal localization and gives a finite product of higher local fields for complete arithmetic flags.

**Hypotheses and conventions.** Kerz orders points special-to-general. Beilinson/Morrow chains are the reversed generic-to-special tuples. Record the reversal explicitly. For the completed higher-local assertion X is reduced, excellent, finite dimensional and essentially of finite type over Z; require the flag complete. Henselian factors are not identified with their completions as fields.

**Proof route.**

1. Use the dimension function to specify allowed flags and omissions. Define the branchwise recursion by products over all primes, so normalization splitting is retained.
2. For regular flags use the completion/localization induction; in general use reduced semilocal chains and excellence to retain reducedness and finite branch sets. The commutative-algebra supplier proof is G10.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `mathlib:IsAdicComplete`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2/nisnevich-points-henselization`, [HL.0/n-dimensional-local-field](#HL-0-n-dimensional-local-field).

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), §3, Definitions 3.1–3.2 and recursive henselization, pp. 4–5: Dimension functions, relative chains and iterated henselization.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §6, pp. 37–43; §7, Theorem 7.5, Corollary 7.6 and Remark 7.7, pp. 44–46: Completed flags with all branches.

**API.**

- `ParshinChain.points` (projection): The ordered tuple and its dimension conditions.
- `ParshinChain.henselianFactors` (constructor): Finite product of the recursive henselian branch fields.
- `ParshinChain.completedFactors` (constructor): Alternating completion/localization over all branches.
- `ParshinChain.reverse` (compatibility): Converts special-first to generic-first conventions.

**Uses.** HL.5 Milnor ideles: Indexes the correct degree at every chain. HL.6 reciprocity relations: Supplies all normalization branches for boundary sums.

**Tests a wrong definition must fail.**

- `check_1`: A smooth surface flag (closed point x, curve y, generic η) has dimensions 0,1,2 in the Kerz convention.
- `check_2`: At a node of a curve the completed normalization has two branches, and both appear in the local product.
- `check_3`: At dimension one, the completed flag factor is the fraction field of the completed local DVR, while the henselian factor uses the henselization.

**Acceptance.** A singular flag can have more than one local field factor; a construction retaining only one prime is rejected.

**Direct open inputs.** [G10](#g10). Other gaps propagate through the prerequisites.

<a id="HL-5-higher-adeles"></a>
### Beilinson higher adeles

`HL.5/higher-adeles` · construction · unchecked

For a Noetherian scheme X, quasi-coherent M, and a set T of generic-first chains of length r, define A_X(T,M) by the following recursion: it commutes with filtered colimits in M; for coherent M and r=0 it is ∏_{x∈T}M̂_x; for coherent M and r>0 it is ∏_{x∈X}lim_a A_X(_xT,(j_{a,x})_*(j_{a,x})^*M), where j_{a,x}:Spec(O_{X,x}/m_x^a)→X and _xT removes the first x. The empty chain set gives zero. These rules uniquely define exact functors, with an injection into the product of singleton local factors.

**Hypotheses and conventions.** The Noetherian and quasi-coherent hypotheses are part of the construction. The limit/colimit order is fixed. The higher restricted product is the image of this recursive functor; it is not generally “integral at all but finitely many complete flags”.

**Proof route.**

1. Reduce quasi-coherent modules to filtered colimits of coherent submodules. At each positive chain length apply the fat-point inverse limit and then recurse.
2. Prove well-definedness, exactness and singleton factor injection by the Noetherian module completion theorem; Huber’s full argument is a named proof input G11.

**Prerequisites.** [HL.5/parshin-chains](#HL-5-parshin-chains), `SchemeAndStackFoundations:SF.0`, `mathlib:IsAdicComplete`, `mathlib:RestrictedProduct`.

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §8.1, rules A1–A4 and Remark 8.3, pp. 53–55; §8.2 Lemma 8.4, p. 55: Exact recursive definition and restricted-product embedding.

**API.**

- `HigherAdeles.functor` (constructor): The exact quasi-coherent-module functor for T.
- `HigherAdeles.singleton` (characterisation): A singleton chain gives its iterated local completion.
- `HigherAdeles.productEmbedding` (coercion): Canonical injective map into ∏_{ξ∈T}A({ξ},M).
- `HigherAdeles.filteredColimit` (compatibility): Compatibility with filtered colimits in M.
- `HigherAdeles.face` (functoriality): Deleting a chain entry gives the natural adelic face map.

**Uses.** HL.5 surface computation: Specifies the precise restrictedness conditions. HL.7 coherent cohomology consumer: Uses the adelic resolution.

**Tests a wrong definition must fail.**

- `check_1`: For T empty the adele group is zero, not the product over all scheme points.
- `check_2`: For X=Spec F and M=F, A({generic},M)=F.
- `check_3`: For an arithmetic curve, the finite complete-flag adeles are the usual restricted product of local fields relative to integral rings; archimedean factors are added by the number-field interface.
- `check_4`: On a surface the uniform divisor bound and the per-curve congruence condition are both necessary; a single cofinite-flag condition is insufficient.

**Acceptance.** For coherent M the order ∏_x lim_a followed by recursive filtered colimits must remain unchanged.

**Direct open inputs.** [G11](#g11). Other gaps propagate through the prerequisites.

<a id="HL-5-adelic-resolution"></a>
### Adelic resolution and cohomology

`HL.5/adelic-resolution` · theorem · unchecked

For a Noetherian scheme X and quasi-coherent M, the reduced-chain adelic sheaves A_X(S_red^r,M), with the alternating sums of face maps, give a flasque resolution of M. Therefore the global adele complex computes H^r(X,M).

**Hypotheses and conventions.** Use generic-first ordered chains and alternating signs. Quasi-coherent sheaf cohomology here is distinct from the étale Kato complex.

**Proof route.**

1. The face identities imply d²=0. Check exactness on stalks by a local contracting homotopy and prove flasqueness from the restriction maps.
2. Use flasque acyclicity to compare global sections with derived sheaf cohomology. The complete well-definedness/exactness input from the adelic construction is G11.

**Prerequisites.** [HL.5/higher-adeles](#HL-5-higher-adeles), `SchemeAndStackFoundations:SF.2`.

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §8.3, Theorem 8.12 and Corollary 8.13, pp. 59–60: Reduced-chain adelic resolution.

**Acceptance.** For a curve the two-term adelic complex recovers the ordinary coherent cohomology computation.

**Direct open inputs.** [G11](#g11). Other gaps propagate through the prerequisites.

<a id="HL-5-residue-maps-along-a-flag"></a>
### Flag residues and branch sums

`HL.5/residue-maps-along-a-flag` · construction · unchecked

For each complete flag factor define the successive Milnor boundary and, in the prime-to-characteristic coefficient regime, the cohomological boundary, using the same outer-last orientation. When a closure is singular at the next point, normalize it, sum over every prime over that point and corestrict to its residue field. The component ∂_{y,x} is zero unless x specializes y by one dimension.

**Hypotheses and conventions.** Use only the coefficient regimes for which residues and the niveau identification are supplied. A local field factor map is not itself a reciprocity sum.

**Proof route.**

1. Compose imported DVR boundaries for a regular flag. Insert normalization branch products and residue-field norms/corestrictions in the general case.
2. Prove finite support before defining a direct-sum differential. Compare Milnor and cohomological boundaries via the imported symbol theorem, with wild comparison left in G04/G12.

**Prerequisites.** [HL.5/parshin-chains](#HL-5-parshin-chains), `K2SymbolsBrauer:T.3/higher-milnor-residues`, `K2SymbolsBrauer:T.3/finite-support`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), [HL.2/restriction-corestriction](#HL-2-restriction-corestriction).

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), §3–§5, pp. 4–7: Branchwise henselian residues and finite pushforward.; [Hasse principles for higher-dimensional fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf), §4, (4.3)–(4.4), pp. 41–42: Normalization and corestriction description of the boundary.

**API.**

- `FlagResidue.milnor` (constructor): Successive Milnor boundaries along a branch.
- `FlagResidue.normalization` (characterisation): The singular component is the sum of normalized branch residues with corestrictions.
- `FlagResidue.finiteSupport` (characterisation): A fixed class has only finitely many nonzero codimension-one residues.
- `FlagResidue.symbolCompatibility` (compatibility): The symbol comparison intertwines Milnor and cohomological boundaries.

**Uses.** HL.6 Kato differential: Defines actual matrix components. HL.5 finite direct image: Controls norm/residue order.

**Tests a wrong definition must fail.**

- `check_1`: For a smooth flag with parameters (u,t), the Milnor boundary of {u,t} is +1.
- `check_2`: For a nodal curve, two preimages of the node contribute to the same target through a sum.
- `check_3`: A class defined over one open subscheme has zero residue at every codimension-one point in that open.

**Acceptance.** At a singular curve point two branch residues are summed; one branch does not represent the component.

**Direct open inputs.** [G12](#g12). Other gaps propagate through the prerequisites.

<a id="HL-5-higher-idelic-and-cycle-complex-input"></a>
### Milnor ideles and Q-chain class groups

`HL.5/higher-idelic-and-cycle-complex-input` · construction · unchecked

For a relative chain set on U⊂X define I(U⊂X)=⊕_P K_{d(P)}^M(k_h(P)). Its topology is generated by the direct sums, over maximal chains, of canonical modulus subgroups generated by {1+a,u_2,…,u_d}, a in the relevant outer ideal power and all u_j integral units. Lower-dimensional summands are discrete. A Q-chain omits p_{s−1}; its relation uses inclusion when the inserted point lies in D, and the residue to the shortened chain when it lies in U. Define C(U⊂X)=coker Q with quotient topology, C(X,D) with the modulus quotient, and C(F;X)=lim_U C(U⊂X).

**Hypotheses and conventions.** Use Kerz’s dimension function and relative chains. The algebraic adele unit group A_X× is not substituted for this Milnor class group. The natural I(F;X)→C(F;X) has dense image; its surjectivity is not asserted. Canonical modulus topology and λ_n are different interfaces.

**Proof route.**

1. Define the direct sums with branch products and the exact degree d(P). Prove Q has finite support using the imported finite-support residue theorem.
2. Construct the quotient and transition maps for shrinking U; define the inverse limit topology. Compare the dimension-one class group with imported ideles.

**Prerequisites.** [HL.5/parshin-chains](#HL-5-parshin-chains), `K2SymbolsBrauer:T.3/higher-milnor-residues`, `K2SymbolsBrauer:T.3/finite-support`, `K2SymbolsBrauer:T.2/milnor-k-theory`, `FunctionFieldArithmetic:FA.2`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`.

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), §4, Definitions 4.2–4.3, p. 5; §5, Definition 5.2, p. 6; §6, Definitions 6.1–6.3, pp. 7–8: Milnor ideles, canonical topology and Q-chain quotient.

**API.**

- `HigherIdele.group` (constructor): The direct sum over relative chains.
- `HigherIdele.modulus` (constructor): The precisely generated canonical open subgroup.
- `HigherClassGroup.quotient` (constructor): The Q-chain cokernel with quotient topology.
- `HigherClassGroup.functionField` (constructor): Inverse limit over nonempty opens.
- `HigherClassGroup.denseFromIdeles` (characterisation): The inverse-limit idele map has dense image.

**Uses.** HL.6 global reciprocity: Provides the source and its actual relations. HL.5 Nisnevich comparison: Provides the idelic side of the comparison.

**Tests a wrong definition must fail.**

- `check_1`: For a regular curve, the only nontrivial Q relations reproduce principal ideles, giving the ordinary idele class group.
- `check_2`: If the inserted point is in U, the degree drops by one through a Milnor residue; an inclusion-only Q map has the wrong degree.
- `check_3`: The maximal-chain modulus uses the prescribed integral-unit entries; replacing every entry by an arbitrary field unit changes the defining topology and needs a comparison theorem.

**Acceptance.** A Q-chain missing a point in U contributes by a residue into a shorter chain, not by the same inclusion used for a point in D.


<a id="HL-5-nisnevich-class-group-comparison"></a>
### Nisnevich and idelic class groups

`HL.5/nisnevich-class-group-comparison` · comparison · unchecked

Let X be integral, proper and flat over the ring of integers of a number field or over a finite field, D an effective Cartier divisor, and U=X∖D smooth over the indicated base. For d=dim X, the Nisnevich relative Milnor sheaf class group H_Nis^d(X,K_d^M(O_X,I_D)) is canonically isomorphic to C(X,D), compatibly with the maps from closed-point cycles.

**Hypotheses and conventions.** Use the relative Milnor sheaf and the Nisnevich site; this is not ordinary singular cohomology or simply CH_0 without modulus.

**Proof route.**

1. Use the local punctured-spectrum comparison (Kerz Theorem 8.2), the coniveau boundary in Nisnevich cohomology, and the Q-chain presentation to identify the two cokernels.
2. Match the cycle generator maps and the boundaries from curves; the full relative Milnor sheaf/Gersten supplier is G10.

**Prerequisites.** [HL.5/higher-idelic-and-cycle-complex-input](#HL-5-higher-idelic-and-cycle-complex-input), `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.5`, `K2SymbolsBrauer:T.2/milnor-k-theory`.

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), §8, Definition 8.3 and Theorem 8.4, pp. 13–14; Theorem 8.2, pp. 11–13: Relative Nisnevich class group and idelic comparison.

**Acceptance.** For D=0 compare the closed-point cycle class with the unramified class group under the stated smoothness assumptions.

**Direct open inputs.** [G10](#g10). Other gaps propagate through the prerequisites.

<a id="HL-5-functoriality-and-direct-images"></a>
### Finite direct images of higher class groups

`HL.5/functoriality-and-direct-images` · theorem · unchecked

A finite morphism f:X′→X compatible with the dimension functions and carrying U′ to U induces a continuous pushforward on higher ideles. Its component along a longer source chain first takes the necessary Milnor residues and then the finite norm to the target chain; the component is zero if the chain points do not match. For finite dominant f it descends to class groups and is transitive.

**Hypotheses and conventions.** The dimension function, modulus pullback and open-pair compatibility are explicit. No pushforward for arbitrary morphisms is inferred from the finite construction.

**Proof route.**

1. Use residue finite support, norm transitivity and norm/residue compatibility to define the component sum. Prove the modulus subgroup maps into the required target modulus.
2. Check Q relations commute with this map, then use the quotient universal property.

**Prerequisites.** [HL.5/higher-idelic-and-cycle-complex-input](#HL-5-higher-idelic-and-cycle-complex-input), [HL.5/residue-maps-along-a-flag](#HL-5-residue-maps-along-a-flag), `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/complete-norm-residue`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `SchemeAndStackFoundations:SF.0`.

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), §5, pp. 6–7, and §6, p. 7: Finite pushforward formula, continuity and descent.

**Acceptance.** On a curve, the pushforward is the usual idele norm, including residue degree at a constant-field extension.


<a id="HL-5-acceptance-recover-ideles-and-list-surface-flags"></a>
### Curve and surface adelic computations

`HL.5/acceptance-recover-ideles-and-list-surface-flags` · application · unchecked

For a normal arithmetic curve recover the finite usual adele ring and the ordinary idele class group through the distinct additive and Milnor constructions. For a normal surface write O_x=Ō_{X,x}, F_x=O_x⊗_{O_{X,x}}F (a localization ring, not generally a field), O_y the completed codimension-one DVR, and O_{x,y} the complete semilocal branch ring with total fraction product F_{x,y}. A_{012} consists of families with a uniform effective divisor bound on poles and, for every curve y and integer r, f_{x,y}∈O_x+p_{x,y}^r for all but finitely many x∈closure(y). A_{12} has integral factors and the same congruence restriction for r≥0.

**Hypotheses and conventions.** Surface assumptions are Noetherian, integral, normal in codimension one; local higher-field assertions use excellence and arithmetic finite type. The divisor bound and per-curve congruence restriction are separate.

**Proof route.**

1. Unwind the recursive adele rules at dimensions one and two. Identify the divisor colimit and the completed per-curve restricted product in the prescribed order.
2. Compute the two flags at (p,t) in P^1_Z: the horizontal flag gives Q_p((t)), and the vertical flag gives Q_p{{t}}, retaining their different first residues.

**Prerequisites.** [HL.5/higher-adeles](#HL-5-higher-adeles), [HL.5/higher-idelic-and-cycle-complex-input](#HL-5-higher-idelic-and-cycle-complex-input), `FunctionFieldArithmetic:FA.2`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`, [HL.0/two-dimensional-examples](#HL-0-two-dimensional-examples).

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §8.4, Proposition 8.16, p. 62; §8.5, Proposition 8.19 and proof, pp. 63–65; §6, Example 6.10, pp. 41–42: Curve and surface restrictedness, and the horizontal/vertical arithmetic-surface flag calculations.

**Acceptance.** For P^2_{F_q}, the smooth flag through (u,t)=(0,0) and (t=0) gives F_q((u))((t)). The arithmetic horizontal/vertical flags give different mixed types.


## HL.6

Global arithmetic-scheme norm and completion theorem, unramified/tame quotients, Wiesend topology, Kato complexes, global/model/characteristic-two Hasse principles and all routed source assumptions. Every target has a node; source proofs not fully extracted terminate in the listed gaps.

**Planets:** Arithmetic scheme reciprocity, Kato complexes, Global Hasse injectivity, Cohomological Hasse principle.

<a id="HL-6-reciprocity-relations"></a>
### Local and global reciprocity relations

`HL.6/reciprocity-relations` · theorem · unchecked

The sum of normalized branch residues around a codimension-two point is zero in the appropriate Milnor group, and the product of local Artin evaluations on a Q-chain relation is the identity. Along a proper regular curve this specializes to ∑_x N_{κ(x)/k}∂_x=0. The cohomological boundary-square-zero assertion is proved separately through the niveau differential.

**Hypotheses and conventions.** Retain all normalization branches and residue-field transfers. Proper-curve reciprocity alone is not a proof of the two-dimensional local relation.

**Proof route.**

1. Import proper-curve Milnor Weil reciprocity from K2 T.4. For a two-dimensional local ring use the normalization/localization reciprocity theorem and its finite support, then apply local norm compatibility of Art.
2. Check the two Q-chain cases, inclusion and residue, individually. The local codimension-two reciprocity proof is an explicit part of G12.

**Prerequisites.** `K2SymbolsBrauer:T.4/weil-reciprocity`, [HL.5/residue-maps-along-a-flag](#HL-5-residue-maps-along-a-flag), [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.5/higher-idelic-and-cycle-complex-input](#HL-5-higher-idelic-and-cycle-complex-input).

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), §9, p. 14, reciprocity factorization citing Kato Proposition 7: Q relations are killed by local reciprocity.; [Hasse principles for higher-dimensional fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf), §4, pp. 41–43: Distinction between local residues and a complex differential.

**Acceptance.** Omitting one branch at a singular point can destroy cancellation; the general relation must use the complete normalization sum.

**Direct open inputs.** [G12](#g12). Other gaps propagate through the prerequisites.

<a id="HL-6-global-reciprocity-for-arithmetic-schemes"></a>
### Reciprocity on arithmetic schemes

`HL.6/global-reciprocity-for-arithmetic-schemes` · construction · unchecked

Let X be integral and proper over Z with function field F; in characteristic zero assume F contains a totally imaginary number field. Assemble local Artin maps on all relative Parshin-chain factors to get a continuous dense prereciprocity map I(F;X)→G_F^ab. The Q-chain relations vanish, so it factors through ρ_X:C(F;X)→G_F^ab. For finite Galois L/F extending to finite Y→X, it induces C(F;X)/f_*C(L;Y)≃Gal(L/F)^ab. For every effective D and m>0, C(X,D)/m is finite and lim_{D,m}C(X,D)/m≃G_F^ab.

**Hypotheses and conventions.** C(F;X) is Kerz’s inverse-limit class group. The global map has dense image; no surjectivity of this uncompleted source is inferred. D varies through effective boundary divisors, and the finite-quotient theorem is in Kerz’s full finitely generated field scope, including positive characteristic. Real-place terms are outside this chosen characteristic-zero scope.

**Proof route.**

1. Use henselian/completed local compatibility and the finite pushforward maps to define prereciprocity. Kill Q relations by the preceding reciprocity theorem.
2. Finite norm quotient and existence are the Kato–Saito results restated by Kerz Theorems 9.1–9.2; their original proof decomposition is G14. Take the limit only after proving quotient finiteness and compatibility.

**Prerequisites.** [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.5/higher-idelic-and-cycle-complex-input](#HL-5-higher-idelic-and-cycle-complex-input), [HL.5/functoriality-and-direct-images](#HL-5-functoriality-and-direct-images), [HL.6/reciprocity-relations](#HL-6-reciprocity-relations).

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), §5, p. 7; §9, Theorems 9.1–9.2, pp. 14–15: Global factorization, finite norm quotient and completed existence.

**API.**

- `SchemeReciprocity.prereciprocity` (constructor): Local-chain assembly on I(F;X).
- `SchemeReciprocity.map` (constructor): The factor through C(F;X).
- `SchemeReciprocity.normQuotient` (equivalence): The finite Galois quotient agrees with Gal(L/F)^ab.
- `SchemeReciprocity.modulusCompletion` (equivalence): Inverse limit over D,m gives G_F^ab.
- `SchemeReciprocity.pushforward` (functoriality): Finite pushforward intertwines Galois restriction.

**Uses.** HL.6 tame/open variants: Provides local reciprocity for the required ramification quotients. HL.7 global compatibility: Supplies the map compared with ordinary global reciprocity.

**Tests a wrong definition must fail.**

- `check_1`: For a trivial extension the norm quotient is zero, not the absolute Galois group.
- `check_2`: For a regular projective curve over F_q the completed degree map is Ẑ→Gal(F̄_q/F_q), while the original degree map still has source Z.
- `check_3`: For Spec O_K, unramified scheme reciprocity must kill local unit inertia; the full number-field Artin map cannot be identified with this scheme map before that quotient.

**Acceptance.** The finite-field curve case is imported from FA.4 and compared in the reduction target; the number-field case uses CFT.10–12.

**Direct open inputs.** [G10](#g10), [G14](#g14). Other gaps propagate through the prerequisites.

<a id="HL-6-wiesend-class-group"></a>
### Wiesend class group and connected kernel

`HL.6/wiesend-class-group` · construction · unchecked

For regular U open in an integral X proper and flat over Z, in the standing totally imaginary scope, form I_W(U) and C_W(U) by restricting Kerz’s Parshin-chain and Q-chain sums to d(P)≤1, with ordinary local multiplicative topology on degree-one factors. The quotient topology is independent of compactification. Reciprocity gives a strict exact sequence 0→C_W(U)^0→C_W(U)→π_1^ab(U)→0, where C_W(U)^0 is the identity component.

**Hypotheses and conventions.** This is the characteristic-zero Wiesend theorem, not a replacement for wild finite-field Milnor class groups. The inclusion of truncated idele sums into higher idele sums need not be continuous before passing to class groups.

**Proof route.**

1. Construct the truncated sums and Q quotient. Use approximation to prove compactification independence and continuity of the induced class-group comparison.
2. The connected-kernel/surjectivity proof is Kerz–Schmidt/Wiesend, cited by Kerz Theorem 9.3; it remains a primary proof input in G14.

**Prerequisites.** [HL.5/higher-idelic-and-cycle-complex-input](#HL-5-higher-idelic-and-cycle-complex-input), [HL.6/global-reciprocity-for-arithmetic-schemes](#HL-6-global-reciprocity-for-arithmetic-schemes), `SchemeAndStackFoundations:SF.2`.

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), §7, Definition 7.1, pp. 10–11; §9, Theorem 9.3, p. 15: Truncated class group and strict connected-kernel theorem.

**API.**

- `WiesendClassGroup.ofChains` (constructor): The truncated-chain quotient.
- `WiesendClassGroup.compactificationIndependent` (equivalence): Canonical comparison for two proper compactifications.
- `WiesendClassGroup.kernel` (characterisation): The reciprocity kernel is the identity component.
- `WiesendClassGroup.strictQuotient` (equivalence): The topological quotient is π_1^ab(U).

**Uses.** HL.6 open arithmetic schemes: Provides an actual uncompleted surjectivity theorem in its stated scope. HL.7 topology comparison: Separates this connected-kernel result from the dense-image Milnor source.

**Tests a wrong definition must fail.**

- `check_1`: For an arithmetic curve the truncated chain construction is the whole finite relative idele construction.
- `check_2`: At dimension≥2 one must not assert continuity of I_W→I solely from the continuity of C_W→C.
- `check_3`: The kernel is a connected component, so replacing it by the abstract torsion subgroup gives the wrong target.

**Acceptance.** The quotient C_W(U)/C_W(U)^0 carries exactly the profinite fundamental-group topology.

**Direct open inputs.** [G14](#g14). Other gaps propagate through the prerequisites.

<a id="HL-6-tame-and-wild-proper-and-open-variants"></a>
### Proper, open, tame and wild reciprocity

`HL.6/tame-and-wild-proper-and-open-variants` · construction · unchecked

For regular U open in a proper arithmetic X, the unramified quotient kills the local inertia images at points lying over U; boundary modulus conditions retain the prescribed principal-unit restrictions along X∖U. A tame quotient further kills the closed normal subgroup generated by wild inertia on every normal curve mapping to U at its boundary places; take the abelian quotient for class field theory. Match the corresponding class-group quotient by the closed subgroup of local wild-unit images. Proper unramified, open arbitrary-ramification, and open tame targets are specified separately.

**Hypotheses and conventions.** Use the finite-cover definition of π_1^ab(U), with a geometric basepoint whose change affects only inner conjugation before abelianization. Purity for regular U identifies codimension-one unramified conditions with finite étale covers. A reduced divisor modulus is not asserted to equal the tame quotient in all higher dimensions. In positive characteristic use Milnor modulus groups for the wild theory, not only C_W.

**Proof route.**

1. Define the finite étale and tame Galois subcategories, and the local-unit generated subgroup on the class-group side. Prove compatibility by the local norm/ramification theorems.
2. Apply the global finite quotient/existence theorem in the permitted scope, then pass to quotients by the closed wild inertia subgroup. The purity, scheme fundamental-group and ramification-bound comparison are G14.

**Prerequisites.** [HL.6/global-reciprocity-for-arithmetic-schemes](#HL-6-global-reciprocity-for-arithmetic-schemes), [HL.6/wiesend-class-group](#HL-6-wiesend-class-group), [HL.4/ramification-filtrations-and-their-indexing](#HL-4-ramification-filtrations-and-their-indexing), `SchemeAndStackFoundations:SF.2`.

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), Introduction pp. 1–2; §4 pp. 4–5; §9 pp. 14–15: Modulus and unramified class-field targets; the formal tame quotient is specified here.

**API.**

- `SchemeReciprocity.unramifiedQuotient` (constructor): Quotient by local inertia over U.
- `SchemeReciprocity.tameQuotient` (constructor): Closed quotient killing curvewise wild inertia.
- `SchemeReciprocity.modulusTransition` (functoriality): Increasing a modulus gives compatible finite quotients.
- `SchemeReciprocity.properCase` (compatibility): With no boundary the target is the unramified abelian fundamental group.

**Uses.** HL.6 comparison with π_1: Makes the geometric target and conductor restrictions explicit. HL.7 curve reductions: Pins the boundary conditions in ordinary class field theory.

**Tests a wrong definition must fail.**

- `check_1`: For U proper there are no omitted boundary places; this does not mean that G_F^ab itself is the unramified scheme group.
- `check_2`: For U=P^1_{F_q}∖{∞}, wild Artin–Schreier covers at ∞ survive the arbitrary-ramification target but not the tame quotient.
- `check_3`: For an omitted curve place, principal units contribute wild inertia while residue units can contribute nontrivial prime-to-p tame inertia.

**Acceptance.** On a curve the tame quotient kills principal units at omitted places but retains the residue-unit tame inertia; the proper quotient kills all local unit inertia.

**Direct open inputs.** [G14](#g14). Other gaps propagate through the prerequisites.

<a id="HL-6-reduction-of-the-curve-case"></a>
### Comparison with ordinary global reciprocity

`HL.6/reduction-of-the-curve-case` · comparison · unchecked

In dimension one compare the relative chain class group with the ordinary finite idele class group and compare the resulting Artin maps. For a finite-field curve use FA.4’s global Artin/norm and existence maps, with constants controlled by degree. For a number field use CFT.10–12 and GNF.6, adding the archimedean factors for the full ordinary map. For Spec O_K or an open subscheme compare only after quotienting the appropriate local unit inertia, and retain any real-place convention if that larger scope is adopted.

**Hypotheses and conventions.** The chosen characteristic-zero scheme theorem is totally imaginary. Its finite-idele comparison is not an assertion that archimedean factors were part of the Parshin-chain construction.

**Proof route.**

1. Identify a dimension-one Q relation with a principal idele. Identify local Artin evaluation on each finite factor, then use density and equality on those factors.
2. Verify the constant-field degree map in positive characteristic. In arithmetic characteristic zero use the ordinary connected archimedean quotient and unramified-local conditions.

**Prerequisites.** [HL.5/acceptance-recover-ideles-and-list-surface-flags](#HL-5-acceptance-recover-ideles-and-list-surface-flags), [HL.6/global-reciprocity-for-arithmetic-schemes](#HL-6-global-reciprocity-for-arithmetic-schemes), `FunctionFieldArithmetic:FA.4/global-artin-norm-isomorphism`, `FunctionFieldArithmetic:FA.4/profinite-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`.

**Sources.** [Ideles in higher dimension](https://arxiv.org/pdf/0907.5337v3), §2, pp. 2–3; §9, pp. 14–15: Dimension-one relative ideles and reciprocity comparisons.

**Acceptance.** For Spec O_K, an everywhere unramified abelian extension is detected after killing O_v× at every finite v; the full idele map before that quotient has a larger Galois target.


<a id="HL-6-kato-complexes-and-boundary-square-zero"></a>
### Kato complexes and square-zero boundaries

`HL.6/kato-complexes-and-boundary-square-zero` · construction · unchecked

In an admissible coefficient/base regime set C_n^0(X)_a=⊕_{x:δ(x)=a}H^{a+1}(κ(x),Z/n(a)), with homological differential lowering a by one. Its (y,x) component is the normalization-branch residue/corestriction sum of HL.5. Identify this complex as the relevant row of the niveau spectral sequence of étale homology; then d²=0. Define KH_a as its homology only after finite support and that identification.

**Hypotheses and conventions.** For finite-type schemes over a finite field take δ(x)=dim closure{x}; over an arithmetic one-dimensional base use the source dimension function. Begin with n invertible on the base. Wild logarithmic regimes need the separately specified comparison G12. For normal integral d-dimensional X the first differential is H^{d+1}(κ(X),Z/n(d))→⊕_{x∈X^(1)}H^d(κ(x),Z/n(d−1)).

**Proof route.**

1. Import localization and purity for étale homology, form the filtration by closed subsets of bounded δ, and its exact couple. Identify the E1 entries via purity and field cohomology.
2. Check the E1 d1 component is exactly the branchwise residue with the chosen sign and corestriction. Finite support follows from localization on one open. The exact-couple identity proves d1²=0.
3. For wild characteristic-p coefficients use logarithmic purity and the Jannsen–Saito–Sato comparison, not formal symbol anticommutativity alone.

**Prerequisites.** [HL.2/finite-kato-coefficient-complex](#HL-2-finite-kato-coefficient-complex), [HL.5/residue-maps-along-a-flag](#HL-5-residue-maps-along-a-flag), `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.3`.

**Sources.** [Cohomological Hasse principle and motivic cohomology for arithmetic schemes](https://www.numdam.org/article/PMIHES_2012__115__123_0.pdf), §1, Definitions 1.1–1.2 and niveau construction, pp. 129–132; §8, (8.1), pp. 169–170: Homology theory, niveau row and Kato indexing.; [Hasse principles for higher-dimensional fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf), §4, (4.1)–(4.4), pp. 40–43: Identification of the actual residue differential.; [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, pp. 4–5: C_n^0 indexing and divisorial consequence.

**API.**

- `KatoComplex.term` (data): The direct sum in degree a.
- `KatoComplex.differential` (constructor): The branchwise finite-support boundary.
- `KatoComplex.niveauRow` (equivalence): Identification with the prescribed E1 row.
- `KatoComplex.squareZero` (relation): The composed consecutive differential is zero.
- `KatoComplex.homology` (constructor): KH_a after the complex structure is established.

**Uses.** HL.6 Hasse principles: Top-degree homology vanishing gives injective divisorial residue. Dittmann–Pop §2 kato-complex: Provides the exact complex used in Facts 2.2–2.3.

**Tests a wrong definition must fail.**

- `check_1`: For a smooth arithmetic curve the complex is Br(F)[n]→⊕closed H^1(κ(x),Z/n), with degrees 1→0.
- `check_2`: For a singular specialization all normalization branches contribute; using a single prime is rejected.
- `check_3`: On a surface the two boundary maps have zero composite, and the proof checks equality with d1 rather than assuming that a list of residue maps is automatically a complex.

**Acceptance.** At δ=0 the term is characters H^1, at δ=1 it is H^2(−,Z/n(1)), and at a d-dimensional generic point it is H^{d+1}.

**Direct open inputs.** [G12](#g12). Other gaps propagate through the prerequisites.

<a id="HL-6-constant-place-fields"></a>
### Constant-place field extensions

`HL.6/constant-place-fields` · definition · unchecked

Let K be finitely generated, k its relatively algebraically closed global subfield and d=td(K/k)+1. For each place v of k choose k_v inside a completion: a henselization for nonarchimedean v, a real closure for real v, an algebraic closure for complex v. Define K_v=Kk_v inside K̂_v=Frac(K⊗_k k̂_v), using the primary-extension embedding. Record the inclusions K→K_v→K̂_v and their restriction maps. These are extensions of the constant field, not completions at all divisorial valuations of K.

**Hypotheses and conventions.** K/k is primary and finitely generated. k is a number field or a global function field. Fix the common algebraic closures and place embeddings needed for these composita.

**Proof route.**

1. Use relative algebraic closure to control the tensor product and embed the constant extension in the completed-constant field.
2. Apply the generic restriction API to these field embeddings. Distinguish this place family from the codimension-one family of a model.

**Prerequisites.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`, [HL.2/restriction-corestriction](#HL-2-restriction-corestriction), `mathlib:AlgebraicGeometry.Scheme`.

**Sources.** [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, pp. 3–4, paragraph preceding Fact 2.1: Henselian and archimedean constant-place fields.; [Hasse principles for higher-dimensional fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf), Introduction, Theorem 0.4 and finite-coefficient reduction, pp. 2–3: Completed-constant fields in the Hasse theorem.

**API.**

- `ConstantPlaceField.field` (constructor): The specified compositum Kk_v.
- `ConstantPlaceField.intoCompletedConstants` (functoriality): The embedding in K̂_v.
- `ConstantPlaceField.restriction` (functoriality): Cohomology restriction from K to K_v.
- `ConstantPlaceField.archimedean` (compatibility): Real and complex constant extensions use their specified algebraic carriers.

**Uses.** Dittmann–Pop §2 constant-place-fields: Supplies the place family in Fact 2.1. HL.6 global Hasse principle: Connects the consumer’s henselian fields to the source’s completions.

**Tests a wrong definition must fail.**

- `check_1`: For K=k(t), constant extension leaves t transcendental and does not complete in t.
- `check_2`: A real place uses a real closure and can retain real Galois cohomology; a complex place has algebraically closed constants.
- `check_3`: Vanishing after restriction to K_v implies vanishing after restriction to K̂_v; this implication needs no assertion that all cohomology groups are equal.

**Acceptance.** For K=k(t), K_v=k_v(t), not k_v((t)); the latter is a completion at a variable place.


<a id="HL-6-resolution-f2"></a>
### Conditional resolution datum over F₂

`HL.6/resolution-f2` · definition · unchecked

Res(F₂) is the conjunction of two explicit assumptions: every proper integral F₂-variety has a proper birational morphism from a smooth variety; every smooth affine F₂-variety admits an open immersion in a smooth projective variety whose boundary is a simple normal-crossings divisor. Store the two clauses independently and pass this datum as a hypothesis to the high-dimensional characteristic-two Hasse target.

**Hypotheses and conventions.** This is conditional input, not an asserted resolution theorem. The two clauses require their own properness, birationality and boundary witnesses.

**Proof route.**

1. Express each clause using SF.4’s resolution and compactification carriers; obtain the combined datum as a conjunction of assumptions.
2. Track where the characteristic-two proof uses a smooth projective model and a good boundary. Do not replace these assumptions by an arbitrary alteration.

**Prerequisites.** `SchemeAndStackFoundations:SF.4`, `mathlib:AlgebraicGeometry.Scheme`.

**Sources.** [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, assumption Res(F₂) and Fact 2.3, p. 5: Two separate resolution assumptions and their conditional use.

**API.**

- `ResolutionF2.properResolution` (projection): Resolution of proper integral varieties.
- `ResolutionF2.sncCompactification` (projection): Smooth projective compactification with SNC boundary.
- `ResolutionF2.ofClauses` (constructor): Assemble the two supplied witnesses.

**Uses.** Dittmann–Pop §2 resolution-f2: Names the actual conditional hypothesis. HL.6 characteristic-two detection: Permits the d>3 branch without claiming unconditional resolution.

**Tests a wrong definition must fail.**

- `check_1`: The datum is not inferred solely from resolution of surfaces.
- `check_2`: A generically finite cover of degree greater than one is not a proper birational resolution witness.
- `check_3`: A smooth projective compactification with an arbitrary singular boundary does not satisfy the second clause.

**Acceptance.** Dropping the boundary clause leaves the assumption insufficient for the stated high-dimensional route.


<a id="HL-6-lgp-global-base"></a>
### Global-constant Hasse injectivity

`HL.6/lgp-global-base` · theorem · unchecked

For a global field k, a primary finitely generated extension K/k of transcendence degree r and n invertible in k, restriction H^{r+2}(K,Z/n(r+1))→⊕_v H^{r+2}(K̂_v,Z/n(r+1)) is injective, over all places v of k with the source’s archimedean conventions. In particular, if char K≠2 and d=r+1, a class in H^{d+1}(K,Z/2(d)) vanishing in every henselian constant-place K_v is zero, since it then vanishes in every K̂_v.

**Hypotheses and conventions.** k is relatively algebraically closed in K. Include real places for 2-primary coefficients. Finite support is part of the direct-sum statement.

**Proof route.**

1. Use the field-weight exact sequence and the prime-to-ℓ alteration descent in Jannsen’s proof. Prove the Q_ℓ/Z_ℓ version, then its finite-coefficient form with the required norm-residue and Bockstein input.
2. Pass from vanishing in K_v to vanishing in K̂_v by functoriality of restriction. Apply the source’s completed-constant injectivity; no blanket henselization/completion isomorphism is needed.

**Prerequisites.** [HL.6/constant-place-fields](#HL-6-constant-place-fields), [HL.2/restriction-corestriction](#HL-2-restriction-corestriction), [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`.

**Sources.** [Hasse principles for higher-dimensional fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf), Introduction, Theorem 0.4 and finite-coefficient reduction, pp. 2–3; Theorem 2.10 and proof, pp. 24–25: Finite-coefficient statement and alteration/weight route.; [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, Fact 2.1, p. 4: The exact mod-two henselian constant-place consumer.

**Acceptance.** A class undetected only at the finite places of a number field is not covered at ℓ=2 unless the real-place terms are also handled.

**Direct open inputs.** [G13](#g13). Other gaps propagate through the prerequisites.

<a id="HL-6-lgp-good-model"></a>
### Good-model divisorial injectivity

`HL.6/lgp-good-model` · theorem · unchecked

Let R be a finite field of characteristic different from 2, or the valuation ring of the henselization of a global field at a finite place whose residue field has characteristic different from 2. Let X/R be proper, flat, regular and integral, of absolute dimension d>0, with function field K. Restriction H^{d+1}(K,Z/2(d))→∏_{x∈X^(1)}H^{d+1}(K_x,Z/2(d)) is injective, where K_x is the henselian divisorial field. The proof uses prime-to-residue-characteristic Kato-homology vanishing.

**Hypotheses and conventions.** Properness, flatness and regularity are essential. The characteristic conditions apply to the residue base, not merely to K. The d>0 generic term is the highest degree of the source Kato complex.

**Proof route.**

1. Apply Kerz–Saito Theorem 8.1 to the appropriate proper regular model and ℓ=2. Identify the generic term and first boundary in the niveau row.
2. Vanishing in each henselian divisorial field forces its residue to vanish. Top positive-degree Kato homology is zero, giving injectivity of the generic differential. Use the model-to-henselian formulation recorded in Dittmann–Pop Fact 2.2.

**Prerequisites.** [HL.6/kato-complexes-and-boundary-square-zero](#HL-6-kato-complexes-and-boundary-square-zero), `SchemeAndStackFoundations:SF.4`, [HL.2/restriction-corestriction](#HL-2-restriction-corestriction).

**Sources.** [Cohomological Hasse principle and motivic cohomology for arithmetic schemes](https://www.numdam.org/article/PMIHES_2012__115__123_0.pdf), §8, Theorem 8.1 and proof, pp. 169–171: Prime-to-residue-characteristic Kato homology vanishing.; [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, Fact 2.2, p. 5: Proper regular good-model restriction statement.

**Acceptance.** A mixed characteristic-zero field with residue characteristic two does not satisfy this prime-to-residue-characteristic branch.

**Direct open inputs.** [G13](#g13). Other gaps propagate through the prerequisites.

<a id="HL-6-lgp-characteristic-two"></a>
### Characteristic-two divisorial injectivity

`HL.6/lgp-characteristic-two` · theorem · unchecked

Let K be finitely generated of characteristic two, Kronecker dimension d>0. For d>3 assume Res(F₂). On a smooth projective model X of K, the restriction H^{d+1}(K,Z/2(d))→∏_{x∈X^(1)}H^{d+1}(K_x,Z/2(d)) is injective, using logarithmic Kato coefficients and henselian divisorial fields. The low-dimensional route d≤3 uses its separate unconditional model and Kato/Suwa inputs; it is not deduced from a general resolution theorem.

**Hypotheses and conventions.** A smooth projective model and the specific conditional branch are part of the statement. Ordinary μ₂ coefficients in characteristic two do not represent this group.

**Proof route.**

1. Use the characteristic-two version of the cohomological Kato complex. Relate the generic logarithmic class and its divisorial residues.
2. Apply the Kato-homology theorem under the precise resolution/good-boundary assumptions; for d≤3 supply the low-dimensional theorem separately. Its remaining primary-source identification is G13.
3. As in the prime-to-characteristic case, local vanishing annihilates all residues and the top homology statement proves global vanishing.

**Prerequisites.** [HL.6/resolution-f2](#HL-6-resolution-f2), [HL.6/kato-complexes-and-boundary-square-zero](#HL-6-kato-complexes-and-boundary-square-zero), [HL.2/logarithmic-de-rham-witt-coefficients](#HL-2-logarithmic-de-rham-witt-coefficients).

**Sources.** [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), §2, Fact 2.3 and resolution assumptions, p. 5: Characteristic-two injectivity and the exact d>3 conditional assumption.; [Hasse principles for higher-dimensional fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf), §4, Definition 4.18, Theorem 4.19 and Lemma 4.20, pp. 48–50: Characteristic-p homology and compactification inputs in the cited route.

**Acceptance.** For d=4 the theorem must take Res(F₂) as an explicit argument. A proposed unconditional statement fails this acceptance check.

**Direct open inputs.** [G13](#g13). Other gaps propagate through the prerequisites.

<a id="HL-6-kato-hasse-global-models"></a>
### Kato homology over global and arithmetic bases

`HL.6/kato-hasse-global-models` · theorem · unchecked

For smooth proper connected X over a global field k and ℓ≠char k, the global Kato complex formed as Cone(C^(1)(X)→⊕_v C^(1)(X_{k_v})) has homology Λ in degree zero and zero in positive degrees, where Λ=Z/ℓ^s and C^(1)_a=⊕_{x:dim{x}=a}H^{a+2}(κ(x),Λ(a+1)); k_v denotes the source’s henselian place field. For U regular connected of finite type over Z with global function field k, ℓ invertible on U, and X regular connected proper flat over U with smooth generic fibre, use instead Cone(C^(0)(X)[1]→⊕_{v∉U} C^(1)(X_{k_v})); it has the same homology. For a chain map f:C→D use Cone(f)_a=D_a⊕C_{a−1}, with differential (y,x)↦(d_Dy+f(x),−d_Cx). The source’s shift in the arithmetic formula lowers the displayed homological degree: (C^(0)[1])_a=C^(0)_{a+1}, with differential −d_C. Thus its arithmetic cone has degree-a group (⊕_v C^(1)(X_{k_v})_a)⊕C^(0)(X)_a.

**Hypotheses and conventions.** For number fields require k totally imaginary or ℓ odd to avoid introducing an unplanned real-place 2-primary correction carrier. Function fields require no archimedean restriction. This number-field restriction is narrower than the source’s complete convention. For the arithmetic statement use the source’s arithmetic dimension function and shift; its complex is not the unshifted finite-field row.

**Proof route.**

1. Use the finite/henselian Kato vanishing theorem and the field Hasse injectivity theorem to assemble the global cone. Identify its augmentation to Λ.
2. For the arithmetic model use localization and the omitted-place terms, respecting the [1] shift. Use the displayed cone and degree-lowering shift to assign component signs; changing a face convention requires the corresponding chain isomorphism.

**Prerequisites.** [HL.6/kato-complexes-and-boundary-square-zero](#HL-6-kato-complexes-and-boundary-square-zero), [HL.6/lgp-global-base](#HL-6-lgp-global-base), [HL.6/lgp-good-model](#HL-6-lgp-good-model), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `EtaleDualityAndPerverseSheaves:EDC.3`.

**Sources.** [Cohomological Hasse principle and motivic cohomology for arithmetic schemes](https://www.numdam.org/article/PMIHES_2012__115__123_0.pdf), §8, Theorems 8.3–8.4 and proof, pp. 171–174: Global field cone and arithmetic-base cone, including degree shifts.

**Acceptance.** Over a finite field the arithmetic global-place cone is not substituted for the ordinary C^(0) complex. Over a number field its missing-place summands depend on U.

**Direct open inputs.** [G13](#g13). Other gaps propagate through the prerequisites.

## HL.7

Equality of ordinary/higher Artin maps and the actual Brauer, arithmetic-duality and motivic residue diagrams. Every target has a node; source proofs not fully extracted terminate in the listed gaps.

**Planets:** Ordinary Artin comparison.

<a id="HL-7-dimension-one-artin-map-comparison"></a>
### Dimension-one equality of Artin maps

`HL.7/dimension-one-artin-map-comparison` · theorem · unchecked

Identify K_1^M(F)=F× for a one-local field F. The HL.3 reciprocity map agrees, as a homomorphism to the same G_F^ab, with CFT.7’s absolute local Artin map, on every finite abelian restriction and with arithmetic Frobenius normalization. Use CFT.8 and FA.4 for the ordinary mixed/equal-characteristic wild existence and completion branches, respectively.

**Hypotheses and conventions.** Use the same chosen separable closure, finite quotients and one-local invariant in both constructions. Equality of maps is stronger than isomorphism of targets.

**Proof route.**

1. Evaluate the HL.3 map against every finite character by inv_F(χ∪h(x)). At n=1 compare this with the ordinary class-formation evaluation and Brauer invariant.
2. Use the imported ordinary wild existence branches where coefficients have residue characteristic. Characters of each finite abelian quotient separate points; equality in all finite quotients gives equality in G_F^ab.

**Prerequisites.** [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.2/low-degree-identifications](#HL-2-low-degree-identifications), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `FunctionFieldArithmetic:FA.4/local-abelian-existence`, `FunctionFieldArithmetic:FA.4/schmid-witt-artin-comparison`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §5.0, pp. 53–54; §5.2, pp. 56–57: The invariant construction and ordinary-dimensional normalization.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §5, introduction, pp. 30–31; §5.2, Theorem 5.8, pp. 34–35: The degree-one starting case and higher reciprocity theorem; Example 5.3 is not an ordinary Artin comparison theorem.

**Acceptance.** A uniformizer restricts to arithmetic Frobenius in the unramified quotient; a geometric-Frobenius convention changes the comparison by inversion.

**Direct open inputs.** [G15](#g15). Other gaps propagate through the prerequisites.

<a id="HL-7-brauer-invariant-comparison"></a>
### Brauer classes under higher residue

`HL.7/brauer-invariant-comparison` · comparison · unchecked

Compare the n=1 Kato invariant H²(F,Q/Z(1))≃Br(F)→Q/Z with the imported ordinary local Brauer invariant. For a two-local F and χ∈H¹(F,Q/Z), x∈K_2^M(F), the evaluation inv_F(χ∪h(x)) agrees with the residue-to-first-field calculation whenever the residue/symbol compatibility hypotheses hold. Thus an obstruction expressed by the higher pairing is carried to the ordinary residue Brauer class, rather than merely relabelled.

**Hypotheses and conventions.** State the coefficient order and admissible residue case. Wild mixed-characteristic residues use G03; do not assert tame splitting for all wild classes.

**Proof route.**

1. Use H²=Br in the Kato convention and the n=1 ordinary invariant normalization. Compare cup/symbol residue diagrams including signs.
2. Test the unramified character against the parameter symbol and the tame root-of-unity class against the prepend-a tame formula.

**Prerequisites.** [HL.2/low-degree-identifications](#HL-2-low-degree-identifications), [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), [HL.4/higher-tame-symbol](#HL-4-higher-tame-symbol), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

**Sources.** [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), I §5.1–5.2, pp. 54–57: Brauer identification and invariant compatibility.; [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §5.2, Remark 5.10, pp. 35–36: Cohomological description of higher reciprocity.

**Acceptance.** At F=F_q((u))((t)), an unramified character evaluated on {u,t} gives its final Frobenius value with positive orientation.

**Direct open inputs.** [G15](#g15). Other gaps propagate through the prerequisites.

<a id="HL-7-finite-duality-comparison"></a>
### Compatibility with arithmetic duality

`HL.7/finite-duality-comparison` · comparison · unchecked

For the finite coefficient modules in HL.2’s prime-to-characteristic-of-F_1 regime, identify the higher cup/evaluation pairing H^r(F,M)×H^{n+1−r}(F,M∨(n))→Q/Z with the successive residue induction from CFT.5. At n=1 this is the ordinary local Tate pairing. For characteristic-p logarithmic coefficients retain the separate categorical Kato character theorem and do not replace it by finite-group perfectness.

**Hypotheses and conventions.** M is finite, ℓ-primary with ℓ≠char F_1; M∨=Hom(M,Q/Z). Specify the same trace and Tate-twist conventions.

**Proof route.**

1. Apply the tame residue decomposition successively and compare cup products, graded signs and trace with the one-local pairing.
2. Check the n=1 degree and twist; for wild characteristic-p coefficients exhibit the separate target topology and character class.

**Prerequisites.** [HL.2/finite-coefficient-duality](#HL-2-finite-coefficient-duality), [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`.

**Sources.** [Arithmetic Duality Theorems](https://math.stanford.edu/~conrad/BSDseminar/refs/MilneADT.pdf), I §2, Theorem 2.17, Lemma 2.18 and Corollary 2.19, pp. 37–40: Induction in the prime-to-residue-characteristic regime.; [Invitation to higher local fields](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), Kato existence paper, introduction, Theorems 1–2, pp. 165–166; §1, Lemma 2, p. 171: Different wild categorical duality statement.

**Acceptance.** For Q_p((t)) all finite coefficient primes are tame at the first step; for Q_p{{t}} the prime p is excluded by the characteristic-of-F_1 condition.

**Direct open inputs.** [G15](#g15). Other gaps propagate through the prerequisites.

<a id="HL-7-motivic-residue-comparison"></a>
### Compatibility of symbol and motivic residues

`HL.7/motivic-residue-comparison` · comparison · unchecked

For m invertible in the relevant fields, the imported norm-residue symbol K_i^M(F)/m≃H^i(F,Z/m(i)) commutes with the Milnor and cohomological residue maps, using the same last-uniformizer convention and the necessary localization-purity identification. Iterating along a flag compares the Milnor idele boundary and the corresponding cohomological boundary. The characteristic-p logarithmic square is a distinct extension, requiring the BGK supplier and logarithmic purity rather than ordinary μ_p.

**Hypotheses and conventions.** Use only coefficient and regularity regimes supported by the imported norm-residue/localization theorem. Mixed wild steps remain G03/G12.

**Proof route.**

1. Import the full invertible-coefficient norm-residue isomorphism from MotivicEtaleKTheory:M.5/KU-normresidue and the motivic/étale localization comparison. K2SymbolsBrauer:T.4/complete-norm-residue supplies commutation of Milnor transfer with DVR residue, not the Galois-cohomological norm-residue isomorphism. Identify the residue square on uniformizer symbols.
2. Compose the squares along the chosen residue tower, adding the branch corestrictions for a scheme flag.

**Prerequisites.** `K2SymbolsBrauer:T.4/complete-norm-residue`, `K2SymbolsBrauer:T.3/higher-milnor-residues`, [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), [HL.5/residue-maps-along-a-flag](#HL-5-residue-maps-along-a-flag), `K2SymbolsBrauer:T.3`, `EtaleDualityAndPerverseSheaves:EDC.3`, `MotivicEtaleKTheory:KU-normresidue`.

**Sources.** [An introduction to higher dimensional local fields and adeles](https://arxiv.org/pdf/1204.0586v2), §5.1, Proposition 5.5, p. 33; §5.2, Remark 5.10, pp. 35–36; §7.1, pp. 44–46: Milnor boundaries, cohomological reciprocity and branch fields motivate the comparison. The generic isomorphism and localization-purity square come from the separately named suppliers, not a proof in this survey.; [Cohomological Hasse principle and motivic cohomology for arithmetic schemes](https://www.numdam.org/article/PMIHES_2012__115__123_0.pdf), §1, pp. 129–132; §8, pp. 169–171: Niveau localization needed for the cohomological comparison.

**Acceptance.** The square sends {u,t} to the same residue class as u with ∂_t applied first. Reversing the symbol order introduces the graded sign.

**Direct open inputs.** [G15](#g15). Other gaps propagate through the prerequisites.

## Routed Dittmann–Pop coverage

The reviewed source route assigns thirteen items to HL.2 and HL.6. The corrected nonreal local-dimension bound is retained; a formally real global field is not assigned finite cd₂ merely because the local compositum has such a bound. The source route’s older broad wording about M.5d is interpreted under accepted RS-28’s narrower ownership.

| Routed item | Target |
| --- | --- |
| `PAPER-DITTMANN-POP-23/resolution-f2` | [HL.6/resolution-f2](#HL-6-resolution-f2) |
| `PAPER-DITTMANN-POP-23/kato-coefficients` | [HL.2/finite-kato-coefficient-complex](#HL-2-finite-kato-coefficient-complex) |
| `PAPER-DITTMANN-POP-23/kato-cohomology` | [HL.2/kato-cohomology-groups](#HL-2-kato-cohomology-groups) |
| `PAPER-DITTMANN-POP-23/cohomology-restriction` | [HL.2/restriction-corestriction](#HL-2-restriction-corestriction) |
| `PAPER-DITTMANN-POP-23/cohomology-residue` | [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map) |
| `PAPER-DITTMANN-POP-23/cohomology-low-degrees` | [HL.2/low-degree-identifications](#HL-2-low-degree-identifications) |
| `PAPER-DITTMANN-POP-23/constant-place-fields` | [HL.6/constant-place-fields](#HL-6-constant-place-fields) |
| `PAPER-DITTMANN-POP-23/lgp-global-base` | [HL.6/lgp-global-base](#HL-6-lgp-global-base) |
| `PAPER-DITTMANN-POP-23/kato-complex` | [HL.6/kato-complexes-and-boundary-square-zero](#HL-6-kato-complexes-and-boundary-square-zero) |
| `PAPER-DITTMANN-POP-23/lgp-good-model` | [HL.6/lgp-good-model](#HL-6-lgp-good-model) |
| `PAPER-DITTMANN-POP-23/lgp-characteristic-two` | [HL.6/lgp-characteristic-two](#HL-6-lgp-characteristic-two) |
| `PAPER-DITTMANN-POP-23/odd-degree-injectivity` | [HL.2/restriction-corestriction](#HL-2-restriction-corestriction) |
| `PAPER-DITTMANN-POP-23/nonreal-local-cd-bound` | [HL.2/nonreal-local-cd-bound](#HL-2-nonreal-local-cd-bound) |

## Imported contracts

Exact external node identifiers in the target prerequisites refer to the already planned object or theorem and are not duplicated here. Where no exact supplier node covers a need, the following stage request specifies the contract and the direct consumers. A request does not certify that the supplier has already proved the requested statement.

### CrystallineCohomology:CR.4

Ordinary/relative finite-length de Rham–Witt complexes and dlog; request Cartier/logarithmic subgroup, restriction/Verschiebung, trace and residue compatibilities for imperfect characteristic-p fields. Generic BGK is explicitly a separate unowned need G04.

**Direct consumers:** [HL.2/finite-kato-coefficient-complex](#HL-2-finite-kato-coefficient-complex), [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), [HL.2/logarithmic-de-rham-witt-coefficients](#HL-2-logarithmic-de-rham-witt-coefficients).

### EtaleDualityAndPerverseSheaves:EDC.2:trace-purity

Étale homology trace/purity and its field stalk identification, with the coefficient and regularity assumptions of the niveau row. This is not coherent O-module duality.

**Direct consumers:** [HL.6/kato-complexes-and-boundary-square-zero](#HL-6-kato-complexes-and-boundary-square-zero).

### EtaleDualityAndPerverseSheaves:EDC.3

Localization, absolute/logarithmic purity and niveau spectral sequences for the coefficient regimes of the Kato complexes, identifying d1 with branch residue/corestriction. Record unprovided wild comparisons as G12.

**Direct consumers:** [HL.6/kato-complexes-and-boundary-square-zero](#HL-6-kato-complexes-and-boundary-square-zero), [HL.6/kato-hasse-global-models](#HL-6-kato-hasse-global-models), [HL.7/motivic-residue-comparison](#HL-7-motivic-residue-comparison).

### FunctionFieldArithmetic:FA.2

Finite-field curve ideles, principal diagonal, global degree and their class-group interface; import this separately from the number-field global supplier.

**Direct consumers:** [HL.5/higher-idelic-and-cycle-complex-input](#HL-5-higher-idelic-and-cycle-complex-input), [HL.5/acceptance-recover-ideles-and-list-surface-flags](#HL-5-acceptance-recover-ideles-and-list-surface-flags).

### K2SymbolsBrauer:T.3

The generic Milnor/motivic localization-to-étale residue comparison in the invertible-coefficient scope; the exact higher Milnor residue node is already cited separately. No duplicate generic tame symbol is planned here.

**Direct consumers:** [HL.7/motivic-residue-comparison](#HL-7-motivic-residue-comparison).

### KTheoryFiniteLocalFields:L.3

Ordinary one-local Hilbert-symbol, K₂ and norm-residue computations in their exact coefficient scope; HL.4 adds only higher-degree formulas and normalization comparisons.

**Direct consumers:** [HL.1/topological-versus-algebraic-k-groups](#HL-1-topological-versus-algebraic-k-groups), [HL.4/higher-tame-symbol](#HL-4-higher-tame-symbol), [HL.4/explicit-formulas-for-the-hilbert-symbol](#HL-4-explicit-formulas-for-the-hilbert-symbol).

### KTheoryFiniteLocalFields:L.5

Extend the existing perfect-residue odd-p logarithmic DVR scope, or assign a separate supplier, for generic Bloch–Gabber–Kato K_i^M(E)/p^s≃W_sΩ^i_log with norm/trace/residue compatibility, and the imperfect-residue mixed-DVR comparison. Existing L.5 nodes do not supply this (G04).

**Direct consumers:** [HL.2/low-degree-identifications](#HL-2-low-degree-identifications), [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), [HL.2/logarithmic-de-rham-witt-coefficients](#HL-2-logarithmic-de-rham-witt-coefficients), [HL.2/finite-coefficient-duality](#HL-2-finite-coefficient-duality), [HL.4/vostokov-pairing-and-the-wild-existence-case](#HL-4-vostokov-pairing-and-the-wild-existence-case), [HL.4/kurihara-exponential-and-differential-forms](#HL-4-kurihara-exponential-and-differential-forms).

### MotivicEtaleKTheory:KU-normresidue

The full invertible-coefficient norm-residue isomorphism for fields, with product and transfer compatibility, not just degree-two or prime-exponent special cases.

**Direct consumers:** [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), [HL.7/motivic-residue-comparison](#HL-7-motivic-residue-comparison).

### MotivicEtaleKTheory:M.5d

Only the accepted RS-28 bridge: prime-power passage, filtered coefficient colimits, purely inseparable invariance and characteristic reductions. It is not the owner of BGK.

**Direct consumers:** [HL.2/kato-cohomology-groups](#HL-2-kato-cohomology-groups), [HL.2/restriction-corestriction](#HL-2-restriction-corestriction), [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), [HL.2/logarithmic-de-rham-witt-coefficients](#HL-2-logarithmic-de-rham-witt-coefficients).

### SchemeAndStackFoundations:SF.0

Noetherian quasi-coherent modules and scheme localizations/completions with coherent-to-quasi-coherent filtered-colimit control, for Beilinson’s recursive adeles and finite direct images.

**Direct consumers:** [HL.5/parshin-chains](#HL-5-parshin-chains), [HL.5/higher-adeles](#HL-5-higher-adeles), [HL.5/functoriality-and-direct-images](#HL-5-functoriality-and-direct-images).

### SchemeAndStackFoundations:SF.2

Finite étale Galois category and π₁^ab of arithmetic schemes, plus the regular-scheme purity needed for the unramified and curvewise tame quotients. The exact field étale/Galois and Nisnevich henselian nodes are already cited; O-module localization triangles alone do not give étale Kato homology.

**Direct consumers:** [HL.5/adelic-resolution](#HL-5-adelic-resolution), [HL.5/nisnevich-class-group-comparison](#HL-5-nisnevich-class-group-comparison), [HL.6/wiesend-class-group](#HL-6-wiesend-class-group), [HL.6/tame-and-wild-proper-and-open-variants](#HL-6-tame-and-wild-proper-and-open-variants).

### SchemeAndStackFoundations:SF.4

Existing resolution/compactification carriers and ordinary de Jong alteration infrastructure, used to express conditional Res(F₂) and good models. Degree prime to ℓ requires the separately routed PrimeToDegreeAlterations direction (G13), never an arbitrary alteration.

**Direct consumers:** [HL.6/resolution-f2](#HL-6-resolution-f2), [HL.6/lgp-good-model](#HL-6-lgp-good-model).

### SchemeAndStackFoundations:SF.5

Scheme cycle/support and proper branchwise specialization infrastructure for class-group relations. The exact residue/corestriction and codimension-two reciprocity comparison are HL.5–6/G10/G12.

**Direct consumers:** [HL.5/nisnevich-class-group-comparison](#HL-5-nisnevich-class-group-comparison).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants

Number-field global carriers, Brauer sequence and sum of local invariants, with the actual archimedean conventions; not the finite-field curve supplier.

**Direct consumers:** [HL.6/reduction-of-the-curve-case](#HL-6-reduction-of-the-curve-case).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

The ordinary number-field global class formation and Artin map, compared with the finite-idele scheme construction after adjoining archimedean factors.

**Direct consumers:** [HL.6/reduction-of-the-curve-case](#HL-6-reduction-of-the-curve-case).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

The ordinary arithmetic global norm-index/existence/completion correspondence, with real-place restrictions explicit; FA.4 supplies finite-field curves.

**Direct consumers:** [HL.6/reduction-of-the-curve-case](#HL-6-reduction-of-the-curve-case).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

The ordinary local Brauer invariant, its restriction/corestriction normalizations and local Tate duality; use its full stated coefficient scope only at n=1.

**Direct consumers:** [HL.2/low-degree-identifications](#HL-2-low-degree-identifications), [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), [HL.2/cohomological-dimension-and-tate-twists](#HL-2-cohomological-dimension-and-tate-twists), [HL.2/finite-coefficient-duality](#HL-2-finite-coefficient-duality), [HL.2/nonreal-local-cd-bound](#HL-2-nonreal-local-cd-bound), [HL.7/brauer-invariant-comparison](#HL-7-brauer-invariant-comparison), [HL.7/finite-duality-comparison](#HL-7-finite-duality-comparison).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

The ordinary local class formation and finite local Artin map with arithmetic Frobenius normalization; higher symbols are added in HL.3.

**Direct consumers:** [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.3/isomorphism-theorem](#HL-3-isomorphism-theorem), [HL.7/dimension-one-artin-map-comparison](#HL-7-dimension-one-artin-map-comparison).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

The ordinary absolute local Artin homomorphism on its canonical Galois carrier, finite restrictions and conductor normalization, for equality-of-map comparisons.

**Direct consumers:** [HL.3/reciprocity-map](#HL-3-reciprocity-map), [HL.7/dimension-one-artin-map-comparison](#HL-7-dimension-one-artin-map-comparison).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence

Ordinary arithmetic local existence and norm-index/completion in its full stated mixed/equal-characteristic scope. The equal-characteristic p-primary existence input is separately imported from FA.4/local-abelian-existence.

**Direct consumers:** [HL.3/existence-theorem](#HL-3-existence-theorem), [HL.7/dimension-one-artin-map-comparison](#HL-7-dimension-one-artin-map-comparison).

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles

Number-field finite ideles, principal diagonal and degree-one comparison, including the separate archimedean extension for full ordinary ideles.

**Direct consumers:** [HL.5/higher-idelic-and-cycle-complex-input](#HL-5-higher-idelic-and-cycle-complex-input), [HL.5/acceptance-recover-ideles-and-list-surface-flags](#HL-5-acceptance-recover-ideles-and-list-surface-flags), [HL.6/reduction-of-the-curve-case](#HL-6-reduction-of-the-curve-case).

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions

Complete discrete valuation field/residue interfaces, one-local topology and finite extension degree formula; HL.0 supplies only the iterated residue tower and higher structure.

**Direct consumers:** [HL.0/n-dimensional-local-field](#HL-0-n-dimensional-local-field), [HL.0/standard-mixed-series](#HL-0-standard-mixed-series), [HL.0/classification-and-standard-fields](#HL-0-classification-and-standard-fields), [HL.0/extensions-and-ramification-matrix](#HL-0-extensions-and-ramification-matrix).

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration

The ordinary lower/upper ramification and Herbrand interfaces in the one-local case; Zhukov’s two-dimensional constant/ferocious refinement remains HL.4.

**Direct consumers:** [HL.4/ramification-filtrations-and-their-indexing](#HL-4-ramification-filtrations-and-their-indexing).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality

The canonical continuous Galois-cohomology carrier and functorial field/Galois restriction maps; do not substitute discrete group cohomology.

**Direct consumers:** [HL.0/perfect-and-quasi-finite-variants](#HL-0-perfect-and-quasi-finite-variants), [HL.2/finite-kato-coefficient-complex](#HL-2-finite-kato-coefficient-complex), [HL.6/constant-place-fields](#HL-6-constant-place-fields).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees

All-degree continuous cohomology, Hochschild–Serre and finite transfer with cor∘res=[L:E], trace, localization-compatible finite support and coefficient-change maps in their stated regimes.

**Direct consumers:** [HL.2/finite-kato-coefficient-complex](#HL-2-finite-kato-coefficient-complex), [HL.2/restriction-corestriction](#HL-2-restriction-corestriction), [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), [HL.2/finite-coefficient-duality](#HL-2-finite-coefficient-duality), [HL.6/lgp-global-base](#HL-6-lgp-global-base), [HL.6/kato-hasse-global-models](#HL-6-kato-hasse-global-models).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension

Ordinary ℓ-cohomological dimension, its henselian local-field inputs and the bound cd_ℓ(L)≤cd_ℓ(k)+td(L/k) for the finitely generated field extensions used by the nonreal local-place estimate.

**Direct consumers:** [HL.2/cohomological-dimension-and-tate-twists](#HL-2-cohomological-dimension-and-tate-twists), [HL.2/nonreal-local-cd-bound](#HL-2-nonreal-local-cd-bound).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

All-degree cup products with finite Tate twists, graded signs, projection formula and trace pairing, compatible with residue induction.

**Direct consumers:** [HL.2/restriction-corestriction](#HL-2-restriction-corestriction), [HL.2/finite-coefficient-duality](#HL-2-finite-coefficient-duality), [HL.2/two-dimensional-residue-pairing-acceptance](#HL-2-two-dimensional-residue-pairing-acceptance), [HL.4/explicit-formulas-for-the-hilbert-symbol](#HL-4-explicit-formulas-for-the-hilbert-symbol), [HL.6/lgp-global-base](#HL-6-lgp-global-base), [HL.7/finite-duality-comparison](#HL-7-finite-duality-comparison).

## Pinned library boundary and suggested file

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Every baseline declaration below was read at its pin. Existing continuous cochain functoriality is a limited building block, not all-degree duality. Abstract `GaloisCategory` does not supply the scheme étale fundamental group. Native Laurent-series completeness concerns the outer topology. `RestrictedProduct` supplies the ordinary cofinite construction, not the recursive higher adelic restrictions.

The suggested file has three real-bodied light definitions on existing carriers: `HigherLaurent.coefficientBox`, `HigherLaurent.coefficientBasis` and `HigherLaurent.higherTopology`. It states additive continuity, coefficient continuity, the monomial-induced topology, Hausdorffness, equality with the outer topology precisely for discrete coefficients, and three examples. The remaining API and all heavy higher-field, Milnor, cohomological and scheme objects stay in this reader. Elaborating the file checks these signatures, not the proposed proofs.

| Pinned declaration | Module | What it supplies |
| --- | --- | --- |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | Schemes, on which the flags of a Parshin chain are taken. |
| `mathlib:CategoryTheory.GaloisCategory` | `Mathlib/CategoryTheory/Galois/Basic.lean` | An abstract pre-Galois category admitting a fiber functor to finite sets; not the arithmetic-scheme étale fundamental-group construction. |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | Adic completeness, used for the successive completions along a Parshin chain. |
| `mathlib:IsDedekindDomain` | `Mathlib/RingTheory/DedekindDomain/Basic.lean` | Dedekind domains, the dimension-one case of the schemes carrying Parshin chains. |
| `mathlib:IsDedekindDomain.FiniteAdeleRing` | `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean` | The finite adeles of a Dedekind domain, which the audit records as the dimension-one case of the higher adeles. |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | Discrete valuation rings, one step of a residue tower. |
| `mathlib:IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean` | Local rings, the setting of the residue map. |
| `mathlib:IsLocalRing.ResidueField` | `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean` | The residue field of a local ring, the map that is iterated n times to form the tower. |
| `mathlib:IsNonarchimedeanLocalField` | `Mathlib/NumberTheory/LocalField/Basic.lean` | The native valuative-topology, local compactness and nontrivial-valuation class. Compatibility with a chosen complete discrete valuation/residue tower is a theorem, not a definitional equality. |
| `mathlib:LaurentSeries` | `Mathlib/RingTheory/LaurentSeries.lean` | Laurent series over a field, with their X-adic valuation, integers and residue field. The audit records that each step of the equal-characteristic example exists this way and that only the two-step tower is missing. |
| `mathlib:NumberField.AdeleRing` | `Mathlib/NumberTheory/NumberField/AdeleRing.lean` | The adele ring of a number field, the other dimension-one case. |
| `mathlib:Padic` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean` | The p-adic numbers, the coefficient field of the mixed-characteristic two-dimensional example Q_p((t)). |
| `mathlib:PadicInt` | `Mathlib/NumberTheory/Padics/PadicIntegers.lean` | The p-adic integers. |
| `mathlib:PerfectRing` | `Mathlib/FieldTheory/Perfect.lean` | Perfect rings, the condition on the last residue field in the variant of the theory over a perfect field. |
| `mathlib:PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | Power series, the ring of integers of a Laurent series field and the carrier of the explicit reciprocity formulas. |
| `mathlib:ProfiniteGrp` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean` | Profinite groups, in which the absolute Galois group and the target of the reciprocity map live. |
| `mathlib:RestrictedProduct` | `Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean` | General restricted products, the construction out of which the higher adeles are built; the audit names it as the available half of that target. |
| `mathlib:UniformSpace.Completion` | `Mathlib/Topology/UniformSpace/Completion.lean` | Completions of uniform spaces, used for the higher topology and for the completions of the chain. |
| `mathlib:Valuation` | `Mathlib/RingTheory/Valuation/Basic.lean` | Valuations on a ring, in which the rank-n valuation of a higher local field is built. |
| `mathlib:ValuationSubring` | `Mathlib/RingTheory/Valuation/ValuationSubring.lean` | Valuation subrings, the one-step analogue of the ring O_K of a higher local field. |
| `mathlib:Valued` | `Mathlib/Topology/Algebra/Valued/ValuationTopology.lean` | Valued fields with their valuation topology, the carrier of each single step of a residue tower. |
| `mathlib:Valued.integer` | `Mathlib/Topology/Algebra/Valued/ValuedField.lean` | The ring of integers of a valued field. |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | Witt vectors, the coefficients of Kato's cohomology groups in characteristic p and of Artin-Schreier-Witt theory. The audit records that Mathlib has Witt vectors and no de Rham-Witt complexes. |
| `mathlib:WittVector.frobenius` | `Mathlib/RingTheory/WittVector/Frobenius.lean` | The Frobenius on Witt vectors, which appears in the relation (F-1)(w) defining Kato's groups. |
| `tauceti:TauCeti.ContinuousCohomology.cochainsMap_zero` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Additive.lean` | The map of continuous cochain complexes induced by the zero coefficient morphism is zero. This declaration does not by itself supply twists, all-degree duality or cohomological dimension. |
| `tauceti:TauCeti.Place.ramificationGroup` | `TauCeti/FieldTheory/FunctionField/Place/Extension/RamificationGroup.lean` | Lower-numbering ramification groups for the places of a function field. The audit records that Tau Ceti has these and no upper numbering and no Milnor K filtrations. |
| `tauceti:TauCeti.unitFiltration` | `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean` | The unit filtration of a local field, which is the K_1 filtration at n = 1 and the one-dimensional case of the filtration on the Milnor K-groups. |
| `mathlib:LaurentSeries.valued` | `Mathlib/RingTheory/LaurentSeries.lean` | Native outer T-adic valued structure, not the higher topology. |
| `mathlib:LaurentSeries.valuation_le_iff_coeff_lt_eq_zero` | `Mathlib/RingTheory/LaurentSeries.lean` | v(f)≤exp(−D) iff f_i=0 for i<D; fixes the valuation/order sign. |
| `mathlib:LaurentSeries.instLaurentSeriesComplete` | `Mathlib/RingTheory/LaurentSeries.lean` | Completeness for the native outer topology only. |
| `mathlib:HahnSeries.coeff_add` | `Mathlib/RingTheory/HahnSeries/Addition.lean` | The coefficient of a sum is the sum of coefficients. |
| `mathlib:HahnSeries.coeff_neg` | `Mathlib/RingTheory/HahnSeries/Addition.lean` | The coefficient of a negative is the negative coefficient. |
| `mathlib:HahnSeries.coeff_zero` | `Mathlib/RingTheory/HahnSeries/Basic.lean` | The zero series has zero coefficients. |
| `mathlib:HahnSeries.single` | `Mathlib/RingTheory/HahnSeries/Basic.lean` | The native Laurent/Hahn monomial supported at one exponent. |
| `mathlib:HahnSeries.coeff_single` | `Mathlib/RingTheory/HahnSeries/Basic.lean` | A monomial has the specified coefficient at its exponent and zero elsewhere. |
| `mathlib:HahnSeries.coeff_injective` | `Mathlib/RingTheory/HahnSeries/Basic.lean` | All coefficients determine a Hahn series. |
| `mathlib:OpenAddSubgroup` | `Mathlib/Topology/Algebra/OpenSubgroup.lean` | An additive subgroup with an open carrier. |
| `mathlib:NonarchimedeanAddGroup` | `Mathlib/Topology/Algebra/Nonarchimedean/Basic.lean` | Every zero-neighborhood contains an open additive subgroup; extends the topological additive-group class. |
| `mathlib:AddGroupFilterBasis` | `Mathlib/Topology/Algebra/FilterBasis.lean` | An additive-group filter basis, with zero/addition/negation/translation-conjugation axioms. |
| `mathlib:GroupFilterBasis.topology` | `Mathlib/Topology/Algebra/FilterBasis.lean` | The native group-basis topology, with the generated additive counterpart used here. The attached isTopologicalGroup instance and its additive counterpart were also read at lines 193–217; the declaration index omits the named instance, so this record cites the indexed construction rather than inventing an indexed name. |
| `mathlib:GroupFilterBasis.nhds_one_hasBasis` | `Mathlib/Topology/Algebra/FilterBasis.lean` | The native basis theorem at the identity, including the generated zero-neighborhood version. |
| `mathlib:OpenSubgroup.mem_nhds_one` | `Mathlib/Topology/Algebra/OpenSubgroup.lean` | Open subgroups are identity-neighborhoods, with the generated additive version. |
| `mathlib:Valued.hasBasis_nhds_zero` | `Mathlib/Topology/Algebra/Valued/ValuationTopology.lean` | The native valued zero-neighborhood basis. |
| `mathlib:discreteTopology_iff_isOpen_singleton_one` | `Mathlib/Topology/Algebra/Group/Basic.lean` | Discrete group topology iff the identity singleton is open, with the generated additive counterpart. |
| `mathlib:groupFilterBasisOfComm` | `Mathlib/Topology/Algebra/FilterBasis.lean` | The commutative group-filter-basis constructor with five supplied axioms; its generated additive counterpart constructs the light coefficient basis. |

**Accepted ownership decision RS-28.** This extends Tau Ceti ClassFieldTheory. One-local fields, generic profinite cohomology, generic Milnor K/residue/norm theory, ordinary Hilbert symbols and both ordinary global reciprocity branches are imported. M.5d supplies coefficient reductions only; BGK remains the explicitly unowned/widened-L.5 request. FA.4 owns equal-characteristic p-primary one-local existence and completion. HL.7 retains mathematical comparison diagrams.

**Readonly current-upstream audit.** Current TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 and current TauCeti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were read without building. The nine post-snapshot roadmaps’ Suggested files were searched and the relevant ProfiniteArithmetic and LocalGaloisGroups readers were read in full. Completed roadmaps were also searched; RestrictedProducts supplies ordinary cofinite maps and congruences, not recursive higher adeles. Their ordinary profinite/Galois and ramification interfaces are existing work; no higher residue-tower, higher Milnor or higher adelic implementation was found. These current trees inform ownership, not the pinned baseline.

**Source and planning boundary.** Every stage is planned at target level; no stage is closed. Public source statements and proof outlines specify the exact targets. Missing primary proofs, wild coefficient comparisons and unresolved supplier ownership are fifteen named gaps. Source reading is recorded per document without treating a cited original proof as read. All source statements are authored paraphrases; no source passage or excerpt is retained.

**Preserved coefficient-topology component.** The eighteen existing fine HL.0 nodes retain their identifiers and complete mathematical API. The suggested file contains only three light real-bodied definitions, end milestones and three examples on the pinned LaurentSeries carrier. It does not develop the auxiliary lemma chain or invent absent higher objects.

**Milne tower-index convention.** In Theorem 2.17, K_i denotes the i-local field, so the prime condition is ℓ≠char F_1, where F_1 is the one-local bottom field. It is not enough merely to test the outer first residue F_{n−1} when n>2. If F_1 has characteristic zero, ordinary one-local duality permits its residue prime at the bottom step.

**Mathlib design searches, 2026-10-18.** Read-only GitHub searches of open mathlib4 PRs for Milnor, higher local, adele and logarithmic Witt found no matching higher-field implementation. The adele search returned PR 36404 (https://github.com/leanprover-community/mathlib4/pull/36404), whose file inventory concerns ordinary number-field adeles and finite-place valuation infrastructure; that belongs to the imported ordinary owner. The Milnor search hit PR 44404 on sigma-locally-finite families, not K-theory. Targeted public Zulip-archive searches found the March 2024 ramification discussion (https://leanprover-community.github.io/archive/stream/113489-new-members/topic/preimage.20of.20quotient.20galois.20group.html), which emphasizes ordinary discrete-valuation scope and conventional lower/upper numbering. These limited searches are not exhaustive absence proofs.

**Independent implementation leads.** The external NYLL source at commit 431143bad96b10a8f80381346ed1631ce463b055 defines ValuationTheory.IsHigherLocalField by actual complete-DVR residue recursion and proves finite-extension permanence (https://github.com/n-yamaguchi-0729/NYLL/blob/431143bad96b10a8f80381346ed1631ce463b055/Nyll/Yamaguchi26AbfaithfulGalois/HigherLocalField/Basic.lean). Basic, PositiveCharacteristic and Properties were read as design references. This is an existential predicate over NYLL CompleteDVF, whereas the target here carries a compatible chosen tower and topology; no equivalence to the pinned native carriers is presumed. Its imported dependency graph has not been audited or elaborated at the pins. Robin Carlier’s KMilnorWitt project (https://github.com/robin-carlier/KMilnorWitt) formalizes Milnor–Witt ring presentations; its README lists ordinary Milnor K as a further quotient still to construct. These are independent implementation leads, not baseline declarations. No code is integrated or copied; any proposed port requires author coordination and a license/interface audit.

## Exact remaining proof and ownership work

All eight layers are planned. The following inputs prevent closure and define the follow-up work after independent review. Nothing here authorizes replacing a missing theorem by a weaker unnamed premise. An implementation must satisfy the target hypotheses and the imported contracts before claiming the corresponding layer complete.

<a id="g01"></a>
### G01: Classification and topology proof suppliers

The equal-characteristic and intermediate-characteristic target statements are read, but the proof suppliers for Cohen lift invariance and Epp standardization are not decomposed here. LFR.0 supplies only one-local structure; it does not close Epp for imperfect residue fields. Need the precise Epp theorem, its correction hypotheses, and the Madunts–Zhukov topology-invariance argument before declaring these targets closed.

**Direct consumers:** [HL.0/classification-and-standard-fields](#HL-0-classification-and-standard-fields), [HL.0/higher-topology](#HL-0-higher-topology).

<a id="g02"></a>
### G02: Three different higher openness notions

Kato §1 Lemma 2 proves presentation independence for finite quotients. It does not by itself identify categorical openness with every raw higher or λ_n topology. Morrow Theorem 4.17, p. 30, states a saturated ind/pro comparison in positive first-residue characteristic but reports its proof unpublished. Need a verified comparison for the exact finite-index subgroup class used in HL.3, with the characteristic-zero section dependence retained. The multiplicative comparison must distinguish positive first-residue characteristic from the Zhukov/Fesenko characteristic-zero pullback (I §1.4.2, pp. 14–16; §6.3, p. 64). In Q_p((t)), 1+t is indistinguishable from 1 for that pullback and survives as a distinct point for the Hausdorff graph convention. A comparison that identifies these conventions is false.

**Direct consumers:** [HL.0/topology-on-the-multiplicative-group](#HL-0-topology-on-the-multiplicative-group), [HL.0/pro-ind-finite-objects](#HL-0-pro-ind-finite-objects), [HL.0/higher-topology](#HL-0-higher-topology), [HL.3/existence-theorem](#HL-3-existence-theorem).

<a id="g03"></a>
### G03: Full wild higher cohomology proof

The survey statements and Kato existence Theorems 1–2 are read, together with §§1–2 and the conductor/prime-power argument in §5. The Kato II article remains an unread scanned proof source, and the middle proof lemmas on pp. 174–190 of the existence article are not extracted. Need exact p-rank/top-degree calculation, finite-conductor graded duality, and Proposition 7 root-of-unity/Bockstein lifting, including p=2, before treating the wild invariant, character theorem and all-prime existence proofs as closed.

**Direct consumers:** [HL.2/kato-residue-theorem-and-the-invariant-map](#HL-2-kato-residue-theorem-and-the-invariant-map), [HL.2/finite-coefficient-duality](#HL-2-finite-coefficient-duality), [HL.2/cohomological-dimension-and-tate-twists](#HL-2-cohomological-dimension-and-tate-twists), [HL.3/existence-theorem](#HL-3-existence-theorem).

<a id="g04"></a>
### G04: BGK ownership and imperfect-residue logarithmic comparison

Accepted RS-28 leaves the generic Bloch–Gabber–Kato isomorphism K_i^M(E)/p^s≃W_sΩ^i_log unowned. The request to L.5 proposes a widened supplier or a separately assigned layer; existing L.5 nodes assume a complete mixed DVR with perfect residue and generally odd p. M.5d is only the prime-power/colimit/field-reduction bridge. Need BGK with finite-length trace/residue compatibility, and the mixed DVR comparison for imperfect residue fields. No existing perfect-residue L.5 theorem is claimed to provide this.

**Direct consumers:** [HL.2/norm-residue-and-the-symbol-identification](#HL-2-norm-residue-and-the-symbol-identification), [HL.2/logarithmic-de-rham-witt-coefficients](#HL-2-logarithmic-de-rham-witt-coefficients), [HL.2/restriction-corestriction](#HL-2-restriction-corestriction), [HL.2/low-degree-identifications](#HL-2-low-degree-identifications).

<a id="g05"></a>
### G05: Topological norm descent and all-prime divisible kernel

The quotient and structure statements are read in Fesenko §6.6–6.8. Need the complete prime-degree closed-norm/Hilbert-90 proof and the mixed-characteristic torsion/divisible-kernel argument with its p=2 supplier. The odd-p Vostokov formula alone does not close the all-prime claim. Generic algebraic transfers and projection formulas remain imported from K2 T.4.

**Direct consumers:** [HL.1/norms-and-projection-formulas](#HL-1-norms-and-projection-formulas), [HL.1/topological-versus-algebraic-k-groups](#HL-1-topological-versus-algebraic-k-groups), [HL.3/isomorphism-theorem](#HL-3-isomorphism-theorem).

<a id="g06"></a>
### G06: Strong AS-tree reduction and explicit inverse proof

Need the proofs behind Fesenko §10.4 properties (2)–(4): embedding a totally ramified cyclic degree-p extension in an AS tree, finding the totally ramified Q/F for which LQ/Q is strong with disjoint purely unramified parts, and the valuation calculation used in norm exactness. The polynomial definition is specified without invented valuation bounds. Then prove independence of the Frobenius-lift norm class and equality with the cohomological inverse. The cited primary Fesenko papers have not been read.

**Direct consumers:** [HL.3/artin-schreier-trees-and-the-explicit-construction](#HL-3-artin-schreier-trees-and-the-explicit-construction).

<a id="g07"></a>
### G07: Vostokov formula and arithmetic sign

Invitation I §8.4, p. 87, explicitly leaves the comparison to the Hilbert symbol up to sign. Need a primary proof of the sign for the exact Φ formula, Δ convention, outer-last differential orientation and arithmetic Artin normalization used here. Calibrate on a known ordinary Hilbert pair and a higher norm-compatible parameter example; do not assert equality from the source remark alone. The p=2 case needs Kato’s route, not this odd-p formula.

**Direct consumers:** [HL.4/vostokov-pairing-and-the-wild-existence-case](#HL-4-vostokov-pairing-and-the-wild-existence-case), [HL.4/explicit-formulas-for-the-hilbert-symbol](#HL-4-explicit-formulas-for-the-hilbert-symbol).

<a id="g08"></a>
### G08: Consistent rational ramification indices

Zhukov I §17.2, p. 145, prints integral constant labels, while the Herbrand map on p. 146 and the Milnor filtration on p. 149 use nonintegral constant arguments. Need a checked rational interpolation convention with strict valuation inequalities and endpoint continuity, plus a proof that the norm-index and upper-quotient formulas use that same convention. The stated scope is residue p-rank one/two-local; no all-dimensional index theory is assumed.

**Direct consumers:** [HL.4/ramification-filtrations-and-their-indexing](#HL-4-ramification-filtrations-and-their-indexing).

<a id="g09"></a>
### G09: Completed exponential construction proof

Kurihara’s survey states the exponential theorem and residue square but cites [Ku3] for the construction. Need the original theorem with the corrected q−1 domain, all completed differential relations, and Kato’s completed residue on E{{T}}. No kernel identification is supplied: the survey lists that as a separate open problem.

**Direct consumers:** [HL.4/kurihara-exponential-and-differential-forms](#HL-4-kurihara-exponential-and-differential-forms).

<a id="g10"></a>
### G10: Excellence, henselian/completed flags and relative Milnor sheaves

Need the precise completion/localization theorem for reduced excellent semilocal chains, compatibility of reciprocity on henselian factors with their completions, and Kerz Theorem 8.2’s punctured-spectrum relative Milnor/Gersten argument. SF.0/SF.2 supply schemes and Nisnevich stalks, not these complete higher-factor and relative-sheaf comparison proofs. All branch factors and inseparable residue norms must be retained.

**Direct consumers:** [HL.5/parshin-chains](#HL-5-parshin-chains), [HL.5/nisnevich-class-group-comparison](#HL-5-nisnevich-class-group-comparison), [HL.6/global-reciprocity-for-arithmetic-schemes](#HL-6-global-reciprocity-for-arithmetic-schemes).

<a id="g11"></a>
### G11: Exact adelic functors and flasque resolution

The full recursive definition and the resolution statement are read in Morrow §8. The source points to Huber for the well-defined exact functor proof and to Beilinson for the resolution. Need those proofs with the specific product/inverse-limit/filtered-colimit order and the stalk contracting homotopy. RestrictedProduct alone only supplies the ordinary cofinite construction and does not discharge this input.

**Direct consumers:** [HL.5/higher-adeles](#HL-5-higher-adeles), [HL.5/adelic-resolution](#HL-5-adelic-resolution).

<a id="g12"></a>
### G12: Codimension-two reciprocity and wild niveau comparison

Need Kato’s two-dimensional local reciprocity theorem with branch norms, and the identification of the chosen cohomological residue differential with the niveau d1, including its signs. For p-power coefficients in characteristic p use logarithmic purity and the Jannsen–Saito–Sato comparison; for a mixed residue-characteristic coefficient do not infer a universal boundary. The exact-couple proof of square-zero is valid only after these components and finite support are established.

**Direct consumers:** [HL.6/reciprocity-relations](#HL-6-reciprocity-relations), [HL.6/kato-complexes-and-boundary-square-zero](#HL-6-kato-complexes-and-boundary-square-zero), [HL.5/residue-maps-along-a-flag](#HL-5-residue-maps-along-a-flag).

<a id="g14"></a>
### G14: Global class-field proof and scheme target carrier

Kerz §9 supplies exact target statements but cites Kato–Saito and Kerz–Schmidt/Wiesend for their proofs. Need the finite norm/existence proof for C(F;X), its modulus finiteness, and the characteristic-zero connected-kernel theorem. SF.2 must supply the finite-étale-cover Galois category, π_1^ab, and regular-scheme purity, rather than treating Mathlib’s abstract GaloisCategory as the scheme fundamental group. Tame quotients require the curvewise wild-inertia comparison; identification with a reduced modulus is not asserted.

**Direct consumers:** [HL.6/global-reciprocity-for-arithmetic-schemes](#HL-6-global-reciprocity-for-arithmetic-schemes), [HL.6/wiesend-class-group](#HL-6-wiesend-class-group), [HL.6/tame-and-wild-proper-and-open-variants](#HL-6-tame-and-wild-proper-and-open-variants).

<a id="g13"></a>
### G13: Hasse proof inputs: weights, degree control and characteristic two

Jannsen Theorem 2.10 uses the weight statement Theorem 2.4, not read here in full, and Gabber’s prime-to-ℓ alteration theorem (Theorem 2.11, pp. 24–25). The generic degree-controlled alteration supplier is the routed PrimeToDegreeAlterations direction; SF.4’s ordinary de Jong theorem does not suffice and is not replanned here. Need the finite-coefficient norm-residue/Bockstein reduction, henselian local cd₂ comparison, and the exact low-dimensional characteristic-two Kato/Suwa theorem and high-dimensional compactification proof used by Dittmann–Pop Fact 2.3. The Res(F₂) clauses stay explicit assumptions; no general resolution result is inferred.

**Direct consumers:** [HL.6/lgp-global-base](#HL-6-lgp-global-base), [HL.6/lgp-good-model](#HL-6-lgp-good-model), [HL.6/lgp-characteristic-two](#HL-6-lgp-characteristic-two), [HL.6/kato-hasse-global-models](#HL-6-kato-hasse-global-models), [HL.2/nonreal-local-cd-bound](#HL-2-nonreal-local-cd-bound).

<a id="g15"></a>
### G15: Comparison diagrams with actual consumer carriers

Need a common separable-closure/Galois carrier for equality of the ordinary and higher Artin maps, and the chain-level cup/residue/trace sign comparison for the Brauer, finite-duality and motivic diagrams. The invertible-coefficient motivic localization comparison is imported from K2SymbolsBrauer:T.3; logarithmic purity and BGK remain G04/G12. These are comparison proof obligations, not permission to replan the ordinary maps, generic duality or norm-residue theory.

**Direct consumers:** [HL.7/dimension-one-artin-map-comparison](#HL-7-dimension-one-artin-map-comparison), [HL.7/brauer-invariant-comparison](#HL-7-brauer-invariant-comparison), [HL.7/finite-duality-comparison](#HL-7-finite-duality-comparison), [HL.7/motivic-residue-comparison](#HL-7-motivic-residue-comparison).

## Sources and reading extent

All mathematical statements in this document and packet are in the planner’s own words. Citations identify the source location and do not reproduce source passages. A theorem’s cited primary proof is not counted as read unless the reading extent below says so. The source-issue reports distinguish mathematical corrections from the missing proof work above.

### Invitation to higher local fields

Ivan Fesenko and Masato Kurihara, editors; cited chapters by I. Zhukov, O. Izhboldin, M. Kurihara, I. Fesenko, S. V. Vostokov and K. Kato. Geometry & Topology Monographs 3 (2000); printed page locators; physical page = positive printed page + 12. [Public source](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf), accessed 2026-10-18. SHA-256: `a6c9088000d9b18ded4d2159531d7544683b86d6eecdbb2ab6cc9b743baabe62`.

- Zhukov I §1, pp. 5–18, in full; higher field structure, expansions, additive and multiplicative topologies.
- Izhboldin I §2.4, pp. 25–26: differential symbol and finite-length generalization statement only; its primary proof is not read.
- Kurihara I §5, pp. 53–60, in full; the proof sketch depends on the preceding Bloch–Kato filtration calculation, not extracted here.
- Fesenko I §§6–7, pp. 61–73 and 75–79, in full; Vostokov I §8, pp. 81–87, in full; Kurihara I §9, pp. 91–94, in full.
- Fesenko I §10, pp. 95–101, in full; Zhukov I §17, pp. 143–150, in full.
- Kato, existence paper, pp. 165–173 and 191–194 only. Middle proof pp. 174–190 and concluding p. 195 are not treated as read; their missing proofs are G03.
- Earlier-worker limited reading and author-copy checks are retained in sourceVersions with their own dates; the present reading is 2026-10-18.

### An introduction to higher dimensional local fields and adeles

Matthew Morrow. arXiv:1204.0586v2 (2012), 72 PDF pages; printed page locators. [Public source](https://arxiv.org/pdf/1204.0586v2), accessed 2026-10-18. SHA-256: `c996cd77420a87bc1b657d7216f71f659f343cffe26046d171fade0eecf8b141`.

- §2, pp. 9–16, and §§3–4, pp. 18–30: the cited classification/parameters/extensions, rank-ring and topology statements; issue-bearing formulas checked visually.
- §5, pp. 30–37, in full; §6 regular chains, pp. 37–43; §7.1, pp. 44–46. The four misprints reported in E7–E10 are scoped to arXiv v2 and the limited author-copy comparison.
- §§8.1–8.3, pp. 53–60, in full; dimension-one comparison §8.4, p. 62; surface description §8.5, pp. 63–65. Huber’s primary construction and resolution proof remain G11.

### Ideles in higher dimension

Moritz Kerz. arXiv:0907.5337v3 (2011), 16 pages. [Public source](https://arxiv.org/pdf/0907.5337v3), accessed 2026-10-18. SHA-256: `616fd1b1ce373cd9c5990228e4cce4248aac2c3f7fceb1ea6f6b2050db5d48d5`.

- Entire 16-page paper read; §§4–6 and 9 rechecked for canonical modulus topology, inverse limits, finite norm theorem and completion.
- The primary proofs cited in §9 are not thereby read. They remain G14.

### Cohomological Hasse principle and motivic cohomology for arithmetic schemes

Moritz Kerz and Shuji Saito. Publications Mathématiques de l’IHÉS 115 (2012), pp. 123–183; published open PDF. [Public source](https://www.numdam.org/article/PMIHES_2012__115__123_0.pdf), accessed 2026-10-18. SHA-256: `f4bb5f8b378c148f4b458b964f78761156255396e1bade5d7a11717fef2689e7`.

- Introduction pp. 123–129; §1 Definitions 1.1–1.2 and niveau construction, pp. 129–132.
- §6: condition (G), Theorem 6.2 and Corollary 6.3, pp. 162–163; §7 Theorem 7.7 and Lemma 7.8, pp. 168–169.
- §8, pp. 169–174, in full, including Theorems 8.1–8.4 and their proof reductions. The earlier weight and alteration proof chain is not claimed closed.

### Hasse principles for higher-dimensional fields

Uwe Jannsen. Annals of Mathematics 183 (2016), pp. 1–71; published open PDF. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf), accessed 2026-10-18. SHA-256: `26dde9260f6475e4f6acbfbe651e18fac0d443a5f318fbf3974efc9f809f7d71`.

- Introduction pp. 1–7, including Theorem 0.4 and characteristic-p homology statements.
- Theorem 2.10 and proof, and Gabber’s Theorem 2.11, pp. 24–25; the preceding weight theorem proof is not read in full.
- §4 cohomological complexes (4.1)–(4.4), pp. 40–43; Definition 4.18, Theorem 4.19 and Lemma 4.20, pp. 48–50.

### Arithmetic Duality Theorems

James S. Milne. Second edition (2006), author PDF hosted by Brian Conrad; 347 PDF pages. [Public source](https://math.stanford.edu/~conrad/BSDseminar/refs/MilneADT.pdf), accessed 2026-10-18. SHA-256: `2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31`.

- I §2, pp. 37–40, including the d-local indexing preceding Theorem 2.17, its statement and proof, Lemma 2.18 and Corollary 2.19. K_1 here is the one-local bottom field, not the first residue of K_d.

### Characterizing finitely generated fields by a single field axiom

Philip Dittmann and Florian Pop. arXiv:2012.01307v2, 27 April 2023; final author version of Annals of Mathematics 198 (2023), pp. 1203–1227. [Public source](https://arxiv.org/pdf/2012.01307v2), accessed 2026-10-18. SHA-256: `f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f`.

- §2, author-version pp. 3–5, in full, including coefficients, place fields, Facts 2.1–2.3 and both resolution clauses.
- The local cohomological-dimension step of Proposition 3.2 was checked against the reviewed routed correction nonreal-local-cd-bound. This packet does not replan the paper’s model theory or Pfister-form suppliers.

The earlier limited published/author-copy checks remain attributed in the packet’s `sourceVersions`; they are not claims of fresh complete reading. The unread scanned Kato II article is a proof-source lead in G03, not a source used as if its proof had been inspected.

## Independently checked source issues

### E1: Zhukov, Part I §1.1, printed p. 6 (physical p. 18), paragraph preceding Classification Theorem; published MSP volume.

**Observed issue.** The source asserts that the Teichmüller representatives R inside O_K form a field isomorphic to K_0.

**Correction.** The stated preceding hypothesis char(k_K)=p includes mixed characteristic. Require char(K)=p for the assertion that these representatives form a field; in mixed characteristic they give multiplicative representatives, not a subfield. Additive expansions require representatives, not a field structure on them.

**Reason.** For K=Q_3 the last residue field is F_3 and the representatives are 0, 1, −1. They satisfy the stated residue-characteristic hypothesis, but 1+1=2 is not in that set in Q_3. No field of characteristic zero contains a finite subfield. Zhukov p. 14 correctly distinguishes A=K_0 in characteristic p from A=W(K_0) in characteristic zero.

**Classification:** error; affects a stated result; reported as new after the recorded limited correction search; independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

**Review.** Confirmed at published printed p. 6: Q_3 satisfies the stated residue-characteristic assumption, but its Teichmüller representatives are not additively closed. Equal characteristic is required for the field assertion.

- MSP volume contents https://msp.org/gtm/2000/03/ and article page https://msp.org/gtm/2000/03/p001.xhtml, inspected 2026-09-27; no correction link found.
- arXiv https://arxiv.org/abs/math/0012132 submission history lists only v1; checked 2026-09-27.
- Author publication profile https://www.mathnet.ru/eng/person13714 and title/author/Teichmüller/errata searches, 2026-09-27; no correction located. This search does not establish priority.
- Author-hosted Part I https://ivanfesenko.org/wp-content/uploads/2021/10/m3-partI.pdf checked 2026-09-27 at the issue-bearing page; the same printed statement remains. Exact hash and limited reading extent are recorded in sourceVersions.

### E2: Kurihara, Part I §5.1, printed p. 55 (physical p. 67), target group immediately after the displayed lifted symbol; published MSP volume.

**Observed issue.** The lifted symbol is assigned cohomological degree one in the displayed target.

**Correction.** The lifted cup-product symbol has target H^q(K, Z/p^n(q − 1)).

**Reason.** The first factor i(w) has degree one and each of the q−1 Kummer factors has degree one; their cup product has degree q and twist q−1. The map being defined on this page is i_F^K:H^q(F)→H^q(K). The exponent 1 was verified visually in the published PDF.

**Classification:** misprint; affects nothing; reported as new after the recorded limited correction search; independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

**Review.** Confirmed at published printed p. 55: the lifted character has cohomological degree one, and its q−1 Kummer factors give total degree q and twist q−1.

- MSP volume contents and article page https://msp.org/gtm/2000/03/p005.xhtml, inspected 2026-09-27; no correction link found.
- arXiv https://arxiv.org/abs/math/0012136 history checked 2026-09-27; only v1 listed.
- Title/author/errata and correction searches on 2026-09-27 found no correction. The attempted author homepage https://www.math.keio.ac.jp/~kurihara/ was unavailable to the fetcher; this is not a negative search of that page.
- Author-hosted Part I https://ivanfesenko.org/wp-content/uploads/2021/10/m3-partI.pdf checked 2026-09-27 at the issue-bearing page; the same printed statement remains. Exact hash and limited reading extent are recorded in sourceVersions.

### E3: Kurihara, Part I §5.2, printed p. 56 (physical p. 68), sentence beginning “Since the isomorphism”; published MSP volume.

**Observed issue.** The sentence after the invariant display lowers the domain degree from d+1 to d.

**Correction.** The invariant has domain H^{d+1}(K).

**Reason.** The invariant displayed above that sentence and both entries in the immediately following corestriction square are H^{d+1}; the text has dropped the +1. Verified visually. For a one-dimensional local field the invariant is on H^2=Br, not H^1 of characters.

**Classification:** misprint; affects nothing; reported as new after the recorded limited correction search; independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

**Review.** Confirmed at published printed p. 56: the adjacent invariant display and corestriction square both use degree d+1; the one-local case is Br=H².

- MSP volume contents and article page https://msp.org/gtm/2000/03/p005.xhtml, inspected 2026-09-27; no correction link found.
- arXiv https://arxiv.org/abs/math/0012136 history checked 2026-09-27; only v1 listed.
- Title/author/errata and correction searches on 2026-09-27 found no correction. The attempted author homepage https://www.math.keio.ac.jp/~kurihara/ was unavailable to the fetcher; this is not a negative search of that page.
- Author-hosted Part I https://ivanfesenko.org/wp-content/uploads/2021/10/m3-partI.pdf checked 2026-09-27 at the issue-bearing page; the same printed statement remains. Exact hash and limited reading extent are recorded in sourceVersions.

### E4: Fesenko, Part I §10.5, Corollary 1, printed p. 100 (physical p. 112), published MSP volume.

**Observed issue.** The source asserts injectivity of the reciprocity morphism Ψ_F: K_n^top(F) → Gal(L/F).

**Correction.** Replace Gal(L/F) by Gal(F^ab/F), the target of Ψ_F defined on p. 99 and used in Theorem 3 on p. 100. A finite-extension target requires quotienting by the norm group.

**Reason.** The preceding construction defines the absolute reciprocity map. The displayed finite target cannot receive an injection from K_n^top(F), which has an infinite valuation factor. Already for n=1, F=F_q((t)) and L=F the finite-target assertion would inject F× into the trivial group. The printed target was checked visually.

**Classification:** misprint; affects nothing; reported as new after the recorded limited correction search; independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

**Review.** Confirmed at published printed p. 100: the named map is absolute reciprocity. Taking L=F contradicts the printed finite target; a finite target needs the norm quotient.

- MSP volume PDF and contents checked 2026-09-27; the published p. 100 still has Gal(L/F). The article-page fetch failed and is not counted as a negative correction search.
- https://arxiv.org/abs/math/0012141 history checked 2026-09-27; only v1 is listed.
- Author research page https://ivanfesenko.org/?page_id=126 and its linked Part I PDF https://ivanfesenko.org/wp-content/uploads/2021/10/m3-partI.pdf checked 2026-09-27. The same target remains on printed p. 100; exact hash is recorded in sourceVersions.
- Title/author/errata searches on 2026-09-27 found no correction. This finding is independently confirmed here and makes no priority claim.

### E5: Kurihara I §9.1, theorem, printed p. 92 (physical p. 104).

**Observed issue.** The exponential theorem displays differential degree q in the domain of the map to degree-q Milnor K-theory.

**Correction.** The source formula requires Ω̂^{q−1}_{O_K} as domain of exp_η^q, not Ω̂^q.

**Reason.** Its input is a coefficient times q−1 logarithmic differentials. For q=1 the map is the ordinary exponential on O_K, whereas the printed domain would be one-forms. The residue square on p. 93 also lowers differential and Milnor degrees together.

**Classification:** misprint; affects nothing; reported as new after the recorded limited correction search; independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

**Review.** Confirmed at published printed p. 92: the formula has q−1 logarithmic inputs, and q=1 must recover the exponential on scalars. The correction is already used by the node.

- Title/author/errata searches on 2026-10-18 located no correction; this limited search makes no priority claim.
- arXiv math/0012140 submission history, checked 2026-10-18, lists only v1. The attempted MSP article XHTML fetch failed and is not counted as a negative search.

### E6: Fesenko I §10.4.1, strong Artin–Schreier tree definition, printed p. 98 (physical p. 110).

**Observed issue.** In the strong-tree sentence the smaller field E is expressed as a field generated over the larger field M, with the polynomial coefficient placed in M.

**Correction.** For each degree-p M/E require M=E(α), with α^p−α∈E.

**Reason.** If E⊂M and [M:E]=p>1 then E cannot equal M(α), which contains M. The preceding ordinary-tree definition gives the consistent orientation of both the extension and its polynomial coefficient.

**Classification:** misprint; affects nothing; reported as new after the recorded limited correction search; independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

**Review.** Confirmed at published printed p. 98: M/E has degree p, so the larger field must be generated over E with the Artin–Schreier coefficient in E.

- Fesenko/Artin–Schreier-tree/errata and strong-tree/correction searches on 2026-10-18 found no correction; this is not a priority claim.
- arXiv math/0012141 history checked 2026-10-18 lists only v1. The published MSP volume remains reversed at the cited page; the earlier-worker author-copy check did not cover this passage.


The following four findings concern the arXiv-v2 introductory notes. A limited comparison with the author-hosted PDF checked Theorem 2.18’s proof on p. 14, Proposition 3.8 on p. 21, and the boundary introduction and Remark 5.6 on p. 34. Its SHA-256 is `4d035eb5ec4a4b77d91b968cd6fb235e1a674ff988ebc854805fa3abcfc8317c`; [author copy](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Morrow%2C%20M.%2C%20Introduction%20to%20HLF.pdf), read 2026-10-18. These are separate versions with different pagination. No journal version or complete reading of the later copy is claimed.

### E7: §3, Proposition 3.8, printed p. 20 in arXiv:1204.0586v2; compare printed p. 21 of the author copy.

**Observed issue.** The localization formula uses n−1−i for the higher rank, and the unit decomposition repeats rank n−i on both sides.

**Correction.** For 1≤i≤n, write O_F^(n+1−i)[t_i⁻¹]=O_F^(n−i), with O_F^(0)=F, and (O_F^(n−i))×≃(O_F^(n+1−i))××t_i^Z. Use rank n+1−i in the corresponding proof step.

**Reason.** With n=2 and F=Q_p((t)), t_1=p: O_F^(2)=Z_p+t Q_p[[t]], and inverting p gives O_F^(1)=Q_p[[t]]. The printed n−1−i would invert p in rank zero F and incorrectly obtain its proper rank-one subring. The complementary unit factors are forced by the p-valuation.

**Classification:** misprint; affects a stated result; no correction found in the recorded limited search. Independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

- arXiv https://arxiv.org/abs/1204.0586 checked 2026-10-18: v1 (3 April 2012), v2 (1 August 2012), with no later revision or journal-version link listed.
- Author page https://www.imo.universite-paris-saclay.fr/~matthew.morrow/ and its linked introductory-notes PDF inspected 2026-10-18. The issue-bearing passages were compared in the actual downloaded PDF, with version hash and limited reading extent in sourceVersions; the problems remain there.
- Title/author/errata, Proposition 3.8/correction and Remark 5.6/tame-symbol searches on 2026-10-18 found no separate author correction. This limited search makes no priority claim; search-result renderings are not treated as the PDF text.

### E8: §2.1, proof of Theorem 2.18, printed p. 13 in arXiv:1204.0586v2; compare printed p. 14 of the author copy.

**Observed issue.** In the intermediate characteristic case the proof sets K=F^(r) although r is the remaining mixed depth, and its concluding finite-extension assertion repeats K as both fields.

**Correction.** Use K=F^(n−r), where superscripts count successive residues. The final assertion is that K is a finite extension of the standard subfield K′.

**Reason.** The proof next applies induction to the first residue of K as an (r−1)-local field. F^(n−r) has dimension r; F^(r) instead has dimension n−r. For n=3,r=2 the latter is one-local and cannot have the required one-local first residue. A finite-extension conclusion must name the previously constructed embedded standard field K′.

**Classification:** misprint; affects the proof; no correction found in the recorded limited search. Independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

- arXiv https://arxiv.org/abs/1204.0586 checked 2026-10-18: v1 (3 April 2012), v2 (1 August 2012), with no later revision or journal-version link listed.
- Author page https://www.imo.universite-paris-saclay.fr/~matthew.morrow/ and its linked introductory-notes PDF inspected 2026-10-18. The issue-bearing passages were compared in the actual downloaded PDF, with version hash and limited reading extent in sourceVersions; the problems remain there.
- Title/author/errata, Proposition 3.8/correction and Remark 5.6/tame-symbol searches on 2026-10-18 found no separate author correction. This limited search makes no priority claim; search-result renderings are not treated as the PDF text.

### E9: §5.1, display preceding Proposition 5.5, printed p. 33 in arXiv:1204.0586v2; compare printed p. 34 of the author copy.

**Observed issue.** The introductory boundary display retains degree n in the residue-field target.

**Correction.** The DVR boundary is ∂:K_n^M(F)→K_{n−1}^M(κ(F)), as the following Proposition 5.5 states correctly.

**Reason.** A last uniformizer is removed. In degree one this map is the valuation F×→Z=K_0^M(κ(F)); a target K_1^M(κ(F)) has the wrong degree.

**Classification:** misprint; affects nothing; no correction found in the recorded limited search. Independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

- arXiv https://arxiv.org/abs/1204.0586 checked 2026-10-18: v1 (3 April 2012), v2 (1 August 2012), with no later revision or journal-version link listed.
- Author page https://www.imo.universite-paris-saclay.fr/~matthew.morrow/ and its linked introductory-notes PDF inspected 2026-10-18. The issue-bearing passages were compared in the actual downloaded PDF, with version hash and limited reading extent in sourceVersions; the problems remain there.
- Title/author/errata, Proposition 3.8/correction and Remark 5.6/tame-symbol searches on 2026-10-18 found no separate author correction. This limited search makes no priority claim; search-result renderings are not treated as the PDF text.

### E10: §5.1, Remark 5.6, printed p. 33 in arXiv:1204.0586v2; compare printed p. 34 of the author copy.

**Observed issue.** The tame-symbol formula uses the residue of u v⁻¹ without the valuation exponents and includes an unexplained extra t in the second input.

**Correction.** For u,v∈O_F×, r,s∈Z and a uniformizer π, the last-uniformizer convention gives ∂{uπ^r,vπ^s}=(−1)^(rs) ū^s v̄^(−r). The inputs are uπ^r and vπ^s.

**Reason.** Setting r=s=0 must give 1 for two units, while the printed formula need not. Setting r=0,s=1 must give ū. Multilinearity and ∂{π,π}=−1 supply the stated exponents and sign, consistent with Proposition 5.5.

**Classification:** misprint; affects a stated result; no correction found in the recorded limited search. Independently confirmed by REV-HigherLocalFieldsAndHigherClassFieldTheory.

- arXiv https://arxiv.org/abs/1204.0586 checked 2026-10-18: v1 (3 April 2012), v2 (1 August 2012), with no later revision or journal-version link listed.
- Author page https://www.imo.universite-paris-saclay.fr/~matthew.morrow/ and its linked introductory-notes PDF inspected 2026-10-18. The issue-bearing passages were compared in the actual downloaded PDF, with version hash and limited reading extent in sourceVersions; the problems remain there.
- Title/author/errata, Proposition 3.8/correction and Remark 5.6/tame-symbol searches on 2026-10-18 found no separate author correction. This limited search makes no priority claim; search-result renderings are not treated as the PDF text.
