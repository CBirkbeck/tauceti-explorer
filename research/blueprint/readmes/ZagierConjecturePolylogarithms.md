# Polylogarithms, Part II: the weight-four Zagier theorem

This roadmap supplies the proof-specific weight-four extension requested by
`Polylogarithms:P.4`. Its endpoint is the explicit-cycle form of the
Goncharov–Rudenko theorem for every number field. The construction goes through
specialized polylogarithmic relations, type-A cluster cells, motivic correlators,
decorated flags, Grassmannian configurations and a residue-compatible Chern
cocycle. The determinant interface, lower weights and the general conjectural
frontier are imported from their existing owners.

This is a complete **planning pass**, with all six layers **planned** and none
closed. Seven proof-leaf gaps and nine supplier requests below delimit what
must be established before closure. The plan has had an independent review,
which corrected it in place; the corrections are folded into the targets and
into the source corrections at the end. Every target has implementation status
`unchecked`. The [packet](../packets/ZagierConjecturePolylogarithms.json) records
the same targets and dependencies; the [suggested file](../suggested/ZagierConjecturePolylogarithms.lean)
contains only the small numerical and native linear-algebra statements that can
currently be stated at the pins. It elaborates with the expected proof-placeholder
warnings; it does not implement the weight-four theorem.

## Endpoint and ownership

Let F be a number field of signature (r₁,r₂), absolute discriminant |D_F|, and
chosen embeddings σ₁,…,σ\_{r₂}, one from each complex pair. Use the parent's
real-valued single-valued L₄ and its explicit weight-four complex. For explicit
cycles y₁,…,y_{r₂}, the target asserts

\[
 \frac{\pi^{4(r_1+r_2)}}{\sqrt{|D_F|}}
 \det\bigl(L_4(\sigma_i y_j)\bigr)\ \in\ \mathbb Q\,\zeta_F(4).
\]

Some tuple has nonzero determinant. For r₂>0 a rational rescaling of one column
makes this an equality with ζ\_F(4). For r₂=0 the determinant is 1 and the target
is a nonzero rational-ratio statement; there is no column to rescale. For
F=Q the ratio π⁴/ζ\_Q(4) is 90. The unqualified empty-determinant equality is
therefore excluded, as already recorded in P.4.

The original nine-topic brief meets substantial existing plans. The following
ownership decisions are part of this design; the named inputs are imported
with their own proof obligations.

| Topic in the brief | Owner and supplied interface | Contribution here |
| --- | --- | --- |
| Classical/single-valued polylogarithms, Bloch–Wigner function and analytic functional equations | `Polylogarithms:P.1`; `K3BlochGroups:V.2–V.3` | Use the fixed L₂,L₃,L₄ conventions and low-weight evaluations. |
| Pre-Bloch/Bloch groups, exterior boundary and functoriality | `K3BlochGroups:V.3` | Import the rational B₂ presentation; construct no duplicate Bloch group. |
| Suslin, Bloch and Dupont–Sah inputs | `K3BlochGroups:V.3–V.4` | The weight-two proof remains with its accepted supplier. |
| Borel rank, regulator and zeta covolume | `BorelRegulators:R.3–R.5`, `R.7` | Request the precise weight-four real/Tate coordinate adapter. |
| The proved n=2 case | `Polylogarithms:P.2` | Import its complete theorem and proof route. |
| Inductive higher Bloch groups and complexes | `Polylogarithms:P.4` | Keep its presentation distinct from the combinatorial construction here. |
| The proved n=3 case | `Polylogarithms:P.3` | Import configurations, projected cross-ratio, explicit B₃ and the trilogarithm proof. |
| The n=4 statement and determinant implication | `Polylogarithms:P.4` | Prove its missing correlator/extension, regulator-input and Chern construction interfaces. Dependence runs one way: the Z-layers cite P.4's objects, and P.4 names the Z-targets as owners of its interfaces rather than citing them, so the stage graph stays acyclic. |
| General Zagier/comparison conjectures | `Polylogarithms:P.4` | Preserve the explicit/inductive distinction and the every-inductive-cycle obstruction. |

The generic motive, Tannakian, Hodge, Deligne and K-theory machinery stays with
its owners. `PeriodsAndSpecialValues:PS.9/mixed-tate-z` already constructs the
mixed-Tate-Q heart and MT(Z); `PS.9/motivic-path-torsor` already constructs the
selected three-punctured Q-line torsor. `AnabelianGeometryAndNonabelianChabauty:NC.2`
already supplies generic de Rham/étale unipotent groups at rational basepoints.
Requests MT-1 and MT-2 extend these to the number-field and arbitrary-puncture,
tangential interfaces needed here. MT-2 goes to `PeriodsAndSpecialValues:PS.9`,
which owns the motivic fundamental group of the punctured line; NC.2 is now a
TauCetiRoadmap pull request and is only cited for its de Rham and étale
realizations. No generic construction is repeated in a
Z-layer. An A₂ scissors map is requested from `K3BlochGroups:V.3`; the proof-specific
A₃ comparison belongs here. The packet proposes the corresponding Part II
extensions without editing another owner's files.

## Conventions and proof architecture

All tensor products, exterior powers, groups and chain complexes below have
rational coefficients. Put U(F)=F×⊗\_Z Q, writing products of units multiplicatively
inside tensor formulas; −1 has zero U-class. Combinatorial targets use an infinite
field F. Motives, their realizations and the final regulator comparison use a
number field. Configuration entries are generic whenever determinants or
cross-ratios must be nonzero; a boundary value is admitted only through the
stated specialization operation. A tensor formula containing 0 or 1 at a
singular argument means its specified specialization, not an invented unit.

The following names distinguish genuinely different objects.

| Notation | Meaning |
| --- | --- |
| B₂-exp | The rational Bloch group imported from V.3/P.1. |
| B₃-exp | The explicit trilogarithm group of P.3, retaining [1]₃. |
| L₃,L₄ | The specialized Q₃/Q₄ quotients of single and double symbols constructed in Z.1. |
| B₄-comb | The span of single symbols inside L₄, defined before proving it is ker δ₂₂. |
| Γ-exp(F,4) | B₄-comb → B₃-exp⊗U → B₂-exp⊗Λ²U → Λ⁴U, in degrees 1 through 4. |
| Bₙ-ind, Γ-ind | The parent's inductively defined higher Bloch objects; equality with the explicit objects is not presumed. |
| G₄ | The eight-point Grassmannian configuration quotient, distinct from B₄-comb. |
| L₄\* | The canonical Hodge period coordinate, distinct from the classical single-valued L₄ on individual arguments. |

Use s(a,b,c,d)=((a−b)(c−d))/((a−d)(c−b)); the projected round cross-ratio imported
from P.3 is r(a,b,c,d)=s(a,c,b,d). Thus s(∞,1,0,x)=r(∞,0,1,x)=x. Every Alt is the
full signed sum, including block alternations; every Cyc is a full cyclic sum.
The alternating six-cycle sum changes sign under a one-step rotation. The
triple-ratio map T₃ in Z.4 is the negative of P.3's r₆; this adapter is essential.
The supplier's zero-based deletion and projection operators satisfy
∂p+p∂=0, and its total differential is ∂+p. The configuration squares of the
source hold with this convention; only the flag map of Theorem 7.1 still needs
the sign certificate FLAG-SIGNS. In degree eight the forgetting and projection
contributions on C₈(3) cancel each other (R₇³∂+R₇²p=0) rather than vanishing
separately as the source's Lemma 7.9 claims (E05).

The scissors map a₃ is Goncharov's map of the 2000 trilogarithm paper,
a₃=(1/6)a′₃−(1/3)a″₃ with a′₃ built from r₃, one third of the class normalized
by GR (167). Written with that normalized class the coefficient of a′₃ is 1/18;
the 1/2 printed in GR §9.3 is off by a factor nine (E06).

There are two separate regulator obligations. First the corrected flag/Chern
construction produces κ:K₇(F)\_Q→ker δ₄-exp with nonzero regulator comparison.
Second *every* explicit cycle has a period vector in the rational K₇ regulator
image: realize the cycle as a primitive mixed-Tate class and use Ext¹≃K₇.
The second statement does not follow just from constructing κ. Together they
discharge P.4's weight-four-regulator-input, which is therefore not used as a
premise anywhere in this roadmap. Neither requires κ to be surjective.

The canonical period is calibrated on cycles by a direct tensor argument:

\[
 L_4^*(z)=\frac{5L_4(z)+\tfrac13 L_2(z)\log^2|z|}{16},\qquad
 \sum q_z[z]_3\otimes z=0
 \Longrightarrow \sum q_z[z]_2\otimes z\otimes z=0.
\]

Apply L₂⊗log|·|⊗log|·| to the last relation. The correction vanishes, so a cycle's
L₄\* period is exactly 5/16 of its classical L₄ period. A pointwise proportionality
claim would miss this argument. After the Tate/Borel conversion, a column of
classical periods is a nonzero rational multiple of π³ times a Borel column.
With d=r₂ and N=[F:Q], Borel's exponent d−4N therefore becomes
4d−4N=−4(r₁+r₂), giving the displayed zeta formula.

For the normal-crossing coefficient diagram a codimension-q stratum has weight
4−q and total degree j+2q for internal degree j. The codimension-four rational
term lies in degree eight. Pushforward of a period current adds ordinary degree
2q and a factor (2πi)^q. The current component of a Deligne degree-k term has
ordinary degree k−1. These conventions prevent the residue diagram from being
mistaken for a four-term Gersten resolution.

## Library baseline and supplier boundary

The planning baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed
`data/library-coverage.json` entries for Polylogarithms, K3BlochGroups and
BorelRegulators were read before planning. The new roadmap has no audit entry.
Actual pinned source statements were read for each of the following imports.

- [mathlib:Finsupp.linearCombination](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean): Evaluation of finite rational linear combinations, including its value on a single generator.
- [mathlib:Submodule.Quotient.mk](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Quotient/Defs.lean): Native quotient of a module by a submodule, with mk x=0 exactly when x lies in the submodule.
- [mathlib:ExteriorAlgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): Exterior algebra, its degree-n exterior power, generator-square-zero relation and universal property.
- [mathlib:TensorProduct.lift](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basic.lean): Linear maps out of a tensor product from bilinear maps, with evaluation on pure tensors.
- [mathlib:Matrix.det](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): Alternating determinant on finite matrices; det_mul and det_fin_zero fix the basis-change and rank-zero conventions.
- [mathlib:FreeLieAlgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Free.lean): The free Lie algebra on a type, with its universal property; the puncture Lie algebra is its quotient by the single relation Σ\_s X_s=0.
- [mathlib:LieDerivation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Derivation/Basic.lean): Derivations of a Lie algebra into a module, with the Leibniz rule; special derivations are such derivations satisfying the tangential conditions.

Recursive searches of the pinned libraries found no corresponding polylogarithm,
motivic-correlator, Borel-regulator or Grassmannian-polylogarithm construction.
The current read-only Tau Ceti library and all current TauCetiRoadmap documents
and suggested files, including the nine roadmaps newer than the atlas snapshot,
were also checked for ownership. Existing free modules, module quotients,
tensor products, exterior powers and determinants are imported. The Z-targets
specify the additional mathematics, rather than rebuilding these carriers.

## Layers and target specifications

A target identifier below is its stable packet identifier after the roadmap
prefix `ZagierConjecturePolylogarithms:`. The standing conventions above apply
to each target; additional hypotheses are listed locally. “API” gives named
mathematical contracts, and “Checks” gives tests a plausible incorrect definition
would fail. Proof steps are a formalization plan; a cited gap is still an
obligation. Every source locator refers to the fixed version in the bibliography.

## Z.1. Specialized weight-three and weight-four relations

Construct the rational raw symbol modules and their full one-parameter specialization relations Q₃ and Q₄; identify L₃ with the supplier’s explicit trilogarithm group and descend δ₃. Keep L₄ as a quotient before proving δ₄ descends.

**Layer inputs:** `Polylogarithms:P.3`.

**Planets:** Polylogarithmic symbols; Specialization; Weight-three relations; Weight-four relations.

**Coverage:** planned. Discharge P3-SPEC (specialization closure of the explicit 22-term relation) for the inverse direction of trilogarithm-reduction.

<a id="target-Z-1-raw-symbols"></a>

### Z.1/raw-symbols. Single and double symbols

**Definition.** For n=3,4 let Rawₙ(F)=Q[F× ⊔ (F××F×)], with single generators Sₙ(x) and double generators D₂₁(x,y) or D₃₁(x,y). Temporarily adjoin zero/infinity single symbols with value zero for specialization notation. Put s(a,b,c,d)=((a−b)(c−d))/((a−d)(c−b)) using homogeneous determinants on P¹, and Z(a₁,…,a₆)=−(a₁−a₂)(a₃−a₄)(a₅−a₆)/((a₂−a₃)(a₄−a₅)(a₆−a₁)). Cyc is an unnormalized cyclic sum; Cyc⁻₆ uses alternating rotation signs. The projected cross-ratio r used in Z.4 satisfies r(a,b,c,d)=s(a,c,b,d).

**Direct inputs:** `mathlib:Finsupp.linearCombination`, [Polylogarithms:P.3/projected-cross-ratio](../packets/Polylogarithms--P.3.json).

**Construction / proof plan:**

1. Use the native finitely supported free rational module; use the imported projective cross-ratio with the indicated permutation.
2. Homogeneous determinant expressions define the formulas when an entry is infinity.

**Uses:**

- Z.1/weight-three-presentation and Z.1/weight-four-presentation: The two tagged injections and free-module lift define the two relation submodules without conflating single and double generators.

**API:**

- `RawSymbol.single` (constructor): The injection of the left summand gives Sₙ(x).
- `RawSymbol.double` (constructor): The injection of the right summand gives D(x,y).
- `RawSymbol.lift` (universal-property): A pair of functions from the two summands to a Q-module extends uniquely to a linear map.
- `RawSymbol.map` (functoriality): Field embeddings act on both arguments and commute with composition and identity.

**Checks:**

- `RawSymbols.check1` (computation): s(∞,1,0,x)=x for x≠0,1.
- `RawSymbols.check2` (computation): Z(0,1,2,3,4,5)=1/5; removing the initial minus gives the wrong answer.
- `RawSymbols.check3` (compatibility): The two generator tags stay distinct even when x=y, and r(∞,0,1,x)=x.

**Acceptance:** Fix the minus sign in Z, full sum convention and the permutation relating r to s.

**Sources:**

- [GR](#source-gr), §1.1, item 3, equation (3), p. 4; §1.2, equations (23)–(25), p. 10; equation (34), p. 13. GR fixes the cross-ratio (3) normalized by [∞,1,0,x]=x, the six-point function (23) with its leading minus sign, the unnormalized cyclic sum (24), the list (25) of single and double generators, and the signed cyclic sum (34). The node records these generators and conventions without change.

<a id="target-Z-1-specialization"></a>

### Z.1/specialization. One-parameter specialization

**Construction.** For x=tᵃu, y=tᵇv with a,b integers and u,v regular units at t=0, put u₀=u(0), v₀=v(0). On U(F(t)), specialization sends x to u₀. On single symbols it sends Sₙ(x) to Sₙ(u₀) if a=0 and to 0 otherwise. On D₂₁ it gives D₂₁(u₀,v₀) if a=b=0; −S₃(v₀) if a>0,b=0; −S₃(u₀) if a=0,b>0; 2S₃(u₀/v₀) if a=b<0; and zero otherwise. On D₃₁ the corresponding five cases are D₃₁(u₀,v₀), S₄(v₀), −S₄(u₀), 3S₄(u₀/v₀), and zero. These are raw-symbol linear maps for the fixed parameter, not a claim of parameter independence in weight one.

**Direct inputs:** [Z.1/raw-symbols](#target-Z-1-raw-symbols), `mathlib:Finsupp.linearCombination`.

**Construction / proof plan:**

1. Decompose nonzero rational functions by order and leading unit.
2. Apply the displayed disjoint cases to the basis and extend linearly.

**Uses:**

- Z.1/weight-three-presentation, Z.1/weight-four-presentation and Z.3/weight-four-cobracket: The valuation tables generate boundary relations and permit the cobracket-descent check on equal-pole and one-zero limits.

**API:**

- `Specialize.single` (simp): The single-symbol value follows its valuation-zero case.
- `Specialize.double` (simp): The two double-symbol tables give all order cases.
- `Specialize.constants` (compatibility): For constant nonzero arguments the map is the canonical constant-symbol identification.
- `Specialize.linear` (structure): The specialization extends Q-linearly to Rawₙ(F(t)).

**Checks:**

- `Specialization.check1` (degenerate): Sp D₃₁(tu,v)=S₄(v), whereas Sp D₂₁(tu,v)=−S₃(v).
- `Specialization.check2` (computation): Sp D₃₁(t⁻²u,t⁻²v)=3S₄(u₀/v₀), not one copy.
- `Specialization.check3` (non-example): If a=−2,b=−1 the double specialization is zero even though both entries have poles.

**Acceptance:** Equal negative orders must retain the coefficient 3 in weight four.

**Sources:**

- [GR](#source-gr), §1.2, item 1, equation (26), pp. 10–11; the specialization check after (38), p. 14. GR defines the specialization of a relation along a curve in M_{0,n+3} on generators by the order/leading-coefficient table (26), with coefficient 2 in weight three and 3 in weight four when both arguments have the same negative order, and checks one equal-pole case against the cobracket on p. 14. The worked example there prints {u/v}₄ where its own computation and (26) give 3{u/v}₄ (source issue E08).

<a id="target-Z-1-weight-three-presentation"></a>

### Z.1/weight-three-presentation. The Q₃ presentation

**Definition.** L₃(F) is Raw₃(F) modulo the span of D₂₁(x,y)−D₂₁(y,x), the Q₃ relations and all their one-parameter specializations as in specialization. For six distinct P¹-points, Q₃ is Cyc₆(D₂₁(s₁₂₃₄,s₄₅₆₁)−S₃(s₁₂₄₅)+2S₃(s₁₃₄₅))−4S₃(Z₁₂₃₄₅₆). Specializations range over F-rational punctured one-parameter families and their valuation/leading-unit limits, including further specializations of the resulting relation family; this explicit relation closure is part of the presentation.

**Direct inputs:** [Z.1/raw-symbols](#target-Z-1-raw-symbols), [Z.1/specialization](#target-Z-1-specialization), `mathlib:Submodule.Quotient.mk`.

**Construction / proof plan:**

1. Form the submodule generated by the specified relation family, including iterated specialization closure.
2. Take the native module quotient and export its quotient universal property.

**Uses:**

- Z.1/trilogarithm-reduction and Z.1/weight-three-cobracket: The quotient lift reduces doubles to the imported explicit trilogarithm group and transports its boundary.

**API:**

- `L3.single` (constructor): S₃(x) denotes the quotient class.
- `L3.double` (constructor): D₂₁(x,y) denotes the quotient class.
- `L3.lift` (universal-property): A raw linear map factors uniquely exactly when it kills the stated relations.
- `L3.map` (functoriality): Field embeddings preserve the relation family and induce linear maps.

**Checks:**

- `WeightThreePresentation.check1` (characterisation): D₂₁(x,y)=D₂₁(y,x) in L₃.
- `WeightThreePresentation.check2` (characterisation): Every six-point Q₃ sum is zero, with the standalone coefficient −4.
- `WeightThreePresentation.check3` (degenerate): Specialization at the divisor where the first and third marked points collide yields the reduction formula in the next target.

**Acceptance:** Do not replace this explicit group by the inductive higher Bloch group.

**Sources:**

- [GR](#source-gr), §1.2, item 1, Definition 1.10 with equation (28), p. 11; the specializations (29) and (19), p. 12. Definition 1.10 presents L₃(F) by the symbols {x}₃ and {x,y}\_{2,1}, the symmetry of {x,y}\_{2,1}, the six-point relation Q₃ of (28) (a cyclic sum plus a separate −4{[x₁,…,x₆]}₃ term) and all its specializations; GR obtains (29) at the divisor D₁₃ and then (19) by specializing (29) further, which is why the relation set is closed under iterated specialization.

<a id="target-Z-1-weight-four-presentation"></a>

### Z.1/weight-four-presentation. The Q₄ presentation

**Definition.** L₄(F) is Raw₄(F) modulo Q₄ and its full one-parameter specialization closure. For seven distinct points Q₄ is Cyc₇(−D₃₁(s₁₂₃₄,s₄₆₇₁)+D₃₁(s₁₂₃₄,s₄₅₇₁)−D₃₁(s₁₂₃₄,s₄₅₆₁)−S₄(s₁₂₄₆)+3S₄(Z₁₂₃₄₅₆)). No antisymmetry of D₃₁ is imposed at the raw level: it holds modulo the single-symbol subspace as a theorem. The convention S₄(0)=S₄(∞)=0 is notation for the zero vector.

**Direct inputs:** [Z.1/raw-symbols](#target-Z-1-raw-symbols), [Z.1/specialization](#target-Z-1-specialization), `mathlib:Submodule.Quotient.mk`.

**Construction / proof plan:**

1. Take the submodule span of generic seven-point relations and their specified specializations.
2. Use quotient elimination to formulate the later cobracket descent obligation.

**Uses:**

- Z.3/weight-four-cobracket and Z.3/classical-subspace: The quotient universal property is used to descend the raw boundary and the single-generator map.

**API:**

- `L4.single` (constructor): The quotient class S₄(x) is defined for x∈F×.
- `L4.double` (constructor): The quotient class D₃₁(x,y) is defined for x,y∈F×.
- `L4.lift` (universal-property): Raw maps killing all Q₄ specializations descend uniquely.
- `L4.map` (functoriality): Field embeddings induce maps commuting with each generator.

**Checks:**

- `WeightFourPresentation.check1` (characterisation): The generic heptagon relation vanishes with the signs −,+,− on its double terms.
- `WeightFourPresentation.check2` (degenerate): D₃₁(x,1)=−S₄(1−x⁻¹)−S₄(1−x)+S₄(x), with endpoint terms interpreted by specialization.
- `WeightFourPresentation.check3` (non-example): Do not identify D₃₁(x,y)+D₃₁(y,x) with zero before passing to the quotient by single symbols.

**Acceptance:** Retain all three double terms and the single-symbol coefficient 3.

**Sources:**

- [GR](#source-gr), §1.2, item 1, Definition 1.11 with equations (32)–(33), p. 12; item 2, equations (35)–(36), p. 13. Definition 1.11 presents L₄(F) by {x}₄ and {x,y}\_{3,1} subject to the seven-point relation Q₄ of (32) (three double terms with signs −,+,− and single terms −{[x₁,x₂,x₄,x₆]}₄+3{[x₁,…,x₆]}₄) and its specializations, defines B₄(F) as the span of single symbols and derives (33); (35)–(36) rewrite Q₄ as the seven-fold sum of the six-point element L′₄.

<a id="target-Z-1-trilogarithm-reduction"></a>

### Z.1/trilogarithm-reduction. Reduction to the explicit trilogarithm group

**Comparison.** There is a natural isomorphism from the supplier’s explicit 22-term B₃(F) to L₃(F), carrying [x]₃ to S₃(x). Under its inverse D₂₁(x,y) becomes [1−1/x]₃+[1−1/y]₃+[(1−y)/(1−x)]₃−[(1−1/y)/(1−1/x)]₃+[y/x]₃−[1]₃, with degenerate cases obtained by specialization. This is not an identification with the inductive B₃. The constant [1]₃ is retained.

**Direct inputs:** [Z.1/weight-three-presentation](#target-Z-1-weight-three-presentation), [Polylogarithms:P.3/trilogarithm-group](../packets/Polylogarithms.json), [Z.1/specialization](#target-Z-1-specialization), [Polylogarithms:P.3/coordinate-relation](../packets/Polylogarithms--P.3.json), [Polylogarithms:P.3/seven-term-configuration-relation](../packets/Polylogarithms--P.3.json), `Polylogarithms:P.3`.

**Construction / proof plan:**

1. Specialize Q₃ to the divisor D₁₃ (equivalently D₂₆ followed by y=1, Lemma 5.1) to obtain (29) in L₃; further specializations give the inversion and three-term relations (19) in L₃.
2. Substituting (29) into Q₃ gives the coordinate 22-term relation of P.3 (Lemma 5.2(i)). Hence [x]₃↦S₃(x) kills R₃(F) and defines B₃-exp→L₃, which is surjective because (29) expresses every double symbol by single symbols.
3. For the inverse send S₃(x)↦[x]₃ and D₂₁(x,y)↦ the right side of (29). The symmetry relation maps to zero by inversion and Q₃ maps to the 22-term relation. The specialization table (26) is compatible with this assignment in every order case (for a>0=b the right side specializes to [1−1/v₀]₃+[1−v₀]₃−[1]₃=−[v₀]₃ by (19), matching −S₃(v₀); for a=b<0 to 2[v₀/u₀]₃=2[u₀/v₀]₃). So every specialization of Q₃ maps to a specialization of the coordinate 22-term relation.
4. That these specializations lie in R₃(F) is the step GR attributes to Gon95 §5; P.3 records the degenerate cases of its coordinate relation as statements still to prove, so it is requested from P.3 (P3-SPEC). The analytic functional equations of P.3 over C are not used: they cannot prove an algebraic identity over an arbitrary infinite field.

**Acceptance:** Both composites fix all single generators and the reduction determines all double generators.

**Sources:**

- [GR](#source-gr), §1.2, item 1, equations (29)–(31), p. 12; §5.1, Lemma 5.1 with (106)–(109) and Lemma 5.2, p. 54. Specializing Q₃ expresses {x,y}\_{2,1} by five trilogarithms and the constant (29)=(106); substituting this into Q₃ gives the 22-term relation (Lemma 5.2(i)), and GR asserts that the induced map B₃(F)→L₃(F) is an isomorphism (31), Lemma 5.2(ii), attributing its only nontrivial step to Gon95 §5.

<a id="target-Z-1-weight-three-cobracket"></a>

### Z.1/weight-three-cobracket. Cobracket on Q₃ symbols

**Construction.** With L₂=B₂-exp and L₁=U, define δS₃(x)=[x]₂⊗x and δD₂₁(x,y)=[(1−y)/(1−x)]₂⊗(y/x)+[y/x]₂⊗((1−y)/(1−x))+[x]₂⊗(1−1/y)+[y]₂⊗(1−1/x). The map descends to L₃, commutes with all relation specializations and agrees with the imported explicit δ₃ under trilogarithm-reduction. Rational U notation converts multiplication to addition.

**Direct inputs:** [Z.1/trilogarithm-reduction](#target-Z-1-trilogarithm-reduction), [Polylogarithms:P.3/weight-three-complex](../packets/Polylogarithms.json), `mathlib:TensorProduct.lift`, `mathlib:ExteriorAlgebra`.

**Construction / proof plan:**

1. Expand the Q₃ image and collect each determinant coefficient.
2. The remaining B₂ expressions are five-term relations; handle the specialized cases by the valuation table.
3. Use the inverse reduction to compare with the supplier differential.

**Uses:**

- Z.3/weight-four-cobracket and Z.5/cycle-period-calibration: Its generator formula proves co-Jacobi and turns a cycle relation into the B₂⊗U⊗U moment relation.

**API:**

- `L3.delta_single` (simp): δS₃(x)=[x]₂⊗x.
- `L3.delta_double` (simp): The displayed four-term tensor formula holds, including specializations.
- `L3.delta_map` (functoriality): Field embeddings commute with δ.
- `L3.delta_specialize` (compatibility): Specialization in both the explicit symbol and U factors commutes with δ.

**Checks:**

- `WeightThreeCobracket.check1` (characterisation): The two expressions for δD₂₁(x,y) and δD₂₁(y,x) agree by the five-term relation.
- `WeightThreeCobracket.check2` (degenerate): At x=tu,y=v the limit is −[v]₂⊗v.
- `WeightThreeCobracket.check3` (compatibility): Applying the inverse L₃≃B₃-exp to a single symbol gives the supplier’s boundary [x]₂⊗x.

**Acceptance:** The composite with the next polylogarithmic differential is zero.

**Sources:**

- [GR](#source-gr), §1.2, item 3, equations (37)–(38), pp. 13–14; §5.1, Definition 5.3 with (110) and Proposition 5.4 with (111)–(114), pp. 54–56. (38) and Definition 5.3 give δ{x}₃={x}₂⊗x and the four-term cobracket of {x,y}\_{2,1}; GR notes that δ commutes with specializations (p. 14) and that the composite with the next differential vanishes (p. 54), and Proposition 5.4 shows that the cobracket kills Q₃ by collecting the B₂-coefficient of each determinant letter into five-term relations.

## Z.2. Associahedra and cluster polylogarithms

Construct oriented type-A Stasheff cell complexes, triangle two-forms and the weight-four maps on vertices, edges, pentagons, squares and three-cells. Prove their boundary identities; express the K₄ top boundary as Q₄. No general cluster-variety conjecture is used.

**Layer inputs:** `ZagierConjecturePolylogarithms:Z.1`, `Polylogarithms:P.3`, `K3BlochGroups:V.3`.

**Planets:** Stasheff polytopes; Cluster two-form; Hexagon polylogarithm; Cluster polylogarithm map.

**Coverage:** planned. Fix one orientation convention for every cell of K₃ and K₄ and check it against GR (95), (97), (99) and (102) on a hexagon and a heptagon.

<a id="target-Z-2-stasheff-cells"></a>

### Z.2/stasheff-cells. Oriented Stasheff cells

**Definition.** K_m is the cellular associahedron for a labelled convex (m+3)-gon: a face is a noncrossing partial dissection and is a product of associahedra indexed by its regions. Its dimension is m minus the number of chosen diagonals. Choose an orientation on the top cell and induced boundary orientations, with the cellular incidence differential d and the Koszul product boundary. This is a finite combinatorial cellular complex, not a new topological moduli-space assumption.

**Direct inputs:** `mathlib:Finsupp.linearCombination`.

**Construction / proof plan:**

1. Represent diagonals by unordered nonadjacent vertex pairs and enforce the noncrossing predicate.
2. Orient face products consistently and define signed incidence maps.
3. Opposite ways of adding two diagonals have opposite signs, proving d²=0.

**Uses:**

- Z.2/cluster-low-cells, Z.2/cluster-three-cell and Z.2/cluster-boundaries: Incidence orientations determine the edge, pentagon, square, hexagon and heptagon signs and the d² cancellation.

**API:**

- `Stasheff.face` (constructor): A noncrossing dissection gives a face and its product factors.
- `Stasheff.boundary` (data): The signed codimension-one faces define the cellular differential.
- `Stasheff.product_boundary` (compatibility): The boundary of A×B is dA×B+(−1)^dim A A×dB.
- `Stasheff.boundary_sq` (relation): d² is zero for every face.

**Checks:**

- `StasheffCells.check1` (computation): K₀ has one vertex; K₁ has two vertices and one oriented edge.
- `StasheffCells.check2` (computation): K₂ is a pentagon, not a square.
- `StasheffCells.check3` (computation): K₃ has 14 vertices, 21 edges, six pentagonal faces and three square faces.

**Acceptance:** Cellular orientations must match the flip square in cluster-boundaries.

**Sources:**

- [GR](#source-gr), §1.3, item 2 and Figure 6, pp. 20–21; §3.2, Theorem 3.8 and Proposition 3.9, pp. 39–40; §4.1, equation (85), p. 46. GR describes the p-faces of the Stasheff polytope K_m by sets of m−p noncrossing diagonals of the (m+3)-gon, lists K₀–K₃ (K₃ has 14 vertices, 21 edges, three squares and six pentagons), states that faces are products of smaller Stasheff polytopes (85), and uses the oriented cellular chain complex C_•(K_m).

<a id="target-Z-2-cluster-two-form"></a>

### Z.2/cluster-two-form. Triangle and triangulation two-forms

**Construction.** For a generic ordered tuple of vectors lᵢ in a two-dimensional symplectic space put Δᵢⱼ=ω(lᵢ,lⱼ)∈F×. An oriented triangle contributes Δ₁₂∧Δ₂₃+Δ₂₃∧Δ₁₃+Δ₁₃∧Δ₁₂ in Λ²U; W_T is the sum over a triangulation T. For T with diagonal 13 and T′ with diagonal 24 of the cyclic quadrilateral (1,2,3,4), set X=Δ₁₂Δ₃₄/(Δ₂₃Δ₁₄). With the edge oriented from T′ to T, W_T−W_T′=(1+X)∧X=δ[−X]₂. Its image in Milnor K₂ is triangulation-independent. The vectors are taken in a two-dimensional symplectic space modulo Aut(V₂,ω), as in GR §1.3; the forms Δᵢⱼ are invariant under that group, not under all of GL₂.

**Direct inputs:** [Z.2/stasheff-cells](#target-Z-2-stasheff-cells), `mathlib:ExteriorAlgebra`, [Polylogarithms:P.3/generic-vector-configurations](../packets/Polylogarithms--P.3.json), [K3BlochGroups:V.3/pre-bloch-group](../packets/K3BlochGroups.json), [K3BlochGroups:V.3/bloch-boundary](../packets/K3BlochGroups.json).

**Construction / proof plan:**

1. Use native exterior products and sum oriented triangle terms.
2. Expand the two triangulations of a quadrilateral and use its Plücker relation.
3. Identify the difference with the Steinberg boundary of [−X]₂.

**Uses:**

- Z.2/cluster-low-cells: The flip difference gives the edge boundary and the sum of endpoint forms gives its B₂⊗Λ²U value.

**API:**

- `ClusterW.triangle` (simp): One triangle has exactly the displayed three wedge terms.
- `ClusterW.triangulation` (data): W_T is additive under cutting a polygon along a diagonal.
- `ClusterW.flip` (relation): For the calibrated edge orientation W_T−W_T′=δ[−X]₂.
- `ClusterW.rescale` (functoriality): Changing the volume form and lifting projective vertices has the determinant transformation prescribed by U.

**Checks:**

- `ClusterTwoForm.check1` (computation): For a triangle the sum contains three wedge terms with the middle term Δ₂₃∧Δ₁₃.
- `ClusterTwoForm.check2` (compatibility): A single quadrilateral flip has Steinberg boundary δ[−X]₂, so becomes zero in K₂.
- `ClusterTwoForm.check3` (non-example): Replacing W_T by zero cannot satisfy the generic flip identity in Λ²U.

**Acceptance:** Fix X by the displayed labelled determinant ratio and retain the orientation W_T−W_T′.

**Sources:**

- [GR](#source-gr), §1.3, item 1, equations (49)–(55), pp. 19–20; §3.1, equations (74)–(75), p. 36; §4.1, p. 46. GR assigns to a triangle of vectors the two-form W_t of (52), to a triangulation the sum (53), and proves from the Plücker relation (55) that a flip changes W_T by δ{−X_E}₂, where X_E is the negative cross-ratio (54); (74)–(75) is the general cluster version.

<a id="target-Z-2-cluster-low-cells"></a>

### Z.2/cluster-low-cells. Weight-four maps on cells of dimension at most two

**Construction.** On Stasheff cells associated to generic P¹-points define L₄⁴(T)=W_T∧W_T, L₄³(e)=[−X_e]₂⊗(W_T+W_T′). The orientation is the one for which δL₄³=L₄⁴d. A pentagonal face has L₄²=Σ\_{k mod 5}[s(k+1,k+2,k+3,k+4)]₃⊗s(k+3,k+4,k,k+1)/s(k−1,k,k+1,k+2). On the square face of a heptagon determined by j put L₄²=[s(j,j+1,j+2,j+3)]₂∧[s(j+3,j+4,j+5,j+6)]₂, with orientation reversal negating it. For product faces include the remaining W factors using the weight grading. These values lie in the weight-four Chevalley–Eilenberg terms: Λ⁴U, B₂⊗Λ²U, and (L₃⊗U)⊕Λ²B₂.

**Direct inputs:** [Z.2/stasheff-cells](#target-Z-2-stasheff-cells), [Z.2/cluster-two-form](#target-Z-2-cluster-two-form), [Z.1/weight-three-cobracket](#target-Z-1-weight-three-cobracket), [Z.1/weight-four-presentation](#target-Z-1-weight-four-presentation), `mathlib:TensorProduct.lift`, `mathlib:ExteriorAlgebra`.

**Construction / proof plan:**

1. Use the flip difference to define the edge value with no extra factor 1/2 under W² normalization.
2. Define pentagons by the cyclic five-term formula and squares by the two disjoint flips.
3. Extend across product faces by the graded exterior product; orientations fix signs.

**Uses:**

- Z.2/cluster-boundaries: The pentagon tensor and square Λ²B₂ values are both required in the hexagon boundary calculation.

**API:**

- `Cluster4.vertex` (simp): The vertex value is W_T² rather than W_T²/2.
- `Cluster4.edge` (simp): The edge value is [−X]₂⊗(W_T+W_T′).
- `Cluster4.pentagon` (simp): Pentagons have the five-term L₃⊗U value above.
- `Cluster4.square` (simp): Independent flips give the wedge of their B₂ classes.
- `Cluster4.product` (compatibility): Product cells use the Koszul boundary and weight signs.

**Checks:**

- `ClusterLowCells.check1` (computation): Reversing an oriented edge negates its value.
- `ClusterLowCells.check2` (compatibility): The edge boundary is W_T²−W_T′² with the fixed flip convention.
- `ClusterLowCells.check3` (non-example): The square of two independent flips contributes [−X]₂∧[−Y]₂; setting square cells to zero breaks the boundary equation.

**Acceptance:** The square component Λ²B₂ is essential, not zero.

**Sources:**

- [GR](#source-gr), §3.4, Lemmas 3.12–3.15, pp. 42–44; §4.3, items 1–3, equations (94)–(99), pp. 50–51. §4.3 gives, in the W² normalization, the vertex value W_T², the edge value (95) {−X_e}₂⊗(W_T+W_T′), the pentagon value P of (97) and the square value S_j of (99), with their orientation behaviour; §3.4 states the corresponding boundary identities in exponential form.

<a id="target-Z-2-cluster-three-cell"></a>

### Z.2/cluster-three-cell. The hexagon three-cell

**Construction.** For a hexagon define L₄¹(a₁,…,a₆)=Cyc⁻₆(D₃₁(s₁₂₃₄,s₄₅₆₁)−S₄(s₁₃₄₅)−S₄(Z₁₂₃₄₅₆)) in L₄. A one-step rotation negates this value. Product three-cells are formed by the same weight-four rule as cluster-low-cells. The four-cell value is zero, so the required top equation on the heptagon is Σ\_{k mod 7}L₄¹(a_{k+1},…,a_{k+6})=0, equivalently Q₄.

**Direct inputs:** [Z.2/cluster-low-cells](#target-Z-2-cluster-low-cells), [Z.1/weight-four-presentation](#target-Z-1-weight-four-presentation), [Z.1/raw-symbols](#target-Z-1-raw-symbols).

**Construction / proof plan:**

1. Take the signed six-rotation sum in the raw module and then its L₄ class.
2. Expand the seven hexagon facets of the heptagon; pair terms to identify the Q₄ relation.

**Uses:**

- Z.2/cluster-boundaries and Z.3/weight-four-cobracket: The alternating hexagon value proves the raw δ₄ boundary identity, while its heptagon boundary produces Q₄.

**API:**

- `Cluster4.hexagon` (constructor): The displayed alternating cyclic expression gives the three-cell value.
- `Cluster4.hexagon_rotate` (relation): A rotation by one negates the value.
- `Cluster4.heptagon` (relation): The sum of the seven induced hexagon values is Q₄ and hence zero.

**Checks:**

- `ClusterThreeCell.check1` (characterisation): A rotation by two fixes L₄¹ and a rotation by one negates it.
- `ClusterThreeCell.check2` (characterisation): The heptagon boundary vanishes with exactly the three Q₄ double-symbol terms.
- `ClusterThreeCell.check3` (non-example): The six-ratio contribution carries the minus sign in both Z and the three-cell summand.

**Acceptance:** A positive cyclic sum in place of Cyc⁻₆ fails the orientation test.

**Sources:**

- [GR](#source-gr), §1.2, item 2, equations (35)–(36), p. 13; §4.3, item 4, Definition 4.2 with (101)–(102), p. 52. Definition 4.2 sets L¹₄ equal to the signed six-fold cyclic sum (102) of the double symbol minus two single symbols; (36) states that the seven-fold sum of L′₄ over a heptagon is the relation Q₄.

<a id="target-Z-2-cluster-boundaries"></a>

### Z.2/cluster-boundaries. Cluster boundary identities

**Theorem.** The maps cluster-low-cells and cluster-three-cell satisfy δL₄ʲ=L₄^{j+1}d in every cell dimension, using the raw generator formula for δ₄ before its descent. The edge, square and pentagon identities are GR Lemmas 3.12, 3.13 and 3.15; the pentagon identity uses the five-term relation (79), not Q₃. The hexagon identity is Proposition 4.4, whose proof uses Q₃ through trilogarithm-reduction, and the heptagon identity is Q₄ (Proposition 5.5). They therefore yield the weight-four cellular-to-Chevalley–Eilenberg chain map of Theorem 1.17 once δ₄ has descended.

**Direct inputs:** [Z.2/cluster-low-cells](#target-Z-2-cluster-low-cells), [Z.2/cluster-three-cell](#target-Z-2-cluster-three-cell), [Z.1/weight-three-cobracket](#target-Z-1-weight-three-cobracket), [Z.1/trilogarithm-reduction](#target-Z-1-trilogarithm-reduction), [K3BlochGroups:V.3/pre-bloch-group](../packets/K3BlochGroups.json).

**Construction / proof plan:**

1. For edges use the difference of squares (Lemma 3.12); for square faces use the tensor derivation rule (Lemma 3.13).
2. Expand a pentagon and reduce by the five-term relation (Lemma 3.14 for the invariant W_{K₂}, then Lemma 3.15).
3. For the hexagon compare the L₃⊗U and Λ²B₂ components separately as in Proposition 4.4, rewriting the double-symbol term with Q₃.
4. Use d²=0 on K₄ and the Q₄ boundary formula to prove the relation image vanishes (Proposition 5.5); do not assume δ₄ is already defined on its quotient.

**Acceptance:** The proof has no use of the full cluster polylogarithm conjecture or motivic universality.

**Sources:**

- [GR](#source-gr), §3.4, Lemmas 3.12–3.15, pp. 42–44; §4.3, Theorem 4.3 and Proposition 4.4, pp. 52–53; §5.2, Proposition 5.5, p. 56; Theorem 1.17, p. 21. Theorem 4.3 asserts that the maps of §4.3 form the morphism of complexes (94). Lemmas 3.12–3.15 prove the edge, square and pentagon squares, Proposition 4.4 proves the hexagon square using Q₃, and Proposition 5.5 uses d²=0 on K₄ to show that the cobracket kills Q₄.

## Z.3. Lie coalgebra and motivic correlators

Descend δ₄ and prove co-Jacobi, construct B₄-combinatorial as the span of single symbols and prove the extension by Λ²B₂. Construct and realize correlators on punctured P¹, establish collision continuity, change of base point and weight-four depth reduction; prove the motivic realization homomorphism. Import the generic mixed Tate category and its fundamental group by precise requests (MT-1 to MotivesAndAlgebraicCycles:MC.4, MT-2 to PeriodsAndSpecialValues:PS.9). Use the reduced cyclic-word carrier with its pure-puncture kernel removed, and separate the base-point change theorem from the weight-four depth reduction. The reduction threshold counts arguments, not motivic weight.

**Layer inputs:** `ZagierConjecturePolylogarithms:Z.1`, `ZagierConjecturePolylogarithms:Z.2`, `MotivesAndAlgebraicCycles:MC.4`, `MotivesAndAlgebraicCycles:MC.6`, `HodgeStructuresPartII:H.2`, `AnabelianGeometryAndNonabelianChabauty:NC.2`, `PeriodsAndSpecialValues:PS.9`, `K3BlochGroups:V.3`, `Polylogarithms:P.1`, `BorelRegulators:R.4`.

**Planets:** Weight-four Lie coalgebra; Weight-four extension theorem; Cyclic Lie coalgebra; Motivic correlators; Weight-four depth reduction; Correlator realization theorem.

**Coverage:** planned. Discharge MT-1, MT-2 and HODGE; then verify specialization and motivic rigidity with those actual carriers.

<a id="target-Z-3-weight-four-cobracket"></a>

### Z.3/weight-four-cobracket. The weight-four Lie coalgebra

**Construction.** Define δS₄(x)=S₃(x)⊗x and δD₃₁(x,y)=D₂₁(x,y)⊗(x/y)+S₃(x/y)⊗((1−x)/(1−y))+S₃(x)⊗(1−1/y)−S₃(y)⊗(1−1/x)+[x]₂∧[y]₂. This raw map kills Q₄ and all its specializations; together with δ₂ and weight-three-cobracket it defines a graded Lie coalgebra on U⊕B₂⊕L₃⊕L₄ through weight four. Co-Jacobi is the graded Chevalley–Eilenberg d²=0, not the assertion that the displayed map itself squares as an untyped function.

**Direct inputs:** [Z.1/weight-four-presentation](#target-Z-1-weight-four-presentation), [Z.1/weight-three-cobracket](#target-Z-1-weight-three-cobracket), [Z.2/cluster-boundaries](#target-Z-2-cluster-boundaries), [Z.1/specialization](#target-Z-1-specialization), `mathlib:TensorProduct.lift`, `mathlib:ExteriorAlgebra`.

**Construction / proof plan:**

1. Use the hexagon identity and d²K₄=0 to kill generic Q₄ under the raw formula.
2. Check each order case in the specialization tables, including the coefficient 3 for equal poles.
3. Descend by the quotient universal property. Check co-Jacobi on the single and double generators using δ₃.

**Uses:**

- Z.3/freeness-extension-proof, Z.3/correlator-realization and Z.5/generic-chern-cocycle: The δ₂₂ projection identifies the exact quotient and measures the double-symbol correction; the full formula is compared to cyclic cuts.

**API:**

- `L4.delta_single` (simp): δS₄(x)=S₃(x)⊗x and its Λ²B₂ component is zero.
- `L4.delta_double` (simp): δD₃₁ is the displayed four tensor terms plus [x]₂∧[y]₂.
- `L4.coJacobi` (structure): The induced Chevalley–Eilenberg differential squares to zero.
- `L4.delta_natural` (functoriality): δ commutes with field embeddings and the permitted specializations.

**Checks:**

- `WeightFourCobracket.check1` (computation): The (2,2)-component on D₃₁(x,y) is [x]₂∧[y]₂ with coefficient +1.
- `WeightFourCobracket.check2` (degenerate): The specialization of δD₃₁(t⁻¹u,t⁻¹v) is 3[u₀/v₀]₃⊗(u₀/v₀).
- `WeightFourCobracket.check3` (compatibility): The single-symbol restriction agrees with the supplier’s explicit weight-four complex.

**Acceptance:** Both δ₃₁ and δ₂₂ components survive; on equal poles the limit is δ(3S₄(u₀/v₀)).

**Sources:**

- [GR](#source-gr), §1.2, item 3, equations (37)–(38) and the specialization check, pp. 13–14; §5.2, Proposition 5.5, p. 56; Theorem 1.14(a), p. 16. (38) gives the cobracket of {x,y}\_{3,1}: four B₃⊗F× terms and the Λ²B₂ term {x}₂∧{y}₂. Proposition 5.5 shows it kills Q₄ through the cluster map for m=4, hence also the specializations, since δ commutes with specialization; Theorem 1.14(a) asserts the resulting graded Lie coalgebra structure.

<a id="target-Z-3-classical-subspace"></a>

### Z.3/classical-subspace. The classical fourth-polylogarithm subspace

**Definition.** Define B₄-comb(F) as the Q-linear span of all S₄(x) inside L₄(F), with its actual subtype inclusion. Its boundary has values in B₃-exp(F)⊗U(F) via trilogarithm-reduction, since δ₂₂ vanishes on singles, and on generators it is S₄(x)↦[x]₃⊗x. This is the object Polylogarithms:P.4/explicit-weight-four-complex uses in degree one; that node consumes this one, so no dependence on it is introduced here. It is not defined as the kernel of δ₂₂ before exactness is proved and is not the inductive higher Bloch group.

**Direct inputs:** [Z.3/weight-four-cobracket](#target-Z-3-weight-four-cobracket), [Z.1/trilogarithm-reduction](#target-Z-1-trilogarithm-reduction), `mathlib:Submodule.Quotient.mk`.

**Construction / proof plan:**

1. Take the submodule span of the single-symbol range.
2. Restrict the cobracket and use the zero Λ²B₂ component to factor it through B₃-exp⊗U.
3. Record the generator formula S₄(x)↦[x]₃⊗x that the parent's explicit complex uses, without importing the extension theorem as a premise.

**Uses:**

- Z.3/freeness-extension-proof, Polylogarithms:P.4/explicit-weight-four-complex and Z.6/k-theory-comparison: The genuine subtype inclusion receives the corrected cocycle and identifies its degree-one cohomology with explicit cycles.
- Polylogarithms:P.4/explicit-weight-four-complex: The parent builds Γ-exp(F,4) with this span in degree one and its restricted cobracket as δ₄.

**API:**

- `B4Comb.symbol` (constructor): Each S₄(x) has a canonical class in the span.
- `B4Comb.include` (coercion): The map to L₄ is the native injective submodule inclusion.
- `B4Comb.induction` (universal-property): A linear identity on B₄-comb follows from its values on all single generators.
- `B4Comb.boundary` (compatibility): The restricted δ sends S₄(x) to [x]₃⊗x; this is the degree-one differential of P.4's explicit complex.

**Checks:**

- `ClassicalSubspace.check1` (computation): The double cobracket of a single symbol is zero.
- `ClassicalSubspace.check2` (compatibility): The inclusion is injective by the native submodule carrier; it is not an additional quotient.
- `ClassicalSubspace.check3` (non-example): There is no declaration identifying this span with inductive B₄ or identifying its cycles with all of K₇.

**Acceptance:** The agreement to P.4 fixes every [x]₄ and its boundary.

**Sources:**

- [GR](#source-gr), §1.2, item 1, Definition 1.11, p. 12; Theorem 1.14(c) and complex (44), p. 16. Definition 1.11 defines B₄(F) as the span of the single symbols {x}₄ in L₄(F); Theorem 1.14(c) makes it the kernel term of the extension, and (44) builds the explicit complex from it.

<a id="target-Z-3-freeness-extension-proof"></a>

### Z.3/freeness-extension-proof. The weight-four extension theorem

**Theorem.** The sequence 0→B₄-comb(F)→L₄(F)→Λ²B₂-exp(F)→0 is exact, where the last arrow is δ₂₂ and sends D₃₁(x,y) to [x]₂∧[y]₂. Thus Γ-exp(F,4) includes quasi-isomorphically in the weight-four Chevalley–Eilenberg complex: its quotient is the identity two-term complex on Λ²B₂. This supplies the proof promised by the parent’s freeness-extension node; it does not identify B₄-comb with an inductive presentation.

**Direct inputs:** [Z.3/weight-four-cobracket](#target-Z-3-weight-four-cobracket), [Z.3/classical-subspace](#target-Z-3-classical-subspace), [Z.1/weight-four-presentation](#target-Z-1-weight-four-presentation), `mathlib:ExteriorAlgebra`, [K3BlochGroups:V.3/pre-bloch-group](../packets/K3BlochGroups.json).

**Construction / proof plan:**

1. Specialize Q₄ along the collision families used in §6.
2. Modulo B₄-comb prove D₃₁ is alternating, invariant under the required inversion/complement identities, and satisfies the B₂ five-term relation in each argument.
3. Factor the map on pairs through Λ²B₂. It is inverse to δ₂₂ on the double generators, proving the kernel assertion.
4. Identify the quotient of Chevalley–Eilenberg by Γ-exp with an identity complex and contract it.

**Acceptance:** Surjectivity follows from wedges of B₂ generators; exactness is proved rather than taken from the supplier.

**Sources:**

- [GR](#source-gr), §6, Theorem 6.1 with Lemmas 6.2–6.6 and Corollary 6.5, pp. 57–61; Theorem 1.14(c) and Corollary 1.15, p. 16. Theorem 6.1 proves 0→B₄→L₄→Λ²B₂→0 exact: surjectivity from δ₂₂{x,y}\_{3,1}={x}₂∧{y}₂, and exactness by showing that {x}∧{y}↦{x,y}\_{3,1} modulo B₄ kills a cross-ratio wedged with a five-term relation, using specializations of Q₄ to strata of M̄\_{0,7} (Lemmas 6.2–6.6). Corollary 1.15 deduces that (44) is a quasi-isomorphism.

<a id="target-Z-3-cyclic-tensor-coalgebra"></a>

### Z.3/cyclic-tensor-coalgebra. Cyclic words and special derivations

**Definition.** Fix a finite rational puncture set S={a,s₁,…,s_n} and a tangent at a. Let V be the rational puncture-loop space generated by X_s, s∈S, with Σ\_s X_s=0, using X_{s₁},…,X_{s_n} as a basis. Form C(V)=⊕\_{r≥1}(V^⊗r)\_{cyclic rotation}. First quotient by the pure-puncture cyclic words ⟨X_s,…,X_s⟩ for s≠a, and then by every first-shuffle sum Σ\_{σ∈Sh(p,q)}⟨v₀,v_{σ(1)},…,v_{σ(p+q)}⟩ for p,q≥1. In positive correlator weights retain word length r≥2 and assign weight r−1, with the usual Tate regrading (1). Call this reduced object CLie_S. The pure-puncture reduction matters in length two (higher pure powers are already killed rationally by shuffle); it removes the central kernel of the derivation action. The cut cobracket is the sum of ⟨v_i,…,v_j⟩∧⟨v_j,…,v_{i−1}⟩ over the cyclic cuts of GR (66), keeping only positive-weight factors. It descends through cyclic and shuffle relations and satisfies co-Jacobi. Labels may repeat but equality of the cut labels is not required. The identification of its graded dual with special derivations is the separate comparison target below.

**Direct inputs:** `mathlib:TensorProduct.lift`, `mathlib:Submodule.Quotient.mk`, `mathlib:Finsupp.linearCombination`.

**Construction / proof plan:**

1. Use the puncture relation to identify V with a native finite free rational module, take cyclic coinvariants of its tensor powers and then quotient by the pure-puncture and specified shuffle submodules.
2. Define the cyclic cuts on words, omitting weight-zero factors. Check the cyclic relation, each first-shuffle generator and co-Jacobi by pairing cuts.
3. Keep the correlator weight r−1 distinct from tensor length r. This target is linear algebra on words; the special-derivation and motivic identifications are the separate targets below.

**Uses:**

- Z.3/motivic-correlator and Z.3/correlator-depth-reduction: The special-derivation pairing dualizes the motivic action; its cut and shuffle identities give the cobracket and base-point reduction.

**API:**

- `CyclicLie.word` (constructor): A cyclically ordered finite list gives a class.
- `CyclicLie.shuffle` (relation): The first-shuffle sum vanishes in the quotient.
- `CyclicLie.cut` (data): The cut cobracket is computed on words and is co-Jacobi.
- `CyclicLie.positiveWeight` (projection): The word-length m+1 part, with the indicated Tate regrading, is the weight-m correlator component.

**Checks:**

- `CyclicTensorCoalgebra.check1` (characterisation): A cyclic rotation represents the same word.
- `CyclicTensorCoalgebra.check2` (characterisation): For four letters, ⟨a,b,c,d⟩+⟨a,c,b,d⟩+⟨a,c,d,b⟩=0 is the shuffle of the singleton b with the ordered pair (c,d), with a fixed in front.
- `CyclicTensorCoalgebra.check3` (non-example): A mixed two-letter word has correlator weight one, while ⟨X_s,X_s⟩ is zero in the reduced object. The latter must not survive as a spurious derivation.

**Acceptance:** The repeated-puncture cases are admitted, and the base point is not an extra puncture letter in every word.

**Sources:**

- [GR](#source-gr), §2, item 2, the cyclic envelope and its shuffle relations, p. 27; equation (66) and Figure 7, p. 28. GR forms the cyclic tensor envelope of H₁ of the punctured line, divides by the first-shuffle relations to obtain CLie^∨, and describes the cut cobracket (66) illustrated in Figure 7.
- [G08](#source-g08), §8.2, Lemma 8.1 and Proposition 8.3, p. 84. Proposition 8.3 shows that the kernel of the derivation map on cyclic words is spanned by pure-puncture polynomials, which is why the reduced object removes the pure length-two words (E04).

<a id="target-Z-3-cyclic-special-derivations"></a>

### Z.3/cyclic-special-derivations. Cyclic words and tangential special derivations

**Comparison.** For the punctured line with distinguished tangential puncture a, the graded dual of the positive reduced cyclic shuffle coalgebra identifies canonically with the positive graded special derivations of its free fundamental Lie algebra. In puncture generators these satisfy D(X_a)=0 and D(X_s)=[X_s,u_s] for s≠a, where X_a=−Σ\_{s≠a}X_s; the Lie relation is preserved. The bracket on derivations is dual to the cyclic-cut cobracket. The requirement D(X_a)=0 is essential: preserving conjugacy classes alone gives a larger space.

**Hypotheses:** The rational punctures are distinct and the tangent at a is nonzero. The free graded Lie algebra on the puncture generators modulo the single relation is native; its Hodge and motivic realizations enter only in motivic-correlator. Graded pieces and duals are taken degreewise.

**Direct inputs:** [Z.3/cyclic-tensor-coalgebra](#target-Z-3-cyclic-tensor-coalgebra), [PeriodsAndSpecialValues:PS.9/motivic-path-torsor](../packets/PeriodsAndSpecialValues--PS.8.json), `mathlib:FreeLieAlgebra`, `mathlib:LieDerivation`.

**Construction / proof plan:**

1. Express a tangential derivation by the tuple u_s, modulo the ambiguity of adding a multiple of X_s. Pure-puncture cyclic powers are exactly the associative centralizer kernel removed before passing to the Lie/shuffle part.
2. Use the nondegenerate pairing of free Lie words with tensor words modulo shuffle to turn the constraint Σ\_s[X_s,u_s]=0 into cyclic invariance.
3. Identify the commutator of two derivations with the paired cut operation, including its Tate/weight regrading.

**Acceptance:** Every derivation in the image fixes the distinguished puncture generator, and both inverse constructions agree on cyclic word generators. For two punctures the free Lie algebra has one generator and no positive special derivations; the reduced cyclic side is also zero.

**Sources:**

- [GR](#source-gr), §2, item 2, the special-derivation conditions and Theorem 2.1 with (62)–(63), pp. 26–27. GR defines special derivations as those killing the tangential generator X₀ and preserving the conjugacy classes of the puncture generators, and quotes the isomorphism κ of Theorem 2.1 from G08 Proposition 8.4.
- [G08](#source-g08), §8.2, Lemma 8.1 and Propositions 8.2–8.4, pp. 84–85. Lemma 8.1 gives the derivation κF by X₀↦0 and X_s↦[X_s,∂F/∂X_s]; Proposition 8.3 identifies its kernel with the pure-puncture polynomials and proves the reduced map is an isomorphism; Proposition 8.4 states the shuffle-quotient version, which needs the same reduction in length two (E04).

<a id="target-Z-3-motivic-correlator"></a>

### Z.3/motivic-correlator. Motivic correlators on the punctured line

**Construction.** For a number field F, a∈P¹(F), a nonzero tangent vector v at a and b₀,…,b_m distinct from a (repetitions among bᵢ allowed for m>1; require b₀≠b₁ when m=1), define Cor^M_{a,v}(b₀,…,b_m) in the weight-m Lie coalgebra of MT(F), by dualizing its action on the motivic unipotent fundamental group and the cyclic-word/special-derivation pairing. For m>1 it is independent of v. Its cyclic-cut cobracket is GR (66). For the standard tangent at ∞ fixing the affine coordinate and b₀≠b₁, Cor∞(b₀,b₁)=b₀−b₁ in U in the source’s weight-one normalization; the weight-two value agrees with the imported dilogarithm, with the sign in GR (67). The pure-puncture word classes are zero in the reduced cyclic carrier; the ordinary weight-one numerical formula is asserted only off its diagonal.

**Direct inputs:** [Z.3/cyclic-tensor-coalgebra](#target-Z-3-cyclic-tensor-coalgebra), `MotivesAndAlgebraicCycles:MC.4`, [MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction](../packets/MotivesAndAlgebraicCycles.json), [Polylogarithms:P.1/bloch-wigner-dilogarithm](../packets/Polylogarithms.json), [PeriodsAndSpecialValues:PS.9/motivic-path-torsor](../packets/PeriodsAndSpecialValues--PS.8.json), [PeriodsAndSpecialValues:PS.9/mixed-tate-z](../packets/PeriodsAndSpecialValues--PS.8.json), [Z.3/cyclic-special-derivations](#target-Z-3-cyclic-special-derivations), `PeriodsAndSpecialValues:PS.9`, [AnabelianGeometryAndNonabelianChabauty:NC.2/tannakian-groups](../packets/AnabelianGeometryAndNonabelianChabauty--NC.2.json), [AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths](../packets/AnabelianGeometryAndNonabelianChabauty--NC.2.json).

**Construction / proof plan:**

1. Invoke MT-1 and MT-2 for the actual mixed Tate category, its Lie coalgebra and the motivic fundamental group.
2. Apply the dual action to cyclic words; use specialness to descend through the shuffle quotient.
3. Use the free fundamental group calculation to derive the cut formula and the weight-one/two normalization.

**Uses:**

- Z.3/hodge-correlator, Z.3/correlator-depth-reduction and Z.3/correlator-realization: The explicit single/double words, cyclic invariance and tangent independence define and normalize the coalgebra realization.

**API:**

- `MotivicCorrelator.word` (constructor): The given marked and tangential data produce a weight-m element.
- `MotivicCorrelator.cyclic` (relation): Cyclically permuting bᵢ leaves the correlator unchanged.
- `MotivicCorrelator.delta` (compatibility): The cobracket is the cyclic sum of cuts in (66).
- `MotivicCorrelator.map` (functoriality): Field embeddings and projective coordinate changes transport all marked data.
- `MotivicCorrelator.tangent_independent` (relation): Changing v does not affect weights greater than one.

**Checks:**

- `MotivicCorrelator.check1` (computation): For u≠w, Cor∞(u,w) is the U-class of u−w, not u/w.
- `MotivicCorrelator.check2` (degenerate): Repeated bᵢ are allowed in weights m>1, but a=bᵢ is outside the ordinary domain and m=1 requires two distinct arguments.
- `MotivicCorrelator.check3` (compatibility): Weight two has the negative motivic dilogarithm cross-ratio normalization of (67).

**Acceptance:** This constructs a subcoalgebra of correlators, not a proof of the universality conjecture for all weights.

**Sources:**

- [GR](#source-gr), §2, items 2–5, equations (62)–(68) with Theorem 2.2 and Definition 2.3, pp. 26–29; §1.2, item 5, pp. 14–15. GR recalls the motivic fundamental group of the punctured line with tangential base point and the special-derivation action (62)–(63), defines motivic correlators by dualizing it, lists cyclic invariance (65), tangent independence in weights above one, the cut cobracket (66) and the low-weight values (67), and fixes the correlators {x}\_m and {x,y}\_{m−1,1} in (68).

<a id="target-Z-3-hodge-correlator"></a>

### Z.3/hodge-correlator. Hodge correlator integrals

**Construction.** For the punctured complex line, realize the motivic correlator by the trivalent plane-tree integral: leaves are labelled by the cyclic bᵢ, internal vertices range over P¹(C), edges carry the Green function log|x−y| with the specified tangential normalization at a, and the integrand is the alternating product of one Green function and d^C of the remaining edge functions, summed with the plane-tree orientation and automorphism weights. Here d^C=∂−∂̄. The precise normalization is the Hodge realization and canonical real period convention of GR §2.3; it is checked against its weight-two value rather than inferred from an unnormalized integral.

**Direct inputs:** [Z.3/motivic-correlator](#target-Z-3-motivic-correlator), `HodgeStructuresPartII:H.2`.

**Construction / proof plan:**

1. Use request HODGE for the framed Hodge–Tate realization and canonical period.
2. Construct the finite tree sum and the locally integrable integral, with the normalization specified by the realization.
3. Check its cut differential and weight-two period; the collision limit is a separate theorem.

**Uses:**

- Z.3/correlator-collision, Z.3/correlator-realization and Z.5/canonical-period-four: Its integral realizes the motivic words, controls partial-collision limits and fixes the real-period normalization in low weights.

**API:**

- `HodgeCorrelator.treeIntegral` (data): A plane trivalent tree has the oriented Green-function integral described above.
- `HodgeCorrelator.sum` (constructor): Sum the tree integrals with their automorphism factors.
- `HodgeCorrelator.realization` (compatibility): The sum equals the canonical real period of Cor^M under each complex embedding.
- `HodgeCorrelator.affine` (functoriality): Affine changes of the line preserve weights greater than one with the induced tangential data.

**Checks:**

- `HodgeCorrelator.check1` (compatibility): The three-leaf value recovers the imported Bloch–Wigner period with the source’s sign and Tate normalization.
- `HodgeCorrelator.check2` (characterisation): Cyclic reordering of the leaves preserves the correlator.
- `HodgeCorrelator.check3` (non-example): An unrestricted all-leaves collision is not assigned a continuous limit by the collision theorem.

**Acceptance:** Keep Green-function normalization, d^C and Tate powers in the API.

**Sources:**

- [GR](#source-gr), §2, item 6 and Figure 8, p. 31. Item 6 recalls the Green function normalized by the tangent vector at a (log|x−y| for a=∞), the forms on plane trivalent trees built from one Green function and d^C of the others, and defines the Hodge correlator as the sum of their integrals weighted by 1/|Aut T|.
- [M20](#source-m20), §2.1.3, example after the diagram (16), p. 18. The worked example computes Cor^H(1,0,z)=−(1/2)(2πi)^{−2}L₂(z), fixing the weight-two normalization.

<a id="target-Z-3-correlator-collision"></a>

### Z.3/correlator-collision. Collision continuity of Hodge correlators

**Theorem.** For m>1, Cor^H(z₀,…,z_m) is continuous on C^{m+1} minus the locus where all entries coincide. In a partial collision the specialization is the correlator on the component nearest the tangential base point, with coincident arguments retained. The theorem makes no continuity claim at the full diagonal. In particular it justifies the specialized Q₃/Q₄ relations used by the motivic realization.

**Direct inputs:** [Z.3/hodge-correlator](#target-Z-3-hodge-correlator), `HodgeStructuresPartII:H.2`.

**Construction / proof plan:**

1. Use the admissible degeneration and canonical extension requested in HODGE.
2. Control logarithmic singularities and reduce the possible limit discrepancy to a constant on a boundary stratum.
3. Apply the circular-average cancellation in Lemma 29 to kill that constant.

**Acceptance:** A triple of points collapsing to the same value can have direction-dependent dilogarithmic cross-ratio limits; the excluded locus is essential.

**Sources:**

- [M20](#source-m20), §2.1.3, Theorem 11, p. 18; §4, Lemma 29 with its proof and the closing corollary, pp. 44–45. Theorem 11 asserts that Hodge correlators are continuous off the full diagonal; Lemma 29 shows that the limit discrepancy on a boundary stratum vanishes by averaging over circles, and the corollary states that only the component nearest the base point determines the limit, with the example of L₂((a−c)/(b−c)) having no limit.

<a id="target-Z-3-correlator-basepoint-change"></a>

### Z.3/correlator-basepoint-change. Change of correlator base point

**Theorem.** Let ℓ≥3, a≠b, and x₁,…,x_ℓ be rational points different from a and b, with repetitions permitted. For I⊆{1,…,ℓ}, let x^I replace x_i by a exactly when i∈I. Then Cor_a(x₁,…,x_ℓ)=Σ\_I(−1)^|I|Cor_b(x^I). These correlators have weight ℓ−1. When an argument approaches its own base point, the regularized specialization Cor_a(a,x₂,…,x_ℓ) is zero provided at least one other argument differs from a. This is a specialization statement, not an unrestricted definition on the full diagonal.

**Hypotheses:** Number field F; nonzero tangential basepoints, with tangent independence in weights ℓ−1>1. Ordinary arguments avoid their current base point. Boundary arguments are interpreted by the stated regularized specialization, and the all-coincident locus is excluded.

**Direct inputs:** [Z.3/motivic-correlator](#target-Z-3-motivic-correlator), [Z.3/hodge-correlator](#target-Z-3-hodge-correlator), [Z.3/correlator-collision](#target-Z-3-correlator-collision), `HodgeStructuresPartII:H.2`, [BorelRegulators:R.4/regulator-real-isomorphism](../packets/BorelRegulators.json), `MotivesAndAlgebraicCycles:MC.4`.

**Construction / proof plan:**

1. Use the Green-function identity G_a(x,y)=G_b(x,y)−G_b(a,y)−G_b(x,a)+constant.
2. Integrals from internal-edge correction terms split with one zero factor; expanding the external edges yields exactly the subset sum.
3. Compare cobrackets and apply Hodge rigidity and injectivity of the number-field regulator on primitive extensions to obtain the motivic identity.
4. At an argument/base-point collision use the regularized logarithm in weight one and induction on cuts; the remaining constant is killed by a first-shuffle relation.

**Acceptance:** For ℓ=3 the nonzero terms give the dilogarithmic five-term identity; a simultaneous full collision is excluded.

**Sources:**

- [GR](#source-gr), §2, item 7, Theorem 2.6 with (70)–(72), p. 32; Lemmas 2.7 and 2.8 with (73), p. 33. Theorem 2.6 expresses Cor_a as the signed sum over subsets of arguments replaced by a of Cor_b, proved from the Green-function identity (71) and transported to motives by regulator injectivity and the rigidity Lemma 2.7; Lemma 2.8 shows the specialization at an argument meeting the base point vanishes when another argument differs.

<a id="target-Z-3-correlator-depth-reduction"></a>

### Z.3/correlator-depth-reduction. Weight-four correlator depth reduction

**Theorem.** For ℓ>3 arguments, every weight-(ℓ−1) motivic correlator is a rational linear combination of correlators with at least two equal arguments, after a projective coordinate change and the specified base-point specialization. In weight four (ℓ=5), repeated use of this reduction and first-shuffle identities expresses every correlator as a combination of −Cor∞(0,0,x,1,y) and −Cor∞(0,0,0,1,z). The excluded ℓ=3 case is weight two, where this depth reduction is false; the argument count and the motivic weight must not be confused.

**Direct inputs:** [Z.3/motivic-correlator](#target-Z-3-motivic-correlator), [Z.3/correlator-collision](#target-Z-3-correlator-collision), [Z.3/cyclic-tensor-coalgebra](#target-Z-3-cyclic-tensor-coalgebra), [Z.3/correlator-basepoint-change](#target-Z-3-correlator-basepoint-change).

**Construction / proof plan:**

1. Use correlator-basepoint-change and its zero boundary specialization to show that, modulo repeated-argument correlators, exchanging the basepoint with one argument negates the class.
2. For even ℓ, cyclic invariance and the induced permutation sign kill the class. For odd ℓ>3, the first-shuffle relation pairs all but an even-multiple remainder, which vanishes rationally.
3. At ℓ=5 reduce the repeated words with cyclic and shuffle relations, and normalize the remaining distinct points projectively to obtain the stated two types.

**Acceptance:** The depth bound is ℓ>3 on the number of arguments, hence weight greater than two. It is applied at ℓ=5, not extrapolated to the dilogarithm.

**Sources:**

- [GR](#source-gr), §2, item 7, Proposition 2.9 with footnote 12, pp. 33–34; Corollary 2.10, p. 34. Proposition 2.9 shows that for more than three arguments every correlator is a combination of correlators with a repeated argument (false for three arguments, footnote 12); Corollary 2.10 concludes that every weight-four correlator is a sum of the correlators {x,y}\_{3,1} and {x}₄.

<a id="target-Z-3-correlator-realization"></a>

### Z.3/correlator-realization. Realization of the combinatorial Lie coalgebra

**Theorem.** For a number field F, S_m(y)↦−Cor∞(0 repeated m−1 times,1,y), D₂₁(x,y)↦Cor∞(0,x,1,y), and D₃₁(x,y)↦−Cor∞(0,0,x,1,y) define a natural morphism from the combinatorial graded Lie coalgebra through weight four to the mixed Tate motivic Lie coalgebra. Its image is exactly the correlator subcoalgebra in these weights. It is not asserted injective or surjective onto the entire motivic Lie coalgebra.

**Direct inputs:** [Z.3/weight-four-cobracket](#target-Z-3-weight-four-cobracket), [Z.3/motivic-correlator](#target-Z-3-motivic-correlator), [Z.3/hodge-correlator](#target-Z-3-hodge-correlator), [Z.3/correlator-collision](#target-Z-3-correlator-collision), [Z.3/correlator-depth-reduction](#target-Z-3-correlator-depth-reduction), [Z.1/trilogarithm-reduction](#target-Z-1-trilogarithm-reduction), `MotivesAndAlgebraicCycles:MC.4`, [MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction](../packets/MotivesAndAlgebraicCycles.json), `HodgeStructuresPartII:H.2`.

**Construction / proof plan:**

1. Compare the cyclic-cut formulas with the two explicit cobrackets.
2. Use the cluster boundary identities to show each Q-relation image is primitive.
3. Apply Griffiths-transversality rigidity to this primitive variation; fix its constant by specialization to rational configurations and the relevant rational K-ranks. MT-1 must include these primitive identifications and faithful period detection for the constant extensions used here.
4. Use collision continuity for specialized relations and depth reduction for the claimed image.

**Acceptance:** No general period-injectivity conjecture or motivic universality assertion is used.

**Sources:**

- [GR](#source-gr), §1.2, item 5, Theorem 1.13, pp. 15–16; §2, Theorem 2.4 and Proposition 2.5, pp. 29–31; §5.3, pp. 56–57; Lemma 2.7, p. 33. Theorems 1.13 and 2.4 state that {x}\_m, {x,y}\_{2,1}, {x,y}\_{3,1} ↦ the correlators of (68) define a map of Lie coalgebras from L_{≤4} onto the correlator subcoalgebra. §5.3 proves the relation images vanish: they have zero cobracket (Proposition 2.5 with Proposition 5.4 and Theorem 4.3), hence are constant by Lemma 2.7, and the constant is zero since Ext¹\_{MT(Q)}(Q(0),Q(4))=0, with the {1}₃ constant fixed in weight three and M20's continuity for specializations.

## Z.4. Grassmannian configurations and decorated flags

Import generic configurations, projection, duality and explicit B₃ from Polylogarithms:P.3. Construct the weight-four truncation, decorated-flag comparison, Grassmannian G₄ and the normalized chain map with its Λ²B₂ diagonal. Give finite symbolic proofs of every square, including the degree-eight cancellation R₇³∂+R₇²p=0 that replaces GR Lemma 7.9, and the corrected scalar in Theorem 10.15.

**Layer inputs:** `Polylogarithms:P.3`, `GeneralAlgebraicKTheory:K.2`, `K3BlochGroups:V.3`.

**Planets:** Weight-four Bigrassmannian complex; Decorated flags; Decorated flag comparison; Grassmannian weight-four group; Weight-four configuration maps; Grassmannian chain-map theorem.

**Coverage:** planned. Discharge FLAG-SIGNS, C8-SQUARE and HOM; write the finite symbolic certificates of the configuration identities, including the degree-eight cancellation.

<a id="target-Z-4-weight-four-bigrassmannian"></a>

### Z.4/weight-four-bigrassmannian. The weight-four Bigrassmannian complex

**Construction.** Use exactly the supplier’s C_m(q), preserving vector scales. Set BC_m^(4)=⊕\_{4≤q<m}C_m(q), in homological degree m, as the quotient of the full complex by the rows q<4. Use ∂=Σ\_{i=0}^{m−1}(−1)^i deletion_i and p=Σ\_i(−1)^i projection_i; ∂²=p²=0 and ∂p+p∂=0, hence D=∂+p. Outgoing components in the quotient vanish. Grassmannian duality gives the dual truncation q≤m−4 and interchanges deletion and projection.

**Direct inputs:** [Polylogarithms:P.3/generic-vector-configurations](../packets/Polylogarithms--P.3.json), [Polylogarithms:P.3/weight-three-bigrassmannian](../packets/Polylogarithms--P.3.json), [Polylogarithms:P.3/configuration-duality](../packets/Polylogarithms--P.3.json), `mathlib:Finsupp.linearCombination`.

**Construction / proof plan:**

1. Reuse the generic vector configuration object and its two face maps, not a projectivized replacement.
2. Generalize the supplier’s quotient-by-rows construction from cutoff three to cutoff four.
3. Use the same mixed face identities and duality maps with the declared zero-based indexing.

**Uses:**

- Z.4/flag-comparison and Z.4/configuration-formulas: The quotient-row differential and duality give the source of the normalized configuration map from flag homology.

**API:**

- `Bigrassmannian4.component` (data): The degree-m object has precisely the rows 4≤q<m.
- `Bigrassmannian4.differential` (data): D is the sum of the two alternating face maps on the quotient.
- `Bigrassmannian4.duality` (equivalence): Duality maps the cutoff to q≤m−4 and exchanges faces.
- `Bigrassmannian4.quotient` (compatibility): This is the quotient construction used at weight three with a different cutoff.

**Checks:**

- `WeightFourBigrassmannian.check1` (computation): BC₅^(4)=C₅(4), and BC₄^(4)=0.
- `WeightFourBigrassmannian.check2` (degenerate): The projection of C₆(4) to C₅(3) is zero in the quotient, not a retained differential.
- `WeightFourBigrassmannian.check3` (compatibility): Two consecutive mixed faces cancel with the supplier’s zero-based signs.

**Acceptance:** The corner C₅(4) has degree five.

**Sources:**

- [GR](#source-gr), §7.1, equations (129)–(130), pp. 62–63; §7.4, the Grassmannian duality and (159), pp. 68–69. GR organizes generic vector configurations into the Grassmannian bicomplex (129) with forgetting and projection maps, defines the weight-m Bigrassmannian complex as the total complex of its quotient by the lower rows (weight four (130), corner C₅(4) in degree five), and dualizes it in (159), duality exchanging projection and forgetting.

<a id="target-Z-4-decorated-flags"></a>

### Z.4/decorated-flags. Generic decorated flags

**Definition.** A decorated p-flag in an N-dimensional F-space is 0=F₀⊂F₁⊂…⊂F_p with dim F_i=i and a specified nonzero vector f_i∈F_i/F_{i−1}. An m-tuple is generic when every sum F_{1,a₁}+…+F_{m,a_m} with 0≤aᵢ≤p and Σaᵢ≤N is direct. Let C_m(A_N^(p)) be the rational free module on generic tuples modulo simultaneous GL_N action. The underlying generic-tuple augmented complex, before coinvariants, uses the alternating deletion differential. Decorated flags are native chains of submodules and nonzero vectors in native quotients.

**Direct inputs:** `mathlib:Submodule.Quotient.mk`, `mathlib:Finsupp.linearCombination`, [Polylogarithms:P.3/generic-vector-configurations](../packets/Polylogarithms--P.3.json).

**Construction / proof plan:**

1. Define the nested subspaces, rank conditions and decorations in their quotient spaces.
2. Define genericity by all the finite direct-sum dimension tests.
3. Take free modules on tuples, then GL coinvariants for the configuration complex.

**Uses:**

- Z.4/flag-comparison and Z.4/flag-resolution: Submodule sums and decorations define the quotient vector configurations; genericity against finite support supplies the coning argument.

**API:**

- `DecoratedFlag.subspace` (projection): The i-th subspace has dimension i and is nested in the next.
- `DecoratedFlag.decoration` (projection): The i-th nonzero vector belongs to F_i/F_{i−1}.
- `DecoratedFlag.generic` (characterisation): Genericity is exactly the direct-sum condition above.
- `DecoratedFlag.map` (functoriality): Linear isomorphisms transport flags and decorations; field extension preserves genericity.

**Checks:**

- `DecoratedFlags.check1` (computation): A decorated one-flag is a line with a nonzero vector on it.
- `DecoratedFlags.check2` (non-example): Two flags sharing the same first line are not generic when N≥2.
- `DecoratedFlags.check3` (compatibility): Replacing a lift of f_i by a vector differing by F_{i−1} gives the same decoration, as in the native quotient.

**Acceptance:** The decorations are quotient vectors, not arbitrary representatives in F_i.

**Sources:**

- [GR](#source-gr), §7.1, equations (131)–(132), p. 63. GR defines decorated p-flags, genericity of a tuple of them by directness of every sum of flag members of total dimension at most n, and the configuration complex (132) with the simplicial differential.

<a id="target-Z-4-flag-comparison"></a>

### Z.4/flag-comparison. From decorated flags to configurations

**Construction.** For N≥4 put p=N−4 and use flags of length p+1=N−3. For m flags and each a=(a₁,…,a_m) with aᵢ≥0, Σaᵢ≤p, project the decoration f_{i,aᵢ+1} to V/(⊕\_i F_{i,aᵢ}), obtaining a generic m-tuple in dimension N−Σaᵢ. Sum its class over all such a. This gives t_{m−4}:C_m(A_N^(N−3))→BC_m^(4), omitting zero target rows q≥m. It is a chain map with the declared face convention and commutes with stabilization after the specified standard flag choices.

**Direct inputs:** [Z.4/decorated-flags](#target-Z-4-decorated-flags), [Z.4/weight-four-bigrassmannian](#target-Z-4-weight-four-bigrassmannian), `mathlib:Submodule.Quotient.mk`.

**Construction / proof plan:**

1. Directness makes each quotient dimension and each projected vector well-defined.
2. Changing a decoration lift changes it by a subspace already killed in the quotient.
3. In the boundary, partition terms by whether the removed flag index has aᵢ=0 or aᵢ>0; pair them with deletion and projection faces.
4. Record the sign comparison with D=∂+p explicitly; FLAG-SIGNS is the remaining certificate obligation.

**Uses:**

- Z.5/generic-chern-cocycle and Z.6/k-theory-comparison: The finite multi-index sum pulls the configuration cocycle to generic flags and its stabilization produces the group-homological map.

**API:**

- `FlagComparison.term` (constructor): A multi-index a gives a configuration in the stated quotient dimension.
- `FlagComparison.sum` (data): The finite multi-index sum gives t_{m−4}.
- `FlagComparison.chain` (compatibility): The signed deletion boundary agrees with D after the explicit face-sign certificate.
- `FlagComparison.stabilize` (functoriality): Adding the standard complementary flag directions gives the stabilized comparison.

**Checks:**

- `FlagComparison.check1` (computation): For N=4, p=0 and only a=(0,…,0) occurs.
- `FlagComparison.check2` (degenerate): The term aᵢ=p uses decoration number p+1, so flags of length p are insufficient.
- `FlagComparison.check3` (non-example): Quotienting by ⊕F_{i,aᵢ+1} would kill the very vector that must survive.

**Acceptance:** The construction at N=4 reduces to the ordinary generic-vector configuration map.

**Sources:**

- [GR](#source-gr), §7.1, Theorem 7.1 with (133)–(134), p. 63; §9.1, items 1–3, pp. 85–87. Theorem 7.1 (from G93) gives a map of complexes from generic decorated (p+1)-flags in dimension n+p to the weight-n Bigrassmannian complex, summing the projected decoration vectors (134) over multi-indices; §9.1 pulls the resulting cocycle back to BGL_n.

<a id="target-Z-4-flag-resolution"></a>

### Z.4/flag-resolution. The generic-flag comparison on group homology

**Theorem.** Over an infinite field the augmented complex of generic decorated-flag tuples before taking GL_N coinvariants is acyclic: every finite cycle is coned off by a flag generic to its finite support. Comparison from a genuine projective Q[GL_N]-resolution therefore yields a homology map to the flag-configuration complex and, through flag-comparison and duality, to the dual weight-four Bigrassmannian complex. Do not claim that the flag tuple modules themselves are free Q[GL_N]-modules. Independence of the auxiliary comparison is by comparison homotopy.

**Direct inputs:** [Z.4/decorated-flags](#target-Z-4-decorated-flags), [Z.4/flag-comparison](#target-Z-4-flag-comparison), `GeneralAlgebraicKTheory:K.2`, [Polylogarithms:P.3/stabilized-configuration-comparison](../packets/Polylogarithms--P.3.json).

**Construction / proof plan:**

1. Genericity is a finite collection of nonempty open conditions; infinitude supplies a common transverse flag for a finite support.
2. The cone contracts the finite cycle, proving exactness of the augmented complex.
3. Use projectivity of the bar resolution to construct a comparison into this exact complex; compare any two choices by a homotopy.
4. The generic group-homology comparison mechanism is request HOM, extending the supplier’s weight-three instance.

**Acceptance:** Do not infer exactness after coinvariants from exactness before coinvariants.

**Sources:**

- [GR](#source-gr), §9.3, item 3, equation (240), p. 94; §9.1, items 1–3, pp. 85–87. §9.3(3) uses the complex of generic decorated (n−3)-flags as a resolution of the trivial GL_n(F)-module, compares it with a projective resolution unique up to homotopy, and restricts to GL₃ through the invariant section (240); the exactness of the flag complex is used there rather than proved.

<a id="target-Z-4-grassmannian-group"></a>

### Z.4/grassmannian-group. The Grassmannian weight-four group

**Definition.** Let G̃₄(F) be the free Q-module on PGL₄-orbits of generic ordered eight-tuples in P³(F). Let π₈:C₈(4)→G̃₄ project vector configurations to their lines. Define G₄=G̃₄/(im(π₈∂:C₉(4)→G̃₄)+im(π₈p:C₉(5)→G̃₄)). Thus both the nine-term and dual nine-term relations are imposed. This is a proof-specific configuration group, not the single-symbol B₄-comb.

**Direct inputs:** [Z.4/weight-four-bigrassmannian](#target-Z-4-weight-four-bigrassmannian), [Polylogarithms:P.3/generic-vector-configurations](../packets/Polylogarithms--P.3.json), [Polylogarithms:P.3/configuration-duality](../packets/Polylogarithms--P.3.json), `mathlib:Submodule.Quotient.mk`, `mathlib:Finsupp.linearCombination`.

**Construction / proof plan:**

1. Project generic vectors to lines and pass to simultaneous projective isomorphism classes.
2. Take the sum of the two image submodules and the native quotient.

**Uses:**

- Z.4/configuration-formulas and Z.5/grassmannian-symbol: Both nine-term quotient relations are needed for the R₈⁴ projection and for descent of a regularized Grassmannian lift.

**API:**

- `Grassmannian4.project` (constructor): A generic eight-tuple of vectors gives its projective class.
- `Grassmannian4.nineTerm` (relation): The alternating deletion sum of nine points is zero.
- `Grassmannian4.dualNineTerm` (relation): The alternating projection sum of nine vectors in dimension five is zero.
- `Grassmannian4.lift` (universal-property): A projective configuration map killing both relations descends uniquely.

**Checks:**

- `GrassmannianGroup.check1` (compatibility): Scaling a single vector by any nonzero scalar preserves its G̃₄ class.
- `GrassmannianGroup.check2` (characterisation): All nine terms of a generic C₉(4) deletion boundary cancel in G₄.
- `GrassmannianGroup.check3` (non-example): The dual nine-term relation is separately required; imposing only deletion does not define this quotient.

**Acceptance:** Independent vector rescaling is killed here, unlike in C_m(q).

**Sources:**

- [GR](#source-gr), §7.4, Definition 7.5 with (161)–(162), p. 70. Definition 7.5 defines G₄(F) as the quotient of the space spanned by generic eight-point configurations in P³ by the images of the forgetting map from C₉(4) and the projection map from C₉(5).

<a id="target-Z-4-configuration-formulas"></a>

### Z.4/configuration-formulas. Normalized configuration formulas

**Construction.** Let Alt_m be the full signed sum over S_m and |I| the U-class of the Plücker determinant. Use the projected round cross-ratio r from P.3. Put T₃=(1/5)Alt₆[|124||235||136|/(|125||236||134|)]₃, so T₃ is minus the supplier’s r₆ and δT₃=Alt₆([r(1|2,3,4,5)]₂⊗|345|). Define R₅¹=−(5/2)Alt₅(|1|∧|2|∧|3|∧|4|); R₆²=Alt₆(((1/2)[r(2,4,5,6)]₂−[r(1,2,4,5)]₂)⊗|12|∧|23|+[r(1,3,5,6)]₂⊗|12|∧|34|); R₇³=Alt₇(((1/108)T₃(1,…,6)−[r(6|2,4,3,5)]₃)⊗|123|−(3/28)[r(1|2,5,6,7)]₂∧[r(2|1,3,4,5)]₂); R₇²=−(1/84)Alt₇([r(1,2,3,4)]₂∧[r(1,5,6,7)]₂). R₈⁴ is projection to G₄ and all unlisted components are zero. On G₄ the boundary is the descent of R₇³p, with the face signs fixed by bc; the sign certificate is explicitly required. The descent of δ̃ from G̃₄ to G₄ is proved in configuration-identities: GR's argument through Lemma 7.9 is incorrect (E05).

**Direct inputs:** [Z.4/weight-four-bigrassmannian](#target-Z-4-weight-four-bigrassmannian), [Z.4/grassmannian-group](#target-Z-4-grassmannian-group), [Polylogarithms:P.3/projected-cross-ratio](../packets/Polylogarithms--P.3.json), [Polylogarithms:P.3/triple-ratio-map](../packets/Polylogarithms--P.3.json), [Polylogarithms:P.3/trilogarithm-duality](../packets/Polylogarithms--P.3.json), `mathlib:TensorProduct.lift`, `mathlib:ExteriorAlgebra`.

**Construction / proof plan:**

1. Define the maps on generic configurations, retaining the unnormalized alternating sums.
2. Use the supplier's trilogarithm normalization with T₃=−r₆, not an unlabelled identification.
3. Use seven-term and five-term identities to prove GL/volume invariance of the required maps, and scale invariance of R₇³p (Lemma 7.7).
4. Define δ̃ on G̃₄ as the descent of R₇³p through projectivization; its descent to G₄ is part of configuration-identities.

**Uses:**

- Z.4/configuration-identities, Z.5/generic-chern-cocycle and Z.5/chern-residue-extension: The exact rational coefficients define the chain squares, the −3/28 wedge correction and the determinant-divisor residues.

**API:**

- `Configuration4.formulas` (data): Each nonzero component is exactly the displayed rational combination.
- `Configuration4.alt` (relation): Permuting the input tuple multiplies its value by the permutation sign.
- `Configuration4.deltaG` (constructor): R₇³p descends to a map δ̃ out of G̃₄ (Lemma 7.7); its further descent to G₄ is proved in configuration-identities.
- `Configuration4.scale` (compatibility): Only the composite defining δG₄ is asserted invariant under independent rescaling; raw C_m(q) keeps scales.

**Checks:**

- `ConfigurationFormulas.check1` (compatibility): The single-variable T₃ adapter is −r₆ of P.3; using +r₆ reverses its displayed boundary.
- `ConfigurationFormulas.check2` (computation): The R₆² coefficient of its first symbol is +1/2 and the R₇³ double wedge coefficient is −3/28.
- `ConfigurationFormulas.check3` (non-example): An averaged Alt divided by m! with the same rational constants fails the adjacent chain identities.

**Acceptance:** The Λ²B₂ diagonal R₇² has coefficient −1/84; it must not be dropped.

**Sources:**

- [GR](#source-gr), §7.4, Theorem 7.6 with (165)–(168), pp. 70–71; Lemma 7.7, Proposition 7.8 and Lemma 7.9, pp. 71–72. (166) gives the five maps r\*₅(1), r\*₆(2), r\*₇(3), r\*₇(2), r\*₈(4) with their rational coefficients and (167) fixes the triple-ratio normalization; Lemma 7.7 shows r\*₇(3)∘p is invariant under rescaling, giving δ̃ on G̃₄, and Proposition 7.8 shows δ̃ descends to G₄, using Lemma 7.9 (see E05).

<a id="target-Z-4-symbolic-bloch-modules"></a>

### Z.4/symbolic-bloch-modules. Finite symbolic Bloch modules

**Definition.** For the finite configuration sizes needed here, b₁(q,m) is free on q-element subsets; its determinant letters are symmetric because −1 dies in U. The b₂ generators are [i₁,…,i_{q−2}|j₁,j₂,j₃,j₄]₂, symmetric in projection indices, alternating in the last four, modulo ordinary and dual five-term relations. For b₃(3,m) use the two families [i|j,k,l,h]₃ and [i,j,k,l,h,s]₃ with dihedral and seven-term relations. The first family's three-term relation holds in B₃-exp only modulo the constant [1]₃, so evaluation of b₃ lands in B₃-exp/Q[1]₃, not in B₃-exp (E01). This suffices: every use of b₃ in the chain-map identities comes after the cobracket, and δ₃[1]₃=[1]₂⊗u(1)=0, so the composite b₃⊗b₁→B₂-exp⊗Λ²U is well defined; R₇³ itself is defined by its explicit formula in actual B₃-exp⊗U, not through b₃.

**Direct inputs:** [Z.4/configuration-formulas](#target-Z-4-configuration-formulas), `mathlib:Submodule.Quotient.mk`, `mathlib:Finsupp.linearCombination`, `mathlib:ExteriorAlgebra`, [Polylogarithms:P.3/trilogarithm-group](../packets/Polylogarithms.json), [Polylogarithms:P.3/weight-three-complex](../packets/Polylogarithms.json).

**Construction / proof plan:**

1. Build finite rational relation matrices from the displayed generator symmetries and five/seven-term relations.
2. Define evaluation of b₁ and b₂ into U and B₂-exp, and of b₃ into B₃-exp/Q[1]₃.
3. Check that the symbolic cobracket b₃→b₂⊗b₁ is compatible with evaluation followed by δ₃, which factors through B₃-exp/Q[1]₃ because δ₃[1]₃=0.

**Uses:**

- Z.4/configuration-identities: Finite relation matrices certify the squares; the distinction between constant-free and constant-augmented weight three prevents an invalid evaluation.

**API:**

- `SymbolicBloch.generator` (constructor): The finite labelled determinant and projected-symbol generators give basis classes.
- `SymbolicBloch.relation` (relation): The displayed symmetries and five/seven-term relation matrices vanish.
- `SymbolicBloch.evaluate` (compatibility): Evaluation of b₂ lands in actual B₂; evaluation of b₃ lands in B₃-exp/Q[1]₃, and its composite with δ₃ lands in B₂⊗U.
- `SymbolicBloch.constant` (data): The class [1]₃ has zero cobracket, so cobracket identities proved in b₃ hold after evaluation.

**Checks:**

- `SymbolicBlochModules.check1` (computation): The finite relation matrix gives dim b₂(2,6)=10 and dim b₂(3,7)=55.
- `SymbolicBlochModules.check2` (compatibility): Swapping two determinant indices changes the determinant by −1 but leaves its U-letter unchanged.
- `SymbolicBlochModules.check3` (non-example): The weight-three three-term sum evaluates to [1]₃ in B₃-exp, so b₃→B₃-exp is not defined; after δ₃ its image is zero.

**Acceptance:** No FI-module representation stability theorem is required for these finite calculations.

**Sources:**

- [GR](#source-gr), §10.1, Definitions 10.2, 10.4 and 10.7 with Examples 10.6 and 10.8, pp. 95–97. §10.1 defines the symbolic groups b₁, b₂ (with five-term and dual five-term relations) and b₃ (two families, the first with a constant-free three-term relation, the second with the seven-term relation), their evaluation maps and the unique compatible symbolic cobrackets; Example 10.6 gives dim b₂(2,6)=10 and dim b₂(3,7)=55.

<a id="target-Z-4-configuration-identities"></a>

### Z.4/configuration-identities. The configuration chain-map identities

**Theorem.** The formulas R₅¹,R₆²,R₇³,R₇²,R₈⁴ give a map of the dual weight-four Bigrassmannian complex, with total differential D=∂+p, to G₄→(B₃-exp⊗U)⊕Λ²B₂→B₂⊗Λ²U→Λ⁴U. The required identities are: δR₆²=R₅¹p on C₆(2), δR₇³=R₆²p on C₇(3), δR₇²=R₆²∂ on C₇(2), δ\_{G₄}R₈⁴=R₇³p on C₈(4) (the definition of δ\_{G₄}), and the conditions R₅¹∂=0 on C₆(1), R₇²∂=0 on C₈(2) and R₇³∂+R₇²p=0 on C₈(3). The last identity does not split: the Λ²B₂ part of R₇³∂ is nonzero on C₈(3) and is cancelled by R₇²p (E05). For the unscaled wedge W=Alt₇([r1234]₂∧[r1567]₂), the source's last calculation gives δW=−84 times the expression displayed on the right of its equation (244); this is why R₇²=−W/84 (E02). The constant-free symbolic b₃ suffices for these identities (E01). Consequently δ̃ descends from G̃₄ to G₄: it kills the projection relation because p²=0, and the forgetting relation because δ̃∂=R₇³p∂=−R₇³∂p=R₇²pp=0 (GR Proposition 7.8, with the corrected argument).

**Direct inputs:** [Z.4/configuration-formulas](#target-Z-4-configuration-formulas), [Z.4/symbolic-bloch-modules](#target-Z-4-symbolic-bloch-modules), [Polylogarithms:P.3/seven-term-configuration-relation](../packets/Polylogarithms--P.3.json), [Polylogarithms:P.3/trilogarithm-duality](../packets/Polylogarithms--P.3.json), [K3BlochGroups:V.3/pre-bloch-group](../packets/K3BlochGroups.json), [Z.4/grassmannian-group](#target-Z-4-grassmannian-group).

**Construction / proof plan:**

1. In the first square use δb₁=−3a₁+6a₃, δb₂=a₁−2a₂−a₃, δb₃=−2a₂−4a₃; hence δ(b₁/2−b₂+b₃)=−5a₁/2 (Lemma 10.10).
2. For the middle square expand in t₁,…,t₈ and reduce by the explicit five-term matrices of Lemma 10.12; use Lemma 10.13 with its coefficient 14.
3. For the diagonal square verify δW=−42 Alt₇([r2456]₂⊗|12|∧|23|), while the other expression reduces to half that alternation.
4. For C₈(3): the B₃⊗U part of R₇³∂ vanishes because it does not involve the seventh vector. Put X=Alt₈([r(1|2,5,6,7)]₂∧[r(2|1,3,4,5)]₂). The five-term reduction of Lemma 7.9 gives 3X=−Alt₈([r(1|5,6,7,8)]₂∧[r(2|1,3,4,5)]₂), which is not zero, and Alt₈([r(8|1,2,3,4)]₂∧[r(8|1,5,6,7)]₂)=−9X; with the coefficients −3/28 and −1/84 the two contributions cancel. Supply the finite symbolic certificate in Λ²b₂(3,8) (gap C8-SQUARE).
5. For C₈(2) and C₆(1): R₅¹∂=0 because the alternation runs over two unused vectors; R₇²∂=0 needs a finite symbolic certificate in Λ²b₂(2,8) (gap C8-SQUARE).
6. The three squares of GR §10 use D=∂+p with GR's alternating signs Σ(−1)^{s−1}; no further sign adapter is needed inside the dual Bigrassmannian complex.

**Acceptance:** Each square is checked independently, including the diagonal; d² is a consistency check rather than a proof of the missing constants.

**Sources:**

- [GR](#source-gr), §7.4, Theorem 7.6 and Lemma 7.9, pp. 70–72; §10, Theorems 10.9, 10.11 and 10.15 with Lemmas 10.10 and 10.12–10.14, pp. 98–107. §10 proves the three squares of (165): Theorem 10.9 (first square via Lemma 10.10), Theorem 10.11 (middle square via Lemmas 10.12–10.13, with the coefficient 14 and the −3/28 term) and Theorem 10.15 (diagonal square, δW=−42·Alt₇({2,4,5,6}₂⊗|12|∧|23|)); Lemma 7.9 treats the forgetting composite on C₈(3) (E05).

## Z.5. Periods, residues and the Chern cocycle

Restrict the canonical Hodge period to weight four, prove its classical-cycle calibration, and construct the normal-crossing residue/current diagram required by the flag cocycle. Construct scissors comparison, its regularized motivic lift, the cancellation of the Λ²B₂ component, residue extensions and nonzero Chern normalization. Unproved descent or regularization leaves are recorded as gaps.

**Layer inputs:** `ZagierConjecturePolylogarithms:Z.4`, `Polylogarithms:P.5`, `MotivicEtaleKTheory:M.8`, `HodgeStructuresPartII:H.2`, `ZagierConjecturePolylogarithms:Z.3`, `Polylogarithms:P.1`, `ZagierConjecturePolylogarithms:Z.1`, `Polylogarithms:P.4`, `Polylogarithms:P.2`, `Polylogarithms:P.3`, `K3BlochGroups:V.3`, `MotivesAndAlgebraicCycles:MC.6`, `PeriodsAndSpecialValues:PS.9`.

**Planets:** Canonical weight-four period; Cycle period calibration; Weight-four regulator; Grassmannian polylogarithm; Polylogarithmic Chern cocycle; Chern regulator comparison.

**Coverage:** planned. Discharge LIFT, RES, SCISSORS and DELIGNE; use Gon00's normalization of a₃ (E06) and verify the nonzero Chern normalization.

<a id="target-Z-5-canonical-period-four"></a>

### Z.5/canonical-period-four. The canonical weight-four period

**Construction.** Restrict the canonical real period map from the Chevalley–Eilenberg complex of framed Hodge–Tate structures to weight four and precompose with correlator-realization. In the real-valued convention for the parent’s single-valued L_n, its single-symbol value is L₄\*(z)=(5L₄(z)+(1/3)L₂(z)log²|z|)/16. In lower weights L₃\*=3L₃/8 and L₂\*=L₂/2. The bottom Λ⁴U component is ω₄=Alt₄(log|x₁| d^C log|x₂|∧d^C log|x₃|∧d^C log|x₄|)/6, with d^C=∂−∂̄; Tate coefficients and the Deligne grading are retained. All other components are determined by the imported canonical period DGA map, not by a guessed pointwise equality to L₄.

**Direct inputs:** [Z.3/correlator-realization](#target-Z-3-correlator-realization), [Z.3/hodge-correlator](#target-Z-3-hodge-correlator), [Polylogarithms:P.1/single-valued-polylogarithm](../packets/Polylogarithms.json), `HodgeStructuresPartII:H.2`, `mathlib:TensorProduct.lift`, `mathlib:ExteriorAlgebra`.

**Construction / proof plan:**

1. Use request HODGE for the canonical period DGA map with its exact Tate and d^C conventions.
2. Restrict its weight-four part and evaluate the single/double correlator generators.
3. Compare the single-symbol expression with the parent’s chosen L₂,L₃,L₄ normalization; verify the bottom alternating logarithm form.

**Uses:**

- Z.5/cycle-period-calibration, Z.5/current-regulator-four and Z.6/kappa-regulator: Its single value gives the 5/16 cycle comparison, and its lower-degree forms and DGA law give the current regulator.

**API:**

- `Period4.single` (simp): A single symbol has the value L₄\* above.
- `Period4.bottom` (simp): Four U-entries have the ω₄ value with factor 1/6.
- `Period4.chain` (compatibility): Exterior differential and the Chevalley–Eilenberg differential commute under the canonical map.
- `Period4.conjugation` (functoriality): Complex conjugation acts by the expected even-weight sign, giving the conjugate-pair real coordinates.
- `Period4.realCoordinate` (projection): The light numerical coordinate function on real inputs (a,b,l) is (5a+(1/3)b l²)/16. Its specialization to a=L₄(z), b=L₂(z), l=log|z| is the canonical single-symbol period.

**Checks:**

- `CanonicalPeriodFour.check1` (computation): At |z|=1 the correction vanishes, giving L₄\*(z)=5L₄(z)/16.
- `CanonicalPeriodFour.check2` (non-example): For a generic z with L₂(z)log²|z|≠0 the ratio L₄\*/L₄ is not forced to be 5/16.
- `CanonicalPeriodFour.check3` (compatibility): Interchanging two U-entries negates ω₄; repeated entries give zero.

**Acceptance:** The period formula has a correction away from cycles.

**Sources:**

- [GR](#source-gr), §8.2, item 2, Theorem 8.3 with (183)–(188), pp. 76–77; item 3, equations (190)–(192), pp. 77–78. Theorem 8.3 gives the canonical real period map of commutative dg-algebras on the Chevalley–Eilenberg complex of framed Hodge–Tate structures, with log|f| in weight one and ω\_{n−1} on Λⁿ; (191)–(192) give its weight-four values: L\*₄, L\*₃, L\*₂ and the four component formulas, ending with ω₄=(1/6)Alt₄(log|x₁|d^C log|x₂|∧d^C log|x₃|∧d^C log|x₄|).

<a id="target-Z-5-cycle-period-calibration"></a>

### Z.5/cycle-period-calibration. Classical period calibration on cycles

**Theorem.** For a finite rational single-symbol sum a=Σ\_z q_z[z]₄ whose explicit boundary Σ\_z q_z[z]₃⊗z is zero, and every embedding σ:F→C, one has Σ\_z q_z L₂(σz)log²|σz|=0 and hence Σ\_z q_z L₄\*(σz)=(5/16)Σ\_z q_z L₄(σz). More generally the same argument applies to any free single-symbol representative of an element of ker δ₄-exp. The equality is proved on representatives and descends; it does not assume that a tensor relation holds termwise.

**Direct inputs:** [Z.5/canonical-period-four](#target-Z-5-canonical-period-four), [Z.1/weight-three-cobracket](#target-Z-1-weight-three-cobracket), [Z.3/classical-subspace](#target-Z-3-classical-subspace), [Polylogarithms:P.4/explicit-weight-four-complex](../packets/Polylogarithms--P.4.json), `mathlib:TensorProduct.lift`, `mathlib:Finsupp.linearCombination`, [Polylogarithms:P.2/bloch-wigner-descent](../packets/Polylogarithms.json).

**Construction / proof plan:**

1. Apply δ₃⊗id to the zero boundary to get Σ q_z[z]₂⊗z⊗z=0 in B₂⊗U⊗U.
2. For each embedding apply the trilinear map L₂⊗log|·|⊗log|·|, obtaining exactly the vanishing correction.
3. Insert this identity in the canonical single-symbol period formula and use rational linearity.

**Acceptance:** The comparison scalar is the explicit nonzero rational 5/16; it is not imported as an unproved pointwise normalization.

**Sources:**

- [GR](#source-gr), §8.2, item 3, equations (191)–(192), pp. 77–78; Theorem 1.3(iv), p. 7. (191) shows that L\*₄ differs from (5/16)L₄ by (1/48)L₂(z)log²|z|, and (192) assigns L\*₄ to {x}₄, while Theorem 1.3(iv) is stated with the classical L₄; the vanishing of the correction on δ₄-cycles is the direct tensor consequence of δ₃[x]₃=[x]₂⊗x recorded here, which GR leaves implicit.

<a id="target-Z-5-normal-crossing-diagram"></a>

### Z.5/normal-crossing-diagram. The normal-crossing coefficient diagram

**Construction.** For a smooth complex variety X and a fixed finite simple-normal-crossing support D, form the finite coefficient diagram on the smooth strata Y of D needed by the Chern cocycle. A codimension-q stratum carries Γ-exp(k(Y),4−q), with weight-zero Q in internal degree zero; a term of internal degree j has total degree j+2q. Use the imported low-weight symbol differentials and uniformizer-first residues θ\_v(π∧u₁∧…)=ū₁∧…, θ\_v(all-unit wedge)=0; single Bloch symbols specialize to the residue class for valuation zero and to zero otherwise. Require every intermediate symbol and residue in the chosen finite diagram to have the specified SNC support. With these closure hypotheses the horizontal and signed residue arrows form a complex; the extra singular-stratum homotopy H of a general regular-variety construction is zero in this case. This target constructs only the coefficient diagram used below, not a Gersten resolution or a motivic quasi-isomorphism for all regular X.

**Direct inputs:** [Z.3/weight-four-cobracket](#target-Z-3-weight-four-cobracket), [Z.3/classical-subspace](#target-Z-3-classical-subspace), [Polylogarithms:P.4/explicit-weight-four-complex](../packets/Polylogarithms--P.4.json), [Polylogarithms:P.3/exterior-residue](../packets/Polylogarithms.json), [Polylogarithms:P.3/residues-and-transfers](../packets/Polylogarithms.json), [Polylogarithms:P.5/r-form-differential](../packets/Polylogarithms.json).

**Construction / proof plan:**

1. Use the existing explicit complexes for weights one through four.
2. On each incident smooth pair use the uniformizer-first residue and low-weight specialization formulas.
3. Check δ², each mixed square and cancellation of two successive residues in local normal-crossing coordinates; choose the total sign to make these identities hold.
4. Do not use the unresolved general finite-place transfers. The remaining SNC closure and sign certificate is gap RES.

**Uses:**

- Z.5/current-regulator-four and Z.5/chern-residue-extension: The strata shifts, uniformizer residues and admissibility restrictions type the residue corrections and current pushforwards.

**API:**

- `NormalCrossing4.stratum` (data): A smooth stratum contributes Γ-exp(k(Y),4−q) shifted by 2q.
- `NormalCrossing4.residue` (data): Residues have the uniformizer-first exterior formula and the stated Bloch specialization.
- `NormalCrossing4.total` (constructor): The finite diagram totalizes with the checked horizontal/residue signs.
- `NormalCrossing4.restrict` (functoriality): Restriction and the simplicial pullbacks used by the flag cocycle commute with its arrows after the admissibility checks.

**Checks:**

- `NormalCrossingDiagram.check1` (computation): θ\_v(π∧u∧w)=ū∧w̄, while θ\_v(u∧w)=0.
- `NormalCrossingDiagram.check2` (computation): A weight-three first term on a divisor has total degree 1+2=3.
- `NormalCrossingDiagram.check3` (degenerate): For two coordinate divisors the two iterated residues cancel with the total-complex sign; no H-correction is inserted on SNC support.

**Acceptance:** The codimension-four Q term has total degree eight, not four.

**Sources:**

- [GR](#source-gr), §8.1, Theorem 8.1 with (171), remarks 1–3 and the residue maps (172)–(177), pp. 72–75; Theorem 8.6, (201)–(206), pp. 80–81; §9.2, item 1, p. 88. Theorem 8.1 and (171) build Γ(X;4) from polylogarithmic complexes at points of all codimensions with the residue maps (172)–(177) and the homotopy H of Theorem 8.6; remark 1 notes that H vanishes on normal-crossing divisors, the only case used for BGL_n in §9.

<a id="target-Z-5-current-regulator-four"></a>

### Z.5/current-regulator-four. The weight-four current regulator

**Construction.** On the admissible normal-crossing diagram, the canonical period forms are locally integrable and define currents. For each codimension-q stratum take (2πi)^q times its pushed-forward period current. Together with the logarithmic holomorphic dlog component β on the exterior column these define a map r_D to the weight-four real Deligne cone. For a term of total degree k its ordinary current degree is k−1; the Deligne complex uses its corresponding shifted degree k. The current identity is dP−Pδ=2πiΣ\_Y i_{Y\*}P res_Y with the incidence signs fixed in normal-crossing-diagram. Nonproper simplicial BGL pieces require the logarithmic Deligne extension in request DELIGNE; the parent’s projective-only comparison is insufficient.

**Direct inputs:** [Z.5/canonical-period-four](#target-Z-5-canonical-period-four), [Z.5/normal-crossing-diagram](#target-Z-5-normal-crossing-diagram), [Polylogarithms:P.5/goncharov-deligne-complex](../packets/Polylogarithms.json), [Polylogarithms:P.5/goncharov-deligne-complex-comparison](../packets/Polylogarithms.json), [Polylogarithms:P.5/r-forms-and-distributions](../packets/Polylogarithms.json), `MotivicEtaleKTheory:M.8`.

**Construction / proof plan:**

1. Establish local integrability of each symbol period and its products by logarithmic forms.
2. Use Stokes on coordinate punctured disks and extend as currents; calibrate the residue sign on a uniformizer.
3. Add the exterior dlog component to the real-current component to obtain the Deligne cone map.
4. Use DELIGNE and RES to fix the nonproper comparison and all pushforward signs before calling this a regulator comparison.

**Uses:**

- Z.5/chern-regulator-normalization and Z.6/kappa-regulator: The Deligne cone map carries the residue-extended cocycle to the normalized nonzero Chern character and then to the regulator.

**API:**

- `Regulator4.current` (constructor): Locally integrable symbol forms define currents on each stratum.
- `Regulator4.pushforward` (data): A codimension-q contribution is multiplied by (2πi)^q and pushed forward.
- `Regulator4.chain` (compatibility): The differential identity includes both δ and residues.
- `Regulator4.deligne` (compatibility): The pair of β and real-current data is a map to the logarithmic Deligne cone.

**Checks:**

- `CurrentRegulatorFour.check1` (computation): A function on a divisor becomes a current of ordinary degree two, hence shifted Deligne degree three.
- `CurrentRegulatorFour.check2` (computation): A uniformizer has the 2πi divisor-current boundary in the chosen d^C convention.
- `CurrentRegulatorFour.check3` (non-example): Dropping β fails the holomorphic dlog term on the bottom exterior column.

**Acceptance:** A current on codimension q acquires degree 2q and twist (2πi)^q under pushforward.

**Sources:**

- [GR](#source-gr), §8.2, Proposition 8.4 and Lemma 8.5, pp. 78–79; Theorem 8.6(ii), (205), p. 80; §8.4, Theorem 8.11 with (216)–(218), Proposition 8.12 and Lemma 8.13, pp. 83–85. Proposition 8.4 shows the period forms are locally integrable and push forward from subvarieties as currents; Lemma 8.5, (205) and (219) compute the residual differentials with factors 2πi and (2πi)²; Theorem 8.11 assembles the real regulator map r_D:Γ(X;4)→R_D(X;4) from the current part α and the dlog part β of (217).

<a id="target-Z-5-scissors-group"></a>

### Z.5/scissors-group. Weight-three scissors configurations

**Definition.** A₃(F) is the rational scissors group of two ordered projective tetrahedra ⟨L;M⟩ in P³(F). Impose projective invariance, antisymmetry separately in each tetrahedron, vanishing when one tetrahedron lies in a hyperplane, the alternating additivity relation obtained from five vertices in either tetrahedron, and the dual additivity relation obtained by the corresponding projected configurations. Work on the source’s admissible configurations; a degenerate term is admitted only when the defining relation supplies its specialization. Its two reduced coproduct components land in A₂⊗U and U⊗A₂, with A₂ mapped to the imported B₂ by the dilogarithmic scissors map a₂.

**Direct inputs:** [Polylogarithms:P.3/projected-cross-ratio](../packets/Polylogarithms--P.3.json), `mathlib:Submodule.Quotient.mk`, `mathlib:Finsupp.linearCombination`, `K3BlochGroups:V.3`.

**Construction / proof plan:**

1. Construct the free module on admissible simplex pairs and quotient by both primal and dual relations.
2. Use common refinements to define the reduced coproduct; use the existing dilogarithmic scissors comparison rather than define B₂ again.
3. Request SCISSORS supplies the exact admissibility and A₂ normalization absent from the named stage’s coarse brief.

**Uses:**

- Z.5/scissors-trilogarithm-map and Z.5/grassmannian-symbol: Primal/dual relations and the two reduced coproduct components define the domain of a₃ and the Grassmannian coproduct expression.

**API:**

- `Scissors3.simplexPair` (constructor): An admissible pair of ordered tetrahedra gives a class.
- `Scissors3.additivity` (relation): The alternating five-vertex sum vanishes in each slot.
- `Scissors3.dualAdditivity` (relation): The projected dual relation also vanishes in each slot.
- `Scissors3.coproduct` (data): The two weight-splitting components use the specified a₂:A₂→B₂ normalization.

**Checks:**

- `ScissorsGroup.check1` (characterisation): Transposing two vertices in either tetrahedron negates its class.
- `ScissorsGroup.check2` (degenerate): A tetrahedron contained in a plane contributes zero.
- `ScissorsGroup.check3` (non-example): A quotient imposing primal additivity but omitting dual additivity does not support the stated coproduct.

**Acceptance:** Both tetrahedra have alternating orientations, and dual additivity is independently imposed.

**Sources:**

- [GR](#source-gr), §9.3, item 1, definition of A_n(F), p. 91. GR recalls the scissors congruence groups A_n(F), generated by pairs of generic simplices ⟨L;M⟩, with degeneration, projective invariance, antisymmetry, additivity and dual additivity, and their graded coalgebra structure.
- [G00](#source-g00), §3.3, the diagram of complexes and Theorem 3.2, PDF pp. 11–12. G00 uses the reduced coproduct of A₃ into A₂⊗A₁⊕A₁⊗A₂ and the map a₂∧a₁ to the weight-three complex.

<a id="target-Z-5-scissors-trilogarithm-map"></a>

### Z.5/scissors-trilogarithm-map. The scissors-to-trilogarithm map

**Construction.** Use Goncharov's map a₃:A₃(F)→B₃-exp(F) of G00 §3.3: a₃=(1/6)a′₃−(1/3)a″₃. Here a′₃ is the alternating double sum over omitted vertices (i,j) of r₃(l_i|L without l_i; M without m_j), where r₃=(1/15)Alt₆[T]₃ is one third of the class normalized by GR (167) (r₃=T₃/3 in Z.4's notation, GR (236)); a″₃ is the same alternating double sum of μ₃(l_i,m_j|L without l_i; M without m_j), with μ₃(x₁,x₂,x₃;y₁,y₂,y₃)=(1/2)Alt_{S₃×S₃}[r(x₁,y₂,x₂,y₁)]₃. In GR's normalization, with a′₃ built from the (167)-normalized class, the same map is (1/18)a′₃−(1/3)a″₃; the printed (1/2)a′₃−(1/3)a″₃ with footnote 24 is inconsistent with (236) and with G00's coproduct theorem (E06). All block alternations are signed sums, not averages. This map kills the scissors relations and intertwines the reduced coproduct with the explicit δ₃. Its collinear degeneration is r₃=−2μ₃ (G00 Lemma 3.7), equivalently GR Lemma 9.3.

**Direct inputs:** [Z.5/scissors-group](#target-Z-5-scissors-group), [Z.1/trilogarithm-reduction](#target-Z-1-trilogarithm-reduction), [Z.4/configuration-formulas](#target-Z-4-configuration-formulas), [Polylogarithms:P.3/trilogarithm-group](../packets/Polylogarithms.json), `K3BlochGroups:V.3`.

**Construction / proof plan:**

1. Build both finite alternating sums in the actual explicit B₃ group, with r₃=T₃/3.
2. Prove that a′₃ and a″₃ kill the degeneration, antisymmetry and dual additivity relations (G00 Proposition 3.4 and Lemma 3.5), and that only the combination (1/6)a′₃−(1/3)a″₃ kills additivity (Proposition 3.6 with Lemma 3.7).
3. Prove the coproduct compatibility δ₃a₃=(a₂∧a₁)∘ν (G00 Theorem 3.2), which fixes the ratio of the two coefficients.
4. Apply the collinear degeneration formula with its rational coefficient to the residues below.

**Uses:**

- Z.5/grassmannian-symbol and Z.5/chern-residue-extension: The normalized a₃ identifies the lift’s full cobracket; its collinear degeneration cancels the |123| residue.

**API:**

- `Scissors3.a3` (constructor): The two sums define the specified linear map.
- `Scissors3.a3_coproduct` (compatibility): δ₃a₃ is the reduced coproduct followed by a₂:A₂→B₂.
- `Scissors3.a3_degenerate` (simp): The collinear limit is the normalized μ₃ expression.
- `Scissors3.a3_map` (functoriality): The formula commutes with field embeddings and projective changes of coordinates.

**Checks:**

- `ScissorsTrilogarithmMap.check1` (non-example): With a′₃ built from r₃ the coefficients are (1/6) and −(1/3); taking (1/2) with the (167)-normalized class, as printed in GR, multiplies the a′₃ coefficient by 9 and the coproduct identity fails.
- `ScissorsTrilogarithmMap.check2` (characterisation): Permuting a tetrahedron by an odd permutation negates a₃.
- `ScissorsTrilogarithmMap.check3` (degenerate): When three projected points become collinear the special μ₃ limit, rather than an undefined generic cross-ratio, is used.

**Acceptance:** The ratio of the coefficients of a′₃ and a″₃ is (1/6):(−1/3) when a′₃ is built from r₃; the μ₃ factor 1/2 is retained.

**Sources:**

- [GR](#source-gr), §9.2, Lemma 9.3 with (235)–(236), pp. 89–90; §9.3, item 1 with footnotes 24–25, pp. 91–92. (236) states that one third of the (167)-normalized triple ratio is G00's r₃; §9.3(1) defines a₃ as (1/2)a′₃−(1/3)a″₃ with a′₃ built from the (167)-normalized class and claims in footnote 24 that this a′₃ is one third of G00's, which contradicts (236) by a factor 9 (E06).
- [G00](#source-g00), §3, item 2, definition (7) of r₃, PDF p. 9; §3, item 3, definitions of μ₃ and a₃, PDF p. 11; Theorem 3.2 and its proof, PDF pp. 12–14; Theorem 3.3, Proposition 3.4, Lemma 3.5, Proposition 3.6 and Lemma 3.7, PDF pp. 14–16. G00 defines r₃=(1/15)Alt₆ of the triple ratio, μ₃ and a₃=(1/6)a′₃−(1/3)a″₃, proves the coproduct compatibility (Theorem 3.2, whose proof shows that only the combination (1/2)a′₃−a″₃ works) and that a₃ is a homomorphism, with the collinear degeneration r₃=−2μ₃ of Lemma 3.7.

<a id="target-Z-5-grassmannian-symbol"></a>

### Z.5/grassmannian-symbol. The Grassmannian symbol and motivic lift

**Construction.** On the rational variety of generic eight-vector configurations in dimension four, the weight-four integrable symbol is I₄=Alt₈(|1234|⊗|2345|⊗|3456|⊗|4567|). Adjacent projections to Milnor K₂ vanish modulo constants; the symbol is projective and obeys both nine-term relations. The required refinement is an F-defined, tangentially regularized motivic iterated-integral lift whose cobracket equals the scissors expression Δ=(a₃∧id+id∧a₃+id) r_Δ of GR §9.3, hence equals δG₄. Equality of symbols alone does not determine this lift, its constant extension or its descent to G₄. This refinement is gap LIFT.

**Direct inputs:** [Z.4/grassmannian-group](#target-Z-4-grassmannian-group), [Z.5/scissors-trilogarithm-map](#target-Z-5-scissors-trilogarithm-map), [Z.3/correlator-realization](#target-Z-3-correlator-realization), [Z.3/correlator-depth-reduction](#target-Z-3-correlator-depth-reduction), [Z.4/configuration-identities](#target-Z-4-configuration-identities), [MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction](../packets/MotivesAndAlgebraicCycles.json), `PeriodsAndSpecialValues:PS.9`.

**Construction / proof plan:**

1. Prove integrability and both configuration relations by G09’s determinant/coproduct identities.
2. For a generic matrix move first-row entries to zero one at a time; each determinant is linear along each segment, reducing integrals to punctured P¹.
3. Supply tangential regularization at singular endpoints, field-of-definition control and constant terms; G09’s theorem on Hodge–Tate geometric variations by itself does not establish all these motivic assertions over F.
4. Compare the full cobracket with the explicit scissors expression and apply weight-four correlator depth reduction.

**Uses:**

- Z.5/generic-chern-cocycle: The regularized F-valued lift supplies the actual motivic top term and its full cobracket; an integrable tensor symbol alone cannot do this.

**API:**

- `Grassmannian4.symbol` (constructor): The unnormalized alternating Plücker tensor defines I₄.
- `Grassmannian4.integrable` (characterisation): Every adjacent K₂ projection of the reduced symbol is zero.
- `Grassmannian4.regularizedLift` (constructor): An F-defined regularized lift with the specified cobracket is the required target, subject to LIFT.
- `Grassmannian4.liftBoundary` (compatibility): The full motivic cobracket, including Λ²B₂, equals δG₄ after descent.

**Checks:**

- `GrassmannianSymbol.check1` (characterisation): Odd permutations negate I₄.
- `GrassmannianSymbol.check2` (compatibility): Rescaling one vector adds only constant-symbol terms and leaves the reduced projective symbol unchanged.
- `GrassmannianSymbol.check3` (non-example): Two periods with the same reduced symbol can differ by a constant extension; equality of symbols is not a test for equality of the desired motivic lifts.

**Acceptance:** Only after LIFT is proved may the symbol-level object be used as a combinatorial L₄-valued configuration map.

**Sources:**

- [GR](#source-gr), §9.3, item 2, pp. 92–93. §9.3(2) restricts the Grassmannian tetralogarithm, whose symbol is a rational multiple of Alt₈(|1234|⊗|2345|⊗|3456|⊗|4567|), to a path of eight matrix-entry segments on which each factor is linear, expresses it through framed subquotients of the motivic fundamental group of a punctured line over F and applies Corollary 2.10 (gap E03).
- [G09](#source-g09), §3.3, Theorem 3.4 and the warning after it, p. 18; §4.1, Definition 4.1, p. 22, and Theorems 4.2–4.3, pp. 23–24. Definition 4.1 and Theorems 4.2–4.3 give the Grassmannian polylogarithm symbol, its integrability and its relations; Theorem 3.4 makes an integrable symbol on a rational variety the period of a framed Hodge–Tate variation of geometric origin, with the warning that this assignment does not commute with the coproduct.

<a id="target-Z-5-generic-chern-cocycle"></a>

### Z.5/generic-chern-cocycle. The generic polylogarithmic Chern cocycle

**Construction.** Compose flag-comparison, duality and the configuration map with the regularized motivic lift, and use correlator depth reduction to obtain an L₄-valued weight-four cocycle on the generic simplicial flag space for GL_N, N≥4. Remove its Λ²B₂ component by an explicitly scaled double-symbol cochain h: the projected component in R₇³ has coefficient −3/28, and h uses that coefficient on the matching D₃₁ pair so δ₂₂h is exactly the unwanted wedge. Subtract its coboundary and use the extension theorem to factor the degree-one term through B₄-comb. The result has values in Γ-exp(F,4), not merely in the larger Chevalley–Eilenberg complex. GR's printed correcting element Alt₈{r(3,4|2,5,6,7),r(6,7|1,3,4,5)}₃,₁ omits this coefficient (E07).

**Direct inputs:** [Z.4/flag-comparison](#target-Z-4-flag-comparison), [Z.4/flag-resolution](#target-Z-4-flag-resolution), [Z.4/configuration-identities](#target-Z-4-configuration-identities), [Z.5/grassmannian-symbol](#target-Z-5-grassmannian-symbol), [Z.3/freeness-extension-proof](#target-Z-3-freeness-extension-proof), [Z.3/weight-four-cobracket](#target-Z-3-weight-four-cobracket), [Z.3/classical-subspace](#target-Z-3-classical-subspace).

**Construction / proof plan:**

1. First form the cocycle in the larger weight-four coalgebra complex.
2. Use exactness to identify the Λ²B₂ component and choose h on the actual double generators with coefficient −3/28.
3. Subtract the coboundary, checking signs and normalizations before claiming cancellation.
4. The surviving term lies in B₄-comb and the complex agrees with the supplier’s Γ-exp.

**Uses:**

- Z.5/chern-residue-extension and Z.6/k-theory-comparison: Subtracting the scaled double-symbol coboundary puts the flag cocycle in the explicit complex before its residue extension and homology evaluation.

**API:**

- `Chern4.generic` (constructor): The flag cocycle defines the stated larger-complex cochain.
- `Chern4.correction` (data): The double-symbol cochain h has the coefficient needed to cancel the Λ²B₂ component.
- `Chern4.factor` (compatibility): The corrected first term factors through the single-symbol subspace by exactness.
- `Chern4.generic_stabilize` (functoriality): Stabilization and field embeddings commute with the cocycle up to the specified comparison homotopies.

**Checks:**

- `GenericChernCocycle.check1` (computation): Applying δ₂₂ to the correcting D₃₁ term gives exactly the corresponding B₂ wedge.
- `GenericChernCocycle.check2` (non-example): Replacing the correcting coefficient −3/28 by 1 leaves a nonzero formal wedge coefficient.
- `GenericChernCocycle.check3` (compatibility): After correction the Λ²B₂ component is zero and the first term belongs to B₄-comb.

**Acceptance:** Cancel a wedge with its actual coefficient; an unscaled double generator does not cancel −3/28 of that wedge.

**Sources:**

- [GR](#source-gr), §9.1, items 2–3, (224)–(228), pp. 86–87; §9.3, item 2 with Lemma 9.6, p. 93. §9.1 explains how the map from decorated flags to the complex (225) yields the generic cocycle and, through Theorems 1.13 and 1.14, a cocycle with values in the polylogarithmic complex; §9.3(2) removes the Λ²B₂ component by subtracting the cobracket of an alternated {·,·}₃,₁ element and invokes Theorem 1.14(c); Lemma 9.6 shows the correction has zero residues.

<a id="target-Z-5-chern-residue-extension"></a>

### Z.5/chern-residue-extension. Extending the Chern cocycle across residues

**Theorem.** The generic Chern cocycle extends over the simplicial BGL_N coefficient diagram by successive smooth SNC residues. The R₇³ residue on |123|=0 vanishes using collinear degeneration. The R₆² residue on |12|=0 is the alternating B₂⊗U expression in GR (231)–(232), pulled back from five-vector data, and its next residue is supplied by four-vector cross-ratios. In the Milnor column R₅¹, successive residual lifts X∈Λ³U, Y∈Λ²U and Z∈U on codimensions one, two and three have final divisor zero. The correction coboundary has zero residues by Lemma 9.6. Every used intermediate stratum must be shown smooth with SNC support and compatible simplicial pullbacks (RES); no general singular transfer theorem is silently used.

**Direct inputs:** [Z.5/generic-chern-cocycle](#target-Z-5-generic-chern-cocycle), [Z.5/normal-crossing-diagram](#target-Z-5-normal-crossing-diagram), [Z.5/current-regulator-four](#target-Z-5-current-regulator-four), [Z.5/scissors-trilogarithm-map](#target-Z-5-scissors-trilogarithm-map), [Z.4/configuration-formulas](#target-Z-4-configuration-formulas), [K3BlochGroups:V.3/pre-bloch-group](../packets/K3BlochGroups.json).

**Construction / proof plan:**

1. Compute the R₇³ residue by its normalized scissors/trilogarithm degeneration.
2. Compute R₆² residue at l₂=L l₁, then identify its pullback extension and the next residue.
3. Use G93’s universal flag-residue construction for X,Y,Z and its alternating simplicial boundary relation.
4. Check Lemma 9.6 for the scaled correcting coboundary, using the specializations of D₂₁ at zero, one and infinity.
5. Verify all SNC closure and signs in RES before totalizing.

**Acceptance:** The extended cocycle has total degree eight, including the codimension-three U-term in degree seven and its degree-eight divisor condition.

**Sources:**

- [GR](#source-gr), §9.2, items 1–4, Lemmas 9.2–9.3 and Corollary 9.4, pp. 88–90; §9.3, Lemma 9.6, p. 93. §9.2 computes the residues of the generic cocycle: the Milnor column through the residual lifts X, Y, Z of G93, the B₂⊗F× column on |12|=0 (Lemma 9.2, (232)), lifted from five-vector data, and the B₃⊗F× column on |123|=0, which vanishes by Lemma 9.3 (Corollary 9.4); item 4 extends the cocycle to BGL_n.
- [G93](#source-g93), §4.3, Theorem 4.5 and (4.10)–(4.11), p. 190. Theorem 4.5 states the boundary relation for the canonical Milnor K-theory elements attached to the degeneracy cycles of generic sections of affine flag bundles.

<a id="target-Z-5-chern-regulator-normalization"></a>

### Z.5/chern-regulator-normalization. The nonzero Chern regulator class

**Theorem.** Applying current-regulator-four to the extended cocycle gives a nonzero rational multiple of the suspended universal fourth Chern character in real Deligne/continuous group cohomology. The last logarithmic current constructed from the Milnor-column residues is the transgression of the ordinary fourth Chern class, so is nonzero by G93 Theorem 4.6. Use the supplier’s ch₄=(2πi)^4 pr₄/4! before suspension and ch₄=−c₄/6 on positive K-degrees to fix the rational normalization. Only a nonzero rational multiple is needed; do not infer an integral generator from a rational nonvanishing theorem.

**Direct inputs:** [Z.5/chern-residue-extension](#target-Z-5-chern-residue-extension), [Z.5/current-regulator-four](#target-Z-5-current-regulator-four), [MotivicEtaleKTheory:M.8/motivic-chern-character](../packets/MotivicEtaleKTheory--M.5d.json), [MotivicEtaleKTheory:M.8/number-field-deligne-normalization](../packets/MotivicEtaleKTheory--M.5d.json), `MotivicEtaleKTheory:M.8`.

**Construction / proof plan:**

1. Identify the last current as the Chern transgression using the universal vector-bundle flag construction.
2. Apply G93’s nonvanishing theorem to exclude the zero comparison scalar.
3. Compare the rest of the cocycle by the residue/current chain identities.
4. Use request DELIGNE to identify this class with the normalized universal higher regulator, keeping the suspension and rational Chern-character factor.

**Acceptance:** A chain map without this nonvanishing comparison does not suffice to prove the Zagier determinant theorem.

**Sources:**

- [GR](#source-gr), §9.2, Theorem 9.1, p. 87, and item 1, p. 88; §9.3, items 3–5, p. 94. Theorem 9.1 asserts that the cocycle represents the universal motivic Chern class and that its Deligne realization gives Beilinson's weight-four regulator; §9.2(1) explains that the successive Milnor-column residues end in a cocycle representing the generator of H⁷(GL_n(C),Z(4)).
- [G93](#source-g93), §4.4, Theorem 4.6 and (4.13)–(4.14), p. 191. Theorem 4.6 shows that the current Σ\_j dlog f_j represents a nonzero class in W₀H^{2n−1}(GL_m(C),Q(n)), the transgression of the Chern class.

## Z.6. The explicit weight-four Zagier theorem

Produce κ:K₇(F)Q→ker δ₄-exp and prove its nonzero regulator comparison; separately prove rational regulator image containment for every explicit cycle. Discharge the parent’s determinant interface, including the empty determinant, and state exactly the conditional boundary for the inductive presentation and higher weights.

**Layer inputs:** `ZagierConjecturePolylogarithms:Z.5`, `GeneralAlgebraicKTheory:K.2`, `BorelRegulators:R.3`, `BorelRegulators:R.4`, `BorelRegulators:R.5`, `BorelRegulators:R.7`, `Polylogarithms:P.4`, `ZagierConjecturePolylogarithms:Z.4`, `MotivicEtaleKTheory:M.8`, `ZagierConjecturePolylogarithms:Z.3`, `MotivesAndAlgebraicCycles:MC.4`, `MotivesAndAlgebraicCycles:MC.6`, `HodgeStructuresPartII:H.2`.

**Planets:** K-theory comparison; Weight-four regulator comparison; Explicit-cycle regulator image; Zagier’s weight-four theorem.

**Coverage:** planned. Discharge SCALE and the inherited proof dependencies; retain IND as the precise boundary of the stronger every-inductive-family formulation.

<a id="target-Z-6-k-theory-comparison"></a>

### Z.6/k-theory-comparison. From K-theory to the explicit complex

**Construction.** For every number field F and i=1,2,3,4, construct natural maps K_{8−i}(F)⊗Q→H^iΓ-exp(F,4) from the stabilized corrected flag cocycle and rational primitive Hurewicz. For i=1 this is κ:K₇(F)Q→ker δ₄-exp, since the field complex starts in degree one. The maps vanish on the rank-at-most-three homological filtration, proved by the GL₃-invariant standard (N−3)-flag section. This does not assert that a rank filtration equals an Adams filtration, that κ is an isomorphism, or that all higher-K groups in the other degrees are generated by correlators.

**Direct inputs:** [Z.4/flag-resolution](#target-Z-4-flag-resolution), [Z.5/generic-chern-cocycle](#target-Z-5-generic-chern-cocycle), [Z.5/chern-residue-extension](#target-Z-5-chern-residue-extension), [Z.5/chern-regulator-normalization](#target-Z-5-chern-regulator-normalization), `GeneralAlgebraicKTheory:K.2`, [BorelRegulators:R.3/cartan-serre-application](../packets/BorelRegulators.json), [Polylogarithms:P.4/explicit-weight-four-complex](../packets/Polylogarithms--P.4.json).

**Construction / proof plan:**

1. Pass the natural cohomological flag cocycle through projective-resolution comparison and stabilize.
2. Restrict stable group homology to rational primitive Hurewicz images from the plus construction (request HOM).
3. Use the fixed complementary flag section to make the restriction to GL₃ homotopic to a map through the augmentation, hence zero in the positive homological degrees concerned.
4. For i=1 identify H¹ with the kernel by the supplier’s degree convention.

**Uses:**

- Z.6/kappa-regulator and Z.6/explicit-zagier-four: The natural degree-one map provides the K₇-generated cycles whose period columns have full Borel rank.

**API:**

- `Zagier4.kappa` (constructor): The i=1 map has target the actual kernel of δ₄-exp.
- `Zagier4.comparison` (data): The four K-to-cohomology maps carry their stated shifts.
- `Zagier4.natural` (functoriality): Embeddings of number fields commute with the maps.
- `Zagier4.rankThree` (relation): The maps vanish on the image of the rank-at-most-three group homology filtration.

**Checks:**

- `KTheoryComparison.check1` (computation): K₇ maps to H¹ and K₄ maps to H⁴; reversing the cohomological degree fails this test.
- `KTheoryComparison.check2` (degenerate): δ₄-exp(κ(k))=0 for every k.
- `KTheoryComparison.check3` (non-example): No inverse κ⁻¹ is exported and no identification of the homological rank filtration with Adams weight is assumed.

**Acceptance:** For the weight-four zeta theorem only the i=1 map and its period comparison are required.

**Sources:**

- [GR](#source-gr), Theorem 1.3(i), p. 6; §9.3, item 3 with (240), p. 94. Theorem 1.3(i) asserts canonical maps K_{8−i}(F)\_Q→H^iB(F;4), i=1,…,4, vanishing on the rank-three filtration; §9.3(3) proves the vanishing with a GL₃-invariant section (240) of the decorated-flag resolution.

<a id="target-Z-6-kappa-regulator"></a>

### Z.6/kappa-regulator. The regulator of κ

**Theorem.** For a number field F and a selection of one embedding σ\_j from each complex pair, the vector (Σ\_z q_z L₄(σ\_jz))\_j associated to κ(k)=Σ\_z q_z[z]₄ is λπ³ r_Bo,4(k), with λ∈Q× independent of k and F under the fixed universal normalizations. Here r_Bo uses the real-valued Burgos coordinate of the parent; its R(3) Tate coordinate, the normalized Deligne character and the factor-two Borel/Beilinson comparison must all be converted explicitly. In particular this vector has real rank r₂. This statement discharges piece (i) of the parent’s weight-four-regulator-input; it does not by itself prove piece (ii).

**Direct inputs:** [Z.6/k-theory-comparison](#target-Z-6-k-theory-comparison), [Z.5/chern-regulator-normalization](#target-Z-5-chern-regulator-normalization), [Z.5/cycle-period-calibration](#target-Z-5-cycle-period-calibration), [BorelRegulators:R.7/regulator-factor-two](../packets/BorelRegulators.json), [BorelRegulators:R.4/regulator-real-isomorphism](../packets/BorelRegulators.json), [MotivicEtaleKTheory:M.8/number-field-deligne-normalization](../packets/MotivicEtaleKTheory--M.5d.json), `BorelRegulators:R.7`, `MotivicEtaleKTheory:M.8`.

**Construction / proof plan:**

1. Evaluate the current Chern cocycle on rational primitive K₇ and apply its nonzero universal comparison.
2. Use the exact 5/16 conversion on cycles.
3. Convert the Tate coordinate and use r_Bo=2r_Be in the same coordinate; request SCALE fixes the remaining π³ real-coordinate conversion.
4. Use Borel’s real regulator isomorphism to obtain rank r₂.

**Uses:**

- Polylogarithms:P.4/weight-four-regulator-input: This theorem is piece (i) of the parent's statement-only interface; the interface is discharged here, not used as a premise.

**Acceptance:** The comparison scalar is nonzero; a period map constructed without nonzero Chern normalization is insufficient.

**Sources:**

- [GR](#source-gr), Theorem 1.3(ii) and (iv), pp. 6–7; Theorem 9.1, p. 87; §9.3, items 3–4, p. 94. Theorem 1.3(iv) states that K₇(C)\_Q→H¹B(C;4)→R, the last map given by L₄, is a nonzero rational multiple of the Borel regulator, deduced in §9.3 from Theorem 9.1; the 5/16 cycle calibration and the Tate/Borel coordinate conversions are explicit adapters added here.

<a id="target-Z-6-all-cycle-regulator-image"></a>

### Z.6/all-cycle-regulator-image. The periods of every explicit cycle

**Theorem.** Every y∈ker δ₄-exp(F) has its selected-embedding L₄-period vector in the Q-linear image π³ r_Bo,4(K₇(F)Q). Indeed correlator-realization sends y into the primitive weight-four part of the mixed Tate Lie coalgebra; the canonical primitive identification is Ext¹\_MT(F)(Q(0),Q(4))≃K₇(F)Q. Hodge realization, the same period conversion and the regulator comparison give the asserted containment. The vector is allowed to be zero. This supplies piece (ii) of weight-four-regulator-input without asserting κ is surjective or that B₄-comb is inductive B₄.

**Direct inputs:** [Z.3/correlator-realization](#target-Z-3-correlator-realization), [Z.5/cycle-period-calibration](#target-Z-5-cycle-period-calibration), [Z.3/classical-subspace](#target-Z-3-classical-subspace), `MotivesAndAlgebraicCycles:MC.4`, [MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction](../packets/MotivesAndAlgebraicCycles.json), [BorelRegulators:R.7/regulator-factor-two](../packets/BorelRegulators.json), [MotivicEtaleKTheory:M.8/number-field-deligne-normalization](../packets/MotivicEtaleKTheory--M.5d.json), `BorelRegulators:R.7`, `HodgeStructuresPartII:H.2`.

**Construction / proof plan:**

1. Use coalgebra functoriality to show the realization of a full δ₄-exp cycle has zero cobracket, including its (2,2) component.
2. Invoke MT-1 to identify this primitive with a rational K₇ class; no surjectivity of the combinatorial realization is needed.
3. Apply the canonical Hodge period and its K-theory compatibility, then cycle-period-calibration and SCALE.
4. Since multiplication by any nonzero rational leaves a Q-linear image unchanged, the scalar choices do not weaken containment.

**Uses:**

- Polylogarithms:P.4/weight-four-regulator-input: This theorem is piece (ii) of the parent's statement-only interface; the interface is discharged here, not used as a premise.

**Acceptance:** This implication is logically separate from the construction of κ.

**Sources:**

- [GR](#source-gr), §1.2, item 5, Theorem 1.13 with (40)–(41), pp. 15–16; §8.2, (191)–(192), pp. 77–78; §1.5, item 2.1, p. 25. Theorem 1.13 maps the combinatorial coalgebra to the motivic one, (192) gives the canonical period of single symbols, and §1.5 notes that K₇(F)\_Q is realized in the motivic fundamental group of the punctured line; GR does not spell out the every-cycle argument, which this target supplies.
- [G08](#source-g08), §1.3, pp. 7–8. §1.3 identifies the kernel of the cobracket in weight n of the motivic Lie coalgebra of a number field with K_{2n−1}(F)⊗Q and recalls Borel's injective regulator.

<a id="target-Z-6-explicit-zagier-four"></a>

### Z.6/explicit-zagier-four. The explicit weight-four Zagier theorem

**Theorem.** Let F have r₁ real embeddings, r₂ complex pairs, degree N=r₁+2r₂ and absolute discriminant |D_F|. For every r₂-tuple y₁,…,y_{r₂} of explicit δ₄-cycles, put M_{ij}=L₄(σ\_i(y_j)). Then Z₄(y)=π^{4(r₁+r₂)}|D_F|^(−1/2) det M, the parent's zagier-determinant, belongs to Q·ζ\_F(4), possibly zero. Some tuple has nonzero determinant and hence Z₄(y)∈Q×ζ\_F(4). If r₂>0, rational rescaling of one column gives a tuple with Z₄(y)=ζ\_F(4). If r₂=0 the empty determinant is 1 and the assertion is the nonzero rational-ratio identity π^{4r₁}/√|D_F|∈Q×ζ\_F(4); no empty column can be rescaled. The parent's totally-real node supplies this case. This discharges the parent's weight-four interface for explicit cycles rather than introducing a second determinant definition.

**Direct inputs:** [Z.6/kappa-regulator](#target-Z-6-kappa-regulator), [Z.6/all-cycle-regulator-image](#target-Z-6-all-cycle-regulator-image), [Polylogarithms:P.4/weight-four-totally-real](../packets/Polylogarithms--P.4.json), [BorelRegulators:R.5/borel-zeta-proportionality](../packets/BorelRegulators.json), `mathlib:Matrix.det`, [Polylogarithms:P.4/zagier-determinant](../packets/Polylogarithms.json), [BorelRegulators:R.4/regulator-lattice](../packets/BorelRegulators.json), [BorelRegulators:R.4/regulator-real-isomorphism](../packets/BorelRegulators.json), [BorelRegulators:R.5/leading-term-functional-equation](../packets/BorelRegulators.json).

**Construction / proof plan:**

1. Use κ and Borel's real-regulator isomorphism to choose r₂ rational K₇ vectors whose period determinant is nonzero.
2. For arbitrary explicit cycles use all-cycle-regulator-image to express their period vectors by a rational matrix in that regulator space.
3. With d=r₂, Borel's covolume theorem and the leading-term functional equation give det r_Bo∈Q×√|D_F| π^{d−4N}ζ\_F(4) on a rational basis; each column contributes π³, giving total exponent 4d−4N=−4(r₁+r₂).
4. Combine by det_mul for the rational change of basis, using the empty determinant convention separately at r₂=0. The parent's period-calibration is not used: it assumes the period map is an isomorphism onto K₇, which κ need not be.

**Uses:**

- Polylogarithms:P.4/weight-four-theorem and Polylogarithms:P.4/weight-four-determinant-lifting: The parent's weight-four statement and its transfer to inductive cycles take this explicit-cycle theorem as their input.

**Acceptance:** For F=Q the ratio π⁴/ζ\_Q(4)=90, so an exact equality with the unrescaled empty determinant would be false.

**Sources:**

- [GR](#source-gr), §1.1, item 6, Theorem 1.2, p. 5; §9.3, item 4, p. 94. Theorem 1.2 states the existence of r₂ cycles with ζ\_F(4)=π^{4(r₁+r₂)}|d_F|^{−1/2}det(L₄(σ\_{r₁+i}(y_j))) and the rationality of this expression for every family; §9.3(4) derives it from Theorem 1.3 and Borel's theorem. The case r₂=0 needs the rational-ratio form (parent source issue).

<a id="target-Z-6-presentation-and-frontier"></a>

### Z.6/presentation-and-frontier. Presentation comparison and the frontier

**Comparison.** The explicit cycle families just constructed push forward to the parent’s inductive complex and retain their periods, so the existence assertion transfers. For an arbitrary inductive δ₄-cycle z, its lift to an explicit cycle is obstructed by the parent’s class ω(z)∈ker(q)/δ\_exp(ker p), with p:B₄-comb→B₄-ind and q:B₃-exp⊗U→B₃-ind⊗U. Vanishing of ω, or a separately proved direct inductive period-containment theorem, is required for the every-inductive-family assertion. Neither is proved here. The weights n≥5 general comparison and Zagier statements are the parent’s conjectural frontier, not consequences of the weight-four extension theorem.

**Direct inputs:** [Z.6/explicit-zagier-four](#target-Z-6-explicit-zagier-four), [Polylogarithms:P.4/presentation-chain-map](../packets/Polylogarithms--P.4.json), [Polylogarithms:P.4/cycle-obstruction](../packets/Polylogarithms--P.4.json), [Polylogarithms:P.4/weight-four-determinant-lifting](../packets/Polylogarithms--P.4.json), [Polylogarithms:P.4/goncharov-comparison-conjecture](../packets/Polylogarithms.json), `Polylogarithms:P.4`.

**Construction / proof plan:**

1. Push the actual explicit cycles along the supplier’s chain map.
2. For a general inductive cycle apply the existing obstruction formula; do not infer a cycle lift from a surjection of groups.
3. Keep the higher-weight comparison and universality conjectures in the imported frontier.

**Acceptance:** Existence transfers without ω=0; the assertion for every inductive family remains gap IND.

**Sources:**

- [GR](#source-gr), §1.1, items 4–6, pp. 4–7; §1.2, pp. 9 and 12; Definition 1.11, p. 12. GR distinguishes the inductive groups of §1.1 from the explicit groups of §1.2 and conjectures that the maps from the explicit B₃ and B₄ to the inductive groups are isomorphisms (pp. 9, 12); the transfer of the explicit theorem to inductive cycles and its obstruction are the parent's P.4 analysis.

## Supplier requests

These are requests inside the planning packet, not claims that the supplier stages already prove the new interfaces.

### P3-SPEC: Polylogarithms:P.3

Specialization closure of the explicit trilogarithm relations: for every one-parameter family over F(t) of admissible parameters of P.3/coordinate-relation (equivalently every curve in M_{0,6} as in GR (26)), the specialization at t=0 of the coordinate 22-term relation, with single symbols specialized by the valuation-zero rule ([u]₃↦[u(0)]₃ for units, 0 otherwise), lies in R₃(F). This includes the degenerate parameters that P.3/coordinate-relation leaves as statements to prove. It is the step of the isomorphism B₃≅L₃ that GR attributes to Gon95 §5 (GR p. 12; Lemma 5.2(ii), p. 54).

**Needed by:** [Z.1/trilogarithm-reduction](#target-Z-1-trilogarithm-reduction).

### MT-1: MotivesAndAlgebraicCycles:MC.4

Reuse PS.9/mixed-tate-z for its existing Q mixed-Tate heart and MT(Z) specialization; request only its extension to arbitrary number fields and the following primitive comparison. Extend geometric motives by the proven mixed Tate category MT(F) for number fields, with canonical graded fiber functor, Ext¹(Q0,Qn)=K_{2n−1}(F)Q for n≥2 and vanishing Ext² in the Tate subcategory, hence primitive weight-n Lie coalgebra identification. Include compatible Hodge realization and its normalized Deligne regulator on primitive classes. The rational K-rank statements used for constant extensions over Q must be explicit. This is a number-field mixed Tate theorem, not a t-structure on all mixed motives. Source: G08 §1.3, pp. 7–9 and its Deligne–Goncharov supplier.

**Needed by:** [Z.3/motivic-correlator](#target-Z-3-motivic-correlator), [Z.3/correlator-realization](#target-Z-3-correlator-realization), [Z.6/all-cycle-regulator-image](#target-Z-6-all-cycle-regulator-image), [Z.3/correlator-basepoint-change](#target-Z-3-correlator-basepoint-change).

### MT-2: PeriodsAndSpecialValues:PS.9

PS.9 already constructs the source-specific mixed-Tate category and the motivic fundamental group of P¹ minus {0,1,∞} over Q, with tangential base points and the Deligne–Goncharov bar construction (PS.9/motivic-path-torsor). Request its extension in the same direction: for a number field F and an arbitrary finite set S of F-rational points of P¹, the motivic unipotent fundamental groupoid of P¹−S in MT(F) with tangential fibre functors at points of S, path torsors, Betti/bar/Hodge comparison, the free graded Lie algebra on the puncture loops with Σ\_s X_s=0, and its special-derivation action; include F-defined tangential regularization at the endpoints of the rational matrix segments of Z.5/grassmannian-symbol. The de Rham and étale unipotent groups and tensor paths of AnabelianGeometryAndNonabelianChabauty:NC.2 are cited as realizations; NC.2 is a TauCetiRoadmap pull request and is not asked to change. Source: GR §2, items 2–3, pp. 26–28; G08 §§1.5–1.6, pp. 10–11.

**Needed by:** [Z.3/motivic-correlator](#target-Z-3-motivic-correlator), [Z.5/grassmannian-symbol](#target-Z-5-grassmannian-symbol).

### HODGE: HodgeStructuresPartII:H.2

Add the framed Hodge–Tate Hopf/Lie coalgebra, its canonical real period DGA map with R(n−1), d^C=∂−∂bar conventions, its compatibility with admissible tangential degenerations, and the constant-extension rigidity used for Q-relations. Generic mixed variations and canonical extensions are already supplied; this requests their framed-period specialization. Source: GR Theorem 8.3, pp. 76–78, and Lemma 2.7, pp. 32–33; M20 Theorem 11 and Lemma 29.

**Needed by:** [Z.3/hodge-correlator](#target-Z-3-hodge-correlator), [Z.3/correlator-collision](#target-Z-3-correlator-collision), [Z.5/canonical-period-four](#target-Z-5-canonical-period-four), [Z.3/correlator-realization](#target-Z-3-correlator-realization), [Z.6/all-cycle-regulator-image](#target-Z-6-all-cycle-regulator-image).

### DELIGNE: MotivicEtaleKTheory:M.8

Extend the existing Deligne normalization from smooth projective varieties to the logarithmic real-current Deligne cone on smooth nonproper simplicial schemes BGL_N and admissible SNC strata. Prove pullback/pushforward, suspension and higher Chern-character compatibility so the constructed universal class gives the existing number-field regulator. Do not identify Γ-exp with motivic cohomology by a conjectural quasi-isomorphism. Source: GR §§8.3–9.2, pp. 80–90.

**Needed by:** [Z.5/current-regulator-four](#target-Z-5-current-regulator-four), [Z.5/chern-regulator-normalization](#target-Z-5-chern-regulator-normalization), [Z.6/kappa-regulator](#target-Z-6-kappa-regulator).

### SCISSORS: K3BlochGroups:V.3

Supply the exact admissible two-triangle scissors group A₂(F), its a₂:A₂→B₂-exp map and reduced coproduct to U∧U, with the normalization used by G00 Theorem 3.2 and GR §9.3. The packet already supplies rational B₂; no new B₂ presentation is requested. This is an extension in its scissors-congruence direction.

**Needed by:** [Z.5/scissors-group](#target-Z-5-scissors-group), [Z.5/scissors-trilogarithm-map](#target-Z-5-scissors-trilogarithm-map).

### HOM: GeneralAlgebraicKTheory:K.2

Supply rational primitive Hurewicz K_m(F)Q→H_m(GL(F),Q) from the plus construction, together with projective-resolution comparison to an exact augmented generic-flag complex, homotopy uniqueness and stabilization. Acyclic target modules need not be free. Source: GR §9.3(3), p. 94; P.3 stabilized-configuration-comparison supplies only the weight-three instance.

**Needed by:** [Z.4/flag-resolution](#target-Z-4-flag-resolution), [Z.6/k-theory-comparison](#target-Z-6-k-theory-comparison).

### SCALE: BorelRegulators:R.7

Export the explicit map between its R(3) Tate-valued regulator coordinate and the real-valued L₄ coordinate used by P.4: the conversion has π³ times a nonzero rational scalar. Combine the existing factor-two comparison with M.8’s ch₄ and the canonical period convention; check that the same conversion applies to all primitive mixed Tate cycles. This requests a coordinate adapter, not a new proof of Bo=2Be.

**Needed by:** [Z.6/kappa-regulator](#target-Z-6-kappa-regulator), [Z.6/all-cycle-regulator-image](#target-Z-6-all-cycle-regulator-image).

### IND: Polylogarithms:P.4

Resolve the gap recorded at Polylogarithms:P.4/cycle-obstruction and P.4/weight-four-determinant-lifting for every inductive δ₄-cycle: either prove ω=0, or prove directly that its period vector lies in the rational K₇ regulator image. Existence of explicit cycles and surjectivity on presentations alone are insufficient. This is the parent's own unresolved boundary, not a prerequisite for the explicit theorem.

**Needed by:** [Z.6/presentation-and-frontier](#target-Z-6-presentation-and-frontier).

## Recorded gaps and closure conditions

All six layers are planned. None is closed: the following leaves must be discharged. IND is a boundary of the stronger formulation and does not block the explicit-cycle theorem.

### MT: Mixed Tate and framed-period suppliers

Requests MT-1, MT-2 and HODGE are precise new extensions; their existing Tannakian, geometric-motive and mixed-variation nodes do not provide these carriers or theorems. Source routes are recorded, but the Deligne–Goncharov construction and canonical-period proof have not been decomposed here. Realization and primitive-image conclusions remain contingent on these requests. Existing PS.9 mixed-Tate-Q/MT(Z) and three-puncture path constructions and NC.2 realization groups are imported; only the field/puncture/tangent extension is requested. The reduced cyclic coalgebra and its special-derivation comparison are linear algebra and are not part of this gap (E04 fixes their scope).

**Affected targets:** [Z.3/motivic-correlator](#target-Z-3-motivic-correlator), [Z.3/hodge-correlator](#target-Z-3-hodge-correlator), [Z.3/correlator-realization](#target-Z-3-correlator-realization), [Z.5/canonical-period-four](#target-Z-5-canonical-period-four), [Z.6/all-cycle-regulator-image](#target-Z-6-all-cycle-regulator-image), [Z.3/correlator-basepoint-change](#target-Z-3-correlator-basepoint-change).

### FLAG-SIGNS: Sign certificate for the flag/configuration comparison

GR §7.1 changes the bicomplex signs without recording the conversion. Inside the dual weight-four Bigrassmannian complex the squares of GR §10 hold with the total differential D=∂+p and GR's alternating face signs, including the degree-eight cancellation of configuration-identities. The remaining certificate is the sign comparison of the flag map t_• of Theorem 7.1 with D=∂+p and with the simplicial differential of the flag complex, including any row or degree sign adapter.

**Affected targets:** [Z.4/flag-comparison](#target-Z-4-flag-comparison).

### C8-SQUARE: Degree-eight configuration identities

Give finite symbolic certificates for R₇³∂+R₇²p=0 on C₈(3) in Λ²b₂(3,8) (the B₃⊗U part vanishes trivially) and for R₇²∂=0 on C₈(2) in Λ²b₂(2,8). GR Lemma 7.9 claims instead that the Λ²B₂ part of R₇³∂ vanishes by itself, which is false (E05). The review confirmed both identities numerically with two independent Bloch–Wigner functionals, including the ratio −9 between the two C₈(3) contributions; a numerical check is not a proof. The descent of δ to G₄ depends on the first identity.

**Affected targets:** [Z.4/configuration-identities](#target-Z-4-configuration-identities).

### LIFT: Field-defined regularized Grassmannian lift

Supply the F-defined tangential path construction, endpoint regularization, constants, independence and two nine-term descent for the motivic Grassmannian lift; prove its full cobracket is the normalized scissors expression. G09 establishes integrable symbols and geometric Hodge–Tate variations over a rational complex variety; it does not alone prove this stronger F-valued lift. GR §9.3 sketches this passage. See E03.

**Affected targets:** [Z.5/grassmannian-symbol](#target-Z-5-grassmannian-symbol), [Z.5/generic-chern-cocycle](#target-Z-5-generic-chern-cocycle).

### RES: SNC closure and residue/current signs

Prove that every flag coefficient, correcting term, residue lift and required simplicial pullback has a finite admissible SNC support; give the uniformizer/current incidence sign certificate. Parent P.5/r-form-differential itself records a general sign gap, so it cannot be treated as a fully checked chain-map input. Restriction to smooth SNC support avoids singular transfers and the general H homotopy but still requires this closure proof.

**Affected targets:** [Z.5/normal-crossing-diagram](#target-Z-5-normal-crossing-diagram), [Z.5/current-regulator-four](#target-Z-5-current-regulator-four), [Z.5/chern-residue-extension](#target-Z-5-chern-residue-extension).

### SUPPLIERS: Remaining homological, scissors and regulator adapters

Requests P3-SPEC, SCISSORS, HOM, DELIGNE and SCALE require extensions beyond the statements actually read in their supplier packets. In particular projective-only Deligne comparison does not cover BGL, Bo=2Be in a Tate coordinate does not by itself give the real L₄ π³ adapter, and P.3 leaves the degenerate cases of its 22-term relation unproved. These obligations must be discharged before closure of Z.1 and Z.4–Z.6.

**Affected targets:** [Z.1/trilogarithm-reduction](#target-Z-1-trilogarithm-reduction), [Z.4/flag-resolution](#target-Z-4-flag-resolution), [Z.5/scissors-group](#target-Z-5-scissors-group), [Z.5/scissors-trilogarithm-map](#target-Z-5-scissors-trilogarithm-map), [Z.5/current-regulator-four](#target-Z-5-current-regulator-four), [Z.5/chern-regulator-normalization](#target-Z-5-chern-regulator-normalization), [Z.6/kappa-regulator](#target-Z-6-kappa-regulator).

### IND: Every-family statement in the inductive presentation

Inherited from P.4/cycle-obstruction and weight-four-determinant-lifting. The explicit theorem is the endpoint of this proof plan; pushing its constructed cycles proves inductive existence, while the arbitrary inductive-cycle period claim remains conditional on ω=0 or a direct image theorem. No explicit/inductive B₃ or B₄ isomorphism is assumed.

**Affected targets:** [Z.6/presentation-and-frontier](#target-Z-6-presentation-and-frontier).

## Source corrections and cautions

The following mistakes were found in the versions read. None of them makes the weight-four theorem false. The targets above use the corrected statements and normalizations; the packet records the correction searches and the versions read.

### E01: misprint

**Locator:** GR, v5 §10.1, Definition 10.7 and the subsequent evaluation map, p. 97.

Definition 10.7 gives the first family of symbolic trilogarithm generators a constant-free three-term relation, and the text then asserts an evaluation map from b₃(3,m) to B₃(F).

**Correction:** The evaluation map goes to B₃(F)/Q{1}₃. Its composite with the cobracket goes to B₂(F)⊗F×, and that composite is all that §10 uses; r\*₇(3) itself is defined directly by (166).

**Reason:** The three-term relation (19) holds in B₃(F) with constant {1}₃, which is nonzero for subfields of C. GR states on p. 94 that the symbolic groups describe relations modulo constants, and every identity proved with b₃ (Lemma 10.13, Theorem 10.11) is an identity after the cobracket, where δ{1}₃={1}₂⊗1=0. So the intended meaning is clear and no stated result changes.

**Affects:** nothing. **Known:** new.

**Correction status:** No separate correction located; the intended codomain is clear from p. 94.

### E02: misprint

**Locator:** GR, v5 Theorem 10.15(b), equation (244), p. 106, compared with its calculation on p. 107.

The displayed image of the unscaled alternating wedge is the same expression used for the normalized R₇² chain-map component.

**Correction:** Multiply the displayed right-hand expression by −84 for the unscaled wedge, or replace the left input by −1/84 times that wedge. The map in (166) already has the correct −1/84 normalization.

**Reason:** The calculation on p. 107 gives δW=−42A, while the displayed right side reduces to A/2. Thus δW=−84·(right side). The factor in (166) then gives the required chain identity. The PDF display on p. 106 was visually checked, rather than relying on extracted fraction text.

**Affects:** nothing. **Known:** GR v5 equation (166) and the calculation on p. 107 give the intended −1/84 normalization; equation (244) itself remains uncorrected in the version read..

**Correction status:** No separate correction located; corrected by the calculation in the same proof and the normalization already used in (166).

### E03: gap

**Locator:** GR, v5 §9.3(2), pp. 92–93, matrix-segment construction and passage to F-valued framed subquotients.

A sequence of matrix-entry segments is used to pass from the Grassmannian symbol to motivic iterated-integral expressions over the original number field.

**Correction:** Specify the changing entry consistently (the kth segment changes the kth first-row entry), the F-rational or tangential endpoints, regularization at determinant zeros, constants and the full cobracket/descent comparison. Keep this as LIFT until proved.

**Reason:** At k=1 the printed entry index is zero although matrix indices start at one. Moreover setting first-row entries to zero reaches the non-generic boundary, and equality of reduced symbols does not control constant extensions. G09’s rational-complex-variety theorem does not itself supply all the asserted F-valued motivic data. The separate source-version record scopes this finding to arXiv v5.

**Affects:** the proof. **Known:** new.

**Correction status:** No separate correction located; this records a missing formalization-level justification, not a claim that the published weight-four theorem is false.

### E04: error

**Locator:** GR, arXiv v5 §2, item 2, the cyclic quotient preceding Theorem 2.1, p. 27; compare G08 §8.2, Propositions 8.3–8.4, pp. 84–85.

The cyclic tensor quotient by first-shuffle relations is identified with special derivations without stating a pure-puncture reduction or a low-weight restriction.

**Correction:** For the positive-weight comparison explicitly remove the pure-puncture cyclic kernel before dualizing. In lengths at least three the pure powers vanish already by rational shuffle; the extra length-two diagonal classes need to be removed. Keep the ordinary weight-one correlator formula off its diagonal.

**Reason:** The two-letter pure cyclic word ⟨X_s,X_s⟩ survives the stated first-shuffle quotient, since those generators have length at least three. Its cyclic derivative is 2X_s and its induced tangential action is [X_s,2X_s]=0. Thus the literal unrestricted map has a kernel. G08 Proposition 8.3 explicitly computes the associative kernel as pure-puncture polynomials, explaining the required reduction. This is a carrier/range qualification, not a counterexample to the weight-four theorem. As stated, Theorem 2.1 (and G08 Proposition 8.4) is false in length two, that is in weight one; all weights used for the weight-four theorem are at least two, where the statement is correct.

**Affects:** a stated result. **Known:** new.

**Correction status:** No separate erratum found. G08 Proposition 8.3 supplies the intended central-kernel calculation; the scope of GR Theorem 2.1 still needs independent verification against the stated cyclic quotient.

### E05: error

**Locator:** GR, v5 §7.4, Lemma 7.9 and its proof, p. 72.

The lemma asserts that the composite of r\*₇(3) with the forgetting map vanishes on C₈(3). For the Λ²B₂ part, the proof applies the five-term relation for (1|2,5,6,7,8), kills one alternated wedge by an even involution exchanging the factors, and then claims that the other equals 9/56 times an alternated wedge that is symmetric in (4,5).

**Correction:** The Λ²B₂ part of r\*₇(3)∘∂ is not zero on C₈(3). What holds, and what the chain map and Proposition 7.8 need, is r\*₇(3)∘∂+r\*₇(2)∘p=0 on C₈(3), with total differential ∂+p. Proposition 7.8 then follows: δ̃ kills the forgetting relation since δ̃∂=−r\*₇(3)∂p=r\*₇(2)pp=0, and the projection relation since p²=0.

**Reason:** Put X=Alt₈({r(1|2,5,6,7)}₂∧{r(2|1,3,4,5)}₂), Y=Alt₈({r(1|5,6,7,8)}₂∧{r(2|1,3,4,5)}₂) and W=Alt₈({r(1|4,5,6,7)}₂∧{r(2|1,3,4,5)}₂). The first step is right (3X equals the alternated wedge with {r(1|2,6,7,8)}₂ minus Y, and that wedge vanishes), and W vanishes, but Y is not a multiple of W: the five-term relation for (1|4,5,6,7,8) also contains {r(1|4,6,7,8)}₂, which no permutation fixing the second factor turns into a term of W. Evaluating with the alternating form (D∘σ₁)∧(D∘σ₂), where D is the Bloch–Wigner function and σ₁, σ₂ are two independent generic complex configurations of eight vectors in C³, gives X≠0, the vanishing wedge and W zero to 10⁻¹² of the total, and Alt₈({r(8|1,2,3,4)}₂∧{r(8|1,5,6,7)}₂)=−9X to twelve digits for several random configurations. With the coefficients −3/28 and −1/84 of (166) this is exactly the cancellation in the correction. The same evaluation gives r\*₇(2)∘∂=0 on C₈(2).

**Affects:** a stated result. **Known:** new.

**Correction status:** No correction located. Lemma 7.9 as stated is false; Theorem 7.6 and Proposition 7.8 survive by the corrected identity.

### E06: misprint

**Locator:** GR, v5 §9.3, item 1, definition of a₃ and footnote 24, pp. 91–92, compared with (236), p. 89.

a₃ is defined as (1/2)a′₃−(1/3)a″₃, where a′₃ is the alternating double sum of the triple-ratio classes normalized by (167), and footnote 24 says that this a′₃ is one third of the a′₃ of Gon00.

**Correction:** By (236) the (167)-normalized class is three times Gon00's r₃, so this a′₃ is three times Gon00's. Goncharov's map a₃=(1/6)a′₃−(1/3)a″₃ of Gon00 §3.3, whose coproduct compatibility (Gon00 Theorem 3.2) the comparison of Proposition 9.5 uses, is (1/18)a′₃−(1/3)a″₃ when a′₃ is built from the (167)-normalized class.

**Reason:** Gon00 (7) normalizes r₃ with the factor 1/15 and (144) normalizes the class of GR with 1/5, consistent with (236). Gon00 sets a₃=(1/6)a′₃−(1/3)a″₃ (PDF p. 11), and its proof of Theorem 3.2 shows that only the combination (1/2)a′₃−a″₃ cancels the Δ(l₀,l₁,m₀,m₁) terms, so the ratio of the two coefficients is forced. The μ₃ of GR equals that of Gon00. The printed a₃ therefore has the a′₃ coefficient nine times too large relative to a″₃; the citation of Gon00 §3.3 shows which map is meant.

**Affects:** nothing. **Known:** new.

**Correction status:** No correction located.

### E07: misprint

**Locator:** GR, v5 §9.3, item 2, the element whose cobracket is subtracted before Theorem 1.14(c) is applied, p. 93.

The map to the polylogarithmic complex is obtained by subtracting the cobracket of Alt₈{r(3,4|2,5,6,7),r(6,7|1,3,4,5)}₃,₁.

**Correction:** Subtract the cobracket of −(3/28)·Alt₈{r(3,4|2,5,6,7),r(6,7|1,3,4,5)}₃,₁, so that its (2,2)-component cancels the term −(3/28)Alt₈({r(3,4|2,5,6,7)}₂∧{r(6,7|1,3,4,5)}₂) of Δ̃ on p. 91.

**Reason:** By (38) the (2,2)-component of δ{x,y}₃,₁ is {x}₂∧{y}₂ with coefficient one, while the Λ²B₂ component of Δ̃ carries −3/28.

**Affects:** nothing. **Known:** new.

**Correction status:** No correction located; the design's generic-chern-cocycle target already scales the correction.

### E08: misprint

**Locator:** GR, v5 §1.2, item 3, the specialization check after (38), p. 14.

The worked case states that the specialization of {tᵃu,tᵃv}₃,₁ for a<0 is {u/v}₄, and its first display writes tᵇv for tᵃv.

**Correction:** The specialization is 3{u/v}₄, as in table (26), and the argument is tᵃv.

**Reason:** The displayed computation ends with 2{u/v}₃⊗u/v+{u/v}₃⊗u/v=δ(3{u/v}₄), and (26) gives the coefficient 3 for equal negative orders.

**Affects:** nothing. **Known:** new.

**Correction status:** No correction located.

## Suggested file and validation

WORKERS' fixed shape governs the suggested file. Heavy Bloch, configuration,
correlator, motive and Deligne carriers are the mathematical targets above;
the file introduces no artificial data types to make those statements look
statable. It contains the real-bodied numerical coordinate, its three tests,
the native tensor moment implication and the resulting finite-sum calibration,
one coefficient identity from the configuration calculation, the coefficient
checks for the degree-eight cancellation and the corrected a₃ normalization,
and the finite matrix and empty-determinant implications. These selected statements elaborate
at the Mathlib pin using `lean-check`, with proof-placeholder warnings only.

The packet checker reports 45 targets: 10 definitions, 18 constructions,
3 comparisons and 14 theorems; 114 API contracts, 84 definition/construction
checks, 30 planets and 7 baseline declarations. All six layers are planned.
Closure must retain the seven gap records until their mathematical obligations
have been met: the specialization closure of the 22-term relation (P3-SPEC),
the flag-map signs, the degree-eight configuration certificate, the F-defined
motivic lift, the normal-crossing residues and the supplier adapters.

## Sources read

All new proof sources below were publicly available and read on 18 October
2026. Citations throughout are target-organized statements in this roadmap's
own words, with fixed-version theorem, section and page locators. No source
passages or source files are included. Lower-weight papers, Suslin/Bloch and
Borel are consumed through their existing owner packets; this document does not
claim a fresh reading of every source in those owners' bibliographies. The
maintainer's cleared library index was consulted; no restricted item was
needed for these new targets.

<a id="source-gr"></a>

**GR.** A. B. Goncharov and D. Rudenko, [Motivic correlators, cluster varieties and Zagier’s conjecture on ζ\_F(4)](https://arxiv.org/pdf/1803.08585v5). arXiv:1803.08585v5, 15 July 2026; 111 pages.

**Read:** Introduction, pp. 2–25; §§2–6, pp. 26–61; §7, pp. 61–72; §§8–9, pp. 72–94; §10, pp. 94–107.

**Version fingerprint:** SHA-256 `d7694f411ff344af087768a951a871aef6ebd4bbed571af6d6c045560d6ed8df`.

<a id="source-g08"></a>

**G08.** A. B. Goncharov, [Hodge correlators](https://arxiv.org/pdf/0803.0297v4). arXiv:0803.0297v4, 10 January 2016; PDF pagination.

**Read:** §1.3, pp. 7–9: mixed Tate Lie coalgebra and K-theory; §§1.5–1.6, pp. 10–11: motivic fundamental groups and realization; §11.1, pp. 102–104: classical polylogarithm periods; §§8.1–8.3, pp. 82–85: special derivations and pure-puncture kernel; §10.3, pp. 94–96: the motivic derivation action.

**Version fingerprint:** SHA-256 `d4cc8a37d7dad80060b58450722964dd0d3285bda50a8840b1436eb6e2d79d42`.

<a id="source-g09"></a>

**G09.** A. B. Goncharov, [A simple construction of Grassmannian polylogarithms](https://arxiv.org/pdf/0908.2238). arXiv:0908.2238, PDF pagination.

**Read:** §3.1–3.3, pp. 15–19; §4.1, pp. 22–23.

**Version fingerprint:** SHA-256 `b23e3e7d8274702cc1b914281128cc10300068a0f6ce25a11ef5bafbf7a5b48b`.

<a id="source-m20"></a>

**M20.** N. Malkin, [Shuffle relations for Hodge and motivic correlators](https://arxiv.org/pdf/2003.06521). arXiv:2003.06521, PDF pagination.

**Read:** §2.1.3, pp. 17–18, Theorem 11; §4, pp. 44–45, Lemma 29 and continuity argument.

**Version fingerprint:** SHA-256 `6fede42fa302c1f1c7004d89013393d97ccd20e8aeb50419665e51be8615df42`.

<a id="source-g00"></a>

**G00.** A. B. Goncharov, [Geometry of the trilogarithm and the motivic Lie algebra of a field](https://arxiv.org/pdf/math/0011168). arXiv:math/0011168, PDF pagination.

**Read:** §3, item 2, definition (7) of r₃, p. 9; §3, item 3, pp. 11–17: the map a₃, Theorems 3.2–3.3 and collinear degeneration (Lemma 3.7); §5, pp. 29–31: relation to K-theory.

**Version fingerprint:** SHA-256 `2ee46a748224833684bdf9f87f75fd65390671c41853882d4477710cf7b8a637`.

<a id="source-g93"></a>

**G93.** A. B. Goncharov, [Explicit construction of characteristic classes](https://sasha-goncharov.github.io/charclasses.pdf). Advances in Soviet Mathematics 16, part 1 (1993), pp. 169–210.

**Read:** Introduction, p. 170; §4.3–4.4, pp. 189–191, Theorems 4.5–4.6 (scanned pages visually read).

**Version fingerprint:** SHA-256 `7a9eb3a64c48bcbfa42037503e4304aba3552a560f35df67206e29458e69ed5b`.
