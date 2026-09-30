# REV-RT-PAPER-NELSON-VENKATESH-21

**Complete: all fourteen findings confirmed.** Most of the fixes are amended below.

- **Job:** Refs #4333.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence:** the extraction, its review and the red team (RT-PAPER-NELSON-VENKATESH-21, session `cc-f805bf`) were all done by other sessions.
- **Verdicts:** `research/blueprint/redteam/RT-PAPER-NELSON-VENKATESH-21.review.json`, which `python3 scripts/check_redteam.py` reports `ok`.

## Evidence and scope

The texts read were the published Acta Math. 226 (2021), 1–209, which is open access and the text the extraction read, and arXiv v3 with its LaTeX source. Both hashes match the extraction's record.

Three verifiers worked in parallel:
- findings 1–3 and 12 (the mathematics);
- findings 5–10 (ownership and status);
- findings 4, 11, 13 and 14.

Every claimed mistake in the paper was checked in both the published text and v3. All are in both except /12(viii), which is in the published text only (checked on the page image).

## /1: confirmed (high). The fix needs extending.

Every step of the dihedral counterexample was checked. The setup:
- F = ℚ, G = PD^× = SO(3), H = K^×/ℚ^× = SO(2).
- Π is the Jacquet–Langlands transfer of a dihedral π(ψ), so Π ≅ Π ⊗ χ with χ = η_K∘Nrd.

The mechanism: multiplication by χ preserves Π, is trivial on H(𝔸), and acts at ∞ by c·sgn(n) on weight-n vectors. So, with the data at the other places fixed, every H-period vanishes for one sign of the weight. Theorems 27.1, 30.1 and 31.11 therefore fail: a one-sided family averages 0, not ½.

What survives, and what E1's repair gives:
- The weak subconvex bound (1.4) survives, losing at most a factor 2.
- The real-place spinor-norm slip affects only the proof, and Kneser's theorem repairs it.
- Under Π ≇ Π ⊗ χ, E1's repair gives the corrected statements.

**Fix extensions:**
- Add the hypothesis to items /94 (Theorem 30.1, Lemma 30.4) and /95 (Corollaries 31.4, 31.8) as well.
- E1 should say the vanishing is for fixed data at the other places, and that the failure occurs whenever Π ≅ Π ⊗ χ, even when K splits at q.

## /2: confirmed (high). Part of the evidence is wrong.

- **/48.** It drops "k algebraically closed" from Theorem 14.5. Over ℝ, the compact pair (SO(3), SO(2)) has stable pairs with no real preimage. The theorem does descend scheme-theoretically, but the item speaks of points.
- **/56.** It drops "O_{π,σ} non-empty" and is false as written. The red team's reason is wrong: it claims two real orbits in SO(2,1) share an infinitesimal character, but the full group SO(2,1) swaps the two sheets, so each regular real fibre is a single orbit. A correct counterexample is U(1,1) ⊃ U(1) with a holomorphic discrete series. The proposed fix is right.

## /3: confirmed (medium), as proposed

All four copied slips are real. None is among E1–E15, and all are also in v3.
- **Cotlar–Stein:** the sum converges strongly, not in norm. Orthogonal projections onto an orthonormal sequence satisfy the hypotheses but do not give norm convergence.
- **(8.3):** it is missing a factor h^{−|α|}.
- **§2.5:** "Op" should be "Op_h"; the same slip recurs on p. 62.
- **Lemma 7.14:** the sign should be +h^j, not (−h)^j, under the paper's own convention (4.1).

None of the four affects a downstream result.

## /4: confirmed, with corrections (medium)

The omissions:
- /75 drops "φ₊ positive definite" from Definition 24.3(ii).
- /68 omits the normalisation (22.8) and the uniformity of the implied constant.
- /40's inequality is false for vectors that are not τ-isotypic. A principal series of SL₂(ℝ) gives a counterexample: add tiny components in many K-types to one unit vector.
- /50's Γ_ℝ product needs π and σ tempered.
- /61 also omits "π, σ tempered".

Corrections to the finding:
- The finding overstates the stated reason for /75: (24.4) already forces tr σ(φ₊) ≥ 0, and (24.7) follows from Plancherel. The clause still belongs, because it is part of the definition.
- For /50, temperedness belongs only on the Γ_ℝ-product clause.
- "Lemma 19.1(iii)" does not exist; the archimedean hypothesis is §19's standing assumption.
- /99 is only a wording issue.

## /5: confirmed; route correction (medium)

BEUZARTPLESSIS-LIU-ZHANG-ETAL-21's accepted route 1 plans both the real Plancherel formula and the Langlands classification. It is pending as DESIGN-AutomorphicSpectralTheoryPartII. Its L²-form Plancherel statement is the same theorem as the paper's f(1) = ∫χ_π(f).

The finding's fix breaks the file. Leaving /30 missing and unrouted fails the paper checker, and so does marking it planned at AF.1b, which is not yet in `data/atlas.json`.

**Right fix:**
- Send /30 by a source route to AF.1, which becomes AF.1b once the automorphic fixes are applied.
- Give the real Plancherel theorem to the AutomorphicSpectralTheory Part II through a merged part-ii route.
- Have route 1 import both.

The p-adic half is not a duplicate.

## /6: confirmed; half the fix is wrong (medium)

Moving /72 to SR.3 is right: GAN-SAVIN-23 already routes it there. But SR.3 does not plan Waldspurger's p-adic Plancherel formula, and nothing else does. Keep that in route 1, or give it to a SmoothRepresentations Part II.

## /7: confirmed; the fix is incomplete (medium)

The accepted source routes of BÖCKLE-HARRIS-KHARE-THORNE-19 and LAFFORGUE-18 already send the categorical quotient and Hilbert–Mumford to LanglandsParameterStacks LP2/LP3. The finding names neither.

Problems with the proposed fix:
- Adding the categorical quotient to the Reductive-groups Part III, as it suggests, would plan it a second time.
- FINTZEN-21's statement is the null-cone form. The paper needs the stability form, which also requires Matsushima's theorem.
- /46 says "unstable" where the paper says "not H-stable", and as written it is false. Counterexample: 𝔾_m acting trivially on 𝔸¹, with x = 1.

## /8: confirmed (medium)

The GGP roadmap should own (18.1) and the local period for each pair of vectors. Route 1 must keep the sum over an orthonormal basis of σ (Lemma 18.1(i)–(iii)), because its proof (§A.6) uses route 1's Appendix A.

## /9: confirmed (medium)

GN.4 is scoped to Oppenheim- and Duke-type applications, and no stage mentions Ratner.

**Right fix:** take the finding's second option, GN.4 with a packet request or source route that also covers Borel density and ergodic decomposition. The merged RT-AREA-iwasawa-1 fixes already make GN.4 the owner of unipotent-flow theorems, so routing Ratner to the orbit-method roadmap would split that ownership.

## /10: confirmed (medium)

LieHighestWeight layer 7 covers only semisimple L, and nothing in the atlas states Chevalley's restriction theorem. Three other extractions also assume the Harish-Chandra isomorphism for reductive g exists: BEUZARTPLESSIS-LIU-ZHANG-ETAL-21, PILLONI-20 and BOXER-CALEGARI-GEE-PILLONI-25.

**Right fix:** give both to one foundational owner, the pending LieHighestWeight Part II or the Reductive-groups Part III, and not to route 1. The locator should read §§9.4–9.5, not §9.3.

## /11: confirmed, with corrections (medium)

Local multiplicity one defines the branching coefficient in §25.4 but has no item. JIANG-ZHANG-20's bessel-uniqueness is on its accepted route to the GGP roadmap.

Corrections:
- **Uniform admissibility** is already planned at SmoothRepresentations SR.3a, so it is not missing.
- **∆:** item /4 already states that ∆ is positive self-adjoint. What is missing is a cited item that also carries π^∞ = ∩D(∆ⁿ).
- **Borel's density theorem** (Lemma 27.8) is named in the red team's own summary but not in this finding. Add it.
- **Split places:** the GL case of multiplicity one needs AGRS or Sun–Zhu.
- **Kneser's Hasse principle** is not used by the paper.
- **Riesz:** cite `RealRMK.rieszMeasure` with `RealRMK.integral_rieszMeasure`.
- **Schwartz kernel theorem:** it fits AS.0, which plans nuclear Fréchet test-function spaces.

## /12: confirmed; some fixes refined (medium)

All 16 sub-items are real. For (xv), Zhang's author copy says the refined conjecture is proved in "a subsequent paper", which the Acta text never cites.

Refinements:
- **(ii):** the repair also needs a chosen with the image of its support inside U₀, and Theorem 22.2(iii) needs "+O(h^N)". Mark it as affecting a stated result.
- **(iii):** record it as an amendment to E3, not as a new entry. Θ^nt also omits the endpoint q^{1/2}.
- **(vi):** −cΣx² fails beyond the trivial K-type too. The right choice is κ = (1 − Σx²)^N.
- **(xi):** q₂ is also wrong; fix the whole recursion.
- **(xiii):** the same slip recurs on p. 176.

## /13: confirmed (low)

The accepted proposers of the GGP roadmap are JIANG-ZHANG-20, BEUZARTPLESSIS-LIU-ZHANG-ETAL-21, BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 and LIU-ETAL-22. LESLIE-25 never proposed it, and BEUZARTPLESSIS-CHAUDOUARD-25's route was rejected (verdict "revise").

**Correction:** MAO-WAN-ZHANG-26 never had a GGP route, so it did not "drop" one. The review's list was therefore wrong when it was written. The "six extractions" wording sits in route 2's reason and in the report, and should be fixed in both places.

## /14: confirmed (low)

There is no `sourceVersions` list, and no E-finding carries a review block, so the register lists all fifteen as awaiting review.

**Correction:** the review confirmed E2 and E4 only as quotations; it did not re-derive their mathematics. Review blocks crediting it belong on E1, E8, E9, E11 and E14 only. The verdicts on the others should come from the review of the fix job that rewrites the extraction file (PROTOCOL §18).

## For the maintainer

These duplicates lie outside this red team's target but came up in the checks:
- GAN-SAVIN-23 and LIU-ETAL-22 both plan Harish-Chandra's tempered classification.
- FINTZEN-21 and the LP2/LP3 source routes both plan affine invariant theory and Hilbert–Mumford.
- BEUZARTPLESSIS-LIU-ZHANG-ETAL-21's /20(b) duplicates AF.1b's Langlands classification.
- The reductive Harish-Chandra isomorphism is marked planned in several extractions, but no stage plans it.

## For the fix job

Findings /1–/12 (high and medium) become FIX-RT-PAPER-NELSON-VENKATESH-21. Apply them with the amendments above:
- /1: add the hypothesis to /94 and /95;
- /5: route /30 to AF.1, with the real Plancherel theorem to the AutomorphicSpectralTheory Part II;
- /6: Waldspurger stays in route 1;
- /7: import from LP2/LP3, and correct "unstable";
- /9: GN.4;
- /10: one foundational owner;
- /12(iii): an amendment to E3.
