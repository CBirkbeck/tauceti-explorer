# Stevens, *The supercuspidal representations of p-adic classical groups*

*Paper job `PAPER-STEVENS-08` (issue #4587). Worker: Claude Code, session `cc-e94dc5` (Claude Opus 5.5), with one subagent per section group. Extraction: `PAPER-STEVENS-08.result.json`, status `complete`.*

## What was read

Shaun Stevens, *The supercuspidal representations of p-adic classical groups*, Invent. Math. **172** (2008), 289–352, DOI [10.1007/s00222-007-0099-1](https://doi.org/10.1007/s00222-007-0099-1).
- **The published article is paywalled.** The version read is the author's accepted version, [arXiv:math/0607622v2](https://arxiv.org/abs/math/0607622v2) (12 November 2007, "To appear in Inventiones mathematicae, 2008").
- It was read completely, line by line, in its LaTeX source, with the 55-page PDF for page locators. Section 1 was diffed against arXiv v1; v2 changed §2.2, §4.2 and §6.2.
- **Every locator and finding is therefore scoped to arXiv v2.**
- Later corrections were read in Miyauchi–Stevens ([arXiv:1212.0525](https://arxiv.org/abs/1212.0525), Math. Ann. 358 (2014)) and Kurinczuk–Stevens ([arXiv:1509.02212](https://arxiv.org/abs/1509.02212)).

## What the paper proves

**Setting.**
- F is a non-archimedean local field of odd residual characteristic p, of any characteristic, with a possibly trivial Galois involution whose fixed field is F₀.
- (V, h) is an ε-hermitian space.
- G is the F₀-points of the identity component of U(V, h): a unitary, symplectic or special orthogonal group.

**Results.**
- **Exhaustion** (Theorem 7.14): every irreducible supercuspidal representation of G is compactly induced from an explicit cuspidal type (J_M, κ_M ⊗ τ).
- **Construction** (Proposition 6.18, Corollary 6.19): every such type has intertwining J_M and induces irreducibly to a supercuspidal.

These are the classical-group analogue of Bushnell–Kutzko's theory for GL_N.

**How the types are built.**
- From self-dual lattice sequences and skew semisimple strata (§2).
- From skew semisimple characters and their Heisenberg representations (§3).
- From β-extensions (§4).
- From cuspidal representations of finite reductive quotients.

**How the theorems are proved.**
- Iwahori factorizations and Glauberman transfer (§5).
- An intertwining computation with explicit Weyl-group elements (§6).
- A covers and Hecke-algebra argument resting on Morris's level-zero theory (§§1, 7).

**Corrections by Miyauchi–Stevens (2014)**, used in the items:
- **Definition 6.5, "exactly subordinate",** must also require that P°(Λ_{o_E}) ∩ M be a maximal parahoric of G_E ∩ M.
- **Corollary 6.19** needs G_E to have compact centre and P°(Λ^M_{o_E}) to be a maximal parahoric. A maximal self-dual order is not enough.
- **Theorem 7.14** fails for G = SO(1,1)(F) ≅ F^×, which must be excluded. Hypothesis (H) in §7.2 is replaced.

## Coverage

There were **306 items**; the independent review merged three duplicate pairs, leaving **303** (6 library, 8 planned, 289 missing). The extraction's counts:

| Status | Count |
|---|---|
| library | 6 |
| planned | 9 |
| missing | 291 |

| Sections | Items | Library | Planned | Missing |
|---|---|---|---|---|
| Introduction, §§1–2 | 55 | 1 | 4 | 50 |
| §3 semisimple characters, Heisenberg extensions | 51 | 1 | 0 | 50 |
| §§4–5 β-extensions, Iwahori factorizations | 93 | 2 | 2 | 89 |
| §6 intertwining and supercuspidal types | 55 | 1 | 2 | 52 |
| §7 exhaustion | 52 | 1 | 1 | 50 |

Five items stated twice were merged:
- the Introduction's main theorems I(a), I(b) and II and its corollary, merged with Proposition 6.18, Corollary 6.19 and Theorem 7.14;
- a second definition of "supercuspidal".

**Library** (Mathlib `082e2d3`, Tau Ceti `f790474`):
- the base field (`IsNonarchimedeanLocalField`, fixed fields of an involution);
- Mackey's formula and Mackey's irreducibility criterion;
- Clifford's theorem (`FDRep.clifford_restrict_iso`);
- Frobenius reciprocity;
- intertwining Hom-spaces.

**Planned:**
- compact induction and supercuspidality in SmoothRepresentationsOfLocalGroups SR.2–SR.3;
- the generalized affine BN-pair, parahorics and the building of GL(V) in ReductiveGroupsPartII RG2;
- the projective-extension obstruction in Tau Ceti's InductionRestriction roadmap.

**Missing:** everything specific to classical groups. Neither library, and no atlas stage, has:
- self-dual lattice sequences and skew semisimple strata;
- the groups H¹ ⊆ J¹ ⊆ J and semisimple characters;
- Heisenberg representations and β-extensions;
- the Iwahori factorizations and Glauberman transfer of these objects;
- Stevens's types and their intertwining;
- the cover argument.

## The routes

**1. Part II → SmoothRepresentationsPartII** (289 items as extracted; 281 after the review moved six finite-group items to a third route and merged two duplicates). This is *Smooth representations of local groups, Part II: types, depth and the construction of supercuspidal representations*, parent SmoothRepresentationsOfLocalGroups.
- **The existing proposal.** It was accepted from Fintzen's paper (route 1) and joined by Newton–Thorne and Nakamura. It is exactly this direction, but its construction is Yu's, for tame groups with p ∤ |W|. For classical groups that excludes p up to the rank, which Stevens covers.
- **Why this is the right place now.** A route from Gan–Harris–Sawin–Beuzart-Plessis tried to add "Stevens's odd-residue-characteristic classical-group contract" to this Part II. It was rejected because that contract was unread. This extraction reads it, so the route coalesces with the existing proposal, keeping its id, title, parent, area and brief. It adds the classical-group branch.
- **Final theorems**, stated as corrected by Miyauchi–Stevens: Proposition 6.18, Corollary 6.19 and Theorem 7.14.
- **What the Part II imports:**
  - SR.0–SR.3;
  - ReductiveGroupsPartII RG2.1–RG2.4;
  - the Fintzen branch's general type and cover formalism;
  - FiniteWeilRepresentationsPartII for finite Heisenberg representations;
  - mixed-characteristic GL_m type theory from ET.6, without a second GL_m classification.
- **What stays explicit and separate:**
  - The Bushnell–Kutzko GL_N inputs are needed in every odd residual characteristic, including equal characteristic. ET.6 excludes equal characteristic, so this extension is an explicit, separately checked obligation.
  - Fintzen's p ∤ |W| branch and Stevens's odd-p branch stay separate, compared only where both apply.

**2. Part II → FiniteWeilRepresentationsPartII** (2 items). This is *Metaplectic groups, Weil representations and automorphic theta kernels, Part II: finite Weil–Heisenberg representations*, accepted from Fintzen's route 3. Stevens needs two statements from it:
- the finite Heisenberg lemma with a cyclic centre of order p^a (Proposition 3.5);
- the isotropic-induction form of Stone–von Neumann (Corollary 5.7, Lemma 5.12).

The accepted items assume a centre of order p, so these add the general form.

The maintainer's note also mentions endo-parameters and L-packets of classical groups. They are not in this paper; the Kurinczuk–Skodlerack–Stevens and Lust–Stevens paper jobs cover them.

## Mistakes in the paper

**42** mistakes were recorded by the extraction (54 after the independent review) under `sourceIssues`, each checked in the arXiv v2 TeX and compared with v1.

| Kind | Count |
|---|---|
| misprints | 30 |
| gaps | 7 |
| errors | 5 |

| Reach | Count |
|---|---|
| a stated result | 4 |
| the proof only | 4 |
| nothing | 34 |

**Already published: 7**, all from Miyauchi–Stevens 2014. These include all 4 that affect stated results:
- **E1:** the Introduction's claims that β is elliptic and that normalizers of maximal parahorics are compact both fail when G_E has an SO(1,1) factor.
- **E2:** Corollary 6.19 as printed is false. With G = SO(1,1)(F) and β = 0, c-Ind from o_F^× to F^× is reducible. An SO_{2n} example shows that a maximal compact P(Λ) is not enough.
- **E3:** Theorem 7.14 is false for G = SO(1,1)(F).
- **E27:** Definition 6.5 misses the maximal-parahoric condition.

The other three are the replacement of hypothesis (H) (E4), and two corrections in §7.2.2 (E36, E40).

**New: 35.** None changes a main theorem. They include:
- the element diag(ϖ_E, ϖ_E⁻¹) in Lemma 3.10, which is not in G_E for ramified E/E₀;
- an ill-typed Mackey display in the proof of Lemma 4.4;
- a formula for Λ′ on p. 48 that makes it equal to Λ″ (E38);
- a missing factor in the factorization w = z·s of Proposition 6.14;
- a group 𝔐₀ in §7.2.2 case (ii) that does not contain s_m s_{m−1} as defined (E37).

**Not recorded as a mistake of this paper.** The §3 reading also found that the transfer condition of Stevens's earlier Duke 2005 paper (§3.5) is false as stated. This paper itself corrects it in Remark 3.3. It is noted here, and item notes point to condition (3.4). It is not a `sourceIssues` entry, since the mistake is not in this paper.

**No erratum to this paper was found.** I searched Crossref, arXiv and the author's page, and read the later works above.

## Prerequisites

`prerequisites` lists 8 works, with the reason each is needed. None is in `papers.json` apart from those already queued as their own jobs.
- **Bushnell–Kutzko:** the GL_N book (1993), *Structure theory via types* (1998) and *Semisimple types* (1999).
- **Stevens's earlier papers:** *Semisimple characters* (Duke 2005) and *Intertwining and supercuspidal types* (2001).
- **Morris:** *Tamely ramified intertwining algebras* (1993) and *Level zero G-types* (1999), listed together.
- **Carayol** (1984).
- **Miyauchi–Stevens** (2014), which formalisers must read with this paper.

Every link was checked on Crossref.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-STEVENS-08.result.json`: ok.
- Every planned stage id is an atlas stage id. Every library citation resolves at the pinned commits and was opened by the extracting worker.
- Every missing item is taken by exactly one route.
- **Existing routes:** the Part II ids, titles, parents and areas are those of the accepted Fintzen routes (routes 1 and 3 of PAPER-FINTZEN-21).

## Corrections by the independent review (REV-PAPER-STEVENS-08)

Claude Code, session `cc-fb70e5`, 29 September 2026. The full report is `research/blueprint/reviews/REV-PAPER-STEVENS-08.md`.

- **Sources.**
  - The Inventiones text could not be read: it is paywalled, and UEA eprint 17017 has no full text. Findings stay scoped to arXiv v2, and `sourceVersions` records this.
  - The review read the published Miyauchi–Stevens (Math. Ann. 358 (2014)), including its Appendix A "Correction to the proof of [29, Theorem 7.14]".
- **Route 3 added.**
  - Six facts about finite reductive groups move from route 1 to a new `part-ii` route coalescing with ModularRepresentationsOfFiniteReductiveGroups: items 94, 95, 97, 130, 278 and 295.
  - Route 1's brief imports them from there.
  - All three routes are accepted.
- **Items.**
  - Three duplicate pairs are merged: 301 into 5, 200 into 9, and 304 into 253.
  - 25 locators are corrected.
  - The statements of items 27, 133, 153, 170, 173, 185 and 201–211 are corrected.
  - Eleven placeholder ids (E/I1–E/I8) are replaced by the real ids E36–E42.
- **Mistakes.**
  - All 42 findings are confirmed.
  - E5, E7, E9, E24, E31 and E32 are corrected, and E32 absorbs the slip "Lemma 7.12" for Corollary 7.12.
  - E37's `known` field is now "new". It read "new (…)", which the errata register files as corrected in print.
  - The `known` fields of E1–E4, E27 and E36 cite the published Miyauchi–Stevens appendix.
  - Twelve new findings are added: E43–E54, eleven misprints and one gap in the proof of Lemma 5.8.
- **Prerequisites.** The title of Stevens (2001) now follows the journal.
