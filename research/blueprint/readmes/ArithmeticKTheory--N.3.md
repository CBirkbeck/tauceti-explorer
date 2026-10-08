# K-theory of number fields and S-integers: finiteness and ranks

This is the N.3 follow-up to the accepted [N.1 packet](../packets/ArithmeticKTheory--N.1.json). Its scope is exactly `ArithmeticKTheory:N.3`, including the number-field finite-generation and rank targets described by the two child layers. The [packet](../packets/ArithmeticKTheory--N.3.json) is a finished target-level pass: **complete**, with this stage **planned**, not closed. One generic H-space ownership gap remains; there are no direct supplier requests in this packet. Existing H.1 homology declarations are imported. All declarations are implementation-**unchecked**, and this revision awaits independent re-review.

The six endpoint declarations, the rank filtration, proper-layer poset, suspended-building comparison, and rank spectral sequence already belong to the parent packet. They retain their IDs. This document retains arithmetic homology specializations and a canonical map-level rational comparison, sharing the generic homology proof with the now-accepted [finite-generation sibling](../packets/ArithmeticKTheory--N.3-finite-generation.json); it does not replace those constructions or write another Borel rank proof. The parent's function-field/curve nodes and their unread Grayson–Quillen input are outside the number-field targets of this issue.

## Conventions and existing library

Fix a number field `F`. Write `A = 𝓞_F`, `r₁ = NumberField.InfinitePlace.nrRealPlaces F`, and `r₂ = NumberField.InfinitePlace.nrComplexPlaces F`. A set `S` of finite primes is a set of `IsDedekindDomain.HeightOneSpectrum A`; these are **nonzero** prime ideals. Use Mathlib's subalgebra `S.integer F` for `𝓞_{F,S}`, not a second S-integer type. Each finiteness result specifies that `S` is finite. The fraction field is `F`.

Use the supplier's exact category `P(A)` of finitely generated projective modules and its actual Quillen `Q`-construction. The base point of `BQ(P(A))` is the zero projective. The parent full subcategory `Q_m` consists of objects of rank at most `m`. Its zero stage is **equivalent** to the terminal category; distinct isomorphic zero objects need not be literally equal. Each positive-rank stratum has one component per Steinitz class, not just the free module component.

Integral homology is indexed by nonnegative total degrees. In the relative calculation, `H_j(Aut(P); St)` is zero when the integer `j` is negative. Do not implement `H_{i−m}` using truncated natural-number subtraction: it would produce a false `H₀` contribution above the diagonal. The Steinberg module is integral and includes its group action. The rank-one proper-layer poset has two points and reduced `H₀ = ℤ`; this convention is imported from the corrected parent.

The genuine higher K carrier comes from `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`: `K_n(A) = π_{n+1}BQ(P(A))`, including `n = 0`. Direct sum makes `BQ` a connected homotopy associative, homotopy commutative H-space. **It is not simply connected:** `π₁BQ = K₀(A)`. The imported early `K.2:plus/plus-equals-Q` comparison is

\[
\Omega BQ(P(A))\simeq K_0(A)\times BGL(A)^+.
\]

Thus `K_n(A) = π_n BGL(A)^+` for `n ≥ 1`, with the selected component understood. This comparison supplies the stable-general-linear interpretation of the arithmetic argument. No extra GL homological stability bound is claimed by the rank-filtration theorem below.

Use the native tensor product `V_n(R) = ℚ ⊗_ℤ K_n(R)` and its ℚ-module structure from the first factor. Rank means `dim_ℚ V_n(R)`. Mathlib's `TensorProduct.AlgebraTensorModule.lTensor ℚ ℚ` gives the ℚ-linear rationalization of the integer-linear K map; `Module.Flat.lTensor_exact` and `IsLocalization.flat` supply exact rationalization. These are existing declarations, not new arithmetic definitions.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Nineteen actual declaration statements were read at these commits and checked against the pinned declaration index: the original fourteen arithmetic/algebra inputs and five prototype inputs added in this revision. In particular:

| Existing declaration | What it supplies, and its boundary |
| --- | --- |
| `NumberField.RingOfIntegers.instFintypeClassGroup` and `ClassGroup.equivPic` | Finite `Pic(𝓞_F)` for the projective-class sum. |
| `NumberField.Units.finrank_eq` | Actual Dirichlet rank theorem for `S = ∅`; the definition `Units.rank` alone does not prove it. |
| `Set.unit_fg_of_units` (Tau Ceti) | Classical S-unit finite generation from finite `S` and finitely generated base units. It does not identify `K₁` with units or compute the nonempty-S rank. |
| `IsDedekindDomain.finite_integer_classGroup` (Tau Ceti) | Classical S-integer class-group finiteness; the K₀ comparison remains the low-degree supplier's. |
| `Submodule.fg_of_fg_map_of_fg_inf_ker` | Finite generation of an extension. Subgroups are finitely generated over the noetherian ring ℤ. |
| `LinearEquiv.ofBijective` | A native equivalence retaining a specified bijective linear map. |
| `CategoryTheory.nerve`, `SSet.toTop`, `HomotopyGroup`, `SSet.homologyFunctor` | Existing nerves, realization, cube-loop homotopy quotients and integral simplicial homology; Q-spans and the realization comparison remain owner constructions. |
| `HomotopyGroup.mapHom` (Tau Ceti) | The actual positive-dimensional based induced homomorphism; its compiled module is absent from the shared build, so the prototype fixes the same quotient action using Mathlib imports. |

An exact-pin source search found no genuine higher `KGroup`, `QCat`, `BGLPlus`, arithmetic Steinberg carrier, or rank filtration in Tau Ceti. Existing exact structures, finite-projective modules and split K₀ are inputs to their owners, not substitutes for higher K.

## Sources and reading boundary

The source inventory, exact SHA-256 hashes and reading locators are in the packet. Revision 2 accessed the same files on **8 October 2026** and rechecked Quillen §1, pp.179–185; Weibel IV.6.1–6.4, pp.318–321, IV.6.8–6.9, p.325, V.6.1, p.406 and V.6.6–6.6.4, pp.409–410; and Kahn §§4.1–4.3.4, pp.15–18. The fuller original-pass reading records below remain provenance, not claims of a new complete rereading.

1. Daniel Quillen, lecture text prepared by Hyman Bass, [*Finite generation of the groups K_i of rings of algebraic integers*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), LNM 341 (1973), pp.179–198. The original pass read the complete paper: §1's statements and arithmetic proof, §2's building argument, §3's categorical homology proof and maximal-order passage. The displayed stability bound on p.182 was also inspected as a rendered page. In this collected scan, one-based PDF page equals source page plus eight; the extra upper page header is the collection's pagination.
2. Charles Weibel, [*The K-book*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), combined draft dated 29 August 2013. The original pass read IV.1.12–1.18 for finite fields and Borel ranks, IV.6.8–6.9 for the criterion, IV.7.1–7.2's Q/plus statement and proof setup, V.6.1 for finite localization, and V.6.6–6.6.4 for field localization and transfer. One-based PDF page is book page plus eight. The generic Q/plus proof is supplied by K.2:plus; it is not decomposed again here.
3. Bruno Kahn, [*Around Quillen's theorem A*](https://arxiv.org/pdf/1108.2441v3), version 3 of 2 July 2014. The original pass read the coefficient/cellular interfaces in §§1.3.5 and 2.4.1 and the rank argument in §§4.1–4.3.4, pp.15–18. In particular the rank-one case and Vogel's comparison of relative sequences preserve the parent's indexing.

The parent already records the erroneous field-versus-ring finiteness statement in Weibel VI.8.1 as `ArithmeticKTheory/E15`. The present proof uses the corrected parent endpoint and the localization sequences; it does not use that sentence as evidence or duplicate the source-issue record. The independent review confirmed two harmless misprints in Kahn v3: E25 at Proposition 4.2.4, p.16, uses the wrong generic fibre in an equality; the zero pure subsheaf of the structure sheaf exposes the printed mistake, and the preceding argument supplies the intended correction. E26 at §4.3.4, p.18, misspells the fibration term. This revision rechecked both loci and retains their confirmed records and version scope. Neither changes a result; no further mathematical mistake was found in the rechecked passages.

## Targets supplied by the parent

The following are imports from `ArithmeticKTheory--N.1.json`, rather than new nodes. Within this table `N.3:` abbreviates `ArithmeticKTheory:N.3:`.

| Target and existing node | Exact range |
| --- | --- |
| `N.3:finite-generation/quillen-finite-generation-theorem` | `K_n(𝓞_F)` finitely generated for `n ≥ 0`. |
| `N.3:finite-generation/finite-generation-of-K-of-S-integers` | `K_n(𝓞_{F,S})` finitely generated for finite `S`, `n ≥ 0`. |
| `N.3:ranks/borel-rank-theorem` | Canonical rational ring/field comparison and period-four ranks for `n ≥ 2`; a separate degree-one statement. |
| `N.3:ranks/even-K-groups-of-S-integers-are-finite` | `K_{2i}(𝓞_{F,S})` finite for `i ≥ 1`. |
| `N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion` | `K_{2i}(F)` infinite torsion for `i ≥ 1`. |
| `ArithmeticKTheory:N.3/finiteness-and-ranks-combined` | For `n ≥ 2`, a noncanonical decomposition `K_n(𝓞_{F,S}) ≅ ℤ^{ρ(n)} ⊕ (finite group)`. |

Here

\[
\rho(n)=\begin{cases}
r_1+r_2&n\equiv1\pmod4,\\
r_2&n\equiv3\pmod4,\\
0&n\text{ even},
\end{cases}\qquad n\ge2.
\]

The order rank theorem is imported from `BorelRegulators:R.3/division-order-rank-period`, specialized to `𝓞_F`. Nonempty S-integer rings are not finite ℤ-modules, so that order theorem does not apply directly to them. The localization argument below is essential. In degree one, `KTheoryLowDegrees:U.4` supplies determinant, `SK₁ = 0`, and its `s-unit-theorem`, giving rank `r₁+r₂+|S|−1`. Inverting a prime changes this rank: `K₁(ℤ) → K₁(ℤ[1/p])` has cokernel ℤ.

Finite generation plus rational rank zero makes the ring's positive even groups finite. For the **field**, the localization residue term is an infinite direct sum of finite odd-degree groups: it is torsion but not finite. Exactness, finiteness of the integral ring group and the parent's infinitude argument show the field's even groups are infinite torsion. Neither rational dimension zero nor the finite-S defect theorem implies field finiteness. No integral torsion orders or canonical integral splitting are supplied by N.3.

## The new declarations and their implementation order

All seven new node IDs have prefix `ArithmeticKTheory:N.3/`; all proposed declarations have namespace `ArithmeticKTheory` and module `TauCeti/NumberTheory/ArithmeticKTheory/Finiteness`. The theorem API uses the actual supplier spaces and maps, with native finite-module and linear-equivalence interfaces.

### 1. Finite-rank Q homology

`finite-rank-Q-homology` proposes `finite_rankQHomology`:

This arithmetic interface specializes the accepted sibling's `rank-filtration-homology-finite-type`; its generic induction is shared. The following describes the hypotheses that specialization supplies.

> For every number field F and every `m,i ≥ 0`, the abelian group `H_i(BQ_m(P(𝓞_F));ℤ)` is finitely generated.

The parent's `rank-spectral-sequence` gives, for `m ≥ 1`,

\[
H_i(BQ_m,BQ_{m-1};\mathbb Z)
\cong\bigoplus_{[P],\,\operatorname{rank}P=m}
H_{i-m}(\operatorname{Aut}_{\mathcal O_F}P;\operatorname{St}(P\otimes F)).
\]

Steinitz classification (`KTheoryLowDegrees:Z.4/projective-classification`) and the pinned finite Picard group make this a **finite** sum. The parent lattice-identification node handles nonfree P. Import integral Steinberg homology finite generation specifically from `BorelRegulators:R.1/steinberg-duality-finiteness`. That supplier accounts for the orientation character, normal torsion-free finite-index subgroup, central factor and finite quotient descent. Do not silently remove the orientation twist or assume rational finiteness proves integral finiteness.

Starting with `H₀(BQ₀)=ℤ` and positive-degree homology zero, the pair sequence makes `H_i(BQ_m)` an extension of a quotient of `H_i(BQ_{m−1})` by a subgroup of the relative group. Native noetherian and finite-generation extension facts complete induction. This is Quillen §1, pp.184–185, displayed (2) and (3).

**Acceptance:** the zero stage is correct in every degree. For ℤ there is one class per positive rank; for `𝓞_{ℚ(√−5)}` there are two. A proof replacing the whole sum by just `GL_m(𝓞_F)` fails the second case. No finite CW model is asserted.

### 2. Stabilization with its exact bounds

`rank-filtration-homology-stability` proposes `rankQHomology_stable`:

This retained signature reexports the accepted sibling's `rank-homology-stability`. The bounds below are its contract, with one shared implementation at assembly.

> For any Dedekind domain A, the maps `H_i(BQ_m) → H_i(BQ_{m+1})` and `H_i(BQ_m) → H_i(BQ)` are onto when `m ≥ i` and bijective when `m ≥ i+1`.

No finiteness of Pic or arithmetic hypothesis is required. In the pair at rank `m+1`, relative homology in degree i vanishes for `i < m+1`, giving surjectivity. The preceding relative term also vanishes for `i+1 < m+1`, giving injectivity. The imported `StableHomotopyKTheory:H.1/filtered-colimit-homology` comparison identifies the homology of the filtered union with the colimit, so the bounds persist to BQ. One can prove this comparison directly on normalized nerve chains: each finite chain has a maximum object rank, and filtered colimits of abelian groups are exact. Its reusable categorical statement is already `H.1/filtered-colimit-homology`.

**Acceptance:** at `m=i` only surjectivity is guaranteed. A relative `H₀(Aut(P);St)` term can obstruct injectivity there. Degree-zero homology is already ℤ, an improvement in that example which does not alter the uniform bounds. These statements concern **Q_m**, not **GL_m**. Source: Quillen's Corollary (Stability), p.182; Kahn §§4.3.3–4.3.4 explain the exact-sequence comparison.

### 3. Stable arithmetic homology finite type

`stable-Q-homology-finite-type` proposes `finite_QHomology`:

> For a number field F and each i, `H_i(BQ(P(𝓞_F));ℤ)` is finitely generated, and the map from `Q_{i+1}` is an isomorphism.

Apply the previous two results at rank `i+1`. Thus no argument asserts that an unrestricted colimit of finitely generated groups is finitely generated; degreewise stabilization is what makes it true. This node is the first new planet, **Finite-type arithmetic Q-space**.

To complete the **existing** parent K-finiteness theorem, use the direct-sum H-space structure, then the generic theorem recorded in the ownership gap that a connected CW-type H-space with finitely generated integral homology in every degree has finitely generated homotopy in every degree. The space is simple but can have nonzero π₁. `π_{n+1}BQ = K_n` then gives the result, and localization gives finite generation for finite S. Quillen p.185 states this passage. An ordinary simply connected Hurewicz theorem alone does not supply it.

**Acceptance:** `H₀=ℤ`, the comparison rank is `i+1`, and the subsequent homotopy argument retains `π₁BQ = K₀`. “Finite type” here does not mean a finite CW complex.

### 4. Finite localization defects

`finite-S-localisation-defect` proposes `finite_localisation_defect`:

> For finite `S ⊆ T` and `n ≥ 2`, the inclusion-induced map `K_n(𝓞_{F,S}) → K_n(𝓞_{F,T})` has finite kernel and finite cokernel. It is injective when n is positive even.

Use the parent's `N.1/S-integers-monotone` localization presentation and `N.2/finite-support`, with the removed primes `T∖S`. The adjacent residue terms are finite sums of `K_n(k(𝔭))` and `K_{n−1}(k(𝔭))`. The exact computation `KTheoryFiniteLocalFields:L.1/quillen-k-groups` gives finite odd groups `ℤ/(q^j−1)` and zero positive even groups. Exactness makes the kernel an image of the first finite sum and the cokernel a subgroup of the second. Positive even n makes the first sum zero. No finite-generation hypothesis on the source is needed for this argument.

Quillen's Remark (2), pp.179–180, states the case `𝓞_F → 𝓞_{F,S}`. The same proof over `𝓞_{F,S}` gives the refinement for `S ⊆ T`. Weibel V.6.1–6.1.1 supplies its localization form.

**Acceptance:** `S=T` gives zero defects. For ℤ and one inverted prime p, `K₂(ℤ)` injects into `K₂(ℤ[1/p])`, with cokernel a subgroup of `𝔽_p^×`. The degree-one cokernel is ℤ, so the range must exclude it. Replacing the finite set by all primes does not preserve finite cokernel.

### 5. The canonical rational comparison and its API

`canonical-rational-S-integer-equivalence` proposes

`rationalSIntegerEquiv`, the ℚ-linear equivalence from V_n(𝓞_F) to V_n(𝓞_{F,S}),

for finite S and n ≥ 2. It is `LinearEquiv.ofBijective` applied to the **specified** rationalized inclusion. Exact rationalization kills its finite kernel and cokernel; a torsion group's tensor with ℚ is zero since every element has a nonzero integer annihilator. This construction is the second new planet, **Rational S-integer comparison**.

Its uses are the parent S-integer rank theorem, Borel's genuine regulator and transfer maps, and N.5/N.6's separation of the rational free-rank input from integral torsion. Those uses determine the following API; names below are in namespace `ArithmeticKTheory`.

| Declaration | Statement or role |
| --- | --- |
| `rationalSIntegerEquiv` | Constructor from the particular rationalized inclusion, with finite S and n≥2. |
| `rationalSIntegerEquiv_apply` | Evaluating the equivalence equals evaluating that inclusion map. |
| `rationalSIntegerEquiv_symm_apply_apply` | The inverse sends the forward image of x back to x. |
| `rationalSIntegerEquiv_apply_symm_apply` | Applying forward after inverse returns y. |
| `rationalSIntegerEquiv_unique` | Any linear equivalence whose forward map is that inclusion is equal to this one. |
| `rationalSIntegerEquiv_empty` | After canonical empty-S transport, the equivalence is identity. |
| `rationalSIntegerEquiv_enlarge` | For finite `S ⊆ T`, composing with the rationalized S-to-T inclusion gives the comparison for T. |
| `rationalSIntegerEquiv_toField` | Composing with the rationalized inclusion into F gives the ring-of-integers-to-field map. |

The last identity uses the parent all-prime localization sequence; in these degrees its infinite residue sums are torsion. It does not assume they are finite. The identity is an equality of maps and does not claim integral isomorphisms.

All five discriminating unit tests have namespace `ArithmeticKTheory`:

| Test | Required result and tempting error it excludes |
| --- | --- |
| `test_rationalSIntegerEquiv_empty` | Every finite-degree comparison for empty S becomes identity after ring transport. An arbitrary basis-dependent equivalence would fail. |
| `test_rationalSIntegerEquiv_enlarge` | For ℚ, distinct p,q and n=5, the `{p}`-to-`{p,q}` inclusion composed with the first comparison is the second comparison. Equal dimensions do not establish this equality. |
| `test_rationalSIntegerEquiv_degree_one` | For ℤ→ℤ[1/p], the rational degree-one map has zero source and one-dimensional target, hence is not bijective. |
| `test_rationalSIntegerEquiv_prescribed_map` | In degree five over ℚ, multiplying the empty-S equivalence by 2 produces a different equivalence. The construction must retain its prescribed map. |
| `test_rationalSIntegerEquiv_even` | In degree two over ℚ, both rational spaces are zero for every finite S. Integral `K₂(ℤ)≅ℤ/2` is imported from `K2SymbolsBrauer:T.5/k2-of-the-integers`, so this cannot be interpreted as an integral vanishing statement. |

The degree-two test imports `K2SymbolsBrauer:T.5/k2-of-the-integers`. Its upper-bound proof remains an unread input in that supplier, rather than a consequence of rational rank zero; this revision does not certify that supplier proof.

The finite-S equivalence refines the parent's already-stated rational isomorphism by providing its native equivalence package and usable coherence API; it does not duplicate the rank theorem or define rational K anew.

### 6. Promoted forward-map identification

`canonical-rational-equivalence-map` proposes `rationalSIntegerEquiv_toLinearMap`:

> The equivalence's `toLinearMap` equals the rationalized canonical inclusion.

This follows from the construction and the pinned `LinearEquiv.ofBijective_apply` rule by extensionality. It promotes the defining projection to a separate lemma node because extension/transfer naturality consumes it. On pure tensors it sends `q⊗x` to `q⊗j_*(x)`. Multiplication by 2 fails the identity in a one-dimensional example.

### 7. Extension and transfer squares

`rational-localisation-extension-transfer` proposes `rationalSIntegerEquiv_extension_transfer`. Let `E/F` be finite, S finite, and T **exactly** the primes of E above S. Use the parent `N.1/S-integers-in-a-finite-extension` to obtain finite projectivity and

\[
\mathcal O_{E,T}\cong\mathcal O_E\otimes_{\mathcal O_F}\mathcal O_{F,S}.
\]

For n≥2, write `res₀,tr₀` for the extension and transfer between rings of integers, and `res_S,tr_S` between S-integer rings. With superscript ℚ indicating rationalization, require the two actual map identities

\[
e_{E,T,n}\circ\mathrm{res}_0^{\mathbb Q}
 =\mathrm{res}_S^{\mathbb Q}\circ e_{F,S,n},\qquad
 e_{F,S,n}\circ\mathrm{tr}_0^{\mathbb Q}
 =\mathrm{tr}_S^{\mathbb Q}\circ e_{E,T,n}.
\]

The projective-module transfer is Weibel IV.6.3.2, p.320; IV.6.3.3 is the coherent-module G-transfer and alone does not justify this construction. IV.6.3 also supplies invariance under natural isomorphisms. Tensor associativity gives the extension exact-functor comparison. For transfer, localization commutes with restriction of scalars along the finite-projective extension. Apply K.1's K-functor natural-isomorphism compatibility and `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, tensor with ℚ, and use the promoted forward-map lemma. Weibel V.6.6.3–6.6.4 derives the corresponding transfer diagram from these compatible exact functors.

**Acceptance:** identity extensions and empty S give identity squares. The ramified example `ℚ(i)/ℚ` with S={(2)} and T={(1+i)} is included: no étale hypothesis is needed. Inverting additional primes upstairs without their downstairs primes can destroy finite projectivity, so it is excluded by the exact condition on T. This theorem is not a degree-multiplication formula and does not replace the higher transfer by the degree-zero class-group norm.

## Supplier ownership, open requests and review boundary

The dependency order is

`parent rank filtration and relative homology + early integral Steinberg input → finite-rank homology → rank stabilization → stable integral homology → imported parent K-finiteness via generic H-space finite type`.

The localization sequence and finite-field computation give finite defects independently; these yield the canonical rational equivalence, whose forward-map lemma feeds extension/transfer coherence. Order ranks then give S-integer ranks. Integral K-finiteness is needed to conclude finite even groups and the noncanonical free-plus-finite structure.

**Avoid reciprocal imports.** Use `BorelRegulators:R.1/steinberg-duality-finiteness`, not its `quillen-finiteness-interface` or `finite-type-plus-consequences`, which consume N.3. Use its R.3 order rank result, not `s-integer-rank-import`, which consumes the N.3 rank passage. Use early `K.2:plus/plus-equals-Q`, not a downstream low-degree comparison that depends on arithmetic applications. The genuine general Q construction, exact K functor, localization, transfer, building and arithmetic duality each retain their supplier owner.

The former H.1 request is resolved as a planning import. The current supplier packet already contains `StableHomotopyKTheory:H.1/filtered-colimit-homology`, with this rank filtration as an explicit acceptance case, and `H.1/homology-of-small-categories`, the native nerve-to-singular comparison. Read both statements and their prerequisites. Their presence supplies the contract; their supplier still has `needs_changes` and explicit source/proof gaps, so this is not an implementation claim. The earlier review's narrower description of the integrated filtered-colimit node no longer describes the full current packet.

One **ownership gap** remains, rather than an in-scope H.3 request: assign the generic connected CW-type H-space simplicity and integral-homology-to-homotopy finite-generation theorem, permitting nonzero π₁, to an early supplying node. The retained proposal is **StableHomotopyKTheory, Part II**, adjacent to the plus/simple-space direction of H.3. RS-33 H.3 currently owns plus constructions; H.6 owns spectra, coefficients and completion. Neither stage text covers this generic theorem. The parent's old H.6 edge must be reconciled by an authorized parent/integration revision. This packet does not assign a stage or edit that edge.

The [finite-generation sibling](../packets/ArithmeticKTheory--N.3-finite-generation.json) is now accepted by its second independent review. Import its `rank-filtration-homology-finite-type` for the arithmetic specialization in node 1, and its `rank-homology-stability` for node 2. Keep the present IDs as consumer interfaces and share those proofs during assembly. Node 3 packages the arithmetic stable homology and its specified rank-(i+1) map. The finite S⊆T refinement and rational equivalence/coherence API remain this part's distinct contribution. The sibling's chain-coefficient, cellular-comparison and Serre ownership boundaries remain its own explicit contracts; acceptance does not erase them.

The construction's supplier nodes are precise planning dependencies. Borel's reader reconciliation, GeneralAlgebraicKTheory K.1 and LowDegrees U.1 still have review boundaries, and the finite/local-field packet has no recorded independent acceptance. Parent and supplier implementations remain unbuilt. N.3 is **planned**, not closed, until these inherited boundaries and the one recorded ownership gap are discharged. No direct request remains in this packet.

## Validation and implementation boundary

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.3.json` passes against the supplied pinned declaration index: **0 errors, 0 warnings**. Counts: **7 retained nodes** (5 theorems, 1 construction, 1 promoted lemma), **8 API items**, **5 unit tests**, **2 planets**, **19 baseline declarations**, **1 ownership gap**, **0 direct requests**, **1/1 stages planned**, **0 closed**. The six imported endpoints and parent child-layer planets are excluded from these counts. The earlier independent review object is preserved for the next reviewer, including its historical verdict and per-node notes.

The [suggested Lean file](../suggested/ArithmeticKTheory--N.3.lean) elaborates with the exact pinned Mathlib and only placeholder-proof warnings. All seven arithmetic declarations, all eight API entries and all five named tests are executable typed declarations/examples. Its local supplier prototype is constrained as follows:

| Carrier or map | Concrete meaning and owner |
| --- | --- |
| Finite projectives | Images of finite idempotent matrices; an actual module isomorphism accompanies a chosen presentation. LowDegrees Z.1 owns this small model. |
| Q arrows and composition | Split-epi/split-mono module spans modulo isomorphism of their middle module; composition presents their actual module pullback. K.1 owns this split-exact specialization and the category laws. |
| Q homology | Native integral `ModuleCat` homology of its nerve, with native induced maps. H.1 owns the natural comparison to singular homology of BQ. |
| Positive K-groups | Actual cubical homotopy-group quotients of geometric realization, based at the zero vertex. K.1 owns the K-group interpretation and small-model invariance. |
| Scalar extension | Entrywise matrix extension and tensoring linear maps, inducing the Q/realization/homotopy map. K.2:plus owns this functoriality. |
| Transfer | Restriction of the actual underlying projective module, followed by its presentation and zero-object basepoint path. K.3 owns this genuine transfer and naturality. |
| Arithmetic ring maps | The native S-integer subtype inclusions and the restriction of the given field embedding; the upstairs set is characterized by exact ideal contraction. N.1 owns the arithmetic comparisons and finite-projectivity proofs. |

These helpers prototype existing suppliers; they do not add foundational nodes or duplicate their roadmap plans. They fix arithmetic carriers and map formulas instead of substituting arbitrary module parameters, opaque K-types or fields asserting the desired answer. Supplier existence/comparison, category/group laws and mathematical theorem proofs remain placeholders. Replacing these helpers by implemented owner imports is an integration obligation, not a proof completed by elaboration.

Successor indexing makes the commutative-group bound explicit: `Supplier.K R d` denotes mathematical K_(d+1)(R), and the comparison/defect parameter d denotes degree d+2. Thus the constructor covers exactly n≥2; its tests use degrees 1, 2 and 5 with their actual meanings. K₀ remains imported through the parent's endpoint and owning comparison. The extension/transfer signature states the exact contraction condition on T and types both specified maps; its finite-T instance is a redundant consequence of finite S and E/F, supplied by N.1.

The shared build lacks the pinned Tau Ceti induced-map module. Its exact source statement was read, and the Mathlib-only quotient-postcomposition helper fixes the same action. No Tau Ceti module from another revision is imported. No language server, library build or package update was used. This validates signatures only and makes no implementation claim.
