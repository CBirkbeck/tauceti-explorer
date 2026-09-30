# REV-PAPER-CIUBOTARU-HARRIS-26: review of the extraction of Ciubotaru–Harris, *On the generalized Ramanujan and Arthur conjectures over function fields*

**Verdict: accept, after corrections made in place.**

- **Routes.** All four are accepted, and three Part II routes are corrected in place:
  - route 1's area is set to a galaxy id;
  - all three briefs now state their final theorems and name their imports.
- **Mistakes.** E6–E8 are confirmed; E1–E5 already carry the errata review's verdicts, and a recheck agrees. This review adds nine more (E9–E17). Three of them concern the main theorem:
  - **E11 (error):** Corollary 6.32(1) is false for Satake parameters with a non-central compact part. The counterexample is a G2 representation.
  - **E10 (gap):** the sketch of Theorem 4.3.
  - **E12 (gap):** the reduction to adjoint G.
- **Items.** One status is corrected (`sl2-integral-spectrum` is built in Tau Ceti), fourteen statements are corrected and two items added. The result has 83 items: 70 missing, 11 planned, 2 library.
- **Version.** Everything is scoped to arXiv v1. The Annals revision (8 October 2025) is still not served, and arXiv has no later version (both checked 30 September 2026).

Reviewer: Claude Code, session `cc-58621d`, 30 September 2026 (issue #1058). Extraction under review:
- the checkpoint by ChatGPT `c0-5fbc06`, and its completion by Claude Code `cc-39fac3` (issue #1057);
- at review: 81 items (68 missing, 12 planned, 1 library), four routes and eight `sourceIssues`, with status `complete`.

`cc-58621d` appears nowhere in its files.

Sources:
- **Preprint.** arXiv:2311.15300v1, 39 pages, SHA-256 `7261083b…c103` (the recorded hash). Page images were read wherever an index, formula or table mattered: pp. 1, 3, 5, 7, 10–13, 17, 18, 20, 22, 25, 29–31, 34 and 35.
- **Version of record.** Ann. of Math. 204 (2026) 545–601, doi:10.4007/annals.2026.204.2.3. The article page gives "Revised: 8 October 2025" and serves no PDF.
- **Libraries and atlas.** Mathlib 082e2d37 and Tau Ceti f790474, and the atlas as `scripts/build.py` assembles it.

Method:
- Four read-only readers checked the extraction:
  - §§1–4;
  - §§5–7;
  - §§8–10 and the appendix, with an independent recomputation of Tables 2–4;
  - statuses, routes and precedents.
- I rechecked every finding before applying it: E7, E8, E9, E10 and E11 at their locators, E11's counterexample by hand, and each route and precedent claim against the atlas and the other extractions.

## 1. Mistakes in the paper

**E11 (error, affects a stated result): Corollary 6.32(1), p. 25.**

As printed, the corollary covers every Satake parameter s = s_c s_ν, generic and unitary: it claims that s is geometric for the adjoint and Proposition 6.31's representations iff ν = 0. Its proof then says "If L(s) is assumed generic and unitary, we must have ν ∈ U0^g". But U0^g concerns *real* Satake parameters only (p. 17).

The counterexample is in G2:
- **The parameter.** Take s_c the involution with α∨(s_c) = (−1)^a, for α∨ = aα1∨ + bα2∨ with α1∨ the short simple coroot. Its centralizer is of type A1 × Ã1. Take ν = ½ω2.
- **Irreducible and generic.** The positive coroots take the values −1, q^{1/2}, −q^{1/2}, q^{1/2}, −q^{1/2} and −q, never q^{±1}. W_s is trivial, since s_{α1} fixes ν but moves s_c. So X(s) is irreducible by Kato's criterion, and generic.
- **Hermitian.** w0 = −1 fixes s_c and negates ν.
- **Unitary.** Along s_c s_{tν}, t ∈ [0, 1], X stays irreducible, and it is unitarily induced at t = 0. So X(s) is unitary.
- **The contradiction.** ν ≠ 0 is half-integral for every representation of G2, so (1) fails.

The proof breaks at "ν ∈ U0^g": ⟨3α1∨ + 2α2∨, ν⟩ = 1, so L(s_ν) is not generic.

Theorem 5.4's proof applies (1) to s_v(σ) with arbitrary compact part. Ad(s) has weights 0, ±1 and ±2 here, so (5.6) does not exclude this s, and the proof needs a further argument at such places. The Barbasch–Moy reduction to the centralizer of s_c is the natural tool. Corollary 7.5's proof makes the same step.

**E10 (gap, affects the proof): §4.1, step (2) of the sketch, p. 11.**
- The sketch says the local monodromy on L(Π, τ) is geometric at every place "because G is semisimple".
- The paper's own p. 3 says this is not known without an anchor: "hypothesis (2) … provides the anchor that guarantees that only integer weights occur". By Deligne and L. Lafforgue, τ∘σ is only a sum of χ ⊗ (pure) pieces, with χ of unknown weight.
- Theorem 4.2 is covered by [GHS]. Theorem 4.3, which the tempered case of Theorem 5.4 uses (p. 15), is not.

**E12 (gap, affects the proof): Theorem 5.4, p. 13.**
- The reduction to adjoint G is written only for types C and D, but the table of test representations covers only adjoint groups.
- For simply connected G of type A_{n−1} (n even), B_n or E_7, the dual group's representations all have weights in its root lattice. So adjoint half-integrality cannot be improved without the lift to ^L G^ad.
- The paper's lifting argument (p. 14 and footnote 6) works verbatim.

**Misprints (affect nothing), each checked on the page image:**
- **E9.** Definition 2.6's (ii) needs N to lower Frobenius weights, but (iii), N^i : gr_{w−i} → gr_{w+i}, needs it to raise them.
- **E13.** Theorem 5.4 takes u ∈ S and then allows "v = u", although v ∉ S.
- **E14.** §8.3 prints "ν_i ∈ Z + ½" and "Z + ¼" for ½Z and ¼ + ½Z.
- **E15.** §9.1 prints "m(π) ≥ 0" for m(π) > 0.
- **E16.** §9.1 and Conjecture 9.5 print Φ(U) for Φ_disc(U), and α_w(σ) = s_w(σ) for s_{w,ℓ}(σ).
- **E17.** The appendix lists D_n simple roots that do not match the increasing "dominant" coordinates.

**E6–E8: confirmed.**
- **E6.** Embedding E7 in E8 merges (A5)′/(A5)″, (3A1)′/(3A1)″ and (A3+A1)′/(A3+A1)″, so the Levi argument fails. The conclusion holds by direct computation (§3 below).
- **E7.** v1 has no Theorem 1.1.
- **E8.** Theorem 6.9 prints C₀ for C_{0,h}. The definition of C_{0,h} itself prints "C0∨".

**E1–E5** keep REV-ERRATA-PAPER-CIUBOTARU-HARRIS-26's verdicts. This review rechecked each at its locator and agrees. E5's corrected F4 point ω1 + ½ω3 + ½ω4 reproduces the p. 34 multiplicities exactly; the printed point has adjoint weights up to 16.

**Not recorded, as trivial or unverified:**
- the abstract's residue-field restriction, which the acknowledgments say was removed;
- Frob_w for Frob_v on p. 10;
- index slips on pp. 17, 18 and 20;
- "C" for the curve X on p. 14;
- "[Ca]" (Cartier), where Carter's tables were probably meant. The AMS page served a challenge, so this could not be checked.

## 2. Items and statuses

**Status corrected.** `sl2-integral-spectrum` is **library**. Its declarations are `TauCeti.exists_int_of_hasEigenvalue` (integer eigenvalues, any characteristic-0 domain) and `TauCeti.isInternal_eigenspace_toEnd_intCast` (the eigenspace decomposition over an algebraically closed field) (Tau Ceti `Sl2/Spectrum.lean:147, 305`). They are the built "integer spectrum" bullet of LieHighestWeight Layer 0, which the extraction had cited as a plan. `IsSl2Triple` (Mathlib `Sl2.lean:41`) states `nonzero-sl2-triple` exactly.

The other planned stages were reread (DWP.0/5/8, GS.5/7, SR.2–4, ES5, ES7:parabolic), and each plans its item.

**Corrected statements:**
- `filtration-recognition`: semisimple, over an algebraically closed field.
- `pure-wd`: a consistent geometric-Frobenius convention (E9).
- `cuspidal-finiteness`: Proposition 3.1's compact support.
- `hecke-algebraicity`: the rationality of the cuspidal spectrum, A0(G, Q̄) = ⊕ m(π)π.
- `finite-extension-lift`: all non-adjoint types (E12).
- `half-integral-test`: Definition 6.3's "geometric".
- `generic-unitary-region`: (6.4)–(6.6) exactly, for real parameters.
- `integral-root-wall`: Proposition 6.10.
- `generic-local-temperedness` and `nonsplit-temperedness`: restricted to real parameters (E11).
- `generic-reducibility`: dominant ν, and D_{2m}.
- `weight-array`: the fibre at u.
- `centralizer-reduction`: §8's split hypothesis and the attribution.

**Notes** were added to seven items: the attributions of §4.1, the open step of Theorem 1.11, the centralizer tables, and the three holes in Theorem 5.4.

**Added.**

| Item | Status | Use |
|---|---|---|
| ghs-discrete-series-purity | missing, route 3 | [GHS]'s Weil–Deligne purity of discrete series (and tempered representations), the anchor of Theorem 5.4 and the hypothesis of Theorem 10.3. PAPER-GAN-HARRIS-SAWIN-ETAL-24's items 16 and 21 state it, on a route not yet accepted. |
| spherical-tempered-generic | missing, route 2 | Spherical tempered implies generic ([Re93, Prop. 7.4]), the content of Corollary 5.7 |

**Missing items.** Searched both libraries and every atlas stage and packet. No owner exists for nilpotent orbits, Jacobson–Morozov or Kostant conjugacy (Tau Ceti AdoIwasawa Layer 5 explicitly keeps Jacobson–Morozov out). Nor does any exist for Kazhdan–Lusztig parameters, the unitary spherical dual, complementary series, or function-field Ramanujan–Arthur results.

## 3. The appendix, recomputed

An exact Bala–Carter enumeration, over every subset of simple roots and every distinguished labelling, gives 5, 16, 21, 45 and 70 orbits for G2, F4, E6, E7 and E8. Their adjoint gradings (dim gr_i = number of roots with α(h) = i, plus the rank at 0) are pairwise distinct.

All 91 printed rows of Tables 2–4 equal the computed grading for their printed label, including i_max. The columns headed Fil_i are graded dimensions (E4). So the extraction's certification of the tables and of the adjoint separation of E6 and E7 stands.

## 4. Routes

1. **LieHighestWeightPartIINilpotentOrbits: accept, corrected.**
   - The area "algebra" is not a galaxy id; it is now `representations`, as for the accepted LieHighestWeight Part IIs. PAPER-MAO-WAN-ZHANG-26's route of the same id, parent and title, rejected pending this review, now coalesces.
   - The brief states Lemma 2.4/10.9 and Proposition 10.2, and imports the built sl2 layer.
2. **SmoothRepresentationsPartIIUnitarySpherical: accept, corrected.** The brief now:
   - imports SmoothRepresentationsPartIIUnitaryDual (Gan–Savin, accepted), the nilpotent-orbit Part II, and ES5 and ES7:parabolic;
   - states Corollaries 6.32(1) and 7.5 for real parameters, and Theorem 8.5;
   - names the Barbasch–Moy reduction as the tool for non-central compact parts.
3. **GlobalShtukasPartIIRamanujanArthur: accept, corrected.**
   - It coalesces with Gan–Harris–Sawin's route 4, which was rejected pending "the exact updated Ciubotaru–Harris theorem".
   - The brief now imports ES5 and ES7:parabolic and states Theorems 5.4, 1.11 and 10.3.
   - It lists the three holes (E10, E11, E12) that the design must fill.
4. **FunctionFieldArithmetic [FA.6]: accept.**
   - FA.6 plans fixed-level cuspidal finiteness, coefficient models and descent of eigenvalues.
   - The paper refines that layer. Böckle–Harris–Khare–Thorne's accepted extraction plans the same proposition at FA.6.
   - The route is frontier-safe.

Every missing item is routed exactly once (70 of 70), and every stage exists. Importing routes 1 and 2 into route 3 is acyclic, since all three are new sinks.

## 5. Prerequisites

- All DOIs resolve on Crossref.
- V. Lafforgue (JAMS 2018) and Gan–Harris–Sawin are already in the atlas batch (papers.json), so they are removed under §16.
- Collingwood–McGovern now links the Routledge reprint (doi:10.1201/9780203745809).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CIUBOTARU-HARRIS-26.result.json` reports ok.
- The errata checks (`versions_checked`, `check_issues`) report nothing, and `collation.provenance` gives `preprint`. The `published-version` gap stays open and now lists E9–E17 for collation.
- `python3 research/blueprint/intake.py check-files` on the four files reports no problems.
- The source PDF's SHA-256 matches the recorded hash.
- Lean: none.
