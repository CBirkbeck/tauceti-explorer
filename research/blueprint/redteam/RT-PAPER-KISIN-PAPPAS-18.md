# RT-PAPER-KISIN-PAPPAS-18: red team of the Kisin–Pappas extraction

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4308).

**Target.** `PAPER-KISIN-PAPPAS-18` is the extraction of M. Kisin and G. Pappas, *Integral models of Shimura varieties with parahoric level structure*, [Publ. Math. IHÉS 128 (2018), 121–218](https://doi.org/10.1007/s10240-018-0100-0). The preprint is [arXiv:1512.01149](https://arxiv.org/abs/1512.01149).

**Who did what.**
- Codex (`codex-c83e7a`, issue #1460, PR #1684) wrote the extraction, and Claude Code `cc-fb70e5` (PR #2014) completed it.
- `REV-PAPER-KISIN-PAPPAS-18` (`cc-2aeb03`, issue #1461) accepted it. That review made 97 corrections in place, removed D07 and added 105 items.
- I did neither job. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.** This session wrote FIX-RT-AREA-automorphic-1, which touched automorphic and Shimura stages such as AA.4 and the ALS layers. It also wrote PAPER-LUST-STEVENS-20, which routes to SmoothRepresentationsPartII and ModularRepresentationsOfFiniteReductiveGroups. No finding below touches those stages or routes. Finding 18 concerns a different Part II id. PAPER-LUST-STEVENS-20 plans no Iwahori–Hecke centre, Kottwitz map or Lang theorem.

**Result: eighteen findings.** One is high, eleven are medium and six are low.

- **Where the work is sound.** It is dense and mostly faithful:
  - every numbered result has an item;
  - the main-theorem hypotheses are right in S44–S48 and N14;
  - all 80 recorded mistakes hold;
  - all 14 library citations are right.
- **Where the review's changes did damage:**
  - removing D07 left D08 stated with the condition the authors withdrew (the high finding);
  - the 105 items the review added are wired into nothing;
  - two items still carry hypotheses that confirmed mistakes E58 and E29 correct.
- **What is missing or mis-planned:**
  - the authors' "very good embedding" correction does not reach the abelian-type chain;
  - Theorem 0.4 has no item;
  - the GL lattice-chain local model and the Grassmannians have no item;
  - P05's planned stage does not plan what is used;
  - the Kottwitz map has no item and is attributed to the wrong owner;
  - the trace formula lacks its Frobenius convention.

The machine-readable file is [RT-PAPER-KISIN-PAPPAS-18.result.json](RT-PAPER-KISIN-PAPPAS-18.result.json).

## Source

Fetched on 30 September 2026.

| Text | Where | SHA-256 |
| --- | --- | --- |
| Published PDF (98 pp.) | [Numdam](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf) | `e2b4a076…618b` (matches the extraction) |
| arXiv v3 PDF (comparison only) | [arXiv](https://arxiv.org/pdf/1512.01149) | `7577bb3e…f55e` |
| Pappas–Zhu, arXiv v4 | [arXiv](https://arxiv.org/pdf/1110.5588v4) | `cbb87912…1b27` (matches the extraction) |
| Kisin–Pappas–Zhou, arXiv v3 | [arXiv](https://arxiv.org/abs/2409.03689) | `d0834555…d615` |

- **Numbering.** Printed page = PDF page + 120. Every locator below is to the published text.
- **Errata.** Crossref has no correction for the DOI. The authors' own corrections are in Kisin–Pappas–Zhou (KPZ26) §§1.3.1–1.3.2 and 7.3.
- **How I read it.**
  - Seven parallel section passes re-read the paper against the text layer and page images at 200–400 dpi.
  - I re-checked every finding filed here at its page.
  - I re-derived the counterexamples in findings 2, 11 and 14 myself.

## What held

- **Items.** The statements are faithful across all sections, apart from the items named in the findings.
- **Intro results.** Proposition 0.1, Theorem 0.2, Corollaries 0.3 and 0.5, and Theorem 0.6 are all represented with the intro's hypotheses:
  - p > 2, abelian type and tame splitting throughout;
  - p ∤ |π₁(G^der)| exactly where the paper puts it, in 4.6.23(2) and in 0.4/4.7.11;
  - no D^H in 4.6.23(4);
  - "unramified with x'₂" in 4.6.23(5).
- **Recorded mistakes.** E1–E80 all hold at their locators. I re-derived:
  - E41: z = p − V(1) has ghost vector (p, 0, 0, …) and kills E([π]).
  - E43, E46, E51 and E59.
  - E58: the norm-one torus of Q_p(p^{1/3}).
  - E70: only one decomposition group is used.
  - E29 and E33.
- **Library.** All 22 cited declarations exist at Mathlib `082e2d3` and Tau Ceti `f790474` with the stated scope, for example `reductiveCommHopfAlgProperty` (Reductive/Basic.lean:70) and `WittVector.FractionRing.frobenius` (Isocrystal.lean:79).
  - Of the items marked missing, only the Grassmannian has a partial library counterpart: Mathlib's `Module.Grassmannian`, a functor of points (finding 8).
  - Tau Ceti's 620 "Minuscule" declarations are E6/E7 Lie-algebra constructions, not the lattices of R01–R07.
- **Planned stages.** All the cited stage texts were read. They plan the items in the paper's generality, except P05 (finding 9).
- **Routes.** The shared Part II ids agree with the extractions of KPZ26, Kisin–Zhou, Kisin 2017, KMPS, van Hoften, Gleason–Lim–Xu and Zhu.
- **Prerequisites.** All 22 resolve to the cited works.

## Findings

### 1. D07 was deleted, and D08 is stated with the withdrawn condition (high, error)

**What the review did.** It removed D07, the corrected first-order comparison of KPZ26 Lemma 5.1.15, as "Kisin–Pappas–Zhou's". It added nothing in its place.

**What D08 now says.** D08 is titled "…with the corrected first-order condition", but its statement is the printed Lemma 3.1.12: "if Ψ is constant mod 𝔞_R (in the sense of §3.1.11), then 𝒢_R is versal". §3.1.11 (p. 167) defines that condition through the printed Lemma 3.1.9 map. E1 shows that map is not well defined, and the authors replaced it.

**Knock-on.**
- D09's standing assumption and D18 inherit the defect.
- Four places still name the deleted D07:
  - the note of kp18-lemma-3-1-9;
  - the gap corrections-are-load-bearing;
  - the report's items table;
  - the report's corrections paragraph.

**Fix.**
- Restate D08 with KPZ26 §5.1.19's definition.
- Import PAPER-KISIN-PAPPAS-ZHOU-26/F10 and /psi-constant-modulo-a as prerequisites.
- Remove the dangling references to D07.

### 2. S08 and S09 keep the hypothesis that E58 corrects (medium, error)

**The mismatch.** E58 (confirmed) says Corollaries 4.2.12 and 4.2.13 need 𝒢 = 𝒢°, not K_p = K_p°.
- S08 still reads "If Kp=Kp°".
- S09 keeps "including K_p = K_p°" and adds a pointer to a "new gap" that does not exist.

**Why it matters.** Under K_p = K_p°, H¹(F_{p²}, π₀) can be non-zero. Then Lang's lemma fails, and the Adm(μ)-strata need not be 𝒢_k-stable. I re-derived the E58 torus example.

**Fix.** State both items under 𝒢 = 𝒢°.

### 3. The very-good-embedding correction stops at S07 (medium, missing)

**The problem.** KPZ26 §1.3.1 says Theorem 4.2.7 needs a very good Hodge embedding, and that this "affects the final statement [KP18, Theorem 4.6.23]". Only S07 carries the condition.
- S38 (Lemma 4.6.22) produces no very good embedding.
- S36, S37 and S44–S48 are stated as printed.
- The gap note nevertheless claims S44–S48 "already carry … the very-good hypothesis".

**The exceptional case.** On the corrected route, S47's "no D^H" is not enough. For "exceptional type A" factors (Res PGL_m(D) with p dividing the index), KPZ26 needs Corollary 1.1.3.

**E3's locator is incomplete.** It misses two §4.6 uses of Theorem 4.2.7:
- Corollary 4.6.15, second statement (p. 204);
- Corollary 4.6.18, last claim (p. 205).

**Fix.**
- Add KPZ26 Prop. 7.2.10(3) to S38.
- Route S36–S48 through KPZ26 Thm. 7.2.21 and Cor. 1.1.3, imported rather than re-planned.
- Extend E3's locator and correct the gap note.

### 4. Theorem 0.4 has no item (medium, missing)

**What is missing.** Theorem 0.4 is the local model diagram with target the abelian-type datum's own local model. Remark 4.6.25(c) (p. 210) derives it from 4.6.23(4)–(5) "by using Proposition 2.2.7 and Remark 4.2.14".

**Who depends on it.** §4.7.4 invokes it, and N14 places w in that local model. Neither N06 nor N14 reaches M08 or connected-stabilizer-in-unramified-case.

**Fix.** Add the item with those prerequisites, and make N06 depend on it.

### 5. The 105 added items are cut off from the dependency graph (medium, other)

**The problem.** None of the 105 review-added items is a prerequisite of anything, and none has prerequisites of its own. Examples:
- G04's proof uses six of them.
- S46's proof is siegel-extension-property, but S46 does not depend on it.
- S51 lacks the three Madapusi Pera, Milne and irreducibility inputs.

**A triple copy.** G01, haines-rapoport-prop-3 and kottwitz-kernel-and-parahoric-membership are the same Haines–Rapoport result.

**Fix.** Add the edges, and merge the three.

### 6. M10 repeats the false step of E29 (medium, error)

**The problem.** M10 states that ∏_j∏_τ ρ̲'_{j,O[u]} extends ρ_L. E29 (confirmed) shows this fails once a centralizer division algebra has degree m_j > 1: with G = D^×, the printed V_L has dimension 2 while dim V = 4. M10 and M11 carry no note.

**Fix.** Restate M10 with the multiplicities m_j, following E29.

### 7. The GL lattice-chain local model and its Grassmannian embedding have no item (medium, missing)

**The problem.** Proposition 2.3.7 reduces to a closed immersion into M^loc_{GL(V),{μ₀},y}, and E33's repair of Corollary 2.3.16 goes through ∏ Gr(g, Λ^i) ↪ Gr(½ dim V′, V′_{Z_p}). None of these has an item:
- that model;
- the O[u]-lattice chains N_•;
- the embeddings above;
- the base change to L = Q_p^ur and descent from O_{E′} to O_E, used on pp. 157–158.

**Also.** pz-prop-8-1-criterion does not tie N_• to Λ_y^•.

**Fix.** Add the four items and the hypothesis.

### 8. Grassmannians and flag schemes are planned but not cited (medium, missing)

**The problem.** No item covers:
- Gr(V_{Z_p});
- LGr(V);
- X_μ = G/P_{μ⁻¹}.

**Where they are planned.** AlgebraicModuliForArithmeticGeometry:R09.1 plans "Grassmannians and flag schemes". Mathlib has the Grassmannian functor at Grassmannian.lean:68 and :188, with representability listed as a TODO.

**Fix.**
- Add planned items for the Grassmannian and the Lagrangian Grassmannian.
- Ask for an owner for G/P_μ, which R09.1's GL-type flags do not cover.

### 9. P05's stage GS.1 does not plan what the paper uses (medium, library-claim)

**What the paper uses.**
- The affine Grassmannian Gr_{G,K} of a tame, possibly non-split G over the p-adic field K (p. 151).
- The Pappas–Rapoport twisted affine flag variety of the parahoric 𝒢′.

**What GS.1 plans.** "the Beilinson–Drinfeld Grassmannian over powers of C" for a function-field curve C, with classical equal-characteristic Satake. KPZ26's extraction repeats the claim.

**Fix.** Mark P05 missing and route it with M01, splitting the two objects.

### 10. π₁(G) and the Kottwitz map have no item, and the report names the wrong owner (medium, missing)

**The problem.** The hypothesis p ∤ |π₁(G^der)| and κ_G : G(K^ur) → π₁(G)_I are used from §1.1.2 onwards, but neither has an item.

**Where they are planned.** BunGAndNewtonStrata:BG1 plans both ("Construct pi_1(G), its Galois coinvariants, the Kottwitz map kappa"). Kisin–Zhou N03 and Gleason–Lim–Xu D05 cite BG1 for them.

**The false claim.** The report says the ReductiveGroupsPartII route retains "the Kottwitz homomorphism, Lang torsors". No RG2 stage mentions either.

**A second duplicate owner.** Lang's theorem is routed to RG2 here and in Lipnowski–Tsimerman, but to ET.0 by Kisin 2017.

**Fix.**
- Add the two items as planned at BG1.
- Correct the sentence in the report.
- Let the maintainer pick one owner for Lang's theorem.

### 11. The trace formula needs the geometric Frobenius (medium, error)

**The problem.** N02 defines Tr^ss(Frob, ·) without saying which Frobenius. Pappas–Zhu v4 §9.d fixes "σ … the geometric Frobenius element".

**Why the convention matters.** Take the Γ₀(p) model of GL₂ at a crossing point. There H¹ = Q̄_ℓ(−1).
- With the geometric Frobenius, Tr^ss = 1 − q = q^{1/2} z_μ there, as (4.7.12) requires.
- With the arithmetic Frobenius it is 1 − q⁻¹, and (4.7.12) fails.

**Fix.** Pin the geometric convention in N02, N06 and N14.

### 12. The level-change input to Proposition 4.3.7 has no item (medium, missing)

**The problem.** The proof (p. 191) uses that 𝒮_{K′} → 𝒮_K is finite étale, citing Proposition 4.2.2. That proposition is under E3, and the replacement argument lives only in a review note. The final deduction also needs 𝒮_{K′°} → 𝒮_{K°} to be étale and surjective.

**Fix.** Add the item and make S14 depend on it.

### Low findings

- **13.** No item says that (4.7.13) sends z′_{μ′,r} to z_{μ,r}. N14 also omits "K^p sufficiently small".
- **14.** E17 can be sharpened. Over finite k, H¹(𝒦, G₂) ≠ 1: the Pfister form ⟨⟨ε, u, p⟩⟩ is anisotropic, by Springer's theorem applied twice. Two items are loose:
  - U04 claims cd_p = 3, which Hu's theorem does not give.
  - U06 omits "k algebraically closed". Only that makes the tame splitting field cyclic.
- **15.** Three cross-references are stale:
  - P12 cites S38 where it means A01;
  - S09 points to a "new gap" that does not exist;
  - so does kisin10-lemma-1-4-5-g-splitting, whose concern the review rejected.
- **16.** E65 duplicates E64, and E65 writes Z(O_F) where it should be Z(O_{F,(p)}).
- **17.** Three misprints are unrecorded:
  - "F[[t]]" on p. 214;
  - "over Z_p" for Z_(p) on p. 184;
  - "Lemma 1.3.3" for Proposition 1.3.3 on p. 183.

  S01 also omits the no-E₈ standing hypothesis.
- **18.** The Iwahori–Hecke centre and its Bernstein isomorphism are routed twice: here to SmoothRepresentationsPartIIParahoricCenters, and by Venkatesh 2019 /29 into SR.1/SR.4.
