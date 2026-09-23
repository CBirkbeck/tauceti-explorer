# REV-PAPER-CESNAVICIUS-19 — review of the extraction of Česnavičius, "Purity for the Brauer group"

Job: #1329. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-CESNAVICIUS-19.result.json`, by session cc-442dc5.

**Verdict: accept.** No item, status, route or locator target changed. Two corrections
were made, all four recorded mistakes are confirmed, and a fifth was found.

## What I read

Kęstutis Česnavičius, *Purity for the Brauer group*, Duke Math. J. **168** (2019), no. 8,
1461–1486; doi:10.1215/00127094-2018-0057.

- arXiv 1711.06456v4, SHA-256 `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709`,
  matching the recorded hash. All 17 pages.
- The author's copy, `https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf`,
  SHA-256 `4187331ead5a5246acba1c032a2574ffd6ac9ee6fe1a72bb09d46e2e9f9b97a1` — the same
  hash the separate errata record already carries.
- Gabber–Ramero, *Almost ring theory*, arXiv math/0201175, SHA-256 `c4ab39ad…8dc8`
  (pp. 119–120), and SGA 2 in the Laszlo annotated edition, SHA-256 `1c648d95…58da1`
  (XI 3.12, 3.13, 3.17, 3.18).

All fetched into scratch only. The published Duke text is paywalled and was not collated,
as the extraction says.

The author's copy is dated **27 November 2018** and so *predates* arXiv v4 (4 December
2018). Collated word by word against v4 after normalising ligatures and line wrapping, the
two differ only in the date line and in float and line-break placement — no mathematical
difference — and the author's page links no erratum. I recorded this under
`source.authorCopy`.

A note on method: this PDF's font makes `pdftotext` render `≥` as `ě`, `≤` as `ď` and
parentheses as `p…q`. Every quotation below was checked against the page image where the
reading turns on a single glyph.

## The two corrections

**1. Run-together numbering, 593 places.** Locators, statements and evidence fields were
written without a space before the number — `Theorem4.10`, `Lemma3.1`, `Definition5.4.1`,
`footnote3`, `Stacks0E9K`, `read2026-09-22`. These fields are consumer-facing, so I
repaired them. The substitution was restricted to an explicit keyword list
(`Theorem`, `Proposition`, `Lemma`, `Corollary`, `Remark`, `Definition`, `Notation`,
`Claim`, `Example`, `Section`, `Step`, `Appendix`, `Conjecture`, `Question`, `Corollaire`,
`Exemple`, `footnote`, `Footnote`, `Stacks`, `read`) followed immediately by a digit.
Bibliography keys (`GR03`, `KL15`, `Gro68b`, `Gir71`, `Sch17`, `CTS79`, `SGA2`), layer ids
(`SF.0`), section marks (`§4.9`) and single-letter math tokens were deliberately left
alone; I checked afterwards that the file grew by exactly 593 characters, so nothing else
moved.

**2. The author's copy** is now recorded in the source block with its URL, hash, date and
the collation result.

## The recorded mistakes

All four confirmed, and one added. None is corrected by a later version or an erratum:
arXiv stops at v4, the author's copy predates it, Crossref's DOI record carries no update
or relation entry (checked 23 September 2026), and the author's page links no erratum.

| id | kind | locator | verdict |
|----|------|---------|---------|
| E1 | gap | Proposition 2.2 and its proof, p. 4 | confirmed |
| E2 | misprint | Gabber–Ramero, proof of 5.4.13, p. 119 | confirmed, counterexample checked |
| E3 | misprint | Gabber–Ramero, proof of 5.4.13, p. 119 | confirmed on the page image |
| E4 | misprint | SGA 2 XI, Lemma 3.17(e) | confirmed on the page image |
| **E5** | misprint | Gabber–Ramero, proof of 5.4.13, p. 119 | **new in this review** |

### E1 — the nonabelian gap in Proposition 2.2

Printed on p. 4 exactly as the extraction quotes it, for "an affine, smooth `R`-group
scheme `G`" with no commutativity hypothesis. Writing `H = Res_{R′/R}(G_{R′})` and
`X = H/G`, the proof shows `H(V) → X(V)` is surjective. In the exact sequence of pointed
sets

    H(V) → X(V) → H¹(V, G) → H¹(V, H)

that says precisely that the fibre over the *neutral* class is trivial. For noncommutative
`G` these are pointed sets, and a trivial kernel is not injectivity: the fibre through the
class of a torsor `P` is the orbit set of `(^P H)(V)` acting on `(^P X)(V)`, and the
twisted forms are never treated.

The extraction's diagnosis of why the printed hypotheses do not reach them is right.
Hypothesis (1) gives `X(V) ≅ X(R)` because a map to an *affine* `R`-scheme factors through
`Spec Γ(V, O)`; but `^P X` is only a `V`-scheme, not the base change of an affine
`R`-scheme, so neither (1) nor the affineness of `X` controls its `V`-points. And by (2) a
torsor that extends to `R` is trivial, so exactly the torsors on `V` that do *not* extend
are left uncontrolled.

I checked independently that Proposition 2.2 is invoked in only two places in the paper —
the proof of Proposition 2.3, with `G = (Res_{R′/R}(T_{R′}))/T`, and Corollary 2.4, with
`G = T` an `R`-torus — and both are commutative. The main theorems are untouched.

Like the extraction, **I do not claim the statement false** for noncommutative `G`; only
that the printed proof does not establish it. "Affects a stated result" is the right
classification, since the Proposition is asserted in that generality.

### E2 — checked against a counterexample

Page 119 prints: "let `H ⊂ H_R(F, J)` be a finitely generated subideal such that
`t^h ∈ H`." But the hypothesis of Proposition 5.4.13 is (5.4.9), which reads
`t^h ∈ H_R(F,J) + p_a` — the condition *evaluated at the point* `a`.

The extraction's counterexample checks out. Take `R = Q[[t]]`, `I = R`, `a = 1`,
`J = (X²(X−1))`, `h = 0`, `n = 1`. Then `f(1) = 0` and `f′(1) = 1`, so
`1 ∈ H_R(F,J) + p_a`, and `J ⊂ p_a + tIF` and `n > 2h` hold too. But by Lemma 5.4.2(ii)
`Spec S ∖ V(H_R(F,J)·S)` is the smooth locus of `S` over `R`, and
`S = R[X]/(X²(X−1))` has a singular double point at `X = 0`. So `H_R(F,J)` is a proper
ideal and no subideal of it contains `t^h = 1`.

The proof itself confirms the repair: a few lines later it states the λ-level condition in
exactly the corrected form, "we can assume that `t^h ∈ H_λ + p_{λ,a}`", which I read on
the page image.

### E3 — a missing subscript, checked on the image

Page 119 prints "let `U_λ := Spec S_λ ∖ V(H_λ · S_λ)` and `S̄_λ := R̄_λ ⊗_{R_λ} S`", with a
bare `S`. Since the slip *is* a missing subscript — exactly what a text layer can drop on
its own — I confirmed it on the page image, where the surrounding `S_λ`, `H_λ · S_λ` and
`Spec S_λ` all show their subscripts plainly.

It must be `S_λ`: the next clause asks the section of `Spec S̄_λ` to restrict into the
preimage of `U_λ`, and `U_λ ⊂ Spec S_λ`; and Lemma 5.4.12, applied immediately after, is
set up for `S̄ := R̄ ⊗_R S` with `U ⊂ Spec S`. The second half of the finding is printed in
the same sentence: the point ideal is generated by "`X_1 − c_1, ..., X − c_n`", where the
last generator should be `X_N − c_N`.

### E4 — verified rather than inherited

The extraction carried this one over from an earlier pass and recorded that it had not
re-read the source. I did.

XI Lemma 3.17(e) is printed "pour tout `y` fermé de X, `y ∈ Y`, l'anneau `O_{X,y}` est
parafactoriel", and I confirmed **on the page image** that the glyph really is `∈`, not a
text-layer corruption of `∉`. It is a slip for `y ∉ Y`:

- The proof of 3.17 applies (e) through Théorème 3.12, whose hypothesis 3) is
  parafactoriality "pour tout voisinage ouvert `U` de `Y` dans `X` et tout `x ∈ X − U`" —
  points outside every open neighbourhood of `Y`, hence outside `Y`.
- The proof of 3.17 says just that: for every open `U ⊇ Y`, the complement `X ∖ U` is a
  finite set of closed points.
- Under the printed reading, (e) would constrain only points *of* `Y`, which hypothesis c)
  already covers, and would leave uncovered exactly the points the proof needs.
- Théorème 3.18(iii), which also conjugates 3.12 and 3.13, states the condition in the
  correct `x ∈ X − U` form.

"Affects nothing" is right: the application in 3.13(ii) verifies parafactoriality at every
closed point of `X`, so it survives either reading.

### E5 — new, found by this review

In the same sentence of the same proof (Gabber–Ramero 5.4.13, p. 119):

> and whose restriction to `Spec R_λ ∖ V(tI_λ)` factors through **`U`**

The proof defines only `U_λ := Spec S_λ ∖ V(H_λ · S_λ)`; a plain `U` is never introduced
in it, so the symbol is undefined as printed. Everything in the sentence is at level λ —
the section is `σ : Spec R_λ → Spec S_λ`, agreeing with `c` modulo `(tI_λ)^{n−h}` — and
the clause just before it says "the preimage of `U_λ`". The bare `U` is inherited from
Lemma 5.4.12, where `U` is the local name. Read on the page image, so not a dropped
subscript. Purely typographical; the argument is unaffected.

## Items, statuses and routes

**15 library items, all correctly cited.** Every cited declaration was read at the pinned
commits (Mathlib 082e2d3, Tau Ceti f790474) and says what the citing item claims — for
instance `Polynomial.exists_mul_sq_add_linear_part_eq_eval_add` really does give
`∃ c, c·y² + p′(x)·y + p(x) = p(x+y)`, as the item states, and
`TauCeti.ArtinRees.exists_controlled_lift` really does produce a `k₀` independent of `P`,
`φ` and `m`.

Four citations look unresolved against `declarations.tsv`, but **all four exist and the
index is at fault**, in two ways already known to this programme:

- `mathlib:IsAdicComplete.henselianRing` is `instance (priority := 100)` at
  `Mathlib/RingTheory/Henselian.lean:170`. Declarations in that form are not indexed at
  all.
- `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.{cartierDual, cartierDuality,
  cartierDualDualIso}` exist at `CartierDuality/FiniteLocallyFree.lean:275, 232, 320` but
  are indexed without their outer `TauCeti` namespace. **This review isolated the
  trigger:** at line 157 of that file a `namespace` keyword has its name on the *following*
  line, and every declaration after it in the file loses the enclosing namespace. Sibling
  file `BaseChange.lean` is unaffected and indexes `cartierDualBaseChangeIso` with its full
  name.

I left all four citations as they stand; they are right and the index is wrong.

**13 planned items**, all naming atlas layers that exist. One of them,
`strict-henselian`, points at a Tau Ceti roadmap layer and is correctly given no route,
since Tau Ceti roadmaps are never re-planned.

**150 missing items, each routed exactly once.** Ten planned items also appear in the route
for their own layer, which is consistent rather than double-routing. I searched both pinned
trees for the concepts most likely to be present already, and they are absent: no Weil
restriction (zero rows), no strict henselization, no parafactoriality, no purity, no
perfectoid predicate. Two near misses are real but do not supply the items, and the
extraction had already recorded the first: Mathlib's `BrauerGroup` is the field/CSA Brauer
group, not the cohomological Brauer group of a scheme; and Mathlib's `localCohomology` is
local cohomology of modules, not étale cohomology with supports. Mathlib's `PicardGroup` is
the Picard group of a commutative ring, and Tau Ceti's `Picard` files concern stable
reduction of curves — neither gives `Pic` of a punctured spectrum.

**17 routes, all accepted, all source additions.** There is no Part II and no new roadmap,
and having read the paper in full I agree none is needed: a 17-page paper drawing on
existing machinery belongs in the layers that already own that machinery. The per-route
reasons are unusually careful about *not* duplicating work — route 9 says in terms that
this is not another construction of upstream Huber adic spaces, route 12 refuses to
substitute A3's stronger affinoid descent, route 14 warns against applying Huber 3.2.9's
blanket Noetherian assumption at the perfectoid limit, route 16 forbids claiming the finite
stages perfectoid, and route 17 imports Cartier duality rather than rebuilding it. Route 3
is large (59 items into SF.2) and, to its credit, asks for the layer to be split into an
early site/Kummer prefix, a completion/perfectoid-dependent suffix and an Appendix A field
prefix rather than landing as one block. Per-route reasons are in
`PAPER-CESNAVICIUS-19.review.json`.

## One thing this review could not do

E1 also lives in `research/blueprint/errata/PAPER-CESNAVICIUS-19.json`, a separate
`errata-v1` record outside this job's deliverables. The extraction flagged the duplication
and said it could not edit that file; neither can I. The confirmed verdict is therefore
recorded in `result.json` only, and the two records still need coalescing by whoever owns
the collector.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CESNAVICIUS-19.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
