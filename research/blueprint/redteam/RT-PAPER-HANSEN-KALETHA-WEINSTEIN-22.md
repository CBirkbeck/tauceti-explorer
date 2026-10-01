# Red team: Hansen–Kaletha–Weinstein, local shtuka spaces

Codex, session `codex-rtOQ9t`, 1 October 2026. Target: `PAPER-HANSEN-KALETHA-WEINSTEIN-22`, accepted by `REV-PAPER-HANSEN-KALETHA-WEINSTEIN-22`. Neither job was done by this worker. Atlas baseline: `a97a6a4a90d113e32c44e3170064aefed84548c1`.

Six findings need verification: two high and four medium. The two high findings concern auxiliary statements that the extraction reproduces from the paper. Neither is a claim against the main Kottwitz theorem. This report proposes corrections to the extraction; it does not edit the accepted extraction or the atlas's base roadmap files.

| Finding | Severity | Affected material | Required correction |
|---|---|---|---|
| 1 | High | `/127`, Example 4.1.1 | Account for the torsor underlying a general map of classifying stacks. |
| 2 | High | `/059`, Example 4.3.10 | Add properness of the correspondence space for the stated global trace. |
| 3 | Medium | `/072`, route 2 | Import the actual comparison owner, `AdicCoefficientsAndComparisons:L3`. |
| 4 | Medium | `/002–/005`, route 1 | Extract the FS parameter construction, induction compatibility and Hecke/excursion input. |
| 5 | Medium | `/123–/124`, route 3 | Extract the Langlands data and Dat classification used in Appendix C.2. |
| 6 | Medium | `/079`, route 1 | Extract the cited fixed-point/apartment theorem. |

## Sources and scope

I read the complete mathematical TeX of [arXiv:1709.06651v4](https://arxiv.org/abs/1709.06651v4), including all seven files included by the main document and its bibliography. I compared the relevant passages with the [published article](https://doi.org/10.1017/fmp.2022.7), *Forum of Mathematics, Pi* 10 (2022), e13, using its 79-page pagination. The arXiv PDF has 96 pages. In particular, the published pages 22, 33 and 76 were also inspected as images. This records a complete reading of the v4 mathematical source plus targeted published-version verification, rather than a second full reading of all 79 published pages.

The following SHA-256 fingerprints identify the public downloads read on 1 October 2026:

| Download | SHA-256 |
|---|---|
| [Published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050508622000075) | `8d5cbe2abb46d5ca99d2e489ee9cd1fac261962aa4900b94019cd1ff292bbf3d` |
| [arXiv v4 PDF](https://arxiv.org/pdf/1709.06651v4) | `d37e986ef599420a8e206dc289e18965422b03ec923184737fbcead2abc0bd5c` |
| [arXiv v4 source archive](https://arxiv.org/e-print/1709.06651v4) | `ff665124be0feef5a7d9450139bf23602a866743ecdd36bc5174a30e3d60bdb4` |

The publisher stamps its PDF with download information, so later downloads may have another hash. The obsolete `LefschetzVerdier.tex` in the source archive is not included by the main document; the reading uses `LefschetzVerdierRevised.tex`.

I read all 128 items, five routes, 17 prerequisites and 14 existing source issues, together with the accepting review. A fresh atlas assembly resolves all 25 distinct planned stage IDs; all 106 missing items have exactly one route. There are 22 planned items and no `library` items. The full `checked` list in the result records the library, stage and ownership checks. In particular, the existing source issues are not counted as new findings here.

## 1. General maps of classifying stacks need a torsor

Item `/127` repeats Example 4.1.1 on published p. 22. The assertion about all maps is false over an arbitrary diamond base, even up to 2-isomorphism.

Take `S = Spd(Q_p)`, the trivial group `G`, and the constant group `H = Z/2`. There is only one group homomorphism `G → H`. Its induced map `S = BG → BH` represents the trivial torsor. But an unramified quadratic extension `L/Q_p` gives the nontrivial `H`-torsor `Spd(L) → Spd(Q_p)`, and therefore a different map `S → BH`. It has no section over `S`, hence is not isomorphic to the trivial torsor.

For a general map `BG → BH`, the image of the trivial `G`-torsor is an `H`-torsor `P` on `S`, with a compatible `G`-action. A chosen trivialization of `P` reduces this to a homomorphism `G → H`. Without the trivialization, `P` cannot be discarded. The formula in `/127` for conjugation 2-morphisms between maps already induced by specified homomorphisms can be retained.

The fix should correct `/127`, explain the qualification in route 2, and record the source problem under `sourceIssues`. This affects the general mapping statement, not the legitimate later constructions starting from homomorphisms.

## 2. The global correspondence trace needs proper support

Item `/059` follows Example 4.3.10, p. 33. The theorem invoked immediately before it, Theorem 4.3.8 on pp. 32–33, requires both vertical maps `q:X → X'` and `p:Y → C'` to be proper. Setting `X'=C'=S` therefore requires `Y → S` proper as well as `X → S` proper. The example and extracted item omit the former.

There is a direct failure within the stated category. Let `X=S=Spd(C)` for an algebraically closed perfectoid field, let `A=Λ=F_ell` with `ell` different from the residue characteristic, and let `Y` be a countably infinite disjoint union of copies of `S`. Both legs of the correspondence are the étale structure map. It is fine: locally on each component it is the identity. The identity of the constant sheaf is a cohomological correspondence because exceptional and ordinary pullback agree for this étale map.

The fixed locus is `Y`. Its trace class is the sequence `(1,1,1,…)`. Ordinary degree-zero sections give `∏_n Λ`, whereas compactly supported sections give `⊕_n Λ`. The sequence belongs only to the former, so the compact-support trace counit cannot integrate it. The issue is the absence of the operation asserted in `/059`, not a choice of value for an infinite sum.

The paper itself makes the necessary conditions explicit in §5.3, p. 48: properness of the first leg is used to obtain the cohomology operator, and a proper component is used for its local term. Add properness of `Y/S` to `/059`; with `X/S` proper this is equivalent to properness of the first leg. For an automorphism correspondence `Y=X`, it is automatic. Record a source issue for the general example, without extending the allegation to the paper's proper Hecke-correspondence applications.

## 3. The characteristic-p comparison lives in L3

Item `/072` packages the perfect-scheme/v-sheaf comparison used in §5.3. Its planned array lists `AdicCoefficientsAndComparisons:L1` and `L2`, and route 2 repeats those imports. The fresh stage contracts distinguish three jobs:

- `L1` constructs the v-sheaf and comparison maps of sites.
- `L2` extends scheme compact support and its coefficients to the needed qcqs range.
- `L3` proves ECD 27.1–27.4, including derived full faithfulness and the exceptional-operation comparison.

The reviewed `AUDIT-18` coverage agrees with this division. Add `L3` as the actual theorem supplier; `L1/L2` remain relevant prerequisites. This needs no new roadmap.

## 4. Extract the parameter inputs in §§6.5–6.6

The proof of Theorem 6.5.1 on p. 68 obtains a common FS parameter for the irreducible constituents of

`H*(i_1^* T_(V_mu^vee) i_b* rho)`

and invokes FS I.9.6(viii) to deduce their supercuspidality under the stated parameter hypothesis. Section 6.6 then uses FS I.9.1 to construct the parameter, I.9.6(viii) to reduce to supercuspidals, and Hecke/excursion compatibility to identify the parameter of the constituent that realizes the inner-form transfer.

Item `/005` extracts the split `GL_n` comparison. It does not extract these other direct inputs. The route names some excursion stages, but the relevant statements have no extraction entries. The current `ES5` contract supplies the parameter assignment, and `ES7:parabolic` supplies induction compatibility with its explicit normalization dictionary. `ES6` is not a substitute for the latter.

Add these supplier items and their statuses; locate the precise Hecke/excursion interface in the existing excursion/Hecke direction and make any missing component a source addition there. State the consequence for the irreducible constituents used in this paper. No proof closure of FS is requested.

## 5. Appendix C.2 omits the Langlands-data inputs

The unnumbered paragraph between Lemmas C.2.3 and C.2.4, p. 76, is mathematically substantive. It specifies a standard Levi, a ν-tempered irreducible representation, and an unramified character in the specified positive chamber. It then invokes Dat's Theorem 3.11: the induced representation has a unique irreducible quotient, and every irreducible representation arises from essentially unique such data. This makes the standard representation `I(π)` and invariant `λ_π` well defined.

Items `/123–/124` begin with the lattice consequence and subsequent inequalities. Neither the underlying ν-tempered notion nor the classification is an item. Route 3 mentions the classification in prose, so it already provides the intended owner: `SmoothRepresentationsCharactersPartII`. The parent `SR.2` supplies induction, Jacquet functors and the geometric lemma; it does not state this ℓ-adic classification.

Extract the definitions and the classification theorem. In `/124`, also state the positive-chamber conditions and specify the exponents of the indicated opposite-parabolic Jacquet module in Proposition C.2.5. This is an extraction correction, not a demand to decompose Dat's proof.

## 6. Extract the building fixed-point input

The proof of Proposition 5.1.2, p. 45, explicitly invokes Tits79, 3.6.1. For the relevant torus element, every root value has nontrivial reduction. The cited result places its fixed points in the torus apartment of the reduced building. The subsequent apartment-transitivity and normalizer argument then identifies the Grassmannian fixed points with torus cosets.

Item `/079` records the final Grassmannian theorem and mentions a building proof. There is no item for the cited fixed-point input. `ReductiveGroupsPartII:RG2.2` owns the building direction and a bounded-subgroup fixed-point statement, but existence of a fixed point for a bounded subgroup does not identify the fixed locus of a particular element with its apartment.

Extract the exact supplier statement with its valuation, split-group and root-value hypotheses, and route it as a source addition to the existing building direction. This neither creates a second building nor asks the extraction worker to close the Bruhat–Tits proof chain.

## Boundaries and validation

The proposed rigid-inner-form and generic relative-trace sharing instructions were checked against the current stage data and proposed-roadmap files. I did not establish a new duplication finding. Mathlib's ordinary `CategoryTheory.ExactPairing` and `HasRightDual`, read at the pin, are not the missing full 2-categorical trace theorem. The current finite-group and lattice primitives likewise do not establish the local-group or diamond endpoints. The report does not claim a new formalization.

The four medium findings are limited extraction corrections: an existing theorem owner or explicit inputs of HKW need to be recorded accurately. PROTOCOL §16 leaves supplier proof closure and detailed blueprint APIs to later jobs.

The publisher page, arXiv history and title/erratum searches revealed no correction addressing findings 1–2 in the sources checked on 1 October 2026. This bounded search is not an assertion that no such correction exists.

Validation: `scripts/check_redteam.py` and the intake `check-files` validator, plus the staged whitespace check. No Lean file is a deliverable, and no Lean build was run.
