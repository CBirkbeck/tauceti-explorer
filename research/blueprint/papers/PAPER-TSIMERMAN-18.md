# PAPER-TSIMERMAN-18 — Tsimerman, André–Oort for A_g

**Status: partial checkpoint, not a completed paper extraction.**

Issue: #1141. Agent: ChatGPT Pro, GPT-6 Astra Pro. Session: `cgp-ao-20260921-a7f3`. Read date: 21 September 2026.

The accompanying result contains 65 mathematical items: two directly checked library items, 17 planned items, and 46 provisionally missing items. Three source routes cover existing directions. Thirty-seven missing items remain deliberately unrouted pending the reviewed baseline, external-source checks and the ownership screen. “Missing” in this checkpoint means not established here, not a verified absence from the approximately 70,000-declaration Tau Ceti library.

## 1. Source and version discipline

The source is Jacob Tsimerman, *The André–Oort conjecture for A_g*, Annals of Mathematics 187 (2018), 379–390, DOI [10.4007/annals.2018.187.2.2](https://doi.org/10.4007/annals.2018.187.2.2). All six sections, references, and all twelve rendered pages of the [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) were read. The public arXiv version, 1506.01466v5 of 1 December 2015, was compared with it. Binary download attempts failed, so the JSON records the source URL and access date but leaves the PDF SHA-256 null. A checksum has not been fabricated.

Use published numbering. In particular, published Lemma 4.1 supplies the bounded field-of-definition extension; it is not present in the older arXiv version. The published Colmez expression has `(1/2) log f_rho`. The main scope is A_g for every g, not all Shimura varieties. The mixed-Shimura consequence on p. 380 is explicitly restricted to varieties whose pure part is a Shimura subvariety of A_g. The individual Colmez conjecture and the general André–Oort conjecture in the introduction are context, not proved inputs.

Theorems 1.2 and 4.2 are one result, as are Theorems 1.3 and 5.3; their duplicate appearances do not generate duplicate items.

## 2. The existing owners

### Logic, definability, valued fields and motivic integration — LD.6

`LogicAndDefinabilityInNumberTheory:LD.6` already specifies an o-minimal/Pila–Zannier branch with separate Galois-orbit, uniformization-definability and functional-transcendence inputs. This paper is a source that decomposes that branch. It is not a reason to create a second André–Oort roadmap.

The source route includes the counting assembly, weakly special versus special distinction, passage from semialgebraic pieces to complex algebraic pieces, finite group/family types, and the final induction. Geometric definitions and ordinary heights appearing in these interfaces remain imports from their owners: a source route for an application does not transfer ownership of all its foundations to logic.

### Arakelov geometry and heights of abelian varieties — R35

`ArakelovGeometryAndAbelianHeights:R35.1–R35.3` already cover the hermitian Hodge determinant, arithmetic degree, metric and stable Faltings height, including changes of section and field. Its later height-comparison and export layers are the natural place to attach the Bost lower-bound source. Do not reconstruct a second stable-height theory inside a CM-orbit roadmap.

R35.4's variation formula under isogeny is not a polynomial bound for the minimum degree of an isogeny. The latter is the Masser–Wüstholz input and needs a distinct quantitative interface.

### Complex multiplication and explicit reciprocity — CM.0 and CM.2

`ComplexMultiplicationAndExplicitReciprocity:CM.0` owns CM types and reflex data. `CM.2` owns the explicit reciprocity dictionary, importing the general CM theorem from `ShimuraVarieties:V5`. Preserve that direction; CM.2 must not become a circular prerequisite of V5. The elliptic CM layer alone is not enough for arbitrary g.

The field of moduli, polarized reciprocity stabilizer, quantitative CM heights and power discriminant orbit estimates require further ownership decisions. These are not assigned to new IDs in this checkpoint.

### Nearby directions screened, but not absorbed

The complete `EffectiveBounds` upstream document concerns explicit small-class-number bounds. A long-term Brauer–Siegel aspiration in that document is not a verified implementation of the fixed-degree theorem needed here. The inspected Chebotarev material does not provide a general higher-dimensional Artin L-function theory. `AnalyticNumberTheory`'s classical zeta/Dirichlet-L scope is likewise not automatically the owner of every Artin factor in Colmez's expression.

`FaltingsFinitenessAndIsogenyTheorems:R28.4` supplies the qualitative Tate/Faltings isogeny direction, not the Masser–Wüstholz degree estimate. Its R28.1 moduli-finiteness machinery must not be confused with that estimate either.

The full R35, R28, LD and CM campaign documents were read. EffectiveBounds was read in full; the additional GlobalNumberFields, Chebotarev and AnalyticNumberTheory reads were partial. Finish a second full nearby upstream document before promoting this checkpoint to complete.

## 3. Corrected pinned library baseline

The pins are mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

A fresh direct read of `Mathlib/NumberTheory/NumberField/CMField.lean` at the mathlib pin returned blob `6c7067617742aae433a648031822e84a41746b4f`. It verifies:

- `NumberField.IsCMField`;
- `NumberField.IsCMField.units_rank_eq_units_rank`;
- `NumberField.IsCMField.indexRealUnits_eq_one_or_two`;
- `NumberField.IsCMField.regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`.

The exact regulator identity is

```text
regulator E / regulator E0
  = 2^(Units.rank E) * (indexRealUnits E : R)^(-1),
indexRealUnits E = 1 or indexRealUnits E = 2.
```

These statements require a CM number field, not a Galois extension of Q. Thus the dimension-uniform regulator comparison is already available. An earlier working note incorrectly described a Galois-only theorem and different declaration names; that note is superseded and must not be reused. This correction is incorporated in the result JSON. The paper's informal equality of regulators should be implemented using the actual ratio formula, not by inventing a new regulator theorem.

The reviewed aggregate `data/library-coverage.json`, blob `5e708cfc74a51b10e62149113872fe4e00eb5846`, could not be read: ranged file access returned empty content, and raw-file and blob access rejected the oversized response. Unreviewed audit snippets were not promoted to accepted evidence. In particular, provisional missing entries for discriminant towers, Northcott and basic ideal counting are not recommendations to duplicate those results.

## 4. Arithmetic proof interfaces

### 4.1 Class numbers and distant isogenies

The class set S(E,Phi) is O_E-equivariant and unpolarized. It is not the set of principally polarized points of A_g. Its cardinality is the class number of E. The proof uses the quotient h_E/h_E0, the discriminant tower identity, fixed-degree Brauer–Siegel and the existing CM regulator comparison to obtain a power lower bound.

For a primitive type and maximal CM order, the ideal quotient A/T_I remains in this class set, with degree N(I). The counting bound for ideals of norm n must be uniform in E at fixed degree. The printed Proposition 2.2 states existence of a distant pair, but its proof fixes A arbitrarily. Preserve the stronger interface “for every A, there is a distant B”: the final moduli-degree theorem applies to every A, not just one selected representative.

### 4.2 Quantitative isogenies are not qualitative isogeny criteria

The needed contract is

```text
minDegree_C(A,B) <= C_g * max(1, h_F(A), [k:Q])^kappa_g
```

for geometrically isogenous dimension-g abelian varieties defined over a common number field k. The isogeny need not preserve a chosen polarization. The source [Masser–Wüstholz, Factorization estimates](https://www.numdam.org/item/PMIHES_1995__81__5_0.pdf), Theorem II and the field-degree discussion, was checked at printed pp. 7 and 24. The polarization dependence is removed using Zarhin's trick, and the field-degree dependence must remain visible. Adding 1 to the maximum avoids a sign issue with Faltings height.

### 4.3 The averaged formula and analytic estimates

The deep averaged Colmez input already has paper jobs #1143 (Andreatta–Goren–Howard–Madapusi Pera) and #1145 (Yuan–Zhang, including its 2023 erratum). Import their eventual accepted results instead of making a duplicate extraction. Bost's lower bound isolates an individual height from the sum over all 2^g types. The bound is a real lower bound, not positivity of stable Faltings height.

The following interfaces still need direct verification before closure: polynomial conductor-discriminant control for the actual representations, the completed functional equation with conjugate representation and gamma factors, two-sided control at 1, and derivative estimates. The trivial Artin factor must be split off before evaluating at 1. A fixed-radius Cauchy argument for an arbitrary Artin L-function cannot silently use the Artin holomorphy conjecture; a Hecke-level argument through Brauer induction, with pole cancellation handled, or a direct argument for the averaged expression must be specified. These are verification tasks, not a claim that the published theorem is false.

Only a bound `log f_rho <= C_g (1 + log |Disc(E)|)` is needed. The extraction records this sufficient contract rather than asserting an unchecked literal conductor inequality from the compressed proof. All constants must be uniform in E and Phi for fixed g; ineffective constants are allowed where the argument uses them.

### 4.4 Field of moduli versus field of definition

The published Lemma 4.1 is essential. Full level-3 rigidification and the cited Silverberg homomorphism result produce F'/F with degree at most `2*3^(4g^2)`, defining A, its endomorphisms and polarizations. An ideal quotient then descends because the endomorphisms defining its finite subgroup scheme do. The common-field degree used in the published proof is bounded by `4*3^(8g^2)` over the initial field of moduli.

Do not apply Masser–Wüstholz over a coarse moduli residue field before constructing a model. The direct hypotheses of Silverberg Proposition 2.3 and the polarization conventions on the quotient remain to be checked. This is separately visible in the JSON rather than hidden in a one-line “CM orbit bound” node.

### 4.5 From primitive fields to arbitrary CM orders

The general theorem concerns the discriminant of `R_x = Z(End(A_x))`, including products and nonmaximal orders. It does not follow by substituting a maximal CM field into the primitive estimate. Tsimerman's 2012 Theorem 7.1 supplies a nontrivial reduction that still needs direct extraction.

Keep three class groups distinct: Cl(K), Cl(K*) and Cl(L), where K* is the reflex field and L is the normal closure. The reflex norm gives r, and the normal-closure version is r composed with N_{L/K*}. The norm-image index is bounded in g. The polarized kernel H differs from ker(r) by a totally positive real-unit norm obstruction. Write the ideal norm on K*, where I lives, not the incompatible field subscript in the compressed source notation.

The CM reciprocity theorem must also distinguish absolute moduli degree from degree after adjoining the reflex field. The extraction keeps the sufficient dimension-uniform inequality and leaves the exact base-field convention for direct verification against Shimura–Taniyama.

## 5. Geometric proof interfaces

The source [Pila–Tsimerman, Ax-Lindemann for A_g](https://doi.org/10.4007/annals.2014.179.2.5) was used to check the interfaces suppressed in the two-page sketch: Lemma 3.3, Theorem 6.1, Theorem 7.1 and Lemmas 7.2–7.3.

The counting chain is:

```text
arbitrary-CM-order orbit bound
  + fundamental-set lift height and bounded degree
  + restricted uniformization definability
  -> many algebraic points in a definable set
  -> positive-dimensional semialgebraic pieces
  -> maximal complex algebraic pieces
  -> weakly special subvarieties
  + a CM point
  -> special subvarieties.
```

The height convention and bounded-degree algebraic-point extension of Pila–Wilkie must agree. The original rational-point theorem alone is insufficient. The degree bound only needs to depend on g; do not claim that a field generated by every coordinate has degree exactly 2g without checking the original height theorem. Boundary multiplicities of a fundamental set and the passage from the absolute Galois orbit to the orbit over the field defining V also need explicit bounds.

Ax–Lindemann concludes **weakly special**, not special. A CM point is the additional input that promotes it. Moreover, a real semialgebraic arc is not by itself a complex algebraic variety; the maximalization/algebraicity step has its own source lemma.

Finally, producing special subvarieties through almost every CM point is not yet finiteness of maximal special subvarieties. The finite group/family-type argument uses definability together with countability of rational group data and normalizer/stabilizer structure. It is not just an invocation of cell decomposition. The final parameter-locus construction and induction in Pila–Tsimerman remain an explicit handoff task.

## 6. Candidate Part II briefs — not accepted routes or reserved IDs

### Complex multiplication and explicit reciprocity, Part II: CM heights and Galois-orbit bounds

Import CM types, reflex norms and reciprocity from **Complex multiplication and explicit reciprocity** (`ComplexMultiplicationAndExplicitReciprocity`, CM.0 and CM.2), the general CM theorem through **Shimura varieties** (`ShimuraVarieties`, V5), and stable heights from **Arakelov geometry and heights of abelian varieties** (`ArakelovGeometryAndAbelianHeights`, R35.3). Use the existing averaged-Colmez paper outputs, not a second proof programme. Cover height constancy, the subpolynomial CM-height deduction, distant ideal isogenies, polarized descent and reciprocity kernels, and the reduction to arbitrary centre orders. Target the primitive moduli-degree estimate and the all-CM-point orbit estimate. Import a separately owned quantitative isogeny theorem. Do not rebuild CM fields, the existing regulator formula, Neron models or general projective heights.

### Faltings finiteness, semisimplicity and isogeny theorems, Part II: Quantitative isogeny estimates

Extend **Faltings finiteness, semisimplicity and isogeny theorems** (`FaltingsFinitenessAndIsogenyTheorems`) only after verifying that no existing layer or accepted packet already supplies the quantitative theorem. Import abelian varieties, Hom groups, polarizations and Zarhin's trick from their owners and the stable height from **Arakelov geometry and heights of abelian varieties** (`ArakelovGeometryAndAbelianHeights`, R35.3–R35.6). Extract the Masser–Wüstholz proof inputs needed for a minimum-isogeny-degree bound polynomial in height and field degree, with constants depending only on dimension. Separate geometric from rational isogenies, eliminate polarization-degree dependence, and export the exact common-field interface consumed by the CM-orbit argument. Do not relabel the qualitative Tate isogeny criterion as this result.

These briefs are leads for the next ownership screen. They reserve no IDs and do not create design jobs. General Brauer–Siegel/Artin analysis might require a different owner after that screen.

## 7. Regression obligations for the eventual blueprint

These are proposed tests, not executed Lean tests.

1. For an imaginary quadratic field, the CM regulator formula uses unit rank zero and the actual Hasse-index convention; for a non-Galois CM field, no artificial `IsGalois Q E` assumption appears.
2. A product CM point and an isogenous point with nonmaximal centre order remain covered by the general orbit interface. The primitive maximal-order theorem alone must not typecheck as a replacement.
3. Changing the number field after semistable reduction and changing the Hodge section preserve the normalized stable height; a negative stable height does not violate Bost's lower-bound contract.
4. A polarized coarse moduli point without a chosen model cannot instantiate the isogeny estimate before the descent witness is supplied.
5. Changing a representative of an ideal class leaves H invariant; the reflex norm's domain and the normal-closure norm's domain are not interchangeable.
6. A weakly special fixed-factor example with nonspecial fixed coordinate does not satisfy “special” merely from Ax–Lindemann. Adding a CM point discharges the missing hypothesis.
7. Pila–Wilkie is instantiated with a fixed algebraic degree bound and the same height as the CM lift estimate; a rational-points-only interface is rejected.
8. The finite-family and lower-dimensional induction steps remain dependencies of finite maximality, not comments after a proof of pointwise coverage.

## 8. Checks, limitations and resumption

The repository's `check_paper.py` was reproduced byte-for-byte and its Git blob verified as `cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f`. Its `check()` function passed on the local draft against a fixture of the three referenced owners, transcribed from the fetched roadmaps and extracts. All 65 IDs were unique; the local dependency graph was acyclic and all references resolved. As a negative control, changing the local draft to complete produced 37 unrouted-item errors. The full `known()` loader was not run against a fabricated atlas. PR CI must validate the submitted files against the actual repository.

No Lean compilation was run, and this paper job does not require a suggested Lean file. No result here is claimed newly formalised.

The handoff lists the concrete next reads. Completion still requires the accepted audit, the remaining cited proof interfaces, a complete second upstream-document read, reserved-ID/packet/link/decomposition screening, real ownership for every currently unrouted item, a downloaded-source checksum when access permits, and the full repository validator. Do not convert the status to complete merely because the JSON schema passes.
