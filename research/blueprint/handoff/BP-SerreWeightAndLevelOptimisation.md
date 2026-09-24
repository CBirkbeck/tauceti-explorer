# Handoff — BP-SerreWeightAndLevelOptimisation

Worker: Claude Code, session `cc-fb70e5`, 24 September 2026. Issue #989.
Deliverables: `research/blueprint/packets/SerreWeightAndLevelOptimisation.json`,
`research/blueprint/readmes/SerreWeightAndLevelOptimisation.md`,
`research/blueprint/suggested/SerreWeightAndLevelOptimisation.lean`, this note.

`check_blueprint`: **0 errors, 0 warnings**, run with the pinned declaration index. 15 nodes
(3 definitions, 12 theorems), 17 API items, 10 unit tests, 9 planets, 8 baseline declarations,
25 prerequisite edges inside the packet, 16 on other roadmaps' stages, 11 requests, 5 gaps, 1
restructure proposal. Packet status `partial`; no layer is closed.

## What is closed, and what is not

Nothing is `closed` in the coverage sense: no stage has every target realised. This was a
deliberate choice of depth over breadth, following the job's own instruction.

| layer | status | planned here |
|---|---|---|
| R20.1 | `partial` | integral old/new exact sequence, congruence module, saturation and controlled-level passage |
| R20.2 | `partial` | Serre level as a full Artin conductor, Mazur's Principle, Ribet Theorem 1.5, the twisting step, iterated descent to `N(ρ̄)` |
| R20.3 | `not_read` | nothing — see the source problem below |
| R20.4 | `partial` | Ribet Theorem 2.1 (stripping `ℓ`-power level), Carayol's nebentypus theorem |
| R20.5 | `partial` | Buzzard Theorem 2.8, and the register of the dyadic scalar obstruction |
| R20.6 | `partial` | reduced level `M₀`, Bennett–Siksek Theorem 3, Bennett–Siksek Lemma 2.1 |

Each layer's `remaining` list in the packet is precise about what a continuation must add; the
document repeats them per layer. The largest single items are Diamond's theorem and the
character-group/component-group machinery of Ribet §6 (both R20.2), the §3 `ℚ(i)`-induced branch
(R20.5), and the case-table manifest (R20.6).

## RS-06 is binding, and was followed

`REV-RS-06` accepts the proposal with no corrections, so `RS-06.result.json` governs. The
roadmap's own action is `keep`, so the title and base are unchanged. R20.2 and R20.5 are `keep`
and are planned whole as far as they are planned; R20.1, R20.3, R20.4 and R20.6 are `narrow` and
each node respects its `keeps` sentence. No layer is dropped, so no layer is closed by
supersession.

Three places where RS-06's specific instructions shaped the result rather than being nodded at:

- **"Iteration must reach the prime-to-`p` Artin conductor rather than merely its radical."**
  This is why the Serre level is defined with exponents and why `R20.2/descend-to-serre-level`
  makes *termination at* `N(ρ̄)` its content. The unit test `serreLevel.test_not_radical` fails
  an implementation that returns the radical.
- **"The p=2 scalar local gap is registered here but completed only by R27.4; do not make this
  early theorem depend on R27.4."** `R20.5/dyadic-scalar-multiplicity-one-obstruction` is a
  prerequisite of no node in the packet, and one of its acceptance tests asserts exactly that.
  The completion is named in prose, not wired as an edge.
- **"Analytic characteristic-zero old/new decomposition does not imply this integral
  saturation."** Verified against the library rather than taken on trust: see below.

## One correction to RS-06, filed as a restructure proposal

RS-06's `suppliedBy` list for R20.1 names ModularForms layers 3 and 4 as the suppliers of what
R20.1 imports. Those are the characteristic-zero analytic layers — the library realises them as
`Submodule ℂ` via the Petersson inner product. The **integral** Hecke module that R20.1 actually
consumes is planned in ModularForms **layer 8**, "modular symbols, the integral Hecke algebra,
and coefficient fields", which builds the finitely generated integral Hecke module of modular
symbols and proves the integrality and commutativity of the Hecke action on it. Layer 8 is
absent from RS-06's list.

The packet records the import as a request and files a `rescope` proposal asking that layer 8 be
added to that supplier list. Layers 3 and 4 remain correct suppliers of the analytic newform
theory they do provide.

Layer 8 also carries a design constraint this roadmap had to respect: it states that **no
lattice inside the space of forms is ever constructed**, the lattice living on the modular-symbol
side. Every integral module in this packet is therefore stated as a symbol or homology lattice.

## The library baseline was read at the pins, not near them

Both pinned commits turned out to be present in the local clones, so they were extracted and
indexed directly rather than approximated by a nearby `HEAD`:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` — 8482 `.lean` files, 246008 indexed
  declarations.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` — 5477 `.lean` files, 70802 indexed
  declarations, matching the job's "about 70,000".

This mattered: the local Tau Ceti `HEAD` (`787733ab`) has **5268** `.lean` files, *fewer* than
the pin, so `HEAD` is not simply a later commit and using it would have given a wrong baseline.
Every one of the 8 baseline references validates against the index built from the pins.

The index was built with `research/blueprint/index_declarations.py`, which expects
`<baseline>/TauCeti/TauCeti` and `<baseline>/mathlib/Mathlib`; it reports `tauceti 0` if the
Tau Ceti source directory is placed one level too high, silently and without error.

## The plan/import boundary, and three false cleans

**No layer of this roadmap has an entry in `data/library-coverage.json`** (which covers 1316 of
the atlas's stages), so there was no reviewed verdict to plan against and the boundary was
established by search.

The determination: Tau Ceti has the characteristic-zero newform theory and nothing integral.
`TauCeti.cuspFormsOld` and `TauCeti.cuspFormsNew` are `Submodule ℂ`, the new subspace being the
Petersson-orthogonal complement of the old, and `TauCeti.isCompl_cuspFormsOld_cuspFormsNew`
proves complementarity. Statements read in source at the pin. Nothing there constrains
`ℓ`-torsion or saturation, which is exactly RS-06's point for R20.1.

Three searches gave a clean result that was wrong, and a reviewer repeating this work will meet
them:

1. `HeckeAlgebra` and `HeckeOperator` both return **0** — but `Hecke` returns **1186**. The
   Hecke theory is substantial and lives under other names.
2. `newSpace` and `oldSpace` both return **0** — but the subspaces exist, as `cuspFormsNew` and
   `cuspFormsOld`.
3. `characterGroup` returns **47** hits, which look like exactly what Ribet's argument needs.
   They are all the character group of a **split torus** (`Algebra/AlgebraicGroup/SplitTorus`,
   `DiagonalizableGroup`), not the character group of the toric part of a Jacobian's bad fibre.
   `componentGroup`'s 32 hits are likewise the general π₀ of an algebraic group, not the Néron
   component group. Same-name collisions, useful as underlying API and useless as the thing
   itself.

## Sources read, and sources missing

Read in full and quoted, with URLs, hashes and read dates in the packet's `sources`:

- Ribet, "Report on mod ℓ representations of Gal(Q̄/Q)", PSPM 55.2 (1994) — the principal source.
  Its sections map onto this roadmap almost exactly: §2 stripping powers of `ℓ` from the level
  (R20.4), §3 adjustment of the weight (R20.3), §4 the levels including Mazur's Principle (4.7),
  §5 Diamond's theorem, §6 character and component groups, §7 the proof of Theorem 1.5, §8
  Mazur's Principle. Public on the author's page.
- Buzzard, "On level-lowering for mod 2 representations", MRL 7 (2000) — R20.5.
- Bennett–Siksek, Annals 191 (2020) — the maintainer-added source, for R20.4/R20.6. Its sha256
  equals the hash recorded independently in `PAPER-BENNETT-SIKSEK-20.result.json`, so these are
  the same bytes the accepted extraction read.

Also downloaded and extracted, but not cited because no specific passage was used: Ribet–Stein,
"Lectures on Serre's conjectures" (wstein.org), Darmon's "Serre's Conjectures" survey (McGill),
Khare's "Remarks on Serre's modularity conjecture" (arXiv:math/0603439). These are the right
public starting points for a continuation.

**Missing, and the gaps turn on them:**

- **Edixhoven, "The weight in Serre's conjectures on modular forms", Invent. Math. 109 (1992)
  563–594.** Springer serves an HTML landing page rather than the PDF, and the paper is absent
  from the author's own publication listing (`pub.math.leidenuniv.nl/~edix/publications/`, whose
  by-year directories skip 1992). RS-06 binds R20.3 to "Edixhoven Theorem 4.5" by number, and
  Buzzard separately cites "Theorem 2.8 of [E1]" for a weight-two-and-level statement, so more
  than one numbered Edixhoven result is in circulation here. Planning R20.3 from secondary
  accounts under a numbering that could not be checked would have been guesswork, so the layer
  is `not_read`. Ribet §3 is the public substitute and is already read.
- **Khare–Wintenberger, "Serre's modularity conjecture (I)", Invent. Math. 178 (2009) 485–504.**
  Springer paywall. RS-06 asks R20.5 to enumerate "the remaining p=2 scalar local case
  identified by KW I §1" and to compare with "KW I's precise exceptions". The obstruction is
  instead cited from Buzzard's own words — that multiplicity one there "does not appear to be
  known, and indeed it is not clear whether one should expect it to be true" — which is a weaker
  citation than KW I §1 and is flagged as such.
- **Serre, Duke Math. J. 54 (1987) 179–230.** Not obtained. The level formula is cited to
  Ribet §2, which states it explicitly and attributes it to Serre, so the formula itself has a
  primary citation; the attribution to Serre's numbering rests on Ribet's word.

## Did the suggested Lean file compile?

**Not at the pinned baseline, and not in full.** Precisely what was and was not checked:

- The explorer repository is not a Lake project — no `lakefile`, no `lean-toolchain`, no `.lake`
  — so the file cannot be built in place.
- Tau Ceti has **no local build** (no `.olean` files), so the four `import TauCeti.*` lines and
  the one example that discharges `IsCompl (cuspFormsOld N k) (cuspFormsNew N k)` by
  `TauCeti.isCompl_cuspFormsOld_cuspFormsNew` were **not** checked.
- Everything else **was** elaborated. A variant with the Tau Ceti imports and that one example
  removed was run through `lake env lean` against a built Mathlib, and reports **0 errors** with
  `declaration uses 'sorry'` as its only warnings. That Mathlib is at `045acef0`, a neighbour of
  the pin `082e2d37`, not the pin itself.

The check earned its keep: it caught three real errors. `abbrev ResRep (F : Type*)` fails because
`GQ` lives in `Type`, so `Matrix.GeneralLinearGroup (Fin 2) F` needs `F : Type`; and doc comments
are not permitted on `variable`, which silently broke five declarations after them. A
continuation with a Tau Ceti build should re-run the whole file.

`implementationStatus` is `"unchecked"` in the packet, and no node claims an implementation.

## A tool note a reviewer will need

The ModularForms layer-8 import is a `request` and **not** a node prerequisite, although
PROTOCOL §3 asks for both. It cannot be both: `check_blueprint` resolves a prerequisite by testing
`BASE_REF = ^(mathlib|tauceti):(\S+)$` *before* testing membership in the atlas stage set, so the
anchor stage id `tauceti:TauCetiRoadmap/ModularForms#layer-8-...` matches the baseline pattern and
is rejected as a missing baseline declaration. Every packet importing from a Tau Ceti anchor layer
will hit this. Read the requests list alongside the node prerequisites; the dependency is real but
absent from the prerequisite graph. Recorded as a gap in the packet.

## What a continuation should do first

1. Add Diamond's theorem (Ribet §5) and the character-group/component-group nodes (Ribet §6) to
   R20.2. Both sources are public and already extracted; §6 is the machinery the Mazur and
   Ribet proof steps currently refer to inside their step lists rather than depending on.
2. Decompose Ribet §2's proof into nodes for R20.4; only its statement (Theorem 2.1) is planned.
3. Get Edixhoven 1992 and plan R20.3. This is the single largest hole, and it is a library-access
   problem rather than a mathematical one.
4. Write R20.6's case-table manifest, as per-case hypotheses and not as a dependency edge.
5. Re-run the suggested Lean file with a Tau Ceti build present.
