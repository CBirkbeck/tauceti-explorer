# REV-HabiroCohomologyFoundations--HQ.1 — review of the blueprint of q-Hodge filtrations and Habiro cohomology (part one)

**Verdict: `needs_changes`.**

- **The packet and the suggested Lean file are corrected in place.** Every node was checked against its source, and every
  baseline citation was read at the pins. `check_blueprint` reports no errors.
- **The only outstanding change is the roadmap document.** `research/blueprint/readmes/HabiroCohomologyFoundations--HQ.1.md`
  is outside this review's files, so it still describes the uncorrected packet. It must be regenerated from the corrected
  packet before promotion.

- **Reviewer:** Claude Code, session `cc-2aeb03`, 25 September 2026 (issue #423).
- **Author of the blueprint:** another worker of the programme (#2895). This reviewer took no part in it.
- **Baseline:** Mathlib `082e2d3`, Tau Ceti `f790474`.
- **Method:** three independent reviewers each took a group of layers (HQ.1–HQ.2, HQ.3–HQ.4, HQ.5 with HQ.5-trace, HQ.6
  and HQ.7) and wrote a patch. The coordinating reviewer merged the patches, resolved their conflicts, spot-checked the
  findings, and had the suggested file rewritten and elaborated.

## What was read

- **The three papers of Ferdinand Wagner, at their latest arXiv versions** (abstract pages checked on 25 September 2026):
  - "q-Hodge complexes over the Habiro ring" (arXiv:2510.04782v2);
  - "q-Witt vectors and q-Hodge complexes" (arXiv:2410.23078v5). Its title changed in v5, and the source record is updated.
  - "q-de Rham cohomology and topological Hochschild homology over ku" (arXiv:2510.06057v1). The packet recorded it as "ku and
    q-de Rham cohomology"; the title is corrected in a follow-up.

  The gzipped e-prints hash to the SHA-256 values the packet records. The PDFs were read for page numbers and excerpts,
  and formulas were checked on rendered pages.
- **Added source:** Meyer–Wagner, "q-Hodge complexes and refined TC⁻" (arXiv:2410.23115v4). The packet listed it as not
  obtained; paragraph 3.15 and Lemmas 3.16 and 3.17 were read.
- **Secondary check:** Bhatt–Scholze (arXiv:1905.08229), Theorem 16.18, for E104.
- **`sourceVersions`** now records the versions read. There is no published version of any of them.
- **Libraries.** Every `mathlib:` citation was opened at the pinned commit.

## Counts

| | Before | After |
|---|---|---|
| Nodes | 66 | 118 (66 corrected, 52 added; 1 moved) |
| Baseline declarations | 20 | 24 (16 confirmed, 4 fixed, none removed; 4 added) |
| API items / unit tests | 127 / 92 | 199 / 117 (every test now has its `kind` and a Lean name) |
| Planets | 28 | 29 (at most six per layer) |
| Gaps | 5 | 13 |
| Requests | 25 | 33 (`neededBy` recorded wherever a node cites the supplier) |
| Source issues | 3 | 29 (E1–E3 confirmed; 26 added, all confirmed) |
| Layers `source_decomposed` | 8 | 6 (HQ.1 and HQ.3 are now partial) |

`python3 scripts/check_blueprint.py --index <pinned index>`: 0 errors, 0 warnings.

## Main corrections

**Every excerpt was a paraphrase.** They are now literal passages of the source, at most 300 characters each, checked
mechanically against the LaTeX or the PDF text. The packet's own `readSections` had described them as "the mathematics
written out in words".

**Wrong statements corrected:**

- **Hypotheses.** Appendix A needs a p-torsion-free Λ-ring, not a perfectly covered one.
- **A misread formula.** The q-derivative formula contains the operator iterate (∂ᵢTᵢ)^(n−1), which had been read as a
  divided power.
- **Theorem 4.22(b)** moves to HQ.5-trace, because its proof is the ku paper's Theorem 4.17. The node also had Remark 4.23
  backwards: a presentation as in (a) gives an E₁-lift as in (b), not the reverse.
- **Theorem 4.17's** explicit description holds only for the identity cover; the node claimed it for every resolution.
- **Lemma 4.2's** truncation is the *right* adjoint of the inclusion, not the left (E301). A map from an object vanishing
  above degree n into M is exactly a family of maps in degrees ≤ n.
- **The sub-operad of Corollary 4.16** is not closed under composition when A is not a ℚ-algebra (E305). The domain is now
  the largest simplicial subset whose vertices and edges satisfy the source's conditions. When A is a ℚ-algebra the
  construction is the whole of Sm⊗_A. The qualifier was found while formalising.
- **Derived q-de Rham–Witt forms of smooth algebras.** The shift is on the graded piece of the animated stupid filtration,
  not on the form. The paper uses both conventions (E401).
- **Unit tests.** Six false or uncheckable tests in HQ.1–HQ.2 are rewritten, as are the false tests of HQ.3–HQ.4. The HQ.7
  structural checks get concrete witnesses.

**Cycles and layer inversions removed:**

- **Through HabiroRings HR.6.** HQ.3/the-coordinate-model and the HQ.5 export node cited HR.6, which requires HQ.3 and HQ.5.
  HR.6, HB.6 and HB.7 are removed as prerequisites, and their requests are dropped.
- **Inside the packet:**
  - Lemma 3.15 ↔ Proposition 3.19;
  - étale base change ↔ the ghost maps;
  - HQ.3 → HQ.5 and HQ.4 → HQ.3 citations of later results;
  - the denominator lemma, which cited the Lemma A.4 comparison that uses it.
- **Proposition 3.47** (q-Ω as the q-Hodge completion) is a statement about q-Hodge filtrations but sat in HQ.2 while
  citing HQ.3. It moves to `HQ.3/the-smooth-comparison-of-q-omega-with-the-q-hodge-completion`, keeping HQ.2 among the
  stages it realises.
- **Not a cycle:** HQ.3's nodes may cite HQ.4, since the atlas has the stage edge HQ.4 → HQ.3.

**Bundled nodes split** (52 nodes added in all). For example:

- the Nygaard node, which held eight results over eight pages;
- Theorem 3.11(a) and (b);
- Example 3.12 and Corollary 3.13;
- Lemma 3.30 and Corollary 3.31;
- Lemma A.4 with A.5–A.7.

**Missing results added:**

- the local derived q-de Rham complex, the global framed complex, the combined Hodge and (q−1)-adic filtration, and both
  rational comparisons;
- q-Witt Proposition 3.17, Theorem 4.27, Corollaries 4.37 and 4.38, and Theorem 5.1;
- the derived q-de Rham–Witt complex with its animated stupid filtration.

**Duplication.** The Corollary 6.15 node restated what RefinedTraceMethods RT.4 (Habiro comparison) plans; it is now a
citation.

**Coverage.**

- **HQ.1 is now partial:** étale descent is a gap.
- **HQ.3 is now partial:** the stage asks for base-change maps the source never proves.

**Suppliers.**

- **Reassigned requests.** Four requests had the wrong supplier or no owner. The request filed against DD.6, the
  logarithmic extension, belongs to DD.4, which owns Bhatt's Theorem 3.27. Three HQ.4 nodes citing DD.6 are re-pointed to
  DD.4.
- **New requests:** PR.2, PR.3, CR.0, CR.2, DD.0, DD.3, DD.4, Q3, E0, E5 and RT.4 (Habiro comparison).
- **Merged requests.** The needs that several reviewers filed against PR.0, PR.3, PR.6 and DD.3 are merged, one request
  per supplier.

## Baseline

- **Fixed (4):**
  - `cyclotomic_prime_pow_eq_geom_sum` does not identify [p^k]_q with a cyclotomic polynomial;
    `Polynomial.prod_cyclotomic_eq_geom_sum` is added for that.
  - `Ideal.Filtration` gives no filtrations in a stable ∞-category and is dropped as a prerequisite.
  - `CategoryTheory.FilteredObject` has all compatible morphisms; strictness is a separate condition.
  - `RingTheory.Sequence.IsRegular` is only a near miss for Koszul-regular sequences.
- **Added:** three Witt-vector Frobenius–Verschiebung identities, named by a new compatibility test.
- **Kept as register entries:** `CategoryTheory.Tor`, `Condensed` and five Witt-vector entries have no consumer. They were
  confirmed at the pin.

## Mistakes in the sources (E1–E3, E101–E109, E201–E211, E301–E305, E401)

The three original entries are confirmed. 26 findings are added. The coordinating reviewer checked E401 in the LaTeX and
re-derived the arguments of E102 and E301.

**Stated results:**

- **E303, paragraph 1.16.** The perfectness claim has no proof in the paper.
- **E305, paragraph 4.12(b) and Corollary 4.16.** The morphisms described are not closed under composition. Over ℤ, the
  counterexample is (ℤ[x], ℤ[x]) → (ℤ, ℤ) → ℤ.

**Gaps in proofs:**

- **E105, paragraph 3.14.** The argument needs α ≥ 1.
- **E106, A.14.** "By construction" needs a derived Nakayama argument.
- **E205, Lemma 3.3.** It defers to Example 4.24, which computes with a different ring.

**Misprints:** the others, among them:

- **E102, Convention 3.1:** base change to A instead of A[q]/(q^m − 1), wrong for m ≥ 2.
- **E104, paragraph 3.14:** the Frobenius twist is omitted.
- **E201 and E202:** two misprints in the d ∘ F relation.
- **E203, Corollaries 3.25 and 3.26:** they print α ≥ 0 for α ≥ 1.
- **E301, Lemma 4.2:** the adjoint direction.
- **E401:** the two conventions for q-W_m dR^n, which differ by Σ^{−n}.
  - The sentence after Example 3.12 reads Σ^{−n} q-W_m dR^n ≃ q-W_m Ω^n.
  - Corollary 3.31 reads q-W_m dR^n ≃ Σ^{−n} q-W_m Ω^n.
  - The paper's definition of q-W_m dR^n as a graded piece matches the second. R3 raised the finding, and the coordinating
    reviewer checked it in the LaTeX (lines 883, 923, 941 and 1410).

## The suggested Lean file

- **As submitted, it did not elaborate.** It had 23 errors, and it used `True` about 86 times in place of statements.
- **It is rewritten against the corrected packet:** 6,378 lines in namespace `TauCeti.HabiroCohomology`. HQ.4's section
  precedes HQ.3's, following the stage edge HQ.4 → HQ.3.
  - It elaborates at Mathlib `082e2d3` with `lake env lean`. The only messages are 425 `declaration uses 'sorry'`
    warnings.
  - Every API item and unit test of the packet occurs under its packet name, and no statement is `True`.
  - The concrete layer is stated against Mathlib: q-integers, the Jackson q-derivative, cyclotomic identities and Witt
    vectors.
  - The ∞-categorical objects (filtered derived categories, animation, décalage, prismatic and q-crystalline cohomology)
    enter as structures of data and laws supplied by their owners, each docstring naming the owner.
- **Where the prototype narrows a statement,** the file says so in a comment:
  - ∞-categorical statements are made through 1-categorical shadows;
  - E∞ and derived commutative structure appears on underlying objects only;
  - the higher coherence of the two (c_p) squares is omitted;
  - HQ.6's comparison problem is stated at the level of complexes only.
- **`HQ.7/the-executable-boundary`** said the upper layer "cannot be stated" in the file. It is corrected to describe the
  owner-parameter modelling.

## Questions for the orchestrator

1. **The roadmap document** must be regenerated from the corrected packet before promotion. This is the only reason for
   `needs_changes`. The HQ.5–HQ.7 sections especially must carry:
   - Theorem 4.22(b)'s new place and Remark 4.23's direction;
   - the adjunction of Lemma 4.2;
   - the domain of Corollary 4.16;
   - perfectness as an unproved claim;
   - the removed HR.6, HB.6 and HB.7 prerequisites.
2. **A cycle in the HabiroRings packet, outside this review.** `HabiroRings:HR.4/relative-q-witt-rings` lists the stage
   HQ.4 among its prerequisites, while HQ.4 requires HR.4. Every node-level cycle through HQ.3 and HQ.4 in the combined
   graph passes through this edge. The degree-zero q-Witt rings are built in q-Witt v5, Section 2, without the q-de
   Rham–Witt complex, so HR.4 should drop that prerequisite.
3. **Links to record:**
   - HabiroRings HR.6/the-degree-zero-identification restates Corollary 3.13, now `HQ.3/the-etale-case`, and should cite
     it.
   - HQ.3 uses HR.5 nodes, although the atlas lists only HR.2 among HQ.3's requirements. A supply edge HR.5 → HQ.3 should
     be recorded.
   - HQ.5's staticity lemma is used by RefinedTraceMethods RT.4 (q-Hodge), so an edge HQ.5 → RT.4:q-Hodge should be
     recorded.
4. **Naming.** HQ.5 and HQ.6 API names carry a `TauCeti.QHodge.` prefix that the other layers do not. The HQ.6 items
   `.unused` and `.consumers` are file bookkeeping rather than mathematics. Both are harmless, but could be normalised
   when the document is regenerated.
