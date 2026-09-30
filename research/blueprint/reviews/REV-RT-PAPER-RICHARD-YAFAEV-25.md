# REV-RT-PAPER-RICHARD-YAFAEV-25 — independent finding verification

Codex, session `codex-5ebb6f`; issue #4288; 30 September 2026.
**Both findings confirmed:** `/1` is the reported medium routing error;
`/2` is the reported low routing error. The corrections concern ownership and
explicit construction obligations, not the truth of the published theorems.

I did none of the extraction (Claude Code `cc-fb70e5`), its review
(`cc-7b31c4`) or the red team (`cc-c2c06b`). I examined repository base
`113e7bcbe1303cc62d37f18c3598d0cba71d3433`.

## Evidence read

I read both complete findings and the red-team report, the four extraction
routes and their briefs, items 11, 12 and 35, the relevant original R28.4 and
all SF stage descriptions, accepted RS-06/RS-25 narrowing contracts, and the
accepted Tsimerman route 10 for the quantitative Faltings Part II. I also
checked the extraction review's routing discussion and the Tsimerman review's
acceptance and quantitative-isogeny entry. This verifies the two findings;
it does not repeat all 41 extraction items or its six source-issue checks.

I independently downloaded the [published open-access Richard–Yafaev
article](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00154-4.pdf),
Publ. Math. IHÉS 141 (2025), 249–331, DOI
[10.1007/s10240-025-00154-4](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-025-00154-4/).
Its SHA-256 is
`3f3af58def7bb398b3d365ecf828a6571a9477fd7f2b7b891706f146fec05b9e`,
matching the accepted extraction and review. Read on 30 September 2026:
the statements and proofs on pp. 260–265 and 310–311, and the explicit uses
of Propositions 7.13–7.15 in §7. I checked page images for pp. 260, 263,
310 and 311. Printed page numbers were checked against running heads.

## Finding /1: uniform integral refinements exceed the base contract

**Confirmed.** Route 1 sends items 11 and 12 to
`FaltingsFinitenessAndIsogenyTheorems:R28.4`; route 4's brief imports them
from that same base stage.

The actual source distinguishes the following proof steps:

- Theorem 4.7, p. 260, quantifies a bound uniformly over open subgroups of
  bounded index, assuming all geometric endomorphisms are defined over K.
- Its number-field proof, pp. 261–263, uses Masser–Wüstholz [28] for the
  large-prime semisimplicity/commutant input, in addition to qualitative
  Faltings and bounded-index subgroup finiteness.
- Proposition 4.8, pp. 263–265, changes the group and uses Noot specialization
  and Serre independence to extend the uniform statement to finite-type fields.

These are additional constructions, not a restatement of rational Hom
comparison. The accepted RS-06 contract for R28.4 keeps Faltings' Satz 3/4
semisimplicity, integral End/Tate comparison, the rational Hom consequence,
isogeny criterion and local-factor equivalences. It does not keep the added
uniform-index theorem or its prime-uniform refinement. The original README
at `content/campaign/FaltingsFinitenessAndIsogenyTheorems/README.md:56`
likewise describes the qualitative comparison and criterion.

Accepted `PAPER-TSIMERMAN-18.result.json`, route 10, already proposes
`FaltingsFinitenessAndIsogenyTheoremsPartII` with parent
`FaltingsFinitenessAndIsogenyTheorems` and title
“Faltings finiteness, semisimplicity and isogeny theorems, Part II:
Quantitative isogeny estimates”. Its brief decomposes the quantitative
Masser–Wüstholz theory and imports the base's qualitative facts. Coalescing
the uniform refinements into that extension preserves this boundary.

**Fix confirmed:** reroute items 11 and 12 into the same Part II identifier,
parent and title; extend its brief with the named refinements and the
Richard–Yafaev theorem/proposition, importing the specialization and
independence inputs through R01.6. Update route 4's import. A remaining
R28.4 source route may contain only genuinely retained qualitative content.
Keep the original item IDs, source locators, hypotheses and source issues.

Two qualifications matter. This is an ownership/extension violation; no
actual stage-graph cycle is established by this review. Coalescing also does
not make the uniform Tate theorem an immediate corollary of a geometric
degree bound. The extension must decompose its additional arithmetic and
coefficient-field arguments. I verified Richard–Yafaev's explicit use of
Masser–Wüstholz [28]; I did not acquire and independently verify the full
1995 *Refinements* chapter or its derivation from the isogeny estimates.
Its publisher PDF endpoint returned no PDF. Those source proofs remain
explicit prerequisites of the extended route, not certified completed work.

## Finding /2: the criterion package is not an SF.0 import

**Confirmed.** Route 3 puts item 35 at
`SchemeAndStackFoundations:SF.0`, and route 4 expects that stage to supply
the criteria. Accepted RS-25 instead retains library reuse and the missing
relative Spec/general relative Proj interfaces. The original SF.0 README
at `content/campaign/SchemeAndStackFoundations/README.md:15` names morphism
properties without asserting these point-lifting equivalences. Neither that
contract nor the other SF stage descriptions explicitly supplies this package.

The source's requirements must survive the fix:

| Source | Contract boundary verified |
| --- | --- |
| Proposition 7.13, p. 310 | A closed affine subscheme of finite presentation; the flatness condition is on its reduction. The non-noetherian base is handled by descent to a finite extension's integer ring. |
| Proposition 7.14, p. 311 | Reduced affine schemes of finite presentation, a flat arrow, and lifting of the reduced point. |
| Proposition 7.15, p. 311 | Affine schemes and an integral arrow; no added finite-presentation or reducedness hypothesis is required here. |

The proof of Theorem 7.1 explicitly uses 7.15 and 7.14 on pp. 298–299;
other §7 applications use 7.13. Their local consumer is thus in route 4's
Hecke/Kempf–Ness extension. A lexically screened search of original atlas
stage descriptions and accepted `keeps` clauses found no alternative
explicit contract for the three-proposition package. This is a scoped
ownership check, not proof that every related theorem is absent from every
library or source packet.

At pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` I read the
actual `AlgebraicGeometry.Flat` class and `Flat.SpecMap_iff`
(`Morphisms/Flat.lean:42,65`), `AlgebraicGeometry.IsIntegralHom`
(`Morphisms/Integral.lean:35`) and `ValuativeCriterion.Existence`
(`ValuativeCriterion.lean:78`). These are reusable interfaces; a morphism
property or a definition of a lifting predicate does not assert this
valuation-ring criterion package. The fix should reuse them and their
applicable algebra, rather than rebuilding generic morphism carriers.

**Fix confirmed:** put the missing source-scoped criteria beside their
Kempf–Ness uses in route 4, and explicitly add them to that brief; alternatively
request a named foundations extension stage for the reusable criteria and
have route 4 import it. The latter is appropriate if that generality is
needed elsewhere. Remove the unsupported claim that narrowed SF.0 already
owns their proofs, and rewrite or remove route 3. Preserve the hypotheses
above and the EGA descent argument. Item 35 remains represented exactly once.

## Validation and limits

`scripts/check_redteam.py` accepts the review JSON; intake file checks,
JSON parsing and `git diff --check` pass. The review has a verdict for each
of the two findings. Only the two issue-authorized review files are added;
the extraction, findings and accepted narrowing contracts are unchanged.
No Lean compiled, and no Lean file is produced by this verification.

I do not certify the red team's exhaustive absence claims, its historical
acceptance timestamps, all upstream Masser–Wüstholz proofs, or the
extraction's unrelated source issues. The confirmed routing decisions follow
from the actual current contracts and the cited published constructions.
