# Handoff — BP-GeometricSatakeAndFusion--GS0 (issue #741)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-gs0`.

## Deliverables

- `research/blueprint/packets/GeometricSatakeAndFusion--GS0.json` — 16 nodes
  (3 constructions, 1 definition, 10 theorems, 1 lemma, 1 comparison), 26 API
  items, 16 unit tests, 14 planets, 25 baseline declarations, 10 gaps, 15
  requests, 2 structural proposals. `"part": "GS0"`, `"status": "partial"`.
- `research/blueprint/readmes/GeometricSatakeAndFusion--GS0.md` — 1172 lines.
- `research/blueprint/suggested/GeometricSatakeAndFusion--GS0.lean` — 498 lines.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS0.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place, so
  every baseline reference was resolved against it and not merely checked for
  form.
- `python3 -m unittest discover -s tests` → 268 tests, OK.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.

**The Lean file was not compiled.** No Lean was run for this job; the Mathlib
build on this machine is a shared cache that must not be rebuilt. Nothing is
claimed to be formalised and every `implementationStatus` is `unchecked`.

## Scope

This is the first of the roadmap's two parts. In scope: `GS0` and its three
substages, `GS1`, and `GS2` with its two substages — eight stages, and the 16 of
the decomposition's 23 nodes whose `parentStageId` lies in them. `GS3:fusion` and
the four `GS4` substages belong to `BP-GeometricSatakeAndFusion--GS3` (issue
#742) and nothing is planned for them here. This roadmap is not a member of any
restructured family, so no RS proposal applies.

## Source verification

All four sources were downloaded again in this session and **all four SHA-256
hashes reproduce the recorded values byte for byte**:

| source | URL | SHA-256 |
| --- | --- | --- |
| `FS-geometrization` | people.mpim-bonn.mpg.de/scholze/Geometrization.pdf | `9ab9efbd0df251bf…` |
| `SW20-berkeley` | www.math.uni-bonn.de/people/scholze/Berkeley.pdf | `225505171ef809aa…` |
| `BS17-witt-grassmannian` | arxiv.org/abs/1507.06490 | `b4d5a4e0a6591971…` |
| `Keel99-basepoint` | arxiv.org/abs/math/9901149 | `2ec4141aea36ad77…` |

Every locator therefore rests on the same files the independent review of the
decomposition checked. No locator was re-verified beyond the hashes.

## The library search, which cut both ways

`data/library-coverage.json` has no reviewed audit entry for this roadmap, so the
pinned declaration index was searched directly at Mathlib `082e2d3` and Tau Ceti
`f790474`.

**Present, and therefore cited rather than planned.** The most useful find is
`mathlib:CategoryTheory.Triangulated.TStructure`, with `IsLE`, `IsGE` and a
`Heart`: the abstract notion of a t-structure is pinned, so GS1 plans only the
relative perverse *normalisation* — the shift by `Σ_{i=1}^r ⟨2ρ,μ_i⟩` over the
distinct untilts. Also `mathlib:PerfectRing` and `mathlib:Perfection` for the
perfect `F_p`-algebras Bhatt–Scholze work with;
`mathlib:AlgebraicGeometry.IsProper` and `mathlib:ValuationRing` for properness
and the fibral criterion's reduction; `mathlib:CoxeterSystem` and
`tauceti:TauCeti.TitsSystem.bruhatCell` for the Bruhat and dominance
combinatorics; `mathlib:RootPairing` for `ρ`, `P_μ^-` and the weight
decomposition of `Lie G`; `mathlib:CategoryTheory.LeftRigidCategory` for the
dualizability conclusion; and `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`
for the line bundles.

**Absent, at both pins.** There is no ampleness, nefness or semiampleness in the
algebro-geometric sense anywhere: the only declaration whose name contains
`Ample` is `AmpleSet` in `Mathlib/Analysis/Convex/AmpleSet.lean`, the
convex-analysis notion. No `IsNef`, no semiample, no basepoint-freeness, no `Proj`
of a graded ring. And a search of the atlas's roadmap owners found none for
projective or birational geometry. So the whole Keel argument on which the
projectivity of the Witt vector affine Grassmannian rests has neither a library
citation nor a supplier stage. The packet plans it here, by default, and the
second structural proposal asks whether that is right. Also absent, as expected:
loop groups, affine Grassmannians, perfectoid spaces and diamonds.

## What remains

No layer is closed. The decomposition's seven gaps are carried forward unchanged,
each with a *next source action* naming exact printed pages, and three were
added. In rough order of how much they block:

1. **FS IV.6 and IV.7 are unread.** IV.6 (hyperbolic localization, Braden's
   theorem, Definition IV.6.11 of `G_m`-monodromic, Proposition IV.6.13) is
   imported at Corollary VI.3.5 and in the proofs of VI.6.4 and VI.7.5 — that is,
   inside three nodes written here. IV.7 (Drinfeld's lemma) is what turns local
   systems on `(Div¹_X)^I` into `W_E^I`-representations. Requested from
   `VStackSheavesAndLisseCategories:VS1`. This gap is shared with that roadmap's
   packet and with `HeckeStacksAndLocalShtukas`.
2. **Bhatt–Scholze sections 2–7 and 8.2–8.3 are unread**, so the line bundle `L`
   is a read statement with an unread construction — and the geometric
   construction on the Demazure resolution is an explicit roadmap obligation.
3. **Keel beyond 1.7–1.9 is unread**, including Kodaira's lemma and the
   Frobenius-power extension of sections the roadmap names as a sub-obligation.
4. **Zhu's mixed-characteristic Satake paper is entirely unread**, although the
   roadmap names it for the perfect-space carrier and warns against silently
   importing its independent commutativity proof.
5. **Two supplier edges the atlas does not have.** `GS0:Witt-geometry` has *no*
   incoming stage edge at all, though it is where perfect schemes, properness,
   h-descent and the whole positivity argument live; and
   `EnhancedDerivedSheaves:E5:abstract` is linked into the `GS4` substages but
   not into `GS1`, whose t-structure existence uses a presentable stable
   ∞-categorical refinement and Lurie's Higher Algebra 1.4.4.11, nor into
   `GS2:correspondences`, whose convolution is composition in an ∞-categorical
   2-category. Both are requested here; a `kind:link` job should draw them.

## Structural proposals

1. **The atlas orders `GS2:Satake-closure` and `GS3:fusion` backwards.**
   `data/atlas.json` has `GS3:fusion → GS2:Satake-closure`. But Proposition
   VI.8.1(iii) is proved from (i), (ii) and the commutation of convolution with
   Verdier duality, and Proposition VI.8.2 from Propositions IV.2.24, VI.6.2 and
   VI.7.12 — fusion is used in neither. Both are in section VI.8, *before* VI.9
   on fusion, and it is VI.9 that consumes them: the proof of Corollary VI.9.5
   opens *"By Proposition VI.8.2, all `A ∈ Sat^I_G(Λ)` are dualizable, with dual
   `sw^* D(A)`."* The reviewed decomposition's own link graph runs the same way
   as the source. An edge in the wrong direction makes the atlas assert that the
   dualizability `HeckeStacksAndLocalShtukas` consumes depends on fusion, which
   the source does not claim.
2. **The positivity theory needs an owner.** Keel's criterion is a general
   theorem about projective schemes in positive characteristic. It is in no
   library and no roadmap, and this packet plans it inside a layer whose subject
   is the Witt vector affine Grassmannian — which is where it is used, not where
   it belongs. PROTOCOL §15 says a general missing notion should be planned once,
   as generally as its uses require, in the roadmap that owns it. Either a
   sub-layer of `GS0:Witt-geometry` should own positivity explicitly, or a new
   roadmap should. The packet cannot say which, because the search found no other
   consumer either — which may only mean no other decomposition has reached that
   point yet.

## Where to resume

The packet is complete against the decomposition for this part. The next real
work is source reading, in the order above: FS IV.6 first, since three nodes
already written import it; then Bhatt–Scholze 8.2–8.3 with Keel 1.1–1.6, which
together are the unread half of the projectivity argument; then Zhu. The other
part of this roadmap, `BP-GeometricSatakeAndFusion--GS3` (issue #742), is
independent of that reading and can be taken in parallel.
