# Upstream guidance: writing a roadmap

Quoted from the README and CONTRIBUTING.md of [TauCetiProject/TauCetiRoadmap](https://github.com/TauCetiProject/TauCetiRoadmap) at commit fa4d030 (14 September 2026), Apache License 2.0. Blueprint jobs follow this guidance; where it conflicts with research/blueprint/PROTOCOL.md (for example on Lean prototypes, which blueprint packets do not contain), the protocol governs.

### Writing a roadmap

A roadmap is a specification for material we want added to Tau Ceti, written so an AI contributor, and its
reviewers, can act on it without guessing.

- **Build the library, don't race to the theorem.** For each object you introduce, ask for its
  complete basic theory, not just the lemma the headline needs. Named theorems are milestones
  inside a fuller development, not the whole of it. Mario's rule from Mathlib's early days still
  applies: when you make a definition, it is your job to make it *usable*, which means the right
  amount of API. A definition with no lemmas about it is not a contribution.

- **No gaps.** Every milestone must rest on existing Mathlib or Tau Ceti material, on earlier
  material in the same roadmap, or on an explicitly cited dependency in another roadmap. Anything
  else is a leap: a forward reference to a later layer, a connection between two developments that
  nobody builds, an object named but never made a target. If the roadmap needs something that
  doesn't exist, building it must itself be a target, here or in a roadmap you cite. The bigger the
  gap, the worse AIs do with it.

- **Every item must be unambiguous.** A reasonably clever agent has to be able to work out exactly
  which definition or theorem you mean, without guessing between candidates.

- **Clear boundaries.** We keep roadmaps non-overlapping as far as we can, and where one depends on
  material from another, that dependency is stated. Minimize the number of words a reader needs in
  order to decide whether something is in scope; jagged boundaries make that impossible.

- **Be definite about scope.** Nothing is "optional", "deferred" or "for later": don't use the
  words and don't imply them. Everything on a roadmap is work we want. Sequencing is good, so split
  into milestones and put the harder material later, but every item lives in *some* milestone, or a
  contributor may misread "later" as "never". Decide the generality up front and write it down,
  rather than recommending intermediate implementations that will be replaced.

- **Roadmaps are timeless.** They say what we want, not how they came to say it. Don't call an item
  "blocked" because an earlier roadmap is still being implemented; point at that roadmap instead.
  When revising, don't leave war stories about why or how the roadmap changed, and don't refer to
  the review process. Someone reading a year from now should not be able to tell which parts were
  contentious.

- **Aim for reusable material.** This one is a *should*, not a *must*, but it is what makes a
  roadmap pay for itself beyond its own headline.

- **Deep or broad is up to you.** Broad roadmaps are usually better: if we are doing
  representation theory, let's cover everything taught in graduate classes at more than one
  university. Breadth makes boundaries easier to draw and optimizes for reuse. But roadmaps also
  have to *motivate* people to contribute, and a deep one is sometimes better at that.

### Working with Mathlib

- **Use Mathlib's vocabulary.** Where Mathlib already has a way to say something, use it rather
  than a private version, both in the roadmap and in the code. A standard notion said in our own
  dialect drifts from the library it builds on and grows a redundant theory of lemmas Mathlib
  already proves. For example: Mathlib has no "bounded on a set" predicate, so a result needing an
  explicit bound carries `∀ x ∈ s, ‖f x‖ ≤ C` directly in its hypotheses (as in `norm_cfc_le`), and
  uses `Bornology.IsBounded` when no constant is needed (`isBounded_iff_forall_norm_le'` relates
  the two). We do the same, and never wrap a one-line bound in a new predicate. When Mathlib's name
  is itself a Mathlib-ism a mathematician would not recognize (`ModularFormClass`, say), link the
  declaration the first time you use it.

- **Defer to Mathlib.** Before specifying an object, search Zulip and the open Mathlib PRs for it.
  Someone may already have formalized it or settled its design. **Mathlib owns its API decisions.**
  Tau Ceti adopts the resulting design and refactors when it lands. Cite what you find, follow the
  direction it takes, and don't argue for a Tau Ceti spelling against Mathlib's.

- **But never wait.** Deferring to Mathlib is about *shape*, never about *timing*. An open Mathlib
  PR covering ground a roadmap needs is not a blocker, not a reason to leave a gap, and not a
  reason to send contributors elsewhere: build the thing here, now, naming and shaping it the way
  that PR does so the eventual swap is a deletion plus an import rather than a rewrite. If it
  lands, we delete ours and adopt Mathlib's; if it doesn't, we already have what we needed. Nothing
  on a roadmap is ever "pending upstream".

- **Never push work to Mathlib.** Tau Ceti material is built in Tau Ceti and stays there. Plenty of
  it would make good Mathlib material, and Mathlib contributors are welcome to take any of it at
  any time, but deciding what Mathlib absorbs is solely theirs. So don't write a roadmap item as
  "to be upstreamed", don't hold one back because it "really belongs in Mathlib", and don't treat
  opening a Mathlib pull request as part of discharging a target.

### Porting existing work

- **Specify the mathematics, not your existing code.** Say what each milestone should prove,
  intrinsically, so a reviewer can judge it on its own terms. A roadmap may direct either a
  greenfield development or the integration of existing work into Tau Ceti.

- **Coordinate first.** Work with the authors of the existing material and obtain their agreement
  before integrating it. If coordination is not possible, do not assume that mathematical overlap
  permits reuse of their code: verify that its licence permits the intended copying or adaptation,
  and discuss the plan on the Lean Zulip first. A roadmap that independently develops the same
  mathematics should still cite the existing work and coordinate where possible, to avoid needless
  duplication or incompatible design choices.

- **Improve it rather than canonizing it.** Do not write the roadmap merely to follow the existing
  formalization; apply all the principles above to make the result more general, reusable and
  maintainable. Put any file-by-file map in a clearly secondary provenance section, so that nobody
  treats the source code as prescriptive.

### Prototyping

- **Write Lean code.** It's really helpful to prototype signatures, particularly for structures,
  classes, and definitions, by writing Lean code, either embedded in markdown or in associated
  Lean files using `sorry`. The prototypes are aids, not the specification: the markdown stays
  definitive, and `Suggested.lean` is read as suggested forms, never as an exhaustive checklist —
  open each `Suggested.lean` with the standard note saying so. Use `sorry` honestly: a condition you
  cannot yet even *state* (its Mathlib API doesn't exist) is still a `sorry`, never a `Prop`-typed
  field or a `def _ : Prop := sorry`. Both assert nothing (a `Prop` field is satisfiable by `True`;
  a `sorry` body is `sorryAx Prop`), so omit a condition you cannot state rather than name an empty one.

- **Import existing Tau Ceti APIs.** This repository has Tau Ceti as a Lake dependency, so a
  `Suggested.lean` file may import individual `TauCeti.*` modules as well as Mathlib. When an earlier
  roadmap target is already implemented in Tau Ceti, prototype the new interface against that
  implementation instead of restating it behind a private stand-in. Import individual modules;
  Tau Ceti's root module intentionally re-exports nothing.

- **Pin conventions.** It's essential that you decide conventions ahead of time, or implementors
  will make bad decisions.


### Advice on writing a roadmap

Read these before you start, in this order:

1. **[Writing a roadmap](README.md#writing-a-roadmap)** in the README. This is the standing
   checklist, written after several rounds of review, and it is what reviewers will hold your
   PR against. Build the library rather than racing to a headline theorem; ground every
   milestone in material that exists or is itself a target; use Mathlib's vocabulary; pin
   conventions; nothing is "optional".
2. **The [Getting started: roadmaps][zulip-topic] topic on the Lean Zulip.** This is the
   running discussion of what roadmaps are for and what makes a good one, including the
   questions that produced most of the README checklist. It is also the right place to ask
   about a roadmap you are planning, and to ask for review once you have opened a PR.
3. **Two or three merged roadmaps** from the [list in the README](README.md#roadmaps), in an
   area close to yours. The review discussion on their pull requests is often more instructive
   than the merged result.

[zulip-topic]: https://leanprover.zulipchat.com/#narrow/channel/610393-Tau-Ceti/topic/Getting.20started.3A.20roadmaps/with/614905192

A few points from the Zulip topic that the README checklist does not yet spell out:

- **Roadmaps are not scoped to Mathlib.** Anything that would be good to have in a central,
  coordinated library is in scope. But a roadmap must make contact with material that already
  exists in Mathlib or Tau Ceti. A roadmap whose lowest rung is still far above what has been
  formalized just makes agents thrash and produce bad code.
- **A roadmap for work you have already formalized is welcome**, and is a good way to bring
  existing material up to Tau Ceti quality. Write it so someone could implement it fresh, and
  treat your existing repository as a cited source rather than as the specification. The point
  of the review process is to improve the material, not to ratify it.
- **Do not tail off into an under-specified ambitious extension.** If the last section of your
  roadmap gestures at something much larger, label it explicitly as a roadmap-for-a-roadmap and
  tell contributors not to follow it, so that it reads as motivation for a future roadmap
  rather than as work to attempt now.
- **Attribute AI assistance.** Most roadmaps here are written with AI help and that is fine,
  but unlike the code repository this one is human-curated, so say which models you used, in
  the PR description. The same goes for review comments written with AI assistance: mark them,
  conventionally with a :robot: prefix. Nobody should post a roadmap or a review comment they
  have not read carefully themselves.
- **Help find a subject-area expert.** Reviewers are frequently working outside their
  mathematical expertise. If you can name or recruit someone who knows your area, whether or
  not they know Lean, say so on the PR or in the Zulip topic. That is often the difference
  between a roadmap merging and sitting.

