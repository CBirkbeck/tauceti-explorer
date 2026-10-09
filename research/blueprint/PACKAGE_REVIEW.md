# Package review — the one fixing review before a roadmap goes to TauCetiRoadmap

This is the method every package review follows (streamlined pipeline, 2026-10-09). The job's issue names the package; this file is binding.


You review a roadmap package another worker wrote (named in your job), as the single review before it goes to TauCetiRoadmap as a
draft PR. You did not write it. You FIX what you can in place and only report what you cannot fix; you do not
send it back. Target 90 minutes; hard stop 2.5 hours. Read `WORKERS.md`
first (environment, Lean, writing rules); claim and submit as WORKERS.md says.

## What you may edit
Only `research/blueprint/packages/<Roadmap>/{README.md,Suggested.lean,metadata.toml}` and
`research/blueprint/packages/<Roadmap>/review.json`, plus `research/blueprint/reviews/REV-PKG-<Roadmap>.md`.
Never the packets.

## Checks, in this order (stop fixing at the time limit; report the rest)
1. **Quality bar = TauCetiRoadmap.** Read two upstream roadmaps in `content/tau-ceti/*/README.md` and
   `research/blueprint/UPSTREAM_GUIDE.md`. The README must read like those: what it builds and why, boundaries,
   conventions, layers in order with targets; definitions with API and ≥3 unit tests a wrong definition fails;
   theorems with exact hypotheses; every target with a source locator and prerequisites. No process language.
2. **Sources.** For every locator the package author flagged as unverified, and for a random sample of 15 others,
   open the public source and confirm theorem/section/page. Fix wrong locators. A statement you cannot source
   becomes an explicitly marked gap, never a silent claim.
3. **Gaps.** Walk the layers: does every target's prerequisite exist (Mathlib/Tau Ceti at the pins — read it
   locally; an earlier layer; a bundle roadmap; a LOWER-tier roadmap per `research/blueprint/upstream/CaraianiNewton.md`)?
   Upward citations, `FoundationsAndLibraryIntegration` and `UPSTREAM:` ids are defects: restate the notion as a
   target here or map to the Tau Ceti item. Note each in the review.
4. **Unit tests.** Every definition: ≥3 tests, each one a wrong-but-plausible definition would fail (a computed
   value, the degenerate case, agreement with the nearest library notion, a non-example). Replace vacuous tests.
5. **Lean.** `lean-check <abs path>/Suggested.lean` must exit 0 with `sorry` as
   the only warning. Spot-check 10 signatures against the README statements (hypotheses present? vacuous?
   `True`/`Prop := sorry` placeholders are forbidden). Every README definition should appear as a declaration or
   in the closing comment block.
6. **Own words.** No verbatim passages, no section-by-section summaries (PROTOCOL §5).
7. `python3 research/blueprint/intake.py check-files <files>` → 0 problems; no local paths.

## Verdict
Write `review.json`: `{"review": {"status": "accepted" | "needs_changes", "reviewer": "independent-review-REV-PKG-<Roadmap>",
"date": "<YYYY-MM-DD>", "notes": "..."}}`. `accepted` means: with your fixes applied, it is ready for the draft PR.
`needs_changes` only for a defect you could not fix in the time (say exactly what). Write the report
`research/blueprint/reviews/REV-PKG-<Roadmap>.md`: what you checked, what you fixed, what remains.
Submit as WORKERS.md says.

## Duplication against Tau Ceti (maintainer, 2026-10-09)
The atlas planned against an older snapshot of TauCetiRoadmap and TauCeti f790474. Before you finish, check every
definition and theorem target against (a) the CURRENT upstream roadmaps, read-only at
`the current TauCetiRoadmap checkout the runner names (TauCetiRoadmap/<Name>/{README.md,Suggested.lean})` and `Completed/*` — nine are newer
than the atlas snapshot: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups,
OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic, RealAlgebraicGeometry (plus Completed
ContourIntegration, EffectiveBounds, OrthogonalL2Bases, RestrictedProducts); and (b) the current TauCeti library at
`the current Tau Ceti library checkout the runner names (TauCeti at a91d3aaf)` (a91d3aaf). Search by the mathematical object
(structure fields, operators, hypotheses), not just names. A target that exists there is removed and cited instead
(roadmap layer, or module:declaration); list every removal in the handoff/report. Never run lake in that directory.

## Form of the upstream README (maintainer, 2026-10-09)
No planning residue: never leave "(removed)" stubs — a target that exists elsewhere is deleted (renumber) and listed only
under "Prerequisites and boundaries". Notions Tau Ceti already has (library or an upstream roadmap) are mentioned only in
that boundaries section as deferrals, never in layer summaries, the layer table or target lists; a kept variant states in
one clause how it differs from the Tau Ceti statement.
## Suggested.lean in TauCetiRoadmap form (maintainer, 2026-10-09) — binding for packages, reviews and ports
Model: `the current TauCetiRoadmap checkout the runner names (TauCetiRoadmap/<Name>/{README.md,Suggested.lean})` (read it, and one more).
- `import Mathlib` (plus the Tau Ceti modules actually used), then ONE module docstring: "<Name>: representative
  target signatures", saying the roadmap is README.md, that the file records definitions and theorem signatures
  statable against the pinned APIs and is not exhaustive, and the design choices it makes explicit.
- `namespace TauCetiRoadmap.<Name>` for the whole file; sub-namespaces per topic; `open`/`variable` sections.
- Layers as `/-! ## Layer k: <title> -/` section comments, in README order; each declaration has a docstring that
  states the mathematics and, where useful, the source and the design choice ("belongs to Layer 2", "agrees with
  Mathlib's X once it exists").
- Declarations: `def`/`noncomputable def`/`abbrev`/`structure`/`class`/`instance` for the objects, `theorem` (never
  `lemma`) for statements, bodies `sorry`. Unit tests are `example`s. `#check` only to pin a library declaration
  the roadmap builds on; **no `#print axioms`, no `#eval`, no `#synth`, no catalogues of names, no process comments**
  (packet ids, "catalogue", "stand-in", "lean-check", budgets). Statements that cannot be typed at the pins are
  simply absent from the file (the README still states them); a short closing comment may list them by name.
- No `True` placeholders, no `def P : Prop := sorry`, no hypotheses that contain the conclusion.
## README in TauCetiRoadmap form (maintainer, 2026-10-09) — binding for packages, reviews and ports
Models (read two before writing): `the current TauCetiRoadmap checkout the runner names (TauCetiRoadmap/<Name>/{README.md,Suggested.lean})` (45 KB),
`LocalGaloisGroups/README.md` (94 KB), `ProfiniteArithmetic/README.md` (62 KB). Ours SHOULD be more detailed, in the SAME shape: every definition keeps its API list and its unit tests (≥3,
discriminating), every theorem its exact hypotheses, every claim its locator, every layer its dependencies — nothing is
dropped to look like upstream; only the catalogue scaffolding goes. The atlas packet/target catalogue is an INPUT; the README is a mathematician's roadmap, written in prose.

Shape (headings as upstream uses them):
1. `# Roadmap: <lower-case title>` and a short paragraph: what is built, from what, to what end theorem(s).
2. `## Scope and ownership` — what this roadmap owns, what it leaves to named roadmaps (Tau Ceti or atlas, by layer);
   this is where "already in Tau Ceti / already stated by roadmap X" lives, and nowhere else.
3. `## Conventions` — standing hypotheses, notation, normalisations, universe/coefficient choices.
4. `## Exact supplier contracts` (or `## Existing Mathlib and Tau Ceti used`) — per supplier (`From Mathlib`, `From Tau
   Ceti`, `From TauCetiRoadmap.<X>`): the declarations/layers consumed, by name, with what is assumed about them.
5. `## How to read the build` — one paragraph on layer order and what each layer delivers.
6. `## Layer k: <title>` for each layer in build order, with `### k.n <topic>` subsections. Each subsection is PROSE:
   "Define `fooBar` as … . Prove `fooBar_mul`, `fooBar_zero` … (Source Thm 3.2, p. 41). *Needs:* Mathlib `X`, Layer 1
   `Y`." Lean names in backticks, formulas in ```text blocks or inline, hypotheses stated in the sentence, source
   locators in parentheses at the claim. Definitions give their API as a short list of named lemmas in the prose, and
   their unit tests as a `**Checks.**` bullet list under the subsection — one bullet per test, each saying what is computed
   and what value or property a wrong definition would fail (the computed value, the degenerate case, agreement with
   the library notion, the non-example); the same tests appear as `example`s in Suggested.lean. Every layer ends with `### Examples` (worked examples /
   checks along the way, if any) and `### Dependencies` (layers and roadmaps it needs).
7. `## Worked examples` (optional), `## Downstream consumers` (who uses this roadmap), `## References`.

Rules: no target numbering tables (no `**T017**` blocks, no `Hypotheses:/API:/Tests:/Sources:/Requires:` field lists);
no truncation markers; no planning residue; own words with locators; `Suggested.lean` holds the signatures and the
`example` tests — the README names them, it does not paste them. Size is whatever the content needs (upstream runs 25–95 KB; ours will often be 100–300 KB because of the tests and
hypotheses); never shrink by dropping tests, hypotheses or locators. A roadmap that is unwieldy is split into Parts.
## Adversarial mathematics pass (maintainer, 2026-10-09) — mandatory before any TauCetiRoadmap PR
A `sorry` build checks elaboration, not truth. The reviewer of PR #780 found false identities, a 0/0, reversed
units/non-units, ℤ_p-only formulas stated over general O, and wrong determinant sign/parity conventions — none of which
locator checks, test counts or lean-check can see. So, for EVERY theorem, identity, definition and convention:
1. **Instantiate the degenerate cases** and compute: q = 1, r = 0 and r ≥ q, n = 0, p = 2 (sign/Teichmüller characters),
   the trivial group, the zero module, the unit ideal, O = ℤ_p vs O ramified / unramified / equal-characteristic k[[ϖ]],
   a field vs a DVR, characteristic p. If any instance makes the statement false, add the hypothesis or fix the claim,
   and add that instance as a negative-control Check / `example`.
2. **Generality audit:** the README's generality must equal the Lean signature's. "For a DVR O" in prose with `ℤ_[p]`
   in Lean (or vice versa) is a defect: scope the statement or register the general version separately.
3. **Conventions with a witness:** every sign, parity, direction of a map, normalisation (δ_P vs δ_P⁻¹, alternating vs
   inverse determinant, ϖ vs p, left vs right coset) is fixed by one explicit two-term example in the README whose value
   is computed, and the Lean test pins it.
4. **Definitions:** check each defining property against one example that satisfies it and one that fails it (the
   units/non-units, support "on" vs "outside", "detects all characters" claims die here).
5. **Divisions and quotients:** every denominator has a nonvanishing argument; every "canonical" map a stated domain.
6. **Interfaces promised vs supplied:** anything the prose promises (an extension map, a duality, a comparison) has a
   named target with hypotheses, or is cut from the prose.
Record the pass in the review report: a table of statements checked, instances tried, and what changed. The manager's
gate repeats the pass independently before the PR.
