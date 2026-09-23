# PAPER-NEWTON-THORNE-21: Symmetric power functoriality for holomorphic modular forms

James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms*, [Publications Mathématiques de l'IHÉS 134 (2021), 1–116](https://doi.org/10.1007/s10240-021-00127-3); arXiv [1912.11261](https://arxiv.org/abs/1912.11261).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1448). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-NEWTON-THORNE-21.result.json](PAPER-NEWTON-THORNE-21.result.json). It has:
- 126 items: 21 planned, 105 missing;
- 7 routes: a source route to ML.3, one new Part II and five coalesced candidates;
- 38 prerequisite entries;
- 4 recorded misprints.

## Sources read

- **The published version** (open access, CC BY 4.0), read in full. Page numbers below are the journal's.
- **arXiv v3** (27 September 2021) is the version the journal published.
- **Errata:** Crossref, the journal page and Springer show no correction.
- **Cited inputs were not read.** Items resting on one state it as the paper uses it.

## What the paper proves

**The main results.**
- **Theorem A:** for every level-one eigenform, Sym^{n−1} is automorphic for all n ≥ 2.
- **Theorem B:** the same for every non-CM eigenform whose local components are nowhere supercuspidal. This includes semistable elliptic curves.
- **Corollary C:** their completed symmetric power L-functions are entire.

**Part I (§§2–3): automorphy of symmetric powers is constant on irreducible components of eigenvarieties.**
- **Setting.** Newton–Thorne work on Emerton's eigenvariety for a definite unitary group, with no Iwahori condition at p.
- **Theorems 2.24 and 2.27.** Suppose Sym^{n−1} is automorphic at one point of a component of the rank-2 eigenvariety. Then the whole component maps into the image of the rank-n eigenvariety.
  - **Local input:** trianguline deformation theory (Lemma 2.8's numerical criterion for non-critical triangulations, Proposition 2.15).
  - **Global input:** a bound on global trianguline tangent spaces (Proposition 2.11), fed by the authors' vanishing of adjoint Selmer groups.
  - **Classicality:** a lemma that excludes companion points (Lemma 2.30).
- **Theorem 2.33** transfers this to the Coleman–Mazur eigencurve by base change to a CM field.
- **§3** plays "ping pong" on the level-one, 2-adic eigencurve.
  - Buzzard–Kilford decompose it near the boundary into annuli X_i, on which the slope is i·v(w).
  - Twin points swap refinements: z ∈ X_i and its twin lie in annuli with i + i′ = (k − 1)/v(w).
  - This connects every level-one form (Theorem D = 3.1).

**Part II (§§4–7): one level-one form with automorphic Sym^{n−1} (Theorem E = 7.6).**
1. **The starting point:** the CM form σ_0 of weight 5 and level Γ_1(4).
2. **§4 raises the level on a definite unitary group** (Theorem 4.1). A congruence modulo p between two depth-zero types of U_3 does this:
   - one type is built from the cuspidal unipotent representation;
   - the other is a Deligne–Lusztig representation −R_C θ;
   - the congruence holds when q is a primitive 6th root of unity mod p (Propositions 1.12–1.16).
   - Labesse's trace formula counts the automorphic representations with these types (Proposition 4.6).
3. **§5 proves finiteness** of ordinary deformation rings whose residual representation is a sum of characters (Theorem 5.2), and finds generic primes (Theorem 5.7).
4. **§6 raises the level to Steinberg** with that deformation theory (Theorem 6.1).
5. **§7 runs an induction on n:**
   - odd n through Proposition 7.4;
   - n → 2n through Anastassiades–Thorne.

**§8 removes ramification one prime at a time (Theorem B).**
- **The analytic continuation step:** Proposition 8.2, using Theorem 2.33.
- **The patching step:** Proposition 8.3 finds a congruent form whose refinements are n-regular. If none existed, the patched module would be supported on a principal divisor of the local lifting rings (Lemma 8.4).

## What the atlas already has (21 planned items)

**The endpoints.** ModularityAndLanglandsExtensions ML.3 is to "integrate Newton–Thorne source-scoped symmetric-power automorphy". Theorems A and B and Corollary C are therefore planned there, and they form a source route to ML.3.

**Supporting layers:**
- ML.2: BLGGT14 potential automorphy.
- ML.5: soluble descent.
- ET.0/ET.1/ET.3: endoscopic data, transfer factors, transfer.
- ET.4: Labesse's stabilised trace formula.
- ET.7a and AG2.2: unitary base change and descent, and their Galois representations.
- AG2.5: purity and local–global compatibility.
- ET.6: the local Langlands correspondence with monodromy.
- SR.3: supercuspidal supports.
- PadicFamilies L2/L2a: the Coleman–Mazur eigencurve and Coleman classicality.
- PG.7: the Kedlaya–Pottharst–Xiao families of (φ, Γ)-modules and global triangulation.
- IHG.0–IHG.1 and R04.1: determinants and pseudodeformations.
- G7: polarized deformation problems.
- R08.2: Shotton's fixed-type rings and the Steinberg and unipotent conditions.
- R08.3 and L8: Kisin's potentially semistable rings and ordinary conditions.
- AF.5: algebraic modular forms.
- GL2ModularityLifting R22.2–R22.3: patching.

## Routes

**Why this split.** The method is planned nowhere, but most of its pieces have pending owners. The routes follow those owners.

1. **Source of ModularityAndLanglandsExtensions [ML.3]** (3 planned items): Theorems A, B and Corollary C.

2. **New Part II `SymmetricPowersByAnalyticContinuation`** (29 items; parent ModularityAndLanglandsExtensions, area automorphic).
   - **Title:** "Modularity, automorphy and Langlands endpoint extensions, Part II: analytic continuation of symmetric power functoriality along eigenvarieties".
   - **What it carries:**
     - Lemma 2.2;
     - the pseudocharacter spaces (Lemmas 2.12–2.14);
     - Proposition 2.11 and the adjoint Selmer vanishing;
     - the symmetric power maps;
     - Theorems 2.24 and 2.27, Corollary 2.28, Lemma 2.29;
     - the twin map, Theorem 2.33, Lemmas 2.34–2.35;
     - Buzzard–Kilford and the ping-pong lemmas, Theorem D;
     - §8's Propositions 8.2–8.3 and Lemma 8.4.
   - **Why a new Part II.** No candidate aims here:
     - Clozel–Thorne's Part II uses a different method (level raising);
     - the eigenvariety Part II serves local–global compatibility;
     - the trianguline owner is local.
   - **Who can extend it:** Newton–Thorne II and the Hilbert modular case.

3. **Coalesced with `SymmetricPowersByUnitaryLevelRaising`** (38 items; proposed by PAPER-CLOZEL-THORNE-17). The same programme with new types:
   - the definite unitary group and transfer-factor normalisation (Propositions 1.6–1.7);
   - Mœglin's L-packets (Propositions 1.9–1.11);
   - the U_3 Deligne–Lusztig types and their congruence (Propositions 1.12–1.16);
   - §4 (Theorem 4.1, Proposition 4.6);
   - §6 (Theorem 6.1);
   - §7 (Theorems 7.1 and 7.6, Proposition 7.4);
   - the imported GL_2 level-raising and Anastassiades–Thorne theorems.

4. **Coalesced with `LocalGlobalCompatibilityPartIIEigenvarietyCompanions`** (12 items; Breuil–Hellmann–Schraen, Ding):
   - Emerton's unitary eigenvariety and Proposition 2.22;
   - the pseudocharacter over it;
   - Hida's ordinary locus (Lemma 2.26);
   - the classicality Lemma 2.30 with the Orlik–Strauch functors.

5. **Coalesced with `TriangulineVarietyAndItsLocalModel`** (8 items): the local trianguline deformation theory of §2.3.1 and Proposition 2.15. It also takes Remark 2.16, which shows that the KPX global triangulation needs only standard Zariski density.

6. **Coalesced with `SmoothRepresentationsPartII`** (6 items; Fintzen): Moy–Prasad depth-zero types (Proposition 1.14), Henniart's explicit correspondence (Proposition 1.18) and Propositions 1.19–1.20.

7. **Coalesced with `PolarizedAutomorphyLifting`** (12 items; Boxer–Calegari–Gee):
   - ordinary parts and Geraghty's big Hecke algebras (Proposition 6.5);
   - §5's finiteness and genericity results (Theorems 5.2 and 5.7, Proposition 5.8);
   - the Allen–Newton–Thorne, Thorne 2015 and BLGGT14 inputs.

## Source issues (`sourceIssues` E1–E4, all misprints, each checked on the page image)

- E1: Lemma 3.3 (p. 61) concludes "z ∈ X_{i′}". It means the twin: z′ ∈ X_{i′}.
- E2: in the proof of Proposition 7.4 (p. 99), G_E stands for G_{F_{−1}}. E is the coefficient field.
- E3: in the proof of Proposition 8.3 (p. 109), "g = q + |T| − 1" should be g = q_0 + |T| − 1. The dimension count on p. 110 needs q_0.
- E4: two small slips: ρ̄_v for ρ̄_ṽ (p. 23), and the label "(nb)" for (b) (p. 86).

**Defects the paper reports in other works** (listed in the report only, not as source issues of this paper):
- Geck 1990, Theorem 4.2: a typo in the proof (χ̂_1 for χ̂_{q²−q}).
- Kedlaya–Pottharst–Xiao, Definition 6.3.2: a non-standard definition of Zariski density; Remark 2.16 repairs it.
- Breuil–Hellmann–Schraen: the arXiv version of Lemme 2.11 is weaker than the published one (footnote 5).

## Prerequisites not yet covered

Thirty-eight entries, all with DOIs confirmed on Crossref except three:
- Labesse 2011 and Nakamura 2013 have none;
- Colmez 2008 is cited by its Astérisque volume.

The entries by topic:
- **Residually reducible automorphy lifting:** Allen–Newton–Thorne; Thorne 2015.
- **Level raising and adjoint Selmer groups:** Anastassiades–Thorne; Newton–Thorne 2020 (adjoint Selmer).
- **The 2-adic eigencurve:** Buzzard–Kilford.
- **Potential automorphy:** BLGGT14.
- **Unitary groups:** Labesse; Mœglin 2007; Rogawski; Bellaïche–Chenevier 2011 (sign).
- **Types:** Moy–Prasad; Lust–Stevens; Kazhdan–Varshavsky; Dudas–Malle; Geck; Henniart 1992.
- **Local deformation rings:** Shotton; Bellovin–Gee.
- **Trianguline theory and pseudocharacters:** Bellaïche–Chenevier; Nakamura; Chenevier 2011 and 2014; Hellmann–Schraen; Colmez 2008.
- **Eigenvarieties and locally analytic theory:** Emerton 2006a/b; Breuil–Hellmann–Schraen 2017; Breuil 2015 and 2016; Orlik–Strauch; Sorensen; Taïbi.
- **Ordinary Hecke algebras:** Geraghty.
- **Patching and auxiliary inputs:** Maire; Weston; Thorne 2016; Khare–Thorne.
- **The pending companion extraction:** Clozel–Thorne III.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-NEWTON-THORNE-21.result.json` reports no errors.

## Review (REV-PAPER-NEWTON-THORNE-21, 23 September 2026)

The review accepted the extraction and all its routes after corrections made in place, and added one route. It was done by Claude Code (session cc-38267a), and the full record is `research/blueprint/reviews/REV-PAPER-NEWTON-THORNE-21.md`. Four checkers read the paper in sections against the page images and the arXiv v3 TeX; the coordinator re-derived every substantive finding.

- **Statements corrected (about 40 items).** The material ones:
  - 10: the residual multiplicity-free hypothesis;
  - 12: the endoscopic η;
  - 34–36: the §1.17 hypotheses;
  - 48: Remark 2.16;
  - 52: E-rational ρ_v;
  - 95: the conditions on Σ;
  - 98: Corollary 5.4 gives a lift of G_{F⁺,S∪Σ};
  - 101: Theorem 5.7's hypotheses;
  - 104: how BLGGT14 Theorem 3.1.2 is applied;
  - 119: Edixhoven needs level prime to p;
  - 121: π_0 is an isobaric sum;
  - 125 and 126: patching, and soluble descent against cyclic base change.
- **Locators:** items 85 and 112 corrected.
- **New items: 38** (17 planned, 21 missing), 164 in total. They include:
  - the definitions of regular algebraic and polarizable representations, Sym^{n−1}π, Bloch–Kato H¹_f, primitivity and generic primes;
  - the inputs behind Corollary C (modularity, Godement–Jacquet, Λ(Sym^n E, s));
  - Mœglin–Waldspurger, temperedness, Kazhdan–Varshavsky, KPX Proposition 6.2.8, BHS17 Lemme 2.11, Conrad, Sen, Zelevinsky, Arthur–Clozel's cyclic base change, Chebotarev;
  - the Ribet–Momose large-image theorem, with a new source route to R19.3.
- **Routes:**
  - Item 73, the vanishing of adjoint Selmer groups of Newton–Thorne 2020, moved to PolarizedAutomorphyLifting. That is the single owner chosen with the review of PAPER-NEWTON-THORNE-21-B.
  - The briefs of routes 2, 3 and 7 record the new items and the corrections their design jobs must respect.
  - The prerequisite Clozel–Thorne III was removed, since it is already an atlas paper, and eight prerequisites were added.
- **Source issues:** E1–E4 are confirmed, and E5–E26 are new.
  - **E21 is the most serious.** In the proof of Proposition 7.4, π_2 = τ_0 ⊗ |·|^{(n−2)/2}ιω_1ω_0^{n−1} is not conjugate self-dual: it fails by δ_{K/ℚ}|_{F_0}. So Theorem 4.1 does not apply as printed.
  - This leaves a gap in the printed proof of Theorem 7.1 for n not a power of 2, and through it in the printed route to Theorems A, B and E. Remark 7.5 covers powers of 2.
  - The others are:
    - repairable gaps: E7, E10, E12, E16, E19, E22–E25;
    - a false remark in the sketch of Part II: E18;
    - an over-strong corollary that is never used: E15;
    - misprints.
