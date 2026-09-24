# Handoff — BP-HigherLocalFieldsAndHigherClassFieldTheory (issue #1012)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-hl`.

## Deliverables

- `research/blueprint/packets/HigherLocalFieldsAndHigherClassFieldTheory.json` — 48
  nodes (5 definitions, 7 constructions, 28 theorems, 8 applications), 82 API
  items, 48 unit tests, 18 planets, 30 baseline declarations, 8 gaps, 14
  requests, 4 structural proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/HigherLocalFieldsAndHigherClassFieldTheory.md` — the
  roadmap document, 2111 lines, one section per layer with every node's statement,
  hypotheses, proof outline, API, unit tests, acceptance items, prerequisites and
  sources.
- `research/blueprint/suggested/HigherLocalFieldsAndHigherClassFieldTheory.lean` —
  524 lines of suggested signatures and `example` unit tests.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/HigherLocalFieldsAndHigherClassFieldTheory.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place, so every
  one of the 30 baseline references was resolved against it and not merely checked
  for form.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.
- `python3 -m unittest discover -s tests` → see the pull request.

**The Lean file was not compiled.** No Lean was run for this job. The Mathlib build
on this machine is a shared cache that must not be rebuilt, and this working tree
has no elaborated dependency modules. Nothing in this packet is claimed to be
formalised and every `implementationStatus` is `unchecked`.

## The source, and how it was identified

Six stage texts name **AE-HLFVOLUME** and two name **AE-HLCFT**, one with the page
range *pp. 165–195*. **Neither tag is defined anywhere in the repository** — no
reference register, catalogue or guide has them. Both resolve to *Invitation to
higher local fields*, Fesenko & Kurihara (eds.), Geometry & Topology Monographs 3
(2000), <https://msp.org/gtm/2000/03/gtm-2000-03p.pdf>, SHA-256
`a6c9088000d9b18ded4d2159531d7544683b86d6eecdbb2ab6cc9b743baabe62`, downloaded and
hashed in this session. It is the volume of the higher local fields conference, and
**Kato's *Existence theorem for higher local class field theory***, the IHES
preprint of 1980 never published elsewhere, sits between its two parts at printed
pages **165–195** — exactly the range the HL.3 stage text gives. A `restructure`
entry asks that the resolution be recorded where the campaign's source tags are
kept, so the next worker on any of these layers does not repeat the identification.

Printed page *p* is PDF page *p + 12*.

**Read in full:** introduction and contents (pp. iii–xi); Part I §1 (Zhukov, pp.
5–11); Part I §5 (Kurihara, pp. 53–58); Part I §7 (Fesenko, pp. 75–76).
**Read in part:** §6 to p. 62, §8 to p. 81, §10 on pp. 99–100, Part II §1 on pp.
199–200.
**Not read:** Kato's preprint (pp. 165–195), Part I §§2, 4, 9, 11–18, the bodies of
§§6, 8, 10, and Part II §§2–10. Each omission is a gap with the exact pages to read
next.

## The audit was read first, and it changed the plan

`AUDIT-03` records HL.0 **partly built**, HL.1–HL.6 **not built**, HL.7
**process**. Two consequences:

1. **HL.7 gets no nodes.** Its three targets are an export of maps that do not yet
   exist, a repetition of the acceptance examples of HL.0 and HL.5 (the audit says
   so itself), and bookkeeping of unproved extensions. A process layer is not
   mathematics; its removal is the first `restructure` entry, and its coverage
   record points at the nodes where its two examples are in fact planned.
2. **HL.1 is almost entirely `K2SymbolsBrauer`'s.** The audit records three
   duplicates there, and the packets `K2SymbolsBrauer--T.2/T.3/T.4.json` exist and
   are reviewed. This packet imports `T.2/milnor-k-theory`,
   `T.2/milnor-alternating`, `T.3/tame-symbol`, `T.3/higher-milnor-residues`,
   `T.3/transfer-and-norm-residue` and `T.4/milnor-transfer-transitivity` **by node
   identifier** and defines no Milnor K-theory. What HL.1 keeps is what is specific
   to a tower: the iterated residue with its sign rule, its compatibility with the
   norm through the ramification matrix, and the topological K-groups. The second
   `restructure` entry asks that HL.1's stage text say so, because as written it
   reads as though the whole of Milnor K-theory were to be built here.

`FoundationsAndLibraryIntegration:LI.4`, which four HL.0 nodes would naturally rest
on, belongs to a **retired** roadmap (`data/roadmap-retirements.json`), so no
request is filed against it; the carriers are cited from Mathlib directly and the
convention question — the higher topology is a *second* topology on a field that
already carries its valuation topology — is recorded in HL.0's `remaining` list.

## What remains

No layer is closed. Eight gaps, each with a *next source action* naming exact
printed pages. In rough order of how much they block:

1. **Kato's preprint, pp. 165–195, is unread.** It is the existence theorem the
   HL.3 stage text points at by page range. The packet takes the existence theorem
   from Fesenko §10.5 (p. 100) instead, which proves the same statement by a
   different route, using the topology on the K-groups; Kato characterises the
   class of open subgroups of finite index *without* that topology. The two
   statements need comparing.
2. **The global layer has no source.** The volume is a local source and its
   introduction says so, referring the reader to Raskind's review. Every statement
   of HL.6 is recorded as an obligation with its hypotheses, and one node
   (`what-is-not-proved-globally`) says this in the packet itself. Kato–Saito and
   Raskind must be acquired with their exact regularity and properness hypotheses.
3. **§§6.2–6.8, 8.2–8.3 and 10.1–10.4 are unread.** They are the computational
   heart of HL.1, HL.3 and HL.4: the pairings and structure results for the
   topological K-groups, Vostokov's formula, and the explicit construction.
4. **Part II §1 was read for two pages and §2 not at all.** The restricted-product
   condition is recorded from Parshin's own formulation; Parshin's, Beilinson's and
   Huber's papers were not obtained and the three formulations are not compared.
   Osipov's direct images are recorded by role only.
5. **Epp's theorem** (§17, pp. 143–150) is quoted, not proved; it is used by the
   classification theorem of HL.0 and by Zhukov's ramification theory in HL.4.
6. The **isomorphism theorem is sketched** in §5, not proved; the index inequality
   refers to Serre and to Kato's papers.

## Structural proposals

1. **Remove HL.7** (process layer).
2. **Rewrite HL.1's stage text** to say that Milnor K-theory, the one-step residues
   and the transfers come from `K2SymbolsBrauer:T.2–T.4`.
3. **Record the resolution of AE-HLFVOLUME and AE-HLCFT** with the URL and SHA-256
   above, since neither tag is defined in the repository.
4. **Divide HL.6.** Kato complexes and the vanishing of the square of the boundary
   follow from HL.5's residues and can be built from the sources in hand; the
   global comparison, its four variants and the Hasse principles need a primary
   source nobody in this programme has. As one layer HL.6 can never be closed.

## Where to resume

Read Kato's preprint (pp. 165–195) first: it is the one gap that sits on a node
already written. Then §§6.2–6.8 for the topological K-groups, then §8 and §10 for
the explicit formulas. HL.6 is not a reading job but a source-acquisition job, and
should wait until Kato–Saito is in hand.
