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

There were **306 items**; the independent review merged three pairs to 303, and this repair merges 306 into the general disconnected-cuspidality definition 246, leaving **302 (6 library, 8 planned, 288 missing)**. Current counts, grouped by the first main-paper section in each locator:

| Sections | Items | Library | Planned | Missing |
|---|---|---|---|---|
| Introduction, §§1–2 | 60 | 2 | 5 | 53 |
| §3 semisimple characters, Heisenberg extensions | 51 | 1 | 0 | 50 |
| §§4–5 β-extensions, Iwahori factorizations | 91 | 1 | 2 | 88 |
| §6 intertwining and supercuspidal types | 53 | 1 | 1 | 51 |
| §7 exhaustion | 47 | 1 | 0 | 46 |

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

**1. Part II → SmoothRepresentationsPartII** (280 current missing items; item 306 merged into 246). This is *Smooth representations of local groups, Part II: types, depth and the construction of supercuspidal representations*, parent SmoothRepresentationsOfLocalGroups.
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

The extraction recorded **42** findings and the independent review increased this to **54**. This repair adds the skew-scalar misprint E55, for **55** current findings. Historical searches/reviews are preserved; only E55’s v1/v2 scalar passage is freshly compared here.

| Kind | Count |
|---|---|
| error | 5 |
| gap | 8 |
| misprint | 42 |

| Reach | Count |
|---|---|
| a stated result | 4 |
| nothing | 46 |
| the proof | 5 |

**Already published: 7**, all from Miyauchi–Stevens 2014. These include all 4 that affect stated results:
- **E1:** the Introduction's claims that β is elliptic and that normalizers of maximal parahorics are compact both fail when G_E has an SO(1,1) factor.
- **E2:** Corollary 6.19 as printed is false. With G = SO(1,1)(F) and β = 0, c-Ind from o_F^× to F^× is reducible. An SO_{2n} example shows that a maximal compact P(Λ) is not enough.
- **E3:** Theorem 7.14 is false for G = SO(1,1)(F).
- **E27:** Definition 6.5 misses the maximal-parahoric condition.

The other three are the replacement of hypothesis (H) (E4), and two corrections in §7.2.2 (E36, E40).

**Historical new findings: 35 before the independent review’s additions.** E55 newly records the verified skew-scalar wording. None of this repair’s findings disproves a main theorem. They include:
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

## Repair after RT-PAPER-STEVENS-08 (2 October 2026)

Codex, session codex-rtOQ9t, Refs #5539. All three independently confirmed findings are repaired.

- **Relative extension:** item 112 imports the normalized Clifford obstruction on K/N from the existing InductionRestriction layer-7 owner and rescales only by a quotient cochain, preserving η on N. Item 113 states the valid absolute determinant bound separately. Item 111 now passes through the smooth finite quotient, sets d=dim η and m=ord(det η), descends (det ρ)^m to K/N, and uses δ(det ρ)^m=α^(dm). Since d and m are p-powers, restriction to S/N and prime-to-p transfer kill the relative class. Item 114 retains its cohomology-carrier comparison. The exact missing bridge is a requests/upstreamNotes entry; no Tau Ceti roadmap is edited or theorem claimed built. E16 remains the superscript misprint, with explicit proof-context documentation. The Heisenberg counterexample refutes the extraction’s absolute iff, not Stevens’s extension theorem.
- **Unitary scalars:** item 78 and route 1 use F₀/o_{F₀} on the skew parts and restricted maps. Ambient orders/maps and Λ in V retain F/o_F. Its API includes the unramified unitary-line closure check, the invalid multiplication by i and the F=F₀ specialization. New E55 records the identical §2.1 scalar slip in v1/v2; no published-original collation or new independent source-issue review is claimed.
- **One cuspidality definition:** item 246 now covers the general disconnected finite reductive quotient, imports the connected predicate from Fintzen /33 and item 10, and records maximal-order plus §§7.2–7.3 consumers. Item 306 is merged with its provenance retained. The route drops its redundant entry. Counts are 302 items, 6 library, 8 planned, 288 missing; route sizes 280,2,6. No new finite-reductive roadmap or connected predicate is introduced.

The unread published-original entry is kept as source.unreadPublished metadata, outside sourceVersions; that list now contains only actual historical/preprint readings plus this bounded check. Fresh v2 pp.8,15,20,43 and v1 p.8 were read and viewed. All earlier sourceIssue review verdicts and recorded later-paper corrections remain unchanged. Detailed proof, diagnostics and supplier requests: [RT-PAPER-STEVENS-08.fixes.md](../redteam/RT-PAPER-STEVENS-08.fixes.md). No Lean deliverable or compilation.
