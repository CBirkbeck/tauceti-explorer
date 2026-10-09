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

## The streamlined pipeline (2026-10-09)

The deliverable is a roadmap in TauCetiRoadmap's form: a README that states
each layer's targets, with every definition's API and at least three unit
tests a wrong definition would fail, a `Suggested.lean` that elaborates with
`sorry` as its only warning, and `metadata.toml`. The blueprint exists to plan
that roadmap well and to find gaps, not to plan every Lean declaration:

1. **Plan at target level** (PROTOCOL.md section 2; `detail.json`): one node
   per target and per definition or key theorem a target needs, each with its
   exact statement, hypotheses, source, API and unit tests, and prerequisite
   chains that end in Mathlib, Tau Ceti or another roadmap's layer. Smaller
   steps stay in the proof sketch. A roadmap is one job, not one job per layer.
2. **One review**, by a different agent, that corrects what it can rather than
   sending the plan back; it sends back only a plan with a real gap or error.
3. **Package** (section 20) as soon as the plan is accepted, then the
   maintainer opens the draft pull request on TauCetiRoadmap.

Red teams, fixes, attribution and source jobs run after a roadmap has gone
upstream, as follow-ups; they never hold a roadmap back.

**Never duplicate what TauCetiRoadmap already has.** The atlas's snapshot of Tau
Ceti's roadmaps (`content/tau-ceti/`) is older than
[TauCetiRoadmap main](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap):
AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups,
OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and
RealAlgebraicGeometry (and the Completed roadmaps ContourIntegration,
EffectiveBounds, OrthogonalL2Bases, RestrictedProducts) are not in the snapshot.
Before planning or packaging a target, check those roadmaps' `Suggested.lean`
and the current Tau Ceti library; what exists there is cited, never planned
again.

## Upstream tiers

The roadmaps go to Tau Ceti bottom-up, as roadmap packages (PROTOCOL.md
section 20): a README, a `Suggested.lean` and the unit tests of every
definition. A roadmap goes to Tau Ceti only once every roadmap it depends on is
already a Tau Ceti roadmap. The order is in
[upstream/CaraianiNewton.md](upstream/CaraianiNewton.md): the 94 roadmaps that
Caraiani–Newton needs, in tiers. Tightly coupled roadmaps form a bundle: each
keeps its own package, may cite the other roadmaps of its bundle, and goes to
Tau Ceti together with them in one pull request. The `top` list in `focus.json` is the current tiers. Finish their
plans, fixes and packages before anything else.

A plan in the current tier cites only Mathlib, Tau Ceti, roadmaps of its own
bundle and roadmaps of a lower tier (the order file lists, for each roadmap, the citations that point upward).
When it needs a definition or result that a higher roadmap plans, it plans that
notion itself, and the higher roadmap imports it from here: the notion moves
down. Never cite the higher roadmap. Record each move in your handoff note, so
that the higher roadmap's plan can be pointed at its new owner.

A package (PROTOCOL.md section 20) cites, for each target, only Mathlib, Tau
Ceti, its own layers, the other roadmaps of its bundle and the layers of
lower-tier packages. Two citations are
replaced as the package is written:
- `FoundationsAndLibraryIntegration` is bookkeeping for "what the libraries
  already have", not a roadmap that goes to Tau Ceti. Replace each of its stage
  ids by the Mathlib or Tau Ceti declaration, or the Tau Ceti roadmap, that it
  stands for (`LI.4` for class field theory is Tau Ceti's ClassFieldTheory).
  Mathematics it names that neither library has is planned in the package.
- An `UPSTREAM:` reference becomes the Tau Ceti roadmap it names.

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

New papers arrive in batches (`research/blueprint/papers/papers.json`), one
`kind:paper` job each. The papers routed so far are listed there as worked
examples: a paper whose results fall inside existing layers becomes a source of
those layers (Balakrishnan–Dogra–Müller–Tuitman–Vonk for quadratic Chabauty);
one that needs new layers in an existing roadmap's direction becomes a Part II
of that roadmap (Pan, Skinner, Betts–Stix); one with no existing direction
becomes a new roadmap (Lawrence–Venkatesh, Boxer–Calegari–Gee–Pilloni).

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
   labelled `state:blocked`, `state:claimed`, `state:submitted` or `local-only`.
2. Take issues labelled `top` first, then the other issues labelled `focus`.
   `focus` issues belong to the roadmaps the maintainer wants finished next
   (`research/blueprint/focus.json`): their plans, reviews, revisions,
   assemblies and fixes. `top` issues are the `focus` issues of the areas the
   maintainer has put ahead of all the others (the file's `top` list). Among
   the `top` issues, then the other `focus` issues, and then the rest, take
   jobs in this order, and vary your choice among equal candidates rather than
   always taking the lowest issue number:
   1. `kind:review` of a finished plan, titled "[Review] Blueprint: …" or
      "[Review] New roadmap: …", when its input exists. A plan goes live only
      once its review accepts it, so finishing these comes before starting new
      plans. Never review your own work.
   2. `kind:package`, and its review, titled "[Review] Roadmap package: …": write a
      complete roadmap in Tau Ceti's own form, a README and a Suggested.lean that
      compiles (PROTOCOL.md section 20). It is the last step of a roadmap, and
      what turns a finished plan into a roadmap a reader can use, so it comes
      before any new planning.
   3. `kind:assembly`: join a roadmap's reviewed parts into one document and
      suggested file, with its introduction, notation and cross-part
      prerequisites reconciled. It is the last step before a roadmap is
      complete, so it comes before any new planning.
   4. `kind:restructure`: restructure a family of overlapping roadmaps. Most
      blueprints wait for these.
   5. `kind:blueprint` and `kind:design`: plan one proposed roadmap, or one
      part of a large one, or design a new roadmap from its brief. Start with
      the issues labelled `owns-key-definitions`: each owns key definitions
      that several papers need and no roadmap plans yet (PROTOCOL.md section
      19), listed in the issue. After the reviews of finished plans and the
      assemblies, planning comes before every other kind of work.
   6. `kind:naming`: name the planets of a batch of roadmaps, so that the atlas
      shows key definitions and named theorems ("Potential automorphy
      theorem"), not source locators or sentence fragments. These jobs are
      quick, and they improve the map at once.
   7. `kind:paper`: read one paper the maintainer has added and route its
      mathematics: every definition and key theorem it uses or proves, whether
      the libraries have it or a layer of the atlas plans it, and, for what is
      missing, a source of existing layers, a Part II of an existing roadmap
      or a new roadmap, with the brief its design job will follow
      (PROTOCOL.md section 16).
   8. `kind:keydef`: survey one area's key definitions, the notions that at
      least two of the atlas's papers need and the libraries lack. Each comes
      with what to define, its papers, owner, library status, dependencies,
      size and a sample API that tells a right formalisation from a wrong
      one (PROTOCOL.md section 19).
   9. `kind:fix`: apply red-team findings that a verifier has confirmed.
      Tau Ceti's own roadmaps, and the links between two of them, are never
      planned, fixed or reviewed here. Note what you notice there in
      `upstreamNotes`, for the maintainer. A fix
      to a roadmap's plan goes into that roadmap's blueprint packet, reader
      document and suggested file, which the issue lists among the
      deliverables, never into `content/campaign/` or `data/`. An independent
      `REV-FIX-…` review checks the fixes before they go live.
      `kind:errata`: record the mistakes in a published paper that its
      extraction found (PROTOCOL.md section 18).
   10. `kind:review` of anything else, when its input exists: an independent check of another
      worker's job, or a verification of red-team findings. Never review your
      own work.
   11. `kind:sources`: move one roadmap's citations off books a reader cannot
      obtain and onto sources anyone can read, without changing the mathematics.
      Your deliverable is the result file; the orchestrator applies the edits.
      These jobs are short, and what they leave restricted is the list of
      books the maintainer has to buy.
   12. `kind:redteam`: attack accepted work, or one area of the atlas, for
      errors, omissions and duplication (PROTOCOL.md section 17). Never
      red-team work you did or reviewed.
   13. `kind:attribution`: put a source on every layer of a roadmap that names
      none, freely readable wherever one exists, and credit its authors. Your
      deliverable is the result file; the orchestrator applies the edits.
   14. `kind:link`.
3. Read the whole issue: its "What this issue delivers" section, and the full
   instructions inside it.

## Claiming

1. Comment `/claim <agent> — <session id>` on the issue, for example
   `/claim Claude Code — cc-3f9a2b`. Keep the same session id throughout.
2. Wait for the bot's reply, then re-read the issue. Start only if the reply
   confirms that **your** comment won the claim.
3. Hold one claim at a time. Opening your pull request ends the claim: the
   issue turns `state:submitted`, and you may claim your next job. Do not
   `/unclaim` a job you have submitted.
4. If you must stop before finishing, save your work and submit it as a
   checkpoint with a handoff note; the job is released for the next worker
   when the checkpoint is merged. Comment `/unclaim` only if you stop without
   submitting anything. A claim that shows no progress for 24 hours (no
   comment, pull request or checkpoint) is released automatically.

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

## Scratch space and the shared machine

Many workers share one server, and its disk and memory have run out more than
once. Keep your footprint small:

- Keep one clone of the repository for all your jobs and bring it up to date
  between jobs (`git pull`). Never download, unpack or copy the repository, or
  a snapshot of it, for a job. A job's "Do not run git" means: never commit,
  rebase or push anything but your own job branch; reading and updating your
  clone is fine.
- Never set up your own Lake project, run `lake update` or `lake exe cache
  get`, or build Mathlib or Tau Ceti. Elaborate the suggested file only with a
  build at the pinned commits that already exists on your machine; if there is
  none, do not compile it, and say so in the pull request.
- Keep a job's scratch directory on disk and under 1 GB (source texts, notes
  and your worklist). `/tmp` may be memory rather than disk, so keep papers,
  extracted text, builds and logs out of it, including a tool's scratchpad
  under `/tmp`. Once the job's pull request is open, delete its scratch
  directory, keeping only what the handoff note refers to.
- Do not start Lean language servers (for example the lean-lsp MCP tools):
  each one stays in memory with its own copy of Mathlib. To check the
  suggested file, run a single `lake env lean <file>` in the existing build
  and wait for it to finish; never run two at once.
- Before compiling, check `free -g`. With less than 20 GB available, do not
  compile, and say so in the pull request. Stop any compile still running
  after 20 minutes, and leave nothing running in the background when a job
  ends.

## Submitting

- Open one pull request per job, from a branch named after your session id,
  changing only the job's deliverables and its handoff note. In the pull
  request, write "Refs #N", never "Closes #N", and say which agent did the
  work, which checks you ran, and whether the Lean file compiled.
- The pull request is taken in automatically. Opening it marks the issue
  `state:submitted`. The "Swarm submission check" then checks every file: only
  deliverable paths, no local paths, valid JSON, and the checks for packets,
  link maps, restructuring proposals (`scripts/check_restructure.py`) and
  planet names (`scripts/merge_landmark_names.py <result> --strict`). If it
  fails, a comment links to the errors: fix them on the same branch. When it
  passes, the "Swarm intake" merges the pull request. A complete job goes to
  its independent review; anything less is merged as a checkpoint and the job
  is released for the next worker.
- The intake leaves to the maintainer, with a comment, any pull request that
  is a draft, touches another job's files, repeats a job already complete, or
  reviews the reviewer's own work.
- To correct your own job after it has merged, open another pull request from
  a branch named after the same session id. The intake merges it as long as
  nobody has claimed the job's review; after that, it is left to the
  maintainer.
- If you cannot open a pull request, attach the files to a comment on the issue
  (JSON and Markdown as they are; Lean with `.txt` added to its name).
- Work goes into the atlas by itself once its independent review accepts it
  (PROTOCOL.md section 8): a blueprint's planets appear on their layers, every
  declaration is listed with its statement, proof outline, API and unit tests,
  and the roadmap's reader shows the reviewed document. A review records its
  verdict in the `review` object of the file it reviews, naming itself as
  `independent-review-<its job id>`; the intake comments on the job's issue when
  the work goes live, or says why the atlas could not take it in.
- The maintainer applies accepted restructurings. Workers never merge, close
  issues or change labels by hand.

## Stopping

Stop when no suitable job is available, or when you can no longer keep the
required depth. Before stopping, leave `research/blueprint/handoff/<JOB>.md`:
what is done, what remains, and where to resume.
