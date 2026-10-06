# Arithmetic K-theory N.2: localisation and ramified restriction

This part completes the mathematical plan for the contravariant compatibility left open by the accepted [N.1 packet](../packets/ArithmeticKTheory--N.1.json). Its scope is exactly `ArithmeticKTheory:N.2`. The central result is a morphism of localisation sequences for a finite extension of number fields. On a residue-field summand the pullback is residue restriction multiplied by the **ramification index**. Establishing that coefficient in every degree requires a filtration of exact functors before residue dévissage; checking a valuation formula alone does not establish the higher-degree result.

The packet contains five new targets: the residue-sum construction, its identification with flat pullback through dévissage, the morphism of full sequences, the arithmetic comparisons in low degrees, and the S-integer application with tower and enlargement compatibility. Existing N.2 nodes in the N.1 packet remain their interfaces. No node id from that packet is redefined.

The plan imports the general Dedekind localisation sequence and its valuation boundary from `SchemeKTheoryOperations:S.3`. It imports the degree-two tame-kernel sequences, including injectivity, from `K2SymbolsBrauer:T.5`. It also preserves the earlier finite-support, covariant-transfer and degree-specific-injectivity plans. These ownership boundaries implement the two confirmed red-team findings assigned to this job. The imported suppliers are plans with unchecked implementation status; in particular the T.5 interfaces occur in the partial T.3 packet, whose review still requests changes. Their presence is sufficient to identify the mathematical supplier without duplicating its work.

## Carriers, hypotheses and normalisations

Start with an injective finite map of Dedekind domains A ⊂ B. Let F and L be compatible fraction fields, with F ⊂ L. Assume B is flat over A. For these domains finite torsion-free B is projective over A, so the hypothesis follows in the arithmetic application. State flatness in the general comparison because tensoring arbitrary finitely generated modules must preserve exact sequences. Extension of scalars on finitely generated projectives needs no such extra hypothesis, as the imported K.2:plus scalar-extension node explains; that distinction does not remove flatness from the torsion-category argument.

A prime p means a nonzero prime ideal of A, and q means a nonzero prime ideal of B. Use Mathlib's `IsDedekindDomain.HeightOneSpectrum` to index them. The contracted prime p = q ∩ A is nonzero: integrality and injectivity ensure that the generic prime cannot acquire a nonzero prime above it. The finite algebra has finite prime fibres, supplied by `Algebra.QuasiFinite.finite_primesOver`. Thus each q has a unique p below it and each p has finitely many q above it. Neither a normal extension nor equal ramification indices among the primes above p is assumed.

Write k(p) = A/p and k(q) = B/q. The ring map induces an embedding of residue fields k(p) ⊂ k(q). These quotients agree with the residue fields of the corresponding local DVRs. Let

\[
e(q/p)=\operatorname{length}_{B_q}(B_q/pB_q).
\]

This is the **unprimed** Mathlib `q.ramificationIdx A`. For the nonzero primes in question the length is finite and positive. The existing factor-count theorem identifies this length with the exponent of q in pB. The earlier two-ideal definition `p.ramificationIdx' q` is converted to this one by `Ideal.ramificationIdx'_eq_ramificationIdx`; it is not silently treated as another name for the same function. The tower theorem requires flatness of the next extension and gives e(r/p) = e(q/p)e(r/q).

All K-groups are connective Quillen groups in nonnegative degrees. K_n(A) means K-theory of finitely generated projectives. G_n(A) means K-theory of finitely generated modules. The imported regular-ring comparison identifies them for A, B and their fraction and residue fields. The finite-length torsion category is an exact abelian category; its K-theory is identified with the residue direct sum by dévissage. The distinction between its K-theory and the K-theory of an artinian quotient ring is essential to the proof.

Use additive notation for every K-group, including K_1 of a field. Under the determinant identification K_1(k) ≅ k×, repeated addition by e becomes the e-th power of a unit. The residue degree f(q/p) = [k(q):k(p)] is a different integer. It appears in rank computations for restriction of scalars, whereas the residue arrow of **pullback** uses e. The map between the integral K-groups and the map between the fraction-field K-groups are ordinary extension of scalars.

The degree-one boundary uses normalised additive order v_p, with v_p(π) = 1. Mathlib's `HeightOneSpectrum.valuation` is multiplicative, so its ramification identity is converted to additive order rather than read as an equation of additive valuations. The class-map convention is [A/p] = [A] − [p] in K_0(A). Under K_0(A) ≅ ℤ ⊕ Pic(A), this is (0, [p]⁻¹).

## What the stage imports

The original stage asks for the full sequence, finite support, field-extension compatibility, the degree-zero to degree-two interpretations, the S-unit and ideal-class sequences, and the particular injectivity and odd-degree isomorphism theorems. Each target has an explicit owner:

| Target | Exact interface used here |
| --- | --- |
| Generic Dedekind sequence | `SchemeKTheoryOperations:S.3/dedekind-localisation-sequence` |
| Unit boundary and its sign | `SchemeKTheoryOperations:S.3/dvr-boundary-unit-valuation` |
| Tame-boundary identification | `K2SymbolsBrauer:T.3/localization-boundary` |
| Arithmetic indexing and the classical rows | N.1 packet's `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain` and `…/the-three-classical-rows` |
| Finite support of the boundary | N.1 packet's `ArithmeticKTheory:N.2/finite-support` |
| Covariant finite-extension compatibility | N.1 packet's `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions` |
| S-unit and class-group sequences, including enlargement | N.1 packet's `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence` |
| Degree-two exact rows | `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `…/s-integer-tame-kernel-sequence`, `…/relative-s-integer-sequence` |
| Even-degree injectivity and the degree-zero exception | N.1 packet's `ArithmeticKTheory:N.2/even-degree-injectivity` |
| Odd-degree isomorphisms for n ≥ 3 | `ArithmeticKTheory:N.5/soule-theorem`, retaining its recorded finite-coefficient input gap |

The new nodes supply the remaining contravariant extension compatibility. General exact-category K-groups and their functoriality come from `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`; ring scalar extension comes from `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`. The proof imports the precise K.3 additivity, dévissage and functorial abelian-localisation nodes. It does not reconstruct the Q-construction, a localisation boundary or a theory of exact categories.

This creates the S.3 → N.2 dependency through actual node prerequisites. The T.5 → N.2 dependency similarly follows from the degree-two comparison's imports. Atlas data and the N.1 packet are not edited. N.6's presentation certificates and N.8's explicit K₂ computations belong to their own jobs; this packet adds neither those calculations nor another tame-kernel definition.

The odd-degree target has a separate dependency boundary. N.5's Soulé theorem uses finite generation and finite-coefficient arguments, and is not an input to constructing localisation or proving restriction compatibility. Keeping it outside the new prerequisite chains avoids the N.2 → N.3 finite-generation → N.2 cycle. The inherited finite-coefficient gap is recorded because the stage explicitly asks for the odd-degree result, even though none of the five new nodes needs it.

## The residue-sum construction

The construction node `ArithmeticKTheory:N.2/ramified-residue-pullback`, proposed declaration `ramifiedResiduePullback`, defines

\[
\rho_n^{B/A}:\bigoplus_p K_n(k(p))\longrightarrow\bigoplus_q K_n(k(q)),
\qquad
\rho_n^{B/A}(\iota_p x)
 =\sum_{q\mid p}\iota_q\bigl(e(q/p)\,\mathrm{res}_{k(q)/k(p)}x\bigr).
\]

For a fixed p the sum is finite. It defines an additive homomorphism on that summand, and the universal property of Mathlib's dependent `DirectSum` extends these homomorphisms uniquely. At an arbitrary q the formula is

\[
(\rho_n^{B/A}x)_q=e(q/p)\,\mathrm{res}(x_p),\qquad p=q\cap A.
\]

If this coordinate is nonzero, x_p is nonzero. Consequently the support of the image is contained in the inverse image of the input support. That inverse image is a finite union of finite prime fibres. This supports a map into the direct sum without requiring an infinite summation or introducing a separate finiteness predicate on K-classes.

The construction has a useful independent group-theoretic form. Given source indices P, a finite type Q(p) for the fibre above each p, additive groups G(p) and H(p,q), coefficient homomorphisms r(p,q), and natural weights e(p,q), the same formula defines a homomorphism from the dependent sum of G to the sum indexed by pairs (p,q) of H. This is precisely the part that can be expressed against the pinned library. In the arithmetic instance the fibre type is the subtype of actual primes lying over p, the weight is the existing ramification index, and the coefficient maps are actual residue-field K-theory restrictions. The template does not define those missing K-theory maps.

The API derives from the full-sequence comparison, its low-degree applications, the finite-support requirement and tower coherence:

| Proposed API name | Mathematical contract |
| --- | --- |
| `ramifiedResiduePullback_of` | Value on the inclusion of a p-summand is the displayed finite sum. |
| `ramifiedResiduePullback_apply` | The q-coordinate is e(q/p)res(x_p). |
| `ramifiedResiduePullback_unique` | An additive homomorphism with those generator values equals ρ. |
| `ramifiedResiduePullback_support` | A nonzero output coordinate forces a nonzero coordinate at its contracted prime; combine this with finite fibres for the support bound. |
| `ramifiedResiduePullback_zero` | The zero element maps to zero. |
| `ramifiedResiduePullback_add` | The map preserves addition. |
| `ramifiedResiduePullback_id` | A singleton fibre with weight one and identity coefficients acts identically after the canonical reindexing. |
| `ramifiedResiduePullback_tower_apply` | For r above q above p the composite coordinate is e(q/p)e(r/q)res(x_p); the arithmetic tower identity identifies it with the direct map. |

The identity and tower contracts include the index reindexing. The generic target uses pairs (p,q), while the arithmetic target uses primes q. In a two-step generic template, ((p,q),r) is reindexed as (p,(q,r)); the corresponding arithmetic fibre identification follows from uniqueness of contraction. Coordinate equalities determine the resulting homomorphisms. No claimed equality hides two differently indexed sums.

The six unit tests use the proposed names `ramifiedResiduePullback.test_zero`, `.test_identity`, `.test_ramified`, `.test_split`, `.test_inert` and `.test_units`. They require respectively: zero maps to zero; singleton weight one sends x to x; singleton weight two on ℤ sends 1 to 2; two singleton-weight branches send x to (x,x); singleton weight one sends 3 to 3 rather than 6 even in the residue-degree-two model; and weight three on the unit group of ℤ/5ℤ sends 2 to 3. The last test reads 2³ = 3 modulo 5. Together these distinguish omission of the weight, multiplication by residue degree, loss of one split-prime component and misuse of additive notation for units.

## The all-degree ramification calculation

The theorem node `ArithmeticKTheory:N.2/ramification-weighted-devissage`, proposed declaration `ramificationWeightedDevissage`, identifies the construction with actual flat pullback. Let Tor(A) be the category of finitely generated torsion A-modules. Dévissage gives isomorphisms

\[
D_A:\bigoplus_p K_n(k(p))\simeq K_n(\operatorname{Tor}(A)),
\qquad
D_B:\bigoplus_q K_n(k(q))\simeq K_n(\operatorname{Tor}(B)).
\]

The asserted equation for every n ≥ 0 is

\[
D_B^{-1}K_n(B\otimes_A -)D_A=\rho_n^{B/A}.
\]

It is enough to compute the exact functor on the p-summand. For a finite-dimensional k(p)-vector space V, its pullback as a torsion module is V ⊗_{k(p)} (B/pB). Since pB is nonzero, factorisation and the existing Chinese remainder equivalence identify B/pB with the finite product of B/q^{e(q/p)} over q above p. This decomposition is one of coefficient modules, and therefore gives a natural direct-sum decomposition of the functor on V.

Fix a q-block and write e = e(q/p). Filter B/q^e by the submodules q^j/q^e, from j=e down to j=0. Each successive quotient q^j/q^{j+1} is a one-dimensional k(q)-vector space. To verify this assertion, localise at q. B_q is a DVR, and a choice of uniformizer identifies its successive ideal-power quotients with its residue field. B/q^e is an artinian local ring, so elements outside q are already units there; its module and the associated quotients are unchanged by that localisation. The DVR quotient-length theorem confirms that there are exactly e residue-field layers. This argument applies to wild and dyadic ramification as well as tame ramification.

Tensor the filtration with V over k(p). All coefficient modules are k(p)-vector spaces. Hence tensoring preserves every short exact sequence involved, and every filtration functor and associated quotient functor is exact on the source category of finite-dimensional k(p)-vector spaces. Choose a basis of each one-dimensional k(q)-line. It identifies that quotient functor naturally with residue extension of scalars V ↦ k(q) ⊗_{k(p)} V, followed by the inclusion into Tor(B). Different choices give naturally isomorphic exact functors and therefore the same map on K-groups.

The imported admissible-filtration additivity theorem now adds the e associated quotient maps. Each map is residue restriction, so the q-block contributes e times that restriction on **every** K_n. Summing the finitely many q-blocks and using the direct-sum universal property proves the equation.

There are two pitfalls the proof contract explicitly excludes. First, dévissage of finite-length modules gives G(B/q^e) ≅ K(k(q)); it does not give K(B/q^e) ≅ K(k(q)) for a nonregular thickening. Second, the functor M ↦ M/qM on arbitrary artinian modules is not exact. Weibel's V.4.2.1 explicitly warns that admissible-filtration additivity cannot be applied to that functor. Here the source is instead a residue-field vector-space category, and the filtration consists of tensoring with fixed coefficient modules over a field. Its exactness is proved before additivity is invoked.

## A morphism of complete localisation sequences

The theorem node `ArithmeticKTheory:N.2/finite-extension-restriction-compatibility`, proposed declaration `finiteExtensionRestrictionCompatibility`, applies the calculation to the imported sequence

\[
\cdots\longrightarrow\bigoplus_p K_n(k(p))
\xrightarrow{i_{A,n}}K_n(A)\longrightarrow K_n(F)
\xrightarrow{\partial_A}\bigoplus_p K_{n-1}(k(p))\longrightarrow\cdots.
\]

The sequence for B and L receives vertical arrows ρ_n on the residue sums, extension of scalars on K_n(A), and extension of scalars on K_n(F). Every square commutes. In particular,

\[
\partial_B\mathrm{res}_{L/F}=\rho_{n-1}^{B/A}\partial_A\quad(n\geq1),
\qquad
\mathrm{res}_{B/A}i_{A,n}=i_{B,n}\rho_n^{B/A}\quad(n\geq0).
\]

The integral-to-field square also commutes, including the terminating K_0 row. These assertions specify a morphism of the whole sequence, rather than just its boundary square or a formula on symbols.

Construct the comparison before residue dévissage. Tensoring gives an exact functor Tor(A) → Tor(B) and an exact functor of all finitely generated modules because B is flat. It preserves finite generation, and injectivity A → B ensures that an annihilating nonzero scalar remains nonzero. On the Serre quotient, the resulting functor is fraction-field extension of scalars F → L. The canonical tensor-associativity isomorphisms make this an exact functor of Serre pairs. The precise K.3 functorial localisation theorem gives a diagram of fibre sequences and its compatible homotopy-group boundaries. The imported regular-ring comparisons identify the middle and generic arrows with ordinary K-theory restriction. The preceding dévissage theorem computes the remaining arrow as ρ.

The existing finite-support theorem supplies the direct-sum codomain of each boundary. The new finite-fibre support bound shows that restriction preserves this property. Exactness itself yields no claim that every K_n(A) → K_n(F) is injective. Degree zero retains the Picard kernel, degree two imports the arithmetic tame-kernel row, even positive degrees use their finite-residue-field input, and odd degrees at least three require the separately owned Soulé theorem.

## Low degrees and the boundary convention

The comparison node `ArithmeticKTheory:N.2/low-degree-ramified-restriction`, proposed declaration `lowDegreeRamifiedRestriction`, specialises the new residue arrow through the existing rank and determinant identifications. On residue K_0 its q-coordinate is e(q/p)x_p. On residue K_1 its q-coordinate is res(u_p)^{e(q/p)}. Thus the degree-one boundary square is v_q(x) = e(q/p)v_p(x). This agrees with the pinned multiplicative valuation-power statement after the stated conversion of conventions.

For degree two fix the K-book's right-linear convention, which the existing T.3 comparison explicitly distinguishes from its left-oriented tame symbol. Write β_p for the imported boundary. It satisfies β_p{π,u} = ū and

\[
\beta_p\{a,b\}
=(-1)^{v_p(a)v_p(b)}
\overline{b^{v_p(a)}/a^{v_p(b)}}.
\]

It is the inverse of the left-oriented `tameSymbol(a,b)` in that packet. The extension formula is

\[
\beta_q(\mathrm{res}\,z)=\mathrm{res}(\beta_p z)^{e(q/p)}.
\]

For symbols this has a direct arithmetic check. If the source orders are r and s, the target orders are er and es. The unit factor in the image of a source uniformizer cancels in the quotient. The target sign exponent e²rs differs from the source sign raised to e, with exponent ers, by e(e−1)rs, an even integer. The same e-th-power formula holds when both boundaries use the left-oriented convention. No sign change is allowed in only one row of the comparison.

At p=5 in ℤ the right-linear boundary of {5,2} is 2; the left-oriented tame symbol is 3. In an e=3 extension with unchanged residue field these become 3 and 2 respectively. This check prevents a correct-looking power formula from concealing an inconsistent choice of boundary orientation.

On the integral K_0 row, extension of the divisor ideal is pB = ∏_{q|p}q^e. The source class [A]−[p] pulls back to [B]−[pB]. The coefficient filtration identifies this with the sum of e(q/p)([B]−[q]). Thus the comparison preserves the inverse-Picard convention rather than changing the sign of the class-group arrow.

The degree-two arithmetic exact sequence and its injectivity are supplied by T.5's three exact nodes. Its S-integer row has residue terms **outside** S; its relative row comparing O_F and O_{F,S} has residue terms **inside** S. These are different rows. The earlier N.2 finite-extension node is covariant transfer from B to A, with sums of residue transfers or norms. It has no e multiplier. For a residue K_0 transfer the multiplier is f; this offers an additional check that the two directions have not been confused.

## S-integers, towers and enlargement

The application node `ArithmeticKTheory:N.2/s-integer-restriction-compatibility`, proposed declaration `sIntegerRestrictionCompatibility`, takes a finite extension of number fields L/F and a finite set S of nonzero primes of O_F. Set

\[
T=\{q\text{ of }O_L:q\cap O_F\in S\},
\qquad A=O_{F,S},\quad B=O_{L,T}.
\]

Use the existing `S.integer` carrier. The N.1 finite-extension lemma supplies that B is finite projective over A with fraction field L. Tau Ceti's `integerHeightOneSpectrumEquiv` identifies the primes of A with p outside S and those of B with q outside T. Localisation leaves the residue fields and local rings at those primes unchanged, and the pinned valuation-preservation lemma fixes their normalisation. The general restriction comparison therefore gives the arithmetic sequence with q-coordinate e(q/p)res(x_p).

The requirement that T be the full inverse image is part of the finite-projective hypothesis. If a larger upper set T₁ is chosen, factor A → O_{L,T} → O_{L,T₁}. The first map has the finite-extension comparison and the second has the existing localisation/enlargement comparison. Project away the additional q-summands. This gives the contravariant map for the larger upper set without asserting that the resulting upper ring is finite over A or assigning it a finite-module transfer.

For a tower M/L/F use full inverse-image prime sets at each step. At a final prime r there is a unique q and p below it. The composite residue coordinate is e(q/p)e(r/q)res(x_p), and the ramification tower theorem identifies it with e(r/p)res(x_p). Residue restriction composes, so this is equality of the actual maps under the canonical reindexing. Indices 2 and 3 give index 6; the statement does not require the tower to be Galois.

For S ⊆ S₁ let T and T₁ be the corresponding full inverse images. Enlargement discards the p-summands inverted by S₁ and the q-summands inverted by T₁. Every q above an inverted p is inverted, and all other local coefficient maps and weights are unchanged. Weighted pullback and projection therefore commute coordinatewise. The full sequence squares, including the S-unit and class-group specialisations, follow from the imported enlargement comparison and the new restriction theorem.

Arithmetic acceptance examples use ℤ ⊂ ℤ[i]. Above 2, e=2 and the residue rank arrow is multiplication by 2; above 3, e=1 and f=2, so that arrow is the identity; above 5 there are two primes, both with e=1, so it is the diagonal map. Inverting 2 on the base removes (1+i) above it and both residue terms disappear. These three behaviours test ramification, residue degree and splitting independently, including a wildly ramified dyadic prime.

## Evidence, suggested signatures and completion boundary

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Seventeen relevant declarations were read at these commits and are recorded in the packet. They supply the direct-sum universal property, prime carriers, finite prime fibres, ramification as local length, ideal factorisation and the Chinese remainder equivalence, DVR localisations and quotient lengths, valuation restriction, and the existing S-integer spectrum comparisons. Searches of the pinned sources and declaration index found exact and abelian Grothendieck K_0 groups, but no higher Quillen K functor or localisation-boundary types; the reviewed N.2 audit also identifies these as missing.

The primary text read is Charles Weibel's [author-hosted Chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), retrieved on 6 October 2026. Its SHA-256 in the packet fixes the retrieved version. Locators use printed chapter pages, not offsets in a combined-book PDF: V.1.8 on page 9 supplies admissible-filtration additivity; V.4.1–4.4 on pages 33–34 supply dévissage and its exactness warning; V.5.1 on pages 35–37 supplies abelian localisation; V.6.6 on pages 41–42 supplies the Dedekind sequence, boundary normalisation and the opposite-direction transfer comparison. The contravariant ramification formula is an explicitly derived consequence of those results and the coefficient filtration, not a theorem claimed to appear verbatim in V.6.6.4.

Five already registered source corrections, ArithmeticKTheory/E2–E6, are preserved at this standalone chapter's locators. They concern the two grammatical slips in V.6.6, the finite-generation hypothesis in the general V.6.8 proof, the overstatement about degree-one finite-coefficient surjectivity, and the missing coefficients and boundary variable in V.6.8.1. These are inherited findings, with no claim of a newly discovered error or a correction in the published edition. The new restriction argument does not use the erroneous finite-coefficient formulas.

The [suggested file](../suggested/ArithmeticKTheory--N.2.lean) gives the finite-fibre dependent-group construction, all eight API signatures and six unit-test examples against individual Mathlib imports. It elaborates with placeholder-proof warnings only. It states the four higher-K target names and their exact missing type requirements in comments; it supplies no surrogate K-group definition, assumed comparison equation or proposition field encoding a desired theorem. The compile validates those available signatures and examples, not the all-degree K-theory statements or their proofs.

Three new planets are proposed: **Ramified residue pullback**, **Ramification and dévissage**, and **Localisation and restriction**. Together with the earlier localisation-sequence planet they remain below the six-planet limit for the layer. Acceptance requires the generator and coordinate formulas, support containment, identity and tower maps, both full-sequence residue squares, the degree-zero and unit comparisons, the fixed tame-boundary convention, and the S-enlargement comparison. Matching abstract groups without matching these maps does not meet the contract.

The packet's planning pass is complete and N.2 has coverage `planned`. The finite-extension restriction gap is fully decomposed. There are no new supplier requests, because precise supplying nodes exist for all five new targets. One inherited gap remains in the N.5 odd-degree theorem. The current `KTheoryFiniteLocalFields:L.1/k-theory-mod-m` and `…/bott-element` nodes supply the coefficient object, module structure and natural Bott element, so the older claim that no stage owns any finite-coefficient theory is no longer repeated. N.5 must reconcile those suppliers and complete the residual generic finite-coefficient localisation, product and degree-one-injectivity contracts before its full odd-degree target is counted closed. This does not require another proof of the N.2 ramification calculation. Assembly must preserve the imported S.3 and T.5 ownership and the two distinct variance directions.
