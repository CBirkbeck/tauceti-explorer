# REV-AUDIT-37 — review of AUDIT-37

**Verdict: accepted.** 1 correction (a line number). 160 targets checked; 197 of 202 citations
matched the index mechanically, and the five that did not were all checked in the source — four are
right and the index is what is wrong.

Batch: `FarguesFontaineDiamonds`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory`,
`HodgeTateAndCanonicalSubgroups`, `PadicDifferentialEquationsAndRigidCohomology`,
`PadicHodgeTheory` — 39 layers, 160 targets, 202 declaration citations, 115 duplicates. Baseline:
tauceti `f790474`, mathlib `082e2d3`. Reviewer: Claude Code, session `cc-7b31c4`, issue #872; the
audit was done by the local lane `claude4/2` (ledger, 2026-09-18), so this is a different agent.

## What the audit claims

37 layers "not built" and 2 "partly built". Of 160 targets, 107 are absent, 49 partial, 3 present in
Mathlib and 1 in Tau Ceti. The high proportion of `partial` is what distinguishes this batch: the
libraries have a real p-adic ingredient base — ℂ_p and its tilt, A_inf and θ, B_dR^+ and B_dR, Witt
Frobenius and Verschiebung, F-isocrystals, divided powers, Cartier duality for finite locally free
group schemes — and almost none of the theory built on it. That picture survived review.

## 1. Every claim that something is in the libraries

Of the 202 citations, **197 match `declarations.tsv` exactly** on name, library, file and line, and
all 73 cited files exist with **no `sorry`** in any of them. Layer coverage is exact: the 39 audited
layers are the 39 the atlas gives these five roadmaps. All 115 duplicate targets resolve to real
atlas stages.

**The five that did not match, resolved in the source.**

* `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` and `…cartierDualDualNatIso`
  (cited twice each, in `R07.1` and `T0`) are **correct as the audit writes them**, and the index is
  wrong. `CartierDuality/FiniteLocallyFree.lean` opens `namespace TauCeti` at line 65 and closes it
  at line 350, and `namespace FiniteLocallyFreeCommAffineGroupSchemeCat` at line 220 sits inside it,
  so the full names carry the `TauCeti.` prefix. `declarations.tsv` lists them without it because
  the indexer is a regex scan: `index_declarations.py` matches `namespace` only when the name is on
  the same line, and this file writes `namespace` at line 157 with its (very long) name on line 158,
  then closes it with a bare `end` at line 217 — which pops `TauCeti` off the indexer's stack. The
  script's own docstring says names are approximate and must be confirmed in the source; here the
  audit did confirm them and the index did not. Nothing to change, but worth recording: a red team
  that checks these two citations mechanically will get a false positive.
* `IsPrimitiveRoot` was cited at `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:68`. The
  structure is declared at **line 63** (line 62 is its `@[mk_iff]` attribute, 68 is inside the
  following declaration's docstring). **Corrected in place**; the citation is `related` on a target
  that is absent for other reasons, so nothing else changes.

**The four targets claimed present were read in the source and hold.**

* **`R07.1`, Cartier duality (Tau Ceti).** `cartierDuality R : (FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R))ᵒᵖ ≌ FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)`
  is proved for an arbitrary `CommRing R`, with `cartierDualDualNatIso` for involutivity and
  `baseChangeDualNatIso` for base change — "more general than asked", as the note says, since the
  layer only needs a mixed-characteristic DVR base.
* **`R06.1`, ℂ_p and its tilt.** `PadicComplex`, `PadicComplexInt`, `PadicComplexInt.integers`,
  and Scholze's `Tilt` with `PreTilt.val` are all there with the hypotheses the note states.
* **`R06.1`, A_inf and θ.** `fontaineTheta`, `surjective_fontaineTheta` and
  `fontaineTheta_teichmuller`, for any p-adically complete ring — at least the stated generality.
* **`R06.1`, B_dR.** `BDeRhamPlus` is the ker(θ[1/p])-adic completion of `Localization.Away (p : 𝕎 R♭)`
  and `BDeRham` inverts the generators of that kernel. The note is careful in both directions: the
  construction is more general than the layer asks, and the docstring's claim that it "coincides
  with the classical de Rham period ring" for `R = 𝒪_{ℂ_p}` is not itself proved.

## 2. Re-searching the absent and partial claims

I re-searched by concept over `declarations.tsv` (246,008 Mathlib and 70,802 Tau Ceti declarations)
and with `grep -rn -i` over both trees. Nothing turned up that the audit missed. Zero
declaration-name hits for: p-divisible groups, Barsotti–Tate groups, Dieudonné modules or the
Dieudonné ring, Fontaine–Laffaille modules, Breuil–Kisin modules, canonical subgroups, Hasse
invariants, Igusa towers, the Tate curve, B_cris/B_st, weak admissibility, period rings as such,
rigid cohomology, dagger or overconvergent algebras, log adic spaces and Kummer-étale sites, and
Newton polygons.

The false friends are all handled by the audit itself, which I confirmed: the only "Dieudonné" in
either tree is the Cartan–Dieudonné theorem on orthogonal groups; the 130 "monodromy" declarations
are covering-space and homotopy monodromy; the 264 "slope" declarations are convexity, derivatives
and Dehn-surgery slopes. The notes on the partial targets are correspondingly precise — for example
that Mathlib proves `F ∘ V = V ∘ F = p` on Witt vectors, "which is the scalar side of the Dieudonné
ring", while the ring `W(k)[F,V]` and its module category are never formed; and that the
Dieudonné–Manin classification exists **only in dimension one over an algebraically closed field**.

## 3. Duplicates

All 115 resolve, and the ones I checked are borne out by the target layer's description. Two are
worth singling out because they are cross-checks rather than restatements: `R07.1` names the two
Tau Ceti `ModularCurves` roadmap layers (0b, finite locally free group schemes and Cartier duality;
7e, p-divisible groups) as the owners of exactly the material Tau Ceti has already built, and
`R07.4` names `PrismaticCohomology:PR.7` as the modern form of the Breuil–Kisin classification. The
second is the mirror of a duplicate I added to `PR.7` while reviewing AUDIT-38 today (issue #873);
the two audits now agree in both directions, which is evidence for the link rather than against it.
I found nothing to add.

## Most important finding

Nothing substantive was wrong. The finding that matters for future jobs is not in the audit but in
the tooling around it: `declarations.tsv` silently drops a namespace prefix when a file writes
`namespace` with its name on the next line and closes it with a bare `end`, as
`CartierDuality/FiniteLocallyFree.lean` does. The audit's Cartier-duality citations are right and
the index is wrong, so a mechanical name check against the index must not be treated as a verdict —
exactly as `index_declarations.py`'s own docstring warns. The one real defect was a five-line slip
in the `IsPrimitiveRoot` locator, now fixed.

## Checks run

- Every citation matched against `declarations.tsv` at the pinned commits (197/202 mechanically,
  the remaining five resolved by reading the source); every cited file opened and scanned for
  `sorry` (73 files, none); every declaration behind a claim of presence read in the source.
- Layer coverage compared against `data/atlas.json` (39/39, none extra); every duplicate target
  resolved against the atlas stage list (115/115).
- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-37.result.json`:
  no problems.
- No Lean file was written or compiled, and no claim is made that anything here is formalised.
