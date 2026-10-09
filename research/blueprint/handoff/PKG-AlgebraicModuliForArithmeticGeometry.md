# PKG-AlgebraicModuliForArithmeticGeometry — complete package

Worker session `cc-49e71f` (Claude Code), 9 October 2026, branch `cc-49e71f`. Packaging run under
the short pipeline (no issue, no GitHub interaction). Deliverables:

- `research/blueprint/packages/AlgebraicModuliForArithmeticGeometry/README.md` (186.8 KB; hard cap 200 KB)
- `research/blueprint/packages/AlgebraicModuliForArithmeticGeometry/Suggested.lean` (403 KB, 8,897 lines; elaborates with `sorry` as the only warning, see below)
- `research/blueprint/packages/AlgebraicModuliForArithmeticGeometry/metadata.toml` (`topic = "math.AG"`)
- this note

## Inputs and how they were folded

- The only packet of this roadmap is `AlgebraicModuliForArithmeticGeometry--A0-extension.json`
  (accepted 2026-10-05); its scope is the whole roadmap (A0-extension and R09.1–R09.7), and there is
  no base `AlgebraicModuliForArithmeticGeometry.json`. It carries 476 nodes: A0-extension 6, R09.3 38,
  R09.4 431 (12 definitions, 131 constructions, 2 comparisons, 21 theorems, 264 lemmas, in 18
  strands), R09.5 1; R09.1, R09.2, R09.6 and R09.7 are unread in the packet. No follow-up packet
  (`--A0-extension-2`, `--R09.1` … `--R09.7`, `--R09.7a`) existed at packaging time; nothing was
  waited for.
- README layers R09.3, R09.4, R09.5 (T510) and A0-extension (T527–T532) were generated from the
  packet (statement, hypotheses, API, tests, source, prerequisites) and edited into upstream prose.
  Numbering is T001–T581 in build order with fixed ranges per layer: R09.1 T001–T010, R09.2
  T021–T029, R09.3 T041–T078, R09.4 T079–T509, R09.5 T510–T520, R09.6a T521–T526, A0-extension
  T527–T545, R09.6b T546–T556, R09.7 T557–T581 (gaps between ranges are intentional).
- Layers R09.1, R09.2, R09.5 (beyond T510), R09.6, A0-extension (beyond T532) and R09.7 had no plan;
  their targets were written at target level from the atlas stage descriptions and the sources those
  descriptions name (Nitsure, EGA, Hartshorne, Mumford, Stacks for R09.1–R09.2; Abramovich–Corti–Vistoli,
  Romagny, Katz–Mazur, Stacks for R09.5; Stacks 15.51/16.13 and Artin 1969 for R09.6a; Stacks
  30.22, 36.32, 99.10–99.11, 98.14–98.17, Artin 1974, Kleiman, Knutson for A0-extension; Stacks 98.3–98.12
  and Artin 1969 for R09.6b; Bierstone–Milman 1997, Kollár 2007, Włodarczyk 2005 for R09.7).
  Stacks tags cited there were fetched and verified at packaging time; locators from printed books
  that could not be checked against a copy are listed under "Locators to verify" below.
- The packet's restructure proposal (split R09.6 so that approximation precedes Artin's criterion)
  is adopted: the README has R09.6a (approximation, before A0-extension) and R09.6b (deformation
  comparisons and algebraisation, after it). The atlas edge R09.6 → A0-extension is therefore
  R09.6a → A0-extension → R09.6b.

## What the README is, and what it could not carry

- Full entries (statement, hypotheses, API names, tests with kinds, source, prerequisites) for every
  definition and theorem of the packet and for every hand-written target.
- Constructions and comparisons of R09.4 (133) are one-line entries: statement cut at a sentence
  boundary, number and kinds of tests, source locator; their API names are in `Suggested.lean`
  (the packet remains the record of their API statements and prerequisites). The 264 R09.4 lemmas
  and 20 R09.3 lemmas are listed by number and title in "Lemmas:" lines after the construction they
  support; their statements are in the packet and their signatures in `Suggested.lean`.
- Strands (18 in R09.4) carry one standing-hypotheses line (the most common hypothesis set of the
  strand, cut at 230 characters); members with other hypotheses are specified by the packet.
- Lean names are written relative to `TauCeti.AlgebraicGeometry`; the packet's full names drop that
  prefix.

## Duplication against Tau Ceti: removed and cited instead

Checked against the current upstream roadmaps (`TauCetiRoadmap/*/README.md`, including the nine newer
than the atlas snapshot) and the current library (Tau Ceti a91d3aaf), by object as well as by name.
Nothing in the packet's 476 nodes duplicates a library declaration: the library has no gerbes,
no algebraic spaces or stacks, no Hilbert/Quot/Grassmannian schemes, no relative Picard sheaf, no
Artin approximation and no resolution. The atlas stage descriptions, however, planned several notions
that SchemeAndStackFoundations (tier 2, accepted package) and the upstream roadmaps now own; these are
not targets and appear only in "Prerequisites and boundaries":

- algebraic spaces, étale equivalence-relation quotients, presentations, fibre products, small étale
  sites, quasi-coherent modules on spaces, fppf descent of spaces → `SF.1/algebraic-space`,
  `SF.1/etale-quotient-theorem`, `SF.1/space-presentation`, `SF.1/space-fibre-products`,
  `SF.1/small-etale-site`, `SF.1/space-quasi-coherent`, `SF.1/space-fppf-descent` (atlas R09.3);
- categories fibred in groupoids, stackification, representable diagonals, atlases, algebraic and
  Deligne–Mumford stacks, quotient stacks and their algebraicity → `SF.1/stack-in-groupoids`,
  `SF.1/stackification`, `SF.1/representable-stack-morphism`, `SF.1/algebraic-stack`,
  `SF.1/deligne-mumford-stack`, `SF.1/quotient-stack`, `SF.1/quotient-stack-algebraic` (atlas R09.4);
- coarse moduli spaces, Keel–Mori, tame stacks and their base change, coarse spaces of finite
  quotient stacks → `SF.1/coarse-moduli-space`, `SF.1/keel-mori`, `SF.1/tame-stack`,
  `SF.1/tame-local-structure`, `SF.1/finite-quotient-coarse` (atlas R09.5);
- Hilbert and Quot schemes with fixed Hilbert polynomial, the Grassmannian scheme, Chow's lemma →
  `SF.4/hilbert-scheme`, `SF.4/grassmannian-scheme`, `SF.4/chow-lemma` (atlas R09.1–R09.2);
- deformation functors, Schlessinger, hulls, obstruction theories, Grothendieck existence and
  algebraisation, formal schemes → `SF.4/deformation-functor`, `SF.4/schlessinger-theorem`,
  `SF.4/hull`, `SF.4/obstruction-theory`, `SF.4/grothendieck-existence`,
  `SF.4/grothendieck-algebraization`, `SF.4/formal-scheme` (atlas R09.6, A0-extension);
- G-rings, Néron–Popescu, excellence, finiteness of normalisation → `SF.0/g-ring`,
  `SF.0/popescu-desingularization`, `SF.0/excellent-ring`, `SF.0/nagata-normalization-finite`
  (atlas R09.6, A0-extension);
- modifications, flattening by blowup, strict transforms, strict normal crossings divisors →
  `SF.4/modification`, `SF.4/flattening-by-blowup`, `SF.4/strict-transform`,
  `SF.4/strict-normal-crossings` (atlas R09.7a); the blowup as relative Proj of the Rees algebra with
  universal property, charts and exceptional divisor → StableReduction Layer 4 and Tau Ceti
  `TauCeti.AlgebraicGeometry.affineBlowupι`, `reesAlgebra.grade`, `Ideal.affineBlowup` (atlas R09.7a);
- the projective bundle P(E) with O(1) → `SF.5/projective-bundle`; relative Proj and its base change →
  `SF.0/relative-proj`, StableReduction Layer 2 (atlas R09.1);
- the relative Grassmannian of a Hopf algebra and Weil restriction / Hom schemes of finite locally
  free group schemes → ModularCurves 0G, 0F (atlas R09.1–R09.2);
- the rigidified Picard functor → Tau Ceti `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor`,
  `RigidifiedLineBundle` (library a91d3aaf; the A0-extension targets use them as carriers and
  state the sheafification over an algebraic-space base, which the library does not have);
- the second cohomology class of a given abelian-banded gerbe → `SF.2/gerbe-h2-class`; R09.4 keeps
  Giraud's bijection with its lifting-gerbe inverse and states the difference.

Kept variants, each stating in one clause how it differs: `R09.1/grassmannian-scheme-api` and
`R09.1/relative-grassmannian-functor` (API and comparison with Mathlib's `Module.Grassmannian.functor`
and ModularCurves 0G over the SF.4 construction); `R09.2/projective-domination-of-proper` (the
corollary of Chow's lemma used, not the lemma); `R09.5/finite-inertia-coarse-comparison` (the
identification with ModularCurves 9D only); `A0/picard-functor-algebraic-space` (differs from
`SF.3/picard-scheme-without-point`, curves only); `R09.6b/formal-object` (versality and
effectivity for a stack, over SF.4's hulls).

## Moved-down notions and citation checks

The roadmap sits in tier 4. Every roadmap it cites is lower: SchemeAndStackFoundations (tier 2),
ModularCurves, StableReduction, JacobianChallenge, AlgebraicVectorBundles (upstream, merged),
AdicSpacesPartII and DiamondsAndVStacks (tier 3 bundle). The packet's node prerequisites cite only
SchemeAndStackFoundations (27), DiamondsAndVStacks D0 (20) and JacobianChallenge Layer A (2); no
citation points upward, so nothing moved down into this roadmap. ReductiveGroupsPartII (tier 1)
cites R09.1 (Weil restriction and the Deligne torus); that notion moves down into
ReductiveGroupsPartII per the order file and is not planned here.

## Lean

`Suggested.lean` = the packet's suggested file (9,897 lines, 1,161 declarations, 470 examples)
restructured into TauCetiRoadmap form (imports first — `import Mathlib` plus the two Tau Ceti modules
used — one module docstring, namespace `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry`
re-opened per block, `theorem` for `lemma`, layer section comments, all process comments and
omission ledgers removed, "Packet:" prefixes stripped from docstrings), plus new representative
signatures for R09.1 (Grassmannian conventions, Hilbert function and Hilbert–Serre), R09.2 (the
dual-number flatness non-example), R09.6a (`HasArtinApproximation`), A0-extension (the relative
Picard presheaf on `LineBundleClass`) and R09.7 (`Ideal.orderAt`, `MarkedIdeal`, cosupport and its
closedness, derivative ideals and maximal contact, non-embedded resolution), and a closing comment
naming the statements the README has that are not typed.

Compilation: the swarm's `lean-check` tool on `Suggested.lean` → exit 0, 1054 warnings, all `declaration uses sorry`, 0 errors (run of 2026-10-09, environment Tau Ceti f790474 + Mathlib 082e2d3).
The original packet file compiled in the same environment (exit 0, 880+ `sorry` warnings, no
errors) before restructuring. Two universe re-declaration errors from the splice were fixed. The
`set_option backward.isDefEq.respectTransparency false` lines of the packet file are kept. The
Tau Ceti modules for the rigidified Picard functor and the blowup charts are not compiled in the
pinned build (f790474 predates them), so they are cited in the README but not imported.

Form deviations from the AdicSpaces model: the namespace is re-opened per block instead of once
(the packet file's blocks carry their own `variable`/`universe` scopes and could not be merged
without re-elaborating 9,000 lines); layer comments follow the file's topical blocks (R09.4 core,
R09.3, R09.4 continued) rather than the README order for the packet part; new layers are in order.

## Locators to verify

The following locators in hand-written targets were cited from the texts' standard numbering and
could not be checked against a copy at packaging time:

### R09.1-2

- EGA I (1971, Springer) §9.7 (Grassmannians, cited by Mathlib as EGA I.9.7.3), §9.8 (Plücker), §9.9 (flags): section numbers and titles not re-checked; 9.7.9.1 is not used.
- EGA II §4.2, EGA III §7.9: section level only.
- Hartshorne 1977, Prop. II.7.12, Ex. III.8.4, Ex. III.5.2, Thm. I.7.5, Thm. III.9.9: from memory.
- Nitsure 2005: Thm. 2.3, Thms. 6.5–6.6 and the §5 subsection "Embedding Quot into Grassmannian" read from the ar5iv rendering; the Aut exercise after Thm. 6.6 has no number there.
- Grothendieck FGA exposé 221 §3, §4.c; Kleiman 2005 Thm. 9.4.8; SGA 1 XII Thm. 4.4; Serre GAGA §3: from memory.
- Stacks tag 0CZX is Section 99.9 "The Hilbert functor", not a lemma; the degree-one claim is derived from Lemma 99.9.2 (0D00) with Lemma 10.16.4 (05G8). All other Stacks tags cited were fetched and checked.

### R09.5-6-A0

- Abramovich–Corti–Vistoli 2003 Theorem 5.1.5; Romagny 2005 Theorem 5.1: numbers not verified.
- Katz–Mazur 1985 Corollary 2.7.2; Mumford GIT Chapter 7 §2: not verified.
- Artin 1969 (IHÉS 36) Theorem 1.10: not verified; the "Corollary 2.6" of the brief is cited at section level ("section 2").
- Artin 1969 "Algebraization of formal moduli I" Theorem 1.6; Artin 1974 Theorem 5.3: not verified.
- Hartshorne III.12.8, III.12.11; Mumford AV §5 Corollaries 1–2: from memory.
- Kleiman 2005 §9.6 and SGA 6 XIII §4 (openness of `Pic^τ`): section level only.
- Knutson 1971 Ch. I §5; Artin 1970 §7 (analytification): section level only.
- Stacks: section 35.37 has no "finite" lemma (only 0245 affine, 03I0 closed immersion); T520 uses 0245 + 02LA. No Stacks semicontinuity lemma was located; T534/T535 cite Hartshorne/Mumford.

### R09.7

- Kollár 2007, Chapter 3: section titles from memory; numbers not verified.
- Włodarczyk 2005: §1–§3 titles verified (JAMS listing); item numbers not verified.
- Bierstone–Milman 1997: Theorems 11.14, 12.2, 13.2 as given; Ch. II §4–§5, Ch. IV §11, §13 titles verified (arXiv contents); Ch. II §6, Ch. I titles not verified.
- Deligne Hodge II §3.1/§3.2, Griffiths–Harris Ch. 0, Borel 1972 Thm A: not verified.

## Checks

- `python3 research/blueprint/intake.py check-files <the four files>` → 0 problems (4 files).
- README: 186.8 KB, no local filesystem paths, every T-number unique, no dangling T-references, all
  anchors (`r09-1` … `r09-7d`, `a0-extension`) present.
