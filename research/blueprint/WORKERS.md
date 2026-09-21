# Working on the Tau Ceti Atlas roadmaps

You are one of several workers (Claude Code, Codex, ChatGPT and others)
developing the proposed roadmaps of the Tau Ceti Atlas. The work comes as
GitHub issues in [CBirkbeck/tauceti-explorer](https://github.com/CBirkbeck/tauceti-explorer/issues),
one job per issue. Several workers run at once, so follow the claiming rules
exactly.

## The goal

Every proposed roadmap becomes a plan with no gaps, from what Mathlib and Tau
Ceti already contain to its targets, at the density of the upstream Tau Ceti
roadmaps. Every definition gets an API outline and unit tests, each roadmap
gets a suggested Lean file, and the workers choose each layer's planets for the
atlas.

**Roadmaps build on each other and never duplicate one another.** A Tau Ceti
roadmap is existing work: it is never re-planned here, only built on. What
another roadmap plans is imported, never planned again. Where more is needed in
an existing roadmap's direction, it becomes "<that roadmap>, Part II". The rules
are in [PROTOCOL.md](PROTOCOL.md), section 15.

## What the roadmap work is

For each roadmap, go through the papers it is built on, find every definition
and every key theorem, and outline each one in the roadmap. Give every
definition unit tests and a planning API. Derive the API by looking at where
and how the definition is used, in the papers and in the roadmaps that build on
it. The maintainer's examples show the granularity expected:

- **Prismatic cohomology** (Bhatt–Scholze and what it rests on): prisms,
  δ-rings, the prismatic site, Theorem 1.8 of Bhatt–Scholze (the crystalline,
  Hodge–Tate, de Rham and étale comparisons) and their Theorem 1.18,
  semiperfectoid rings, derived completion, perfectoidization, the cotangent
  complex, derived prismatic cohomology, the décalage functor, almost purity,
  quasisyntomic sheaves, q-crystalline cohomology (compared with Habiro
  cohomology), A_inf and Breuil–Kisin cohomology, divided power algebras and
  envelopes, the ∞-category of simplicial commutative rings and the
  ∞-categorical derived categories the paper needs, and the Koszul complex.
- **Modularity of abelian surfaces** (Boxer–Calegari–Gee–Pilloni,
  arXiv:2502.20645, building on arXiv:1812.09269 and on the ten-author paper
  arXiv:1812.09999): higher Coleman theory, abelian surfaces and their
  polarizations, cuspidal automorphic representations of GL4 over Q and of the
  other reductive groups used, with their L-functions, the Sato–Tate
  conjecture, locally symmetric spaces with the Borel–Serre compactification
  and boundary cohomology, the Hecke algebras needed for the modularity
  results, Caraiani–Scholze, decomposed generic representations, and
  deformation theory.

These lists are examples, not the whole job: a worker finds everything the
papers use.

Check the pinned libraries before planning anything. A name search on 21
September 2026 found the following; confirm each at the pinned commits before
relying on it.

- **Already there:** derived categories of abelian categories
  (`DerivedCategory`), divided powers and the divided power algebra
  (`DividedPowers`, `DividedPowerAlgebra`), Witt vectors, condensed sets and
  modules, simplicial objects, quasicategories (`SSet.Quasicategory`), adic
  completion, the naive cotangent complex (`Algebra.Extension.H1Cotangent`) and
  abelian varieties (Tau Ceti).
- **Not found:** divided power envelopes, the Koszul complex, the full
  cotangent complex, δ-rings, prisms, perfectoid rings, derived completion,
  animated (simplicial commutative) rings, stable ∞-categories, and the
  Borel–Serre compactification.

When a general notion like the Koszul complex is missing, find every place the
atlas needs it, and plan it once, as generally as those uses require, in the
roadmap that owns it (PROTOCOL.md section 15).

## Choosing a job

1. List the open issues labelled `swarm` and `state:available`. Never take one
   labelled `state:blocked`, `state:claimed` or `local-only`.
2. Take jobs in this order, and vary your choice among equal candidates rather
   than always taking the lowest issue number:
   1. `kind:restructure`: restructure a family of overlapping roadmaps. Most
      blueprints wait for these.
   2. `kind:naming`: name the planets of a batch of roadmaps, so that the atlas
      shows key definitions and named theorems ("Potential automorphy
      theorem"), not source locators or sentence fragments. These jobs are
      quick, and they improve the map at once.
   3. `kind:review`, when its input exists: an independent check of another
      worker's job. Never review your own work.
   4. `kind:blueprint`: plan one proposed roadmap, or one part of a large one.
   5. `kind:link` and `kind:design`.
3. Read the whole issue: its "What this issue delivers" section, and the full
   instructions inside it.

## Claiming

1. Comment `/claim <agent> — <session id>` on the issue, for example
   `/claim Claude Code — cc-3f9a2b`. Keep the same session id throughout.
2. Wait for the bot's reply, then re-read the issue. Start only if the reply
   confirms that **your** comment won the claim.
3. Hold one claim at a time.
4. If you must stop before finishing, save your work, submit it as a
   checkpoint with a handoff note, and comment `/unclaim`.

## Doing the work

- The binding rules are [PROTOCOL.md](PROTOCOL.md), especially sections 3–4
  (closure and API), 9 and 15 (structure: build on, never duplicate), and 12–14
  (unit tests, the suggested Lean file, and planets). Also follow
  [research/expansion/PROTOCOL.md](../expansion/PROTOCOL.md) (faithfulness to
  sources) and [UPSTREAM_GUIDE.md](UPSTREAM_GUIDE.md) (upstream's roadmap
  checklist).
- The pinned libraries are Mathlib 082e2d3 and Tau Ceti f790474. Read a
  declaration's statement at those commits before citing it. Read the
  roadmap's reviewed library audit (`data/library-coverage.json`) before
  planning anything: never plan what the libraries already contain.
- With a clone of the repository, run `python3 scripts/check_blueprint.py
  <packet>` until it reports no errors. If you have Lean at the pinned
  commits, make the suggested file elaborate, with `sorry` as its only warning.
- From a browser, follow [BROWSER_AGENTS.md](BROWSER_AGENTS.md). The atlas data
  is split into small files under `research/blueprint/atlas/`.
- Depth comes before breadth. Record what you could not establish as gaps,
  never paper over them, and never claim that anything is formalised.
- Edit only the files the issue names, plus your own scratch space.

## Submitting

- Open a pull request from a branch named after your session id, adding only
  the job's deliverables. In the pull request, write "Refs #N", never "Closes
  #N", and say which agent did the work, which checks you ran, and whether the
  Lean file compiled.
- If you cannot open a pull request, attach the files to a comment on the issue
  (JSON and Markdown as they are; Lean with `.txt` added to its name).
- The maintainer merges the work, integrates reviewed results into the atlas,
  and applies accepted restructurings. Workers never merge, close issues or
  change labels by hand.

## Stopping

Stop when no suitable job is available, or when you can no longer keep the
required depth. Before stopping, leave `research/blueprint/handoff/<JOB>.md`:
what is done, what remains, and where to resume.
