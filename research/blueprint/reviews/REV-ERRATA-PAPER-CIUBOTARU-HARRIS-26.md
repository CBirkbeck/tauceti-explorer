# Independent review: Ciubotaru–Harris, Ramanujan and Arthur conjectures

Issue #1767; job REV-ERRATA-PAPER-CIUBOTARU-HARRIS-26. Codex, session `codex-hjdg0j`, 23 September 2026. Complete. Original errata: Claude Code, session `cc-fb70e5`. Independently confirmed the three inherited slips and added two findings, E4–E5. All verdicts concern the accessible preprint; the later journal wording remains unverified.

## Primary sources and access boundary

| Fresh download, 23 September 2026 | SHA-256 | Passages examined |
| --- | --- | --- |
| [Ciubotaru–Harris arXiv v1](https://arxiv.org/pdf/2311.15300v1), 39 pages | `7261083b46cc8ec3fad81215250ff6bef47da05ef6054813572de21db10dc103` | pp.5–7, §6.8–6.10 pp.22–23, pp.28–37; page images pp.22,29,31,34,35,37 |
| [Ciubotaru F₄ classification manuscript](https://www.math.utah.edu/~ptrapa/math-library/ciubotaru/ciubotaru_F4.pdf), 49 pages | `ca54d347930151085d38eb02875f0853841fdecbbf7f493a735a7f034d0475e1` | §2.6 coordinates p.10; B₃ complementary series row p.14 and §5 pp.37–38; p.14 page image |

The latter is a public manuscript of reference [Ci1], not a claim to have collated its published pagination. Its coordinate system and B₃ row were read directly.

The [Annals page](https://annals.math.princeton.edu/2026/204-2/p03) gives a revised date of 8 October 2025 and online publication on 13 September 2026. The conventional journal PDF URL returned 404, while Project Euclid returned an HTML challenge. No journal PDF or 2025 manuscript was obtained. [ArXiv history](https://arxiv.org/abs/2311.15300) still lists only v1; the earlier paper it replaces, arXiv 2204.06053, was not collated. [Harris's publication page](https://www.math.columbia.edu/~harris/website/publications) links arXiv. [Ciubotaru's Oxford profile](https://www.maths.ox.ac.uk/people/dan.ciubotaru) and the [Oxford repository record](https://ora.ox.ac.uk/objects/uuid:8b5759d0-92d7-4756-8f36-4e423abe34a3) provide bibliographic entries; no downloadable revision appeared in the latter. No relevant correction link was found. [Crossref](https://api.crossref.org/works/10.4007/annals.2026.204.2.3) has empty relation and no update-to entry. Exact-title erratum/correction searches found none. “New” is bounded by this search and does not imply survival in the inaccessible revision.

## E1–E3: inherited findings

**E1, confirmed misprint.** Theorem 1.11 and its preceding paragraph refer to Conjecture 9.3, but p.31 labels 9.3 as a display. The intended conjecture is 9.5, whose first part gives that decomposition and whose second part gives Satake compatibility. Read §9 and the surrounding proof to distinguish the numbered conjecture from an equation reference. Replace 9.3 by 9.5 in both places.

**E2, confirmed misprint.** In the proof of Theorem 8.5 the remaining j must be even. The statement has the correct parity. In the decomposition of a symplectic representation as sums of irreducible SL₂ modules tensored with multiplicity spaces, odd-dimensional irreducibles have symmetric forms and hence symplectic multiplicity spaces; even-dimensional ones have alternating forms and orthogonal multiplicity spaces. The proof already eliminates the odd factors. The explicit (2,2,2) orbit in Sp₆ in Remark 8.6 independently exhibits the intended even index.

**E3, confirmed index slips, with a qualification.** Definitions (10.4)–(10.6) distinguish global row sums n_v and specialized column sums n_u. The three rightmost v labels on p.34 must be u. Two printed chains otherwise equate one value to distinct integers. However, this index repair alone does not make the F₄ entry consistent with Theorem 8.5: a separate wrong parameter was discovered and recorded as E5.

## Exact root diagnostics

Generated the roots by closure under simple reflections, using the explicit coroot vectors in §§6.8–6.10 (these are the roots of G∨). Obtained 48,126,240 roots for F₄,E₇,E₈. For each vector h=2ℜ(s), counted evaluations of all roots on h and added rank to the zero-weight multiplicity. The enumeration uses rational arithmetic throughout.

| Case | Weight i | n_u(i) | n_v(i) |
| --- | --- | --- | --- |
| F₄, B₃, with E5 repaired | 10,9,8 | 1,0,1 | 1,0,2 |
| E₇, D₅(a₁)+A₁ | 10,9 | 1,0 | 1,1 |
| E₈, D₆ | 18,17,16 | 1,0,1 | 1,0,2 |

All larger positive weights vanish. The central h representatives used were (3,−3,3,1), (0,2,2,4,−4,−2,−3,3), and (0,2,4,6,8,10,0,0), respectively. Their construction is explicit: principal B₃ on simple nodes 1,2,3 for F₄; principal D₆ on nodes 2,3,4,5,6,7 for E₈; and the D₅ subregular partition (7,3) on nodes 1,2,3,4,5 plus principal A₁ on node 7 for E₇. In the last construction the simple-node labels on (1,2,3,4,5,7) are (2,2,2,0,2,2); h is taken in that Levi span. The root computation checks these explicit inputs; it does not re-prove the Bala–Carter classification.

For F₄ the corrected dominant 2ℜ(s) is (5,2,1,0). For E₇ and E₈ the printed parameters give (0,1,1,1,2,3,−5,5) and (0,0,1,1,2,2,4,14). These data make the calculation reproducible without an external root database.

## E4: resolve the graded-versus-filtered convention

Definition 2.2 explicitly makes Fil_i increasing. The principal F₄ table starts 4,0,4, so those entries cannot be filtration dimensions. The appendix's half-spin maximum also cannot literally involve nonzero Fil_i: such an increasing filtration remains nonzero indefinitely. Both should use gr_i, or h-eigenspaces.

Independently generated the 12 G₂ roots as well and computed principal h by setting every simple-root value to 2. The resulting full nonnegative weight lists agree entry by entry with the principal F₄, E₈ and G₂ rows, including the interleaved zeros. Reflection symmetry supplies the negative weights; the sums are 52,248,14. Thus the interpretation is established from the paper's own explicit filtration definition and numerical checks, resolving the reading question left open in the extraction. Cumulative sums recover actual Fil_i; for example principal F₄ has dim Fil₀=28. Equality of all cumulative dimensions and equality of all graded dimensions are equivalent, so Lemma 10.9 needs no change in substance. **Confirmed, misprint / affects nothing**. Not every nonprincipal row was recomputed.

## E5: a false F₄ coordinate, not just an index slip

Theorem 8.5's B₃ entry becomes (4,3/2,1,1/2) in the printed fundamental weights. It has squared norm 39/2. Reference [Ci1] uses the same coordinates and gives s(ν)=(3/2+ν,−3/2+ν,3/2,1/2), 0≤ν<1, with squared norm 7+2ν²<9. This rules out the printed point, since Weyl conjugation preserves the norm.

Half-integrality forces ν∈½Z (pair with the root ε₁+ε₃); the nonzero permitted value is ν=1/2. The point (2,−1,3/2,1/2) first becomes (2,3/2,1,1/2) by a signed permutation and then (5/2,1,1/2,0) by reflection in (1,−1,−1,−1). Its fundamental-weight expression is ω₁+½ω₃+½ω₄. Thus delete the extra ω₂ in the theorem's row.

The initial root calculation found maximum weight 16 at the printed point (already visible from 2ε₁), while the proof claims maximum 10. Repeating with the corrected coordinate gives exactly the F₄ row above. This verifies the correction from both the external primary classification and the downstream computation. **Confirmed, error / affects a stated result**, namely this coordinate classification; the intended later proof uses the corrected numbers. No failure of the intended global theorem is asserted.

## Validation and limits

Errata schema, four-file intake and whitespace checks pass. The rational root diagnostics verify the intended three comparisons, all entries of the three principal rows, and the F₄ norm/reflection correction. No Lean deliverable is required and no Lean compilation was run. PDFs, source text, images and scripts remain in worker scratch space. This is a review of findings and immediate dependencies, not a full independent proof of the global theorem or a complete exceptional-table audit. The JSON and accompanying report preserve the publication-access boundary.
