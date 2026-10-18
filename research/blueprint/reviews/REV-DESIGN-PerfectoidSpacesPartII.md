# Independent review: PerfectoidSpacesPartII

**Accepted after correction.** Job `REV-DESIGN-PerfectoidSpacesPartII`, issue #3590; reviewer Codex, session `codex-mBPzIL`, 2026-10-18. The reviewed design was written by Claude, session `claude-SuIpdS` (issue #3480). This review did not write that design.

The review checks all 50 targets against their recorded source locators, their direct suppliers, the pinned declarations, their APIs and examples, and the roadmap and reader. Corrections are applied to all four design deliverables. The packet contains the independent verdict on every node and every source issue. Nothing here asserts that the proposed theory has been implemented or proved in Lean.

## Counts and disposition

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 50 | 50 |
| Definitions / constructions | 8 / 10 | 8 / 10 |
| Theorems / lemmas / applications | 29 / 2 / 1 | 29 / 2 / 1 |
| API items | 130 | 131 |
| Unit tests | 76 | 81 |
| Planets | 15 | 15 |
| Baseline declarations | 20 | 21 |
| Source issues | 10 | 14 |
| Gaps / requests | 0 / 0 | 0 / 0 |
| Ownership proposals | 3 | 3 |

There are **26 corrected and 24 verified nodes; no nodes were added, removed or left unverifiable**. Every definition and construction has at least three substantive tests. The added API is the spectral-point norm bound for Laurent localisation. The five added tests cover the product norm counterexample, a restriction-map kernel, enlargement of an unramified envelope, zero divisors in free Kummer algebras, and the nonidentity free-root algebra for a unit radicand.

All six stages, RA.0–RA.5, remain **planned**, with none marked closed. Each stage's targets are realised at target granularity. The `remaining` entries describe possible later lemma-level refinement, rather than missing target statements. `status: complete` records a completed planning pass, not formalisation or proof closure at the level of individual Lean lemmas.

## Sources and versions

The review read the locators of every node in the following primary texts. The packet and roadmap record URLs, editions, access dates, hashes and the parts read; no source passage is reproduced.

- Bhatt, [*On the direct summand conjecture and its derived variant*, arXiv v2](https://arxiv.org/pdf/1608.08882v2), especially Definition 3.2, Example 3.3 and Lemmas 3.4–3.6, pp. 5–6; Theorem 4.2 and Remarks 4.3–4.4, pp. 6–7; Proposition 5.1, p. 8.
- André, [*Le lemme d’Abhyankar perfectoïde*, published version](https://www.numdam.org/item/10.1007/s10240-017-0096-x.pdf), the locators in §§1–5 specified by the nodes, including the complete arguments of §§4–5, pp. 53–69. The current arXiv preprint was compared for the norm and bounded-limit slips; it does not repair them.
- André, [*La conjecture du facteur direct*, published version](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), §§1–3, pp. 75–84, and Annexe A.1–A.2, A.4, pp. 89–92. The [arXiv v1](https://arxiv.org/pdf/1609.00345v1) was compared at Lemme 1.1.2, p. 5, and §5.5, p. 14. Its statements and numbering must not be substituted silently for the published ones.
- Gabber–Ramero, [*Almost ring theory*, arXiv v3](https://arxiv.org/pdf/math/0201175v3), Lemma 2.4.2 and proof, pp. 22–23, read in the maintainer-cleared copy. This is the comparison for derived limits of almost modules, not an assertion that termwise almost-zero vanishing handles a tower with merely summable cokernel bounds.

Scholze's rational-localisation, approximation and almost-purity results are imported through the exact PerfectoidSpaces supplier nodes. Mihara's closed-ideal result is used in the form stated in André A Lemme 2.6.1, p. 28; it is not presented as an independently read Mihara citation. The corrected proof sketch also explains closedness directly by Gauss seminorms at spectral points. A bounded search found no separate published erratum for E11–E12; that is not a claim of exhaustive publication-history coverage.

## Material mathematical corrections

1. **The Laurent norm formula needs replacement, not just a constant correction.** For the max norm on `K × K`, take `q = |ϖ| < 1`, `g = (ϖ²,1)`, `λ = ϖ`, and `a = (1,ϖ²)`. The quotient norm of the image of `a` is `q²`, whereas the printed one-parameter infimum is `q`. The corrected API gives the quotient infimum over the whole Tate algebra. Limit injectivity is proved by a spectral point detecting `ag`, rather than by the false lower bound or injectivity of every restriction. The packet includes both explicit regressions (André A §2.6.2–Lemme 2.6.3, pp. 28–29).
2. **The bounded uniform limit does not contain all of `A[1/g]`.** Even `1/T` is unbounded over the expanding standard annuli. The annular-envelope proof embeds this localisation into the algebraic limit and uses the trace pairing against the bounded subalgebra to detect its kernel (André A Proposition 4.4.4, p. 63).
3. **Summable annihilator bounds require their own argument.** The cited P0 theorem treats termwise almost-zero systems. The nested-system proof now passes through almost elements, allows doubled cokernel exponents, and solves the ordinary Roos equations with weights `12/p^k`. This supplies the missing almost `lim¹` vanishing without adding a generic supplier theorem or a proof-detail node (André A Proposition 4.4.1, pp. 59–61; GR Lemma 2.4.2(iii), pp. 22–23).
4. **Free Kummer root algebras retain their branches.** They need not be domains, including when `g` is a unit. The finite-stage models are integral closures relative to the stated generic algebras. Finite normalization of the characteristic-zero field factors follows from the pinned `IsIntegralClosure.finite`; the relative closure is a submodule of this finite module. For complete integral closure of the union, descend only `x` and its regular multiplier `d` to one generic stage: multiplication by `d` embeds `A[x]` into that stage's finite integral model. No descent of infinitely many coefficient relations is asserted. The cyclotomic perfectoid-field argument now covers an arbitrary perfect residue field (André B §§2.2–2.4, pp. 78–79; André A Exemple 3.1.2(1), p. 35).
5. **The tube flatness repair needs a base-ring approximant.** Require `j ≥ k` and `g_k ∈ A°_{j0}`, independent of the auxiliary Tate variable. The reduced equation is monic, with free basis `Z^a U^b`, `0 ≤ a < p^(j−k)`. Bhatt's Proposition 5.1 applies at a finite Noetherian base stage. Completion of the filtered tower is likewise checked over each fixed finite base stage before the equational criterion gives flatness over the union. The invalid choice `g_k = T^(1/p^k)` is excluded (André B proof of Théorème 2.5.2, pp. 80–82).
6. **Unramified finite étale input need not be its own ramified envelope.** Root saturation is required before coreflection; the characteristic-p two-variable example gives strict enlargement. The almost comparison of integral closures is proved directly by rescaling a monic equation by each root of `g`. The almost-étale theorem is applied to the perfectoid coreflection, then transferred across the almost comparison (André A §3.5.3, pp. 45–46; §5.3, pp. 67–68).

The table below records the other hypothesis, convention, example and proof changes as well as these larger repairs. The reader contains all revised statements, proof steps, APIs, tests, checks and locators. Its layer dependencies are derived from the corrected direct inputs. The roadmap adds the missing R0 normalisation dependency for RA.4 and E2 dependency for RA.3, and states relative closedness and the additive-functor convention consistently. Source metadata and the source-issue appendix are synchronized.

## Per-node record

Node names below are relative to `PerfectoidSpacesPartII:`. The packet's `review.checked` contains the same 50 verdicts.

| Node | Verdict | Check or correction |
| --- | --- | --- |
| `RA.0/almost-pro-zero-tower` | corrected | Corrected the strict root index in Bhatt Example 3.3: the root at n+r kills the displayed class; the root at n+r+1 does not. Checked Definition 3.2 and the Serre-class argument. |
| `RA.0/uniformly-almost-pro-zero` | verified | Checked both root quantifiers, uniformity in n and the equivalence with the Lean predicate. |
| `RA.0/almost-pro-zero-derived-limit` | verified | Checked Bhatt Lemmas 3.4–3.5: fixed-root multiplication factors through a pro-zero tower; bounded cohomological amplitude and E2 derived limits suffice. |
| `RA.0/almost-pro-zero-linear-functor` | corrected | Read Bhatt Lemma 3.6 and pinned Functor.Linear. Made additivity explicit in the packet, matching the separate F.Additive and F.Linear assumptions in the suggested file; scalar annihilation is preserved. |
| `RA.0/uniform-annihilation-derived-tensor` | verified | Checked amplitude-zero cone, factorisation through the cokernel, root-factor slack, and arbitrary derived tensor input. The same c controls both adjacent cohomology degrees. |
| `RA.1/annular-tower` | verified | Checked annulus orientation, O-plus definition and P2 root-relation presentation, with empty-annulus and unit tests. |
| `RA.1/quantitative-riemann-extension` | verified | Read Bhatt Theorems 1.6 and 4.2 proof: denominator estimate gives c = p^k m and almost-zero kernels under almost regularity. |
| `RA.1/quantitative-riemann-extension-derived` | verified | Checked Remark 4.3 and the RA.0 uniform cone argument; the Koszul consequence uses a regular sequence and the DD.1 supplier. |
| `RA.1/quantitative-riemann-extension-general` | verified | Checked Remark 4.4: pass from the universal variable to g by derived tensor with the explicit integral presentation; no hidden nonzerodivisor assumption. |
| `RA.1/riemann-extension-almost-limit` | verified | Checked Remark 1.7 and the cofinal double-limit argument; completeness and almost exactness are used before interchanging the limits. |
| `RA.2/p-root-closure` | corrected | Checked p-root versus integral closure and the characteristic-p characterisation; required a reduced fraction in the Z[1/2] computation. |
| `RA.2/unit-ball-dictionary` | corrected | The inverse-image equality for input lattices is sufficient for isometry, not necessary. Replaced the iff by the actual gauge-unit-ball criterion and added a dense-valued counterexample (Sorite 2.3.1(2c), pp. 16–17). |
| `RA.2/root-saturation` | verified | Checked all six root-saturation conditions, localisation of complete integral closure and compatibility with bounded limits; corrections E5–E6 are respected. |
| `RA.2/laurent-localisation` | corrected | Removed the false norm infimum from the published property list, supplied the quotient-norm formula and a K×K counterexample, and proved limit injectivity by a detecting spectral point. Required nonzero λ, corrected a geometric series, and made the annulus tests precise (new source issue E11). Supplied a closed-image argument using the Gauss seminorms at spectral points. |
| `RA.2/weierstrass-localisation-unit-ball` | corrected | Specified the direction of the change of variables; U_new ↦ (λ/λ′)U_old+(f′−f)/λ′ takes the new relation to the old relation. Checked torsion-freeness, density and both unit-ball formulas. |
| `RA.2/uniform-limit` | corrected | Qualified the constant-diagram test by connected nonempty indexing; verified the bounded-family universal property and the open-disc example against (2.27)–(2.28). |
| `RA.2/uniform-colimit` | corrected | Corrected shrinking-disc transition maps to restrictions and identified evaluation at 0 as the cocone; checked the uniformization and unit-ball universal properties. |
| `RA.2/root-algebra` | verified | Checked universal root-system property, uniform colimit norm and the nilpotent test; freely adjoining roots is distinct from choosing a root in a field. |
| `RA.2/tubular-colimit` | verified | Checked Proposition 2.9.2 and Corollary 2.9.3, tubular transitions and the flat almost-unit-ball conclusion. |
| `RA.3/perfectoid-coreflection` | corrected | Made Frobenius semilinearity explicit in characteristic p: the inverse limit uses Frobenius-twisted K-actions. Checked both adjunctions and the characteristic-zero coreflection. |
| `RA.3/perfectoid-root-algebra` | verified | Checked both characteristic cases of the root algebra and its tilted compatible root, with the P1/P2 suppliers. |
| `RA.3/almost-perfectoid-algebra` | verified | Checked Definition 3.5.2 and both coreflection tests, completeness and equivalence of integral models; none asserts almost perfectoid implies perfectoid. |
| `RA.3/annular-localisation-perfectoid` | verified | Checked Proposition 3.6.1, integral model (3.16), tilt formula and relative almost setup. |
| `RA.3/scholze-limit-lemma` | verified | Read Proposition 4.2.1 and the root-localisation proof, including the reduction modulo a pseudouniformizer power and the principal-root almost ideal. |
| `RA.3/perfectoid-riemann-extension` | verified | Checked Theorem 4.2.2, Lemma 4.2.3, complete integral closure, nonzerodivisor hypothesis and the integral/generic dictionary. |
| `RA.3/largest-perfectoid-subalgebra` | verified | Checked Corollary 4.2.4: root saturation followed by coreflection, with the universal largest-subalgebra property. |
| `RA.3/uniform-limit-perfectoid-criterion` | verified | Checked Proposition 4.3.1 and its hypotheses: the ordinary uniform limit need not be perfectoid, whereas the almost criterion passes through Frobenius modulo ϖ. |
| `RA.3/nested-lim-one-vanishing` | corrected | The existing P0 node only handles termwise almost-zero systems. Added the missing summable-annihilator proof using almost elements, doubled exponents and a weighted Roos recursion; read Gabber–Ramero Lemma 2.4.2(iii), pp. 22–23, in the cleared copy. |
| `RA.3/compatible-annular-system` | corrected | Restricted the canonical and dual-number examples to a concrete nonzero annular tower, so the claimed nonexamples cannot degenerate to the zero algebra. |
| `RA.3/nested-systems-theorem` | verified | Checked Theorem 4.4.2 and its unit/counit maps; the strengthened lim-one proof closes its Frobenius-surjectivity step. |
| `RA.4/almost-galois-extension` | verified | Checked Lemma 1.9.1: the Galois tensor comparison and invariants imply almost faithful flatness and étaleness; tests distinguish automorphisms from a torsor. |
| `RA.4/galois-closure-and-rigidity` | corrected | Required positive constant rank for a faithful Galois closure and added the zero-rank counterexample; verified the geometric-fibre proof and rigidity lemma (p. 10). |
| `RA.4/annular-envelope` | corrected | Replaced the false embedding of A[1/g] into the bounded uniform limit by its embedding into the algebraic limit. Trace detection then proves the kernel vanishes; the Galois reduction separates zero-rank components (source issue E12). |
| `RA.4/integral-ramified-almost-etale` | verified | Read Proposition 5.2.3 proof and checked the perfectoid input, descent, trace pairing and modulo-p-power conclusion; no unproved global almost-finiteness assertion. |
| `RA.4/ramified-almost-purity` | verified | Checked all three categories of Theorem 5.2.1, their completeness and finite-étale conditions, and both quasi-inverse constructions. |
| `RA.4/abhyankar-envelope` | corrected | Corrected the unramified test: a finite étale C is recovered only after root saturation and coreflection, with equality to C requiring saturation. Added André’s characteristic-p two-variable example (pp. 45–46). Gave the almost comparison directly by rescaling a monic equation, without importing an unstated general integral-closure theorem. |
| `RA.4/perfectoid-abhyankar-lemma` | corrected | Applied integral ramified almost étaleness to the perfectoid coreflection B = B̃^♮, then transferred the conclusion across its almost unit-ball comparison; B̃ itself is only almost perfectoid in general. |
| `RA.4/almost-perfectoid-envelope-of-affinoid` | corrected | Added the exact Noether-normalisation supplier and distinguished its finite injection from the separately assumed nonzero discriminant giving an étale localisation. Defined the root-saturated Banach algebra through its integral model and transferred almost étaleness through coreflection. |
| `RA.5/pure-map` | corrected | Expanded the generator-to-retraction argument using a finite dual-basis sum in Hom_R(S,R); recorded the source’s Hom_S typo as E13 and checked the nonsplit nodal-normalisation example. |
| `RA.5/almost-pure-map` | corrected | Confirmed the corrected tensor definition in the published Annexe A.4 and the first-factor property; recorded separately that the unrelated P→P⊗S formula belongs only to arXiv v1 §5.5, p. 14 (E14). |
| `RA.5/krull-detection-lemma` | corrected | Replaced the incorrect baseline Submodule.annihilator citation by Module.annihilator, the ideal of scalars killing the entire module used in the statement and Lean file; read the pinned definition and Krull intersection theorem. |
| `RA.5/normalized-kummer-tower` | corrected | Corrected relative integral closedness versus normal domains, retained all free-root branches, supplied zero-divisor and g = 1 tests, and proved the cyclotomic field assertion for arbitrary perfect residue field. Added the pinned IsIntegralClosure.finite theorem: finite field-factor normalizations make each relative integral closure finite over A. For complete integral closure, multiplication by the regular multiplier embeds A[x] into one finite-stage model, matching IsAlmostIntegral exactly without descending infinitely many relations. |
| `RA.5/kummer-tower-spectral-norm` | verified | Checked the relative-integral-closure norm criterion, isometric transitions and coordinate-stage multiplicativity; no multiplicativity claimed for all Kummer stages. |
| `RA.5/kummer-tower-tubular-description` | corrected | Replaced algebraic p-adic completion of a ring where p is already a unit by Gauss-norm completion. Removed the finite-Q_p supplier, using the general perfect-residue-field argument in the tower construction and Frobenius on the coordinate tower. |
| `RA.5/noetherian-tube-faithful-flatness` | corrected | Added j ≥ k and required g_k in the base ring, so the special fibre is monic in the auxiliary variable. Gave the explicit free basis and excluded the choice g_k = T^{1/p^k}, which invalidated the original universal claim. |
| `RA.5/kummer-almost-faithful-flatness` | corrected | Repaired the finite-stage-to-union flatness argument: all completions are checked over a fixed Noetherian base stage, then the equational criterion gives flatness over A°_∞0. Explicitly chose base-ring approximants and corrected the g = 1 test, whose free root algebra need not collapse. |
| `RA.5/kummer-purity` | verified | Checked Corollary 2.6.1: coherent finite-free coordinate union, finitely presented kernel module, Krull detection and descent of purity to the finite stages. |
| `RA.5/kummer-generic-faithful-flatness` | corrected | Replaced the false coordinate-root formula by the valid j = 0 computation and the j = k = 1 zero-divisor regression; checked the passage from almost faithful flatness to generic faithful flatness. |
| `RA.5/flat-integral-model` | corrected | Weakened the claimed strict enlargement by almost elements to possible enlargement: the two adjoints need not give strictly different rings in every case. Checked the explicit lower-!! formula and faithful-flatness supplier. |
| `RA.5/ramified-kummer-almost-flatness` | corrected | Made the injectivity in finite extension explicit, justified reduction modulo p^m by relative normality of A in A[1/p], and qualified the unit-g comparison without identifying a free Kummer tower with its base. |

## Baseline verification

All 21 declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, including their surrounding variables and hypotheses. The 19 source files used agree byte-for-byte with the raw files fetched at that commit. Tau Ceti's baseline is `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti declaration is introduced as a new baseline entry.

**One wrong citation replaced:** `Submodule.annihilator` takes a submodule and is not the module-annihilator ideal used in the Krull detection target. It is replaced throughout by `Module.annihilator` (Ideal/Maps, line 860), which matches the existing suggested signature.

**One declaration added:** `IsIntegralClosure.finite` (DedekindDomain/IntegralClosure, line 175) needs a normal Noetherian domain, its fraction field, and a finite separable field extension. Despite its module's name, it does not assume a Dedekind domain. The field-factor application in RA.5 satisfies precisely these hypotheses.

| Declaration | Pinned source | Scope checked |
| --- | --- | --- |
| `AdjoinRoot` | [RingTheory/AdjoinRoot.lean:62](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdjoinRoot.lean#L62) | Polynomial quotient over a commutative ring; no irreducibility or field conclusion. |
| `Algebra.Etale` | [RingTheory/Etale/Basic.lean:206](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Basic.lean#L206) | Formal étaleness together with finite presentation. |
| `CategoryTheory.Functor.Linear` | [CategoryTheory/Linear/LinearFunctor.lean:36](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Linear/LinearFunctor.lean#L36) | Scalar compatibility on morphisms; the separate additive assumption is explicit in the target and Lean signature. |
| `CategoryTheory.Limits.limit` | [CategoryTheory/Limits/HasLimits.lean:181](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L181) | Limit only when the particular diagram has a limit; module towers have the required products and limits. |
| `CyclotomicField` | [NumberTheory/Cyclotomic/Basic.lean:654](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Cyclotomic/Basic.lean#L654) | Abstract cyclotomic extension; no analytic completion or finite-Q_p restriction is inferred from this definition. |
| `DerivedCategory` | [Algebra/Homology/DerivedCategory/Basic.lean:87](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean#L87) | Derived category of an abelian category, used here for module complexes. |
| `Ideal.mem_iInf_smul_pow_eq_bot_iff` | [RingTheory/Filtration.lean:392](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Filtration.lean#L392) | Finite module over a Noetherian ring; the conclusion gives r in I with r acting as the identity on x. |
| `IsAdicComplete` | [RingTheory/AdicCompletion/Basic.lean:56](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean#L56) | I-adic separatedness and completeness; it is applied to integral models before inversion of p. |
| `IsAlmostIntegral` | [RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:26](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean#L26) | The multiplier belongs to the nonzerodivisors of the base ring; this is retained in all comparisons. |
| `IsNoetherianRing` | [RingTheory/Noetherian/Defs.lean:196](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Noetherian/Defs.lean#L196) | Noetherianity is not inferred merely from possessing this class name; finite stages and their module-finiteness are justified. |
| `LinearMap.lTensor` | [LinearAlgebra/TensorProduct/Map.lean:338](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Map.lean#L338) | Left tensoring of a linear map, with the factor order used in the purity definitions. |
| `Localization.Away` | [GroupTheory/MonoidLocalization/Away.lean:140](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/MonoidLocalization/Away.lean#L140) | Monoid localization carrier with its ring-localization instances; the distinguished element becomes a unit. |
| `Module.FaithfullyFlat` | [RingTheory/Flat/FaithfullyFlat/Basic.lean:63](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean#L63) | Flatness plus reflection of zero modules, with the required module structure. |
| `Module.FaithfullyFlat.lTensor_injective_iff_injective` | [RingTheory/Flat/FaithfullyFlat/Basic.lean:385](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean#L385) | Faithfully flat tensor factor reflects injectivity of a linear map. |
| `Module.Flat` | [RingTheory/Flat/Basic.lean:113](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean#L113) | Tensor-preservation of injections; used in the pure-map implications. |
| `MvPowerSeries` | [RingTheory/MvPowerSeries/Basic.lean:86](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L86) | Finite-variable formal power series over W(k), rather than restricted power series. |
| `Module.annihilator` | [RingTheory/Ideal/Maps.lean:860](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L860) | An ideal of the base ring annihilating the whole module; replacement for the wrong submodule citation. |
| `WittVector` | [RingTheory/WittVector/Defs.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean#L52) | p-typical Witt-vector carrier; prime and perfect-characteristic-p hypotheses are supplied where ring properties need them. |
| `completeIntegralClosure` | [RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:31](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean#L31) | Subalgebra of almost integral elements with a regular base multiplier; not silently identified with an unrestricted bounded-module closure. |
| `integralClosure` | [RingTheory/IntegralClosure/Algebra/Basic.lean:216](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean#L216) | Integral closure as a subalgebra of the specified ambient algebra, including an algebra with zero divisors. |
| `IsIntegralClosure.finite` | [RingTheory/DedekindDomain/IntegralClosure.lean:175](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean#L175) | Finite-dimensional separable field extension of the fraction field of a normal Noetherian domain; applied to each field factor. |

## Dependency, ownership and granularity audit

The final graph has **45 distinct direct supplier nodes**: 30 in PerfectoidSpaces, six in AdicSpacesPartII, five in EnhancedDerivedSheaves, two in DerivedDeRhamCohomology and two in DeformationAndDerivedPatchingAlgebra. Each direct supplier's statement was read. With the validator's preference for integrated nodes over blueprint nodes, the reachable graph has **263 nodes and no cycles**. The six own layers are ordered consistently with their direct edges.

Specific mismatches were resolved in the consumer: E2 now supplies the actual `coherent-towers-and-roos` node; the P1 Frobenius criterion has its exact existing identifier; the finite-Q_p cyclotomic supplier is removed from the arbitrary-perfect-residue-field construction; R0's Noether normalisation gives a finite injection but is not claimed to choose a discriminant. The affinoid-envelope application separately assumes a nonzero `g` making the localisation étale.

The relevant PerfectoidSpaces P0–P3 detailed statements occur in `PerfectoidSpaces--P0.json`, whose review status is currently `needs_changes`; some older direct nodes resolve to its accepted integrated predecessor. These are explicit planned imports, not baseline implementations or a claim that the PerfectoidSpaces package is ready for upstream intake. Acceptance of this target-level plan does not bypass the separate package dependency gate.

The reviewed library audit `data/library-coverage.json` was read and checked against both pins and the current read-only upstream checkouts. The current TauCetiRoadmap revision checked was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library revision was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine post-snapshot roadmaps named by WORKERS.md were included in the comparison, together with the relevant AdicSpaces and LocalFields material. Existing Huber, Witt-vector and general algebra infrastructure is imported. No existing perfectoid, almost or uniform-Banach implementation replacing these targets was found. Uniformization and uniform completed tensor products remain owned by AdicSpacesPartII; the new targets here are the additional limit, root-algebra and ramification constructions.

No proof-detail node was added: the weighted recursion, trace detection, finite-stage multiplier argument and monic free-basis computation belong in the existing targets' proof sketches. No planet needed renaming; the 15 names denote central definitions, constructions and named theorems.

## Source-issue verdicts

All ten inherited records are confirmed, with the indicated qualifications. Four records were added. These are local checks and corrections in this review, not assertions of an author-issued erratum.

| Record | Verdict and locator | Correction checked |
| --- | --- | --- |
| E1 | Confirmed; André B Théorème 2.5.2 proof, pp. 80–81 | The polydisc flatness justification is incomplete; use the torsion-free complete integral tube and its monic free reduction, with the corrected base-ring hypothesis. |
| E2 | Confirmed; André A Théorème 0.3.1, p. 2 | An arbitrary finite étale algebra need not receive an injective structure map; require faithfulness for the injection and trace-surjectivity assertions. |
| E3 | Confirmed; André A Lemme 2.6.3, p. 29 | The printed lower bound 1 fails already at m = 0 for a small nonzero a. Correcting that constant alone does not fix the false norm formula; use E11's replacement proof. |
| E4 | Confirmed; André A Remarques 2.6.4, p. 30 | Annular restrictions need not be injective; the K×K example has a nonzero restriction kernel. |
| E5 | Confirmed; André A formula (2.17), p. 26 | The inversion parameter is the pseudouniformizer ϖ. In characteristic p, inversion of the integer p would collapse the ring. |
| E6 | Confirmed; André A Lemme 2.5.3 proof, p. 27 | The proof uses the condition in the ambient localisation, not the condition in the smaller unit-ball localisation. |
| E7 | Confirmed; Bhatt §1.4 Notation, p. 3 | The chosen parameter must be nonzero and topologically nilpotent; neither a unit nor zero has the intended almost and generic-fibre behaviour. |
| E8 | Confirmed; André B formula (2), p. 77 | The discrete-value-group qualification is a hypothesis, rather than an additional conjoined conclusion. |
| E9 | Confirmed; André B §0.6, p. 74 | The perfectoid completed tower includes coordinate roots, not only roots of unity and g. |
| E10 | Confirmed; André B Lemme A.4.1 proof, p. 92 | The first-factor map in the tensor-factorisation argument is almost pure; use the correctly typed factorisation. |
| E11 | Added, confirmed; André A localisation property list and Lemme 2.6.3, pp. 28–29 | The one-parameter norm infimum can differ from the quotient norm; use the full Tate-algebra quotient formula and the spectral-point injectivity proof. |
| E12 | Added, confirmed; André A Proposition 4.4.4 proof, p. 63 | The localisation embeds in the algebraic inverse limit, not necessarily the bounded uniform limit; repair the trace detection accordingly. |
| E13 | Added, confirmed; André B Annexe A.2, p. 90 | The generator criterion uses Hom_R(S,R), not Hom_S(S,R); the finite dual-basis sum constructs an R-linear retraction. This is already recorded by PAPER-ANDRE-18-B/E1. |
| E14 | Added, confirmed for arXiv v1 only; §5.5, p. 14 | The module tensor map has the wrong domain in v1. The published Annexe A.4, p. 92, already has the correct formula. This distinction is already recorded by PAPER-ANDRE-18-B/E11. |

## Validation and suggested file

- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidSpacesPartII.json`: **0 errors, 0 warnings**; 50 nodes, 131 API items, 81 tests, 15 planets, 21 baseline declarations, six planned stages.
- `lean-check research/blueprint/suggested/PerfectoidSpacesPartII.lean`: **passed**, exit 0 at the shared pinned Mathlib build, with **21 warnings, all declaration uses of `sorry`**. Available memory exceeded 20 GB before compilation. The 290-line file has real bodies for its light definitions and no sorry-filled data definition. The new rational free-root example elaborates; the Kummer comments specify relative integral closure and retain all branches. The proof placeholders are not proofs of the mathematical targets.
- Reader agreement check: all 50 statements and every hypothesis, proof step, API item, test and acceptance item occur in the corrected reader; all 50 independent verdicts are present once. Every definition and construction has at least three tests. Source and stage metadata are synchronized.
- Dependency check: 263 reachable nodes, no cycles; all 45 direct suppliers resolve. `git diff --check` passes.

## Orchestrator actions and remaining work

There is no blocking question and no remaining work for this independent-review job. Keep the three existing ownership proposals: pure/almost-pure maps and Krull detection are RA.5 inputs for DirectSummandsAndBigCohenMacaulay; almost-pro-zero towers and almost Galois extensions are owned here in RA.0 and RA.4; the arbitrary-ideal characteristic-p Hebbarkeitssatz stays in PerfectoidShimuraVarieties. These do not authorize changes to another roadmap in this PR.

The next programme step is packaging this accepted plan once the upstream dependency conditions are met. A packager must retain the source-version distinctions, the quotient-norm and algebraic-limit repairs, the base-ring condition in the tube lemma, and relative integral closure for free Kummer algebras. The separate PerfectoidSpaces package review still has to be resolved by its owner. No second issue was claimed in this run.
