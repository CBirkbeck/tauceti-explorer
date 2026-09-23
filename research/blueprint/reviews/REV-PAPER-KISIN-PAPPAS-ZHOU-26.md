# REV-PAPER-KISIN-PAPPAS-ZHOU-26 — review of the extraction of Kisin–Pappas–Zhou, "Integral models of Shimura varieties with parahoric level structure, II"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1343).
- **Authors:** Codex, session `codex-c83e7a` (#1683), and Claude Code, session `cc-442dc5` (#2141, which completed it).
  This reviewer took no part in either.

**What was read.**

- **The paper.** Forum Math. Pi 14 (2026), e14, 1–89, doi:10.1017/fmp.2026.10031. The 89-page publisher's PDF was downloaded
  from Cambridge Core; printed page = PDF page. Cambridge stamps each download with its date and address, so its SHA-256
  (`bd0bcd07…`) differs from both hashes the extraction records; the text is the same. It was read in full, as page images,
  in six ranges:
  - §1 and §2 (pp. 1–15);
  - §3 (pp. 15–30);
  - §4 (pp. 30–47);
  - §5 (pp. 47–62);
  - §6 (pp. 62–71);
  - §7, the errata of §7.3 and the references (pp. 71–89).

  Every item was compared with the page. arXiv:2409.03689v3, the latest version, was compared where the printed text was in
  doubt.
- **The predecessors.** Kisin–Pappas (2018) was read at 4.6.21–4.6.22 (p. 205) for E6 and for the repair of E81.
- **The libraries.** All 14 library declarations were opened at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- **The atlas.** Every planned stage and route stage was checked in `data/atlas.json`.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KISIN-PAPPAS-ZHOU-26.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update, correction or erratum relation for doi:10.1017/fmp.2026.10031, nor for the
  two papers this one corrects (doi:10.1007/s10240-018-0100-0 and doi:10.1007/s00208-022-02387-8).

## 1. Items

- **Corrected fields (199):** 96 statements, 96 locators, 6 names and 1 kind; two notes gained a correction. Examples:
  - Lemmas 5.2.3, 5.3.2, 5.3.7 and 5.3.9 and Proposition 5.3.11 were recorded as Propositions or a Theorem; Theorem 6.2.3 and
    Corollaries 6.2.10 and 6.3.5 as Propositions; §3's "Theorem 3.1.8", "Proposition 3.3.10" and "Proposition 3.4.1" are
    Lemmas or do not exist.
  - Locators pointing at display numbers read as paragraphs ((2.1.3), (2.3.7), (2.4.5)) or at a non-existent §6.1.9.
  - F18 took "preserves the universal pair" as its hypothesis; the paper's is "t commutes with 𝒢".
  - The planned items P01–P03 and P05–P07 and items M12 and M19 held planning text; they now state what the paper uses.
- **Removed (6), not in the paper:**
  - F31: the paper never states or cites a relative-display Grothendieck–Messing equivalence; it cites Hoff only for
    Lemma 1.21, Theorem 1.28 and Remark 2.29.
  - P11: §7 does not use generic-fibre local shtuka moduli.
  - I06, I08, I09 and I10: Lemma 4.3.4, Lemmas A3.4–A3.5 and a step of the proof of Proposition 4.3.3 of Daniels–van
    Hoften–Kim–Zhang. The paper cites that work only for Theorem 4.2.3 (p. 74) and Proposition 4.3.3 (p. 85), which stay
    as I03 and I07. I05, the compatibility that Proposition 4.3.3 needs, stays, with its locator corrected to the proof of
    Corollary 7.2.24.
- **Added (88).** They are definitions, constructions and cited inputs the proofs use without an item. Examples:
  - the global Hodge-type and abelian-type data and the level subgroups of §1.1;
  - "generic in its facet" (footnote 3) and the embedding (2.4.5);
  - local model triples, integral Hodge embeddings, essentially tame groups and the construction (3.2.13) of the local model;
  - the affine Schubert variety, the root-curve and Finkelberg–Mirković sets, lifted fundamental weights and geodesic weights
    of §4;
  - horizontal tensors, very good embeddings into GL(𝓛) and over unramified 𝒪, and Zink's logarithmic coordinates in §5;
  - the classical-group lattice facts of §6;
  - fundamental Hodge embeddings, Deligne's Hodge-type lifting and the centre modifications of §7.

  Four of them are planned rather than missing:
  - Hodge-type and abelian-type data at ShimuraData D4;
  - the lattice-chain building of GL(V) at ReductiveGroupsPartII RG2.2 and RG2.3;
  - Néron–Ogg–Shafarevich at NeronModelsAndSemistableAbelianVarieties R11.5.

  The rest are routed with their sections' existing items. Two duplicates were merged, one being the invariance of local
  models under isomorphisms of adjoint data.

## 2. Statuses

- **Library.** All 14 library declarations exist at the pinned commits with the stated scope.
- **Planned.** Every planned stage exists.

## 3. Routes

All eight routes are accepted; `PAPER-KISIN-PAPPAS-ZHOU-26.review.json` gives a reason for each. The corrections:

- **Titles.** Three Part II titles now begin with their parents' exact atlas titles:
  - "Root systems, Weyl groups, and the Cartan-Killing classification, Part II: dominant subtraction and Demazure reduction",
    the title of the He (2021) candidate this route continues;
  - "Pro-étale descent, diamonds and small v-stacks, Part II: recovery of integral models";
  - "Hecke correspondences and local shtuka cohomology, Part II: integral parahoric models and crystalline diagrams".
- **Briefs.**
  - Routes 2, 4, 5 and 8 now name the confirmed corrections their designs must carry.
  - Route 1 is a source route and has no brief, so its corrections are on items T06 and T07.
  - Route 6's brief is rewritten around the two results the paper uses: Scholze–Weinstein Proposition 18.4.1, and the
    v-sheaf of a flat closure. The removed DvHKZ lemmas are no longer part of it.
  - Route 7's brief now says which shtuka results the paper itself cites.
- **Prerequisites.** Rebuilt as 43 cited works, one per entry, each with its DOI or a stable link and the place the paper uses it.
  The old entries bundled several works under bibliography labels. Dropped:
  - Kisin–Pappas (2018) and Kisin–Zhou (2025), which the registry already has;
  - Fakhruddin–Haines–Lourenço–Richarz, which the paper does not cite;
  - Pappas (1995), cited only for an example in a remark.

  Daniels–van Hoften–Kim–Zhang now points at its publication (Math. Ann. 395, 2026).

## 4. Mistakes

**The extraction's fourteen.** All are confirmed:

- **E1–E7.** These are the authors' own corrections of Kisin–Pappas (2018) and Pappas (2023), in §§1.3 and 7.3.
  - E6 is revised. The quoted sentence is the published text (p. 205). It is H, not H^♯, that may fail the third condition
    of §7.2.1. It affects nothing.
- **E8–E14.** These are in this paper.
  - E10 and E12 are widened to further places with the same slip.
  - E9 is revised:
    - In characteristic p the "Equivalently" description of 𝒲(α) in §4.2.9 fails, and with it the symmetry used for
      Proposition 4.2.10(1).
    - The last step of the proof of 4.2.10(2) fails in characteristic p.
    - Its kind is error. Its reach stays at a stated result, because Proposition 4.2.10(2) is unproved in characteristic p
      as printed.
    - The independent check proposes a repair (both inclusions of (4.2.7)) that would lower the reach to the proof. The
      repair relies, when p divides the string length, on the Donkin–Mathieu theorem, whose exact form was not checked.
    - Theorem 4.2.3 stands either way.

**New: 74 (E15–E88).**

- **How they were checked.** Each claim was checked a second time by an independent verifier. Of 77 claims, 68 were
  confirmed, 5 reclassified and 4 rejected. The verifiers found one more, E17.
- **Rejected:**
  - §3.1.9's normalisation sentence, which follows from the diagram (3.1.10);
  - the "only if" of (4.2.12) and Remark 4.3.14, which both follow from the converse computations;
  - the claimed non-surjectivity in Corollary 5.3.4, which does not occur.
- **Reclassified:**
  - Proposition 2.2.2(2)'s 𝒢̃_x (E20) is a misprint affecting nothing;
  - the reductive case of its proof (E22) reaches the proof;
  - Remark 3.4.7 (E38) reaches the proof;
  - Definition 4.1.2's missing "dominant" (E39) is a misprint affecting nothing;
  - the missed case in Proposition 4.3.10 (E48) reaches the proof.

The main new ones:

- **E36.** §3.4.5 and Proposition 3.4.6 omit "H of classical type". The argument uses Proposition 2.2.2, which covers only
  classical groups. An example with an E_6 factor meets every stated hypothesis while the objects of the proposition do not
  exist.
- **E69.** In §6.3.1 and Proposition 6.3.2 the contragredient ρ̄∘μ has weights {0, −1}, so it is not a Hodge embedding.
  The cocharacter must be twisted by the inverse scalar cocharacter. Corollary 6.3.5 is sound with the twist.
- **E62, E71.** In the proof of Theorem 6.1.9, "Λ̃^* = Λ̃^∨" fails after a ramified tame extension, and the ψ-dual Λ̃^∨ must
  be used throughout. In the proof of Corollary 6.3.5 the lattices Λ_i ⊕ Λ̄_i are not a chain; the chain Λ_i ⊕ (Λ_{−i})^⊥
  repairs it.
- **E79, E81, E84.**
  - The paragraph after Definition 7.2.7 says V ⊗_Q F gives a fundamental Hodge embedding. That is never so when F ≠ Q.
  - The proof of Proposition 7.2.10 needs a fundamental embedding for the centre-modified data. The only support it has is
    that paragraph, and a repair through Hom_{Z_G}(V,V), as in Kisin–Pappas (2018), works for the first modification.
  - In Proposition 7.2.16(2), Lemma 7.2.13 gives very goodness only for the smaller group G_1.
- **Other gaps reaching a proof:**
  - E22: the reductive case of Proposition 2.2.2;
  - E34: Lemma 3.4.1, where a closure is taken "by definition";
  - E38: Remark 3.4.7;
  - E48: Proposition 4.3.10;
  - E60: Proposition 5.3.18, where maps out of the Breuil–Kisin pair are not strict frame morphisms;
  - E61: Theorem 6.1.1, which needs R-smoothness over the tame extension.

The rest are misprints, apart from E75 (an error affecting nothing: K_S is not CM in type A_1) and the gaps E42 and E53,
which affect nothing.

None of these puts the main theorems in doubt: Theorems 1.1.1 = 7.2.21 and 1.2.3 = 4.4.3, and Corollary 7.2.24.

## Questions for the orchestrator

1. **Titles for shared Part II ids.** As in the Kisin (2017) and Kisin–Pappas (2018) reviews, the extractions sharing each
   id use varying subtitles. This review uses the parents' exact atlas titles; the design jobs should settle one per id.
2. **Items citing a cited paper's proof.** Four items recorded lemmas inside the proofs of results this paper cites (from
   Daniels–van Hoften–Kim–Zhang). They were removed as not in the paper. The route 7 brief keeps them as what a design
   proving the cited results would need.
