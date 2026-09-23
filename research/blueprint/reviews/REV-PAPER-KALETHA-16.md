# REV-PAPER-KALETHA-16

Independent review of the extraction of Tasho Kaletha, *Rigid inner forms of real and p-adic groups*,
Annals of Mathematics **184** (2016), no. 2, 559–632 (doi 10.4007/annals.2016.184.2.6;
arXiv 1304.3292v5).

Issue [#1191](https://github.com/CBirkbeck/tauceti-explorer/issues/1191). Reviewer: Claude Code,
session cc-d67081, 23 September 2026.

**Verdict: accept.** All seven routes accepted. Fourteen findings confirmed, **one rejected**.

## The sources

This review fetched and hashed both documents the extraction relies on, neither of which it had
hashed:

- the published Annals PDF —
  `annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p06-p.pdf`, SHA-256 `55fc2ed2…7c2b`,
  74 pages, **printed page = PDF page + 558** (pp. 559–632);
- the author's errata — `math.uni-bonn.de/people/kaletha/errata.pdf`, SHA-256 `31e5f2d4…c31b5`,
  15 pages, §3 on pp. 6–7, read in full.

## Mistakes

**Fourteen of fifteen confirmed; E15 rejected.**

### The six that cite the author's errata are all genuine

The errata's §3 carries headings **"Proposition 3.6"**, **"Section 4.4"**, **"Formula (4.8)"**,
**"Proof of Lemma 4.7"**, **"Corollary 5.4"** and **"Section 5.6"** — matching E01–E06 one for one,
and each correction says what the finding records. Their `known` fields are therefore right, and the
register will list them among mistakes **already corrected in print**.

Two interlock with a new finding. The errata's Corollary 5.4 entry replaces `H¹` by `H¹_ab` "in
order for the claim to be true that the left kernel of the pairing is trivial", and remarks that this
"makes no difference in the p-adic case, but it does make a difference when F = ℝ."

### E07 — the new finding that reaches a stated result

§3.4 defines the equivalence relation by dividing by the image of `Z¹(Γ, G₁_sc)` — the simply
connected cover of the **twist** — and then states that the resulting surjection `H¹ → H¹_ab` "is an
isomorphism whenever `H¹(Γ, G_sc) = 1`".

That criterion does not suffice. Over `F = ℝ` with `G = SL₂` it holds — `H¹(ℝ, SL₂) = 1` — while the
relevant twist is the compact form, and by Serre (*Galois Cohomology* III.4.5) `H¹(ℝ, K)` for compact
connected `K` is the set of conjugacy classes of elements of order dividing 2, so
**|H¹(ℝ, SU(2))| = 2**, the classes of `±I`. I checked that independently. The two cases the paper
names are unaffected: Kneser's theorem gives the vanishing for every simply connected group over a
p-adic field, and every twist of a torus has trivial `G_sc`. So nothing in §4 or the applications
moves — which is what the recorded correction says, and which is precisely the real-case sensitivity
the author's own errata notes for Corollary 5.4.

### E15 — rejected

The finding asks for the printed `Z(Ĝ_sc)` in §5.7 to be replaced by the physical `Z(G_sc)`. **The
printed sentence is correct**, and the finding has read two carriers as one. It says that a class in
`H¹(u_v → W_v, Z(G_sc) → G_sc)` — whose coefficient group is the physical centre, exactly as the
finding wants — corresponds **via Corollary 5.4** to a character of `Z(Ĝ_sc)`. Corollary 5.4
(printed p. 598) pairs `H¹(u → W, Z → G)` with `π₀(Z(Ĝ̄)⁺)`, and the remark immediately after it
computes that group in this very case:

> if G is split, this implies `π₀(Z(Ĝ̄)⁺) = Z([Ĝ]_sc)`.

A character of `Z(Ĝ_sc)` is therefore precisely what the pairing produces, and it is the standard
object indexing refined data. The proposed replacement would make the sentence false, so the finding
should not enter the register.

## Corrected in place

**Every `printed` field was replaced by a verbatim quotation of the published text.** As recorded,
all fifteen were bare symbols — `a`, `p`, `ζ_k`, `σ(g)`, `H¹_sc`, `unit circle` — and
`scripts/errata.py` prints that field into the public register as "The source says `…`", where a
single letter identifies nothing. What the extraction had is preserved in `printedAsRecorded`. The
source block also gained the published PDF's URL, hash and page map, and the errata's hash.

## Items, statuses, routes

**157 items: 21 library, 24 planned, 112 missing.** Every missing item is routed exactly once and all
dependencies resolve. All ten stage ids cited by the seven routes, and all twenty planned targets,
exist in the atlas index.

Six source routes place the imported machinery with its owners — `RG2.0a`/`RG2.5` for Weil
restriction and integral dual data, `R02.1`/`R02.2`/`D7` for the cohomological engine, `ET.0` and
`ET.1` for stable conjugacy, endoscopic data and transfer factors, `AF.1` and `SR.0`/`SR.2`/`SR.3`
for the representation theory. The **Part II** carries the bulk (97 items): the pro-finite `u`, the
cohomology `H¹(u → W, Z → G)` with its duality, rigid inner twists, and the refined correspondence
for real tempered packets. Its title is an exact prefix extension and its id is free; it is one of
**five distinct Part IIs of this parent** across the corpus, each with a descriptive id, so the
naming follows the established pattern rather than departing from it.

## Checks

- `python3 scripts/check_paper.py …` — **ok**
- `python3 research/blueprint/intake.py check-files …` — **4 files, 0 problems**
- **No Lean was written or compiled.**
