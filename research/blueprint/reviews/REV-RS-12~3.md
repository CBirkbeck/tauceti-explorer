# REV-RS-12~3 — third independent restructuring review

Verdict: **accepted**, with one correction made in place. Refs #3945. Reviewer: Claude Code, session
`cc-58621d`, 29 September 2026. Round-3 author: Claude Code, session `cc-39fac3` (#3950); original
author `cg-6b83f1`. Earlier reviewers: `cp-7b4e91` (REV-RS-12) and `codex-a71f92` (REV-RS-12~2).

**Disclosure.** This session wrote neither RS-12 nor its earlier reviews. It did write two red-team
fixes reports that touch this family:
- `RT-AREA-langlands-1.fixes.md` (merged, not applied) proposes new sub-stages of AG2.1a and AG2.1b,
  a new AG2.8, and imports into R19.6 and AG2.6;
- `RT-AREA-langlands-2.fixes.md` (#4660, open) proposes edges into R19.1–R19.5.

§5 checks them against this proposal.

## 1. The round-3 decision resolves the blocker

Both earlier reviews rejected the proposal for one reason. It declared
`AutomorphicGaloisRepresentationsPartII` an extension of `AutomorphicGaloisRepresentations` (R19), while
the would-be extension owns AG2.0 and AG2.1a, which lie upstream of R19. An extension may not own a
constructor of its base.

Round 3 changes only the decision. The general-rank roadmap is **kept**, not declared an extension,
and retitled "Galois representations attached to regular algebraic automorphic representations of
GL_n". Its id is unchanged. The round-3 diff against the audit commit of REV-RS-12~2 (`438dc5be`)
touches only three things:
- that roadmap's action, title and reason;
- the AG2.0 and AG2.1a reasons, which gain the blueprint placement notes;
- one link reason's wording.

Every stage decision, owner and link is as round 2 reviewed it.

I accept the reading that this is the fifth rule of PROTOCOL §15, not an exception to the third. The
third rule covers a roadmap that "needs more than an existing roadmap covers in the same direction".
The fifth covers "a general theory that subsumes special cases an existing roadmap builds", which
"builds on those cases: it cites them, proves its general statements compatible with them, and does
not construct them again". The GL_n theory is such a general theory, and the proposal implements the
three obligations:
- AG2.3, AG2.5 and AG2.6 are narrowed to import R19.2, R19.4, R19.3 and R19.5 on the exact overlap;
- links R19.1–R19.5 → AG2.3/AG2.5/AG2.6/AG2.7 carry the special cases in late;
- AG2.7 compares its GL₂ package with R19.1 up to isomorphism.

The Part II document already says the same in its own words: "The GL₂ special case is compared with
R19 by uniqueness; its older explicit modular geometry remains useful and is not deleted."

With no extension declared, the rule "an extension starts exactly where the roadmap it extends stops"
has nothing to apply to. REV-RS-12~2 allowed that "a different justified merge/rescope is also
reviewable"; this is one. §6 asks the orchestrator to confirm the reading.

## 2. Graph checks on the current atlas

The atlas was assembled by `scripts/build.py` at `e0e8e071`, with the accepted restructurings RS-11,
RS-21 and RS-23 (accepted after the round-3 input pin), the link maps and the promoted blueprints.

- **Both witness routes exist edge by edge:**
  - AG2.1a → ET.6 → R16.3 → R16.6 → R19.1;
  - AG2.1a → ET.6 → R17.1 → R17.2 → R17.3 → R19.2 → R19.3 → R19.4.
- **The routes are genuine.** With R16.6 → R19.1 and R16.3 → R16.6 both removed, AG2.1a still reaches
  R19.2–R19.6. ET.6's description reads "Reuse AG2.1a's raw cohomology". So no edge refinement makes
  an extension possible, as §4a of the report says.
- **No earlier owner.** A search of all stage descriptions finds no other stage that plans the étale
  cohomology of compact unitary Shimura varieties with Galois and Hecke actions. AutomorphicPadicLFunctions
  L4 builds PEL/unitary Shimura varieties, but for the doubling method: vector bundles, compactifications
  and ordinary Igusa towers, not this cohomology.
- **The links.** All thirty endpoints resolve. Four links are already in the atlas (G7, AF.4 and IHG.3
  → AG2.0; R01.1 → AG2.7) and 26 are new, as the report says. The union with the atlas is acyclic.
- **Separation.** On the union, no late stage (AG2.1, AG2.1b, AG2.2–AG2.7) reaches an R19 stage, and
  no R19 stage reaches AG2.0 or AG2.1a. Neither AG2.0 nor AG2.1a has an R19 ancestor.
- **Placement notes.** The nodes they name exist:
  - `AG2.0/the-normalization-dictionary-fixed-by-the-sources`, `AG2.0/frobenius-polynomial-and-conventions`
    and `AG2.0/galois-representation-attached-at-good-places` in the AG2.0 packet;
  - `AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris` in the packet and the decomposition.

  AG2.0 does reach ET.7 through AG2.1a → ET.6 → ET.7a, as the AG2.0 note says.
- **Application.** `scripts/restructure.py` applies a `title` for any roadmap action, including
  `keep`, so the retitle takes effect in the atlas.

## 3. Ownership and conservation

I read both member documents in full, all sixteen stage entries, the twenty owner records and the
thirty links. The member documents, both decompositions and the family file are byte-identical to
those that REV-RS-12~2 audited (its §2 lists the full ownership reading, and I agree with it). The
sixteen stages all survive: twelve keep and four narrow. Nothing is moved or dropped.

**Checked against the accepted restructurings.**
- No accepted proposal narrows or drops a member stage, and none links out of a narrowed one.
- Two accepted owner records involve member stages:
  - RS-05 gives the dagger carrier to AdicSpacesPartII F1, formerly AG2.4. This is consistent: AG2.4
    imports F1's ordinary-locus dagger geometry.
  - RS-06 gives R19.4 the all-finite-place compatibility with exact conductor, which is consistent. It
    also gives ModularCurvesPartII R14.3 the finite-level universal-family cohomological carrier and
    symmetric-power local systems, formerly R19.1, with the link R14.3 → R19.1 ("R19.1 constructs its
    eigenspace/projector and proves Frobenius/irreducibility, not a second family").

**Correction made.** RS-12's R19.1 reason predates RS-06's acceptance (23 September) and said that
R19.1 keeps the "higher-weight parabolic/symmetric-power or Kuga-Sato cohomology". It now keeps the
eigenspace projectors in that cohomology, built on R14.3's carrier and local systems, and cites the
RS-06 owner record and link. The action stays `keep`. Nothing else in the entry changed, including
the preserved characteristic-p correction.

## 4. Forwarding

Every current direct consumer of a narrowed layer gets a link from each named supplier. The link is
either already in the atlas or proposed.

| Narrowed layer | Suppliers | Current direct consumers |
| --- | --- | --- |
| R19.3 | R24.5:operations, R34.6 | R19.4, ComplexMultiplicationAndExplicitReciprocity CM.4 |
| AG2.3 | R19.2 | AG2.4, AG2.5, AG2.6 |
| AG2.5 | R19.4 | AG2.6, AG2.7, IgusaVarietiesAndTorsionConcentration IG.5 |
| AG2.6 | R24.5:operations, R19.3, R19.5 | AG2.7 |

The consumer sets are the same as in round 2.

## 5. Concurrent proposals

The thirty links were tested together with this session's two fixes reports: 104 edges and 15 new
stages for part 1, and 53 edges, 4 new stages and 6 removals for part 2. With the removals applied,
the union is acyclic.

The fixes agree with this proposal where they overlap:
- IHG.1/IHG.4 → R19.6, R24.5:operations → AG2.6, R24.5:operations → R19.3 and R34.6 → R19.3 appear in
  both;
- the part-1 sub-stages of AG2.1a and AG2.1b respect the AG2.1a/AG2.1b fence before and after ET.6.

## 6. Questions for the orchestrator

1. **Confirm the fifth-rule reading** of §1: the general-rank roadmap is kept and retitled, not a Part
   II. REV-RS-12~2 said that an exception to the extension rule needs your authorization; I read this
   as no exception.
2. **Hand edits at application.** `restructure.py` retitles the atlas record only:
   - The general-rank README still has the heading "Automorphic Galois Representations PartII". Its
     scope paragraph calls it "the substantial dimension-general continuation of
     AutomorphicGaloisRepresentations R19". Both should follow the new title, and the paragraph should
     describe the relation in §1 of RS-12.md.
   - R19's README handoff still says "R19.1 first constructs a fine-level universal elliptic family and
     the Sym^{k−2} local system, its parabolic cohomology and Hecke correspondence action". Under RS-06
     that is R14.3's.
3. **Blueprint follow-ups stand:**
   - the placement notes in the AG2.0 and AG2.1a entries;
   - the source correction to the inherited R19.1 node. I rechecked the F₅ example: y² = x³ + 3x + 2
     has E(F₅) = {O, (1,1), (1,4), (2,1), (2,4)}, 4a³ + 27b² ≡ 1 mod 5, and a₅ = 1, so the curve is
     ordinary, and its reduced order-five subgroup is not the Frobenius kernel.
4. **The move alternative** of RS-12.md §4a stays your decision: moving AG2.0's early dictionary and
   AG2.1a into ET to force a strict base/extension pair. This review does not recommend it; the kept
   general theory needs no move.

## 7. Checks and inputs

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-12.result.json`: ok, before
  and after the correction.
- `python3 -m unittest tests/test_check_restructure.py tests/test_restructure.py tests/test_intake.py`:
  50 tests, OK.
- The graph checks of §§2, 4 and 5 were run on the assembled atlas at `e0e8e071`.
- Intake file validation on the two deliverables: 0 problems.

Pre-review inputs at `e0e8e0713b1bdd7acba41eec1f5350bab2852892` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| RS-12.result.json | `5bbc2680d79e164e69dfc373b6b9cff72a9d9911111cb0077a43d7c9dcca8ddf` |
| RS-12.md | `b7b921f72f341e25ad28b32420e1f3f392e849467248be8214e3266da009ffd8` |
| RS-12.json | `f2347c385ca2138045d9729dba2e30839db35716b5397e0a78c9826633df43d4` |
| AutomorphicGaloisRepresentations/README.md | `e27963ff6c68ff3e7c366a0454497b1392c68893e041d934a11d8b94ab6fd08b` |
| AutomorphicGaloisRepresentationsPartII/README.md | `2e7d82ae9da0f5b5b56458ca64948ac1dedb8922c55b6501816cef21e303fcc4` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |
| data/restructure/RS-06.result.json | `b67b734a6a50c86dc2fcea7000a4c428fc76325049f9a06a048475fe274e08c3` |

This review changed only the proposal's R19.1 reason and its `review` object, and wrote this report.
No Lean file is a deliverable; no Lean was run.
