# Qian (2023): extraction and routing

L. Qian, *Potential automorphy for GL_n*, Invent. Math. **231** (2023), 1239–1275, doi [10.1007/s00222-022-01161-6](https://doi.org/10.1007/s00222-022-01161-6); preprint [arXiv:2104.09761](https://arxiv.org/abs/2104.09761) (only v1).

Issue #1252. Extracted by Codex (session `codex-a71f92`) and completed by Claude Code (session `cc-442dc5`), 22–23 September 2026. **Corrected in place by the independent review REV-PAPER-QIAN-23** (issue #1253, Claude Code, session `cc-72825f`); every change is listed in `research/blueprint/reviews/REV-PAPER-QIAN-23.md`. This report describes the corrected file.

145 items (12 library, 30 planned, 103 missing), 16 routes taking every missing item exactly once, 48 confirmed mistakes in `sourceIssues` (one further record withdrawn), 11 prerequisites. No formalisation is claimed; no Lean file is part of this job.

## The sources read

- **The published paper.** The online-first Springer PDF (37 pages, SHA-256 77969caa…), from the NSF public-access repository ([par.nsf.gov/servlets/purl/10388233](https://par.nsf.gov/servlets/purl/10388233)). Its text is the issue text; published page = PDF page + 1238. Every locator in the paper gives the statement and published page; items taken from the companion preprint or other sources cite those.
- **arXiv v1** (April 2021, 27 pages), the only arXiv version. It differs from the published text: v1 defined ordinary automorphy on the Galois side and its proof of Theorem 1.1 has the gap E13, which the published Lemma 4.3 and Remarks 3.13 and 4.4 repair.
- **The companion preprint** L. Qian, *Ordinarity of local Galois representation arising from Dwork motives*, [arXiv:2103.00106v1](https://arxiv.org/abs/2103.00106) (24 pages, unpublished, only version), read in full. The published paper uses only its Lemma 2.1 (the semistable blow-up, in the proof of Lemma 3.3(2)); Remark 3.13 says its main result is not needed.
- **Cited sources**, at the places the paper uses them: Allen et al., *Potential automorphy over CM fields*, Ann. of Math. 197 (2023) (ACC+; author PDF, pages equal to the Annals pages); Barnet-Lamb–Geraghty–Harris–Taylor, *A family of Calabi–Yau varieties and potential automorphy II* (BLGHT); Varma, arXiv:1411.2520.

## What the paper proves

**Theorem 1.1** (p. 1239). Let F be a CM field, F^av/F finite, n ≥ 2, l an odd prime and r̄: G_F → GL_n(F_{l^s}) continuous and semisimple. Then there is a finite CM extension F′/F, Galois and linearly disjoint from F^av, over which r̄ is ι-ordinarily automorphic. Neither polarizability nor residual irreducibility is assumed.

**Theorem 1.4** (p. 1241) deduces potential automorphy of an ordinary l-adic lift with enormous, decomposed generic residual image from Theorem 1.1 and ACC+ Theorem 6.1.2. That theorem needs p > n, and the paper proves Theorem 1.4 only for l > n (E2).

**The method.** Qian breaks the self-duality of the Dwork family of Harris–Shepherd-Barron–Taylor while keeping its Hodge–Tate weights consecutive: an asymmetric character χ of the symmetry group cuts out a rank-n eigensheaf whose residual monodromy is all of SL_n (Lemma 3.7). A torsor of determinant-preserving isomorphisms with two prescribed residual representations, at l and at an auxiliary prime l′, is geometrically connected (Proposition 3.8), so Moret–Bailly gives a fibre that realizes both (§4). At l′ the fibre's representation is automorphic, by the elliptic symmetric-power seed and ACC+ Theorem 6.1.2; automorphy passes to l through the compatible system, and a Steinberg argument (Lemma 4.3) shows that the automorphic representation is ι-ordinary.

## Items

Every numbered statement of the paper is an item, together with the definitions and cited results on the way to Theorems 1.1 and 1.4: 12 library, 30 planned and 103 missing. Items 113–145 were added by the review.

**In the libraries (12).** Linear disjointness and its intersection criterion for finite Galois extensions, Goursat's lemma, and Gauss sums with the product and change-of-character identities are in Mathlib; the finite special unitary group is Mathlib's `Matrix.specialUnitaryGroup` once the Frobenius involution is supplied as the star structure. Continuous H¹ and H² of profinite groups, H¹ for a trivial action, the connecting maps with the eight-term low-degree exact sequence, and restriction, inflation and corestriction with Cor ∘ Res = index are in Tau Ceti (`TauCeti.ContCohomology`). Each item's `library` field names the declarations, which were read at the pinned commits.

**Planned (30).** Each item's `planned` field names the stages that plan it, and most notes quote the stage's text. The main owners are: ArithmeticGaloisRepresentations R01.1, R01.2, R01.4 and G7 (residual representations, Weil–Deligne representations, Dickson's theorem, enormous image); AutomorphicGaloisRepresentationsPartII AG2.0, AG2.4, AG2.5 and AG2.7 (regular algebraic cuspidal representations, r_{l,ι}(π), Varma's bound, genericity and decomposed genericity); ArithmeticGaloisDuality R02.2–R02.4 (locally trivial cohomology and Poitou–Tate duality); PadicHodgeTheory R06.2 (labelled period functors); CohomologyComparisons CP.2–CP.4 (crystalline, de Rham and equivariant semistable comparison); CrystallineCohomology CR.5 and CR.6 (log structures and Hyodo–Kato cohomology); EndoscopicTransferAndUnitaryTraceComparison ET.6 and ET.7a (local Langlands for GL_n, quadratic base change); PotentialModularityAndCompatibleSystems R23.1 (Moret–Bailly, Proposition 4.2); PotentialAutomorphyInfrastructure PA.5 (base change of the lifting hypotheses); and Tau Ceti's Chebotarev, ProfiniteCohomology, LocalFieldsRamification and ClassFieldTheory roadmaps.

## Routing

| Route | Owner | Items |
|---|---|---:|
| 1. source | `ModularityAndLanglandsExtensions` — ML.2 | 11 |
| 2. source | `ArithmeticGaloisRepresentations` — G7 | 1 |
| 3. source | `PadicHodgeTheory` — R06.2 | 4 |
| 4. source | `PotentialAutomorphyInfrastructure` — PA.2 | 3 |
| 5. source | `PotentialAutomorphyInfrastructure` — PA.4 | 1 |
| 6. source | `PotentialAutomorphyInfrastructure` — PA.5 | 4 |
| 7. source | `PotentialModularityAndCompatibleSystems` — R23.1 | 2 |
| 8. source | `ArithmeticGaloisDuality` — R02.2, R02.4 | 3 |
| 9. source | `SchemeAndStackFoundations` — SF.4 | 3 |
| 10. source | `CrystallineCohomology` — CR.5:log-algebra, CR.5, CR.6 | 3 |
| 11. source | `ComplexComparisonPartII` — C2, C3, C5 | 2 |
| 12. source | `LefschetzPencilsAndVanishingCycles` — LPV.1 | 1 |
| 13. part-ii | `PotentialAutomorphyDworkMotivesPartII` — *Reusable infrastructure for potential automorphy over CM fields, Part II: Dwork switching motives* (`langlands`) | 61 |
| 14. part-ii | `HodgeStructuresPartII` — *Hodge structures (pure, mixed, and polarized), Part II: variations, period maps and non-abelian Hodge theory* (`algebraicgeometry`) | 1 |
| 15. part-ii | `PolarizedAutomorphyLifting` — *Reusable infrastructure for potential automorphy over CM fields, Part II: polarized automorphy lifting and finiteness of deformation rings* (`automorphic`) | 1 |
| 16. part-ii | `OpenImageTheoremsForAbelianVarieties` — *Faltings finiteness, semisimplicity and isogeny theorems, Part II: ℓ-adic and residual images of abelian varieties (Serre's open-image theorems)* (`arithmeticgeometry`) | 2 |

**The Dwork Part II (route 13).** Nothing in the atlas plans the Dwork family, its eigensheaves, their monodromy or the switching torsor; ModularityAndLanglandsExtensions ML.2, where other extractions send the family, only assembles final theorems. The family is reusable infrastructure for potential automorphy over CM fields (ACC+ Proposition 7.2.3 rests on its self-dual version, and Qian's n = 2 case is BLGHT's family), so it is a Part II of PotentialAutomorphyInfrastructure that owns the family once for every exponent vector. It also owns the lemmas only it uses: Lemma 2.1 with its proof steps, the auxiliary modulus of Lemma 2.3, the finite-group inputs of Lemma 3.7 and Proposition 3.8 (Zalesskii–Serezhkin, normal subgroups of SL_n, Artin's non-isomorphism theorem), and, as an optional last layer, the companion preprint's semistable models and main theorem. The switching theorem takes the auxiliary prime and the seed as hypotheses, so the Part II never imports ML.2 or ML.3. Its brief states the final theorems with the corrections this paper needs. Boxer–Calegari–Gee–Newton–Thorne (2025) join the same proposal.

**ML.2 (route 1)** owns Theorems 1.1 and 1.4 and every step of their proof that uses both the Dwork family and automorphy: the choice of N, of the elliptic curve and of l′ (Proposition 4.1), the elliptic symmetric-power seed, the automorphy of the fibre at l′, its transfer to l, and the Steinberg argument of Lemma 4.3 and Remark 4.4. These cannot sit in PotentialAutomorphyInfrastructure, which ML.2 requires, or in ML.3, which requires ML.2.

**PotentialAutomorphyInfrastructure.** PA.2 (route 4) owns ι-ordinarity (Geraghty's Definition 5.3 and Qian's Definition 1.3) and the general Steinberg ordinarity criterion split out of Lemma 4.3. PA.4 (route 5) owns ACC+ Theorem 6.1.2, the output of the patching layers. PA.5 (route 6) owns the decomposed-genericity lemmas (Lemma 2.6(2), ACC+ Lemmas 7.1.6(3) and 7.1.7). They need decomposed genericity, which AutomorphicGaloisRepresentationsPartII AG2.7 defines, so PA.5 must add AG2.7 as a prerequisite; ArithmeticGaloisRepresentations G7 cannot take them, since AG2.7 requires G7.

**The other source routes** send general statements to their owners: enormity of symmetric powers to ArithmeticGaloisRepresentations G7; the regular ordinary definition and the ordinarity criteria to PadicHodgeTheory R06.2; linear disjointness and the Clozel–Harris–Taylor field-selection lemma to PotentialModularityAndCompatibleSystems R23.1; the Kummer kernel computations to ArithmeticGaloisDuality R02.2/R02.4; toroidal semistable reduction to SchemeAndStackFoundations SF.4; the log-crystalline comparison to CrystallineCohomology; proper logarithmic GAGA and the local freeness of the Hodge filtration to ComplexComparisonPartII; maximal nilpotence to LefschetzPencilsAndVanishingCycles LPV.1.

**Joined proposals (routes 14–16).** The Gauss–Manin residue of a semistable degeneration joins the proposed Hodge-structures Part II, which plans the Deligne canonical extension. Geraghty's Lemma 5.9 joins the proposed Part II PolarizedAutomorphyLifting. Serre's open-image theorem and the density of supersingular primes join the proposed Part II OpenImageTheoremsForAbelianVarieties. Each keeps the id, parent, title and area of the proposal it joins.

## Source issues

`sourceIssues` records 49 entries: 48 confirmed mistakes (26 misprints, 8 errors, 14 gaps), of which 5 affect a stated result, 13 a proof and 30 nothing downstream, and E10, withdrawn. E1–E13 were recorded by the extraction; E14–E49 were found by the review. Every entry was checked at its locator on the page images; every error and gap was confirmed by two independent checks, with a third reading where they differed. No erratum to the paper exists; one gap of arXiv v1 (E13) is repaired in the published version.

**Stated results affected.**
- **Theorem 1.4** (p. 1241) is not proved for odd primes l < n with l ∤ n, since ACC+ Theorem 6.1.2 requires p > n; the first open case is n = 4, l = 3 (E2, a gap).
- **Lemma 3.12** (p. 1267) needs the hypothesis v(t) < 0: for t ∈ O_{F_v} with t^N − 1 a unit, V_{λ′,t} is unramified at v and N = 0 (E1). The lemma is only used with v(t) < 0.
- **Lemma 3.7** (p. 1259): its first assertion, on ρ̄_{t′}, is false for n = 2 for the sheaf the paper defines, since det ρ_{t′}(γ_0) is a primitive N-th root of unity; for n = 2 only the second assertion, from BLGHT Corollary 4.7, is true and needed (E31).
- **The companion preprint, Lemma 4.2** omits the Hodge–Tate hypothesis of BLGHT Lemma 2.2(2), and maximal monodromy alone does not give an ordinary flag (E11). **Its Theorems 1.6 and 3.2** are false without properness: for the affine line over W[T] the two sides differ in degree 1 (E12). The paper's Dwork models are proper, and Theorems 1.1 and 1.4 use neither statement.

**Proofs affected; the results hold with the recorded repairs.** The reduction in the proof of Lemma 3.3(2) shows only that the N-th power of the monodromy at infinity is unipotent (E27; prove (2) through the hypergeometric description), and the proof of Lemma 3.3(3) relies on a symplectic step that the non-self-dual sheaf lacks (E28). The n = 2 case of the proof of Lemma 3.9 uses an automorphism that need not exist (E33). The proof of Lemma 2.6(2) applies ACC+ Lemma 7.1.6(3) to a pair of fields that need not satisfy its hypotheses (E22). In §4: the auxiliary prime must be unramified in F^avoid (E36); the n-th roots at l′ need l′ ≡ 1 mod n or a gcd argument (E7); Lemma 3.9 must be supplemented at l′ (E6); the single application of Lemma 2.1 to a character with values in a product of two finite fields must be split into two applications, with the avoided field enlarged in between, or replaced by a product version of the lemma (E37); the transfer of automorphy from l′ to l gives only the semisimplification (E40), and Lemma 4.3 needs a corrected sign (E43) and an argument that does not assume V_{λ′,t} semisimple (E41). In the companion preprint, the analytic disc may contain singular fibres (E49). The proof of Theorem 1.1 in arXiv v1 has a gap that the published version repairs (E13). The sentence on p. 1270 that misquotes the roots-of-unity condition (E5) is only a misprint: §4 states the condition correctly on p. 1268.

**Withdrawn.** E10 said that the proof of Lemma 3.3(2) asserts W(k)[1/p] ≅ C. The page prints an overline over W(k)[1/p]: the isomorphism is between its algebraic closure and C, which exists.

The full list, with every printed text, correction and reason, is in the result file.

## Open gaps

S1–S10 record what the extraction did not read at source level: the original proofs of Moret–Bailly and the character-root lemmas (S1); Deligne's Fermat computations, Beukers–Heckman and BLGHT §4 (S2); the Zalesskii–Serezhkin classification (S3); Geraghty's Hecke calculations (S4); coefficient transfer (S5); Varma's proof (S6); the toroidal and logarithmic comparisons (S7); and the final itemisation audit (S10). S8 (the companion's ordinarity theorem) and S9 (independent review of the findings) are resolved by the review.

## Prerequisites

The companion preprint; Beukers–Heckman (Levelt's theorem); Deligne, *Hodge cycles on abelian varieties*, §7; Zalesskii–Serezhkin; Geraghty, *Modularity lifting theorems for ordinary Galois representations*; BLGHT; Varma; Serre (1972) and Serre (1981); Kempf–Knudsen–Mumford–Saint-Donat; and Illusie, *Autour du théorème de monodromie locale*. ACC+ is extracted as PAPER-ALLEN-ETAL-23.

## Notes for the maintainer and for the design jobs

- **Calegari–Geraghty (2018).** That extraction routes its Dwork family and the geometric half of its Dwork point to ModularityAndLanglandsExtensions ML.0–ML.3, which plan no geometry. When it is reviewed, those items should join the Dwork Part II, and ML.2 should keep their automorphy arguments.
- **Boxer–Calegari–Gee–Newton–Thorne (2025)** joins the Dwork Part II with the area `modular`, which is not a galaxy id. This file uses `langlands`; that extraction's route should follow.
- **ACC+ (PAPER-ALLEN-ETAL-23)** places Theorems 6.1.1, 6.1.2 and 6.6.2 at PotentialAutomorphyInfrastructure PA.3, which closes a cycle with PA.4; they belong at PA.4 with item 072. Its Lemmas 7.1.5–7.1.7 sit at ArithmeticGaloisRepresentations G7, which AG2.7, where decomposed genericity is defined, requires; they belong at PA.5 with items 027 and 089.
- **New stage dependencies.** The routing needs edges the atlas does not have yet, none of which closes a cycle: AG2.7 → PA.5 (decomposed genericity for the base-change lemmas), PA.2 and PA.5 → PA.4 (inputs of ACC+ Theorem 6.1.2), and PA.2, PA.4 and the Dwork Part II → ML.2.
- **Blueprint requirements.** R01.1 must add the rank-n descent of a continuous representation with discrete target to a finite coefficient field. R23.1 must state Moret–Bailly with all three kinds of local condition. R02.4 must state Poitou–Tate duality for the full absolute Galois group with all places. CR.6 must state the N-equivariant comparison with the log de Rham cohomology of a Witt lift, with properness. LocalGaloisDeformationRings L7 should specialize to item 002 rather than define ordinarity again.
- **Lemma 3.3(2)** needs a proof through the hypergeometric description (E27); the design job for the Dwork Part II should plan it that way rather than follow the printed argument.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-QIAN-23.result.json` and `python3 research/blueprint/intake.py check-files` pass on the corrected file. Every planned and route stage id is an atlas stage; every missing item is taken by exactly one route and no other item by any; the joined proposals' ids, parents and titles match the extractions that proposed them. No Lean deliverable is part of a paper job.
