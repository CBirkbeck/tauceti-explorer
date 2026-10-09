# REV-PKG-AlgebraicModuliForArithmeticGeometry — fixing review

Reviewer: `independent-review-REV-PKG-AlgebraicModuliForArithmeticGeometry` (Claude Code session
`cc-87183b`), 9 October 2026. Package written by session `cc-49e71f`
(`research/blueprint/handoff/PKG-AlgebraicModuliForArithmeticGeometry.md`). Streamlined pipeline:
one fixing review; everything fixable was fixed in place, the rest is listed under "What remains".

Verdict: **accepted** (`review.json`). With the fixes below the package is ready for the draft PR.

## What was checked

1. **Form against the upstream bar.** Read `research/blueprint/UPSTREAM_GUIDE.md`, the upstream
   `AdicSpaces/Suggested.lean` model and the `ModularCurves`, `StableReduction`,
   `AlgebraicVectorBundles` READMEs. The README has the required shape (what it builds and why,
   prerequisites and boundaries, conventions, nine layers in build order with numbered targets,
   sources). Definitions carry API and three classified tests; theorems carry hypotheses; every
   target has a source locator and a "Needs" line.
2. **Sources.** Every locator the package author listed under "Locators to verify" (34 items over
   R09.1–R09.2, R09.5–R09.6–A0 and R09.7) was checked against a public copy where one exists
   (arXiv, Numdam, GDZ, Project Euclid, author pages), plus a sample of 73 Stacks tags and the
   Hartshorne/Mumford/Katz–Mazur/Knutson/SGA 6 book locators through public tables of contents
   and citing texts. Results and fixes are tabulated below.
3. **Gaps and citations.** All 62 `SF.k/slug` citations resolve to targets of
   `research/blueprint/packages/SchemeAndStackFoundations/README.md`; ModularCurves 0C/0E/0F/0G/4C/9D,
   StableReduction Layers 2 and 4, JacobianChallenge Layer A, AlgebraicVectorBundles L0A–L2B,
   AdicSpacesPartII F0/R3 and DiamondsAndVStacks D0 exist and say what the README attributes to
   them (AlgebraicVectorBundles explicitly leaves projective, Grassmann and flag bundles to a
   successor; StableReduction Layer 4 has the blowup with its universal property, flat base change,
   exceptional divisor, strict transform and charts). No upward citation, no
   `FoundationsAndLibraryIntegration` and no `UPSTREAM:` id. The Tau Ceti declarations cited as
   carriers exist at a91d3aaf: `rigidifiedPicardFunctor`
   (`TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:66`), `RigidifiedLineBundle`,
   `RigidifiedLineBundleClass` (`LineBundle/Rigidified/Basic.lean:74,198`), `LineBundleClass`
   (`LineBundle/Class.lean:50`), `affineBlowupι` (`Blowup/AffineCharts.lean:61`),
   `reesAlgebra.grade` (`RingTheory/ReesAlgebra/Grading.lean:57`), `Ideal.affineBlowup`
   (`RingTheory/Ideal/AffineBlowup.lean:60`), `SheafOfModules.IsInvertible`
   (`Algebra/Category/ModuleCat/Sheaf/Invertible/Basic.lean:72`).
4. **Unit tests.** Read every test of the hand-written layers (R09.1, R09.2, R09.5, R09.6a,
   A0-extension, R09.6b, R09.7) for discriminating power; one wrong computed value found and fixed
   (below). The packet-generated layers carry the packet's tests (kinds listed in the README,
   examples in `Suggested.lean`).
5. **Lean.** the swarm `lean-check` tool on `Suggested.lean`: exit 0, 1054
   `declaration uses sorry` warnings, no other diagnostic, both before and after the edits.
   Signatures spot-checked against the README: `IsGerbe` (groupoid fibres, local nonemptiness and
   local isomorphism by covering sieves, extends `IsStack`), `AbelianBanding` (pullback and
   conjugation equations), `BandPreserving` with full-faithful/essentially-surjective/equivalence
   theorems (T091–T093), `IsNeutral` and `Neutralization.pullback`, the Grassmannian degenerate
   cases (T004), `dualNumberPoint` and `not_flat_dualNumberPoint` (T022), `HasArtinApproximation`
   (T523), `relativePicardPresheaf` (T527), `Ideal.orderAt`, `MarkedIdeal.cosupport`,
   `derivativeIdeal`, `exists_maximalContact` (T557, T559, T564, T566), `exists_resolution` (T578);
   plus the 20-item sample of R09.4 constructions and lemmas (item 6). No `True` placeholder, no
   `def P : Prop := sorry` (the two `Prop` definitions, `IsNeutral` and `HasArtinApproximation`, have
   real bodies), no hypothesis containing its conclusion. Two statements were wrong or vacuous and
   were replaced (below).
6. **R09.4 sample.** 10 one-line constructions (T136, T146, T161, T186, T223, T273, T359, T406,
   T427, T507) and 10 title-only lemmas (T130, T160, T166, T178, T181, T207, T305, T435, T440,
   T446) compared with the packet `AlgebraicModuliForArithmeticGeometry--A0-extension.json` and
   with the Lean declarations named in the packet API. All 20 agree with the packet statements and
   hypotheses; 18 have their API declarations in `Suggested.lean` with the stated types (the
   `TorsorTwist.*` API of T136 and `AffineGerbeFactorization.*` of T129 are not typed and are now
   named in the closing comment). The one-line statements had been cut mid-word with an ellipsis
   rather than at a sentence boundary (77 entries); all were regenerated from the packet at a
   sentence boundary.
7. **Duplication.** Searched Tau Ceti a91d3aaf by object and by name (gerbes, bandings, descent
   data, Grassmannian and flag schemes, Hilbert polynomial and regularity, relative ampleness, Hom
   and Isom schemes, Artin approximation, henselian G-rings, rigidification, coarse spaces,
   normalisation of spaces, Picard stack, marked ideals, maximal contact, resolution,
   analytification) and the nine upstream roadmaps newer than the atlas snapshot plus `Completed/*`
   for the same objects. No target of this package exists there: the library has no gerbe, no
   algebraic space or stack, no Hilbert or Quot scheme, no relative Picard sheaf over a space, no
   Artin approximation and no resolution; the only Grassmannian mentioned in Tau Ceti is the
   homogeneous space of totally real subspaces in `LinearAlgebra/TotallyReal`. The removals the package author made (algebraic
   spaces and stacks, coarse spaces, Hilbert/Quot/Grassmannian schemes, deformation functors and
   hulls, G-rings and Popescu, modifications and strict transforms, P(E), the rigidified Picard
   functor, the H² class of a gerbe) point at real SchemeAndStackFoundations targets and real Tau
   Ceti declarations, listed in "Prerequisites and boundaries" only. Tau Ceti's
   `TauCeti/Algebra/Category/CommAlgCat/Fppf.lean` (the affine fppf site) is adjacent to R09.3 but
   is a site, not module descent, and is not duplicated.
8. **Own words, process language, paths.** No verbatim passages and no section-by-section
   summaries in the hand-written layers. Process residue removed (below).
   `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems; no
   `/home/` paths; README 196,142 bytes (cap 200 KB).

## Locator verification

Public copies read on 2026-10-09 (URLs in the package `Sources` section unless noted):
Nitsure arXiv:math/0504590, Kleiman arXiv:math/0504020, Abramovich–Corti–Vistoli
arXiv:math/0106211, Romagny (author's page), Borne–Vistoli arXiv:1610.07341v3, Artin 1969 (Numdam
PMIHES 36), Artin 1974 (GDZ, Invent. Math. 27), EGA II (Numdam PMIHES 8), EGA III₂ (Numdam PMIHES
17), Serre GAGA (Numdam AIF 6), SGA 1 XII (arXiv:math/0206203), FGA exposé 221 (Numdam Séminaire
Bourbaki 6), EGA I (1971) table of contents (third-party scan), Mathlib
`Mathlib/RingTheory/Grassmannian.lean:37`.

| Locator | Result | Action |
|---|---|---|
| Hartshorne II.7.12 (T001) | confirmed | — |
| EGA II §4.2 (T001) | confirmed; main statement is Prop. (4.2.3) | locator sharpened |
| EGA I (1971) §9.7 (T003, T004, T010) | confirmed: (9.7.3) defines the functor of locally free quotients, Thm. (9.7.4) represents it (Mathlib cites 9.7.3) | locators sharpened |
| EGA I (1971) §9.8 "Plongement de Plücker" (T005) | section right, title wrong: "Morphismes de Plücker et de Segre" | title fixed |
| EGA I (1971) §9.9 "Fibrés en drapeaux" (T006) | confirmed | — |
| Nitsure §1 "Construction of Grassmannian" (T003) | an unnumbered subsection of §1 "The Hilbert and Quot functors" | locator fixed |
| Nitsure Thm. 2.3 (T009, T026) | confirmed: Mumford's uniform bound F_{p,n}; Lemma 2.1 is the regularity lemma | Lemma 2.1 added |
| Nitsure Thm. 6.5, 6.6, exercise after 6.6 (T023, T025) | confirmed (6.5 openness of the isomorphism locus, 6.6 Mor as an open subscheme of Hilb; the Aut exercise is unnumbered) | — |
| Nitsure §5 "Embedding Quot into Grassmannian" (T026) | an unnumbered subsection, a step in the proof of Thm. 5.2 | locator sharpened |
| FGA 221 §3, §4.c (T023, T026) | confirmed: §4.c is Hom/Isom via graphs; the Grassmannian embedding is Lemme 3.3 and Prop. 3.8, boundedness from §2 | locators sharpened |
| Hartshorne Ex. III.8.4, Ex. III.5.2, Thm. I.7.5, Thm. III.9.9 (T002, T008) | confirmed (public lecture notes and errata citing them) | — |
| EGA III §7.9 (T008) | confirmed: Thm. (7.9.4) (χ locally constant), Prop. (7.9.11) (Hilbert polynomial); the converse over an integral base is not in EGA, it is Hartshorne III.9.9 | locator sharpened |
| Mumford 1966, Lecture 14 (T009, T026) | confirmed through Kleiman's citation "[Mm66, Lect. 14]" and catalogue tables of contents (title "Some vanishing theorems") | — |
| Kleiman 2005 Thm. 9.4.8 (T024) | confirmed (arXiv numbering Thm. 4.8): Pic_{X/S} represented by a separated scheme locally of finite type for X/S projective Zariski-locally, flat with integral geometric fibres | — |
| Kleiman 2005 §9.6 (T543) | confirmed; openness of Pic^τ is Thm. 9.6.16 | locator sharpened |
| SGA 1 XII Thm. 4.4 (T028) | confirmed (equivalence of coherent sheaves for proper X; cohomology is Cor. 4.3) | Cor. 4.3 added |
| Serre GAGA §3 (T028) | confirmed as the section; the theorems are n° 12 and the dévissage n° 13–17 | locator sharpened |
| Abramovich–Corti–Vistoli Thm. 5.1.5 (T512, T513) | confirmed, but H must be commutative there and the morphism is smooth surjective f.p.; the inertia-quotient clause is not in 5.1.5 | statements and attributions corrected (Romagny for the normal case and the gerbe property) |
| Romagny 2005 Thm. 5.1 (T511–T513) | confirmed; section title is "Rigidifications" (§5) | title fixed |
| Borne–Vistoli 2019 Prop. 3.9, pp. 8–9 (T510, T131, T132) | confirmed | spacing fixed |
| Artin 1969 (IHÉS 36) Thm. 1.10 (T526) | confirmed, but for the henselisation of a finite-type R-algebra at a prime and any proper ideal; the "section 2 corollary" on algebraic power series does not exist (§2 "Variant assertions" has no such statement) | statement and source rewritten; Thm. (1.12) cited for the functorial form |
| Artin 1974 Thm. 5.3 (T540, T542) | confirmed as the stack criterion, but its conditions are (1)–(4) with an obstruction theory; the axioms [-1]–[5] are Stacks' numbering | attribution clarified |
| Katz–Mazur 2.7.2, 4.7.0; Mumford GIT Ch. 7 §2; Knutson Ch. I §5; Artin 1970 §7; SGA 6 XIII §4; Hartshorne III.12.8, III.12.11; Mumford AV §5 Cor. 1–2 | see "Books" below | |
| Bierstone–Milman 1997 Thms. 11.14, 12.2, 13.2, Ch. II §4–§6, Ch. IV §11, §13; Włodarczyk 2005 §1–§3; Kollár 2007 Ch. 3 section titles; Deligne Hodge II §3.1–3.2, 4.4.3; Borel 1972 Thm. A; Griffiths–Harris Ch. 0 | see "R09.7" below | |
| Stacks tags (73 sampled) | see "Stacks" below | |

### Books (public tables of contents and citing texts; read 2026-10-09)

| Locator | Result | Action |
|---|---|---|
| Katz–Mazur 1985, Cor. 2.7.2 (T516, T517) | confirmed: rigidity of level-N structures, N ≥ 3 (p. 85) | — |
| Katz–Mazur 1985, 4.7.0 (T516, T517) | confirmed: representable iff rigid, for relatively representable affine P (p. 111) | — |
| Mumford GIT, Chapter 7 §2 (T516) | wrong: "Abelian schemes" is Chapter 6; the n ≥ 3 rigidity (Serre's lemma) is only cited, not proved, in GIT (3rd ed. p. 139, Ch. 7 §3) | source rewritten: Serre's lemma cited through GIT p. 139, Katz–Mazur for elliptic curves |
| Mumford AV §5 Cor. 1 (T534) | confirmed (semicontinuity, p. 50) | — |
| Mumford AV §5 Cor. 2 (T535) | wrong statement: Cor. 2 is Grauert's criterion over a reduced base; the III.12.11-type criterion is Cor. 3 | fixed |
| Hartshorne III.12.8, III.12.11 (T534, T535) | confirmed | — |
| Knutson 1971 Ch. I §5 (T545) | confirmed: the analytic space of an algebraic space is I.5.17 ff. | locator sharpened |
| Artin 1970 (Annals 91) §7 (T545) | section titles not public; Thm. 7.3 (analytification of proper spaces) is cited there by Conrad–Temkin | locator sharpened and marked "not verified against a copy" |
| SGA 6 XIII §4 (T543) | confirmed: Thm. 4.7 (i) Pic^τ → Pic an open immersion, (iii) finite type | locator sharpened |

### R09.7 (Bierstone–Milman arXiv:alg-geom/9508005 = Chapter I only, with the full table of contents; Włodarczyk arXiv:math/0401401; Kollár's printed contents via the GBV scan and arXiv:math/0508332; Deligne on Numdam; Borel through two citing papers; read 2026-10-09)

| Locator | Result | Action |
|---|---|---|
| BM Chapter/section titles (Ch. I §3, Ch. II §4–§6, Ch. IV §11–§13) | confirmed from the paper's own contents | — |
| BM Theorems 11.14, 12.2, 13.2 | 13.2 confirmed (universal embedded resolution); 11.14 and 12.2 lie in the non-public chapters and no citing text names them | main results re-attributed to Thm. 1.6 (embedded desingularisation) and Thm. 1.10 (principalisation), which are in the public chapter; 11.14/12.2 kept only as "number not verified against a copy" |
| BM Chapter I for `ord` and `Cosupp` (T557, T558) | the order is Ch. I §3 (Lemma 3.10 for semicontinuity); "cosupport" is Kollár's term, absent from BM | locators fixed |
| BM Ch. II §4 monomial case (T563) | chapter not public | marked "section level, not verified" |
| Kollár Ch. 3 section titles (T559–T573) | §3.5 and §3.13 right; "Maximal contact and going down" is §3.8, "Uniqueness of maximal contact" §3.10, "Tuning of ideals" §3.11, and there is no "Restriction of derivative ideals" (§3.9 is "Restriction of derivatives and going up"; §3.7 "Birational transform of derivatives" holds the derivative ideals) | all K3 citations now carry the section number and the printed title |
| Włodarczyk §1–§3 (T559–T574) | section numbers were wrong: marked ideals are §2.1 (Def. 2.1.1), transforms §2.2, equivalence §2.5, derivative ideals §2.6 (Def. 2.6.1), maximal contact §2.7, homogenised ideals §2.9, coefficient ideals §2.10; canonical principalisation is Theorem 1.0.1 | all fixed |
| Deligne Hodge II §3.1, §3.2 (T579–T581) | compactification with NC boundary is (3.2.1), not §3.2 in general; polydisc charts are (3.1.2) and the proof of Prop. (3.1.9); 4.4.3 is about abelian schemes, not the independence of the compactification (that is Thm. (3.2.5)(ii)) | locators fixed; the consumer remark now names (3.2.5) |
| Borel 1972 Thm. A (T581) | paper not reachable (Project Euclid blocks fetches); two citing papers state Theorem A with the (Δ*)^k × Δ^{n−k} hypothesis | kept, marked "as cited by later work; the paper itself was not verified" |
| Griffiths–Harris Ch. 0 (T580) | chapter confirmed; the section holding the holomorphic inverse function theorem not visible in any public contents | kept at chapter level |

### Stacks tags (73 fetched; every tag resolves to the claimed chapter.section.number)

Content mismatches found and fixed: tag 0834 (Definition 67.17.3) is the scheme-theoretic closure
of an open, not the scheme-theoretic image of a morphism of spaces, which is Definition 67.16.2 (tag
082Y) — T519 now cites 082Y; Lemma 99.9.2 (0D00) is `Hilb = Quot` and Stacks has no lemma that
`Hilb¹` is represented by `X` — T022 now says the degree-one statement is derived from 0D00 and
05G8 and has no Stacks number; Example 16.13.3 (0A1W) contains the "henselisation = algebraic
elements" statement but not the `x² = 2` instance — T525 now says so. The A0-extension entries
T527, T530, T532 now carry their tags (0D25, 0D29/0D2B, 0D28). All other sampled tags (T002, T004,
T007, T008, T010, T021, T027–T029, T518, T520–T524, T533, T536–T542, T544, T546–T555) match their
claimed content.

## What was fixed

README (`research/blueprint/packages/AlgebraicModuliForArithmeticGeometry/README.md`):

- 77 one-line construction and comparison statements of R09.3 and R09.4 that had been cut mid-word
  ("… 3 tests") regenerated from the packet statements, cut at a sentence boundary, with the
  packet's process adjectives ("actual", "native", "existing", "pinned", "inherited") removed and
  article errors ("an Mathlib", "an morphism") corrected throughout.
- 11 "(+N)" residues in API and Needs lines expanded to the packet's names.
- 173 locators without a space after the kind ("Lemma 26.7.3", "p. 122", "pp. 8–9") normalised;
  "printed 123" page forms and the "GWZ20/GWZ19" abbreviations replaced by the bibliography's
  names.
- Planning language removed from hypotheses and statements: T101, T103, T105, T110, T111, T128,
  T132, T133 (its synchronisation hypothesis is now an explicit gap), T157, T188, T388 (truncated
  hypotheses restored from the packet), T094, T108, the `hom-sheaf` strand line.
- T556 `R09.6b/representability-export` deleted: a record "of the universal property each
  parameter space represents" is a catalogue, not a mathematical target; the layer table and
  R09.6b introduction no longer mention it.
- Conventions: the "build order" claim replaced by the true description (numbered by layer; the
  R09.4 strands T316–T509 supply lemmas that earlier targets of the layer cite).
- T009 test `RegularityTests.twoPoints` corrected: the ideal of two points in P² is 2-regular and
  not 1-regular (h¹(I) = 1), so "1-regular" was a false computed value.
- T526 restated with Artin's actual hypotheses (henselisation of a finite-type algebra at a prime,
  proper ideal, 𝔪-adic completion) and the algebraic-power-series case as the specialisation it
  is.
- T512, T513 restated and re-attributed per Abramovich–Corti–Vistoli 5.1.5 and Romagny 5.1
  (smooth surjective finitely presented projection, gerbe property, base change, equality of
  coarse spaces; the inertia description derived from the gerbe property).
- Source locators sharpened or corrected as in the tables (T001, T003, T004, T005, T008, T009, T010,
  T022, T026, T028, T511, T516, T519, T525, T527, T530, T532, T535, T540, T542, T543, T545 and the
  R09.7 items below).
- T557, T559, T564 API names aligned with the Lean declarations (`Ideal.orderAt`,
  `MarkedIdeal.cosupport`, `derivativeIdeal`).

Suggested.lean:

- `exists_hilbertPolynomial` was false as stated (its only hypothesis, a bounded growth of the
  Hilbert function, does not force eventual polynomiality); replaced by Hilbert–Serre for a
  finitely generated graded module over `MvPolynomial σ k` with the standard grading
  (`SetLike.GradedSMul (MvPolynomial.homogeneousSubmodule σ k) ℳ`, `DirectSum.Decomposition ℳ`),
  degree bound `Fintype.card σ - 1`.
- `relativePicardPresheaf_id_obj` was definitionally true (it restated the `obj` field); it now
  identifies the fibre of the identity presheaf with `LineBundleClass T.unop.left`.
- `MarkedIdeal.isClosed_cosupport` restricted to the README's setting (regular, finite type over a
  field of characteristic zero) instead of an arbitrary regular Noetherian ring.
- The "Layer R09.4" section comment that preceded the universe declarations and the R09.1 block
  moved to the start of the R09.4 block; comment-only process residue removed (packet ids
  `AlgebraicModuliForArithmeticGeometry:…` rewritten as target names, "source finding E12",
  "baseline facts", `…ReviewTests` namespaces renamed, the adjectives above); closing comment
  extended to name every README definition without a declaration (projective-bundle twists,
  relative gerbes, finite and profinite étale gerbes, locally full morphisms, canonical
  factorisation, torsor twists, inertia subgroup stacks, Picard stack, Artin axioms, transforms,
  maximal contact, the invariant, polydisc charts).

## Size and form

The maintainer's note of 2026-10-09 (READMEs are rewritten into upstream prose form at port time;
do not grow the catalogue) was followed: the README went from 191,257 to 196,142 bytes (+2.6%),
the growth being the sentence-boundary completion of the 77 truncated statements, the expansion of
the "(+N)" residues and the sharpened locators, offset by the deletion of T556. No entry was
expanded beyond restoring a hypothesis or a statement that the truncation had cut.

## What remains (not defects of the package; recorded for the maintainer)

- The R09.3/R09.4 layers keep the packet's form accepted for this package: constructions as
  one-line entries and 284 lemmas by title; their statements are in the packet and their
  signatures in `Suggested.lean`.
- `Suggested.lean` re-opens the namespace per block and keeps the packet file's
  `set_option backward.isDefEq.respectTransparency false` lines (needed for elaboration of the
  gerbe fixtures); the layer comments of the packet part follow the file's topical blocks.
- Book locators that no public copy can confirm are marked "(section level)" or "(not verified
  against a copy)" in the README rather than asserted: see "Books" above.
- The Tau Ceti modules for the rigidified Picard functor and the blowup charts post-date the
  pinned build (f790474) and are cited, not imported.
