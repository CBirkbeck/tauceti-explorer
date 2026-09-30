# Red team: PAPER-GAO-HABEGGER-19 (Gao–Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*)

Job `RT-PAPER-GAO-HABEGGER-19` (issue #4093), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-GAO-HABEGGER-19.result.json`, in the format of PROTOCOL section 17.

**Result:** 9 findings: 3 medium and 6 low. None is high.

- **The extraction.** It is careful and faithful to the paper.
  - It has 76 items (10 planned, 66 missing), 9 routes and 27 source issues.
  - I re-read the whole paper and re-derived the main estimates. No item misstates its source, apart from two points below (item 30 and item 40).
  - E1–E27 are all correct, and no route lands in a finished blueprint.
- **What breaks.**
  - Two route problems:
    - The queue plans the Part IIs under other ids, and the Betti-map tranche can be deferred.
    - Lemma B.2 is sent to IG.0, although its proof needs Riemann existence, which IG.3 plans downstream.
  - One status is overclaimed: item 15 is planned at R11.1, but R11.1 does not plan the exact sequence of Néron models that Theorem 5.1 uses.
  - Four unrecorded source slips, one of them a small gap, which the review wrote into item 30.
  - Some missing general inputs, library citations and prerequisites, and a stale record of which text was read.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-fb70e5` (issue #1135, PR #1844, 22 September).
  - The review, REV-PAPER-GAO-HABEGGER-19, is by Claude Code `cc-442dc5` (PR #2446, 23 September).
  - There is no errata file for this paper.
  - `cc-f805bf` appears in none of these files.
- **Disclosure.**
  - This session red-teamed Xie–Yuan 22 (PR #4694), Tsimerman 18 (PR #4903) and Lawrence–Venkatesh 20 (PR #4763).
  - Finding 2 is related to RT-PAPER-XIE-YUAN-22/1. That finding concerned the characteristic-p failure of "the closure of an abelian subvariety is an abelian subscheme". Here the characteristic is 0 and the problem is a status claim, so it is not a repeat. The fix plans the fact once, for both papers.
  - Finding 7(c) repeats, for another item, the library observation of RT-PAPER-TSIMERMAN-18/9 (Mathlib's `absLogHeight₁`).
  - Finding 1 relies on the queue mechanism established by RT-PAPER-BENOIST-19/1 (not my work, confirmed).
  - No finding repeats my LD.6 and MPT Part II ownership findings. Items 30 and 31 (Habegger–Pila semi-rational counting; Ax 1972 for a constant abelian variety) are sources for LD.6, which is the pattern RT-PAPER-TSIMERMAN-18/10 recommended.

## What was read

- **The paper.** arXiv 1801.05762v3, downloaded 30 September.
  - Its SHA-256 `ffe408dc…fd34e` reproduces the recorded hash.
  - arXiv lists v1 (January 2018), v2 and v3 (January 2019), so v3 is the latest.
  - The published PDF (Ann. of Math. 189 (2019) 527–604, `annals-v189-n2-p03-s.pdf`) is served by the journal. Its SHA-256 `09304f58…3bfd` reproduces the review's hash.
  - I collated every new finding with the published text.
  - The Annals page links no correction, and Crossref has no update relation.
- **Method.** I read the whole paper myself, with no helper agents: §§1–11, Appendices A–C and the references. I used a page image where the layout mattered (p.25).
- **External inputs.**
  - Habegger–Pila, arXiv 1409.0771v1 (the only arXiv version), §7: Theorem 7.1, Corollary 7.2 and its proof.
  - The Ann. Sci. ÉNS text was not obtained, so finding 5 is scoped to arXiv v1.
- **The repository.**
  - The extraction, its report, the review JSON and report, and the register section.
  - Atlas stage texts: RP.0, RP.1, RP.5, R11.1, R11.5, LD.6, A2, A5, A6, GN.1, SF.0, SF.5, IG.0, IG.1 and IG.3.
  - The RS-03 narrowing of RP.0 and RP.1, and the unreviewed RS-25.
  - The packets of every routed roadmap.
  - `queue.json`, `make_queue.py` and `collation.py`.
  - Thirteen related extractions, listed in `checked`.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`, searched in `declarations.tsv`. I read every declaration I cite.

## What holds up

- **Statements.** All 76 items were checked at their locators, with every hypothesis range. The review's fifteen corrections and item 76 are right. In particular:
  - the corrected Néron–Tate kernel τ(A^{K̄/k}(k)) + A_tor;
  - Koizumi's bound n ≥ 3.
- **Re-derived.**
  - Lemma 5.2's height bound and exponential count.
  - Both cases of Proposition 5.3, including rationality of the fixed point in case (1).
  - Lemma 5.8's induction, including the relative-dimension-0 subcases (E8).
  - The general case of Theorem 5.1. Its images are degenerate because the Betti fibre through a degenerate point is a whole disc over Δ.
  - Lemmas 6.3–6.6 and Propositions 6.7 and 6.9.
  - Lemma 7.1, Proposition 7.2 and Lemma 8.2 (m = 2g, δ₀(0) ≠ 0).
  - §8.3 and Proposition 8.1.
  - The 4^N bookkeeping of Proposition 9.1 and the constants of Proposition 10.1.
  - The induction (10.4) and the normalisations of Theorem 11.1.
  - Lemma C.2, and the Zhang-inequality step of Appendix A.
- **Source issues.** E1–E27 are right.
  - E18's point (t, √(t³−t)) on a constant curve has positive height.
  - E19's tilted trivialisation is a genuine counterexample to the printed step.
  - E27's headings and E11's half-correction were checked in print.
  - The register lists the paper once, with no duplicate.
- **Statuses.**
  - No item is marked library.
  - The searches confirm that the pins lack the trace, Poincaré reducibility, Néron models, abelian-scheme heights, Betti maps, the Tits alternative, Bertini, Bézout for varieties, Ehresmann, Riemann existence and Moriwaki heights.
  - The planned statuses hold, except item 15 (finding 2) and the precise form of item 54 (finding 7).
- **Routes.**
  - All the routed packets are partial: RP, A, IG, LD and GN. SF is claimed externally, and R11 has no packet.
  - None of these packets yet has nodes from this paper.
  - The merged Part II briefs have no import cycle.
  - Owners agree with the other extractions for the trace, Koizumi, the Betti items, Bertini and uniform Manin–Mumford.

## Findings

### Medium

1. **The queue plans the Part IIs under other ids, and route 6 can be deferred.**
   - `paper_designs` keys part-ii routes by parent. So route 6 lands in `DESIGN-AbelianSchemesAndArithmeticModuliPartII`, and route 7 in `DESIGN-HodgeStructuresPartII`.
   - The ids the briefs import from, AbelianSchemesBettiMapsPartII and DegeneratingHodgeStructures, will never exist.
   - The abelian-scheme group's first member, in registry order, is Kings–Sprang's Poincaré-bundle proposal. The queue's "plan the first here" rule therefore allows the Betti-map tranche (with DGH21 and GGK26) to be deferred.
   - Theorem 1.4 needs Theorem 5.1, through Lemma 6.2.
   - This is the RT-PAPER-BENOIST-19/1 mechanism.
   - **Fix:** rename the references, and state in route 6's brief that it is a required supplier. For the maintainer: the Benoist queue fix, plus an `after` edge between the two design jobs.
2. **Item 15 overclaims R11.1.**
   - The proof of Theorem 5.1 uses BLR §7.5 Prop. 3: A/A₀ has good reduction, and 0 → 𝒜₀ → 𝒜 → ℬ → 0 is an exact sequence of abelian schemes.
   - It also embeds the Néron model of a Poincaré complement into 𝒜. That is valid in characteristic 0, because the kernel is étale, and fails in characteristic p.
   - R11.1 plans existence, the mapping property and the comparison with good reduction. R11.5 plans Néron–Ogg–Shafarevich and isogeny invariance. Neither states these facts.
   - **Fix:** split the item, and plan the exact-sequence statement once at R11.1/R11.5, also for Xie–Yuan.
3. **Lemma B.2 is routed to IG.0, and Riemann existence has no item.**
   - Lemma B.2's proof needs three inputs:
     - finite generation of the topological π₁;
     - Riemann existence (SGA 1 XII 5.1);
     - invariance of π₁ under extension of algebraically closed fields.
   - IG.3 plans Riemann existence (CHEN-24/112), and IG.3 depends on IG.1, which depends on IG.0.
   - Lemma 5.8 also uses Riemann existence.
   - **Fix:** add items for the three inputs, and route Lemma B.2 with them to IG.3.

### Low

4. **Three unrecorded slips, all still in print.**
   - (a) Remark 4.2 says "endomorphism" where "automorphism" is meant.
   - (b) Lemma 5.6 applies Grothendieck's theorem to Hom(B_s, A_s) ∩ Hom(H₁, H₁). That set is all of Hom(B_s, A_s), so the claim as printed is false: the identity of a fibre of a non-isotrivial elliptic scheme does not extend. The π₁-equivariant maps are meant, which is how item 40 is already stated.
   - (c) Pages 19 and 21 cite "Ax's Theorem [2]", where the paper's own p.6 cites [3] (Ax 1972).
   - **Fix:** add E28–E30.
5. **Lemma 5.2's appeal to Habegger–Pila's proof.**
   - Gao–Habegger claim that they "may arrange γ(0) ∈ Γ and a(0) ∈ ℤⁿ" after making y analytic.
   - Habegger–Pila's final reparametrisation keeps only π₂(β(0)) ∈ π₂(Σ), which is (iii).
   - In this family, (γ, a) can move while y is constant, so the restarted point need not be integral.
   - The proof is repaired by (iii): pick γ′ ∈ Γ with y(0) = γ′x − a_{γ′}. Then exp(x) + γ′⁻¹G′ ⊆ X.
   - The review wrote the stronger claim into item 30.
   - **Fix:** restate item 30 as Corollary 7.2 is printed, and add E31.
6. **General inputs with no item.**
   - The inputs:
     - invariance of domain;
     - the real constant-rank theorem;
     - the closed subgroups of Tⁿ (Kronecker);
     - the local theory of irreducible complex analytic spaces (dense, arcwise-connected smooth locus; the identity lemma);
     - good covers.
   - The pins have Baire but none of these, and only the draft SCV roadmap touches the analytic-space facts.
   - **Fix:** add the items and route them, with a maintainer note that no layer owns invariance of domain.
7. **Library citations.**
   - Item 54: Mathlib has the two-point Blichfeldt principle. The paper needs the counting form for non-convex sets, and GN.1's text ties Blichfeldt to convex symmetric bodies.
   - Item 47: Mathlib has "flat iff torsion-free over a Dedekind domain".
   - Item 9: Mathlib has `absLogHeight₁` for the n = 1 case.
   - **Fix:** cite these declarations, and state the needed Blichfeldt form.
8. **Prerequisites.**
   - Ax 1972 (item 31), Grothendieck 1966 (item 40) and Koizumi 1976 (item 76) are missing from both the prerequisites and the registry.
   - **Fix:** add all three.
9. **No `sourceVersions`, and a stale record of the reading.**
   - `source.readSections` still says the published version "was not collated", although the review collated it and every source issue cites it.
   - **Fix:** add a preprint entry (v3, 22 September) and a published entry (23 September), each with its reproduced hash, and correct the sentence.
