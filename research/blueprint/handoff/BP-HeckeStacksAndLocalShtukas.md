# Handoff — BP-HeckeStacksAndLocalShtukas (issue #750)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-hecke`.

## Deliverables

- `research/blueprint/packets/HeckeStacksAndLocalShtukas.json` — 12 nodes
  (4 constructions, 1 definition, 4 theorems, 1 lemma, 2 comparisons), 32 API
  items, 21 unit tests, 9 planets, 28 baseline declarations, 8 gaps, 22
  requests, 2 structural entries. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/HeckeStacksAndLocalShtukas.md` — 954 lines.
- `research/blueprint/suggested/HeckeStacksAndLocalShtukas.lean` — 503 lines.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeckeStacksAndLocalShtukas.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place, so
  every baseline reference was resolved against it rather than checked for form.
- `python3 -m unittest discover -s tests` → 254 tests, OK.
- `python3 research/blueprint/intake.py check-files` on the four changed paths →
  0 problems.

**The Lean file was not compiled.** No Lean was run for this job. The Mathlib
build on this machine is a shared cache that must not be rebuilt, and this
working tree has no elaborated dependency modules. Nothing is claimed to be
formalised; every `implementationStatus` is `unchecked`.

## Source verification

Both sources were downloaded again in this session and **both SHA-256 hashes
reproduce the recorded values byte for byte**:

| source | URL | SHA-256 |
| --- | --- | --- |
| `FS-geometrization` | people.mpim-bonn.mpg.de/scholze/Geometrization.pdf | `9ab9efbd0df251bf…a905` |
| `SW20-berkeley` | www.math.uni-bonn.de/people/scholze/Berkeley.pdf | `225505171ef809aa…4bffc` |

Every locator in this packet therefore rests on the same two files the
independent review of the decomposition checked. No locator was re-verified
against the PDFs beyond the hashes; the page-level checking, including the
Berkeley convention *printed page = PDF page − 10*, was done by that review.

## The one node this packet does not keep

The reviewed decomposition has a node
`HeckeStacksAndLocalShtukas:HS4/uniform-wild-subgroup` for Fargues–Scholze
Proposition IX.5.1. **It is not planned here**, and the decision rests on two
statements already in the repository, not on a judgement about the mathematics.

1. The roadmap document, HS4: *"Export continuous Weil actions and
   tensor-generator compatibility to ES1:finite-ramification, the canonical owner
   of IX.5.1's uniform wild subgroup for each compact object. This transferred
   theorem is not assumed in the construction of the Hecke family."*
2. RS-22 (review `REV-RS-22`, accepted 23 September 2026), reason for keeping
   HS4: *"parameter identities remain ES6/ES7 and uniform wild-inertia cutoff
   remains ES1:finite-ramification. The older decomposition node does not reverse
   that current ownership."*

`data/atlas.json` agrees: the stage edge runs `HS4 →
ExcursionOperatorsAndSpectralAction:ES1:finite-ramification`, in that direction.
PROTOCOL §15 says what another roadmap plans is imported and never planned again.

Nothing is lost: the statement is filed as a request to
`ES1:finite-ramification` carrying its full content — the uniformity of `P` in
`I` and in `V`, the full-faithfulness step `f_♯ Λ = Λ` for `[*/W_E^I] →
[*/(W_E/P)^I]`, its reduction after a v-cover to the vanishing of the
`Λ`-homology of `P^I`, and the point at which `ℓ ≠ p` is used — together with the
decomposition's own note that only the statement and the first half of the proof
were read. A reviewer who disagrees should weigh it as a duplication question,
not as a dropped statement.

## RS-22 more generally

All five layers are kept. The roadmap is **retitled** to "Hecke correspondences
on the Fargues–Fontaine curve and local shtuka cohomology"; the packet is written
under that title and uses *global* only for the leg set, never for a global
function field. `GlobalShtukasAndFunctionFieldLanglands`, the other family
member, is neither a base nor a supplier and is not requested. RS-22's three new
links into this roadmap — `VStackSheavesAndLisseCategories:VS1 → HS1`,
`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group → HS1`, and
`GeometricSatakeAndFusion:GS3:fusion → HS4` — are all filed as requests. The
Class Field Theory supplier is a request only and never a prerequisite, because
`scripts/check_blueprint.py` parses any `tauceti:` identifier as a baseline
declaration.

## The library search

`data/library-coverage.json` has no reviewed audit entry for this roadmap, so the
pinned declaration index was searched directly.

**Absent from both libraries**, hence genuine dependencies: any declaration whose
name contains `WeilGroup`, `LoopGroup`, `Shtuka` or `Perfectoid`, and any affine
Grassmannian (the only `Grassmannian` is `Module.Grassmannian`).

**Present and cited rather than planned.** The useful find is
`mathlib:WittVector.Isocrystal`: a module over `K(p,k) = W(k)[1/p]` with a
Frobenius-semilinear automorphism, which for `G = GL_n` is exactly the datum `b`
of the shtuka triple, so the linear-algebra case of the datum is pinned. Also
`mathlib:CoxeterSystem` and `tauceti:TauCeti.TitsSystem.bruhatCell` for the
Bruhat order of the boundedness condition;
`tauceti:TauCeti.ReductiveAffineGroupSchemeCat`,
`tauceti:TauCeti.AffineGroupSchemeCat` and
`tauceti:TauCeti.ClosedSubgroupScheme` for the groups;
`tauceti:TauCeti.Huber.Pair` and `tauceti:TauCeti.ValuationSpectrum.spa` for the
affinoid test objects; `tauceti:TauCeti.IsSmoothDiscrete` and
`tauceti:TauCeti.SmoothDiscreteTopRep` as the pinned smooth-representation
carriers HS3's conclusion must be compared with; and the condensed carriers for
the enrichment.

## What remains

No layer is closed. The decomposition's five gaps are carried forward unchanged,
each with a *next source action* naming exact printed pages, and three were
added. In rough order of how much they block:

1. **FS VII.4–VII.5 are unread** and carry the Hecke construction twice:
   Proposition VII.4.3 for the passage from the Demazure generators to
   preservation of `D_lis` in IX.2.1, and Proposition VII.5.2 both for extending
   `T_V` from torsion `Λ` to all `Λ` and for `Rf_{K!}Rf_K^!ℤ_ℓ|_U = f_{K♯}ℤ_ℓ|_U`
   in the proof of IX.3.1. Requested from `VStackSheavesAndLisseCategories:VS2`.
   This gap is shared with that roadmap's packet.
2. **FS IV.7 (Drinfeld's lemma) is unread**, and it is what identifies the target
   of `T_V` with `W_E^I`-equivariant objects. Requested from
   `VStackSheavesAndLisseCategories:VS1`, which RS-22 makes the canonical
   supplier.
3. **Berkeley 23.2–23.5 and Lecture 24 are unread.** HS2 rests on the *statement*
   of Theorem 23.1.4, and the local Shimura tower that FS IX.3 identifies with a
   Hecke fibre is constructed in the unread Lecture 24.
4. **FS VIII.4 (excursion operators) is unread.** HS4's triangle identities have
   no located source statement anywhere in Chapter IX — it was searched section
   by section — and VIII.4 is where they would be.
5. **One supplier edge the atlas does not have:**
   `VStackSheavesAndLisseCategories:VS5 → HS1`. Theorem IX.2.2 deduces
   ULA-preservation from Proposition VII.7.9, the lisse form of FS V.7.1, which
   the VStack packet plans in VS5; the atlas links VS5 into HS3 but not into HS1.
   Filed as a request here; a `kind:link` job should draw the edge.

## Structural entries

1. **The RS-22 retitle is adopted**, recorded so a reviewer can see it was
   applied and not merely noted.
2. **HS4 is two different things.** One half is the coherence of the Hecke family
   (permutation, dual-leg creation and annihilation with the triangle
   identities, iterated modification, fusion along every finite-set map); the
   other is the geometry of the IX.6 diagrams. The decomposition found a source
   statement for the second and none at all for the first, whose source route
   runs through GS4 (dualizability) and VIII.4 (excursion operators), both owned
   elsewhere. With IX.5.1 now correctly assigned to `ES1:finite-ramification`,
   HS4 as it stands has one node with a source and one obligation without one.

## Where to resume

The packet is complete against the decomposition. The next real work is source
reading, in the order above: FS VII.4–VII.5 first, since two nodes already
written quote them; then IV.7; then Berkeley 23–24, which is a layer's worth of
material rather than a gap in an existing node.
