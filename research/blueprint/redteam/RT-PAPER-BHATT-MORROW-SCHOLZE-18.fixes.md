# RT-PAPER-BHATT-MORROW-SCHOLZE-18: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #5012, job FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18).

**Scope.**
- **Findings:** `RT-PAPER-BHATT-MORROW-SCHOLZE-18.result.json`, by cc-f805bf.
- **Verdicts:** `RT-PAPER-BHATT-MORROW-SCHOLZE-18.review.json` and `reviews/REV-RT-PAPER-BHATT-MORROW-SCHOLZE-18.md`, by
  Claude Code session cc-48533a. All fifteen findings are confirmed.
- **This job:** the issue lists the eight medium findings (/1–/8), and this job applies them. The seven low ones
  (/9–/15) are not part of it.
- **Corrections:** the verifier corrected the fix of /1 (the main fix would make a cycle), /2 (the owner is the
  CR.3:Frobenius-isogeny substage), /4 (the justification of the primary fix was false, so a stage link is needed) and
  /6 (only W(𝔪^♭) fails idempotence). It added to /3, /5, /7 and /8. I applied the verifier's version throughout; each
  section says how.

**Files changed.**
- `papers/PAPER-BHATT-MORROW-SCHOLZE-18.result.json`, edited by a script that asserts each replaced string occurs once.
  The file keeps its own format (indent 1, UTF-8).
- `papers/PAPER-BHATT-MORROW-SCHOLZE-18.md`, which gets a closing section.

**Result.** Before and after:

| | Before | After |
|---|---|---|
| Items | 190 (2 library, 92 planned, 96 missing) | 197 (2 library, 94 planned, 101 missing) |
| Routes | 14 | 15 |
| Source issues | E1–E18 | E1–E22 |

**Independence.** I did none of:
- the extraction (cc-fb70e5, continued by cc-442dc5);
- its review;
- the red team (cc-f805bf);
- the verification (cc-48533a).

**How I checked.**
- **Stage links.** I tested every proposed link on the stage graph of `data/atlas.json` (its stage edges and `requires`
  lists). This checks the verifier's computation, which also used the links of accepted restructurings and link maps.
  - The new links AI.0 → CR.4, CR.3:Frobenius-isogeny → AI.5 and P8:local-rational → AI.4 are each acyclic, and all
    three together are acyclic. None of them is already implied.
  - The link P8:local-rational → CP.3 exists.
  - AI.3 is not upstream of AI.2, CR.4 is not upstream of AI.3, and AI.4 is not upstream of P8:local-rational.
  - AI.0 is upstream of AI.2, AI.3, AI.5 and CP.0.
  - CR.3 is upstream of CP.5 and not of AI.5.
- **The paper.**
  - For /7 and /8 I read both the arXiv v3 TeX source and the published PDF from Centre Mersenne at each locator.
  - For /3 and /6 I read the TeX of Theorem 5.7 and the paragraph after it, the proof of Theorem 13.1, §8.2, Corollary
    9.11 and Lemma 9.12.
  - For the §2 citations of /5 I read the published pp. 236–241.
  - The published page numbers and the other quotations are those the verifier checked.
- **Known errata.** For E19–E22 I checked the arXiv listing (v3 of 15 January 2019 is final), Crossref's metadata for the
  DOI, and a Crossref search for an erratum. None records these slips.

## /1 (medium, duplicate): coherence to AI.0, §4.2 stays at AI.2

The finding's main fix, moving §4.2 to AI.5, is not applied. The verifier showed that it makes a cycle: Lemma 4.26 (item
079, AI.2) uses Proposition 4.13 (p. 278), and AI.5 requires AI.2. The finding's reading of RS-01 also drops its
qualifier.

- **Items 051–056** (Proposition 3.24, Lemmas 3.25–3.28, Corollary 3.29) move from route 4 (AI.3) to route 1 (AI.0).
  AI.0 is upstream of AI.2, AI.3, AI.5 and CP.0. This removes the ordering error: Lemma 4.9 at AI.2 uses them, and AI.3
  is not upstream of AI.2.
- **Items 062–068** stay in route 3, and item 068 stays planned at AI.2.
- **Route 3's reason** is rewritten. It cites:
  - the AI.2 tag of Proposition 4.13 in the accepted CohomologyComparisons decomposition;
  - Lemma 4.26's use of Proposition 4.13;
  - Lemma 4.9's use of coherence.
- **Item 065 (Lemma 4.9)** stays at AI.2. Its note records why RS-01's assignment to AI.5 cannot be carried out.
- **Aliases,** recorded in routes 1 and 3:
  - CP.0/coherence-of-witt-vectors-of-perfectoid-integers becomes an alias of the AI.0 node;
  - CP.5/perfectness-and-tor-bounds-for-ainf-modules and CP.5/ainf-module-structure-theorem become aliases of the AI.2
    nodes, not the AI.5 nodes the finding names.

## /2 (medium, error): Proposition 13.21

- **Item 189** becomes missing. It is routed by a new source route 15 to CrystallineCohomology:CR.3:Frobenius-isogeny,
  as the verifier specified. That substage proves the rational Frobenius isogeny; the early CR.3 stage does not.
- **Route 15's reason** gives:
  - the two steps of the proof (pp. 387–388);
  - its use in Theorem 14.3 (p. 392);
  - the link CR.3:Frobenius-isogeny → AI.5;
  - the scope requirement: the substage must cover smooth affine, non-proper schemes.
- **Route 6's reason** and **item 009's note** record the dependency and the link.
- **CP.2's line** "Prove the relevant crystalline change-of-base/invariance statement after p-inversion" becomes an import
  (item 189's note and the maintainer notes).

## /3 (medium, error): the primitive comparison

- **Route 14** keeps its number, and its stage changes in place from PadicHodgeTheory:P8 to P8:local-rational.
  - It carries item 085 (Scholze's finiteness theorem), as the verifier's first addition requires: Theorem 14.3's proof
    applies Corollary 4.20, which needs finite generation.
  - It also carries the new item 197, the B_dR^+ form RΓ_et(X_C, Z_p) ⊗ B_dR^+ ≅ RΓ_proet(X_C, B^+_{dR,X}) (p. 287).
    This follows the verifier's third addition, which prefers stating it at the primitive comparison's stage to adding
    AI.4 → CP.3. Theorem 13.1's proof uses it (p. 385).
- **Route 14's reason** says why P8 cannot own these items: P8 is downstream of AI.4 and CP.3. It says that
  P8:local-rational fits by order but its text must be widened, or given an early substage (the verifier's second
  addition). It also says that PAPER-SCHOLZE-13 route 1 should be restricted to P8:local-rational.
- **Route 5's reason** records the link P8:local-rational → AI.4.
- **Item 092's note** names the owner and the link. **Item 018's note** names item 197 and the existing link
  P8:local-rational → CP.3.
- **Item 092** stays at AI.4. Its one real consumer, Theorem 14.3(iv), is at AI.5, which is downstream.

## /4 (medium, error): the Witt-vector lemmas

- **Items 138, 146, 147 and 149** (Lemma 9.8, Lemma 10.1, Corollary 10.2, Theorem 10.4) move from route 11 (CR.4) to
  route 1 (AI.0).
- **The link AI.0 → CR.4** is recorded in routes 1 and 11. The verifier showed that the finding's justification is false:
  AI.0 is not upstream of CR.4. CR.4's own items use these results:
  - Lemma 10.8 (item 152) uses Theorem 10.4;
  - Proposition 10.14 (item 157) uses Theorem 10.4;
  - Lemma 10.9(ii) (item 153) uses Lemma 10.1.

  Without the link, the move would only shift the ordering error to CR.4.
- **Route 11's reason** is rewritten for its remaining items. Route 4 no longer lists coherence.
- **Notes:**
  - items 137, 139 and 056 name where they import Lemma 9.8, Theorem 10.4 and Corollary 10.2 from;
  - items 152, 153 and 157 name their imports from AI.0;
  - item 149's note no longer calls it the input of CR.4 alone.
- **The alternative link CR.4 → AI.3** is not used. The verifier ranks it second, because it would make the local AΩ
  construction wait for crystalline cohomology.

## /5 (medium, error): the §2 examples

- **Items 024–028** (Proposition 2.2, Remark 2.4, Lemmas 2.5, 2.7, 2.9) move from route 6 (AI.5) to route 9 (CP.5).
- **Planned stages.** Item 023 is planned at [CP.5, CR.3] and item 029 at [CP.5] only.
- **AI.5 is not kept as an acceptance-test planner.** Following the verifier, the inputs are not upstream of AI.5.
- **New missing items in route 9,** for the cited inputs:
  - 191: Illusie's crystalline cohomology of Enriques surfaces in characteristic 2 (Proposition 7.3.5);
  - 192: Bertini over finite fields (Gabber 2001, Poonen 2004);
  - 193: Lang's lifting of singular Enriques surfaces to Z_2 (Lang 1983, Theorems 1.3–1.4), which the verifier added.

  I checked all three citations on the published pp. 236–238. All four sources were already among the prerequisites.
- **Route 6's reason** says that AI.5's line "Use the examples of BMS1 §2 to test …" is misordered.
- **Finite flat group schemes.** The verifier also names ModularCurves 0B/0C, R07.1 and R09.3 as suppliers of the finite
  flat group schemes of Lemmas 2.5–2.9 that are ancestors of CP.5. On `data/atlas.json` alone, R07.1 and R09.3 are
  upstream of neither CP.5 nor AI.5; the verifier's ancestry uses accepted links I did not recompute. So route 9's
  reason cites only the CR.3 argument, which I checked.

## /6 (medium, missing): almost purity

- **Item 121** is split. It keeps the definition of the three Ω̃ variants and the maps between them. The almost
  quasi-isomorphisms and the identification RΓ(X_profet, Ô_X^+) = RΓ_cont(Δ, R̂̄) move to the new item 194.
- **New planned items:**
  - **194**, planned at [AI.3, PerfectoidSpaces:P3]. It states Faltings' almost purity in group-cohomological form (p.
    306), its identification with pro-finite-étale cohomology, and the pro-étale comparison (p. 307). Its note cites
    the owners of the identification in the accepted PAPER-SCHOLZE-13, which I checked: A1 for Proposition 3.5, H0 for
    Proposition 3.7(iii), and AI.3 for Lemma 4.10(v) and Corollary 6.6.
  - **195**, planned at AI.3. It covers three versions:
    - the W_r version relative to W_r(𝔪) (proof of Corollary 9.11);
    - the A_inf version relative to [𝔪^♭] (the map (2) of §1.3);
    - the mod p version in D(O^♭) relative to 𝔪^♭ (Lemma 9.12(i), in Proposition 9.14 and Lemma 12.8).
  - **196**, a definition planned at PerfectoidSpaces:P0: almost zero modules and almost quasi-isomorphisms relative to
    an idempotent ideal. It is instantiated at 𝔪, 𝔪^♭, [𝔪^♭] and W_r(𝔪). Following the verifier, there is no
    W(𝔪^♭) almost notion: only W(𝔪^♭) fails idempotence.
- **Notes on items 091, 092 and 140** say that "killed by W(𝔪^♭)" is a plain annihilation statement. Item 134's note
  points to items 194–195.

## /7 (medium, error): Lemma 3.20's converse

- **Item 047's converse** adds "and p is topologically nilpotent in R". Its last sentence stays, since it concerns
  topological K- and Q_p-algebras (the verifier's second adjustment).
- **E19** records the error: kind error, affects a stated result, known new. It includes:
  - the counterexample A = (p,T)-adic completion of O_C[T^{1/p^∞}], R = A[1/T];
  - where the printed proof fails;
  - how the proof goes through with the hypothesis.

  The correction uses the verifier's wording for when the hypothesis holds. "Any Tate Q_p-algebra" is too loose, and
  E19 gives Q_p((T)) as the example.
- **The paragraph after the lemma** needs no correction, as the verifier found.
- **The stages.** Q0:integral-algebra and P1 do not state the converse in their atlas texts. Item 047's note says their
  decompositions must carry the hypothesis.

## /8 (medium, error): Lemma 11.11

- **Item 162** now reads λ_r([T_i]) = U_i^{p^r}, and its note points to E20–E22.
- **New source issues,** all misprints that affect nothing, known new:
  - **E20:** the normalization in Lemma 11.11. The locator follows the verifier's page correction: the statement is on
    p. 351, and the H^0 formula and identification of the proof on p. 352.
  - **E21:** the domain W_r(O)[T^{±1}] in the sentence before the lemma (p. 351).
  - **E22:** the element ([ζ_{p^r}^{u}] − 1)/([ζ_{p^r}] − 1) in the proof of Lemma 11.9 (p. 351). It is printed three
    times, and the correction covers all three.

## Not applied, and why

- **The seven low findings (/9–/15)** are outside this issue.
- **/1's main fix** (§4.2 to AI.5) would make a cycle. The verifier's replacement is applied instead.
- **/5's alternative link CR.3 → AI.5** is not enough alone (see /5), so it is not used.

## For the maintainer

- **Stage links to add to the atlas.** All are acyclic, singly and together:
  - AI.0 → CrystallineCohomology:CR.4 (/4);
  - CrystallineCohomology:CR.3:Frobenius-isogeny → AI.5 (/2);
  - PadicHodgeTheory:P8:local-rational → AI.4 (/3).
- **Stage texts:**
  - **P8:local-rational** must be widened, or given an early substage with the same requirements, to own Scholze's
    primitive comparison, the finiteness of H^i_et(X_C, Z_p) and the B_dR^+ comparison (/3).
  - **CR.3:Frobenius-isogeny** must cover smooth affine, non-proper schemes. It should receive a request from AI.5 for
    Proposition 13.21 (/2).
  - **CP.2's line** "Prove the relevant crystalline change-of-base/invariance statement after p-inversion" becomes an
    import (/2).
  - **AI.5's line** "Use the examples of BMS1 §2 to test …" is misordered; CP.5 carries that acceptance (/5).
- **RS-01.** Its assignment of the CohomologyComparisons perfectness-and-Tor node (Lemma 4.9) to AI.5 conflicts with
  Proposition 4.13 at AI.2. The owner must be AI.2, or AI.0 with coherence (/1).
- **Aliases** (/1):
  - CP.0/coherence-of-witt-vectors-of-perfectoid-integers → the AI.0 coherence node;
  - CP.5/perfectness-and-tor-bounds-for-ainf-modules and CP.5/ainf-module-structure-theorem → the AI.2 nodes.
- **PAPER-SCHOLZE-13 route 1** sends the primitive comparison to [P8, P8:local-rational]. It should be restricted to
  P8:local-rational (/3).
- **Verdicts:**
  - Record a verdict for the new route 15.
  - Route 14 keeps its number, but its stage changed from P8 to P8:local-rational, so its recorded verdict should be
    re-checked.
  - Routes 1, 3, 4, 6, 9 and 11 changed membership or reason, and their verdicts still apply by number.
- **PerfectoidQuotients Q0:integral-algebra and PerfectoidSpaces P1:** their decompositions must state the Tate
  comparison's converse with the hypothesis that p is topologically nilpotent (/7).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/*.result.json`: every extraction ok.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- Every missing item is routed exactly once.
