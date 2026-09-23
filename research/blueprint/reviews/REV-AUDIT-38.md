# REV-AUDIT-38 — review of AUDIT-38

**Verdict: accepted.** 1 correction, 1 note sharpened, 1 duplicate added. 258 targets checked.

Batch: `PerfectoidQuotients`, `PerfectoidSpaces`, `PhiGammaModulesAndIwasawaCohomology`,
`PrismaticCohomology`, `PerfectoidShimuraVarieties` — 42 layers, 258 targets, 329 declaration
citations (328 audited, one added here), 137 duplicates (136 audited, one added here). Baseline: tauceti `f790474`, mathlib `082e2d3`. Reviewer: Claude Code,
session `cc-7b31c4`, issue #873; the audit was done by the local lane `claude4/1` (ledger,
2026-09-18), so this is a different agent.

## What the audit claims

39 layers "not built" and 3 "partly built", no layer "built". Of the 258 targets, 234 are absent,
21 partial, 2 present in Mathlib and 1 present in both libraries. That picture survived review.
These five roadmaps are almost mathematics, perfectoid spaces, prismatic cohomology, (φ,Γ)-modules
and perfectoid Shimura varieties, and the pinned libraries contain none of the theory itself — but,
as the audit's summaries say and I confirmed, they do contain an unusually large amount of the
input material, mostly in Tau Ceti's Huber/adic development and Mathlib's Witt-vector and
perfection files.

## 1. Every claim that something is in the libraries

**All 328 citations check out.** Each matches `declarations.tsv` exactly on name, library, file and
line; 142 distinct declarations over 116 distinct files, and none of those files contains a `sorry`.
Coverage is complete in the other direction too: the audit's 42 layers are exactly the 42 layers
the atlas gives these five roadmaps, with none skipped and none invented.

I read the source around every declaration behind a claim of presence, and the three "present"
targets hold:

* **`PerfectoidSpaces:P0`, the Serre quotient.** `ObjectProperty.SerreClassLocalization.abelian`
  (`Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean:417`) really does prove that a
  localization of an abelian category at a Serre class is abelian, for an arbitrary Serre class.
  The audit's remark that the "Future work" entry in `SerreClass/Basic.lean` ("Show that the
  localization of `C` with respect to a Serre class is an abelian category") is stale is correct —
  that file's TODO was overtaken by `Localization.lean`.
* **`PerfectoidSpaces:P1`, Fontaine's θ.** `WittVector.fontaineTheta : 𝕎 R♭ →+* R` is built for
  every `R` with `[Fact ¬IsUnit (p : R)]` and `[IsAdicComplete (span {(p : R)}) R]`,
  `fontaineTheta_teichmuller` proves θ([x]) = x♯ through `PreTilt.untilt`, and
  `surjective_fontaineTheta` assumes exactly surjectivity of Frobenius on `ModP R p`. "More
  general than the layer asks" is right. The summary's remark that Mathlib's own TODO records
  ker θ principal as unproved is also right, though it is in `Perfectoid/BDeRham.lean` (TODO 3,
  "Show that ker θ is principal when the base ring is integral perfectoid"), not in
  `FontaineTheta.lean`, whose TODO is the cotangent-complex comparison.
* **`PhiGammaModulesAndIwasawaCohomology:PG.3`, cup products and change of groups.** All of it is
  there: `explicitCup00/01/10/02/20/11`, `explicitCor0/1/2` with `explicitCorN_changeTransversal`
  and `explicitCor1_comp_res1` (cor ∘ res = `U.index` • id), inflation, and
  `explicitH0IsoContinuousCohomology`. **One correction, made in place** — see below.

## 2. The one correction

**`PG.3`, the generality of the continuous-cohomology package.** The note said this material is
built "for continuous cohomology of a topological group on a **discrete** module". That is not what
the library proves. In `ContCohomology/Cup/Product.lean` the coefficients are any topological
abelian groups `M`, `N`, `P` with `[IsTopologicalAddGroup _]` and `[ContinuousSMul G _]`, and the
cup products take any `G`-equivariant pairing `μ : M →+ N →+ P` with
`hμ : Continuous fun p : M × N => μ p.1 p.2`; `Corestriction.lean` and `LowDegree.lean` are stated
in the same generality, with continuity entering only through membership in `C¹`/`C²`.
`[DiscreteTopology M]` appears in exactly one place in the cited material: the comparison with
Mathlib's canonical `continuousCohomology` in `ContinuousCohomologyIso.lean`.

This matters for the layer that cites it. The Tau Ceti *roadmap* does state its Layer 8 in the
discrete setting ("Discreteness of `M` and `N` makes every cochain-level continuity automatic"),
which is presumably where the wording came from, but PG.3's coefficients are p-adic and not
discrete, so the note as written would have told a planner to rebuild a cup-product calculus that
is already available in the generality needed. The note now says what the declarations assume, and
where the discreteness hypothesis really is. The target's `both` classification and the layer's
`partly built` verdict are unchanged.

## 3. Re-searching the absent and partial claims

I re-searched the absent targets by concept over `declarations.tsv` (246,008 Mathlib and 70,802 Tau
Ceti declarations) and with `grep -rn -i` over both trees. Nothing turned up that the audit missed.
Zero declaration-name hits for: perfectoid (as a predicate — the name occurs only in file paths),
prism, δ-ring, p-derivation, Nygaard, quasisyntomic, semiperfectoid, perfectoidization, animated or
simplicial commutative rings, derived completion, Lη/décalage, Robba, Herr, Wach, overconvergent,
field of norms, Cherbonnier, Lubin, crystalline, Shimura, modular curve, Hodge–Tate (as a p-adic
weight), `AdicSpace`/`PreAdicSpace`, `IsSheafyPair`, completed tensor products, `IsStablyUniform`.

The false friends the audit avoided, each checked in context: the 91 "diamond" hits are the diamond
operators ⟨d⟩ on modular forms and typeclass diamonds, not Scholze's diamonds; `WittVector.Isocrystal`
is the Dieudonné-module notion over a perfect field with the one-dimensional Dieudonné–Manin
classification, not an overconvergent isocrystal; `Algebra.Extension.cotangentComplex` is the naive
two-term complex, the only cotangent complex in either library; Mathlib's pro-étale material
(`AlgebraicGeometry/Sites/Proetale.lean`) is a topology on schemes, not the pro-étale calculus of
adic spaces; and the "Selmer" declarations are 2-descent Selmer groups of Weierstrass curves.

Three sharper negatives were worth testing, and all three hold:

* **Čech versus sheaf cohomology.** `Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean`
  defines `cechComplexFunctor` and nothing else — no comparison with `Sheaf.H`, not even for an
  acyclic cover. The `P2` note is right.
* **Uniformity of a Huber ring.** There is indeed no predicate. **Note sharpened:** the condition
  is not a theory to build, since `TauCeti.Huber.IsBounded S` (`∀ U ∈ 𝓝 0, ∃ V ∈ 𝓝 0, V * S ⊆ U`,
  `RingTheory/Huber/Bounded.lean:87`) applied to `powerBoundedSubring` states it in one line; the
  declaration is now cited on that target.
* **The cyclotomic character.** `cyclotomicCharacter L p : (L ≃+* L) →* ℤ_[p]ˣ` exists with its
  defining property, and `cyclotomicCharacter.continuous` proves continuity of its composite with
  `Gal(L/K)`. "Exact", as the audit labels it, is the right fit for the character itself, and the
  note is precise that the two displayed φ/γ formulas and the convergence of `(1+π)^{χ(γ)}` are
  absent.

## 4. Duplicates

All 136 recorded duplicates resolve to real atlas layers, and the overlaps I checked are borne out
by the target layer's own description — including the ones that do the most work: `AI.1` for the
generic Lη that `PR.3` uses, `RT.3b` for the Beilinson square, `HodgeTateAndCanonicalSubgroups:T3`
for the canonical subgroups `S1` quotients by, `ShimuraCompactifications:C4` for the minimal
compactification, `PerfectoidSpaces:P7` as the axiomatisation of `S1`'s Frobenius-approximating
tower, and `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-8` for `PG.3`'s cup products.

One was added:

| layer | added duplicate | why |
| --- | --- | --- |
| `PrismaticCohomology:PR.7` | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` | PR.7's last target compares evaluation on the Breuil–Kisin prism with the **Kisin functor**; R07.4 ("Breuil–Kisin modules") is the layer that builds 𝔖 = W(k)[[u]], the Frobenius modules with their Eisenstein height bound and the classification of finite flat and p-divisible groups. AI.7, already listed, owns only the cohomological descent side and says so itself: "R07 owns the representation/group classification, not this cohomology functor." |

Candidates examined and rejected: `AdicSpacesPartII:R4` for `P6` — R4 is an early re-export of the
étale/pro-étale *site* and its own text says PerfectoidSpaces consumes R0–R3, so this is a
dependency rather than duplicated mathematics; the modular-curve roadmaps for `S5` — S5 compares
its perfectoid tower with the finite-level modular tower it imports, and the Hilbert side is
already credited to `HilbertModularVarietiesAndShimuraCurves:H4`; and
`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` for `PG.6`, where Wach modules and Breuil–Kisin
modules classify the same lattices by different routes but PG.6 already records the
`PrismaticCohomology:PR.7` mirror of that overlap.

## Most important finding

Nothing substantive was wrong: the verdicts, the statuses and the citations all survive. The one
correction that changes what a planner would do is the generality of Tau Ceti's continuous-cochain
package — cup products, restriction and corestriction in degrees ≤ 2 are proved for arbitrary
topological coefficient modules with a continuous equivariant pairing, not only for discrete ones,
so PG.3 can consume them directly for p-adic coefficients and only the comparison with Mathlib's
canonical `continuousCohomology` is restricted to discrete modules. The added duplicate is the
second useful outcome: the Kisin functor that `PR.7` compares against is owned by `R07.4`, not by
any of the three layers previously listed.

## Checks run

- Every citation matched against `declarations.tsv` at the pinned commits (328/328), every cited
  file opened and scanned for `sorry` (0), every cited declaration's statement read for the claims
  of presence.
- Layer coverage compared against `data/atlas.json` (42/42, none extra); every duplicate target
  resolved against the atlas stage list (137/137).
- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-38.result.json`:
  no problems.
- No Lean file was written or compiled, and no claim is made that anything here is formalised.
