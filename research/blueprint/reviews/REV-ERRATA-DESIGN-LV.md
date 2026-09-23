# Independent review of the Lawrence–Venkatesh errata

Job: `REV-ERRATA-DESIGN-LV`, issue #1883. Reviewer: Codex, session
`codex-hjdg0j`, 23 September 2026. The reviewed findings E1–E20 were written
by Claude Code, session `cc-7b31c4`; this reviewer did not write them.

**Finished review:** 14 original findings confirmed, six rejected, eight
additional findings checked and added. All 28 entries have a verdict attributed
to this job. The revised companion explanation is
[MordellLawrenceVenkatesh.md](../errata/MordellLawrenceVenkatesh.md); the
machine-readable verdicts are in the adjacent JSON.

The principal change to provenance is that the published article was accessible
in a public journal PDF. It corrects the two figure references in E19, so that
entry is now recorded as already corrected in print. The remaining 21 confirmed
entries have no correction found in the searches described below. This report
does not claim that all proofs in the paper or the roadmap packet have been
certified, nor that a main theorem has been disproved.

## Source access and version comparison

Brian Lawrence and Akshay Venkatesh, *Diophantine problems and p-adic period
mappings*, Inventiones mathematicae **221** (2020), 893–999,
[DOI](https://doi.org/10.1007/s00222-020-00966-7).

All downloads below were made on **2026-09-23**, into scratch space outside
the repository. Page locators in the findings distinguish arXiv pagination
from the journal's printed pagination.

| Source | Public URL | SHA-256 |
|---|---|---|
| arXiv v3 PDF, 76 pages | [1807.02721v3](https://arxiv.org/pdf/1807.02721v3) | `e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b` |
| arXiv v3 source archive | [source](https://arxiv.org/src/1807.02721v3) | `6f6972471b088f6943fab432a2a3c0b4f477c20659797d243a56d01603480a1b` |
| Published PDF, 107 pages, journal pp. 893–999 | [BIMSA public copy](https://bimsa.net/doc/publication/2578.pdf) | `588e450aa571e2c81686940cda08c63e094c39176e0f956bd94d4306c8db43bd` |
| arXiv history page | [record](https://arxiv.org/abs/1807.02721) | `fbae2a84197ac18af265d78777e569cac2362973d67932964c3905898d7363e9` |
| Crossref DOI metadata | [record](https://api.crossref.org/works/10.1007/s00222-020-00966-7) | `d484c1f61c5ab2fc43956a1a02b769144f800933f3a5b5ba3f3760867a1bc73c` |
| Venkatesh publication page | [author page](https://www.math.ias.edu/~akshay/research.html) | `6d6bcc1349db011c140be9376ff94409d3c97c1771c63e1e87ececdac21a6dfc` |
| Brinon–Conrad, CMI notes on p-adic Hodge theory | [author-hosted notes](https://math.stanford.edu/~conrad/papers/notes.pdf) | `f27d508bc64b3c9e2e9de5041429b2cb6a909b2cd72ff8096c20493f27b5a187` |

The journal PDF's first page identifies the authors, title, DOI, volume and
pagination, and the interior pages have the matching journal headers and
publisher imprint. I compared the actual passages, including formulas and
footnotes; this was not a metadata-only comparison. Rendered pages checked
include journal pp. 902, 906, 908, 911, 917, 932, 938, 951, 956, 958 and 961.
The arXiv source file `padicTorelli-sept2019-arxiv.tex` helped distinguish
literal notation from extraction artifacts and locate the misplaced figure
labels. The companion file gives an arXiv/journal concordance for every entry.

The source audit covered all 20 original locators and their surrounding
arguments: §§1.6, 2.3–2.7, 3.1–3.4, the cohomological finiteness application in
§4, Proposition 5.3 and the proof of Theorem 5.4, §6, the cited parts of §7,
and §§8.2–8.6. Theorem 10.1's heading and conclusion were checked for E1.
This is an errata review, not a complete re-extraction of the 76-page paper.

Brinon–Conrad Theorem 2.2.3, p. 13, supplies the smooth-proper Hodge–Tate
comparison without a good-reduction assumption. Proposition 6.3.3 and its
discussion, pp. 77–79, give exactness, tensor compatibility and closure under
subquotients for de Rham representations; Proposition 9.1.9, p. 133, relates
crystalline and de Rham representations. These passages help delimit E7.
They do not establish that the paper itself carried out the enlarged proof.

## Existing-correction search

The arXiv history lists v1 on 7 July 2018, v2 on 30 August 2018 and v3 on
25 October 2019; no subsequent arXiv revision is listed. The Crossref DOI
record has an empty `relation` object and no `update-to` or `updated-by`
field. Searches of the title and DOI with “erratum” and “corrigendum” found
no separate formal correction. Venkatesh's publication page lists this article
without an erratum link; an erratum elsewhere on that page belongs to another
paper. These observations do not establish exhaustive absence of corrections.

Lawrence's current Wisconsin URL returned HTTP 403, and the alternate tilde
URL returned 404. Neither was treated as a successfully checked author page.
Direct requests to Springer's article and PDF URLs returned a 3038-byte Client
Challenge HTML page. The article preview was visible through the browser,
including footnote 6, but the successful full-text journal comparison uses
the public BIMSA copy above. No challenge response was mistaken for a PDF.

The journal itself is decisive for E19: the references on pp. 958 and 961
are to Figures 4 and 5. A correction need not be a separately titled erratum
to count as already in print. The old blanket claim that every finding was
new has therefore been removed.

## Verdicts on the original findings

| Entry | Verdict | Independent reason and changes |
|---|---|---|
| E1 | Confirmed | Proposition/Theorem slip; corrected §1.5 to §1.6. |
| E2 | Confirmed | Étale p-adic cohomology can ramify at p despite good reduction. Enlarge the finite ramification set and its Frobenius exclusions. |
| E3 | Confirmed | The inverse cyclotomic character over Q contradicts the formula on a uniformizer. The units-only formula suffices for the weight conclusion. |
| E4 | Rejected | Goursat, simplicity and innerness give the asserted routine argument, including the disconnected-group case. E22 is a separate actual typo. |
| E5 | Confirmed | V_v has coefficient field K_v, as the preceding diagram specifies. |
| E6 | Rejected | A smaller common radius suffices; a lower bound on the smaller image gives the same lower bound on the full image. |
| E7 | Confirmed, narrowed | The quoted convergence estimate does not cover the full residue disk at p=2. This is a written-proof scope issue, not a counterexample to Proposition 5.3. Good reduction at v already follows from v∉S. |
| E8 | Confirmed | Multiplicative order at least 8 excludes exponents 1 through 7, not 8. The corrected bound is precisely what size_v needs. |
| E9 | Rejected | The argument fixes an arbitrary member of a finite indexing set and works for each; taking the finite union is routine. |
| E10 | Confirmed | W=0,V make the literal bad locus everything. Add nonzero/proper and a nonempty open. The printed lemma permits the empty open, so is vacuous as written. |
| E11 | Confirmed | The puncture is π(y′) on Y. |
| E12 | Confirmed, narrowed | The relevant π₂ is the base's. The base is also aspherical, and only middle exactness is used next. |
| E13 | Confirmed | A disk-bounding simple curve is an explicit counterexample. State nonseparating; do not misdescribe all later distinguishing curves as liftable. |
| E14 | Confirmed, strengthened correction | Add nonseparating, avoid the puncture, and take a positive sufficiently divisible twist power. The literal condition also permits M=0. |
| E15 | Confirmed | Retain the branch point in the mapping class group notation. |
| E16 | Rejected | The fixed-part/Torelli/de Franchis footnote gives an adequate proof. Its being algebro-geometric is not a defect. |
| E17 | Confirmed, narrowed | The local reference to part (a) has no antecedent. The original broader assertion about every neighboring statement is false. |
| E18 | Rejected | The diagram is illustrative; the extra-handle Dehn-twist construction produces every required exponent. |
| E19 | Confirmed, already corrected | arXiv's bad numbers have become Figures 4 and 5 in the journal. |
| E20 | Rejected | Powers of the usual Dehn twist preserve simplicity and give the required basis words, with fixed endpoint germs. |

The detailed mathematical arguments, including the normalizer/central-sign
step in E4, the finite-union indexing in E9, the finite-cover step in E16 and
the topological construction in E18, are written in the companion file and
in the individual JSON verdicts. No claim that an unchecked packet node is a
proved theorem is used to validate a finding.

## Additional checked findings

| Entry | Classification and reach | Check |
|---|---|---|
| E21 | Misprint; nothing | The standing set cannot consist of finite places and contain every archimedean place. |
| E22 | Misprint; proof | Taking i=j makes the second hypothesis of Lemma 2.12 impossible; add i≠j. |
| E23 | Misprint; nothing | Lemma 3.2 pairs each closure with the wrong base-change field. |
| E24 | Error; proof | A single liftable Dehn twist changes the cover's abelian multiplier. The (q−1)-st power is the twist which lifts and supplies the transvection. |
| E25 | Gap; proof | An arbitrary semilinear bijection need not preserve the form up to scalar. The application of the common-form general-position lemma needs that compatibility. |
| E26 | Misprint; nothing | The period subspace has abelian dimension d, not base-curve genus g. |
| E27 | Misprint; nothing | The refined statement of Lemma 2.6 still has domain G_K, not G_Q for its parabolic Q. |
| E28 | Error; proof | For trivial L inside G=SL₂, the printed double quotient is Q_p^×, hence infinite. It does not parametrize conjugated representations. |

All eight were checked in both versions. E25 does not purport to disprove the
most general possible version of the general-position conclusion. E28 does
not purport to disprove Lemma 2.6; it disproves the displayed intermediate
finiteness assertion. A proof using the corrected quotient must still check
the cited orbit finiteness, components and descent. Richardson's theorem was
not independently verified for that entire replacement, and no such claim is
made here.

## Independent mathematical checks

The checks below are reproducible directly from the formulas; scratch code
used exact SymPy 1.14 arithmetic, not floating-point approximations.

1. **Orbit endpoint (E8).** Modulo 41, 3 has order 8. Over Z/82, put
   `T=diag(I₃,55I₃)` with the standard alternating form. Since 55 is the
   inverse of 3 modulo 82 and `55⁸=1`, `ker(T⁸−1)` is the whole module.
   Twice the pairing of a standard dual pair is 2, not zero. Thus the
   inference for i=8 is unavailable from the stated order hypothesis.
2. **Different transported forms (E25).** Set
   `J=[[0,I₂],[-I₂,0]]`, `A=diag(2,1,1,1)` and let F have columns
   `(1,1,0,0)` and `(0,0,1,-1)`. Then `FᵀJF=0`, but
   `(A⁻¹F)ᵀJ(A⁻¹F)=[[0,-1/2],[1/2,0]]`.
3. **Distinguishing affine words (E18).** With `a_i(x)=c_i x` and
   `b(x)=x+1`, `a_i b a_i⁻¹ b^m` translates by `c_i+m`.
   Taking `m=q−c₁` gives the identity for i=1 and a nonzero translation
   for i=2. Exhaustive exact checks covered 2666 ordered distinct pairs of
   primitive generators for primes 3≤q<60. Topological existence comes from
   the twist construction, not from this enumeration.
4. **Nonzero twist powers (E24).** For the primitive projection u of the
   degree-one lift, the other lift projects to −u. The lifted product has
   nilpotent part `q u(uᵀJ)`, of rank one, with square zero. Taking any
   further nonzero integral power preserves that rank and its one-parameter
   Zariski closure.
5. **Transporter counterexample (E28).** For the trivial representation,
   `L={1}` and the transporter is GL₂(Q_p). Left SL₂-cosets are distinguished
   by determinant, while right L has no effect. The determinant gives an
   explicit infinite quotient. The actual conjugated representation is
   unchanged by every matrix, as the centralizer formulation predicts.

The ancillary point-pushing matrix `qI−J_all-ones` was also checked to kill
the diagonal and have rank q−1 for q=3,5,7,11,13; the rejection of E16 rests
on the printed footnote argument and does not depend on this alternate route.

## Validation and scope

- `python3 scripts/check_errata.py research/blueprint/errata/MordellLawrenceVenkatesh.json`
- `python3 research/blueprint/intake.py check-files` on the three named
  deliverables and this job's handoff.
- `git diff --check`.
- Exact diagnostic calculations described above: passed.

No Lean file is among this job's deliverables, and no Lean compilation was
performed. No formalization or global proof closure is claimed. The review
changes only the errata pair, this report and its own handoff. The packet,
roadmap, earlier handoffs and generated source-issue register are left for
their respective owners and the intake process.
