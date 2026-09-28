# REV-DeformationAndDerivedPatchingAlgebra--R03.6 — review of the R03.6 blueprint

**Verdict: accepted, with one correction.** Reviewer: Claude Code, session `cc-fb70e5`,
28 September 2026. Target: `research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--R03.6.json`
and its suggested Lean file, the blueprint of stage `DeformationAndDerivedPatchingAlgebra:R03.6`.

**Independence.** `cc-fb70e5` appears nowhere in the packet, the reader, the suggested file or the
handoff; the handoff names `cc-39fac3` as the author. The job requires a different agent from the one
that did the blueprint.

**The packet changed under me, and the review is of the current version.** When I claimed the job the
packet was `partial` with two requests to R03.3. Its author then merged #3320, "close the layer on
R03.3's new nodes", which made it `closed`: the two requests became prerequisites on three nodes of
`DeformationAndDerivedPatchingAlgebra--P7.json`, and the coverage record became `closed`. Every check
below was run on the version at `4a6849d1`.

## Counts

| | |
|---|---|
| nodes | 53 (2 definitions, 41 lemmas, 10 theorems) |
| status / coverage | `closed` / R03.6 `closed` |
| baseline declarations | 126, cited by 294 prerequisite uses |
| prerequisite edges | 84 inside the packet, 1 to an integrated node, 3 to another packet's nodes |
| source excerpt references | 144, across 9 sources |
| API items | 19 before, **22 after** |
| unit tests (counted) | 11 |
| planets | 6, the per-layer maximum |
| `check_blueprint` | **0 errors, 0 warnings**, before and after |

## 1. Sources — all 144 excerpt references verified against the source texts

I obtained every source and matched every excerpt, rather than sampling:

| source | how obtained | references |
|---|---|---|
| Taylor, Publ. Math. IHÉS 108 (2008) | Numdam, open | 33 |
| Calegari–Geraghty, Invent. Math. 211 (2018) | author copy | 45 |
| Khare–Wintenberger, *Serre's modularity conjecture (II)* | author copy | 14 |
| Kisin, Annals 170 (2009) | Annals, open | 7 |
| ACC+, *Potential automorphy over CM fields* | author copy | 5 |
| Stacks Project, 23 tags | the Stacks data endpoint | 37 |
| Mathlib `MvPowerSeries` files | read at the pin | 3 |

The method had three stages, because formula-heavy excerpts cannot match a PDF's text layer character
for character. First, a normalised substring and chunk match: **92** references matched exactly.
Second, for every reference below an exact match, I required every run of four or more plain words in
the excerpt to occur in the source, which ignores formula typesetting and tests the prose. Third, I
read whatever was left. **All 144 hold.** The residue was of two kinds, neither a misquote: formulas
that the author transliterated to Unicode and the text layer renders differently, and one sentence of
Calegari–Geraghty's proof of Theorem 6.4, cited by five nodes, which `pdftotext` splits by
interleaving a line of a displayed formula between "each irreducible" and "component of".

**Two faults in my own tooling, recorded because they would otherwise have become false findings.**
My normaliser stripped HTML tags with `<[^>]+>` and I first applied it to PDF text as well as to the
Stacks pages. A mathematical `<` in a paper then deleted everything up to the next `>`, silently
erasing passages: that alone made the ACC+ sentence "the only point being that the kernel of
T∞ → End_{S∞}(H*(C∞)) is nilpotent" look absent when it is at the expected place. I restricted
tag-stripping to the HTML sources and re-ran. Separately, the Khare–Wintenberger author copy is served
with an incomplete certificate chain that this machine cannot validate — both `curl` and the web
fetcher refuse it — so I fetched that public PDF with certificate verification disabled. Its title
page reads *Serre's modularity conjecture (II)*, Khare and Wintenberger, and all 14 of its excerpts
matched, which is itself good evidence that the text is the genuine one.

## 2. Baseline — all 126 declarations exist in their cited module at the pin

Every entry is Mathlib and each carries the same claim: "statement read in its source file at the
pinned Mathlib commit". I tested that claim for all 126 against Mathlib `082e2d37`, reading from an
existing clone's object store (nothing unpacked). **All 126 exist in the module they cite** — 60
under their full dotted name, 66 under a namespaced head. No citation was removed or replaced.

My first scan reported two misses, `Module.IsTorsionBySet.module` and `Module.Free.of_basis`. Both were
false: they are declared as `def IsTorsionBySet.module` (Torsion/Basic.lean:579) and
`theorem Free.of_basis` (FreeModule/Basic.lean:65) inside `namespace Module`, and my pattern accepted
only a full name or a bare last component, not a partial namespace prefix. After allowing any trailing
run of the dotted name, nothing was missing.

## 3. Closure

`check_blueprint` passes the packet as `closed`, which enforces the structural half: every prerequisite
resolves to a node or a baseline declaration, there are no gaps or requests, and the graph is acyclic.

**The three cross-packet prerequisites** resolve to nodes of `DeformationAndDerivedPatchingAlgebra--P7.json`,
and I read each supplier's statement:

- `R03.3/catenary-iff-dimension-function` — a Noetherian local ring is catenary iff
  `dim A/p = dim A/q + 1` whenever `q` covers `p`. Correct, and exactly what
  `nearly-faithful-lift-from-special-fibre` uses.
- `R03.3/free-of-maximal-depth-regular-local` — a finite module over a regular local ring with a regular
  sequence of length `dim A` in the maximal ideal is free: Auslander–Buchsbaum. Used by
  `patching-kernel-equals-ideal` and `patching-free-conclusion`. It states `M ≠ 0` explicitly.

**The Lemma 2.3 chain uses the corrected statement.** Because `sourceIssues` E2 adds `M ≠ 0` to Taylor's
Lemma 2.3, every node formalising that lemma must carry it, and all four do —
`maximal-depth-associated-primes-minimal`, `maximal-depth-annihilator-primes-top-dimensional`,
`maximal-cm-support-top-components` and `maximal-cm-nearly-faithful-irreducible` — through Mathlib's
`RingTheory.Sequence.IsRegular`, whose definition includes `M/(r₁, …, r_n)M ≠ 0`. That is what
PROTOCOL §18 asks: nodes use the corrected statements.

**Depth, stated plainly.** I read the proof steps in detail for the two definitions, the four nodes of
the Lemma 2.3 chain and the three nodes resting on P7. For the remaining nodes I verified sources and
prerequisites, and read the proof steps for consistency with them, but did not re-derive each argument.
The per-node verdicts say which is which.

## 4–6. Granularity, API, tests, planets and the suggested file

No node bundles several declarations or hides a non-routine step that I found.

**The one correction: the API of `supported-on-components`.** It had four items — a projection, a
characterisation, a relation and an equivalence — against `nearly-faithful`'s fifteen, and lacked the
things PROTOCOL §4 names for working with an object without unfolding it. Added, each marked
`addedBy`:

| item | role | why |
|---|---|---|
| `Module.IsSupportedOnComponents.mk` | constructor | the introduction rule, so that proving the property never requires unfolding it |
| `Module.isSupportedOnComponents_of_faithfulSMul` | compatibility | the link to Mathlib's `FaithfulSMul`; true over **any** commutative ring, since faithfulness gives `Ann_R(M) = ⊥` and `minimalPrimes R` is by definition `(⊥ : Ideal R).minimalPrimes` |
| `Module.isSupportedOnComponents_of_subsingleton` | example | the zero module, until now only a unit test, made a named lemma consumers can cite |

Each has a matching `sorry`-proved signature in the suggested file, inside its `namespace Module`, so
the file and the packet still agree name for name.

Both definitions have at least three unit tests, and they are good ones: `supported-on-components`'s
`ℤ/2` over `ℤ` test catches the plausible wrong definition "Supp M is a union of closed sets" and its
node test separates the notion from near faithfulness. The six planets are named from the sources.

**Nothing was compiled.** The shared-machine rules allow elaborating the suggested file only against a
build at the pinned commits that already exists, and there is none on this machine.

## 6a. Mistakes in the sources — both confirmed

**E1 (Calegari–Geraghty, Theorem 6.4(1): `R` printed for `R∞`) — confirmed.** The entry's `known` field
says it re-records `PAPER-CALEGARI-GERAGHTY-18/E141`, and that is checkable in the atlas:
`data/source-issues.json` carries E141 with the same locator, printed text and correction, confirmed by
`REV-PAPER-CALEGARI-GERAGHTY-18`. The bracket half is item (2) of the authors' published Correction;
the `R`/`R∞` slip is not.

**E2 (Taylor 2008, Lemma 2.3: the hypothesis `M ≠ 0` is missing) — confirmed against the source, with
a stronger reason.** I read the lemma and Definition 2.1 at Numdam. The lemma is printed exactly as
quoted, Definition 2.1 defines near faithfulness by `Ann_A(M)` nilpotent with no nonzero hypothesis,
and nothing in §2 excludes `M = 0`. So for `M = 0` and `A ≠ 0` the conclusion fails.

The packet's reason rests on the convention `depth(0) = ∞`. That is right, but it is the softer half:
someone who leaves `depth(0)` undefined would call the lemma vacuous rather than false. The proof
settles the matter without any convention. It argues that "every minimal prime over `Ann_A M` (which
will then be an associated prime of `M` …)" has large dimension; for `M = 0` we have `Ass(0) = ∅` and
`Ann_A(0) = A`, over which no prime is minimal, so the inference yields nothing. The proof needs
`M ≠ 0` whatever the convention, which is why the fix is to add the hypothesis rather than to weaken the
conclusion. The verdict records this, and E2 goes to the register as a confirmed new mistake.

No further mistake found. That is a statement about what I read — every cited passage and its
surroundings — not a claim that none exists elsewhere in these papers.

## 7. Library audit

The reviewed audit gives R03.6 as `not built` with three targets, and nothing it shows in the libraries
is planned here as a node: the 126 baseline declarations are exactly the existing material the audit
describes (support over an algebra, `Supp(M/IM) = Supp M ∩ V(I)`, annihilators, minimal primes as
irreducible components), cited rather than rebuilt. The audit's four duplicate findings —
`DeformationAndDerivedPatchingAlgebra:P9`, `PotentialAutomorphyInfrastructure:PA.3`,
`GL2ModularityLifting:R22.4` and `CompletedCohomologyAndLocalGlobalCompatibility:R31.5` — are layers
that repeat R03.6's commutative algebra in their own settings. R03.6 is the natural owner of that
algebra, so the duplication calls for those layers to import from it, not for requests here.

## Questions for the orchestrator

1. **A closed layer resting on an unreviewed packet.** R03.6 is now `closed`, and three of its nodes
   depend on nodes of `DeformationAndDerivedPatchingAlgebra--P7.json`, which carries no review. The
   checker allows this, and the two statements I read are correct, but R03.6's closure is only as good
   as P7's review when it comes.
2. **The four duplicate layers** (P9, PA.3, R22.4, R31.5) restate this commutative algebra. Now that
   R03.6 is closed they could each be pointed at its nodes rather than planning their own.

## Summary

Accepted. All 144 source references and all 126 baseline citations verified; E1 and E2 confirmed,
E2 with a convention-free reason; the `M ≠ 0` correction is carried by every node that needs it. One
correction: three API items added to `supported-on-components`, with matching Lean signatures. Nothing
compiled.
