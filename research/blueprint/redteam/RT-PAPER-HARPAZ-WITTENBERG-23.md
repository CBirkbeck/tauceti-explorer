# RT-PAPER-HARPAZ-WITTENBERG-23

Red team against the accepted extraction `PAPER-HARPAZ-WITTENBERG-23`, of

> Yonatan Harpaz and Olivier Wittenberg, *The Massey vanishing conjecture for number
> fields*, Duke Mathematical Journal 172 (2023), no. 1, 1–41.

The extraction records 158 items — 10 library, 15 planned, 133 missing — routed to
existing roadmaps and to two proposed Part II roadmaps, and no mistakes in the source.
One finding, of medium severity: a duplication. Everything else held.

## The source

Re-fetched from `https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf` on
24 September 2026, SHA-256
`d95100ebd7210600873351ffbe1f3f1dc0fd3f36b815ca70286884801afc546f`, 33 pages. That is
the hash the extraction's source block records, and the file is not stamped, so the
hash reproduces rather than merely agreeing by luck.

## Finding

**RT-PAPER-HARPAZ-WITTENBERG-23/1 — duplicate, medium.** The Picard group of a
finite-stabilizer homogeneous space is planned twice, in one roadmap.

`PAPER-HARPAZ-WITTENBERG-23/39` (a construction, section 3 p. 8) asks for

> In characteristic zero, for semisimple simply connected G and homogeneous V with
> finite geometric stabilizer H, Pic(V\_k̄) ≅ Hom(H^ab, k̄ˣ) ≅ Hom(H^ab, μ\_∞),
> equivariantly for Γ\_k.

`PAPER-HARPAZ-WITTENBERG-20/81` (a theorem, section 5 p. 18) asks for

> In the setup of §5, Pic(V\_k̄) is canonically Hom(H^ab, k̄ˣ), equivariantly for Γ\_k.
> Use Kummer, constant units and the geometric fundamental group; the character action
> includes the action on roots of unity.

These are one statement: H is finite, so Hom(H^ab, k̄ˣ) = Hom(H^ab, μ\_∞). Both items
have status `missing`, and both are routed into `HeightsRationalPointsPartIIHomogeneousMassey`,
with the same parent `HeightsRationalPointsAndObstructions` and the same route kind
`part-ii`. Neither record's `coalescence` block is populated, so nothing in the data
says the two are the same statement.

That the second copy is unintended is written in the other record. The reason on
`PAPER-HARPAZ-WITTENBERG-20`'s route to this roadmap ends:

> This paper supplies the general homogeneous-space foundation required by that
> candidate; do not create another copy of the supersolvable theorem or
> finite-stabilizer Picard/Brauer interfaces.

The discipline was applied to the supersolvable theorem — the corresponding item in
`PAPER-HARPAZ-WITTENBERG-20` carries the note "This is the same HW20 input already
requested by PAPER-HARPAZ-WITTENBERG-23; the shared candidate owner below receives the
proof once" — and was not applied to the Picard interface named in the same sentence.
That asymmetry is why this reads as an oversight rather than a decision.

The fix is to consolidate onto `PAPER-HARPAZ-WITTENBERG-20/81` and drop item 39 from
this record's route, recording the identification as a coalescence entry. HW20 is the
right owner on the grounds its own route reason gives: it proves the statement, in its
section 5, and its route declares itself the complete homogeneous-space foundation for
the shared roadmap, while this paper consumes the result. Nothing is orphaned — the
items that depend on the identification stay in the same roadmap — and if the μ\_∞ form
or the construction framing is wanted, it belongs in the surviving item's statement and
API note. The full fix, including the variant with the roles reversed, is in the result
file.

## What held

Reported so that a clean surface counts as evidence.

**The declarations.** All 21 `tauceti:` declarations the items cite exist at the pinned
commits (Tau Ceti `f790474`, Mathlib `082e2d3`). Two were read in full rather than
looked up: `explicitCup11`, whose cochain formula is `(a ⌣ b)(g,h) = μ(a g)(g • b h)`,
as item 10 states; and `commutator_superdiagonalSubgroup_le : ⁅U^r, U^s⁆ ≤ U^(r+s)`,
which agrees with item 12 once the paper's `U₀ = U` indexing is matched to the pin's,
which starts at 1. All 8 roadmap stages the planned items cite exist as stage ids in
the atlas extracts.

**The items against the paper.** Sampled across the record and checked at their
locators: item 96 against Theorem 1.3, which it states in full rather than by reference
to Conjecture 1.1; item 26 against the construction of the splitting variety in
section 2 (N = |U| + 1, V = (SL\_N × T\_α)/U at (2.2), geometric stabilizer U₁); item 33
against the definition of the geometric stabilizer and its outer Galois action; items
14, 15, 16 against the unitriangular group of section 1. Item 15's sharper equalities,
[U,U] = U¹ and [U¹,U¹] = U³ in the paper's indexing, are correct and properly flagged
as going beyond the library's `⁅U^r,U^s⁆ ≤ U^(r+s)`.

**Coverage.** 42 of the paper's 45 numbered statements are carried by an item. The
three that are not are Conjecture 1.1, whose content item 96 states outright; Remark
1.2, which is expository; and Remark 2.7, whose base-point independence item 33 carries
as an API contract and as a test, with Remark 2.7's transport formula
`(g,σ) ↦ (r g σ(r)⁻¹, σ)` written out. None is an omission.

**Structure.** Both Part II titles are exact prefix extensions of their parents' atlas
titles, as section 15 requires, and both roadmap ids are free. All 133 missing items are
routed, each exactly once; no route repeats an id; the graph is acyclic. All 48 missing
definitions and constructions carry both an API list and a Tests list, as section 16
requires.

**No mistakes in the source.** Consistent with the extraction's empty `sourceIssues`:
the paper's internal cross-references and its prose are clean, and the three apparent
numbering mismatches are citations of other papers, not internal references.

**No library duplication.** None of the 133 missing items is already in the libraries.
The near cases were checked one by one: item 14 already directs reuse of
`TauCeti.transvectionUnit`, and what it adds beyond Mathlib's `Matrix.transvection` and
`Matrix.SpecialLinearGroup.transvection` — the unique ordered product expansion and the
commutator formulas by index case — is genuinely absent from both libraries. Bogomolov
multipliers and the unramified Brauer group appear nowhere in the index.

**No other cross-paper duplication.** Every item here was compared against the items of
every other `PAPER-*.result.json`, by name and by statement; then, for the one roadmap
this record shares with another, all 44 items it routes there were compared against all
54 that `PAPER-HARPAZ-WITTENBERG-20` routes there. Exactly one pair collides — the
finding above. The rest of the shared roadmap is disjoint, including the supersolvable
theorem, which the two records coordinate correctly.

## What I did not do

Nothing here is formalised, and no Lean was compiled: this is an attack on a paper
extraction, not on a blueprint packet. The declarations were read at the pin; the
mathematics of the paper's proofs was checked only where an item's statement or a
coverage question turned on it.
