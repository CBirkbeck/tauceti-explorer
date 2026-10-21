# Motivic spectral sequence and rational weights — M.6

This is the M.6 assembly and Chern-character comparison for **Motivic and étale methods for arithmetic K-theory**. The layer takes an actual filtered K-spectrum from M.6a and its convergence and operations from M.6b. It exports the motivic weight dictionary, with a specified map, to M.7, BorelRegulators R.7, Polylogarithms P.3 and the KU-motivicspectral readiness checkpoint. The cycle complex is defined independently of K-theory. An equality of displayed pages, or an abstract isomorphism of rational groups, does not supply the filtered spectrum or identify its character.

The packet is a complete target-level planning pass. Its coverage is **planned**, rather than closed: three explicit gaps remain in coherent filtered comparisons and supported universal characteristic-class evaluation. Every mathematical node has implementation status unchecked. The compact suggested file checks a rational normalization scalar over existing carriers; it does not implement motivic cohomology or higher K-theory.

## Scope, baseline and ownership

Write $K_m(X)=\pi_m K(\operatorname{Perf}X)$, with homological index $m\geq0$. On the regular schemes below this agrees with the imported vector-bundle K-theory. The default character setting is a perfect field $k$ and a smooth quasi-projective finite-type $k$-scheme $X$, of dimension $d$. Disconnected schemes are treated componentwise. For the tower and its layer theorem the imported scheme class is the larger class of smooth separated finite-type schemes over a perfect field; the global FS comparison and the universal-class comparison here use quasi-projectivity. A local curve ring is an essentially smooth filtered-colimit specialization, explicitly covered by the requested continuity adapter.

The integral motivic convention is

\[
 H^q(X,\mathbb Z(j))=CH^j(X,2j-q),\qquad
 H^q(X,\mathbb Q(j))=CH^j(X,2j-q)\otimes\mathbb Q.
\]

M.4 supplies the cycle complex, moving, products, localization, homotopy invariance, weight zero and one, and the sign-compatible simplicial/cubical comparison. On these schemes its descent theorem identifies global-cycle homology with the prescribed hypercohomology. Rationalization is taken on the actual complexes/groups with their natural maps. No singular-scheme replacement of K by G is implicit. The arithmetic-base spectral sequence is not asserted here: the Dedekind hypercohomology convention and extensions belong to their existing owners and still require their source hypotheses.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit for M.6/M.6a/M.6b does not contain the geometric towers or the character comparison. Pinned Tau Ceti's categorical Grothendieck/Exact K₀ does not give the higher K-spectrum used here; Mathlib's abstract spectral-sequence and eigenspace machinery does not give its geometric layers. The only direct baseline declarations newly cited are `Nat.factorial`, `Nat.factorial_succ` and `Nat.factorial_ne_zero`, in `Mathlib/Data/Nat/Factorial/Basic.lean`; their definitions/statements were read at the pin. The scalar prototype uses those existing carriers and operations.

Current TauCetiRoadmap main was checked in addition to the atlas snapshot. **AlgebraicVectorBundles** supplies finite locally free sheaves, tensor/exterior operations and geometric bundle comparisons; these objects are imported through S.2/S.6, never planned again. **JacobianChallenge** supplies line-bundle/Picard geometry; it has no higher-K or motivic-character replacement. Their README and suggested files were read as the nearby upstream models. The current Tau Ceti library was also searched; the search found no actual higher motivic K, higher Chow or universal higher Chern carrier.

The issue names M.1 as its predecessor. That accepted packet now scopes M.1–M.5c and has no M.6 coverage record. The actual accepted supplier is [M.5d](../packets/MotivicEtaleKTheory--M.5d.json), whose M.6/M.6a/M.6b IDs remain authoritative. RS-18 assigns the higher cycle-valued character comparison to M.6 and keeps ordinary operations, the gamma filtration and degree-zero geometric Chern character in S.6/S.7. The existing stage links were checked; no ownership change or new layer is proposed.

## Imported filtered-spectrum contract

The following targets already have nodes in M.5d. They are requirements of this assembled layer, not new declarations in this packet.

| Supplier node | Exact input used here |
| --- | --- |
| M.6a/admissible-k-supports | Closed supports in $X\times\Delta^n$ meet every face in codimension at least $p$; the support spectrum is actual perfect-complex K with supports. |
| M.6a/homotopy-coniveau-tower | $K^{(p)}(X)$ is the realization of the homotopy colimit of these support spectra. Its transition maps and augmentation $K^{(0)}(X)\simeq K(X)$ are defined before any spectral-sequence page. |
| M.6a/moving-and-excision, k-theory-well-connected | Moving/excision and field connectivity identify local support contributions. Finite fields require the transfer argument; they are not excluded by an unstated infinite-field hypothesis. |
| M.6a/coniveau-cycle-layer | $L_p(X)=\operatorname{cofib}(K^{(p+1)}(X)\to K^{(p)}(X))\simeq H(z^p(X,\bullet))$, with $\pi_m L_p=CH^p(X,m)=H^{2p-m}(X,\mathbb Z(p))$. |
| M.6a/global-model-comparison | A natural filtered zigzag to the global Levine/FS model, preserving augmentation, transitions and normalized layers, in the smooth quasi-projective perfect-field setting. Its existing coherence gap remains G1 here. |
| M.6b/motivic-exact-couple | $D_1^{p,m}=\pi_mK^{(p)}(X)$ and $E_1^{p,m}=\pi_mL_p(X)$, with $i:D_1^{p+1,m}\to D_1^{p,m}$, $j:D_1^{p,m}\to E_1^{p,m}$, $k:E_1^{p,m}\to D_1^{p+1,m-1}$. |
| M.6b/motivic-strong-convergence | $\pi_mK^{(p)}(X)=0$ for $p>d+m$, $m\geq0$; the resulting finite filtration has no hidden inverse-limit term. The supplier proves the homotopy-limit and $\lim^1$ assertions. |
| M.6b/filtered-motivic-products, filtered-adams-operations | Actual filtered products $K^{(p)}\wedge K^{(q)}\to K^{(p+q)}$, with cycle cup product on the layer, and filtered Adams operations acting by $k^p$ on layer $p$. Global product coherence stays a recorded supplier input. |
| M.6b/rational-motivic-degeneration | Rational differentials vanish; the finite filtration splits canonically into simultaneous Adams eigenspaces. |
| M.6/motivic-spectral-sequence, rational-weight-comparison | The assembled sequence and rational weight isomorphisms, whose precise Chern-character normalization is the purpose of the seven new targets below. |

All IDs in this table have prefix `MotivicEtaleKTheory:`. Definitions, API and discriminating tests of these imported objects remain with their supplier nodes; creating a second exact couple, tower or projector family here would obscure their ownership.

For the public indexing put $j=-b$, $m=-a-b$, so $a=j-m$. The exact-couple layer page is reindexed as

\[
 E_2^{a,b}=H^{a-b}(X,\mathbb Z(-b))
 \Longrightarrow K_{-a-b}(X),\qquad
 d_r:E_r^{a,b}\to E_r^{a+r,b-r+1}.
\]

The layer-page differential $d_s:(p,m)\mapsto(p+s,m-1)$ corresponds to the displayed $d_{s+1}$. Thus layer $E_1$ becomes the displayed $E_2$, and the page shift is part of the contract. Nonzero entries have $b\leq0$ and $-a-b\geq0$. For fixed abutment degree $m$, only $0\leq j\leq d+m$ occur. Set

\[
 F^j_{HC}K_m(X)=\operatorname{im}(\pi_mK^{(j)}(X)\to K_m(X)).
\]

The filtration starts at $F^0=K_m(X)$, vanishes at $F^{d+m+1}$ and has $E_\infty^{j-m,-j}\cong\operatorname{gr}_{HC}^jK_m(X)$. A finite-dimensional scheme is an essential hypothesis in this convergence assertion. Merely having a right half-plane of pages would not prove completeness or remove $\lim^1$.

For $k\geq2$, the source and target of $d_r$ have respective Adams eigenvalues $k^j$ and $k^{j+r-1}$. Their nonzero difference is invertible rationally for $r\geq2$, so the rational differentials vanish. Finite filtration then gives a canonical splitting, rather than an arbitrary choice of complements:

\[
 K_m(X)_{\mathbb Q}=\bigoplus_{j=0}^{d+m}K_m(X)_{\mathbb Q}^{(j)},\qquad
 K_m(X)_{\mathbb Q}^{(j)}\cong H^{2j-m}(X,\mathbb Q(j)).
\]

Here the eigenspace is simultaneous for all admitted Adams operations. The finite polynomial projectors from the supplier use the actual weight range. The comparison below identifies this isomorphism as a particular universal character. Equality of eigenvalues would allow arbitrary nonzero rational rescalings and is not that identification.

This contract uses integral products and their rationalization. A mod-$n$ spectral sequence is an integral module without further choices; it is not automatically a ring for every $n$. The Moore-spectrum product restriction in the K-book VI.4.2.1 is preserved in the supplier, and no coefficient-ring extension is added here.

## New comparison targets

The names below describe the mathematical declarations to be developed. Each subsection gives the complete target and direct inputs. Only the light normalization scalar has a Lean carrier at the pins; the universal K-space, motivic Eilenberg–MacLane object, cycle complex and relative supported character are README targets.

### Universal motivic Chern classes

**Node:** `MotivicEtaleKTheory:M.6/universal-motivic-chern` (construction).

Construct the natural motivic Chern operations c_{j,m}: K_m(X) → H^{2j−m}(X,Z(j)) for j≥1 and m≥0 from the universal classes on BGL. On K_0 these are the geometric Chern classes of S.7; for m>0 they are homomorphisms. The construction is through the actual K-space and the motivic cycle complex, with a coherent extension to relative diagrams required for the comparison below. Set c_{0,0}=rank and c_{0,m}=0 for m>0 as separate conventions. No additivity of c_{j,0} for j>1 is asserted.

**Hypotheses and conventions.** k is a perfect field; X is smooth quasi-projective and of finite type over k, of dimension d. Disconnected X is treated componentwise. m and j are nonnegative integers. Rational coefficients mean tensoring the integral groups with Q, not replacing the integral cycle complex by its cohomology before deriving sections.

**Construction or proof.**

1. For a representation G→GL(E), form the projective bundle over the simplicial scheme B•G. Define its Chern classes by the coefficients of the monic relation for ξ=c_1(O(1)); the projective-bundle basis determines the coefficients uniquely. Use M.4 projective bundles and the requested simplicial descent adapter.
2. The localization sequence for a projective bundle associated to an extension proves Whitney; splitting into lines proves the tensor-polynomial identities. In the Whitney argument use the closed bundle P(F′) as the Gysin source, and the homogeneous polynomial C_E(T)=Σ_{i=0}^rank(E)(−1)^i c_i(E)T^(rank(E)−i), with c_0=1: C_F=C_F′ C_F″. These correct the displays in E-M6-2. The classes are universal geometric classes, not characteristic classes assigned separately to each K-group.
3. Evaluate the stable universal class on the plus/completed K-space, using the Hurewicz and Dold–Kan construction of K-book V.11.3, V.11.6–11.8. Zariski descent glues the affine evaluation. Its π_m action has the indicated cohomological degree.
4. Compare the degree-zero evaluation with the S.7 geometric classes. For the relative cubical comparison retain the diagrams, homotopies and support maps through derived sections; their existence is the precise GeneralAlgebraicKTheory K.2 / SF.5 request, recorded as gap G2. Objectwise group maps are insufficient.

**Uses.** K-book V.11.11–11.13: Produces higher motivic Chern classes and their symbol normalization. M.6/chern-character-edge-comparison and MotivicEtaleKTheory:M.8 finite-etale-chern: Identifies the universal character before applying a realization; realization itself stays in M.8.

**API.**

- `TauCeti.MotivicKTheory.motivicChern` (constructor): The natural c_{j,m} above, for j≥1, with its actual universal-class evaluation.
- `TauCeti.MotivicKTheory.motivicChern_degreeZero` (compatibility): c_{j,0} is the geometric class on K_0(Vect X), transported through S.2 to K_0(X).
- `TauCeti.MotivicKTheory.motivicChern_pullback` (functoriality): f* c_{j,m}(x)=c_{j,m}(f*x) for morphisms between the admitted smooth quasi-projective schemes.
- `TauCeti.MotivicKTheory.motivicChern_add_positive` (structure): For m>0, c_{j,m}(x+y)=c_{j,m}(x)+c_{j,m}(y); for m=0 use Whitney instead.
- `TauCeti.MotivicKTheory.motivicChern_units` (simp): c_{1,1} on K_1 is determinant with values H^{1,1}(X,Z)=Γ(X,O_X^×).
- `TauCeti.MotivicKTheory.motivicChern_relative` (compatibility): After the G2 adapter, evaluation commutes with the iterated fibres for cubical boundary diagrams and with forgetting supports.

- `TauCeti.MotivicKTheory.motivicChern_whitney` (structure): For x,y∈K_0(X), c_t(x+y)=c_t(x)c_t(y), using the total series c_t=1+Σ_{j≥1}c_{j,0}t^j. Its constant term is 1, separately from the auxiliary rank convention c_{0,0}.
- `TauCeti.MotivicKTheory.motivicChern_universal` (characterisation): An operation represented by a map Z×Gr→K(Z(j),2j) is determined by its natural K_0-to-CH^j operation (Riou 6.2.1.2). Once G2 identifies the models, this characterizes the higher operations by the universal geometric classes; values on abstract K-groups alone are not a replacement.

**Unit tests.**

- **chern_line**: c_{1,0}([L])=c_1(L) and c_{j,0}([L])=0 for j>1.
- **chern_trivial**: For a trivial bundle of rank r all c_{j,0}, j≥1, vanish; its rank is r.
- **chern_unit**: For F a field and u∈F×, c_{1,1}(u)=u under H^{1,1}(F,Z)=F×.
- **chern_symbol_sign**: For a,b∈F×, c_{2,2}({a,b})=−{a,b} in H^{2,2}(F,Z)=K_2^M(F).
- **chern_not_additive_zero**: On P², putting h=c_1(O(1)), c_{2,0}([O(1)]+[O(1)])=h² while each summand has c_2=0.

**Checks.**

- The operation has a specified universal class and a derived evaluation, not merely the correct codomain.
- Keep the K_0 operation nonlinear before applying Newton polynomials.
- Relative extension and supported normalization remain visible prerequisites G2/G3.

**Direct prerequisites.** `MotivicEtaleKTheory:M.4/projective-bundle-formula`, `MotivicEtaleKTheory:M.4/zariski-descent`, `MotivicEtaleKTheory:M.4/weight-zero-and-one`, `SchemeKTheoryOperations:S.7/chern-character`, `SchemeKTheoryOperations:S.6/simplicial-sheaf-hypercohomology`, `GeneralAlgebraicKTheory:K.2`, `SchemeAndStackFoundations:SF.5`, `MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro`.

**Sources.** Weibel2013, V.11.3 and 11.3.1, pp.452–453; V.11.5–11.8, pp.453–455; Theorem V.11.11 and its proof, pp.457–459: Universal characteristic classes induce higher operations; projective bundles supply the motivic classes and the degree-zero/units normalization. Riou2009, Theorem 6.2.1.2 and proof, pp.31–32: Over a perfect field, maps from Z×Gr to a motivic Eilenberg–MacLane space are determined by the corresponding natural K_0-to-Chow operations. This is a source check on uniqueness, not an assertion that K-endomorphism uniqueness alone supplies these target maps.

### Normalized higher Chern character

**Node:** `MotivicEtaleKTheory:M.6/higher-chern-normalization` (definition).

Define ch_{j,m}:K_m(X)_Q→H^{2j−m}(X,Q(j)). For m=0 use the existing S.7 character: ch_{0,0}=rank and ch_{j,0}=N_j(c_1,…,c_j)/j! for j≥1. For m>0 set ch_{0,m}=0 and ch_{j,m}=a_j c_{j,m} for j≥1, where a_j=(−1)^{j−1}/(j−1)!. The auxiliary scalar function a: N→Q has a_0=0 solely to encode the m>0 convention. It is not the K_0 rank character. The total character has finitely many nonzero components, j≤d+m.

**Hypotheses and conventions.** k is a perfect field; X is smooth quasi-projective and of finite type over k, of dimension d. Disconnected X is treated componentwise. m and j are nonnegative integers. Rational coefficients mean tensoring the integral groups with Q, not replacing the integral cycle complex by its cohomology before deriving sections.

**Construction or proof.**

1. Import the Newton-polynomial character in degree zero from S.7. Positive loop degree kills decomposable universal cohomology classes under evaluation on a suspension, leaving N_j=(-1)^{j−1}j c_j; division by j! gives the stated a_j.
2. Use rational scalar multiplication on the homomorphisms c_{j,m} for m>0. Treat weight zero separately: the higher homology of the constant weight-zero cycle complex is zero.
3. The bound CH^j(X,m)=0 for j>d+m follows because X×Δ^m has dimension d+m; use M.4 and the motivic comparison. Thus the total character lies in a direct sum in each degree.
4. The light scalar function and its cancellation identities are statable at the pins. They check normalization only; they provide none of the missing motivic carriers.

**Uses.** MotivicEtaleKTheory:M.6/rational-weight-comparison (imported): Pins down the actual map realizing the rational weight isomorphism. BorelRegulators:R.7 and Polylogarithms:P.3: Fixes scalars before comparing regulators or weight-three symbols; those comparisons consume this dictionary.

**API.**

- `TauCeti.MotivicKTheory.higherChernCoefficient` (data): a_0=0 and a_j=(−1)^{j−1}/(j−1)! for j≥1, as an element of Q.
- `TauCeti.MotivicKTheory.motivicChernCharacter` (constructor): The Q-linear maps ch_{j,m} with the degree-zero and positive-degree clauses above.
- `TauCeti.MotivicKTheory.motivicChernCharacter_positive` (characterisation): For j≥1 and m>0, ch_{j,m}=a_j c_{j,m}.
- `TauCeti.MotivicKTheory.motivicChernCharacter_zero` (compatibility): At m=0 this is exactly S.7/chern-character; ch_{0,m}=0 for m>0.
- `TauCeti.MotivicKTheory.motivicChernCharacter_finite` (structure): For fixed m all components j>d+m vanish, so total ch is a map into the finite sum 0≤j≤d+m.
- `TauCeti.MotivicKTheory.higherChernCoefficient_cancel` (simp): For j≥1, a_j·((−1)^{j−1}(j−1)!)=1.
- `TauCeti.MotivicKTheory.higherChernCoefficient_recurrence` (structure): For j≥1, j·a_{j+1}=−a_j; the restriction excludes the rank/weight-zero convention.

**Unit tests.**

- **coefficient_small**: (a_0,a_1,a_2,a_3,a_4)=(0,1,−1,1/2,−1/6).
- **character_rank**: On Spec F, ch_{0,0}(r)=r, whereas ch_{j,0}(r)=0 for j>0.
- **character_line**: On P² with h=c_1(O(1)), ch([O(1)])=1+h+h²/2.
- **character_symbol_three**: For a,b,c∈F×, c_{3,3}({a,b,c})=2{a,b,c}; hence ch_{3,3}({a,b,c})={a,b,c}.
- **character_units**: ch_{1,1}:K_1(F)_Q→F×⊗Q is the determinant identification.
- **character_no_integral_division**: a_3=1/2 is a rational scalar. No operation dividing arbitrary integral motivic classes by 2 is part of this definition.

**Checks.**

- Distinguish homological K degree m from motivic weight j.
- The m=0 formula and positive m formula are different evaluations of the same universal character.
- No integral isomorphism is inferred from division by factorials.

**Direct prerequisites.** `MotivicEtaleKTheory:M.6/universal-motivic-chern`, `SchemeKTheoryOperations:S.7/chern-character`, `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/weight-zero-and-one`, `mathlib:Nat.factorial`, `mathlib:Nat.factorial_succ`, `mathlib:Nat.factorial_ne_zero`, `MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro`.

**Sources.** Weibel2013, V.11.3, pp.452–453; V.11.11.1, p.457; Lemma V.11.13, p.458: The universal Chern product rule fixes the sign and factorial on positive-degree classes. Newton polynomials give the degree-zero character. Riou2009, Proposition 6.2.2.1 and Remark 6.2.2.3, p.32; Lemma 6.2.3.2, pp.33–34; Definition 6.2.3.9, pp.34–35: The additive Newton operation restricts on a line to c_1^j, and its P¹ loop is j times the previous operation; the stable character therefore has factorial normalization.

### Products and Adams operations for the higher character

**Node:** `MotivicEtaleKTheory:M.6/higher-character-structure` (theorem).

For admitted X and x∈K_m(X)_Q, y∈K_n(X)_Q, ch_{r,m+n}(xy)=Σ_{i+j=r} ch_{i,m}(x)∪ch_{j,n}(y). The same formula holds for external products on X×Y. The character preserves the unit, is Q-linear, commutes with pullback, and satisfies ch_{j,m}(ψ^k x)=k^j ch_{j,m}(x) for integers k≥2. The cohomological cup sign is (−1)^{mn}, since 2i−m and 2j−n have parity m and n. Consequently ch_{j,m} vanishes on an Adams weight i≠j.

**Hypotheses and conventions.** k is a perfect field; X is smooth quasi-projective and of finite type over k, of dimension d. Disconnected X is treated componentwise. m and j are nonnegative integers. Rational coefficients mean tensoring the integral groups with Q, not replacing the integral cycle complex by its cohomology before deriving sections. Use the actual tensor product on scheme K-theory and the cycle-complex cup product imported from S.6 and M.4.

**Construction or proof.**

1. Start with the universal tensor/Newton identity giving ch(E⊗F)=ch(E)ch(F) on K_0. Lift this two-operand identity to maps into motivic Eilenberg–MacLane spaces using the several-operand extension immediately before Riou Proposition 6.2.2.1, then evaluate on S^m∧S^n and the actual K tensor product. This identifies the mixed and two-positive-degree products with their motivic cup products, subject to G2. Agreement of group operations on K_0 alone would not justify this step.
2. Equivalently, derive the two-positive-degree Chern coefficient −(i+j−1)!/((i−1)!(j−1)!) from that universal tensor identity after reduced evaluation kills the decomposable terms in each factor; multiplying by a_{i+j} gives a_i a_j. K-book V.11.3 explicitly states the diagonal graded-ring case, not the whole arbitrary-weight dg-coefficient formula. Use its V.11.5(4) tensor identity and the motivic uniqueness argument for the general case. M.4 supplies the diagonal/external-product comparison, and Levine Theorem 5.2 fixes the higher Chow sign.
3. For Adams compatibility, lift the universal Newton operations through the same completed/sheaf K model as S.6. Riou’s motivic uniqueness checks this for maps into motivic Eilenberg–MacLane spaces, not just endomorphisms of K. The required coherent class evaluation is G2.
4. If x has weight i, Q-linearity and the last identity give (2^i−2^j)ch_{j,m}(x)=0. Distinct powers of 2 are invertible in Q, so the off-weight component vanishes.

**Checks.**

- For m=n=i=j=1, c_{2,2}(xy)=−c_{1,1}(x)c_{1,1}(y) and ch_{2,2}(xy)=ch_{1,1}(x)ch_{1,1}(y).
- For a line bundle L and a unit u, ch(Lu)=exp(c_1(L))ch(u), in the finite degreewise range.
- Check the unit in degree zero and the sign under exchange of two degree-one factors.
- Adams eigenspace vanishing does not by itself prove equality with the edge comparison.

**Direct prerequisites.** `MotivicEtaleKTheory:M.6/higher-chern-normalization`, `SchemeKTheoryOperations:S.6/scheme-adams-multiplicative`, `SchemeKTheoryOperations:S.6/riou-motivic-uniqueness`, `SchemeKTheoryOperations:S.6/soule-scheme-operations`, `SchemeKTheoryOperations:S.7/chern-character-ring-homomorphism`, `MotivicEtaleKTheory:M.4/products`, `GeneralAlgebraicKTheory:K.2`.

**Sources.** Weibel2013, V.11.2–11.3, pp.451–453; V.11.5(4), p.454; Lemma V.11.13, p.458: The universal tensor identity supplies the character product calculation; V.11.3 and V.11.13 check its diagonal specialization. The arbitrary-weight higher product uses the several-operand motivic lifting, rather than a broader reading of V.11.3. Levine1994, Theorem 5.2 and proof, pp.313–316: Products on higher Chow groups are functorial and graded commutative in the higher Chow degree. Riou2009, Theorem 6.2.1.2, pp.31–32; several-operand extension preceding Proposition 6.2.2.1, p.32; Definition 6.2.3.9 and Remark 6.2.3.10, pp.34–35: Motivic-target uniqueness, including several operands, lifts the degree-zero tensor identity; the stable rational character and its Adams components fix the higher normalization. The S.6 K-endomorphism uniqueness theorem alone has the wrong target.

### Gamma filtration and homotopy-coniveau filtration

**Node:** `MotivicEtaleKTheory:M.6/gamma-homotopy-coniveau-comparison` (comparison).

For smooth quasi-projective X over a perfect field and m≥0, write F_HC^p K_m(X)=im(π_m K^(p)(X)→K_m(X)). Use the full weighted gamma filtration from S.6/S.7, not the subgroup generated by single gamma operations. Then F_γ^p K_m(X)_Q=F_HC^p K_m(X)_Q=⊕_{j≥p}K_m(X)_Q^(j). These filtrations vanish for p>d+m and start at the whole group for p=0. Their associated graded comparisons are the identity on the common Adams eigenspace. In degree zero this recovers S.7/gamma-chow-comparison.

**Hypotheses and conventions.** k is a perfect field; X is smooth quasi-projective and of finite type over k, of dimension d. Disconnected X is treated componentwise. m and j are nonnegative integers. Rational coefficients mean tensoring the integral groups with Q, not replacing the integral cycle complex by its cohomology before deriving sections.

**Construction or proof.**

1. Transport the Levine/FS filtration to the chosen homotopy-coniveau tower by the augmentation-compatible global-model comparison; this use of G1 is required, not supplied by an E₂ identification. Use Levine’s relative K_0 argument, Lemma 13.3, Theorem 13.10 and Corollary 13.11: the Friedlander–Suslin comparison from multirelative K_0 is onto and preserves the K_0(X)-lambda structure; lift weighted gamma expressions to that relative K_0. Move their Grassmannian support into facewise codimension at least p, giving F_γ^p⊂F_HC^p.
2. For the field case use the semilocal Grassmannian part of the proof on p.66: over an infinite field move by the product of special linear groups, and over a finite field use transfers from extensions of coprime degrees. The gluing across closed points of a one-dimensional base is not invoked. This is the field adaptation advertised in the introduction, p.2; Corollary 13.11 is printed for a one-dimensional base.
3. The inherited connectivity bound π_m K^(p)(X)=0 for p>d+m makes F_HC finite. The inclusion therefore proves finite length of the full F_γ in this scope. The implication is from the relative moving comparison, not from operationwise gamma vanishing.
4. Adams acts on gr_γ^p and gr_HC^p by k^p. Apply the finite simultaneous eigenspace/projector argument of Lemma 14.6 and Theorem 14.7 with corrected indices and inclusion direction (inherited sourceIssues E6–E8). Every actual weight j lies at filtration index j in both filtrations. This proves rational equality and compatibility of graded identifications. In importing the filtered Adams theorem, use only its generic supported K_0/Koszul weight calculation; its citation of S.7 is not permission to assume a higher gamma-filtration isomorphism whose boundedness is being proved here.

**Checks.**

- On K_0(P²)_Q the classes 1, u=[O(1)]−1 and u² give F¹=(u,u²), F²=(u²), F³=0 in either filtration.
- On K_1(F)_Q the unit classes have filtration one, not filtration zero as their only nonzero graded degree.
- For m=0, import the existing S.7 Chow comparison rather than defining a second ordinary Chow filtration.
- Do not assert the integral equality, a supported variant with bound d+m, or a gamma bound obtained only by checking γ^r(x)=0.

**Direct prerequisites.** `MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower`, `MotivicEtaleKTheory:M.6a/global-model-comparison`, `MotivicEtaleKTheory:M.6b/motivic-strong-convergence`, `MotivicEtaleKTheory:M.6b/filtered-adams-operations`, `MotivicEtaleKTheory:M.6b/rational-motivic-degeneration`, `SchemeKTheoryOperations:S.6/non-unital-gamma-filtration`, `SchemeKTheoryOperations:S.6/adams-eigenvalue-on-gamma-graded`, `SchemeKTheoryOperations:S.7/scheme-gamma-filtration`, `SchemeKTheoryOperations:S.7/gamma-chow-comparison`, `SchemeKTheoryOperations:S.6/simplicial-sheaf-hypercohomology`.

**Sources.** LevineSchemes2001, §13.1–13.3, pp.59–61; Theorem 13.10 and Corollary 13.11, pp.65–68; Theorem 14.5, pp.70–71; Lemma 14.6 and Theorem 14.7, pp.71–74; field scope in introduction, p.2: A relative K_0 moving argument includes the gamma filtration in homotopy coniveau. Finite Adams filtrations then identify them rationally. The field proof uses the Grassmannian/transfer portion of the argument; the printed general statement also treats a one-dimensional base.

### Relative cycle normalization of the character

**Node:** `MotivicEtaleKTheory:M.6/relative-cycle-normalization` (theorem).

Let X be smooth quasi-projective over a perfect field. For j,m≥0 let cyc_{j,m}: CH^j_□(X,m)_Q→K_m(X)_Q^(j) be Levine’s cycle isomorphism. Its construction uses multirelative K_0 on X×□^m and supported structure-sheaf classes, with projection to the generalized ψ^k characteristic summand of index j in the relative/support diagram, identified with the genuine weight-j summand after comparison with K_m(X); a raw structure-sheaf class need not have pure weight j. Transport the cubical group to CH^j(X,m) by M.4. With the same ordering of cube faces and the corresponding suspension signs, ch_{j,m}∘cyc_{j,m}=id and ch_{i,m}∘cyc_{j,m}=0 for i≠j. This identifies actual maps, including j=0, rather than just two abstractly isomorphic rational vector spaces.

**Hypotheses and conventions.** k is a perfect field; X is smooth quasi-projective and of finite type over k, of dimension d. Disconnected X is treated componentwise. m and j are nonnegative integers. Rational coefficients mean tensoring the integral groups with Q, not replacing the integral cycle complex by its cohomology before deriving sections. Both cycle and K-theory use the fixed ordered iterated-fibre convention for the cube. The supported universal character / relative-diagram adapter G2–G3 is a prerequisite; ordinary K_0 classes after forgetting supports cannot replace it.

**Construction or proof.**

1. Levine Lemma 2.1 and the construction preceding Lemma 2.2 uses the rational characteristic-summand projection in its supported and relative cycle maps; retain it before passing to the weight-j target. Theorem 3.1 compares the cubical cycle group with the weight-j summand of multirelative K_0, identified with K_m(X) by homotopy invariance. Theorem 3.3 proves Zariski Mayer–Vietoris descent, and Theorem 3.4 supplies supported/localization compatibility. Use the imported finite rational Adams splitting for the final projector on K_m(X).
2. Before forgetting supports, the leading supported Chern class of the perfect resolution of an integral codimension-j cycle is (−1)^{j−1}(j−1)![Z], with lower supported classes zero. This is the normalization requested from SF.5 and already required by S.7/chern-class-of-subvariety. Extend it to the relative cube with specified face nullhomotopies; this extension is G3, not a consequence of agreement in ordinary CH(X).
3. Apply the universal Newton character to the relative class. The leading supported formula is unchanged by the weight-j projector because the character is Adams compatible; the projection removes the other weights. Pass through the ordered loop comparison: decomposable terms vanish in positive loop degree and a_j cancels the leading signed factorial. At m=0, ch_j([O_Z])=[Z] is a leading-term statement, while the pure-weight inverse is pr_j[O_Z]. For j=0 use rank and the acyclicity in positive degree.
4. The off-weight terms vanish by higher-character-structure. M.4’s simplicial/cubical comparison and the same ordered suspension convention yield the assertion on the chosen motivic complex. Until G2–G3 are supplied this is a planned comparison, not a verified closed proof.

**Checks.**

- For a divisor D at m=0, cyc_{1,0}([D])=pr_1[O_D]; ch_1([O_D])=[D] records its leading term only. On P², with u=[O(1)]−1 and h=c_1(O(1)), a hyperplane has [O_D]=u−u², ch([O_D])=h−h²/2 and pr_1[O_D]=u−u²/2, whose total character is h. This detects omission of the weight projector.
- For a unit at m=j=1 the two maps are inverse with no sign.
- For a triple Milnor symbol, the Chern factor is +2 and the normalized composite is the identity.
- Record and check the relative supported extension G3; neither abstract Adams splitting nor the existence of cyc proves this composite formula.

**Direct prerequisites.** `MotivicEtaleKTheory:M.6/higher-character-structure`, `MotivicEtaleKTheory:M.6b/rational-motivic-degeneration`, `MotivicEtaleKTheory:M.4/simplicial-cubical-comparison`, `MotivicEtaleKTheory:M.4/moving-lemma`, `MotivicEtaleKTheory:M.4/homotopy-invariance`, `SchemeKTheoryOperations:S.7/chern-class-of-subvariety`, `SchemeKTheoryOperations:S.6/simplicial-sheaf-hypercohomology`, `SchemeAndStackFoundations:SF.5`, `GeneralAlgebraicKTheory:K.2`.

**Sources.** Levine1994, Lemma 2.1, construction preceding Lemma 2.2, and Lemma 2.2 with proof, pp.258–265; Theorem 3.1 and proof, pp.276–278; Theorems 3.3–3.4, pp.279–284: The cycle map includes a projection to the required rational characteristic summand. Theorem 3.3 gives Zariski descent; Theorem 3.4 gives the supported/localization form. The underlying structure-sheaf map alone is not the pure-weight isomorphism. Weibel2013, Lemma V.11.13, p.458; V.11.3, pp.452–453: The universal higher Chern evaluation has the signed factorial on symbols, fixing the normalization used in the relative comparison.

### Universal character and motivic edge comparison

**Node:** `MotivicEtaleKTheory:M.6/chern-character-edge-comparison` (comparison).

For X smooth quasi-projective over a perfect field, the existing rational-weight-comparison θ_{j,m}:K_m(X)_Q^(j)≅H^{2j−m}(X,Q(j)), obtained from the homotopy-coniveau tower with its normalized cycle layer, is precisely ch_{j,m} restricted to weight j. Equivalently, ch_{j,m}=θ_{j,m}∘pr_j on K_m(X)_Q. For the S.7 abstract gamma character, composing with gr_γ^j≅gr_HC^j≅H^{2j−m}(X,Q(j)) gives the same map. The identity at m=0 is the S.7 geometric character and gamma–Chow comparison.

**Hypotheses and conventions.** k is a perfect field; X is smooth quasi-projective and of finite type over k, of dimension d. Disconnected X is treated componentwise. m and j are nonnegative integers. Rational coefficients mean tensoring the integral groups with Q, not replacing the integral cycle complex by its cohomology before deriving sections. The filtered global-model comparison is imported from M.6a; its remaining filtered and product coherence gaps G1 are not discharged by equality of E₂ pages.

**Construction or proof.**

1. Import the full filtered tower, augmentation, normalized layer equivalence and strong convergence; these already have node IDs in the accepted M.5d packet. Retain its finite Adams splitting and the canonical projection pr_j. There is no new spectral-sequence construction here.
2. Under the M.6a layer cycle normalization, the inverse of the rational edge map is the projected multirelative cycle class cyc_{j,m}. Verify this diagram at the support K_0 level and through the FS/Levine filtered comparison, retaining the Adams projector. This is the specific adapter added to the M.6a request; gap G1 prevents treating a group-level identification as the filtered comparison.
3. Apply relative-cycle-normalization: both θ and the universal ch are inverse to that actual cyc on the weight-j group. Off-weight vanishing then proves the equality on all K_m(X)_Q.
4. Use gamma-homotopy-coniveau-comparison and the S.7 gamma-character leading-term identity to identify the abstract gamma character with this map. This is a map comparison; equality of eigenvalues alone would still allow multiplication by any nonzero rational scalar.

**Checks.**

- At m=0 the diagram is the existing S.7 gamma/Chow diagram: [Z]↦[O_Z] modulo the next filtration is the inverse leading term, and [Z]↦pr_j[O_Z] is its pure-weight lift. For a hyperplane in P² this lift is u−u²/2, not u−u².
- At j=m for a field the motivic edge map from Milnor K and ch have composite one after rationalization.
- Do not infer this equality from collapse at E₂: a rescaled isomorphism has the same weights and dimension.
- Prove the same comparison for the filtered FS model only after supplying its augmentation/layer-compatible zigzag.

**Direct prerequisites.** `MotivicEtaleKTheory:M.6/motivic-spectral-sequence`, `MotivicEtaleKTheory:M.6/rational-weight-comparison`, `MotivicEtaleKTheory:M.6a/coniveau-cycle-layer`, `MotivicEtaleKTheory:M.6a/global-model-comparison`, `MotivicEtaleKTheory:M.6b/rational-motivic-degeneration`, `MotivicEtaleKTheory:M.6/relative-cycle-normalization`, `MotivicEtaleKTheory:M.6/gamma-homotopy-coniveau-comparison`, `SchemeKTheoryOperations:S.7/gamma-chern-character`.

**Sources.** Levine1994, Theorems 3.1 and 3.3, pp.276–283: The normalized cycle class supplies a concrete inverse map to be compared, rather than an unnamed rational isomorphism. LevineConiveau2005, Theorem 6.4.2, pp.35–37; Theorem 11.3.2 and Remark 11.3.4, pp.63–64: The homotopy-coniveau layers identify with motivic complexes; this is the layer normalization on the tower route. Weibel2013, VI.4.9 and Exercise VI.4.5, pp.485–486; V.11.11–11.13, pp.457–458: Adams weights split rational K, and universal motivic classes give the character whose actual normalization must be compared.

### Localization and the weight shift in residues

**Node:** `MotivicEtaleKTheory:M.6/chern-localization-residue` (theorem).

The normalized character is a morphism of rational localization sequences in the admitted smooth quasi-projective pairs, with target the supported motivic cycle complex before purity. In particular let R be the local ring at a closed point x of a smooth curve over a perfect field, F its fraction field and κ its residue field. For m≥1,j≥1 the square with K_m(F)_Q→K_{m−1}(κ)_Q and H^{2j−m}(F,Q(j))→H^{2j−m−1}(κ,Q(j−1)) commutes, with vertical maps ch_{j,m} and ch_{j−1,m−1}. Thus the boundary carries Adams weight j to j−1. The residue convention has ∂_K(π)=1 and ∂_M({π,u})=ū for a uniformizer π and a unit u. At j=m=1 the lower character is rank. A general regular immersion requires its supported purity/normal-bundle Todd correction; uncorrected commutation with arbitrary proper pushforward is not asserted.

**Hypotheses and conventions.** k is a perfect field; X is smooth quasi-projective and of finite type over k, of dimension d. Disconnected X is treated componentwise. m and j are nonnegative integers. Rational coefficients mean tensoring the integral groups with Q, not replacing the integral cycle complex by its cohomology before deriving sections. For the DVR specialization, take filtered colimits over smooth quasi-projective curve neighborhoods to define the essentially smooth local ring and fraction field; the finite-presentation cycle/perfect-complex continuity adapters are part of G2/G3. Use the same fibre/cofiber boundary convention in K and cycle complexes. The conormal line of the DVR closed immersion is trivial, so its Todd factor is one.

**Construction or proof.**

1. Form K^Z(X)→K(X)→K(U) and the supported cycle triangle. Apply the coherent universal character to this diagram before taking homotopy/cohomology. The relative supported comparison of relative-cycle-normalization and Levine Theorem 3.4 identifies the resulting boundary maps.
2. Pass to the curve local ring and use codimension-one purity: K_{m−1}^x(R)≅K_{m−1}(κ), while H^{q+1}_x(R,Q(j))≅H^{q−1}(κ,Q(j−1)). The K purity identification shifts Adams weight by one; this is the S.6 residue-weight-shift convention.
3. The normal/conormal line is trivial at this point, so no higher Todd terms occur. Compute the sign with the M.4 cubical differential d=Σ_i(−1)^i(∂∞_i−∂0_i): a symbol with a uniformizer in its last coordinate has localization residue (−1)^{n−1} times the last-entry Milnor residue ∂^last{u_1,…,u_{n−1},π}={ū_1,…,ū_{n−1}}. Moving π to the first coordinate introduces the same sign, so the localization residue of {π,u_1,…,u_{n−1}} is positive. In particular δ{π,u}=ū, whereas the imported T.3 last-entry tame convention gives ∂^last{π,u}=ū^(−1). The square uses the localization convention of S.6, not an unidentified tame-symbol sign.
4. Transport the equality through chern-character-edge-comparison and the S.7 gamma-character comparison to obtain the residue-compatible weight dictionary used by arithmetic consumers. For higher codimension supported pairs retain supported classes until a precise Gysin/RR normalization is supplied.

**Checks.**

- For R=k[t]_(t), the element t∈K_1(k(t)) has boundary 1∈K_0(k); its motivic residue is 1∈H^{0,0}(k,Q).
- For u∈R×, both residues of its degree-one character are zero.
- For {t,u}∈K_2(F), the residue under ch_{1,1} is ū, with the uniformizer first.
- For {u,t}, graded commutativity changes the residue sign in additive notation.
- The formulas do not apply unchanged to a general closed immersion with nontrivial normal bundle.

**Direct prerequisites.** `MotivicEtaleKTheory:M.6/relative-cycle-normalization`, `MotivicEtaleKTheory:M.6/chern-character-edge-comparison`, `MotivicEtaleKTheory:M.4/localization-sequence`, `MotivicEtaleKTheory:M.4/functoriality`, `SchemeKTheoryOperations:S.6/residue-weight-shift`, `SchemeKTheoryOperations:S.6/gysin-weight-shift`, `SchemeAndStackFoundations:SF.5`, `GeneralAlgebraicKTheory:K.2`, `MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro`.

**Sources.** Levine1994, Theorem 3.4, pp.283–284; Theorem 5.2(b), pp.313–316: The supported cycle class commutes with localization. Products and projection formulas use the specified higher Chow product. Weibel2013, V.11.11.1, p.457; V.11.13, p.458; VI.4.3, pp.481–482: Units and symbol normalization fix the sign of the weight-diagonal comparison; the residue weight convention is imported from S.6.

## Worked acceptance examples for the assembled layer

For $X=\operatorname{Spec}F$ and a unit $u$, the diagonal edge map identifies $H^{1,1}(F,\mathbb Z)=F^\times$ with its image in $K_1(F)$. Both $c_{1,1}$ and $ch_{1,1}$ are determinant. On $\{u,v\}$, the second Chern class is the negative Milnor symbol, so the coefficient $a_2=-1$ makes the normalized character positive. On a triple symbol, the Chern coefficient is $+2$ and $a_3=1/2$ again gives the identity. These cases distinguish the chosen normalization from a rescaled edge isomorphism.

For $X=\mathbb P^2_k$, let $h=c_1(O(1))$ and $u=[O(1)]-1$. The degree-zero character sends $[O(1)]$ to $1+h+h^2/2$, and sends $u^2$ to $h^2$. For a hyperplane $D$, the raw structure-sheaf class is $[O_D]=u-u^2$, with total character $h-h^2/2$. The weight-one lift of $[D]$ is instead $\operatorname{pr}_1[O_D]=u-u^2/2$, whose character is exactly $h$. This projection is part of Levine’s cycle map. The rational filtrations have $F^1$ spanned by $u,u^2$, $F^2$ spanned by $u^2$ and $F^3=0$. Nevertheless $c_2(O(1))=0$, whereas $c_2(O(1)\oplus O(1))=h^2$. This checks the distinction between the additive character and the nonlinear degree-zero Chern class.

For the curve DVR $R=k[t]_{(t)}$, the boundary of $t\in K_1(k(t))$ is $1\in K_0(k)$. The motivic boundary lowers $H^{1,1}$ to $H^{0,0}$ and gives the same value. A unit extending over $R$ has zero residue. The symbol $\{t,u\}$ has residue $\bar u$, with the uniformizer first. The relevant character weights are $2$ before that boundary and $1$ afterwards. A square keeping weight $2$ in both rows would have the wrong Tate twist even if its K degrees looked correct.

At a finite field the positive-degree rational K-groups vanish, and only rank survives in degree zero. This agrees with the field acceptance test already attached to the imported M.6 spectral sequence; no infinite-field restriction is introduced by the moving proof. At the empty scheme all groups, products and characters are zero. These checks supplement the eleven definition/construction tests above; they do not replace the filtered construction or the supported comparison proof.

The milestone is accepted only when the following single dictionary commutes: actual filtered tower → normalized cycle layers → finite Adams eigenspaces → the universal higher character → the S.7 gamma character. It must commute with pullback, tensor/cup products and the specified curve residues, and specialize to the existing degree-zero S.7 diagram. M.7 consumes its field and weight conventions; arithmetic-base extensions require their own supplied tower. Regulator and polylogarithmic consumers use these maps without supplying any prerequisite back to M.6.

## Planets and dependency boundary

The new planets are **Motivic Chern classes**, **Higher Chern character**, **Higher Chern character products**, and **Chern character localization**. Together with the two accepted M.6 planets **Motivic spectral sequence** and **Rational K-theory weights**, the assembled layer has six. The relative normalization and filtration comparisons remain full reader targets without additional planets.

S.6 owns scheme lambda/Adams operations and their gamma structure; S.7 owns the geometric degree-zero character, its Chow comparison and the abstract gamma character. M.6 proves the rational comparison of that gamma filtration with the homotopy-coniveau filtration in the smooth perfect-field setting. The argument uses relative $K_0$ moving and finite tower bounds, so it supplies the needed full-filtration bridge in this setting without inferring it from operationwise gamma vanishing. A general supported bound or arbitrary-base bridge remains with its original owners.

GeneralAlgebraicKTheory K.2 owns actual K-space/plus, Hurewicz and universal evaluation infrastructure. SchemeAndStackFoundations SF.5 owns geometric intersections, supported Chern classes, purity and simplicial projective-bundle adapters. Its requested supported normalization is already needed by S.7; M.6 extends the request to cubical nullhomotopies and localization, rather than developing another intersection theory. M.6a/M.6b own all tower-model and filtered-product coherence. M.8 consumes the resulting character before applying étale, Deligne or other realizations; no M.8 regulator theorem is used to prove its own input.

## Gaps and supplier requests

- **G1 — filtered models and products.** Retain the accepted M.6a/M.6b gaps. The global-model zigzag must preserve augmentation and transition maps and identify its rational edge inverse with Levine's actual multirelative cycle map. Its product/Adams comparison must use the same cycle normalization. The same augmentation-compatible comparison transports the Levine/FS gamma-filtration inclusion to the chosen homotopy-coniveau tower; the gamma comparison therefore also depends on G1. An isomorphism on E₂ does not settle this.
- **G2 — coherent universal evaluation.** K-book V.11 verifies the universal group-valued Chern construction. The requested K.2 adapter must evaluate the class on the actual plus/completed K model, preserve derived sections, ordered iterated fibres, localization and the essentially smooth continuity maps. Riou's uniqueness for maps into motivic cohomology requires a different target from the S.6 uniqueness theorem for K-endomorphisms.
- **G3 — supported relative normalization.** SF.5 must extend its existing leading supported Chern-class formula to the relative cube with specified face nullhomotopies. This is the missing map-level input to $ch\circ cyc=1$ and the residue square. Ordinary Chern classes after forgetting supports cannot detect it. Gillet 1981 Definition 2.34(ii), §2.35 and Theorem 3.1, and Gillet–Soulé 1987 Proposition 5.5 are precise source leads; their full supported proofs were not read here. They are not treated as verified inputs.

The packet has four requests: GeneralAlgebraicKTheory K.2, SF.5, M.6a/global-model-comparison and M.6b/filtered-motivic-products. G1–G3 are the remaining items of M.6's planned coverage. The field proof of the gamma comparison is specified through the semilocal Grassmannian argument in Levine, rather than silently treating his printed one-dimensional-base corollary as a field theorem. No extension to singular schemes, arbitrary nonperfect fields or arithmetic bases is claimed by this completion pass.

## Sources and correction discipline

All source statements above are in our own words. Access date for every source is **2026-10-19**; the packet records exact edition, read sections and SHA-256 of the public source consulted. Printed page numbers are used throughout.

- **Weibel2013:** Charles A. Weibel, [The K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), author PDF August 29, 2013. V.11 pp.451–459 supplies the universal construction and symbol normalization; VI.4 pp.479–482, 485–486 supplies the spectral and Adams conventions. In this PDF, add eight to a printed page number to obtain the PDF page.
- **LevineSchemes2001:** Marc Levine, [K-theory and motivic cohomology of schemes, I](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf), December 2001 author preprint. The field scope is discussed on p.2; §§13.1–13.3 pp.59–61, Theorem 13.10/Corollary 13.11 pp.65–68, and Theorem 14.5/Lemma 14.6/Theorem 14.7 pp.70–74 give the filtration comparison route. The existing corrections E6–E8 in M.5d are retained: the finite projector/eigenvalue indices, inclusion direction and Adams weight exponent must use the corrected version. They are not duplicated as new findings here. The full coherent product proof in §11/Appendix D stays a supplier refinement.
- **Levine1994:** Marc Levine, [Bloch's higher Chow groups revisited](https://www.numdam.org/article/AST_1994__226__235_0.pdf), Astérisque 226 (1994), pp.235–320. Lemma 2.1 and the construction preceding Lemma 2.2, with its proof, pp.258–265 supplies its characteristic-summand projector. Theorem 3.1 pp.276–278 constructs the actual relative cycle isomorphism, and Theorem 3.3 pp.279–283 gives Zariski descent; Theorem 3.4 pp.283–284 states its support/localization form. Only the statement and initial proof of 3.4 were inspected. Theorem 5.2 and proof pp.313–316 fix the product sign. These results do not remove the separate universal supported-character gap.
- **LevineConiveau2005:** Marc Levine, [The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334v1), October 16, 2005 version. Theorem 6.4.2 pp.35–37 gives the actual cycle-layer comparison; §11.3 pp.63–65 gives the assembled indexing. This source corroborates the imported tower, rather than creating new tower nodes.
- **Riou2009:** Joël Riou, [Algebraic K-theory, A¹-homotopy and Riemann–Roch theorems](https://arxiv.org/html/0907.2710v2), September 9, 2009 version, §6.2 pp.31–35. Theorem 6.2.1.2 determines maps from $\mathbb Z\times Gr$ into motivic Eilenberg–MacLane spaces; Proposition 6.2.2.1 and Lemma 6.2.3.2 explain the Newton/factorial normalization. Rational coefficients remove the phantom/Ext obstruction in the relevant stable operation system; no integral uniqueness is inferred. The readable HTML was used because text extraction of the matching PDF was defective.

**Source issue E-M6-1.** The K-book VI.4.3, printed p.481, assigns coefficient $-2$ to its degree-three étale Chern composite on Milnor symbols. The universal convention in V.11.13 gives $+2$, and V.11.12(4) identifies reduction with the étale classes. Applying the negative product coefficient twice also gives $+2$. The correction changes no exponent conclusion of that paragraph. The author's linked errata PDF returned 404 on the checked Rutgers hosts, and a targeted search found no verified correction; the existence of a published correction remains unestablished. This is recorded in the packet, with its locator, reasoning and search history, without copying source text.

**Source issue E-M6-2.** In the proof of V.11.11, printed p.459/PDF p.467, the first localization term must use the closed bundle $P(F′)$, of codimension $n″$, rather than $P(F″)$. Its weight $n′$ is correct; the open term still uses $P(F″)$. This bundle typo is already recorded as K3BlochGroups/E31. The later displayed Chern polynomials also omit powers of $ξ$ from their coefficient terms. Use $C_E(T)=Σ_{i=0}^r(−1)^i c_i(E)T^{r−i}$ for rank $r$, with $c_0=1$, and $C_F=C_{F′}C_{F″}$. This restores the homogeneous bidegrees and the intended Whitney proof. Both slips were checked on the page image; no published correction was verified. They are recorded for the author copy, without reproducing its prose.

## Suggested file and completion check

The standard suggested-file note and declaration catalogue explain the carrier boundary. The real-bodied scalar `TauCeti.MotivicKTheory.higherChernCoefficient` is defined on natural numbers with values in the existing rationals. Its two named theorem targets state cancellation and recurrence; two proved examples check cancellation of the negative double-symbol and positive triple-symbol Chern factors. The full six normalization tests remain in the reader. The file uses `import Mathlib` and has no admitted examples. This deliberately small file contains no simulated K-theory or motivic-cohomology carrier, no unproved data definition, and no chain of auxiliary theory. The full seven mathematical targets, their hypotheses and checks are the reader specification above. The headline is the actual edge/universal-character comparison; neither pinned library provides its higher-K and motivic carriers, so that theorem remains an explicit reader target, as in the current JacobianChallenge precedent, until those carriers exist. The file states the strongest available normalization milestones without substituting arbitrary groups or maps for that headline.

The packet checker, Lean elaboration result, source checks and exact remaining work are recorded in [the review handoff](../handoff/REV-MotivicEtaleKTheory--M.6.md). A review must assess both the actual map comparisons and the explicit supplier gaps; successful scalar elaboration alone says nothing about closure of motivic theory.

## Independent review

[REV-MotivicEtaleKTheory--M.6](../reviews/REV-MotivicEtaleKTheory--M.6.md), 2026-10-19, accepts this target-level plan after correction. In particular the cycle inverse retains its Adams projection, the product proof uses motivic-target uniqueness with several operands, and the residue convention is translated explicitly from the last-entry Milnor convention. The source findings E-M6-1 and E-M6-2 are confirmed for the recorded author copy. Coverage remains planned with G1–G3; no formalization or closed supported proof is claimed.
