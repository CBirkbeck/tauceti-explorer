# REV-PAPER-BHATT-18: review of the extraction of Bhatt, *On the direct summand conjecture and its derived variant*

**Verdict: accept, after corrections made in place.**

- **Routes.** All nine routes are accepted.
  - Route 6 re-planned Tau Ceti StableReduction.
  - Route 7 needed layers downstream of AdicSpacesPartII R2.
  - Both are corrected in place.
- **Mistakes.**
  - All ten recorded mistakes are confirmed.
  - The review adds fifteen (E11–E25). Two of them are gaps in the reductions of Theorems 5.4 and 6.1 (E14, E15), and v2 introduced both.
- **Items.**
  - Five remark items are removed and eight items added, which gives 89 items (65 missing, 14 planned, 10 library).
  - Thirty-eight items have content fixes, and six more only a corrected owner.
- **Version of record.** The published text is still unobtainable (G1), so the findings stay scoped to arXiv v2. `sourceVersions` now records this.

Reviewer: Claude Code, session `cc-58621d`, 29 September 2026 (issue #2183).

Extraction under review:
- the first checkpoint by Codex `codex-hjdg0j`;
- continuations by Codex `codex-7e92bd` and Claude Code `cc-fb70e5`;
- the completion by Claude Code `cc-39fac3` (PR #4024, issue #2182).

At review it had 86 items (64 missing, 12 planned, 10 library), nine routes and ten `sourceIssues`, with status `complete`. `cc-58621d` appears nowhere in its files.

Sources:

- **Preprint.** arXiv:1608.08882v2 (11 November 2017, 12 pages), SHA-256 `08578ca1…6430`, matching the record. Page images were read wherever the text layer garbles exponents: pp. 1–3, 5 and 8–12.
- **Earlier preprint.** arXiv:1608.08882v1 (31 August 2016), SHA-256 `ffbb6696…3b94`, at the passages corresponding to each finding.
- **Version of record.** Invent. Math. 212 (2018) 297–317, doi:10.1007/s00222-017-0768-7. Springer serves only a subscription landing page. Crossref records no update, erratum or correction relation.
- **For E4–E8.** André's arXiv:1609.00345v1 (`57a43966…`) and *La conjecture du facteur direct*, Publ. Math. IHÉS 127 (2018) 71–93, read via NUMDAM (`34da107d…`). Both hashes match the extraction's.
- **Other checks.** Stacks tags 0A6A, 02KH, 080J, 080K, 080N and 080G, read live. Crossref for doi:10.1016/j.jpaa.2015.07.008 ([Sh]).

Method: four read-only readers each took one part:
- §§1–3 with the remark items;
- §§4–5;
- §6 with its scheme-theoretic inputs;
- the routes and findings.

I rechecked every fix at its locator before applying it, and every graph claim on the atlas that `scripts/build.py` assembles.

## 1. Items

### Removed

Five items recorded remarks. None is a definition, construction or theorem used on the way to the main results (PROTOCOL §16). Their "unit tests" had no Lean form: for instance, "the birational case is not derivable from Theorem 1.1".

The third continuation added them so that every numbered statement appears somewhere. Each still does, now where the design jobs read it:

| Remark | Former item | Now in |
|---|---|---|
| 1.3 (the contributions) | contributions | route 9's brief |
| 1.8 (how Theorem 1.6 is used) | strategy-summary | route 8's brief |
| 2.4 (attribution to André and Scholze) | flatness-generality | route 2's reason |
| 2.5 (derived presentations) | derived-presentation | derived-rational's locator and note: Lemma 2.6 is the remark's answer |
| 5.5 (the p-adic Kunz question) | perfectoid-kunz | direct-summand's note |

perfectoid-kunz also misstated its remark: Remark 5.5 generalises the proof of Theorem 5.4, not Proposition 5.2.

### Added

| Item | Status | What the paper uses it for |
|---|---|---|
| tilt | planned, P1 | A♭, the sharp map and A♭/t♭ ≅ A/t, in Lemma 2.6 and the proof of Theorem 2.3 |
| pro-tower | missing, E2 | pro-zero towers and pro-isomorphisms "in the usual sense", in Definition 3.2 and Lemma 5.3 |
| algebra-adjoint | missing, P0 | the properties of (−)_!! in the ramified proof of Proposition 5.2 |
| cohen-structure | missing, route 9 | A0 ≅ W⟦x_2,…,x_d⟧, and the kernel p − f in the ramified case, in Proposition 5.2 |
| residue-field-extension | missing, route 9 | the flat extension to an algebraically closed residue field (EGA 0_III 10.3.1) that opens the proof of 5.2 |
| derived-local-reduction | missing, route 9 | "We may assume A0 is a regular local ring" in Theorem 6.1 (E15) |
| perfect-cone-detection | missing, route 9 | Theorem 6.1's "Repeating the argument in the proof of Theorem 5.4": the first half |
| perfect-cone-limit | missing, route 9 | the same, second half, through Remark 4.3 |

The extraction had left the last two inside derived-summand as a G5 obligation.

perfect-cone-detection needs no completeness, which matters for E14. For perfect Q0, H^1(P)/p^m injects into Hom(Q0, A0/p^m[1]). The cokernel tower {H^2(P)[p^m]}, with multiplication by p as transition map, is pro-zero, because the finite module H^2(P) has bounded p-power torsion.

### Corrected

**§§1–3.**
- **integral-perfectoid.** t is a pseudouniformizer (0 < |t| < 1), not "a topologically nilpotent unit" of K°. The locator no longer collides with Assumption 1.4.
- **root-disc.** A⟨T^(1/p^∞)⟩ is again integral perfectoid. Notation 2.1 asserts this when it calls X and Y perfectoid spaces.
- **neighborhood-flat and extension-flat.** They no longer depend on derived-rational and derived-completion.
  - Remark 2.5 says the derived form is "not necessary for our purposes".
  - The proof of Theorem 2.3 needs the presentation only modulo t^ε with ε < 1, which Scholze's proof of his Lemma 6.4 gives.
  - Definition 2.2's completion is the ordinary t-adic one.
  - As extracted, Theorem 2.3, and through it Theorems 1.5 and 1.1, inherited simplicial perfection and DD.1 for no reason.
- **aic-extension.** B(A) is integral perfectoid, with compatible roots (Remark 2.7).
- **separating-example.** The exact hypothesis is that t is not a unit.
- **Locators and notes.** The locators of almost-category and approximation are corrected. almost-flat's note records that P0 does not name almost faithful flatness. almost-category's note cited a P0 request that does not exist; it now points to algebra-adjoint.
- **module-tower-milnor.** Its almost clause made an E2 item depend on P0, a descendant of E2. The clause and its annihilator bookkeeping moved to rlim-iso.

**§§4–5.**
- **local-complete-reduction.**
  - g must be coprime to p, because the Krull step uses "0 ≠ g ∈ A0/p".
  - The extension is finite étale after inverting pg.
  - Completion comes before the domain reduction (E14, E9).
- **cover-tor.** The ramified case now follows the paper's factorization A0 → A′ → A_!! → A. The extraction's "compose with the almost flat normalization" had a gap: A′ → A is almost faithfully flat only modulo π, and A′ is not Noetherian.
- **obstruction-limit.** The proof of 5.4 never checks Notation 4.1's hypothesis, that g is an almost nonzerodivisor modulo p^m. remove-regularity (Remark 4.4, footnote 7) discharges it. So does the direct argument: g is a nonzerodivisor on the Cohen–Macaulay ring A0/p^m, and A0/p^m → A∞/p^m is almost flat.
- **almost-purity.** The ramified case applies almost purity over A′[1/p], which need not contain a perfectoid field. So it needs the Tate-ring form (ECD Theorem 6.1) that P3 plans; 5.4 and 6.2 need only the field case.
- **obstruction.** The characterization is in Mathlib 082e2d37:
  - `CategoryTheory.Pretriangulated.Triangle.mor₃_eq_zero_iff_mono₁` (Triangulated/Pretriangulated.lean:320), with the `SplitMonoCategory` instance in the same file;
  - `ShortComplex.ShortExact.singleTriangle` and `extClass` for the triangle of a finite extension.

  Derived base change is not there, so the item stays missing.

**§6.**
- **proper-cohomology.** The item gives pseudo-coherence for a Noetherian A0 and perfectness for a regular local A0. Its base-change sentence duplicated cohomology-base-change-map and is removed.
- **generic-multisection.** The item now states mixed characteristic and g coprime to p, which the repeated 5.4 argument needs, and its construction is explicit.
- **admissible-blowup.** Now planned by StableReduction layer 4, which plans the Rees algebra, the blowup of a finite-type quasi-coherent ideal as a relative Proj, and its charts and strict transform, with no Noetherian hypothesis. The tags are fixed: 080K is Definition 31.35.1, and 080J is its section. flatten-finite-type-scheme now cites 080N (Lemma 31.35.4) and 080G (Lemma 31.34.4).
- **strict-transform.** The item states the module version and imports the scheme version from layer 4.
- **equal-characteristic.**
  - v1 has Theorem 0.4 and Example 1.3 for [Bh1, Theorem 1.4] and [Bh1, Example 2.3].
  - v1 has no counterpart of [Bh1, Theorem 2.12].
- **formal-domination, generic-fiber-map and perfectoid-proper-split.** See route 7 below.
- **Owners.** Fifteen route-9 items still named the abandoned RegularRingSplittings. The route-4 owners now name layers.

## 2. Statuses

- **Library.** The ten library items were checked by this review's readers at the pinned commits, and they stand.
- **Planned.**
  - The twelve inherited planned items name layers that plan them.
  - admissible-blowup joins them.
  - tilt is added: P1 plans "the multiplicative inverse limit defining R♭ … the sharp map … the descriptions of the integral subrings".
- **Missing.**
  - **proper-cohomology stays missing.** Every input is planned:
    - StableReduction layer 2's coherent pushforward;
    - R03.3's finite global dimension of regular local rings;
    - the P7 node perfect-complexes-tor-amplitude-and-minimal-models, which plans "a bounded complex with perfect cohomology is perfect".

    But no layer plans the corollary, so route 9 proves it from imports.
  - **tower-roos and module-tower-milnor stay missing in E2.** CompletedCohomologyPartII CC.2 and ArithmeticGaloisDuality D7 plan derived inverse limits too, but both are descendants of E2 and neither is an ancestor of P0, where Bhatt's §3 needs them.

## 3. Routes

- **Route 1 (PerfectoidSpaces P0–P3).**
  - P0 plans almost modules, their adjoints and "the uniform bounds needed for each limit argument".
  - P2 plans rational localization and almost acyclicity, and P3 almost purity.
  - E1, E2 and E5:animation are ancestors of P0 and P2.
  - derived-rational uses DD.1's derived completion, and DD.1 is not an ancestor of P2. The link DD.1 → P2 is needed, and it closes no cycle.
- **Route 2 (PerfectoidQuotients Q0:integral-algebra, Q3).** Q3 is André's flatness lemma, and P0–P3 are its ancestors.
- **Route 3 (DD.1).** DD.1 plans "complete flatness and complete faithful-flat descent", which is Proposition 5.1.
- **Route 4 (EnhancedDerivedSheaves E1, E2, E5:animation).** The layers are as corrected above.
- **Route 5 (R03.1).** Lemma 5.3 is an Artin–Rees adapter of the kind PAPER-ANDRE-18-B's accepted route 7 placed there. hom-pro uses pro-tower from E2, and R03.1 is not a descendant of E2. Either add the link E2 → R03.1, which closes no cycle, or state the ℕ-indexed notion in R03.1.
- **Route 6 (SchemeAndStackFoundations SF.4).** As submitted, the route asked two layers for Tau Ceti content, against the owner records of the accepted RS-27:
  - SF.2 was asked for proper coherent finiteness, which is StableReduction layer 2's.
  - SF.4 was asked for "single ownership" of the finite-type-ideal blowup, strict transform and charts, which are layer 4's.

  Its reason also said "R2 imports" SF.4. But R2 reaches SF.4 through R3, AlgebraicModuliForArithmeticGeometry R09.6, AbelianSchemesAndArithmeticModuli A0 and A1, and NeronModelsAndSemistableAbelianVarieties R11.1, so that import would close a cycle.

  Now:
  - admissible-blowup is planned in layer 4, which SF.4 imports through the link layer 4 → SF.4; neither reaches the other today.
  - proper-cohomology moved to route 9, and SF.2 left the route.
  - formal-domination joined from route 7.
  - The SF.4 request is rewritten. It records that AdicCoefficientsAndComparisons L5, which also plans "flattening by blowup, strict transforms" for de Jong's alterations, should import the non-Noetherian theorem rather than plan it again.
- **Route 7 (AdicSpacesPartII R2).** The integral generic-fibre map belongs to R2 ("admissible blow-ups, and the adic generic-fibre functor"). But both items needed R2's descendants:
  - formal-domination used SF.4's modification results;
  - generic-fiber-map assumed perfectoid sheafiness, although R2 → R3 → P2 and P3.

  Now:
  - formal-domination is an SF.4 item.
  - generic-fiber-map is stated for p-adically complete, p-torsionfree A with (A[1/p], A) sheafy.
  - The perfectoid instance and the composition with formal-domination are steps of perfectoid-proper-split in route 9.
- **Route 8 (Part II of PerfectoidSpaces).** Parent, title and area match PAPER-ANDRE-18-B's accepted route 4, and nothing in the atlas plans a Riemann extension theorem or a Hebbarkeitssatz. The brief now cites ANDRE-18-B's accepted brief, not PAPER-ANDRE-18's returned one.
- **Route 9 (DirectSummandsAndBigCohenMacaulay, new).** Id, title and area match PAPER-ANDRE-18-B's accepted route 1. No other layer plans a direct-summand theorem; PAPER-BHATT-ETAL-23's accepted route 10 only defines splinters.
  - The brief states Theorems 1.1 and 1.2 exactly.
  - It now names its imports with titles, StableReduction layers 2 and 4 among them.
  - It cites BHATT-ETAL-23's route as accepted, not pending.
  - It records Remarks 1.3 and 5.5.

## 4. Source findings

**E1–E10 are confirmed.**
- **E1** is checked on the p. 11 image: Proposition 6.2 needs surjectivity. v1 prints the same statement. Dospinescu's Bourbaki exposé 1201 and André's ICM survey restate only Theorem 1.2.
- **E2, E3, E9 and E10** are checked at their locators. E2 and E3 now carry the G1 caveat that the other findings have.
- **E4–E8** are misprints in André's adjacent paper, checked in its v1 and published texts:
  - E5–E8 duplicate PAPER-ANDRE-18-B/E11, E1, E2 and E10.
  - E4 is not recorded there.
  - E6's locator is "Proposition 5.2.1(3)" in v1, not "Lemma 5.2.1".

**E11–E25 are new.** Each is checked on the rendered page or the text layer, and against v1.

| id | kind | where | finding |
|---|---|---|---|
| E11 | misprint | Lemma 2.6 proof, p. 5 | Kos(…; g·T_i − f) for f_i (also in v1) |
| E12 | misprint | Lemma 2.6, p. 5 | the second assertion needs a rational presentation; for f₁ = g = 0, A⟨0/0⟩ is undefined |
| E13 | misprint | Proposition 5.2(1), p. 8 | "integral perfectoid K-algebra" for K°-algebra |
| E14 | gap | Theorem 5.4 proof, p. 10 | "as A0 is p-adically complete", although the reduction never completes (see below) |
| E15 | gap | Theorem 6.1 proof, p. 11 | "We may assume A0 is a regular local ring" drops the mixed-characteristic and completion reductions |
| E16 | misprint | §1.4, p. 3 | in characteristic p nothing excludes t = 0 or t = 1 |
| E17 | misprint | [Sh], p. 12 | JPAA 220 is 2016, not 2014 (Crossref) |
| E18 | misprint | [An1], p. 11 | "La lemme" for "Le lemme d'Abhyankar perfectoïde" |
| E19 | misprint | [SW], p. 12 | "Scholze?s" |
| E20–E25 | misprint | pp. 2–10 | six word slips ("like this show", "for for", "characterisitic", "reduce us almost", "ramificiation", "enough show … easy see") |

**E14.** The proof of Theorem 5.4 reduces to "a noetherian regular local ring of mixed characteristic (0, p)". It then uses Hom(Q0, A0[1]) ≃ lim_m Hom(Q0, A0/p^m[1]) "as A0 is p-adically complete". Proposition 5.2's "we may assume that A0 is complete" is internal to its own proof.

Take A0 = Z_(p)[x]_(p,x) and B0 = A0 × A0/(x). Then:
- Q0 ≅ A0/(x);
- Ext¹(A0/(x), A0) ≅ Z_(p);
- Ext¹(A0/(x), A0/p^m) ≅ Z/p^m, whose limit is Z_p.

So the displayed map is Z_(p) → Z_p, injective but not onto. Only injectivity is used, which Krull gives, or one completes first.

The order matters. For p ≡ 1 mod 4, Z_(p) ⊂ Z_(p)[i] is a finite domain extension whose completion Z_p × Z_p is not a domain. So the domain reduction of E9 must come after completing.

In v1 the sentence was right: its A0 was p-adically formally smooth, hence complete.

**E15.** The printed reduction omits the mixed-characteristic and completion steps, and why a derived splitting can be checked locally. v1's proof of Theorem 6.1 had them: it opens "By [Bh1], we may assume that A0 does not contain a field" and reduces to complete regular local rings.

The item derived-local-reduction supplies the missing argument. The cone of A0 → RΓ(X0, O) is pseudo-coherent, so its splitting class commutes with flat base change (Stacks 0A6A, Lemma 15.101.2(3); 02KH, flat base change).

## 5. Other fields

- **`sourceVersions`** is added: arXiv v2 and v1, with the published text recorded as unobtainable. E1 affects a stated result, so PROTOCOL §18 requires the field. `collation.py` now classifies the paper as read in preprint.
- **`summary`** is rewritten. It still said "partial", "eight … unreviewed" findings, and G1–G9 open.
- **Boundaries 2, 5 and 7** are corrected:
  - boundary 2 now cites the accepted route 10;
  - boundary 5 no longer counts the findings;
  - boundary 7 no longer imports SF.4 into R2.
- **Prerequisites.** Three stale `why` texts now agree with G2, G3 and G7.
- **Requests.**
  - The SF.2 request is dropped.
  - The R2 and SF.4 requests are rewritten as in route 6.
- **Gaps.** G2, G4, G5, G6 and G8 gain review sentences. G5 lists the new items, and G8 says where the removed remarks went.
- **PAPER-BHATT-18.md** gains a post-review summary and the current route table. The historical tables are marked as such.

## 6. For the orchestrator

- **Links needed.** Three, and none closes a cycle:
  - DerivedDeRhamCohomology:DD.1 → PerfectoidSpaces:P2, for derived-rational;
  - EnhancedDerivedSheaves:E2 → DeformationAndDerivedPatchingAlgebra:R03.1, for hom-pro, unless R03.1 states the notion itself;
  - StableReduction layer 4 → SchemeAndStackFoundations:SF.4, for the blowup.
- **Ownership moves.**
  - CC.2 and D7 should import E2's derived inverse limit and Milnor sequence.
  - AdicCoefficientsAndComparisons L5 should import SF.4's non-Noetherian flattening.
- **Adjacent findings.** E4 belongs in PAPER-ANDRE-18-B, and E5–E8 duplicate it. The register lists all five under Bhatt's heading; they are kept here, cross-referenced, until the maintainer decides.

## 7. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-18.result.json`: ok.
- `source_issues.check_issues` and `check_errata.versions_checked` on the file: no errors.
- **Item graph.** All prerequisites resolve and the graph is acyclic. Every gap, request and route names existing items. Every missing item is routed exactly once.
- **Intake file validation** on the four deliverables: 0 problems.

Pre-review inputs at `2de163a3055031b4e7e99a65dc0407e1a5771837` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| PAPER-BHATT-18.result.json | `9b220bde32fd67a328de1dc68c87022ab442b69bce2ad09424b00467b89b73de` |
| PAPER-BHATT-18.md | `02ad0a2a585ea265985fe6ce80255f070e9eb28659f68f7ac1e844f403601d7f` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

No Lean file is a deliverable, and no Lean was run.
