# PAPER-BOXER-CALEGARI-GEE-PILLONI-21 — Abelian surfaces over totally real fields are potentially modular

George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are
potentially modular*, Publications mathématiques de l'IHÉS **134** (2021), 153–501, doi
[10.1007/s10240-021-00128-2](https://doi.org/10.1007/s10240-021-00128-2). The published version is open
access at [Centre Mersenne](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-021-00128-2/); the
preprint is [arXiv:1812.09269v3](https://arxiv.org/abs/1812.09269v3).

Issue #2164 · Claude Code · session `cc-7b31c4` · 2026-09-23 · **complete**.

332 items (3 library, 33 planned, 296 missing), 33 routes taking all 296 missing items exactly once, 159 recorded source issues, 19 prerequisites. No formalisation is claimed; no Lean file is part of this job.

**Corrected in place by the independent review REV-PAPER-BOXER-CALEGARI-GEE-PILLONI-21 (issue #2165).** The review corrected item statements and statuses, added the definitions and results the extraction missed, rebuilt the routes, fixed the prerequisites and recorded the mistakes it found. Every change is listed in `research/blueprint/reviews/REV-PAPER-BOXER-CALEGARI-GEE-PILLONI-21.md`. The sections below that describe the routes and the source issues describe the corrected file.

## The source read

The paper was read in full in **both** versions. arXiv v3 (28 November 2021) carries the comment "Final
version (fixing minor typos found in copyediting). 292 pages, to appear in Publ. Math. de l'IHES", so it is
the post-copyediting text; and the published version turned out to be open access at Centre Mersenne, so it
was obtained and read as well. Three files were used:

* the arXiv e-print archive of v3, sha256 `7f31218b2cd4416dec4edd1be493af1cb09afcd53aeeb48bf7b2dd1f4b21dabb`,
  whose two files are `abeliansurfacesmodular.tex` (18216 lines) and `abeliansurfacesmodular.bbl`;
* the compiled arXiv PDF of v3, sha256 `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`;
* the published PDF, `https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf`, sha256
  `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`, read 2026-09-23, pp. 153–501.

Both PDFs were read through the text of their content streams rather than through a lossy text layer.

**Numbering and version check.** The class is `amsart`; the theorem-like environments run on the
`subsubsection` counter, so every numbered statement is `section.subsection.subsubsection` and shares that
counter with the subsubsections themselves and with the `\numequation`, `\nummultline` and `\ssinc` macros,
while `atheorem`, `alemma` and their relatives run on the `subsection` counter and `ithm` on an `\Alph`
counter. Re-deriving the numbering from the LaTeX gives **405 numbered statements**, and **every one of the
405 was located at its predicted number in the arXiv PDF and, independently, in the published PDF**. (A
word-level diff of the two PDFs is not informative: they use different fonts and hyphenate differently, so
the extracted word streams disagree almost everywhere for typographical reasons. The statement-by-statement
check, together with targeted checks of the extraction's three findings (E1–E3), is the version comparison
that carries weight.) Note that the main statements are numbered 1.1.1–1.1.7, not by letters.

**Mechanical audits**, after normalising whitespace inside label names: no duplicate `\label`, no undefined
`\ref`, `\Cref` or `\eqref`, no leftover `\need`, `\mar`, `query` environment, FIXME or TODO. Exactly one
cross-reference introduces a Lemma by the word Theorem; it is recorded as E1.

## What the paper does

**Theorem 1.1.3.** Every genus two curve and every abelian surface over a totally real field is potentially
automorphic; **Theorem 1.1.2**, the Hasse–Weil conjecture for such an `X`, follows by Brauer's theorem and
base change. **Theorem 1.1.4**: every genus one curve over a quadratic extension of a totally real field is
potentially modular — new outside the totally real case (Taylor) and the CM case (the ten-author paper).
**Theorem 1.1.5**: there are infinitely many modular abelian surfaces `A/Q` up to twist with `End_C(A) = Z`,
the first infinite family, and for these the `L`-function is *holomorphic* on all of `C`, which potential
automorphy alone does not give.

The obstruction is that weight 2 Hilbert–Siegel modular forms occur only in the **coherent** cohomology of
the Hilbert–Siegel modular variety, in degrees `0` to `[F:Q]`, and in the étale cohomology of nothing:
abelian surfaces are irregular motives of weights `(0,0,1,1)`, so the Taylor–Wiles method does not apply.
The situation is closely analogous to the two-dimensional odd Artin conjecture, and the paper takes the
Calegari–Geraghty route rather than the Buzzard–Taylor one, because the Fourier expansions of Siegel forms
are not determined by the Hecke eigenvalues.

The main modularity lifting theorem is **Theorem 8.4.1**: for `p ≥ 3` splitting completely in the totally
real field `F`, a representation `ρ : G_F → GSp₄(Q̄_p)` with `ν∘ρ = ε⁻¹`, vast and tidy reduction,
`p`-distinguished weight 2 ordinary at every `v|p`, pure at every finite place, and ordinarily modular
reduction, is modular. Four bodies of work go into it.

1. **§3, the Shimura varieties.** The integral models `Y_K` of the PEL variety for `G ⊂ G₁ = Res_{F/Q}GSp₄`
   at the parahoric levels `GSp₄(O_{F_v})`, `Par(v)`, `Si(v)`, `Kli(v)`, `Iw(v)`, their descent to `G₁` by
   the totally positive units, their local models (flat, normal, lci of relative dimension `3[F:Q]`, smooth
   away from codimension two), their toroidal compactifications, and the Hecke action on the coherent
   cohomology of `ω^κ` through cohomological correspondences and the Grothendieck–Cousin complex.
2. **§4, higher Hida theory.** Following Pilloni for `F = Q`: one works over the `p`-rank `≥ 1` stratum,
   which is *not* affine but whose image in the minimal compactification has cohomological dimension one, so
   the ordinary projector cuts out a **perfect complex of amplitude `[0,#I]`** rather than a projective
   module (Theorem 4.6.1). The bookkeeping over the places above `p` is what makes the section long.
3. **§5, doubling.** The sum of the two degeneracy maps embeds two copies of the Klingen ordinary forms into
   the Iwahori ordinary forms (Theorems 5.8.4 and 5.8.6), so the Galois representation is Iwahori ordinary in
   two ways at once, with `α_w` and `β_w` as unramified subspaces, and `ᾱ_w ≠ β̄_w` forces a two-dimensional
   unramified summand. **Every previous incarnation of doubling rested on the `q`-expansion principle; this
   one is geometric**, and rests on the operator `Z_w = U_{Kli(w),1} − U_{Iw(w),1}` along the `w`-non-ordinary
   locus, on Kodaira–Spencer, and on the identification of `U_{w,2}` with the square of the partial Frobenius.
4. **§6, higher Coleman theory.** The classicality theorem in the slope range `U_{v,2} < k_v+l_v−3`,
   `U_{v,1} < l_v−3` (Theorem 6.5.8), and the local constancy of the Euler characteristic in the weight
   (Theorem 6.3.16), which is what shows the complexes are balanced.

**§7** then runs the Calegari–Geraghty patching twice, with `l₀ = 0` and, after isolating one place `v|p`,
with `l₀ = 1`. The trick that makes `l₀ ≤ 1` possible is that `p` splits completely in `F`, so only
two-term complexes occur and local–global compatibility is needed only in degree 0, where doubling supplies
it. The section also builds the GSp₄ analogue of Taylor's Ihara avoidance, through the nilpotent orbits of
GSp₄ and their centralizers — which, unlike for `GL_n`, are not connected (Remark 7.4.11) — and the big
image conditions **vast** and **tidy**. **§8** glues by analytic continuation, étale descent and the linear
relations from doubling. **§9** deduces potential modularity by a `p`–`q` trick and Moret-Bailly. **§10**
shows every `ρ̄ : G_F → GSp₄(F₃)` with inverse cyclotomic similitude character is the 3-torsion of infinitely
many abelian surfaces, by proving a twisted degree six rational cover of the Burkhardt quartic is
unirational — applied to the cover rather than to `A₂(3)` itself, because only the cover admits a
`PSp₄(F₃)`-equivariant birational map to `P³` over `Q`.

§1.4 is unusually informative and is extracted as items: the conditional status of Arthur's multiplicity
formula (§1.4.1), and why genus `≥ 3` is out of reach and why Picard curves might not be (§1.4.2).

## Routing

| Route | Target | Items |
| --- | --- | --- |
| 1. part-ii | `HilbertSiegelModularVarieties` — *Hilbert Modular Varieties And Shimura Curves, Part II: Hilbert–Siegel modular varieties for GSp_4 over a totally real field* (`arithmeticgeometry`) | 19 |
| 2. part-ii | `HigherHidaAndColemanTheory` — *Hida and Coleman families, period modules, and family L-functions, Part II: higher Hida and higher Coleman theory for coherent cohomology* (`padic`) | 86 |
| 3. new | `AbelianSurfacesPotentialModularity` — *Abelian surfaces over totally real fields are potentially modular* (`langlands`) | 60 |
| 4. part-ii | `GSp4LocalLanglandsAndGaloisRepresentations` — *Modularity, automorphy and Langlands endpoint extensions, Part II: GSp_4, its local Langlands correspondence and Galois representations* (`langlands`) | 23 |
| 5. part-ii | `IntegralCoherentHeckeComplexes` — *Automorphic bundles and classical automorphic forms, Part II: integral coherent cohomology and Hecke-equivariant perfect complexes* (`langlands`) | 9 |
| 6. source | `LocalGaloisDeformationRings` — L7, L8, R08.1, R08.2 | 22 |
| 7. source | `ArithmeticGaloisRepresentations` — G7, R01.1 | 15 |
| 8. source | `ModularityAndLanglandsExtensions` — ML.0, ML.1, ML.4 | 8 |
| 9. source | `GlobalGaloisDeformations` — G7, R04.1, R04.2, R04.3, R04.5 | 7 |
| 10. source | `AdicSpacesPartII` — R2, R3 | 4 |
| 11. source | `AlgebraicModuliForArithmeticGeometry` — A0-extension | 4 |
| 12. source | `DeformationAndDerivedPatchingAlgebra` — P7, P9, R03.1, R03.6 | 4 |
| 13. source | `HodgeTateAndCanonicalSubgroups` — T0, T5 | 4 |
| 14. source | `PeriodsAndSpecialValues` — PS.1 | 4 |
| 15. source | `PotentialModularityAndCompatibleSystems` — R23.1, R23.2, R23.3, R23.5, R24.5:operations | 3 |
| 16. source | `AutomorphicGaloisRepresentationsPartII` — AG2.5 | 2 |
| 17. source | `GL2AutomorphicRepresentationsAndTransfer` — R16.2, R17.5 | 2 |
| 18. source | `PadicFamilies` — L0a, L2a | 2 |
| 19. source | `SchemeAndStackFoundations` — SF.2 | 2 |
| 20. source | `ShimuraData` — D5 | 2 |
| 21. source | `SmoothRepresentationsOfLocalGroups` — SR.1, SR.2 | 2 |
| 22. source | `AbelianSchemesAndArithmeticModuli` — A4 | 1 |
| 23. source | `ArithmeticGaloisDuality` — R02.2, R02.4 | 1 |
| 24. source | `AutomorphicFormsOnReductiveGroups` — AF.1, AF.3, AF.4 | 1 |
| 25. source | `AutomorphicSpectralTheory` — AS.4, AS.5 | 1 |
| 26. source | `FaltingsFinitenessAndIsogenyTheorems` — R28.4 | 1 |
| 27. source | `FiniteFlatGroupsAndIntegralPadicHodgeTheory` — R07.1 | 1 |
| 28. source | `LocallyAnalyticDistributions` — L4 | 1 |
| 29. source | `NeronModelsAndSemistableAbelianVarieties` — R11.5 | 1 |
| 30. source | `OrdinaryAutomorphicFormsAndModularityLifting` — R21.2 | 1 |
| 31. source | `PerfectoidShimuraVarieties` — S1, S3 | 1 |
| 32. source | `PotentialAutomorphyInfrastructure` — PA.5 | 1 |
| 33. source | `ShimuraCompactifications` — C3, C5 | 1 |

The review rebuilt the routes submitted with this extraction. What changed, and why:

- **Higher Hida and higher Coleman theory joins an existing proposal.** The extraction proposed a *new* roadmap under the id `HigherHidaAndColemanTheory`. That id already belongs to the Part II of PadicFamilies proposed by the extraction of Pilloni, Duke Math. J. 169 (2020), and joined by the Boxer–Calegari–Gee–Pilloni (2025) and Boxer–Pilloni (2026) extractions. The maintainer's guide asks for higher Coleman theory as its own roadmap only if it is missing, and it is not. Route 2 is therefore that Part II, with its id, parent, title and area, and its brief lists what this paper adds: the Hilbert–Siegel generalisation, place by place, and the doubling layer.
- **The paper's own roadmap is the maintainer's.** The extraction proposed `PotentialModularityOfAbelianSurfaces`. The maintainer's guide sends this paper to the new roadmap `AbelianSurfacesPotentialModularity`, built by the queued design job DESIGN-BCGP18, and other extractions (Boxer–Calegari–Gee–Pilloni 2025 among them) already name it. Route 3 uses that id and title, and its brief is meant as DESIGN-BCGP18's instructions. Items that existing layers own (Galois deformation problems, residual-image conditions, local deformation rings) moved to them by source.
- **The Hilbert–Siegel varieties are narrowed.** Route 1 keeps only the construction for G_1 = Res_{F/Q}GSp_4 that nothing else owns. The genus-two integral models, local models and compactifications at parahoric level already belong to the proposals ShimuraVarietiesHondaTatePartII and ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary, and the Hecke action on integral coherent cohomology to IntegralCoherentHeckeComplexes.
- **Integral coherent cohomology joins IntegralCoherentHeckeComplexes.** Route 5 joins the Part II of AutomorphicBundles proposed by the Calegari–Geraghty (2018) extraction, which owns cohomological correspondences and Hecke operators on integral coherent cohomology.
- **Grothendieck duality goes to its owner.** The submitted source route to SchemeAndStackFoundations SF.2/SF.5 is replaced: f^!, traces and fundamental classes go to AlgebraicModuliForArithmeticGeometry A0-extension, where the Pilloni and Calegari–Geraghty extractions already send them; SF.2 keeps only Kempf's Cousin complexes.
- **GSp_4 local Langlands is corrected.** Route 4 keeps its id and title; several of its item statements were wrong and are corrected (for instance Theorem 2.7.1's local–global compatibility and Proposition 2.4.24's type IIa), and the Gan–Takeda correspondence itself goes to ModularityAndLanglandsExtensions ML.4, as the Gan–Savin extraction already routes it.
- **The review added the missing items and routed each once.** Its new items (definitions and results the extraction did not list) are routed with the others; the source routes above name the covering stages.

## Library and planned items

**Three items are in the libraries.**
* Abelian varieties over a field are in Tau Ceti (`TauCeti.AlgebraicGeometry.AbelianVariety`, with about two
  hundred declarations around it), not in Mathlib.
* The symplectic group scheme is in Tau Ceti. `TauCeti.ConstantForm.groupScheme R n C` is the closed subgroup
  scheme of `GL_n` preserving a constant matrix `C`; with `n = 4` and `C` the paper's antidiagonal `J` it is
  the paper's `Sp_4` over `Z`. `TauCeti.Symplectic.groupScheme` specialises it to Mathlib's form and adds the
  identification of points with symplectic matrices, the diagonal torus and the Chevalley commutator
  relations; the paper's `J` is carried to Mathlib's form by a permutation of the basis.
* The Artin–Rees lemma for modules, used in the proof of Lemma 4.2.10, is in Mathlib
  (`Ideal.exists_pow_inf_eq_pow_smul`).

None of them covers what the paper needs from them. There are no abelian *schemes* over a base, no duals and
no polarizations; `GSp_4` is in neither library; and neither library passes from Artin–Rees to coherent
sheaves on a Noetherian scheme.

**Thirty-three items are planned** by existing layers. Each `note` quotes the stage and names what it must
add for this paper.
* The groups and level structures: `GSp_4` with its similitude character, neat level and the parahoric
  subgroups (PELModuli M0, ShimuraData D5, ReductiveGroupsPartII RG2.3).
* The geometry:
  * abelian schemes with duals, polarizations and the Weil pairing (A1–A3);
  * Serre–Tate theory with relative de Rham cohomology (A4);
  * automorphic bundles with canonical and subcanonical extensions and the PEL compactifications
    (B2, B3, C4, C5);
  * admissible cone decompositions (C0, C1, C5);
  * the Hodge–Tate map and Barsotti–Tate groups (T0);
  * adic spaces and formal models (R0, R2, R3);
  * slope decompositions for compact operators (L4, L2a).
* The Galois side:
  * Moret-Bailly's theorem (R23.1);
  * Chebotarev and the choice of Taylor–Wiles primes (R04.5);
  * global and local deformation functors (R04.1–R04.3, R08.1, R08.2, L7);
  * Poitou–Tate duality and Selmer groups (R02.3–R02.6);
  * the normalisation of the Artin map and of Weil–Deligne representations (ClassFieldTheory Layer 7,
    R01.2, R06.2, R06.3);
  * compatible systems (R19.3, R24.5:operations, AG2.6) and purity for Hilbert modular forms (R19.2–R19.5).
* The automorphic side:
  * local Langlands for `GL_n` (EndoscopicTransferAndUnitaryTraceComparison ET.6, with R16.2 and R16.3 for
    `GL_2`);
  * solvable base change, descent, isobaric sums and automorphic induction (R17.4, ET.7a, AG2.2,
    ModularityAndLanglandsExtensions ML.5);
  * potential automorphy of rank-two compatible systems (ML.2);
  * the Rankin–Selberg and exterior-square transfers (ML.5);
  * standard L-functions of `GL_n` (AL.2);
  * Hilbert irreducibility (IG.2);
  * abstract Hecke algebras (SmoothRepresentationsOfLocalGroups SR.1).
* Patching:
  * the balanced-module criterion and the patching criterion of Proposition 7.10.1 (R03.5, P9);
  * Nakayama's lemma for complexes (P7, DD.1);
  * freeness of maximal Cohen–Macaulay patched modules (R03.3).

## Source issues

`sourceIssues` records 159 mistakes: 119 misprints, 25 errors and 15 gaps. Of these, 11 affect a stated result, 17 affect a proof, and 131 affect nothing downstream. Each was checked at its locator in both arXiv v3 and the published version. No erratum to the paper is known. One issue, the gap E149 in Theorem 10.2.1, is already addressed in the authors' later paper (arXiv:2502.20645, Remark 9.4.4 and Lemma 9.3.7); the other 158 are new.

- **E1–E3** were recorded by the extraction: a Lemma cited as a Theorem in the proof of Corollary 7.6.3, a missing superscript w⁻ in Corollary 6.4.3, and a missing hypothesis [F:Q] > 1 in Remark 5.8.5. The review confirmed all three.
- **E4–E159** were found by the review. Each misprint was confirmed on the page images. Each error and gap was confirmed by two independent verifications, one of which tried to defend the paper under its own conventions and cited sources; where the two differed on kind, reach or correction, a third reading settled the record.

**Stated results affected.**
- **Lemma 2.1.3** (p. 171): a semisimple GSp₄-valued representation is determined by its GL₄-valued composite and similitude only when char L ≠ 2 (E6).
- **Lemma 2.5.1** (p. 189): pure N maximises n(r, N), but the maximiser is unique only in the four-dimensional symplectic case that Corollary 8.2.2 uses (E16).
- **Lemma 3.8.5** (pp. 219–221) needs #G invertible on S, and Proposition 3.8.3 then needs p ∤ #Δ(K^p), a hypothesis that must be carried to §4.2, Proposition 4.4.3 and §6.3.8 (E36).
- **Lemma 4.2.20** (p. 255): the second identity for T̃_w is unproved at l_w = p + 1; it holds for l_w ≥ p + 2 (E46).
- **Corollary 6.4.3** (pp. 338–339): the isomorphism for i = 1 is proved only for k_v − l_v ≥ 3N; its one use, in Proposition 6.6.2, can take that bound (E83).
- **Lemma 9.1.10(3)** (pp. 457–458) asserts more than [ACC+18] gives: the image contains a conjugate of SL₂(F_l) (E136). **Proposition 9.1.12** (pp. 458–459) should assert only that L′/K′ is Galois (E137).
- **Lemma 9.2.7** (pp. 462–463) is false as printed: the local data at the auxiliary prime q must be chosen differently. With the corrected choices Theorem 9.2.8 and the results drawn from it survive (E139).
- **Theorem 9.3.4** (p. 466): its "more precisely" clause must exclude elliptic curves with End_K(E) ≠ Z (E144).
- **Proposition 10.1.3** (pp. 473–474), and Proposition 10.1.1 and Theorem 10.1.4 with it: "unramified and ordinary" should read "ordinary"; with that change Theorem 1.1.7 and Theorem 10.1.4 still follow (E147).
- **Lemma 10.4.6** (p. 490): the statement should read D × D (E156).

The full list, with every printed text, correction and reason, is in the result file.

## Notes for the reviewer and for later blueprint work

* **Order of the roadmaps.** `GSp4LocalLanglandsAndGaloisRepresentations` and
  `HilbertSiegelModularVarieties` are logically prior. `IntegralCoherentHeckeComplexes` supplies the Hecke
  action on integral coherent cohomology. `HigherHidaAndColemanTheory` builds on these, and
  `AbelianSurfacesPotentialModularity` builds on all of them. If different workers plan them, the first two
  should go first, or should at least fix the names `GSp₄`, `ν`, `Kli(v)`, `Iw(v)`, `ω^κ`, `T_w`, `T_{w,1}`,
  `U_{w,1}`, `U_{w,2}` and `Z_w`.
* **The whole result is conditional on Arthur.** §1.4.1 says the Gee–Taïbi proof of the multiplicity formula
  for GSp₄ is only as unconditional as Arthur's book and the stabilisation of the twisted trace formula, and
  in particular depends on cases of the twisted weighted fundamental lemma whose proofs had not appeared.
  This is routed as a source of ML.4 precisely so that it cannot be silently discharged.
* **Modular and automorphic are different here.** Potential automorphy is proved for *every* abelian
  surface; potential *modularity* only when the corresponding automorphic representation of GSp₄ is of
  general type. Definitions 9.1.1, 9.1.6 and 9.1.8 keep them apart and Remark 9.1.9 explains why.
* **`G` and `G₁` must never be blurred.** `G` has the moduli interpretation and the integral theory; `G₁` is
  the group the automorphic forms live on. Every statement must say which, and how the descent datum
  (the choice `w = 2`) was made.
* **Klingen ordinary ≠ Iwahori ordinary.** `U_{Kli(w),2} = U_{Iw(w),2}`, but `U_{Kli(w),1}` and
  `U_{Iw(w),1}` differ by `Z_w` up to a power of `p` whose sign depends on whether `l_w ≥ 2` or `l_w ≤ 2`.
  The whole doubling argument is about that difference.
* **Classical `T` and `p`-adic `U` are different operators.** They agree only after the explicit congruence
  of Lemma 4.6.16 and only in a weight range; §4.6 is that comparison and it cannot be assumed.
* **Coherent Grothendieck duality.** The review sends `f^!` for embeddable and lci morphisms, fundamental
  classes and traces to AlgebraicModuliForArithmeticGeometry A0-extension, where the Pilloni and
  Calegari–Geraghty extractions already send them. Kempf's Cousin complexes and the Cousin complex of a
  filtration go to SchemeAndStackFoundations SF.2. A restructure may still prefer a dedicated layer, since
  every future consumer of coherent cohomology on a Shimura variety will need these.
* **Prerequisite papers.** Pilloni's *Higher coherent cohomology and p-adic modular forms of singular
  weights* (Duke 169 (2020)) is cited over thirty times, and §§3–4 cannot be built without it. It is extracted
  as PAPER-PILLONI-20. This paper's `HigherHidaAndColemanTheory` route joins that extraction's proposal, and
  its `IntegralCoherentHeckeComplexes` route joins the proposal of PAPER-CALEGARI-GERAGHTY-18, which
  PAPER-PILLONI-20 also joins. Lan's compactification monograph and its sequel on ramified
  characteristic are still needed for Theorem 3.5.1; a paper job on each would supply them.
* **The companion papers.** Issue #2166 is the same authors' *Modularity theorems for abelian surfaces*
  (arXiv:2502.20645), which builds on this paper and on the ten-author paper. Its extraction
  (PAPER-BOXER-CALEGARI-GEE-PILLONI-25) joins `HigherHidaAndColemanTheory` and
  `GSp4LocalLanglandsAndGaloisRepresentations` with the same ids, parents, titles and areas as here.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json`
and `python3 research/blueprint/intake.py check-files` both pass on the corrected file.

The extraction's routing was validated by a script that checks:
* every planned layer id against `data/atlas.json`;
* every source roadmap for origin and stage ownership;
* each Part II title against its parent's title;
* the areas against `data/galaxies.json`;
* that every missing item is taken by exactly one route and every non-missing item by none.

The review repeated these checks on the corrected file, and also checked the joined proposals' ids, parents
and titles against the extractions that proposed them. No Lean deliverable is part of a paper job.
